Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3991C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 01:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKQ5UdJgRggziroMCcMg19Wik3XU01G80QAUZkGDPUA=; b=2SX/iudQl0JCen
	zU+xDwHkE5KOyilQXDbHRYHtkN6flNfQts5KKvgXMeQmp+ACnJdqGOqbpted3UbRUL5/9X3wAn9cV
	i5/D3RjXngxwU753Lp39sHruQ/PLbDGqppJ1ayCdthsujOkJ/IOVPYm6Jj3i0cgWOaA3Pl6ita0Bf
	wmJ9I5EIFxg/PqpcBciT26AcCpvJZd1TAXnK/+ZNjABbU7Ufbd6dbULOuFaiejCjSCtAubAkojfQ6
	HHS9h+iyi4e8lDQe25rW/StvbhIo2h3Pwt1DhjYbi02ucfDWXFXMfgPLzUrkqydAdM2znOXdvoFzQ
	1WdUlmBoOowgp+KT6YFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO6Q5-005nYi-0K;
	Tue, 25 Jul 2023 01:00:57 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO6Pz-005nW3-2E
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 01:00:53 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6b9a2416b1cso4132077a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 18:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690246850; x=1690851650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opvEmLJsr/QQbcAlYd7WXi8TiNCEs7ncHrT0RHmS9/8=;
        b=QGoe5U/cP6/JbKqJ2W5R5HXMdXWcI91myJmhZF1IcmmVVSMcPgkKaeSWv5OJfkEccC
         yp/s4zDNIarGcJiUYx5+ZTwZ5UIX4G3IcMzxlJs4feySRwTBUTjqTYA27/yaDEy3V8CY
         abf2t/PC6WmZY90evepLw57upZ9kjMa3Jg5S1Ff9GpkANmpR5hoJiBHAbanMqK3mmr6O
         5NxG83iWzYRgIzALFAGGsLa+gMzAbKY2MkB3OGhyZMD0UZfQMXhv3Pm+YmCIAIVbDcbE
         BPMqRONQbROtaXI3POURwQI+4nj0zo3tX/P3mS967ApjQYEjlNoRkIpTgT7WTm+kWLez
         xaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690246850; x=1690851650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opvEmLJsr/QQbcAlYd7WXi8TiNCEs7ncHrT0RHmS9/8=;
        b=BV53KR3ZYVd5BQ5hVvL24k2osF+J+H6rZAzeWxBndUjyznvyam68YQ4EYQxWzXv+P7
         o1V4taW3uKcWatDKcykpG40vCjBicIwulcB5OH/8YWFm3paDEEmW+B+ewOumEYm6MJIz
         kwZtWVMjIWx6z8A0+HZQaI6Urg+a8r0ZNOQocxYnfV8ReqakxfCCccbBU5+DKre9PDB2
         4gqZRT5dwEwnufSKTque1jIjMyxXPpF24Xp4rt3JB3If97uIZVMvRgJtaI34wJFoTCKi
         2sTP4HhtHQxmP+I933EaIbPWTusd1U+nbWmKAetR/3g5iBKWg4qbVGNl1pJB//moQm6H
         I8jQ==
X-Gm-Message-State: ABy/qLaAeeYX9VQ1pi1aSEklbfU7VbUHVvlKsqiENQKtFYo7XlUWYOJ+
	a0jSYYUWCJRy97LBmx3nASUOi33uXM/WHgWtWS9Jig==
X-Google-Smtp-Source: APBJJlFDeeobTYnzUvjxmtkYRP6WYbZgY+v3A6Ooy7WVq5IX/yf+RwYi1xQ5rYaKoTw+cyA52VX00Q==
X-Received: by 2002:a05:6358:921c:b0:133:84c:183b with SMTP id d28-20020a056358921c00b00133084c183bmr6561984rwb.3.1690246850219;
        Mon, 24 Jul 2023 18:00:50 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:2cbf:9196:a906:e222])
        by smtp.gmail.com with ESMTPSA id h18-20020a62b412000000b00682a75a50e3sm8576900pfn.17.2023.07.24.18.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 18:00:49 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Mon, 24 Jul 2023 17:59:18 -0700
Subject: [PATCH RFC 4/4] mmc: sdhci-of-dwcmshc: Add support for T-Head
 TH1520
