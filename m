Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D51CC7EE2F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 21:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJlpVkAHdfEMnm+cejlRk73UCGqfqvNh7/c3wHiXULs=; b=G3hHeaxJC1npIr
	z6ua5ZraggU6OvAGA5rGuWn/UIByJd2Yw92iAA9jtQ+M4FAuqlHxG4XnlIW0L7OYYOOoKRQhqvEvg
	uNS4FlFAMSEq7VxM915yjemdwUcRul0dELbTy4x1D0iiaKwm3tHBzBjArxlljHQhlxzKLfUxyQNQ0
	6C4AwssjBXhIMp+DZDfYrC1+VeJ/r6qAPrNTDmjwDxnfWLYp1oSebwT7qORHD05u0C2rQftrKO6Ge
	Qj0S14IJ0hKcPcU9Sw8rtZM+hXE8Lz+/PyL0FkmDtukHsisC1Xr1vqerWX/2knvohWRIdYghXUnq3
	vnEeLTtkFM7iuly+0Xlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ojE-005Nbv-0w;
	Mon, 12 Jun 2023 21:05:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8oik-005MzV-0n
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 21:05:06 +0000
Received: from i53875b22.versanet.de ([83.135.91.34] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1q8oib-0005fR-6D; Mon, 12 Jun 2023 23:04:53 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: heiko@sntech.de,
	aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	conor.dooley@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v5 1/4] RISC-V: add Zbc extension detection
Date: Mon, 12 Jun 2023 23:04:39 +0200
Message-Id: <20230612210442.1805962-2-heiko.stuebner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230612210442.1805962-1-heiko.stuebner@vrull.eu>
References: <20230612210442.1805962-1-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_140502_321562_5BF80CE3 
X-CRM114-Status: GOOD (  11.32  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

Add handling for Zbc extension.

Zbc provides instruction for carry-less multiplication.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/Kconfig             | 22 ++++++++++++++++++++++
 arch/riscv/include/asm/hwcap.h |  1 +
 arch/riscv/kernel/cpu.c        |  1 +
 arch/riscv/kernel/cpufeature.c |  1 +
 4 files changed, 25 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a3d54cd14fca..754cd154eca5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -523,6 +523,28 @@ config RISCV_ISA_ZBB
 
 	   If you don't know what to do here, say Y.
 
+config TOOLCHAIN_HAS_ZBC
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbc)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbc)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on AS_IS_GNU
+
+config RISCV_ISA_ZBC
+	bool "Zbc extension support for bit manipulation instructions"
+	depends on TOOLCHAIN_HAS_ZBC
+	depends on !XIP_KERNEL && MMU
+	default y
+	help
+	   Adds support to dynamically detect the presence of the ZBC
+	   extension (carry-less multiplication) and enable its usage.
+
+	   The Zbc extension provides instructions clmul, clmulh and clmulr
+	   to accelerate carry-less multiplications.
+
+	   If you don't know what to do here, say Y.
+
 config RISCV_ISA_ZICBOM
 	bool "Zicbom extension support for non-coherent DMA operation"
 	depends on MMU
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e6c288ac4581..e48ac52b9174 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -47,6 +47,7 @@
 #define RISCV_ISA_EXT_ZICBOZ		34
 #define RISCV_ISA_EXT_SMAIA		35
 #define RISCV_ISA_EXT_SSAIA		36
+#define RISCV_ISA_EXT_ZBC		37
 
 #define RISCV_ISA_EXT_MAX		64
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 637263f9a7b9..bbff98d4712a 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -188,6 +188,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index de2d16300f69..f46281f1e439 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -261,6 +261,7 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
 				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
+				SET_ISA_EXT_MAP("zbc", RISCV_ISA_EXT_ZBC);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT_ZICBOZ);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
