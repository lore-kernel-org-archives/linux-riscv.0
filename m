Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D960F3C242
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 12:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kWbe0ss3S2twHzmdVVaXS65VzhzclOPWdoIXICNzpM0=; b=RkEsmSdw04LRWS
	07NJ7vbrGhyjYaggvZfL0x2fFWI+fMd5tR+jowMwbCOMMliZKtPiCJ5qQ18fe1g0E9/xkLjd96ABU
	7ZdyvQYPun2EKpNQGAc8E6ln0AyCbp8QZ/meTykE4mgdRDJu/sWbE3a+m2Txapa5xc5S5WGQerW05
	bvlgZ/g2OqdcgPPvfKqr1qp1LJhkojtSEpQ3cwXKArDTfHI9AKITzi4DUJeSSMBNvAqTz7h+xj/8L
	p22ePLiHdjyLmpQWGVXVfEqInIvjkRP6czyDuZQhBeIdnkqJSUxO93S94WIy9MMrHzRRumuUYY9xQ
	nwSyC7pPkgsOl4pAQ3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZX6-00000007IYt-1ZBQ;
	Mon, 09 Mar 2026 12:16:24 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZX4-00000007IYB-1HfY
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 12:16:23 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c73a12af63cso1471985a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 05:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773058581; x=1773663381; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25TZNPEwwPkYTHAgMRLn+Sz9ICp+r6IePTSPwttEBwg=;
        b=T8fe/DiVxVALtYV16wMx9XPHZF5E5a8Vsrpeq+Tk0ad4FyMKmduK/3XoPocEQWqzFQ
         hiFCwANH9JzggqoKmzL2wvmuGTfrtaT+uJo8koLZ9ZIVQRtikC0r/tLbBznsegi34kh1
         tsUMlaOouhObKUat6sk7lsdZPGzoWxqljftg/urvovBi5BVvdwtz1vCPrQYV6pcBo9Uo
         mLUkNpgPyUaaGvwMq5yxGHuh0XhWlvsaIPK+mytIMQqZMLUsNJ2iqg8VNKT3FmjECddV
         AsysMKotaAXT9qgsGm3WsR6ScWbotooUTMHPp1i+FFcwc8MeJW+quvs3E4Z2XYucWUup
         EE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773058581; x=1773663381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=25TZNPEwwPkYTHAgMRLn+Sz9ICp+r6IePTSPwttEBwg=;
        b=UclUYHzzp9pxfd8UyhqKnX8ug5A6L7GlxEzKyqwB3EPSqhnaB5L2CDdUyVjkE9jOGz
         GBTjykSAGjHEc1N3dli/jdENeFhD+426rNFcEWTHZPd/y1lhsxcY8o6JC2SV3HrT4mPf
         XAFoc7ks+LYGQrhq1mTGdD9oitk3g6BCr6v11QlLzjSJaJZmQuA76l3B3dIO8ogbPsR6
         CsbcLMD2wFm7IV3irk5ReJuKwbnRz4TDcAviUvE+uerGisXlIbc1tuy/muJh8nUUe42E
         sWSDvNDAEtYOO2kGCRmR6IWUifC66gK+6IlbbQdaG24koFptcuvckxaLv8+CFxe/nQst
         7pHA==
X-Gm-Message-State: AOJu0YwBwrSh63DgWgTqEJuSmFrkw/dUACNIN99fK9YfS/fxDZLI+ehb
	jz/iZR0Kkny3LfezlnyAS6HmmHNB6ebYgKfeOUL5UMZQ+70KpnC2zFET
X-Gm-Gg: ATEYQzxTBcuU3GpAXTo9wLHSJumcfWZ+wTFoWpFv3pZ+yn4n4zZjNNmgTuk1KZHkZi+
	PFUHfzNUMUfUiaOV8YqKFl2AcOZVuHK6+voS/tD6K+ioZB5oVg5Rn5FHZC1qfOOR3aepCWpZA+y
	n6aPvug+GGE3BpC6GsBamjH0r5mNuOSzKigMd+mdl3+cNQgmEUh2huuF4cF8BiJ5kKPtgV17XRV
	Gtw6ADoLceFpVgs0sivHqATxRL7BqFloejPW/VNHZ2lAqCQHDr9LaWntHeqQQ90Cg+HjX22MWmW
	WlnVI/zUCuLoMMcr2WJW1bx2PmpAtdMlJ6oi6nec53OIBXjKzKob+GiLRQBoeBC+WXsFtfSPI+O
	UVEDI3lZ8JyrAc88Fmav862KgA++TGvZoOMlDSrDNi7ubuYMHVtyEevb3hx41SwAKWFsn8Hksvi
	MKrYpg1kW0U6PqY0KPNj51fHjWc98MiCznP3Ub
X-Received: by 2002:a05:6300:648f:b0:394:427b:eab with SMTP id adf61e73a8af0-39858fb2ec0mr9506675637.11.1773058581257;
        Mon, 09 Mar 2026 05:16:21 -0700 (PDT)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:a816:d74a:dc19:1ab8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0a7156sm9525693a12.2.2026.03.09.05.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:16:21 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 09 Mar 2026 20:16:15 +0800
Subject: [PATCH 2/2] soc: microchip: mpfs-mss-top-sysreg: Fix resource leak
 on driver unbind
MIME-Version: 1.0
Message-Id: <20260309-mpfs-v1-2-0dd89f34f962@gmail.com>
References: <20260309-mpfs-v1-0-0dd89f34f962@gmail.com>
In-Reply-To: <20260309-mpfs-v1-0-0dd89f34f962@gmail.com>
To: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773058576; l=1123;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=O/VunH/9UjAoQv+nRiPfxssAhhHa/MPTIs1QTwQxRWg=;
 b=w+0DV0seDzjqyUBQXtNmD6gk/M/p8cRtUKvcKz/I7wfEIZoZ1Zgb6MOoHJBN6AC+AjPGp1zHn
 KE9RxgHDkEcAfXJNS7fS7a/wS96k2XOaRxV1HO2mQBCuUkVqjm2i0S0
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_051622_381488_FF61F4B7 
X-CRM114-Status: GOOD (  10.69  )
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
 drivers/soc/microchip/mpfs-mss-top-sysreg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-mss-top-sysreg.c b/drivers/soc/microchip/mpfs-mss-top-sysreg.c
index b2244e44ff0f..b0f42b8dd3ed 100644
--- a/drivers/soc/microchip/mpfs-mss-top-sysreg.c
+++ b/drivers/soc/microchip/mpfs-mss-top-sysreg.c
@@ -16,8 +16,10 @@ static int mpfs_mss_top_sysreg_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	ret = mfd_add_devices(dev, PLATFORM_DEVID_NONE, mpfs_mss_top_sysreg_devs,
-			      ARRAY_SIZE(mpfs_mss_top_sysreg_devs) , NULL, 0, NULL);
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
+				   mpfs_mss_top_sysreg_devs,
+				   ARRAY_SIZE(mpfs_mss_top_sysreg_devs), NULL,
+				   0, NULL);
 	if (ret)
 		return ret;
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
