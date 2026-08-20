Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C39C5DF82
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 06:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uEv9OS04j1nqiBf7mBxSCdt1kL+2ayzlFaqDONUX7eE=; b=DjKfO+TW3D/MBM
	30Do7L7nBb3UCwLedlDEkjDRVvH0uhamm4umwrXJ2YKtR55wFl1oNT6W8ORRoXhZ3tUFgepjrkp2M
	rNn5JfrkDuucTR51FBeaz1wDPmrH/bj2DKtZWqp+imF9kOuUoBvUrc8FZh377APFR9dx79BsxPebD
	eBfRurjuwhFdNc7XO1SpIc6ZDnyGVlui57MY4Ucd9m8t+IrL/enIGB3Q8Yf+/QxgaH6+36pd1FFuP
	uLueo7RNBOR1sh3Kr7SYbJu2jBpWobmOO8z+IH7XFqPd5huBKqURTGuuFRJQsz6XBzb83USBquMJR
	ecZL3RFL3+Nv4sffEM3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwKW-0000000Ax3n-0cKd;
	Thu, 20 Aug 2026 06:32:48 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwKS-0000000Ax2k-2pzR
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 06:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787207559; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=fRDiUOb4sl6PTw3ZuPzglrAV+gTsQrGltoxvCxRLMco=;
	b=BKsIxAVVRk7yyJKVI2fNycl14EGUTlVtgQjeCEJxiRlbS3EvdkChKXsfr26mWbhyk5FS/KIsPsXwBUk3nbgUvD9hUIZA9kaeeoh2NaQw19topLfQ3CyV+YbKSJgtB79q/gAbfuYbpYadi6V/BWQ3zOjYULhv8e+rjvJPa7MZ+PE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X9IUrkU_1787207553;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X9IUrkU_1787207553 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 20 Aug 2026 14:32:37 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: pjw@kernel.org,
	oleg@redhat.com,
	debug@rivosinc.com
Cc: alex@ghiti.fr,
	guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: ptrace: reject CFI regset access when extensions are absent
Date: Thu, 20 Aug 2026 14:32:33 +0800
Message-ID: <20260820063233.2567-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_233245_424744_CFADF932 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

riscv_cfi_get() and riscv_cfi_set() do not check whether the Zicfilp
or Zicfiss extensions are present. On systems without them,
PTRACE_GETREGSET on REGSET_CFI still succeeds and returns a zeroed
user_cfi_state, misleading debuggers into believing the register set
is available, and PTRACE_SETREGSET silently accepts writes that have
no effect (e.g. clearing SR_ELP).

Reject the access with -EINVAL when neither branch landing pads nor
shadow stack is available to userspace, using the same availability
helpers as the prctl path.

Fixes: 2af7c9cf021c ("riscv/ptrace: expose riscv CFI status and state via ptrace and in core files")
Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
This follows the behaviour of the arm64 GCS regset. Unlike vector
registers, no ENODATA case applies here: the CFI status regset has a
valid all-zero representation even when CFI has not been enabled for
the traced task.

is_user_lpad_enabled()/is_user_shstk_enabled() are used instead of a
plain ISA check so that the regset visibility matches what userspace
can actually use via prctl: both helpers also honor the
riscv_nousercfi kernel command line switch.

 arch/riscv/kernel/ptrace.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index f336a183667e..566856e42f65 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -299,6 +299,9 @@ static int riscv_cfi_get(struct task_struct *target,
 	struct user_cfi_state user_cfi;
 	struct pt_regs *regs;
 
+	if (!is_user_lpad_enabled() && !is_user_shstk_enabled())
+		return -EINVAL;
+
 	memset(&user_cfi, 0, sizeof(user_cfi));
 	regs = task_pt_regs(target);
 
@@ -337,6 +340,9 @@ static int riscv_cfi_set(struct task_struct *target,
 	struct user_cfi_state user_cfi;
 	struct pt_regs *regs;
 
+	if (!is_user_lpad_enabled() && !is_user_shstk_enabled())
+		return -EINVAL;
+
 	regs = task_pt_regs(target);
 
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &user_cfi, 0, -1);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
