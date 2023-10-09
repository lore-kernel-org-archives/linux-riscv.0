Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A24E95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQEq2CtpmM//4o0lrSAXbeU3FAhF0FfRqAt1v236cLc=; b=xlCUTQ8OaqjxdO
	AteX4lHtfivteVcemth7XWlZ1P/3uZqoXsh9qRIM3FL8FHjvbAtR2D8wsDEppKLkvWYaiee9UePTI
	xc1Qfco6RCDa7w3den9pvo6kPwWgm1Jmq9ziND99ND+FtlfKSNpHs4xqjaqs5uF4aDg1F0qBFLg6J
	/CerXY73MPR83sOo18zeV/qsFKLeUQS/a7kOfIh2IJ3xoO36kHu/3XgHrVABM/FHga0/Gd0esRSXM
	lNi8/erAG9kJe69vGfVLLixFnypU7tYAsrSri4QPo1OWtmttFYlZ4xinkJVxZuuHYHEiYckVzYayb
	15KQ/V6dLOqu9/zHPsKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp7e-00AamX-33;
	Mon, 09 Oct 2023 12:12:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp7U-00Aab6-1o;
	Mon, 09 Oct 2023 12:12:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 10638B81158;
	Mon,  9 Oct 2023 12:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB78AC43397;
	Mon,  9 Oct 2023 12:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696853537;
	bh=DQdjfUveIhNPPqVwZdWHihE2VRq12xchEABLOZK1HfI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oLL83hbOmtscSO0PxQD/EOaGE8Qiz0tIqnzyl8bOMqgdll6vJb4H0So35c8Uqf5Zk
	 vbhc4U3bNiYCFO/SgDmgoq8LM04Z4CqvaO4nef/FJsDYoEAK0CQ0glCjepZfOyAyzA
	 /05mCxwa25QrZU9/38apir4UreXWuyiWYGvq2uSCKszXVR3ssIxUa007qSxBiHgqD5
	 VHPGYDdtxQgaIWydtQE/Xt9jx20CiKjWtvewAicjumFUedToaIJ4esyUrAGtBRLSfn
	 eXYIJfaDRomsREUt1rkPGVONqoEyIC08t+Boq48Y18UYuJ5KRKzp3HnXLABo8J+sih
	 hXrxCwOF3ErqA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Oct 2023 13:08:48 +0100
Subject: [PATCH v6 14/38] KVM: arm64: Manage GCS registers for guests
MIME-Version: 1.0
Message-Id: <20231009-arm64-gcs-v6-14-78e55deaa4dd@kernel.org>
References: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
In-Reply-To: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=5343; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DQdjfUveIhNPPqVwZdWHihE2VRq12xchEABLOZK1HfI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlI+2cOqMxsIngsQ7FiuAEwC3vODto57yqr+sncOIg
 3t7fey2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZSPtnAAKCRAk1otyXVSH0GtQB/
 9fhqJQfXnPsmSl2P/gBGshXyv7rosoPImj6rUaan7wksa2dTf7gj3QOMeHTLXvDbMr1yi1Gi5Z+H3t
 //gR/KfyE59kAN0X/vKYxVGfrMbjsNlkaUIUjEffjJKIB/ZoSwP6lbeXYAyobxpYpx+ULJLO6nVVYp
 mrJCOqwHPRM2sqNmcz/xcsyv+Y1XssOmEAhCTLa1mOkYPEv5Foxot/R6kGBtAJ1SaIWg/pUWEHI97j
 JZ5rvo7MWdE8Oo2E+PgD3UvccRZnAa8vthv3p5pNg5f4u4XDt3a4ycdfxektfciAh9kSWzCSpwOxfA
 YDdSstN1QUiMhAGJ7SrcsiFSRIDKFH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_051220_926723_6A5F9501 
X-CRM114-Status: GOOD (  14.19  )
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

