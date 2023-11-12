Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9F7C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Au96yCYKpGaWlMrhnCCzxGEapqI1F0Z3GN3jkzClP+0=; b=m4LX3m8Qso+STC
	G51MiwpFEeF+6TEDLliib4euXisr2QGbHJrM3c3aj1OplrC6tgtOuE/Bn7Vo4ZnwKx1mP9IYqZdmI
	DhS+2wGv+j1Lm96FDQC69CQpVqw9VQBGMxHTAVGbiGuiJVnWSixUpsHz3a7lkTbpj0ZpqNATuReWe
	OiAsTPc1CH0/AvRp7viI4LS6q5DQ2jcYjs0i3AinXiECfOuAQtNdrjmL7Wb4FsO7BhS1W7Lz1s0uk
	YyEwNfNE+qyY0Av+x2o6BS5Jl30PmeDA2Ri6K88R0GZwcciUGyuo6XsoJ3TuY7mCj1zK1rg9Lq466
	SRjv0219VWawIR9MQYtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23lX-00BjPi-0z;
	Sun, 12 Nov 2023 06:16:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23lU-00BjOZ-26
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:16:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 55B9EB80926;
	Sun, 12 Nov 2023 06:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F82C43391;
	Sun, 12 Nov 2023 06:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769770;
	bh=DKk902dUzJRu+EpHJ3Wk2xXFN2nL8OoR25SRcqCxR2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c59OtDgxKoaL5H+8t/esEfV4kKvicRpVLj8v1lnhz3siL7SoX+2IByEa0bFClwdAn
	 gWRKRChuD0ELQzyxEhYYTrZ2c111YRbKdTtjo5SAXQ7zbrerldn80owtj+w72YJl8o
	 XyBcE5AGmM3J9GulU7mgINeZo+r9aq4447aDD8rL7aO3bGorg4INoFvR5ly2W5eWa/
	 PGT6kAuUzfr9kOZVP9bqms7r2XiNrBnF3kWDsm3W6ESHZ9jx35kFCdp06buDcYrX2T
	 idUnQF9oVyN4PTA5ImVxyC9kkYF+rJYoA+Xbsf33gcQdiYEuMw0BkhIdKmJkuKVy2l
	 qZ113gkQTjpoA==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 07/38] riscv: u64ilp32: Add ptrace interface support
Date: Sun, 12 Nov 2023 01:14:43 -0500
Message-Id: <20231112061514.2306187-8-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221612_825523_A3907353 
X-CRM114-Status: UNSURE (   8.33  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The pt_regs of u64ilp32 is the same as the 64-bit kernel's. So, change
to use native_view instead.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/ptrace.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 1d572cf3140f..5471b12127da 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -369,7 +369,8 @@ long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 const struct user_regset_view *task_user_regset_view(struct task_struct *task)
 {
 #ifdef CONFIG_COMPAT
-	if (test_tsk_thread_flag(task, TIF_32BIT))
+	if (test_tsk_thread_flag(task, TIF_32BIT) &&
+	   !test_tsk_thread_flag(task, TIF_64ILP32))
 		return &compat_riscv_user_native_view;
 	else
 #endif
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
