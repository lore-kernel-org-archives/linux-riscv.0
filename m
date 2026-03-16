Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFC6F506D9
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 14:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqFDA1kYeItSnOtp4ZbjEHecaZeqyuUmUm8nk5wSTSU=; b=ReakKJ7m+oSCIj
	eGkOHk0yzHfRzz4ktLEvATC2IlRllTICWqxZM58lMIxBCKYSLU8EYa1HO5F0B6tkVIpTPZIRu+FWx
	CyiTldYXFMgrXElyt/vEuPwi8X1i5AYKxl60A1i+g6dzRilnKy4C7KyM0RTiDe7qAN9XK32e2jLiY
	2KNcW//rlf8D9IwHfx722tSAvAciUJ8Ov7m81bwAcwxNT77+3B3mIKxd0DXL1Cbh2RWhwQWAbqUp9
	EjtHAuT3ZPfRXkPOZf567G2/MAH61nrq3ZRzBNjqpBYW+CHrHzgSEgWxeCQL+EmL7v8X8RoHdYud5
	hD+yJYy3oL5InpIEInWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28lb-000000049qv-3rkm;
	Mon, 16 Mar 2026 14:17:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28lY-000000049py-3AWV
	for linux-riscv@bombadil.infradead.org;
	Mon, 16 Mar 2026 14:17:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=O74WQNc1aV3W+cT5lrJjmSbPvv2lawW0j0OjNB+99fg=; b=hndCV6iqafpF/xUnmUVAJq8CmQ
	pOsNEn9b/6iJ1d60W0J4syttD2LV2caxc1RJT4r2nQu2jGzUNuP6/PnGWTcqiqAfr8POEbHa6YCts
	t/z9MJBRsChoaayp1XY+F7DR10vkSYY/ImVAWf64EBV+FE/2shaNbQe4K8JfeSNfvN4iWk/vJIq9D
	5/D76EMAJOL4UhrNmHZBhqgf1UbjQjJw8aGLTLH9SYSXR/LYiEutAKkTq+HYI88rmvDyxnuotRim/
	OlbnzGh+q8zyowTmQCBy+g2FNLlZiZZyTEwi+RKorQ+MGbBW/McbmrmnbRbzMleIO75SqYDDydqda
	I095JDMA==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28YV-00000006tci-0aWo
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 14:04:28 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso42811505e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 07:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773669865; x=1774274665; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O74WQNc1aV3W+cT5lrJjmSbPvv2lawW0j0OjNB+99fg=;
        b=TGaCTjSt7BW5MKbpPrY2bJoI/pSSKRcfNuozcxe3MIegdLWu8lIDYRB1/RasIGDrsB
         UBwPl+fJRe7rgWoCQURHVl+cbMd66Qz+Kp4MME/9YRVszqDtnvHUBZ6LR5PiG6/GK7sV
         2QDJJgdrDhk17gKnh0kZgr8pglwx1L+IGJeZn0+Q/xCNPcXTT68/Hw7+XAZdxxlwXpPD
         xwZcuFcU3ZVoQZeMpnhIaygihOlxjDJoOeCnsydfZjnySKTLFX2LpdyFppIKEJbvRXw/
         xwKWKmrSRj6+as2fWGCHRH4WWOMydLjt7ugi9GDyRiSQHfxwgKYnHX9prwRGrnXfSWDg
         XE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669865; x=1774274665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O74WQNc1aV3W+cT5lrJjmSbPvv2lawW0j0OjNB+99fg=;
        b=Tfkvj+vKLfgsAl22VNP+UwX7DWa0aG9AGfjpODQLM2dZIELEMkWVOwfBpgJsqjcI7y
         VRYYhgm3eleSjkesPC3iL1yuqoxUuSzbtEIQ8Kap21Z3Kl5JG1lO4uWUerEHJk/YP80+
         Wfh+ysQHnSkIJjz18Db2xaYh6jnvLApYWuo3na+MmFuzsYzzn/on0+bGVRngiz36HqzN
         rzbw646NEH3EeOqvYOK67TFYBQ4pNroF1BmptVWdX34hqExE3ER0Ui82iOiiCV0wwJbZ
         753HchCuOvxoG0CqlmAXXPGlwf0eXyphYZ/e7COdqXAWFJX+TD2Zktr/e/JrRyLyqb32
         CYSw==
X-Forwarded-Encrypted: i=1; AJvYcCU9dribs4EY/22Y+AZcwYY3KcFRptpzFWAPCFbetPGisNhKlyA7ki7O4HprfiyJwYh9saq6GL33f3k9YA==@lists.infradead.org
X-Gm-Message-State: AOJu0YysMHLSF3jNGV/UCQiUkRH58iGESmtZ+5ASZ4NcUstQknmG/Okw
	1yhF4CXtZuiO2oxSQeqT13Yvj8pZZ61HNxZN8Dtn66OLWEZ8cdohmOgU
X-Gm-Gg: ATEYQzxxmVabMm73PEcRRPVnAbCHuS79roR8CT4Qgffre9E58AGtUNV/aNzAHk4kKeC
	AN0tnWlYvcbxAbDW1wnC1+MksFyIyxtriBWD8AM7B1XluOrhlvoSZjE0xDFmZbXnmsZ/K7LSOaN
	W/lpDhbGvO0e2UDak7YD7nHSCpksNISmmdAGnIPCQfZ37m0ynG7xcISEBDXPcV1cOYWQDoC06ri
	kRPnD4ATtwX7WmGxFJd2g6CtW6+CwSGjPVNUbf0x9jhjpxsrrGqkWz7JP5wmMCbQgl7KCgkYj+H
	6OL5HZIUl7iBjeIAO05QSCKK06r6wGijpS5jloOQDehpB5+AQsvrONjFgX8Fpi5e0Hro7cP6rgc
	fds5HDRpIFaF4UePcn1ybcwGZiv0E1nE1IlyS6fAfg8+cTPXS36tKXehGp913HL9bXaEPEQp2uN
	azugqRpsDuuMlshMF6s7rqM5LzmPvpqJ/hZtgcaMHwpLeEfpvXVKoqmRwAn+JNqJ7U
X-Received: by 2002:a05:600c:698e:b0:483:1403:c47f with SMTP id 5b1f17b1804b1-485566ca5cdmr217587185e9.6.1773669865177;
        Mon, 16 Mar 2026 07:04:25 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.234.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm20698725f8f.0.2026.03.16.07.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:04:24 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 16 Mar 2026 15:03:29 +0100
Subject: [PATCH v3 1/7] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
MIME-Version: 1.0
Message-Id: <20260316-orangepi-sd-card-uhs-v3-1-aefd3b7832df@gmail.com>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
In-Reply-To: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_140427_305508_69622698 
X-CRM114-Status: GOOD (  10.12  )
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
