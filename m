Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597C3EDB7CA
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NX3ehcAPhYxTkwgu6jU8+S1n+gwlMl3mrwCbMJGi2xs=; b=CKBaVZAKbFIGuV
	ncab9xOawUnKbYrc40LyLtse9HD7pOqBJjj4x7csMZuVYCMEiwBWzeFP/xY+//ADpGv6JXIyrJHLL
	xD2hWLfdOIY9rUVapjgjlec8EI0ekAB07rV8qG+Grkh1cOiX7qMrXNGtiyCKx7AAkcGFrS0aNwwq7
	sxxeeodvp0lEw/FoeQQxNGHh/Sn/wQUWHf1KREQvCDcA8EIZj+jCh4072ZEbtvGgLpnq3thHJF4Cl
	4EvFGsqHqsyVzLcgPTqFBHzyragWcFx0Y8ecdnV8vcy+OjTJVffS3pGLWEdx3xoZlGNzR07IwDzBa
	bOGgIt+nm5MjQWWfJxyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1l9-000000068el-4BXT;
	Tue, 07 Apr 2026 08:26:08 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1l7-000000068dq-45he
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 08:26:07 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so4169450f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 01:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550364; x=1776155164; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peA/baapFwTx+WaActDGaVNbab5ZZYgiEvN0ikh1DXM=;
        b=dYzkd5xcNfmbmBZap4daOVowuwIwHLAQdgLfwXPOUSwLK5581/zUeV/BuMucms/Njw
         mpxcefdSvdc87V3A3k1OifF58EyaS+2KzZVSsu9MoQWsYKwHeNa3GyNUYKCqfczWTzAG
         x0ouTB/dakqe4AeR9MY8Mj+RgJfRxju8BTyswRaGOa9q11hWv+pew8MEqX/NfwfOS2KU
         rEk+EX3xqqUN0EUVeBK9SEWHzQ68s5VtH5FvQfXm61u52LvALnotOUmysIFuYoHSYhMK
         DVrS+eV5Z0DH4CWkq0hmtu2TIh7+qBlxlNfiECYQxnlePze0feo7HouGdvCIHEAa3T2r
         C0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550364; x=1776155164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=peA/baapFwTx+WaActDGaVNbab5ZZYgiEvN0ikh1DXM=;
        b=jGwaw0wjg68z1flwuZAZz9iiPmqG9k/n0/nlOBxo/diWAYvEiPBihkPTalY1/iLb8r
         OdbaAO8c+ZblMmCm2sNgrw113GOfBinHI2efCWrKquX9MWpx6W8kKOHFjgz/l3B87mMI
         WHcWlLoE6Eglgi1nyZ+zLuGaWWedGPQvR8FZ1YjKYnIuNs0wexa0Jlpuj3xUmVb3TGAR
         h97LPIfORZ0zw2hgvRK1mhw4zWz9d1urkE2rdqCUS3EJjvK9OffNaKlUogYXNz7AXc3V
         RMj80WUVknjaG+VC7LGucZxEJ7L5AI+JsFZE4h91sFITU13WAdkAhcPqdyoIyX4siLo4
         AtyA==
X-Forwarded-Encrypted: i=1; AJvYcCVqJnnm4t9lfl9+D7ydLNyv78YYt67Fl9HEvYD4tiTfmRY/l6Icy1LWOm2jeDF/V8QwgYc3YSZVRwJ5pw==@lists.infradead.org
X-Gm-Message-State: AOJu0YycnjDsLz2GsjqD0NQKzA/t+QVaWG09ewtn8G8LgFaDILrzhFXh
	14koRmSPnQkh/nGjYCt+c5m5tNEzRjsRsyC8jq+IAbntXFCc2zElqlJE