GCS introduces a number of system registers for EL1 and EL0, on systems
with GCS we need to context switch them and expose them to VMMs to allow
guests to use GCS.  Traps are already disabled.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h          | 12 ++++++++++++
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 17 +++++++++++++++++
 arch/arm64/kvm/sys_regs.c                  | 22 ++++++++++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index af06ccb7ee34..7171d4c7e5ed 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -365,6 +365,12 @@ enum vcpu_sysreg {
 	PIR_EL1,       /* Permission Indirection Register 1 (EL1) */
 	PIRE0_EL1,     /*  Permission Indirection Register 0 (EL1) */
 
+	/* Guarded Control Stack registers */
+	GCSCRE0_EL1,	/* Guarded Control Stack Control (EL0) */
+	GCSCR_EL1,	/* Guarded Control Stack Control (EL1) */
+	GCSPR_EL0,	/* Guarded Control Stack Pointer (EL0) */
+	GCSPR_EL1,	/* Guarded Control Stack Pointer (EL1) */
+
 	/* 32bit specific registers. */
 	DACR32_EL2,	/* Domain Access Control Register */
 	IFSR32_EL2,	/* Instruction Fault Status Register */
@@ -1142,6 +1148,12 @@ bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
 #define kvm_vm_has_ran_once(kvm)					\
 	(test_bit(KVM_ARCH_FLAG_HAS_RAN_ONCE, &(kvm)->arch.flags))
 
+static inline bool has_gcs(void)
+{
+	return IS_ENABLED(CONFIG_ARM64_GCS) &&
+		cpus_have_final_cap(ARM64_HAS_GCS);
+}
+
 int kvm_trng_call(struct kvm_vcpu *vcpu);
 #ifdef CONFIG_KVM
 extern phys_addr_t hyp_mem_base;
diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index bb6b571ec627..ec34d4a90717 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -25,6 +25,8 @@ static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
 {
 	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
 	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
+	if (has_gcs())
+		ctxt_sys_reg(ctxt, GCSPR_EL0) = read_sysreg_s(SYS_GCSPR_EL0);
 }
 
 static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
@@ -62,6 +64,12 @@ static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
 	ctxt_sys_reg(ctxt, PAR_EL1)	= read_sysreg_par();
 	ctxt_sys_reg(ctxt, TPIDR_EL1)	= read_sysreg(tpidr_el1);
 
+	if (has_gcs()) {
+		ctxt_sys_reg(ctxt, GCSPR_EL1)	= read_sysreg_el1(SYS_GCSPR);
+		ctxt_sys_reg(ctxt, GCSCR_EL1)	= read_sysreg_el1(SYS_GCSCR);
+		ctxt_sys_reg(ctxt, GCSCRE0_EL1)	= read_sysreg_s(SYS_GCSCRE0_EL1);
+	}
+
 	if (ctxt_has_mte(ctxt)) {
 		ctxt_sys_reg(ctxt, TFSR_EL1) = read_sysreg_el1(SYS_TFSR);
 		ctxt_sys_reg(ctxt, TFSRE0_EL1) = read_sysreg_s(SYS_TFSRE0_EL1);
@@ -95,6 +103,8 @@ static inline void __sysreg_restore_user_state(struct kvm_cpu_context *ctxt)
 {
 	write_sysreg(ctxt_sys_reg(ctxt, TPIDR_EL0),	tpidr_el0);
 	write_sysreg(ctxt_sys_reg(ctxt, TPIDRRO_EL0),	tpidrro_el0);
+	if (has_gcs())
+		write_sysreg_s(ctxt_sys_reg(ctxt, GCSPR_EL0), SYS_GCSPR_EL0);
 }
 
 static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt)
@@ -138,6 +148,13 @@ static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt)
 	write_sysreg(ctxt_sys_reg(ctxt, PAR_EL1),	par_el1);
 	write_sysreg(ctxt_sys_reg(ctxt, TPIDR_EL1),	tpidr_el1);
 
+	if (has_gcs()) {
+		write_sysreg_el1(ctxt_sys_reg(ctxt, GCSPR_EL1),	SYS_GCSPR);
+		write_sysreg_el1(ctxt_sys_reg(ctxt, GCSCR_EL1),	SYS_GCSCR);
+		write_sysreg_s(ctxt_sys_reg(ctxt, GCSCRE0_EL1),
+			       SYS_GCSCRE0_EL1);
+	}
+
 	if (ctxt_has_mte(ctxt)) {
 		write_sysreg_el1(ctxt_sys_reg(ctxt, TFSR_EL1), SYS_TFSR);
 		write_sysreg_s(ctxt_sys_reg(ctxt, TFSRE0_EL1), SYS_TFSRE0_EL1);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index e92ec810d449..dd8966d52f3c 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1768,6 +1768,23 @@ static unsigned int mte_visibility(const struct kvm_vcpu *vcpu,
 	.visibility = mte_visibility,		\
 }
 
+static unsigned int gcs_visibility(const struct kvm_vcpu *vcpu,
+				   const struct sys_reg_desc *rd)
+{
+	if (has_gcs())
+		return 0;
+
+	return REG_HIDDEN;
+}
+
+#define GCS_REG(name) {				\
+	SYS_DESC(SYS_##name),			\
+	.access = undef_access,			\
+	.reset = reset_unknown,			\
+	.reg = name,				\
+	.visibility = gcs_visibility,		\
+}
+
 static unsigned int el2_visibility(const struct kvm_vcpu *vcpu,
 				   const struct sys_reg_desc *rd)
 {
@@ -2080,6 +2097,10 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	PTRAUTH_KEY(APDB),
 	PTRAUTH_KEY(APGA),
 
+	GCS_REG(GCSCR_EL1),
+	GCS_REG(GCSPR_EL1),
+	GCS_REG(GCSCRE0_EL1),
+
 	{ SYS_DESC(SYS_SPSR_EL1), access_spsr},
 	{ SYS_DESC(SYS_ELR_EL1), access_elr},
 
@@ -2164,6 +2185,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_SMIDR_EL1), undef_access },
 	{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
 	{ SYS_DESC(SYS_CTR_EL0), access_ctr },
+	GCS_REG(GCSPR_EL0),
 	{ SYS_DESC(SYS_SVCR), undef_access },
 
 	{ PMU_SYS_REG(PMCR_EL0), .access = access_pmcr,

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
