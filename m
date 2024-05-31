Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4132EC27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 07:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RofHJso/JtAxyoVoHe+tg6ONZMRF9w9BPbxqL/DD0bw=; b=r0ZE+9Ef7G9X37
	cdvrBPkRt2mbahhyfVh6xrzZO4MZx6ZOTAOccHbHOR3FFJqF3lm4COJ6QmUvBObcXdj5TNsjuHG7V
	QJxpIx6NL/nAyaSwyhwqv1FFimcKrfuriVc9Yw2AV+5rTyR3rpHFaeHmHctSQJIDKorCwExGDoSl2
	7NZPP90sYDcS9DXmWmPJlbl92VSmWUlZT8So4BgW4CRau+UEL4Tw7DDkmzQQ0gUCs/FnMm6/J7j6Q
	fFfj2QvuLo38bZaxnqT3QhoaGBbmfT8TCEhlHSFl78UwtzgyBPrp9YMK4P5J+vstnAwjsFWse9sA8
	X7nBjag7A5I5mJ4bszmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCwKs-00000009SsY-3yyl;
	Fri, 31 May 2024 07:05:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCwKk-00000009Spw-0t6O
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 07:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1717139150; x=1748675150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uQRwfODC5iTuvYyr2nM4AkwurG3nP5PWSj482gaZt9s=;
  b=zSnLjC92qRXT4Gnmqir2Cw3GFh95cTUvKwZ99VPZJRLZtwtn8yqMoo0j
   MR5EMN50Kz/pVip/GcUhWfWp7UuG19gAanxWCtUYRwAusot+FE8YeRfiN
   TdzYXkBycAlcn+7cgHBo4Y45HBV2RPIivQY0NBtBjC70DZ+qXrdmTwc63
   fomQ/yTt8U39nmOGJHp89n+G4MXXqBYD0QQktJ6TOGZNp+Z+LnaIa79C5
   xGckxKkLTPMfiS+0yg9nA3fTZ/HYjnjhUnVviwT3DsL2J/b9mxrqR5fS+
   9PbCosjZ2Om4xXNaZ3bBjiPcwS4ulpRPzT9CS0vz88uAnfYkCvVp5vtL0
   g==;
X-CSE-ConnectionGUID: YBLIF/bfSzSBNqzeook+qQ==
X-CSE-MsgGUID: qlSQJNvdSiSJKfZJ951vyw==
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="26795688"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 May 2024 00:05:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 31 May 2024 00:05:29 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 00:05:26 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-usb@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Bin Liu <b-liu@ti.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/2] usb: musb: mpfs: detect UPLI external vbus control requirement from DT
Date: Fri, 31 May 2024 08:04:32 +0100
Message-ID: <20240531-spilt-garage-ed2113d628e8@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240531-citable-copier-188d32c108ff@wendy>
References: <20240531-citable-copier-188d32c108ff@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=988; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=uQRwfODC5iTuvYyr2nM4AkwurG3nP5PWSj482gaZt9s=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmRZU0N1gXVX+7MDY77Y5XF/zXHL/ZV8Uy2PpcPui7WnyLP v3bsKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwESWhDL8T/Y0NCt99u+QUUHy3f9xrz 98Ubib935+TeK/1RF71r584cfwV7ayIHt9at/b0BYhxSmrLhyXFVLJmuI/6U6YwYZ8v++ZTAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_000550_338756_45145861 
X-CRM114-Status: GOOD (  10.52  )
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

The musb driver core already supports external vbus control for ULPI
PHYs, but none of the drivers actually enable it. A customer reported
needing this for their device, and now that a DT property for detecting
this configuration exists, read the property to enable the feature.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/usb/musb/mpfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index f0f56df388355..29c7e5cdb230e 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -190,6 +190,8 @@ static int mpfs_probe(struct platform_device *pdev)
 	pdata->config = &mpfs_musb_hdrc_config;
 	pdata->platform_ops = &mpfs_ops;
 
+	pdata->extvbus = device_property_read_bool(dev, "microchip,ext-vbus-drv");
+
 	pdata->mode = usb_get_dr_mode(dev);
 	if (pdata->mode == USB_DR_MODE_UNKNOWN) {
 		dev_info(dev, "No dr_mode property found, defaulting to otg\n");
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