X-Gm-Gg: AeBDievZZFCQMroJAUZ17b/hQKyRMHDTIEDj/8aOjxy9/BTPaxp6K8zIfo6wKUYvOA8
	A2uIvvCZPP+4MD3Bi+M1eTF+8gXYNLKfXsLI3xslpBv3MXr51a0PJoT8WUepj8yjATKrpPPtZLS
	vve3dYoNaCgRAo/ZHMWAG7pCmkd4t/7nXooFEweIz1/lGSbLQFsu6fnLGmVL5wLNUW+qkHr/pgX
	7+GMa9/nHZ++dQldcJXY/LviSFUeZAEjFuPaXvSE/XyRjKxj4yn/nk+W+uaA/PDeqp/Bj6OTCyu
	/Kk6IyJN2ecKL7gBRSNiLSu6fnRcNQMFRtf3/BgxhByAhXAzOLs9TbsrtHV06ce9DGWO5VvrVXj
	/jzd2cGw0jiSxtsXoPsKSl5uFHHh28SvIyCbvhVMtNgrtthe++TiBNSZe9i/rjXya0oGoNJQphz
	js5Ir50Rx8kl9YWsbt6NpLsh+yOVfmzVp4npTkaAeNZorXJC2ENdXhwWX5StBF+wxr
X-Received: by 2002:a05:6000:1446:b0:439:dfae:8083 with SMTP id ffacd0b85a97d-43d292dbc56mr23436623f8f.38.1775550363826;
        Tue, 07 Apr 2026 01:26:03 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:03 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:22 +0200
Subject: [PATCH v6 2/9] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
MIME-Version: 1.0
Message-Id: <20260407-orangepi-sd-card-uhs-v6-2-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_012606_054403_583E3EF7 
X-CRM114-Status: GOOD (  10.41  )
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

Ensure SD card pins receive clock signals by enabling pad clock
generation and overriding automatic clock gating. Required for all SD
operation modes.

The SDHC_GEN_PAD_CLK_ON setting in LEGACY_CTRL_REG is safe for both SD
and eMMC operation as both protocols use the same physical MMC interface
pins and require proper clock signal generation at the hardware level
for signal integrity and timing.

Additional SD-specific clock overrides (SDHC_OVRRD_CLK_OEN and
SDHC_FORCE_CLK_ON) are conditionally applied only for SD-only
controllers to handle removable card scenarios.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 455656f9842df90c7a94a290aeec22157b378fc1..0dd06fc19b8574ae1b00f7e5d09b7d4c87d06770 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -21,6 +21,13 @@
 #include "sdhci.h"
 #include "sdhci-pltfm.h"
 
+#define SPACEMIT_SDHC_OP_EXT_REG	0x108
+#define  SDHC_OVRRD_CLK_OEN		BIT(11)
+#define  SDHC_FORCE_CLK_ON		BIT(12)
+
+#define SPACEMIT_SDHC_LEGACY_CTRL_REG	0x10C
+#define  SDHC_GEN_PAD_CLK_ON		BIT(6)
+
 #define SPACEMIT_SDHC_MMC_CTRL_REG	0x114
 #define  SDHC_MISC_INT_EN		BIT(1)
 #define  SDHC_MISC_INT			BIT(2)
@@ -101,6 +108,12 @@ static void spacemit_sdhci_reset(struct sdhci_host *host, u8 mask)
 
 	if (!(host->mmc->caps2 & MMC_CAP2_NO_MMC))
 		spacemit_sdhci_setbits(host, SDHC_MMC_CARD_MODE, SPACEMIT_SDHC_MMC_CTRL_REG);
+
+	spacemit_sdhci_setbits(host, SDHC_GEN_PAD_CLK_ON, SPACEMIT_SDHC_LEGACY_CTRL_REG);
+
+	if (host->mmc->caps2 & MMC_CAP2_NO_MMC)
+		spacemit_sdhci_setbits(host, SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON,
+				       SPACEMIT_SDHC_OP_EXT_REG);
 }
 
 static void spacemit_sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned int timing)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
