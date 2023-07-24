Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C79C04A94
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 12:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PlIWIsER1/bkKM27fcjZ6NCt2wnZowWRNT3xFIb5nx4=; b=4/o/LPfjzc0tSl
	p/E8TqXIbgT0/Z/sx+T0a9vzUAuVEdkAkBDp1rzeC6wiQsQgmv3C68RBi+ctBCIm3vyNZ0lASgukh
	xntEH6qNZ9dXvVuy20CUgY7bedjz1lW4heFjz5eWpmSlM2xBxToN1SlA8DCKFYTvBVMJBMA9SWzoO
	zuCA9s3I5nT9yGGmKjspalpcUPTfYxLurPK/rF7LGZYXia5160Gc88XcBXgezGx5FFdE+UZoLOpXW
	/+JhV9/WPS71M7pmWuolE25dWVPd2tF1Zurajh3AdvrE63UDjwA5moP2o9MFDGtl0UYfTnIf3I+7s
	AOYh7MhxB5PLKk39KY9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNv05-004Ie8-0U;
	Mon, 24 Jul 2023 12:49:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuzN-004I28-2p;
	Mon, 24 Jul 2023 12:48:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E67A66113D;
	Mon, 24 Jul 2023 12:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877F2C433C7;
	Mon, 24 Jul 2023 12:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690202916;
	bh=ggfCgbEg0UE7JP5CH6e+dKjRf0SerXD/ltcRHcZOEeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZlYyKGx5oVvOMCsNxuqZ4HRF3rvaY0YwGG/oWgFTRzMKYrJMGtgwu7klWTg/EK2OE
	 V+/0x7bthpwL6TZG1IMfBvVdYiFaEV30QTzmWrxcjYn3siUcHaSDiKkiFhafOqS5kF
	 KoInIffQYumzNVhO706WkQSEXJmNPwh4BhncyG0CzIl4dGOcCu7mtPzJNRHdzwM8b5
	 BbTQ3rNcw+mGsmVl6Q5KHJw0s/435ijNB+0xM6dH3UnyLUCP5fA6LusN2Zxv+CEMRI
	 YSFb+SNJDDbU/0qkGLO5CYwAV8V41dUFmpoUcqULYew038wwhOQp5ontiNxuhh18tE
	 Z+Z0FQcxKgWmQ==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 24 Jul 2023 13:46:02 +0100
Subject: [PATCH v2 15/35] arm64/hwcap: Add hwcap for GCS
MIME-Version: 1.0
Message-Id: <20230724-arm64-gcs-v2-15-dc2c1d44c2eb@kernel.org>
References: <20230724-arm64-gcs-v2-0-dc2c1d44c2eb@kernel.org>
In-Reply-To: <20230724-arm64-gcs-v2-0-dc2c1d44c2eb@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=3001; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ggfCgbEg0UE7JP5CH6e+dKjRf0SerXD/ltcRHcZOEeI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkvnKcknfKTRZzzz9LbJqgRRYQvQPCXo2LJwyJ51fr
 V9bqvnyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZL5ynAAKCRAk1otyXVSH0FxjB/
 9s5qbeKLsQo6cJg7CW6iKQsH0m1MonkUJ29aRZgGkImNaZqMPwNq2aDasRT9454sPPGfQ+G/Ygvzf1
 S1QuaQjU5/GeTtiG2vHwVUPCzlbr8nVVSyjQDRMaTJCXI8BaVrrtIdPwuNyIKnVw4z8W8Z8GBenp84
 jF72SJGd1juVuSEimlfH/nM9iNkZaGToXORIeQxqIjLBvmszrlgTD0NQ9YvnGDCrd36rmFTXUUq0ke
 m3HYgcLS3kSgZ5RTJ+hlrvMovehLpCDaPmVKV6T0KUMptoJ8603pXErRs8N4yHdel5aNMcBHcgLiV0
 utMsK9B0MA0Eq6XGMZGJQyyk7JTwjO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_054838_014489_3CC2D44F 
X-CRM114-Status: GOOD (  12.87  )
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
index 8c8addb4194c..75f3960cad39 100644
--- a/Documentation/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/arch/arm64/elf_hwcaps.rst
@@ -305,6 +305,9 @@ HWCAP2_SMEF16F16
 HWCAP2_MOPS
     Functionality implied by ID_AA64ISAR2_EL1.MOPS == 0b0001.
 
+HWCAP2_GCS
+    Functionality implied by ID_AA64PFR1_EL1.GCS == 0b1
+
 4. Unused AT_HWCAP bits
 -----------------------
 
diff --git a/arch/arm64/include/asm/hwcap.h b/arch/arm64/include/asm/hwcap.h
index 692b1ec663b2..39f397a2b5b2 100644
--- a/arch/arm64/include/asm/hwcap.h
+++ b/arch/arm64/include/asm/hwcap.h
@@ -138,6 +138,7 @@
 #define KERNEL_HWCAP_SME_B16B16		__khwcap2_feature(SME_B16B16)
 #define KERNEL_HWCAP_SME_F16F16		__khwcap2_feature(SME_F16F16)
 #define KERNEL_HWCAP_MOPS		__khwcap2_feature(MOPS)
+#define KERNEL_HWCAP_GCS		__khwcap2_feature(GCS)
 
 /*
  * This yields a mask that user programs can use to figure out what
diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
index a2cac4305b1e..7510c35e6864 100644
--- a/arch/arm64/include/uapi/asm/hwcap.h
+++ b/arch/arm64/include/uapi/asm/hwcap.h
@@ -103,5 +103,6 @@
 #define HWCAP2_SME_B16B16	(1UL << 41)
 #define HWCAP2_SME_F16F16	(1UL << 42)
 #define HWCAP2_MOPS		(1UL << 43)
+#define HWCAP2_GCS		(1UL << 44)
 
 #endif /* _UAPI__ASM_HWCAP_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 91a14a6ccb04..7b46e01140c4 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2840,6 +2840,9 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
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
index 58622dc85917..451fbbeffa39 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -126,6 +126,7 @@ static const char *const hwcap_str[] = {
 	[KERNEL_HWCAP_SME_B16B16]	= "smeb16b16",
 	[KERNEL_HWCAP_SME_F16F16]	= "smef16f16",
 	[KERNEL_HWCAP_MOPS]		= "mops",
+	[KERNEL_HWCAP_GCS]		= "gcs",
 };
 
 #ifdef CONFIG_COMPAT

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
