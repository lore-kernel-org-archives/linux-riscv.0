Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8B0C88E6F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 17:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d8RBp/87D1HDhhfm347voyqFL9nseIkyeEK7XoMEKj4=; b=mCa4h7+xkSLRQc
	h9J7BidIyyS/HK4H4UNPUvY4+X0zrRiU5nZnX6ciRV+PC+QrCE5I8SVnv7q85WwKfPCw4P59wFrgL
	Zk2F2P8OHFazw+fxtxbrWqCzeB4y+DFBbgH/iUiPstyIs30ZmJuI+b7Odh8m9zlKYxSUJdY2X80Oe
	LcWw2HJC3f+8qki5G5/CgOhiKE3VP9XFpC/hSr3pLXcRiHMnCkn+tAAA4BJzs8ThLJpMLHm/ad0DG
	qmnJ12JQpz7/KazbuakwL5rOMsUBMUpy5YxqgzprAVEteSCKlo5iV9Nz+ABJXsPD+/HGPRHqpf9Vj
	3KqNfhXlUAUixoEHshjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6AG2-00000004Mku-0zkk;
	Mon, 14 Sep 2026 17:14:18 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6AG0-00000004MkM-18CA
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 17:14:17 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2db22383fe8so16445285ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 10:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789406055; x=1790010855; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=chltb2wD8PD97rawmjna+iNh1esiaae/NnONMgkrsOM=;
        b=WwvSD3ayTqLSqAKa9Msgtqn0cxj1l+3643BE5wdlB+ZLsFX0XiVTe0WCarInxygBt+
         ZWfQPLraTrMfTrm/0hLnIHhUNjZ0ijuOZmwYKuQ6/ixcmZssFvAutRgEXpDzkiVw2EYg
         NITWyujOTid1GhJG+EC/tTQqkWa3ShK67Pmk1HYoFFeL47b0Ed6t+r4nxiPcYWLZuz4L
         3R/QHFrjlHYdriuQVvNNzHxR57vWUJbymrFQ1IWpFQQGPHomWUjvcVzu8rCGzHM88JII
         RaLojk0NlnP1mf4wCkyPJXtxW6olOxuB52Cyzn7YYhrUP8ilaqr+CUsJ3ewrg7koSsyN
         1omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789406055; x=1790010855;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=chltb2wD8PD97rawmjna+iNh1esiaae/NnONMgkrsOM=;
        b=SQMZOBYRh2fB6FWXu++ikk+HuyinoreujIa9PB9FWcGCCVytACLp8lGWs5b2NTDKvB
         XKW+lY9hxj1M5UmII04Dd1f/EqyWYbtXqnEfhnze41AugjMu1K2Gov6LB5xyu+KxL4Bt
         1DU62CDkhnilClVqfVqsynQR8to+mzO9dx6QQvy456Y7WNjgkFtizB+giRjqke+TF8zp
         kwdTRM82S5f4kf6qY5k86GaWmy4ctjjtXBb/U/NGxAkRTD8+aA1W/qlpbn6YMK77uDP9
         jDAtILCOKL5lcONFsJPuEM7ngf+vYOLgJR0Ni95O92/OWd7bYyJfAKZI8g03sjYvOHrc
         C+OA==
X-Gm-Message-State: AFuF++nlCpnmKsdrdxsce8QAdf8fUR9LNudV/nSLmNUL03wHk72od3iY
	iGbctHa8kZHaNJTCPkRBpS98bmer5L3hg3WKsSnZSEa3GbtNKA0gRE6O
X-Gm-Gg: AYBFou3ahT9V+zoV8O32EloM0mbDLrIaMGvpRDOEnmBZBxKOYUB/w38MNIcpEyj7rD3
	FFmdDC/ylUuwloDGgIgG1WRv7TMzvr6Mq6a3BqMzStSLq2e0pm2xgQvgATw2cEImt08dyrj+YgG
	HVo+1tAE5uPYI5i50uC8TvXZyEMrbGcqm/i7oEO/owQ9YL40FyDgo/WcNR4r0U4BMfCy1aZBULK
	cfT+oO/2V4kT789A2JxDxQbzGnvXpaBMvStxKOoTTkcGQOemrp6FA3+fW34NVsKZOG8V0Y+oGIe
	WY6eTfHcMVEUeVEoV20CUM+CfEC53uT5HQiE7fnAJj/f7vTlad9zAD/UIK+V0ut4335RRu+7pUw
	DPX07CXv5hsz87hNLeTHHEk2Z0xYuv8njaLt3jLT8uNKanfO9R316lDATh5cuplEvG5ZFYYIFAH
	YRBJvw75jsaAHTQw532jMm5Ba09yL9jbRt6J8dgCuhwjOGHuNZ/4cInBDtZ9cD9yg2rSpNDyV6B
	VKP87aJFJLU7Aeitxt/6pyDFTvYOYLXYGeUC8brrbiZlK7ujB933RmHGf6+XNeQIVw=
