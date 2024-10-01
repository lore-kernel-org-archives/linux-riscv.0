Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9E9CF318A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 23:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFDyZm4Q1T9Kt5KlbSXZhoSNRj5YFhTTVRcZKt8GtpU=; b=ZiWmwNY5eThDUG
	7/Z9yhOSUGXFc9Q4Q66ChcMr66iRXK++JeHGRXFLbzYfKJHEtzchrjG3DrevygfPX425jY2hnwjiF
	0g3T1Y/Ohjtn8LRebMpIeum+/RO/XTWaIa07Tzl1sqi6NtdHJwOPtZlHQ3kp1HIucWXpnMiTvrAic
	vzt3pMoYoqkIQCsHb96dCM+tzbO3sP2pf0jEsZ5l7CjgkDAH5R5vZ6BxEWYNa7vL9Kv+V8l9J1HvV
	SD58Ehw6uMmE/cLEYkVtwb6pGkxatRWGF2tn8MQcBE36PRlzySZm2IXZ4apcURokZ8rtf2FCBu7FK
	D1D+VAJC3Sui+nkHVFyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svm6g-00000004LOm-14jk;
	Tue, 01 Oct 2024 23:16:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlse-00000004GnK-3CNe;
	Tue, 01 Oct 2024 23:02:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C0E015C045E;
	Tue,  1 Oct 2024 23:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05C7C4CEC6;
	Tue,  1 Oct 2024 23:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823727;
	bh=XlTxOnAiHFAYZKJpgoxrD4q5MOzDKmN/oDFlTiS+t2w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B3BTEar0kxUHPMC45mb/3guTN8GQteT2abMPsEuayS/m7o/yinbVqAofmSJC4hI07
	 laDxHf5pNum6w1MgF0Hatb12IwvGiUudPyBa5N4Lt0ph/FDLQj0IrCG80UZ4dteOWt
	 XJG3OqTG+iwCn6+Fiu3D3SBDbLpx8k0b0D1D1SkkUNBVUJQkyY7/m5wtvgBalleSbX
	 4pyK+RBR1fyMn0UP6jxDTF7ofARSEdkfZyOYkMdlcsrO4Qe9cMDsXpQvv2nlGPcp9a
	 8j+QRwqde2ItoCzSxkbWyhuBcdhMtzUYyjW/LsolvPgDftd4DhYtR1Y2evktbviPm1
	 ib8H5QFYnP7+g==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:58:51 +0100
Subject: [PATCH v13 12/40] arm64/cpufeature: Runtime detection of Guarded
 Control Stack (GCS)
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-12-222b78d87eee@kernel.org>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
In-Reply-To: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Ross Burton <ross.burton@arm.com>, David Spickett <david.spickett@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=3078; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XlTxOnAiHFAYZKJpgoxrD4q5MOzDKmN/oDFlTiS+t2w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7NyUyYZXa21wFdz0TjX5+sLCx8XfO60DxVZUCX
 Ab4QUCaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+zQAKCRAk1otyXVSH0ICIB/
 9K3rESouHqLdfEcbd40qOHOSuEGRBwHV6r7EoMItNYD0N1F1ziysWvW4clA/0BqTgCI6dGSee3B91k
 +f7Xyfzxw77OGGlWSXBX5JMWqi4pK6xKeSJ/AeuZu09I7/HFcv96y1I5UD+VKmusZVKYYAKCw4Fdk9
 5ke/xGqI/ii3mk2LZC+9Bow39wLizLWVo+OoaZ24iIsppW3pn3yl3hKpQHeN6x3ktjtfP3D7zVPPSI
 Jv7cZIjxEhD32jwR+vKPxyYD/GoepBE6abKyD4a9TO1br+AU0iNCfaAkKQvL/6FmYDLfsgHvYfjAk7
 G4HaapPWfssm48QGOmIYG8CK2nU+4C
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_160209_060494_B5CC7BCB 
X-CRM114-Status: GOOD (  12.45  )
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

Add a cpufeature for GCS, allowing other code to conditionally support it
at runtime.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/cpufeature.h |  6 ++++++
 arch/arm64/kernel/cpufeature.c      | 20 ++++++++++++++++++++
 arch/arm64/tools/cpucaps            |  1 +
 3 files changed, 27 insertions(+)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 3d261cc123c1..69470795f5d2 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -838,6 +838,12 @@ static inline bool system_supports_poe(void)
 		alternative_has_cap_unlikely(ARM64_HAS_S1POE);
 }
 
+static inline bool system_supports_gcs(void)
+{
+	return IS_ENABLED(CONFIG_ARM64_GCS) &&
+		alternative_has_cap_unlikely(ARM64_HAS_GCS);
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 718728a85430..d1e758e99e0a 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -291,6 +291,8 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_GCS),
+		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_GCS_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SME),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_SME_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_MPAM_frac_SHIFT, 4, 0),
@@ -2358,6 +2360,14 @@ static void cpu_enable_poe(const struct arm64_cpu_capabilities *__unused)
 }
 #endif
 
+#ifdef CONFIG_ARM64_GCS
+static void cpu_enable_gcs(const struct arm64_cpu_capabilities *__unused)
+{
+	/* GCSPR_EL0 is always readable */
+	write_sysreg_s(GCSCRE0_EL1_nTR, SYS_GCSCRE0_EL1);
+}
+#endif
+
 /* Internal helper functions to match cpu capability type */
 static bool
 cpucap_late_cpu_optional(const struct arm64_cpu_capabilities *cap)
@@ -2889,6 +2899,16 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.cpu_enable = cpu_enable_poe,
 		ARM64_CPUID_FIELDS(ID_AA64MMFR3_EL1, S1POE, IMP)
 	},
+#endif
+#ifdef CONFIG_ARM64_GCS
+	{
+		.desc = "Guarded Control Stack (GCS)",
+		.capability = ARM64_HAS_GCS,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.cpu_enable = cpu_enable_gcs,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, GCS, IMP)
+	},
 #endif
 	{},
 };
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index eedb5acc21ed..867d25d4a45a 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -29,6 +29,7 @@ HAS_EVT
 HAS_FPMR
 HAS_FGT
 HAS_FPSIMD
+HAS_GCS
 HAS_GENERIC_AUTH
 HAS_GENERIC_AUTH_ARCH_QARMA3
 HAS_GENERIC_AUTH_ARCH_QARMA5

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
