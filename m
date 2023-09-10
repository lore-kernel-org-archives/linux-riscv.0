Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931D0EE7FF4
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 08:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6/MJPXTVP/qkF4LqHw/SG3VvevvLrai/2A0uME+c6/E=; b=CrGaPAWk9VvCQN
	Dydu5jx5f9g09MZNy9Qhwx8kESIQiq6qHTUSIv/6Qz/q5oRHOAqVzctMGhkYBS96+pt87UlHNtrIJ
	hm9QFd+3qaowPJ8WfgIeTJ+vKNKE40CEXv6w49jiGQlKXbge6NVvd1U+lOlmVj+QX9TdjbsBizpz9
	TKTbX5H2/iT+oddgjJ0x3xaKBPJSSyX89wcbELcAHdMdG1Vlmn1aodBsJFsr1VvBc9QFd+zmM12nP
	cufKns4TgBqoWvw5f9VOfHkYAhuETdpYiU5GlGqeXGHZIYPIq1JpwuOJFfeL9dl0MFPtIuzKfx1l3
	sMDOYS2KUACjPpJ6gZ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFqu-00GI9d-0n;
	Sun, 10 Sep 2023 08:31:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFqr-00GI7a-2t
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 08:31:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 310C6CE0AE6;
	Sun, 10 Sep 2023 08:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06695C433C7;
	Sun, 10 Sep 2023 08:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694334686;
	bh=XRClpokZATGms/5hSmQVWqg3PgTsbj60ag4pgT82d1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DAOn5xYy1snXrOmFmNehUeHzj1Z0ze8me0Irn4+sU5MWVFFo5IVtlgSxXBj+N5x66
	 SThfOeVincosujHlIPmZwaPH7xmI30VIyYyLOLJE3Bl/vsoZAaPr1jyY3JN/Ne08Fh
	 a2k8iW8/2r/OtbySdghJbCUCJTkyPRaE1dVLz9HACSYHii/unurbLmqg9m5QaHjxLA
	 EqJD/2+Sl/GAUpU9Ueyi2qO6xrtIM5p2E/EELjjJFh4Hd8QRVtQXv9J2o0kNjFnfAk
	 G0voEZGJh1qlLocmGgE7uF+4hz00VcMN4Cpu/u15U7gqDQYozJOJU9lJUB45CjGWhU
	 4c3Ju+DiYrSGw==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	anup@brainfault.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	palmer@rivosinc.com,
	longman@redhat.com,
	boqun.feng@gmail.com,
	tglx@linutronix.de,
	paulmck@kernel.org,
	rostedt@goodmis.org,
	rdunlap@infradead.org,
	catalin.marinas@arm.com,
	conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	keescook@chromium.org,
	greentime.hu@sifive.com,
	ajones@ventanamicro.com,
	jszhang@kernel.org,
	wefu@redhat.com,
	wuwei2016@iscas.ac.cn,
	leobras@redhat.com
Cc: linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V11 13/17] RISC-V: paravirt: pvqspinlock: Add SBI implementation
Date: Sun, 10 Sep 2023 04:29:07 -0400
Message-Id: <20230910082911.3378782-14-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230910082911.3378782-1-guoren@kernel.org>
References: <20230910082911.3378782-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_013130_330482_4498A90E 
X-CRM114-Status: GOOD (  11.49  )
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

Implement pv_kick with SBI implementation, and add SBI_EXT_PVLOCK
extension detection.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/sbi.h           | 6 ++++++
 arch/riscv/kernel/qspinlock_paravirt.c | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index e0233b3d7a5f..3533f8d4f3e2 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -30,6 +30,7 @@ enum sbi_ext_id {
 	SBI_EXT_HSM = 0x48534D,
 	SBI_EXT_SRST = 0x53525354,
 	SBI_EXT_PMU = 0x504D55,
+	SBI_EXT_PVLOCK = 0xAB0401,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -243,6 +244,11 @@ enum sbi_pmu_ctr_type {
 /* Flags defined for counter stop function */
 #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
 
+/* SBI PVLOCK (kick cpu out of wfi) */
+enum sbi_ext_pvlock_fid {
+	SBI_EXT_PVLOCK_KICK_CPU = 0,
+};
+
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
diff --git a/arch/riscv/kernel/qspinlock_paravirt.c b/arch/riscv/kernel/qspinlock_paravirt.c
index a0ad4657f437..571626f350be 100644
--- a/arch/riscv/kernel/qspinlock_paravirt.c
+++ b/arch/riscv/kernel/qspinlock_paravirt.c
@@ -11,6 +11,8 @@
 
 void pv_kick(int cpu)
 {
+	sbi_ecall(SBI_EXT_PVLOCK, SBI_EXT_PVLOCK_KICK_CPU,
+		  cpuid_to_hartid_map(cpu), 0, 0, 0, 0, 0);
 	return;
 }
 
@@ -25,7 +27,7 @@ void pv_wait(u8 *ptr, u8 val)
 	if (READ_ONCE(*ptr) != val)
 		goto out;
 
-	/* wait_for_interrupt(); */
+	wait_for_interrupt();
 out:
 	local_irq_restore(flags);
 }
@@ -62,6 +64,9 @@ void __init pv_qspinlock_init(void)
 	if(sbi_get_firmware_id() != SBI_EXT_BASE_IMPL_ID_KVM)
 		return;
 
+	if (!sbi_probe_extension(SBI_EXT_PVLOCK))
+		return;
+
 	pr_info("PV qspinlocks enabled\n");
 	__pv_init_lock_hash();
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
