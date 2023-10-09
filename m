Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49F4E95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htcL10440DLW/Mb+ShJoOt4ePdWaJ1pOlWdSe0Hyd1A=; b=sYCvvVF18tGXFD
	1MywefsFLpFZKZBHwd3rwqDgDFhEwedTGxDEiv4XJZiACnQLseaGSDEQgpX/0Qs46K08U4NK9nVha
	V7vkkKvuEkzypQmNL8UjDCuSp4SzHkUdKSmWTZEZrhDqco5RrHyAnuxTQYeHcW741P338MNpv8idR
	J7Mx84xQsebrSd3R/W+E50lKaXfZk3KtD0Ylno7r60WIulTDoSda7lFbMfMpZxPZOZvfMy1lNXtah
	cEAfbKyYu8qnsfh14TG7vnXdQCTcdCLRfmINQjg8iJ93oQ/Z2YLcB/FHjwDwVL9PgAF4IJOYgxFsi
	wRrkXNeh+xQOTFI4DHDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp7u-00Ab4S-1u;
	Mon, 09 Oct 2023 12:12:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp7q-00Aayu-18;
	Mon, 09 Oct 2023 12:12:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C20DAB81135;
	Mon,  9 Oct 2023 12:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1EABC433AB;
	Mon,  9 Oct 2023 12:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696853560;
	bh=lvoE1O3P70dbe+mZ76dqPIgfPzAOQeTbed5LhVnXTzQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qbHBXwJKK6WbkIpHZVNNuR75YMWz6B1rlWgXQGomiLIBnVf2ZbBp1dMC0ZMOgBEor
	 2EF/M4CxuUDKzhTkgYFMt2wKxY40qj1uuIf5HvM4Yd2qcAqbdokdvFm0wK5Tv+3Vfi
	 vDukFgrzMMfwyPCYvnAe/jatMV2NZIUenzxynOCuwBNxnT8XV7mQIAhodVazrt8BGb
	 KP7yKsLjSQOfd10jZ71s4gTznggZm9Je/wNUcYqFWSUIYPvsSIQ4wV3eddwp4bOZGR
	 3y2hn54HnEP0BPy6BzKeM5VHL8ZDI9dspK+4Jzy5MK3NrkvTCCVt6sz071rB9ad1Ql
	 yhgZjrJKSvQ2Q==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Oct 2023 13:08:51 +0100
Subject: [PATCH v6 17/38] arm64/hwcap: Add hwcap for GCS
MIME-Version: 1.0
Message-Id: <20231009-arm64-gcs-v6-17-78e55deaa4dd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2961; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lvoE1O3P70dbe+mZ76dqPIgfPzAOQeTbed5LhVnXTzQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlI+2e97itUFbmdKM/AAm/oWnm9YAweKpQRndIz6MZ
 nS5x0VmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZSPtngAKCRAk1otyXVSH0EeYB/
 9Q/PNyvnWiW4p9UMFv1tk22XH72fXtr+z/uCzMFO15lWzaMu2s5nb304MeTiU7E3qiL9sx6GCQBB7K
 BkhkD1KNIyCu140HAsk+JKUr2XlTIbR/t7Ec9SDoPKKtasEYd1FagLldM6jZn+BfLwR9Rq/LfE03jW
 GBJXSo6RHjSPSkiqNtc333VrTbWBknLn5MiUc2szJzvRaGccbjSwn3U0ZtidN5MC2+Ddx4yK5Oc8lZ
 gBKjROMbML5xWREWb2yXxSYfDBe2tKfZSn1ctZNFHgN0YtorefoswvPl5MM1wIcnGN3+PQyzUPI78G
 MzzKoi+Db2v4RN7Nur25rmi3/QsEPU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_051242_690093_89611A5A 
X-CRM114-Status: GOOD (  11.77  )
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/elf_hwcaps.rst | 3 +++
 arch/arm64/include/asm/hwcap.h          | 1 +
 arch/arm64/include/uapi/asm/hwcap.h     | 1 +
 arch/arm64/kernel/cpufeature.c          | 3 +++
 arch/arm64/kernel/cpuinfo.c             | 1 +
 5 files changed, 9 insertions(+)

diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
index 76ff9d7398fd..5c9e17a3c8d8 100644
--- a/Documentation/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/arch/arm64/elf_hwcaps.rst
@@ -308,6 +308,9 @@ HWCAP2_MOPS
 HWCAP2_HBC
     Functionality implied by ID_AA64ISAR2_EL1.BC == 0b0001.
 
+HWCAP2_GCS
+    Functionality implied by ID_AA64PFR1_EL1.GCS == 0b1
+
 4. Unused AT_HWCAP bits
 -----------------------
 
diff --git a/arch/arm64/include/asm/hwcap.h b/arch/arm64/include/asm/hwcap.h
index 521267478d18..d4bcd1cab698 100644
--- a/arch/arm64/include/asm/hwcap.h
+++ b/arch/arm64/include/asm/hwcap.h
@@ -139,6 +139,7 @@
 #define KERNEL_HWCAP_SME_F16F16		__khwcap2_feature(SME_F16F16)
 #define KERNEL_HWCAP_MOPS		__khwcap2_feature(MOPS)
 #define KERNEL_HWCAP_HBC		__khwcap2_feature(HBC)
+#define KERNEL_HWCAP_GCS		__khwcap2_feature(GCS)
 
 /*
  * This yields a mask that user programs can use to figure out what
diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
index 53026f45a509..5c0932bb7842 100644
--- a/arch/arm64/include/uapi/asm/hwcap.h
+++ b/arch/arm64/include/uapi/asm/hwcap.h
@@ -104,5 +104,6 @@
 #define HWCAP2_SME_F16F16	(1UL << 42)
 #define HWCAP2_MOPS		(1UL << 43)
 #define HWCAP2_HBC		(1UL << 44)
+#define HWCAP2_GCS		(1UL << 45)
 
 #endif /* _UAPI__ASM_HWCAP_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index e247dce1759c..114876512172 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2844,6 +2844,9 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
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
index 98fda8500535..e99724c9b440 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -127,6 +127,7 @@ static const char *const hwcap_str[] = {
 	[KERNEL_HWCAP_SME_F16F16]	= "smef16f16",
 	[KERNEL_HWCAP_MOPS]		= "mops",
 	[KERNEL_HWCAP_HBC]		= "hbc",
+	[KERNEL_HWCAP_GCS]		= "gcs",
 };
 
 #ifdef CONFIG_COMPAT

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
