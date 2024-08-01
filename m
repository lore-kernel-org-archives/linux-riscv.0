Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7802C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4gDyo5V6mxpE9NSXDjVUAKsep3mMDheYg2dMn8K/7Ag=; b=Jn2k5WiYeWJqSa
	fye2CgbcerIh1bZRvpBZKn58VgHlOizBZdhCX4WdILm1U839fu2980zdidRVHjhfYO0xa0Fj0ECdi
	8s2+gYi5B43OuYx+2htaaTDM6ETu9kyPudpiXVr4cmfw87A03JgEJ3lefWRHqDRwVdZ+ZR2eFlUYV
	SQqVPoOl6DMh1NccFZNUXJ1TMhxripv75C8xSKaKIk9PMMhkVhUH5UiTfEg+l+Qk6UQjCkAUA6+A6
	Fs5x7sSV9ZO7MY+IPqsWFiUma1L2zEUGaCuLKTWzFjs7/7tNJFqk2W8JmP/DoSmb4Tvfq7higHk7M
	bNo09gLTH4m++CM1YA5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVWX-00000005Ndm-2ZLF;
	Thu, 01 Aug 2024 13:07:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVOi-00000005InP-09AC;
	Thu, 01 Aug 2024 12:59:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F374FCE1849;
	Thu,  1 Aug 2024 12:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE845C4AF0A;
	Thu,  1 Aug 2024 12:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517149;
	bh=p+k0jTbaEA99trdr4pz3NzAF7Yf9BBO+B19MeJlSzs4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P2aAxOpvDJCVbQojJ9kkL/0p1jNyh3RkZBHFselBqiDWXCW0nnIMKt3IiX1HP/Lov
	 nkutr2v0fm25gEK3gZoDdSgmixgIVvq0UMFXFCKRSvyckadjMMk+T0hez85GDFgUmB
	 nHzU2DiOZfbbpCTGo3PYfV4EOfVuu4v6i3Vt7Xm7RvjeW45joMiiN6E2BrN5kxwxvj
	 IVt7/Z/Y9f3eknRPzhWUhp6xYXJIRLm7D2wA+fFxlqYoDXS12yOIU1ciS1LWtcs1IQ
	 Pniipz/v/XBnLLHbeGRszNNQDtJ36bfy+r31S5pb9A/sHFZrMgh6n5O9TRbDa/YVnc
	 cnGttAsUXJeLA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:43 +0100
Subject: [PATCH v10 16/40] arm64/hwcap: Add hwcap for GCS
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-16-699e2bd2190b@kernel.org>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
In-Reply-To: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=3096; i=broonie@kernel.org;
 h=from:subject:message-id; bh=p+k0jTbaEA99trdr4pz3NzAF7Yf9BBO+B19MeJlSzs4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4YSBKOey9Au/9HUMZhMesat8OM3JKKecV9+v3Nl
 K8XZbOOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGEgAKCRAk1otyXVSH0K+rB/
 9kzIKyQv+DBtJyO/wq++dRFdIkJlQbaYJOX5SYFg4n9tnCGfLydiZut128GSYqvvzyGt4TpWt8pUG4
 ntnI3Zp+6CIrZ03fqhyL2sn7tbmGhJK7/MKvycFXdHF81NZHxWe7AnDxaV1q+OA080MeTM8TfmlqT+
 gz9sec8C0qMNsRXLO3E/o0h+JuGLGAZrAix4ocp1WyWnVUhSOpHHSTOO0eOdn7kJrw1JwTyz4Fwvbt
 z3psPrrlb1hKxFhWZ/5El3qMk4QVLR8+0BCkh+minpRiwJTbK8l1XgIJchzyPlzjiZY0blCBq8Rcm4
 21/4lMmm/yOw7bnpkLlOR/YnHAWHPJ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_055912_527507_F70B7FFB 
X-CRM114-Status: GOOD (  12.22  )
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