X-Received: by 2002:a17:902:fc4b:b0:2db:257c:9fd5 with SMTP id d9443c01a7336-2dd6c70df7dmr87697855ad.16.1789406054956;
        Mon, 14 Sep 2026 10:14:14 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd445de320sm42227055ad.8.2026.09.14.10.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 10:14:14 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 15 Sep 2026 01:14:08 +0800
Subject: [PATCH] usb: musb: mpfs: tidy up error handling in probe()
MIME-Version: 1.0
Message-Id: <20260915-mpfs-1-v1-1-a12c2fd7e0d9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwqAMAxF0a1IxhbaIEXdijjwk2oEPzQqgnTvV
 h0euO/dIOSZBMrkBk8nC69LhEkT6MZmGUhxHw2o0erCZGrenCijkLRFh4XBnCDGmyfH13dU1b/
 laCfq9ncNITz5pZeQagAAAA==
X-Change-ID: 20260914-mpfs-1-2e062f29128e
To: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, Bin Liu <b-liu@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789406049; l=2192;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=x+duut9tMSHe9M751Ne3IHM+XA1aiC7lvKFmrcwMlNo=;
 b=mawbIY5TSFJDmO2pUO7rWizxkVTG8cUkHVInrILkyMjQvw0v8fkUWH+Wy1kv/OlG+UEhSOuJB
 40xtPVYNWvXBaevGfylbceWEhrxXZwZ+2P77UWQ4T8l398KRVYCieom
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_101416_319069_CF52DA4C 
X-CRM114-Status: GOOD (  10.40  )
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

Restructure the probe error labels so each failure only tears down
what was already acquired, and stop calling
usb_phy_generic_unregister() with NULL or an ERR_PTR() on paths
where the phy was never registered.

The old error paths only worked because platform_device_del() and
platform_device_put() ignore NULL and ERR_PTR() arguments.

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/usb/musb/mpfs.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index 587127abd30a..59625ed95656 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -276,13 +276,13 @@ static int mpfs_probe(struct platform_device *pdev)
 	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "failed to get clock\n");
 		ret = PTR_ERR(clk);
-		goto err_phy_release;
+		goto err_pdev_put;
 	}
 
 	ret = clk_prepare_enable(clk);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to enable clock\n");
-		goto err_phy_release;
+		goto err_pdev_put;
 	}
 
 	musb_pdev->dev.parent = dev;
@@ -324,29 +324,29 @@ static int mpfs_probe(struct platform_device *pdev)
 	ret = platform_device_add_resources(musb_pdev, pdev->resource, pdev->num_resources);
 	if (ret) {
 		dev_err(dev, "failed to add resources\n");
-		goto err_clk_disable;
+		goto err_phy_release;
 	}
 
 	ret = platform_device_add_data(musb_pdev, pdata, sizeof(*pdata));
 	if (ret) {
 		dev_err(dev, "failed to add platform_data\n");
-		goto err_clk_disable;
+		goto err_phy_release;
 	}
 
 	ret = platform_device_add(musb_pdev);
 	if (ret) {
 		dev_err(dev, "failed to register musb device\n");
-		goto err_clk_disable;
+		goto err_phy_release;
 	}
 
 	dev_info(&pdev->dev, "Registered MPFS MUSB driver\n");
 	return 0;
 
-err_clk_disable:
-	clk_disable_unprepare(clk);
-
 err_phy_release:
 	usb_phy_generic_unregister(glue->phy);
+err_clk_disable:
+	clk_disable_unprepare(clk);
+err_pdev_put:
 	platform_device_put(musb_pdev);
 	return ret;
 }

---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-mpfs-1-2e062f29128e

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
