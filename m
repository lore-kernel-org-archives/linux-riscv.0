Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C71C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 01:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hR23fR7ccI8hRdwFAwb7FwQ3FP0ozGcN5ddaQnAmGrM=; b=JQr3s6Fel0b4b/
	cu9bC7vfP7bEPulWBQ+Ovh7zGfUy8F1yHeYI4QiEZ2SxLnLk7q9wiEx0jSb0ovkLW7hv8G7ixbHih
	YO5P26nPFr1PbGGW1IKXAEKaziz+W8mkvXnhkic7xKiphMS9pcXrfOtmnIdRFr3O8GGg9ng90WofI
	ajL8CVDpsKNEyGxsCJkCemhpQMzhfY8RLDscWTlflZzwQ60HX7A6shVZ4e63YBUbGR2W/cDpbYG4N
	iT++T6YcMqPgWO+gk7WBCJgEKCovtqUvuJ32/0hhRW1fbPIYniDpBUAW76bucZQhw129mCy9ffJwW
	e02uWEHmRUKsTsl9OG/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwZh-0000000AueD-1wkC;
	Thu, 22 Aug 2024 01:25:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwT0-0000000Arix-39hV;
	Thu, 22 Aug 2024 01:18:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EE7DFA420FE;
	Thu, 22 Aug 2024 01:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B98C4AF18;
	Thu, 22 Aug 2024 01:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724289501;
	bh=sqQ+QKkmK52Q/49cSzsvA/P7PZLEWrgUxaLRjQV/ejo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CjJdvIq43wLukfmjToKRyHHeVQIojg0WuXILAiXT0/HpQVb+xgWlpUqmMICHCRvt1
	 poJ59L1QGGcL6MxMWyqKzSmlLrYwEkfmuY3llMWVch9iNGSdYe39j+QPzyESNevFD9
	 ewMH9HAFaQ4xQHeF7XSVDq//Ae27f60g7oETV5/TNmxiVNYu6ahUQh0nI9vAA/7PSo
	 Nj2wk7CrHbn+/UFUd4i6EMY+0cEkpAGId3U0FgC5EEJq14N+a5naLb7QyqzIaoK4ko
	 HgU381MB7Pi0YycD95LUxpcgbPVnWy5iVmrFOpAd21RvOr/LF/keOzZyJPLLgIHUg+
	 3UrPtTfJp16Dw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 22 Aug 2024 02:15:14 +0100
Subject: [PATCH v11 11/39] arm64/cpufeature: Runtime detection of Guarded
 Control Stack (GCS)
MIME-Version: 1.0
Message-Id: <20240822-arm64-gcs-v11-11-41b81947ecb5@kernel.org>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
In-Reply-To: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=2509; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sqQ+QKkmK52Q/49cSzsvA/P7PZLEWrgUxaLRjQV/ejo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmxpEssm61j0572jagQn51jVrKg0sQmM+kpfxtQyMu
 q2YtYBmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZsaRLAAKCRAk1otyXVSH0HenB/
 9SaBGUP0WgFMNDS/6ZR0f8D4eoA6DGU5iVT+BfZQrizL/iBEle0/DIkVgRcO1R30x2kxo4FfClzkc8
 aI5PSj4d5AABqhPGa7Le2lPuu5hKBDz2Ta5aBGB1c994qpPa3F0q0HQ4cKEgHLTW8eBqYjyKMIgN/1
 gavDgSQOL0Qox4HtTk5FLiatlutI7Slz7KtRR/awNPukoFlsXqXV5BbLivqOsVJX0HlC9t6YC9O1Rb
 vdN6j0pK3/SsY+CGIoWUWn3h6ykmoKhpwH+Q+59peF12FvFCbD9ZCNADQ9MZLNDNX8dNex7edvJAT8
 LBKKQujdtKbLssSgzxABrstFIs4d2s
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_181822_994991_92D7D9CB 
X-CRM114-Status: GOOD (  11.02  )
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
 arch/arm64/include/asm/cpufeature.h | 6 ++++++
 arch/arm64/kernel/cpufeature.c      | 9 +++++++++
 arch/arm64/tools/cpucaps            | 1 +
 3 files changed, 16 insertions(+)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 558434267271..e0f0e4c24544 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -832,6 +832,12 @@ static inline bool system_supports_lpa2(void)
 	return cpus_have_final_cap(ARM64_HAS_LPA2);
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
index 646ecd3069fd..315bd7be1106 100644
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
@@ -2870,6 +2872,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_nv1,
 		ARM64_CPUID_FIELDS_NEG(ID_AA64MMFR4_EL1, E2H0, NI_NV1)
 	},
+	{
+		.desc = "Guarded Control Stack (GCS)",
+		.capability = ARM64_HAS_GCS,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, GCS, IMP)
+	},
 	{},
 };
 
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index ac3429d892b9..66eff95c0824 100644
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
