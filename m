Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BD6E6F095
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 00:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wBtHZbZgn2SzZy9EmO3mW+SrTWcpcdYvRaLP5wzyJfQ=; b=SEWPJGVo+CAape
	f8+0KxviM4tQjSfO/rZfKEhFkvbcJqtesrBodeGvlVjG5RzxKMymeqkCwLaCD9suOnQvBxpyYA4SG
	TVR589yzMPwj+V8nLNyDB24wqF1mhu+62aBYYr8cj2QMhVokb4BkRx7t15l17abz5UZT/pCFFfTKP
	z4gPwjUTKy6D9y2mzwNKFwpW1i8oAR+X/HPNgHO0w+7rZdNA5oFWmoKLwUepTf3Rnc+DlmgTnj5pw
	Z0JAmIUaxnPlS+ehTJqnZc58f4/FEJ+YCP+WMCFM2wCvhbrv9sSP4F1yUKTgqpRoPvvwBFlFFTpVV
	A44em5LkzAMioxVMK8+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t71hR-00000008a9H-3zF2;
	Sat, 02 Nov 2024 00:09:05 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t71hO-00000008a69-2TIr
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 00:09:04 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e2eba31d3aso1867971a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Nov 2024 17:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730506141; x=1731110941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+rAnka3y7HDTfLG1azR9CpKSqpVN1TkP7KNPAjIJyU=;
        b=iXrkZTa7tRXth5DcxyVHCHCvaH8mWS5AOV7AgjPfKFN3JAoE//RPsgbVHJWFmullLB
         5jx2hlkg3RvECAwy1PIKyk7Yqx0NenoRFx7Mf5wWUGqvwfDytWfOUApNh3Z2eU1iOMAZ
         jwnwx4E93dfjhdnQXsCFrBosZIVwgndwete5FU3dHQ/wfzxdwgOdq3Gvpu+OyrvZhw5p
         IDz/hGDepMmO27mNlK7c0kqqkRwmMlb5PV3TGRqW1ZKgxalN/9uAxNF+iOx/aLe1JTHZ
         unzioZ/T0x1cyIkPgg9Yz+VFp5U8wtAVjq1bkMSINRKD3bQLGva9jHHXkQf+xmJEYcMo
         bSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730506141; x=1731110941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+rAnka3y7HDTfLG1azR9CpKSqpVN1TkP7KNPAjIJyU=;
        b=wNU+K1iubFZzoR4IE1KEiFBdkN6vJJQedFuOY0N90ONs9feZDOgmUWTCvtHq/jUv5d
         XTvgw9nA2C8fzQSMG3UNryOJr+ebufN57+cXSaiEbE4XFY92cPtm45YetnLk/yyVa31W
         RNMNbn/lZwp/+B5TKBOPQzKOS3BtecmKvzH0pIVWD0drB3QmleYwNHagYlrzEgm+Rfo+
         Cs/paa/StLMwts0MwQJnY5owcV01hu1/5yteLBvTdAqt1xjG9L7Hc4A0y2xM6/cejMzN
         wBIeayQjv7uUONC391fMhd5Fy4XDOUC+KOnP5cEvyDgK97wxWpTcBF0Ztjg60KPnW0//
         Ks2g==
X-Forwarded-Encrypted: i=1; AJvYcCUKqQDldn3IPU1YkYOR0upEupeAk+Ek6kDo99zzO8eTqPYYGMst3DByH11/outlcBHXFpUCcUhYock5kQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIVlSyeyAIHemmLTixD/LodA+yINV5i5hWaFQWWQrizOvT896U
	tifbSaCS15R4OZlWEHAxYd6xKrSw2qP22kXZGpC6ftXr00B9rXY/PKPzPz/F2VI=
