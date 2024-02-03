Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B93BC4828F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 13:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kttY2zfee5onhgZNjUvHTuCBpbilmU7Bp7A8UOX4DyM=; b=Jxv8i9ZjieksZv
	a6ZubVDOIesgNeJEQmm499Y8LDd3iYZXAdj4k12+mAJCfVtRjbmudB0qCNvAlgbiFNlWFHXnrcB8d
	0RabzmGXF2G6i2tQq9L09AmZ/nyYcrX184QQanATEngTt87VuYHqkqknzFuMu3b3NUQWanIC3bIAd
	2HtavDpZDPAemol2KFBK/gOi3YGw9HsyU+r17/VX6BzLtCgVsty1vCKBIxW5aU5U48192+hQ/JAat
	tNx4y9kz1hcBrosTvhDPdanpGcMKIyFNSFKQgG5Twm75Ulbv7UWFsjeO3zpADyx11N1GgYTZ7lVva
	RhkrjOFn2wSd2ixBCYGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWG9L-0000000GXbE-1S5B;
	Sat, 03 Feb 2024 13:33:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFBC-0000000GJLH-1EIQ;
	Sat, 03 Feb 2024 12:31:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 839F060A67;
	Sat,  3 Feb 2024 12:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23856C433C7;
	Sat,  3 Feb 2024 12:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706963489;
	bh=2cZBAsyDen5t10YKJMqQqRacz55Ix1gmnVNOGcAdVHI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G3KODdyXV84zp1WCaszFTbVJ2uzuktodWs8f8wULYlN8w99KkxKz/+ezLneV0DugV
	 x/cwvGfsdUC3eW+YYRIwg6HU1tyRVrb7V4Ub/MdYDk6mE4D7XxqcwonHdr44Kp/bvw
	 b2g/KQS9cGH9Cl2Y2GuKcr7ecb32sw2ElksDnlhfkXP2DbnDikvM7MxJ8h8o+cOfkl
	 KvPtjaP0HwY9t6phffOTirc/ieuvAsz8aZwasX1XNp1Cv64JpuCsLj5fu7rvuPL6TP
	 hvuoAl/z3r0yWCjpqndfLm5YGAVsOPfdT2IgvmV9XZi0r9yPQS0W5hdeffXFKXMUnt
	 A9oqQY7azVtTQ==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 03 Feb 2024 12:25:42 +0000
Subject: [PATCH v8 16/38] arm64/hwcap: Add hwcap for GCS
MIME-Version: 1.0
Message-Id: <20240203-arm64-gcs-v8-16-c9fec77673ef@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2995; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2cZBAsyDen5t10YKJMqQqRacz55Ix1gmnVNOGcAdVHI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlvjDdArV5/f1ACfon5ADCHhNy9LNTvLl/uQOQRNL0
 1A2GhhGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZb4w3QAKCRAk1otyXVSH0LMLB/
 94kl6jJs+ZdrvXxnmg2VS+Ldw/qKP/sR+00QxgbGMh/uXh1xYFxuDHzgUpcnXqnP08q9VHn3XI0q+9
 5SpUX6Qd3Fvtqy1KVotOyPSUoeE7dpPJntzXucH4HzayJCWZ1VbxUaon7nPT6rWirxCE4eqW1rispq
 HomupbnqiFm9Q5BSDH8gS76+j3FBtUB71bbwothoqHW1avAFYEY/AYeoWmbNMfEsuvtFv4PI5FJ+ZX
 G4TNA3Mkel4mGN+Y7fQe+nlszt8TNErQCFln4CSh+0S/qH4X75ZBaIvA0HKUTIWPBRrMBDHdpA/Uaq
 sZb3P7vZZGRDet9V9CpODyO7rtqWzM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_043130_922109_6E2BF9EC 
X-CRM114-Status: GOOD (  11.15  )
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
index ced7b335e2e0..86d4ace9c75c 100644
--- a/Documentation/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/arch/arm64/elf_hwcaps.rst
@@ -317,6 +317,9 @@ HWCAP2_LRCPC3
 HWCAP2_LSE128
     Functionality implied by ID_AA64ISAR0_EL1.Atomic == 0b0011.
 
+HWCAP2_GCS
+    Functionality implied by ID_AA64PFR1_EL1.GCS == 0b1
+
 4. Unused AT_HWCAP bits
 -----------------------
 
diff --git a/arch/arm64/include/asm/hwcap.h b/arch/arm64/include/asm/hwcap.h
index cd71e09ea14d..e01e6b72a839 100644
--- a/arch/arm64/include/asm/hwcap.h
+++ b/arch/arm64/include/asm/hwcap.h
@@ -142,6 +142,7 @@
 #define KERNEL_HWCAP_SVE_B16B16		__khwcap2_feature(SVE_B16B16)
 #define KERNEL_HWCAP_LRCPC3		__khwcap2_feature(LRCPC3)
 #define KERNEL_HWCAP_LSE128		__khwcap2_feature(LSE128)
+#define KERNEL_HWCAP_GCS		__khwcap2_feature(GCS)
 
 /*
  * This yields a mask that user programs can use to figure out what
diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
index 5023599fa278..996b5b5d4c4e 100644
--- a/arch/arm64/include/uapi/asm/hwcap.h
+++ b/arch/arm64/include/uapi/asm/hwcap.h
@@ -107,5 +107,6 @@
 #define HWCAP2_SVE_B16B16	(1UL << 45)
 #define HWCAP2_LRCPC3		(1UL << 46)
 #define HWCAP2_LSE128		(1UL << 47)
+#define HWCAP2_GCS		(1UL << 48)
 
 #endif /* _UAPI__ASM_HWCAP_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index b606842ab8c1..1a92c4502a0b 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2867,6 +2867,9 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
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
index 47043c0d95ec..b3ec0b89c9e0 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -128,6 +128,7 @@ static const char *const hwcap_str[] = {
 	[KERNEL_HWCAP_SVE_B16B16]	= "sveb16b16",
 	[KERNEL_HWCAP_LRCPC3]		= "lrcpc3",
 	[KERNEL_HWCAP_LSE128]		= "lse128",
+	[KERNEL_HWCAP_GCS]		= "gcs",
 };
 
 #ifdef CONFIG_COMPAT

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
