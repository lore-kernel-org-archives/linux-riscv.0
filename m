Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89F7C3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 08:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AGhPukx5dPIEBty8M4RoETE//C1llILOBck28hTovo8=; b=fo7BnyhTHvY2FI
	zwz1BWgQ5UboKjJAUxMQoo4fQN3pMWARyBmIn39KY5XHytbTxtqeBP5yr3BJ6u0vc1QYHt4wb2fmS
	Y9GSns4e2ob88CinCD8l/Lr/S2DK8geD10dz9RqbOFak2m6ugEIQI9leLDMoBTGhJc6zpHTRUx+GA
	nq/qgHsG/APZWOulNXfOzR6+V4IbQnWk6vI8prtrg95OiImtrbSbyBPgrF1gi1hhZtnsX6reMA6Qv
	TwaWFVQmW4G2DMcTLUl314aiSQE9R4UH4PpjOdh74UgX6xlNCs4DZGF43BoDLKFvs6ek1daQl0Qm/
	d0eYLbzcPZ9VrE2IGZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjFh-000000028PH-4B4u;
	Fri, 19 Jul 2024 08:46:10 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjFf-000000028O7-1PaC
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 08:46:08 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5ccfdc3157dso767572eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 01:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721378766; x=1721983566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oydJeqRMAIcWXHWtFSpsEnC22p0yugXf58j/ILvTUj4=;
        b=Uq1j+ZMzQCUlGLOsGj0Jfng8+siaiziBsaEEbaLCgB+jn1+NMfSm8OtQQjRKc5RoFD
         0J7n4qPomx76oRkcvriwpvDIi4+OyqVUq48aV837nHRkNyQ6Gn1Rvu1FUfZ8l1Klu7Th
         lzDVIeDUT/1MGGdml/nEoOfF5EmjiByjiTS6HWVCdz/5ZAGFFYj1Hohg6yHosQO/qR+c
         LQbr8GlIktulKeIaCPzT44KHEmxcC0WYhlOd3p8YwLKUdvGe1G10cb8d1pZa1/+OjxJI
         01C6gHyrqnsmmtTe8sMOEvaTzaeav0nhOiSdv980ENFpEOoui/OnEDJGT+DvDsutlEiK
         hDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721378766; x=1721983566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oydJeqRMAIcWXHWtFSpsEnC22p0yugXf58j/ILvTUj4=;
        b=QDFrREUNZQNuEtQVtp2uPJRfsyP7VhMRMyqQlWYwQMtlDmvYYBAy/zaczGlzVHeJki
         kzBDhDMY004D/at6urxemIeNWcpVCtn3co65VguDhZ2k6/41dMRSAjQvah++ojuWLqqW
         MYdAe3utAGyrD9rzNgkxTUVqMmtojMKdKr2JfDLe+jVrHk0QGrgjTmA1sP+7KJ+CljsE
         U9hSq6tiAJrYp+MrlSXh2wHjH+SCrlBTZO8vHlZwdrSrvlYVa/beKGpYEp0wmGAvZ5lo
         APb/5ioF6gxj6z8Rl0w9qt8RXsZEwPUWpVUfN2B6I9jQfnIDENW409s6RMfL2TJo4Hx3
         cCTA==
X-Forwarded-Encrypted: i=1; AJvYcCWphVPxDRwEy3nQ4Tf/Nq7q56PZM1qwsx+im4JLVrGNlfBxTJaGyT/ReeDo6wkEB2rjaSrz7d0rAEUZi7+gfpW2HOw3/9RxqQW1V316M1+D
X-Gm-Message-State: AOJu0YzNvmgad+1oel1VpIbIVgGtch14KfFQsIPDJD3VPmBFKPd5Ym/x
	z2rZsJabcsOF6N+wPQ9ZuSXq2Y7WPNi8CKG68QVCiFDxhc+kkeyN
