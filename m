Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E349C4828F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 12:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IUEsV0OIADKFB4/XurD/X1yWvvWW9F9S6T3r3ELzo18=; b=Mphj49Ji9DYdGC
	s7PT6mRz2o7/VvlJj2Ot+dFmuK0860kXbNPdOZ75XFq4OGqCTHQJ1k1zEJGfcqAG9zKv0BqmVdxps
	Pyd/KlGuLl3MDdZM6Iw2nU3yMiLr99RtGdRHoj1REAOIbNEhG39UT07CDWY047lESTu6eQr0DzjgE
	A1b5N4cunaIYmVUGQP1ZiiRoVKbd7QTVB39/ibbGVGxefPS/+DEhoWU4Y5wMKQsUul4H+d9BBJv5F
	We3DFZ+o6Mf4zXDjKvLm+RqA7RWemwDxGKChV1Oj+lNr6+KV5kezNv2bCWC7jvc2I16ObUnRD4jfh
	qkOpbHWcDSxKKxZUs1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFB3-0000000GJD1-2Kku;
	Sat, 03 Feb 2024 12:31:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFAs-0000000GJ2p-27Ps;
	Sat, 03 Feb 2024 12:31:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B03160A6B;
	Sat,  3 Feb 2024 12:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7804C433A6;
	Sat,  3 Feb 2024 12:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706963469;
	bh=wsC4cXHxhQJUOeMbmPuoHCyoB60s23Z9e6BRm1QhN7A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y4+pK5KFU0dncMhitlTirufT5ijd2/gZ96LtjyukVkILr1m2XXsADtfHpLiMfvgwc
	 1rVY7lygDo5aNC9i34odTMACj/89MX+Av2vjb3OmoUAV+AoVABv/QBL47arcpjvJSH
	 /xwiFwfCXeNBFi1rWGto82wLoWhGcwAptuxYErv9TSpsNME6MWd3KzeowF/TnjH4xa
	 gcgbyo/m+041r/1zvfh1UGaU0aTR1uvs5kz7umBZA6ciBv0H7mI7A30QQtbZ4ExpAm
	 YQnV9Z4kdn09sQDx3HdTh/PLbYdyReYOD0Fi3vU+pFAAaRUuYHaweLfKr4o7yYCR75
	 GzhW7CtkIkkLw==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 03 Feb 2024 12:25:39 +0000
Subject: [PATCH v8 13/38] KVM: arm64: Manage GCS registers for guests
MIME-Version: 1.0
Message-Id: <20240203-arm64-gcs-v8-13-c9fec77673ef@kernel.org>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
In-Reply-To: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
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
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-a684c
X-Developer-Signature: v=1; a=openpgp-sha256; l=6351; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wsC4cXHxhQJUOeMbmPuoHCyoB60s23Z9e6BRm1QhN7A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlvjDbJNRUJao3dWvuwPTqT3MBlEVih4ppUyFD1IDZ
 rP8CrkyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZb4w2wAKCRAk1otyXVSH0MKDB/
 4n9gMdLyCdNGCiZo+CTMFlgQ4Wi8rMdJmgyEoJTwuG76FVrWeLymMLRG5IfLwYTUawuLoJxV8TS1kv
 /qDxZzMgPY3zCqfIes1OM6ZCSt0OWYzq1jugGcndxjBdC5NVVZoJWQTBBO/XJi/1b+bBCtj0AZtKl9
 FGzwFnbuH9pCojns2G9IlfZIChvGSwuCInxQYajCdx/S4C4hwcQooD8bIsQtFPi6i8NJ0kN9CTViuE
 MI9mBvjhfiZ2xljFpTPUpnbraIynqHE6bYxUjy8D3zAeOalsVCv9NoY8Gec6SEcx+gXe8aEB9x6x/d
 p7fDpnqOG+4FFyHk83njeAm6LZvWW8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_043111_200917_9DF6976D 
