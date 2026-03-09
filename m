Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3081F3C240
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 12:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyBuxdqj42Tp/hf6b6XkHC6HK5L46ZTKJaFDx/rQBAI=; b=l4DTDW49g+xJzf
	f6NNVLoXpjIdDu84PZmcbSU/WQzi4V4WXpJ+NJU1FmrJFDZDj7ErIahPu3tXz30Me4eBup54BdJZ+
	CN93yqZbx40VJvBeuZNRNZa1Sv7mj/P6YWcG7EaivSSx+leXuPgEoTgIwFAJxKYsRyeRE2tPHumph
	cefCBDlrWgzwXkT/OzGhKPyFsp+fgBedmllWJxdiMkCkUCQexSGcaFprlbR5D41TVDfm1Kac4Y39S
	qV5yoQTGIYXl2FChtzz2S/Kf6R9Lkb+fIKjrIiy/IsThlsJpuLFrmsBeaeOWxV58gbQmeLm28Tvbn
	pxvbbsFO+wBvGHsenLjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZX4-00000007IYQ-42qo;
	Mon, 09 Mar 2026 12:16:23 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZX2-00000007IXf-127q
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 12:16:21 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3599019ae92so4389882a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 05:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773058579; x=1773663379; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/4T5g8cuZpW2r5QmDZ0Rjhhfb9PQbIPZH06YKDgyWo=;
        b=HV/HbCnLvOIJS9CT1I5GzrN8YV0Jplr8fL6e+iLhav+LxYYG9PblWxVPE9ea0UkBpx
         4enS8Srt8MDxr97kooBRn46BEFJTVwYrRl+zHUlPhhrfteKXmxtdC8bTnlrwWTPBH8+O
         WYc8Udurq0QrqksE4icv9r17Qqoy6bGNqFAD1mjZvq1Kh+iY5r4VOKRBFQcIPRQ20xHk
         9wvA2MG/db8bqZUkXeG6/3hPe++Q2L3rEFpF4JNMQ/yRqvPgq7dOiBXD8SfPUcJV2fSh
         y0JiwRUj8rx4BaNQ2DrMfmWwC1rqoMv9Tmq2bL08DR7ACzKKslUo5FCUQmXPHkr93IGn
         os+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773058579; x=1773663379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z/4T5g8cuZpW2r5QmDZ0Rjhhfb9PQbIPZH06YKDgyWo=;
        b=gziAOJgPwq9oTZXhylQqBQB/6QnZMSDkSYauu4Xvn23IWAhkJaC5Cg4piNaYU5uyyS
         ztP9/BW7haPr7HzyrbeJsH3oQ5FOb3FUPU/fR4IF6PT2+lRNhwCRInSCUr9yCbxrLvA9
         wI1DIZnN93hy9eVhV5uajDixDlC5Xs0WY4HFOOsQCE+n4o+dJVA6IhaL+YC1vMczDU0X
         Hcthn3Co8IE052l5bVmcmiDGWSnburxu6sVXJa17vVcskhNAH604/xiXwEoOn86d3DDV
         /Zri1g1BBDlMBgq0ikvuYPgJG1YaEL2ClS6OnRgshF4zGcTmD1qkCMOgyXSttwJl01M/
         TXqQ==
X-Gm-Message-State: AOJu0YzKfqLTAfFyZkCErNLa17Tm/hBCAFg0nJi6FXQ0vYyPmu+W8FUr
	iTEPSzXDU7H4mvLD6gEgqDl39lzk0La/bvUVd4X6hwTJQYzYiT2gREwU
X-Gm-Gg: ATEYQzxHqRDJYa1GtltvzWklkkhjdCXCa0icJMhWBwevynKibOsUPRPngL6PDUSsmMZ
	RprY9+1Ne6/Qo84+qmr/rt8tM/XSQlwfyVPuW/uwsONlSGb+sVtfCtuVkwld1oJcgJ/rm6gj7zd
	9tYPXAwwKJJj8Vv0gqoog5r+a7J+27Pfhbxp0n5wjp5zTQ3wqe609xGLwRtQRPS/SMmHFnr69TV
	BAkkHvisRo0vlMEFmRiqoUDJtkOs4DIufHUdyaIC3/uW1oFaurPNo5BFCUI6WVWrstUOGWZbqdv
	o4RywP5cwnaaebbv9T3WvVfnWhPCkM0uagWMMn5h3ZTKz+2iPG1hDTMyDmWzzF4gFl4zKounSNq
	of4MrN7XiyAl4JLwpnsV+0y+orHBTLjksiIczsA2UXv+DFMIBt1y+jM4+23+4hAuqATNch2JAwe
	7XRWPu541Iru3j79Evs2hOJpSIzYJLjiMCIHqT
X-Received: by 2002:a17:90b:4fcc:b0:356:23be:7ecb with SMTP id 98e67ed59e1d1-359be25a3c7mr10094583a91.12.1773058579365;
        Mon, 09 Mar 2026 05:16:19 -0700 (PDT)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:a816:d74a:dc19:1ab8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0a7156sm9525693a12.2.2026.03.09.05.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:16:19 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 09 Mar 2026 20:16:14 +0800
Subject: [PATCH 1/2] soc: microchip: mpfs-control-scb: Fix resource leak on
 driver unbind
MIME-Version: 1.0
Message-Id: <20260309-mpfs-v1-1-0dd89f34f962@gmail.com>
References: <20260309-mpfs-v1-0-0dd89f34f962@gmail.com>
In-Reply-To: <20260309-mpfs-v1-0-0dd89f34f962@gmail.com>
To: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773058576; l=1133;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=ze6F7nLn47oIqw03rLTI4vCDxZRDfipwZbIzfTE5gVs=;
 b=ylmr5sBs1d1Ppk+RhiT6bo6yWNSoKKwwHBzRIdR3JVTGgLuGmBglRTPjobn6wy51jxhXl8ItT
 4UW4xSSTi4WAR4dibnoCaxzFr/CC8IbLzY/wULjjzGM2YKCkcJhmvE1
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_051620_308916_94064D37 
X-CRM114-Status: GOOD (  11.11  )
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

Use devm_mfd_add_devices() instead of mfd_add_devices() to ensure
child devices are properly removed when the driver unbinds.

Fixes: 4aac11c9a6e7 ("soc: microchip: add mfd drivers for two syscon regions on PolarFire SoC")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/soc/microchip/mpfs-control-scb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-control-scb.c b/drivers/soc/microchip/mpfs-control-scb.c
index f0b84b1f49cb..8dda5704a389 100644
--- a/drivers/soc/microchip/mpfs-control-scb.c
+++ b/drivers/soc/microchip/mpfs-control-scb.c
@@ -14,8 +14,10 @@ static int mpfs_control_scb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 
-	return mfd_add_devices(dev, PLATFORM_DEVID_NONE, mpfs_control_scb_devs,
-			       ARRAY_SIZE(mpfs_control_scb_devs), NULL, 0, NULL);
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
+				    mpfs_control_scb_devs,
+				    ARRAY_SIZE(mpfs_control_scb_devs), NULL, 0,
+				    NULL);
 }
 
 static const struct of_device_id mpfs_control_scb_of_match[] = {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