X-Google-Smtp-Source: AGHT+IHn4qha4kbRrWIiX+a0mGhPKxilYgIXp1gDMiIDeE58q68IhDxPbZIJpjFtfNBe92nq4RZ4Hg==
X-Received: by 2002:a4a:d018:0:b0:5c2:260b:305d with SMTP id 006d021491bc7-5d51f967addmr2896107eaf.2.1721378766628;
        Fri, 19 Jul 2024 01:46:06 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5d55a7fa3a6sm177640eaf.9.2024.07.19.01.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 01:46:06 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: adrian.hunter@intel.com,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	ulf.hansson@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	tingzhu.wang@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v5 3/8] mmc: sdhci-of-dwcmshc: factor out code for th1520_init()
Date: Fri, 19 Jul 2024 16:45:59 +0800
Message-Id: <b774f2b62d68edab2d95d9dbd1f55cac50c6abff.1721377374.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721377374.git.unicorn_wang@outlook.com>
References: <cover.1721377374.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_014607_402824_14550B92 
X-CRM114-Status: GOOD (  14.31  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Different socs have initialization operations in
the probe process, which are summarized as functions.

This patch first factor out init function for th1520.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/mmc/host/sdhci-of-dwcmshc.c | 51 +++++++++++++++++------------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index 903fe06050e4..bb0adc2ee325 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -830,6 +830,35 @@ static void th1520_sdhci_reset(struct sdhci_host *host, u8 mask)
 	}
 }
 
+static int th1520_init(struct device *dev,
+		       struct sdhci_host *host,
+		       struct dwcmshc_priv *dwc_priv)
+{
+	dwc_priv->delay_line = PHY_SDCLKDL_DC_DEFAULT;
+
+	if (device_property_read_bool(dev, "mmc-ddr-1_8v") ||
+	    device_property_read_bool(dev, "mmc-hs200-1_8v") ||
+	    device_property_read_bool(dev, "mmc-hs400-1_8v"))
+		dwc_priv->flags |= FLAG_IO_FIXED_1V8;
+	else
+		dwc_priv->flags &= ~FLAG_IO_FIXED_1V8;
+
+	/*
+	 * start_signal_voltage_switch() will try 3.3V first
+	 * then 1.8V. Use SDHCI_SIGNALING_180 rather than
+	 * SDHCI_SIGNALING_330 to avoid setting voltage to 3.3V
+	 * in sdhci_start_signal_voltage_switch().
+	 */
+	if (dwc_priv->flags & FLAG_IO_FIXED_1V8) {
+		host->flags &= ~SDHCI_SIGNALING_330;
+		host->flags |=  SDHCI_SIGNALING_180;
+	}
+
+	sdhci_enable_v4_mode(host);
+
+	return 0;
+}
+
 static void cv18xx_sdhci_reset(struct sdhci_host *host, u8 mask)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -1231,27 +1260,7 @@ static int dwcmshc_probe(struct platform_device *pdev)
 	}
 
 	if (pltfm_data == &sdhci_dwcmshc_th1520_pdata) {
-		priv->delay_line = PHY_SDCLKDL_DC_DEFAULT;
-
-		if (device_property_read_bool(dev, "mmc-ddr-1_8v") ||
-		    device_property_read_bool(dev, "mmc-hs200-1_8v") ||
-		    device_property_read_bool(dev, "mmc-hs400-1_8v"))
-			priv->flags |= FLAG_IO_FIXED_1V8;
-		else
-			priv->flags &= ~FLAG_IO_FIXED_1V8;
-
-		/*
-		 * start_signal_voltage_switch() will try 3.3V first
-		 * then 1.8V. Use SDHCI_SIGNALING_180 rather than
-		 * SDHCI_SIGNALING_330 to avoid setting voltage to 3.3V
-		 * in sdhci_start_signal_voltage_switch().
-		 */
-		if (priv->flags & FLAG_IO_FIXED_1V8) {
-			host->flags &= ~SDHCI_SIGNALING_330;
-			host->flags |=  SDHCI_SIGNALING_180;
-		}
-
-		sdhci_enable_v4_mode(host);
+		th1520_init(dev, host, priv);
 	}
 
 #ifdef CONFIG_ACPI
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
