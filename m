Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C130C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 02:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nv7d6qFud7JzH9KzFYdK2BwEuTOFbneWawDe9PFz+yM=; b=JhaXYa4JOLmtnM
	lY9caRsEyq+7ebzmho610THlWRVWAU9mP2z1+JlfQwXuC7H/wXLBXWQWbO5wfLbhTVkiKTeLAN9wY
	tu3hxgr7WCCYlerIxqb66ZFXaHIMaYoS14LAK+WfqR9jatrreWbt/Z2OwMrdKA/yUQPU5ofW3wdAW
	Wt/WXdErVO9MXlYfbZ/cMFDfCZKQARljv9O7bVrp3qdPx62clYuVjIYfrdA8bSUxEAQ0UeHkwsUqy
	hXLyAkcO233p+V7elpBl2S8GC9hYo3RkuaA1PKvN2MtUgTMdNL8/kl+vR7PfxZGt7uf33gVbwcBw2
	s1Be0XdlRZSdsw1KHF3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJkdB-0000000H9oH-0UWy;
	Wed, 19 Jun 2024 02:01:01 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJkd5-0000000H9nF-3pD8
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 02:00:59 +0000
Received: from ThinkPad-T480s.. (unknown [121.237.44.152])
	by APP-05 (Coremail) with SMTP id zQCowACnr+fFO3Jmjn6bEQ--.46102S2;
	Wed, 19 Jun 2024 10:00:38 +0800 (CST)
From: zhouquan@iscas.ac.cn
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: oleg@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	andy.chiu@sifive.com,
	shuah@kernel.org,
	charlie@rivosinc.com,
	zhouquan@iscas.ac.cn
Subject: [RFC PATCH 0/2] riscv: Expose orig_a0 to userspace for ptrace to set the actual a0
Date: Wed, 19 Jun 2024 10:00:37 +0800
Message-Id: <cover.1718693532.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowACnr+fFO3Jmjn6bEQ--.46102S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF43Ar1fXryUtFW7Zw4rGrg_yoW8Cw4rpa
	95KwnYk3W8JFy2ya1xXw4UXr4rAa4fWrW3G3WxZry3ZrW8tryvqr4xKa1Yqr93CayxWryf
	ZF1Ikr15C3WUZa7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwAKzVCY07xG64k0F24lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjRpBDUUUUU==
X-Originating-IP: [121.237.44.152]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiCRANBmZyBxOZHgAAsV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_190056_472308_8EFEF6C1 
X-CRM114-Status: UNSURE (   8.91  )
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

Due to the path that modifies a0 in syscall_enter_from_user_mode before the
actual execution of syscall_handler [1], the kernel currently saves a0 to
orig_a0 at the entry point of do_trap_ecall_u as an original copy of a0.
Once the syscall is interrupted and later resumed, the restarted syscall
will use orig_a0 to continue execution.

The above rules generally apply except for ptrace(PTRACE_SETREGSET,),
where the kernel will ignore the tracer's setting of tracee/a0 and
will restart with the tracee's original a0 value. For the current
kernel implementation of ptrace, projects like CRIU/Proot will
encounter issues where the a0 setting becomes ineffective when
performing ptrace(PTRACE_{SET/GET}REGSET,).

Here is a suggested solution, expose orig_a0 to userspace so that ptrace
can choose whether to set orig_a0 based on the actual scenario. In fact,
x86/orig_eax and loongArch/orig_a0 have adopted similar solutions.

[1] link: https://lore.kernel.org/lkml/20230403-crisping-animosity-04ed8a45c625@spud/T/

Quan Zhou (2):
  riscv: Expose orig_a0 in the user_regs_struct structure
  riscv: selftests: Add a ptrace test to check a0 of restarted syscall

 arch/riscv/include/asm/ptrace.h               |   4 +-
 arch/riscv/include/uapi/asm/ptrace.h          |   2 +
 tools/testing/selftests/riscv/Makefile        |   2 +-
 tools/testing/selftests/riscv/abi/.gitignore  |   1 +
 tools/testing/selftests/riscv/abi/Makefile    |  12 ++
 .../riscv/abi/ptrace_restart_syscall.c        | 148 ++++++++++++++++++
 6 files changed, 166 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/abi/.gitignore
 create mode 100644 tools/testing/selftests/riscv/abi/Makefile
 create mode 100644 tools/testing/selftests/riscv/abi/ptrace_restart_syscall.c


base-commit: 6ba59ff4227927d3a8530fc2973b80e94b54d58f
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