MIME-Version: 1.0
Message-Id: <20230724-th1520-emmc-v1-4-cca1b2533da2@baylibre.com>
References: <20230724-th1520-emmc-v1-0-cca1b2533da2@baylibre.com>
In-Reply-To: <20230724-th1520-emmc-v1-0-cca1b2533da2@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 Robert Nelson <robertcnelson@beagleboard.org>, 
 Jason Kridner <jkridner@beagleboard.org>, 
 Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690246840; l=3367;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=WInr0KFI/7RNGf1vlxj94FbnpVdO/HALVPPXj1tclFA=;
 b=CBoelk9cIZQkR6tFrZ3ZtNCai9EU670gQqx42gBZSNRwfdFkWvgCd5AOai2jGe9yXUz2Wgg+S
 2UO2u/9flbcAZY3uJy/ldFwYzG2mR59LbFDFIOO1M0zIiBQxWyaI9oW
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_180051_730968_93ED4D50 
X-CRM114-Status: GOOD (  18.47  )
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

Add basic support for the T-Head TH1520 SoC mmc controller. The new
compatible "thead,th1520-dwcmshc" enables basic support by:

 - Enabling v4 mode to properly communicate with the mmc device
 - Setting quirk to disable ADMA
 - Setting flag to disable SDMA and force PIO mode
 - Turing .reset op into a no-op as the driver does not yet know how to
   configure the phy. Rely on the vendor u-boot to have configured the
   phy and do not reset the controller in Linux.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 drivers/mmc/host/sdhci-of-dwcmshc.c | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index e68cd87998c8..8573aff25a81 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -337,6 +337,14 @@ static void rk35xx_sdhci_reset(struct sdhci_host *host, u8 mask)
 	sdhci_reset(host, mask);
 }
 
+static void th1520_sdhci_reset(struct sdhci_host *host, u8 mask)
+{
+	/*
+	 * MMC controller and phy is configured by vendor u-boot so
+	 * take the simplistic approach of not doing reset in Linux.
+	 */
+}
+
 static const struct sdhci_ops sdhci_dwcmshc_ops = {
 	.set_clock		= sdhci_set_clock,
 	.set_bus_width		= sdhci_set_bus_width,
@@ -355,6 +363,15 @@ static const struct sdhci_ops sdhci_dwcmshc_rk35xx_ops = {
 	.adma_write_desc	= dwcmshc_adma_write_desc,
 };
 
+static const struct sdhci_ops sdhci_dwcmshc_th1520_ops = {
+	.set_clock		= sdhci_set_clock,
+	.set_bus_width		= sdhci_set_bus_width,
+	.set_uhs_signaling	= dwcmshc_set_uhs_signaling,
+	.get_max_clock		= dwcmshc_get_max_clock,
+	.reset			= th1520_sdhci_reset,
+	.adma_write_desc	= dwcmshc_adma_write_desc,
+};
+
 static const struct sdhci_pltfm_data sdhci_dwcmshc_pdata = {
 	.ops = &sdhci_dwcmshc_ops,
 	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
@@ -378,6 +395,13 @@ static const struct sdhci_pltfm_data sdhci_dwcmshc_rk35xx_pdata = {
 		   SDHCI_QUIRK2_CLOCK_DIV_ZERO_BROKEN,
 };
 
+static const struct sdhci_pltfm_data sdhci_dwcmshc_th1520_pdata = {
+	.ops = &sdhci_dwcmshc_th1520_ops,
+	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN | SDHCI_QUIRK_BROKEN_DMA |
+		  SDHCI_QUIRK_BROKEN_ADMA,
+	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
+};
+
 static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
 {
 	int err;
@@ -434,6 +458,10 @@ static void dwcmshc_rk35xx_postinit(struct sdhci_host *host, struct dwcmshc_priv
 }
 
 static const struct of_device_id sdhci_dwcmshc_dt_ids[] = {
+	{
+		.compatible = "thead,th1520-dwcmshc",
+		.data = &sdhci_dwcmshc_th1520_pdata,
+	},
 	{
 		.compatible = "rockchip,rk3588-dwcmshc",
 		.data = &sdhci_dwcmshc_rk35xx_pdata,
@@ -546,6 +574,20 @@ static int dwcmshc_probe(struct platform_device *pdev)
 		sdhci_enable_v4_mode(host);
 #endif
 
+	if (pltfm_data == &sdhci_dwcmshc_th1520_pdata) {
+		/*
+		 * The controller needs v4 mode enabled to properly
+		 * communicate with the mmc device.
+		 */
+		sdhci_enable_v4_mode(host);
+
+		/*
+		 * Set flag so the SDHCI host core will disable DMA
+		 * and use PIO mode.
+		 */
+		host->flags &= ~SDHCI_USE_SDMA;
+	}
+
 	host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY;
 
 	err = sdhci_setup_host(host);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