X-Google-Smtp-Source: AGHT+IE9dycbI2epbg/rXlLb7+LyF9i1Z79AYkysLeojOoNqjBBp2pOKME/1fRPoHW8Jt+G33gBPpg==
X-Received: by 2002:a17:90b:4d01:b0:2e2:c98e:c33f with SMTP id 98e67ed59e1d1-2e8f1058039mr30664103a91.1.1730506141388;
        Fri, 01 Nov 2024 17:09:01 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fc00856sm5505749a91.54.2024.11.01.17.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 17:09:00 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 11/11] riscv: dts: starfive: jh7100: Use physical memory ranges for DMA
Date: Fri,  1 Nov 2024 17:08:05 -0700
Message-ID: <20241102000843.1301099-12-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241102000843.1301099-1-samuel.holland@sifive.com>
References: <20241102000843.1301099-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_170902_872835_DBBCB9B0 
X-CRM114-Status: GOOD (  13.97  )
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

JH7100 provides a physical memory region which is a noncached alias of
normal cacheable DRAM. Now that Linux can apply PMAs by selecting
between aliases of a physical memory region, any page of DRAM can be
marked as noncached for use with DMA, and the preallocated DMA pool is
no longer needed. This allows portable kernels to boot on JH7100 boards.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/Kconfig.errata                     | 19 ------------
 .../boot/dts/starfive/jh7100-common.dtsi      | 30 ++++---------------
 2 files changed, 6 insertions(+), 43 deletions(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 2806ed7916c7..fc2c7fb2caff 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -53,25 +53,6 @@ config ERRATA_SIFIVE_CIP_1200
 
 	  If you don't know what to do here, say "Y".
 
-config ERRATA_STARFIVE_JH7100
-	bool "StarFive JH7100 support"
-	depends on ARCH_STARFIVE
-	depends on !DMA_DIRECT_REMAP
-	depends on NONPORTABLE
-	select DMA_GLOBAL_POOL
-	select RISCV_DMA_NONCOHERENT
-	select RISCV_NONSTANDARD_CACHE_OPS
-	select SIFIVE_CCACHE
-	default n
-	help
-	  The StarFive JH7100 was a test chip for the JH7110 and has
-	  caches that are non-coherent with respect to peripheral DMAs.
-	  It was designed before the Zicbom extension so needs non-standard
-	  cache operations through the SiFive cache controller.
-
-	  Say "Y" if you want to support the BeagleV Starlight and/or
-	  StarFive VisionFive V1 boards.
-
 config ERRATA_THEAD
 	bool "T-HEAD errata"
 	depends on RISCV_ALTERNATIVE
diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
index ae1a6aeb0aea..34885fe40e2d 100644
--- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
@@ -9,8 +9,14 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/pinctrl-starfive-jh7100.h>
+#include <dt-bindings/riscv/physical-memory.h>
 
 / {
+	riscv,physical-memory-regions =
+		<0x00 0x00000000 0x40 0x00000000 (PMA_RW | PMA_IO) 0x0>,
+		<0x00 0x80000000 0x08 0x00000000 (PMA_RWXA | PMA_NONCOHERENT_MEMORY) 0x0>,
+		<0x10 0x00000000 0x08 0x00000000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY | PMR_ALIAS(1)) 0x0>;
+
 	aliases {
 		mmc0 = &sdio0;
 		mmc1 = &sdio1;
@@ -42,30 +48,6 @@ led-ack {
 		};
 	};
 
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		dma-reserved@fa000000 {
-			reg = <0x0 0xfa000000 0x0 0x1000000>;
-			no-map;
-		};
-
-		linux,dma@107a000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x10 0x7a000000 0x0 0x1000000>;
-			no-map;
-			linux,dma-default;
-		};
-	};
-
-	soc {
-		dma-ranges = <0x00 0x80000000 0x00 0x80000000 0x00 0x7a000000>,
-			     <0x00 0xfa000000 0x10 0x7a000000 0x00 0x01000000>,
-			     <0x00 0xfb000000 0x00 0xfb000000 0x07 0x85000000>;
-	};
-
 	wifi_pwrseq: wifi-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpio 37 GPIO_ACTIVE_LOW>;
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