X-CRM114-Status: GOOD (  14.30  )
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
guests to use GCS, as well as describe their fine grained traps to
nested virtualisation.  Traps are already disabled.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h          | 12 ++++++++++++
 arch/arm64/kvm/emulate-nested.c            |  4 ++++
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 17 +++++++++++++++++
 arch/arm64/kvm/sys_regs.c                  | 22 ++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 21c57b812569..6c7ea7f9cd92 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -388,6 +388,12 @@ enum vcpu_sysreg {
 	GCR_EL1,	/* Tag Control Register */
 	TFSRE0_EL1,	/* Tag Fault Status Register (EL0) */
 
+	/* Guarded Control Stack registers */
+	GCSCRE0_EL1,	/* Guarded Control Stack Control (EL0) */
+	GCSCR_EL1,	/* Guarded Control Stack Control (EL1) */
+	GCSPR_EL0,	/* Guarded Control Stack Pointer (EL0) */
+	GCSPR_EL1,	/* Guarded Control Stack Pointer (EL1) */
+
 	/* 32bit specific registers. */
 	DACR32_EL2,	/* Domain Access Control Register */
 	IFSR32_EL2,	/* Instruction Fault Status Register */
@@ -1221,6 +1227,12 @@ static inline bool __vcpu_has_feature(const struct kvm_arch *ka, int feature)
 
 #define vcpu_has_feature(v, f)	__vcpu_has_feature(&(v)->kvm->arch, (f))
 
+static inline bool has_gcs(void)
+{
+	return IS_ENABLED(CONFIG_ARM64_GCS) &&
+		cpus_have_final_cap(ARM64_HAS_GCS);
+}
+
 int kvm_trng_call(struct kvm_vcpu *vcpu);
 #ifdef CONFIG_KVM
 extern phys_addr_t hyp_mem_base;
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 431fd429932d..24eb7eccbae4 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1098,8 +1098,12 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
 	SR_FGT(SYS_ESR_EL1, 		HFGxTR, ESR_EL1, 1),
 	SR_FGT(SYS_DCZID_EL0, 		HFGxTR, DCZID_EL0, 1),
 	SR_FGT(SYS_CTR_EL0, 		HFGxTR, CTR_EL0, 1),
+	SR_FGT(SYS_GCSPR_EL0,		HFGxTR, nGCS_EL0, 1),
 	SR_FGT(SYS_CSSELR_EL1, 		HFGxTR, CSSELR_EL1, 1),
 	SR_FGT(SYS_CPACR_EL1, 		HFGxTR, CPACR_EL1, 1),
+	SR_FGT(SYS_GCSCR_EL1,		HFGxTR, nGCS_EL1, 1),
+	SR_FGT(SYS_GCSPR_EL1,		HFGxTR, nGCS_EL1, 1),
+	SR_FGT(SYS_GCSCRE0_EL1,		HFGxTR, nGCS_EL0, 1),
 	SR_FGT(SYS_CONTEXTIDR_EL1, 	HFGxTR, CONTEXTIDR_EL1, 1),
 	SR_FGT(SYS_CLIDR_EL1, 		HFGxTR, CLIDR_EL1, 1),
 	SR_FGT(SYS_CCSIDR_EL1, 		HFGxTR, CCSIDR_EL1, 1),
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
index 30253bd19917..83ba767e75d2 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2000,6 +2000,23 @@ static unsigned int mte_visibility(const struct kvm_vcpu *vcpu,
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
@@ -2376,6 +2393,10 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	PTRAUTH_KEY(APDB),
 	PTRAUTH_KEY(APGA),
 
+	GCS_REG(GCSCR_EL1),
+	GCS_REG(GCSPR_EL1),
+	GCS_REG(GCSCRE0_EL1),
+
 	{ SYS_DESC(SYS_SPSR_EL1), access_spsr},
 	{ SYS_DESC(SYS_ELR_EL1), access_elr},
 
@@ -2462,6 +2483,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_SMIDR_EL1), undef_access },
 	{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
 	{ SYS_DESC(SYS_CTR_EL0), access_ctr },
+	GCS_REG(GCSPR_EL0),
 	{ SYS_DESC(SYS_SVCR), undef_access },
 
 	{ PMU_SYS_REG(PMCR_EL0), .access = access_pmcr, .reset = reset_pmcr,

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
