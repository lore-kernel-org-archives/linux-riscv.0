Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DB9C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 09:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zbxOUIMcaa52xkF3tEg6vuVvw8XrB5Qb2mzK5/MxgNo=; b=c+f1939JOaqCD3
	IKXIe6RHREzwk/yuMW6TLgXGO0EPcdVGIQe+3Fm5YXgRiyGK1GvonpnT9nmNGfqxFqijbY3Sn5r+3
	LJX/9o6zfaYgYIrnat1/XsUv2hRe/7ZOM/dAFEqGUfvrK112d3OWeBeJmqzMKn5exuERXKvU6oWuL
	qd9iHEcxyNQF1jVPgJZsvmHwYVGQcry5MaChNTmAqUgXxZ7LRRxHXgkMcNfWk7L5M4qpWG5ctCa8q
	4RjwgJskqtuvTAlsI/YKaK8gYb6wPO6s1HHqxPj44V+ZyPC1q2r9ZmyEjp6/CY4pizn4A77QdlZBH
	zJSzF8d0b0246Ry/ebsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1satr1-0000000FFdz-1Qnk;
	Mon, 05 Aug 2024 09:18:11 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1satqy-0000000FFcn-2TUt
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 09:18:10 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3db23a6085aso2821645b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 02:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722849487; x=1723454287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfW+yJcH0UPgHr9h+kry6dKwgvMmuDMaA8IPcQFaE90=;
        b=EIFVzUi3JpEOI+8uAgjIbrJ6jo183qc+ZLQk6EGGEj1KRKUWohE717Jndxlq0cPMq0
         XEE5vFFvYhRjP/d028kmsUaxe5lBXTANQduDKCMm8GgMXRujqTzp/cwJGJigLfrjcq6e
         0BEbw414L4UDZGJnl2rxNVRmJhO49b6qZKouGKhzE6VyC6PtBvxmp7L7ljkr/Cf3sCOV
         06Eo0Tk9OsM+ANF+cuwkFNgODmZkyXVKvsalhO3mLUUgHxcN5R+Np3j//+NLVoB0vJRX
         Vm/1ciNFEv6UjqQrJ2csxVNSAd/t8MCzbA+rPCeHeyrojThoUgdg+5dbZNYpzTAu+msU
         PFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722849487; x=1723454287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfW+yJcH0UPgHr9h+kry6dKwgvMmuDMaA8IPcQFaE90=;
        b=mAc2eCJSIb+Toz+PnIuas2BDMaE1IaKVow4yLmHXrnsTtmUv5j7Mad/i01I3Tdu3bF
         CrWG473jdvrIJxjbTT9Q/elGmVuJwE/vXSrA4mb13qoABVNQxA+JC8TGdOf6N0uuQDdI
         3kq3QuxcQDG+TbHikTztGXGQ+Dt/MnH4MRmGQ+BqjWgPYDLuaLUpwJy3StTO+NWDlRQp
         Mzn+7Z1PNSpCabRUWTQCy2MjrLpM+PXDibDdfxDhQhZ1vVkPexJNiPWxyhnTJYGVjEGU
         RS2NA8NVfzwt48+UREdp7rooiVUfwoV7QmKc0ifQAC2mdZ17ew8oh7A6ov/AzNmps/oF
         HowQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUaNxTUElBIin2pYHM90dTk45Bv86/PXd8OGIN6ymzeLr+fJANviFwozqWxkZXOrFXqRgTQyEGle8V4iU5H76Ffk7Wg1wTnnGp+3KvBt2s
X-Gm-Message-State: AOJu0YxtY4KP1z6p9CbzBmpRywHnIXp8zEbrrqMi7BS7Yu385dHoZiD8
	2/xZ5vpKoM/FdQfpMFg9bZbtd2LMZ2NGWd0KTC9QB+6IEY2V+02R
X-Google-Smtp-Source: AGHT+IFbBF3lExmEwSsTcYdXzKwjXYiy2njdzQYc05gkHhL2aT6+SgSAyFcfMhbQrS/LyC+XIkUjzg==
X-Received: by 2002:a05:6808:6091:b0:3db:2025:110 with SMTP id 5614622812f47-3db537ecc54mr4533948b6e.11.1722849487166;
        Mon, 05 Aug 2024 02:18:07 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db56371007sm2520804b6e.17.2024.08.05.02.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 02:18:06 -0700 (PDT)
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
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Drew Fustini <drew@pdp7.com>
Subject: [PATCH v6 3/8] mmc: sdhci-of-dwcmshc: factor out code for th1520_init()
Date: Mon,  5 Aug 2024 17:17:59 +0800
Message-Id: <23c6a81052a6dd3660d60348731229d60a209b32.1722847198.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722847198.git.unicorn_wang@outlook.com>
References: <cover.1722847198.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_021808_654405_411532D3 
X-CRM114-Status: GOOD (  13.88  )
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
Reviewed-by: Drew Fustini <drew@pdp7.com>
Tested-by: Drew Fustini <drew@pdp7.com> # TH1520
Tested-by: Inochi Amaoto <inochiama@outlook.com> # Duo and Huashan Pi
---
 drivers/mmc/host/sdhci-of-dwcmshc.c | 51 +++++++++++++++++------------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index a002636d51fd..b272ec2ab232 100644
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
