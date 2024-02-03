Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437FCC4828F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 12:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+ums/wQ2Bg3sgYvHXUjF9lGOYIJvTojLgRbpD6dFns=; b=By8ikgsueMbF/D
	i50YmF1+JSlE8XbAPMGoRHPGg0z3fKPE5J66Y1pO+wraZOLHBPiQiTNoiJMXMLsLyvB2HB84eJ+2q
	xqoyDJea0P1NM0eEjNwpwCnTl6wffEBCFB7smQT5WUF+jzBiAZb6NkCNmMaeXjjgqTFhJgylb+9m4
	rmBvyeqV7NrNrRzY/3OK6p6MuUqLHKGBymggAfSyWGfbAzWxf1m0j7Mu2qRUcjrIR/JbqsOMR1xvj
	azMnyn2AA21uSIzbIOB1se7eN1jF9Kli46iF2847BL1n7bisGjySBBHiO+F5FqOXBV89WeE5TxlLi
	aM7j5ggeF5jUCxJAMZfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFAI-0000000GIfY-2Rri;
	Sat, 03 Feb 2024 12:30:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFAF-0000000GIe8-2LbB;
	Sat, 03 Feb 2024 12:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D8116069B;
	Sat,  3 Feb 2024 12:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E5AC43399;
	Sat,  3 Feb 2024 12:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706963430;
	bh=3WES2VkMACm1ygqHaT5urKF+J7gA2tcL8ARwsPvb13c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jf0yWUkhVM+JPbg1AC9kf4U5ONRAwYdHevZSinRnbGZ0+KN++7exp6ecg4cwGt7kx
	 nh44Z0xzRzf+fZQGsC0TGJ5mk4I4iECUK+bu6JkEDp3mPmAyeMdzfongItAXfWwLmO
	 72ZB5ax5EmAuMn9vjkhjXLkdBJNEKJm5nvmsL5UOOozEj3iDNkziBBugg85Yd0OR7c
	 9WNrIf+8gbGKFg3x5EwZnGxzHwSV8MV2RnahJN3xt8zblAc7qTmQCkFXb04E08vrJ3
	 uliIc8MtMK9akxMTcHmzdSG/UPpFJvpUUci9cs/GPvmqSWDoRbsoOTVjo4jEZvLkFO
	 JJBUPfhe4OHaQ==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 03 Feb 2024 12:25:35 +0000
Subject: [PATCH v8 09/38] arm64/cpufeature: Runtime detection of Guarded
 Control Stack (GCS)
MIME-Version: 1.0
Message-Id: <20240203-arm64-gcs-v8-9-c9fec77673ef@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2884; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3WES2VkMACm1ygqHaT5urKF+J7gA2tcL8ARwsPvb13c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlvjDYgOeEFvKfL/KhibKOKVGUlvLRngYcrrqWdJ/C
 KPdQLjGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZb4w2AAKCRAk1otyXVSH0DMjB/
 9Gjxj9HcxjjqdUkEH0zrL2GPEPBRWZ79lIIib6G577yXxcDoZZFwnRJKLTRLp15kUQpHY8s2Wyybkj
 OW3ZubuGxbYsa+d4rmUbWybg2GcBrDI7n2EA9/5WxwsF785F60BqdK5qVZIBCFK8z/ae3X6XbtCwfq
 LqI9vNIRF7hvoOhW5B7MCmez2Jg3vstbUwhkG/GvUujyFOb8qQUpMEOckUUq5lzlIlskAf70EgwusG
 zDcvFRvf/mQk7hvDk3m1E3hChIBJz7tjuBNeAS7DHAi4llL0fRzGwDwt4LzzGvn10dShS80qncZaGH
 LZLZWCZMaz4WDsHv2xgmJ7X12Km121
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_043031_734094_50681F4F 
X-CRM114-Status: GOOD (  12.72  )
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/cpufeature.h |  6 ++++++
 arch/arm64/kernel/cpufeature.c      | 16 ++++++++++++++++
 arch/arm64/tools/cpucaps            |  1 +
 3 files changed, 23 insertions(+)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 21c824edf8ce..3f3a685fa6e2 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -825,6 +825,12 @@ static inline bool system_supports_lpa2(void)
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
index 8d1a634a403e..b606842ab8c1 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -255,6 +255,8 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_GCS),
+		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_GCS_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SME),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_SME_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_MPAM_frac_SHIFT, 4, 0),
@@ -2250,6 +2252,12 @@ static void cpu_enable_mops(const struct arm64_cpu_capabilities *__unused)
 	sysreg_clear_set(sctlr_el1, 0, SCTLR_EL1_MSCEn);
 }
 
+static void cpu_enable_gcs(const struct arm64_cpu_capabilities *__unused)
+{
+	/* GCS is not currently used at EL1 */
+	write_sysreg_s(0, SYS_GCSCR_EL1);
+}
+
 /* Internal helper functions to match cpu capability type */
 static bool
 cpucap_late_cpu_optional(const struct arm64_cpu_capabilities *cap)
@@ -2739,6 +2747,14 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
 		.matches = has_lpa2,
 	},
+	{
+		.desc = "Guarded Control Stack (GCS)",
+		.capability = ARM64_HAS_GCS,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.cpu_enable = cpu_enable_gcs,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, GCS, IMP)
+	},
 	{},
 };
 
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index b912b1409fc0..148734504295 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -28,6 +28,7 @@ HAS_EPAN
 HAS_EVT
 HAS_FGT
 HAS_FPSIMD
+HAS_GCS
 HAS_GENERIC_AUTH
 HAS_GENERIC_AUTH_ARCH_QARMA3
 HAS_GENERIC_AUTH_ARCH_QARMA5

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
