Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51720C7114C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fh4Hs9gqw2Ih6Ke0bAIU+3HFPSp48vVaHoFdJIUbJ0=; b=r6+jc0ONeteVFN
	cMsQUgpsEQ+QEy1+xKVUxbpg4q8yYTBHLtCj7ygmwTQAXk7ERVidaNBAE+fazVUms+tUWsYkf7TAB
	rFM+JAcG1xQHnwTuC3CtiL4MAfj5gHQ6OnDZaJS/7pBbn9OUtN19CFkuEbeBO/cFKdlI+Ee/c+rg+
	DCOtfGsA0DmpDVDya9zQtHfgkN6V4LRtonxpYXs2MeU+SSlo1ZcapEub1LtfK+ABrH+qLsPGo07/O
	+Rc5YzE3dCfI+Yls+1dgAxPffqrWpav85P8qIUAkd/unrfg1PD+oMYQKd9eF7X/5RZEeSrFx8DQPd
	vP4AHA6CMlVPIfAasAXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSJ9-0000000HS27-3VWA;
	Wed, 28 Aug 2024 23:42:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS7c-0000000HMZg-0s51;
	Wed, 28 Aug 2024 23:30:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 37E29CE19B1;
	Wed, 28 Aug 2024 23:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B304DC4CEC5;
	Wed, 28 Aug 2024 23:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887837;
	bh=zQNH+o8kM+xdeVC0pT4NYleLSSNgw4W1dqWM5aTo6L0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=McPJdFXzB7Xi2TgOFuGbob5FaZF8TacF/kohZkUNSHMICkKs8oRH000SUaFgR2+xG
	 ldppZrfA5lQ+BAzPt68wEREuiHDyB7OWYNv7q3UtCeQMqKxNEONZHyblc4exoaBhQR
	 WPM0DmOtpEzqX29n+FpeYRYvnu20aJTTFmmC50zZx6AmLcP0u41AG6MHH7tRx+75tE
	 DvX6Nljuh58mbxhhLzR2+d+RwP6S0Hilmo+rCPrQgpEF0rt1l0r0/6ZIJaF57WL3w8
	 fQEMJ6c/T7/BQJ3DG6z2ouc5uGlAvDLRVUV/ASQlRzu/ZvWnQP7pUM8p4UpAninew/
	 73e4D2AxwPH2Q==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:33 +0100
Subject: [PATCH v12 17/39] arm64/hwcap: Add hwcap for GCS
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-17-42fec947436a@kernel.org>
References: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
In-Reply-To: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3152; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zQNH+o8kM+xdeVC0pT4NYleLSSNgw4W1dqWM5aTo6L0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7KFye+Iq31zZE7cvUlDXOHm9yUIKSyEcn/sVTXF
 VxtA+yKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+yhQAKCRAk1otyXVSH0NxnB/
 41/2S9q7Qq+yczFuuYwahqXHNSzMUqPuBcVDukfyFBViWDncG55aJThy4LSw3SZZmcVh13iFa2M7Zt
 mzYDZoY6CbuxqDBATiuyXvh5EHNhm1lLzOFpzB30bEIhanE2qGcYIyXwyDz6V2kjoVise5X/aOpYC6
 +Ywrao7lzPfKuj6VkWeKtDU+b99eWD4y2puxJ1xgb9rfrOwEYiXm77oNgOCpD/jF0OOO5kdj+RXaLd
 zsTDXVyneyKa8gYaiNpr5FRPwv0FNJYQAqUJkmD4AYp2Zrxp6puvpQkgOBEPKZei/1E6O+1oGKYqk+
 zqvUM1uMo2qM4ABISo+karAD/FUOfw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_163040_653447_3F453001 
X-CRM114-Status: GOOD (  11.82  )
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

Provide a hwcap to enable userspace to detect support for GCS.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/elf_hwcaps.rst | 2 ++
 arch/arm64/include/asm/hwcap.h          | 1 +
 arch/arm64/include/uapi/asm/hwcap.h     | 1 +
 arch/arm64/kernel/cpufeature.c          | 3 +++
 arch/arm64/kernel/cpuinfo.c             | 1 +
 5 files changed, 8 insertions(+)

diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
index 448c1664879b..cf87be078f33 100644
--- a/Documentation/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/arch/arm64/elf_hwcaps.rst
@@ -365,6 +365,8 @@ HWCAP2_SME_SF8DP2
 HWCAP2_SME_SF8DP4
     Functionality implied by ID_AA64SMFR0_EL1.SF8DP4 == 0b1.
 
+HWCAP2_GCS
+    Functionality implied by ID_AA64PFR1_EL1.GCS == 0b1
 
 4. Unused AT_HWCAP bits
 -----------------------
diff --git a/arch/arm64/include/asm/hwcap.h b/arch/arm64/include/asm/hwcap.h
index 4edd3b61df11..fd7e162e7e39 100644
--- a/arch/arm64/include/asm/hwcap.h
+++ b/arch/arm64/include/asm/hwcap.h
@@ -157,6 +157,7 @@
 #define KERNEL_HWCAP_SME_SF8FMA		__khwcap2_feature(SME_SF8FMA)
 #define KERNEL_HWCAP_SME_SF8DP4		__khwcap2_feature(SME_SF8DP4)
 #define KERNEL_HWCAP_SME_SF8DP2		__khwcap2_feature(SME_SF8DP2)
+#define KERNEL_HWCAP_GCS		__khwcap2_feature(GCS)
 
 /*
  * This yields a mask that user programs can use to figure out what
diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
index 285610e626f5..328fb7843e2f 100644
--- a/arch/arm64/include/uapi/asm/hwcap.h
+++ b/arch/arm64/include/uapi/asm/hwcap.h
@@ -122,5 +122,6 @@
 #define HWCAP2_SME_SF8FMA	(1UL << 60)
 #define HWCAP2_SME_SF8DP4	(1UL << 61)
 #define HWCAP2_SME_SF8DP2	(1UL << 62)
+#define HWCAP2_GCS		(1UL << 63)
 
 #endif /* _UAPI__ASM_HWCAP_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 315bd7be1106..e3e8290a4447 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2994,6 +2994,9 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64ZFR0_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEI8MM),
 	HWCAP_CAP(ID_AA64ZFR0_EL1, F32MM, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEF32MM),
 	HWCAP_CAP(ID_AA64ZFR0_EL1, F64MM, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEF64MM),
+#endif
+#ifdef CONFIG_ARM64_GCS
+	HWCAP_CAP(ID_AA64PFR1_EL1, GCS, IMP, CAP_HWCAP, KERNEL_HWCAP_GCS),
 #endif
 	HWCAP_CAP(ID_AA64PFR1_EL1, SSBS, SSBS2, CAP_HWCAP, KERNEL_HWCAP_SSBS),
 #ifdef CONFIG_ARM64_BTI
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 09eeaa24d456..2f539e3101ee 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -143,6 +143,7 @@ static const char *const hwcap_str[] = {
 	[KERNEL_HWCAP_SME_SF8FMA]	= "smesf8fma",
 	[KERNEL_HWCAP_SME_SF8DP4]	= "smesf8dp4",
 	[KERNEL_HWCAP_SME_SF8DP2]	= "smesf8dp2",
+	[KERNEL_HWCAP_GCS]		= "gcs",
 };
 
 #ifdef CONFIG_COMPAT

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
