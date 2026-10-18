Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF27CCCF2C7
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Oct 2026 02:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5oBFR88nKBnpfYQsxYD2fpE5lVRJU/KFWpD5pDslj9c=; b=TBJUj184mkQK0J
	7LT0Uy9Lg1NZP9yYcpmoqunvlRkUr3Wyq8/A4E+kl7DMajImnu2W0d4iSIQF7ZdLy0oFlwA5H1Non
	GlsG2VAXspVO3aOX2ufOju9Kt0GEbZo0JCwlZHk7945q9q++htuQoaVOAj7oAYvP6Zm6tXALhJP2c
	WnzLMB0JAGS/sGW1uhOxo6vgoPZ79w2uyLmp3uLa/gK2r4x9xvrS5f3f+wcSdfM1Wgs+qc0bYMqnY
	aGyk8nOsSO/LJv752CknkANdZxUuGnwzP5gtvZJOMciXTU6Y7ki/vjGqFhqGrMYTiE2lKLvi4iAoH
	i3lvtHCNkRAhikqUTDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIGqq-00000005Slz-3VXS;
	Sun, 18 Oct 2026 02:42:20 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIGqo-00000005Slb-2Qqz
	for linux-riscv@lists.infradead.org;
	Sun, 18 Oct 2026 02:42:19 +0000
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xIGql-004P3N-AL;
	Sat, 17 Oct 2026 22:42:15 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Haorong Lu <ancientmodern4@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] riscv: signal: check the full syscall return value for a restart
Date: Sat, 17 Oct 2026 22:42:15 -0400
Message-ID: <20261018024215.798849-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_194218_623391_07DACBC3 
X-CRM114-Status: GOOD (  17.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

A system call that returns a 64-bit value whose low 32 bits happen to
equal one of the -ERESTART* codes is restarted or turned into -EINTR
when a signal is pending on the way back to user space. lseek() returns
the new file offset, so lseek(fd, 0x1fffffe00, SEEK_CUR) followed by a
signal with an SA_RESTART handler runs the lseek() a second time and
leaves the offset at 0x3fffffc00; without SA_RESTART the call fails with
EINTR after it has moved the offset. With a SIGALRM interval timer of
20 us, 2337 out of 2000000 such lseek() calls moved the offset twice and
2695 out of 2000000 returned EINTR. brk() can return an arbitrary
address the same way, and a value ending in 0xfffffdfc goes through
restart_syscall() with whatever restart_block.fn the task last set.

arch_do_signal_or_restart() reads regs->a0 into an int, which drops the
upper half of the return value before it is compared with -ERESTARTSYS
and friends. The code before the restart handling was moved out of
handle_signal() switched on the unsigned long a0 and was not affected.

Keep the return value in a long. Compat tasks see only the low 32 bits
of a0, and a 32-bit tracer writes it zero-extended, so sign-extend it
from 32 bits for them as before.

Tested with the program in the notes on QEMU virt (riscv64 defconfig):
the offset is moved exactly once and no EINTR is returned with the patch.

Fixes: ce4f78f1b53d ("riscv: signal: handle syscall restart before get_signal")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    Reproducer (static riscv64 binary run as /init's child on QEMU virt, -smp 2;
    riscv64-linux-gnu-gcc -O2 -static -o lseek_restart lseek_restart.c):
    
    #define _GNU_SOURCE
    #include <errno.h>
    #include <fcntl.h>
    #include <signal.h>
    #include <stdio.h>
    #include <string.h>
    #include <sys/time.h>
    #include <unistd.h>
    
    #define OFF 0x1fffffe00LL	/* low 32 bits read as -ERESTARTSYS */
    
    static volatile long nsig;
    
    static void handler(int sig)
    {
    	nsig++;
    }
    
    static void run(int fd, int flags, const char *name)
    {
    	struct sigaction sa;
    	struct itimerval it = { { 0, 20 }, { 0, 20 } };
    	long i, moved = 0, eintr = 0;
    
    	memset(&sa, 0, sizeof(sa));
    	sa.sa_handler = handler;
    	sa.sa_flags = flags;
    	nsig = 0;
    	sigaction(SIGALRM, &sa, NULL);
    	setitimer(ITIMER_REAL, &it, NULL);
    
    	for (i = 0; i < 2000000; i++) {
    		off_t r;
    
    		lseek(fd, 0, SEEK_SET);
    		r = lseek(fd, OFF, SEEK_CUR);
    		if (r == OFF)
    			continue;
    		if (r == -1 && errno == EINTR)
    			eintr++;
    		else if (r == 2 * OFF)
    			moved++;
    		else
    			printf("%s: unexpected %#llx\n", name, (long long)r);
    	}
    	memset(&it, 0, sizeof(it));
    	setitimer(ITIMER_REAL, &it, NULL);
    	printf("%s: %ld signals, %ld calls moved the offset twice, %ld returned EINTR\n",
    	       name, nsig, moved, eintr);
    }
    
    int main(void)
    {
    	int fd = open("/lseek-test", O_RDWR | O_CREAT, 0600);
    
    	if (fd < 0) {
    		perror("open");
    		return 2;
    	}
    	run(fd, SA_RESTART, "SA_RESTART");
    	run(fd, 0, "no SA_RESTART");
    	return 0;
    }
    
    Before:
    SA_RESTART: 283700 signals, 2337 calls moved the offset twice, 0 returned EINTR
    no SA_RESTART: 246693 signals, 0 calls moved the offset twice, 2695 returned EINTR
    After:
    SA_RESTART: 306854 signals, 0 calls moved the offset twice, 0 returned EINTR
    no SA_RESTART: 278090 signals, 0 calls moved the offset twice, 0 returned EINTR

 arch/riscv/kernel/signal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 59784dc117e4..b1e92b969d96 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -499,7 +499,7 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
 void arch_do_signal_or_restart(struct pt_regs *regs)
 {
 	unsigned long continue_addr = 0, restart_addr = 0;
-	int retval = 0;
+	long retval = 0;
 	struct ksignal ksig;
 	bool syscall = (regs->cause == EXC_SYSCALL);
 
@@ -508,6 +508,8 @@ void arch_do_signal_or_restart(struct pt_regs *regs)
 		continue_addr = regs->epc;
 		restart_addr = continue_addr - 4;
 		retval = regs->a0;
+		if (is_compat_task())
+			retval = (int)retval;
 
 		/* Avoid additional syscall restarting via ret_from_exception */
 		regs->cause = -1UL;

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
