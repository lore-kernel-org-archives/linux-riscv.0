Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00688EB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 10:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQuVeC6t0J24z9PyFkzRWhR4aixrg6+7ldgovnkEKec=; b=IU2OXHPPAmvc+a
	2BhTBPb0mwPyGj4W1mo3qwEePmkmpmZRHplAvtba5r3mMTRYY4chPxKmjjMRRm1Zqun+zuqZsMdH5
	HzTzpTVxkI42MXHX9X4C4E2fZ2o83502P4sQROCjcxYoWHrQVqd7/pbW5PcpdXBTTKMAvX2TCtwJE
	gyEv9+1ea3swWjvB6O2X3zXV24B8wehefsgDwOfUmBxKiHnB5Dx03xIenfIfv2IYsW7LAnZRrgzzD
	BTpwhqS9JyRm2NomhZKw02AwxXw8Ia7iFICbytKoP7X7fUbpx9NtIyixoNnyAsbTUGDhoXgsWf6L/
	Cr+uQ2btW7+7QY7pHBLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9O31-00BHFp-2x;
	Wed, 14 Jun 2023 10:48:19 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9O2v-00BH8r-34
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 10:48:16 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f629ccb8ebso8230160e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jun 2023 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686739692; x=1689331692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKG1x2TJZ8TijUzKSzDRuHBHShSw/jhXVj5kCAhPbSc=;
        b=EnC83bQMIav9RSbuOTpryxDbTLpqndkyoZ4pJ8p72ijhFLkgPUQg/Re0cm3f1047ex
         ZkrOPFgTe2BuEqKYqNw0r0/+9h4Eif34hp6dianM1mAnpnSHsYZtnkF2dueBK/qH31v3
         FF+MBP++VBA3D4haCge2to04ml7mvdMS6kzQ8RuMRLbeG1VlygbZucY0wDWa3yGqhoXC
         ZcgvOUJxZVmohztxfl6sIgslmne3EGvjPp4uSLycs3IRnsWE5FsAHLODgBqDctqLFH18
         I4uDrKXkKgleWCmLfrku+sy3mQcsr3n1gwUUJ0qcdEctbtqMVTHHOoKsqisrvuTMWddx
         H1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686739692; x=1689331692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKG1x2TJZ8TijUzKSzDRuHBHShSw/jhXVj5kCAhPbSc=;
        b=KuEnVOZV6Kq3zmOo3HDogaz+ji20vMNWzDYu50ek673scPCCWDw6ZrDEyIZXIXhGOt
         Qtk2YFRIVZ52YPFnphVQcnZ+gHvLZ2YgArCwSq0kXivi84+1SYBEhJBsNFIHrhjU7QWo
         7glODkdyM2VTpcRw/lOC1QNgQuaVLTRdoXRgHLOAP2sXSF6KDv5cf/zhKsqJgVdiaUoz
         vxtyUTroIGhVLteS/tFnNPUFALfRwLCIsC8GsN/QbZ/xYMoK7GX1PLtXZRLChKbwp1X2
         1HB3GjGp8ugs/OvR8U4ecvkAM64jVuS36rx7stOzNuKbH+D6xoocXFWpXZGPqTFlpTl4
         4ytA==
X-Gm-Message-State: AC+VfDzU00UjDxNdiK10v6fBoBjGl+0KydZMHd7P/pxNXfdWqPBsDH5f
	a4aBAFxljx1okN1yfyvvO2w=
X-Google-Smtp-Source: ACHHUZ50LsHwcrLV5KEYmFgnKen9/kwa7RpV1eepSXfCswQaFW1zBZZ4UWcwr8mV8l0rnra4LYqRwQ==
X-Received: by 2002:a05:6512:3121:b0:4f7:684f:8e98 with SMTP id p1-20020a056512312100b004f7684f8e98mr562465lfd.67.1686739691724;
        Wed, 14 Jun 2023 03:48:11 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:64d6:8737:b80d:a298])
        by smtp.gmail.com with ESMTPSA id y10-20020a1c4b0a000000b003f5ffba9ae1sm17154904wma.24.2023.06.14.03.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 03:48:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 6/6] soc: renesas: Kconfig: Select the required configs for RZ/Five SoC
Date: Wed, 14 Jun 2023 11:47:59 +0100
Message-Id: <20230614104759.228372-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230614104759.228372-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230614104759.228372-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_034814_010893_DA5DE702 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Explicitly select the required Cache management and Errata configs
required for the RZ/Five SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v8->v9
* No change

v7->v8
* Included RB tag from Geert

v6->v7
* Included RB tag from Conor

v5->v6
* New patch
---
 drivers/soc/renesas/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index de31589ed054..67604f24973e 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -334,6 +334,10 @@ if RISCV
 config ARCH_R9A07G043
 	bool "RISC-V Platform support for RZ/Five"
 	select ARCH_RZG2L
+	select AX45MP_L2_CACHE
+	select DMA_GLOBAL_POOL
+	select ERRATA_ANDES
+	select ERRATA_ANDES_CMO
 	help
 	  This enables support for the Renesas RZ/Five SoC.
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
