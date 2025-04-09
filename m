Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B263AC369A6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 21:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMM94fpyoPXfyyVoQ3fabRpEHbWuWEobm5ShLxduH48=; b=LV9Hk47fno5E3F
	MEpNBWgVb1TVBgqicI4zubfn/tqrldZYzQo1xNrErAmQx/1Ula9t+sGDtSqCpw83jcfCtyj/YCt1R
	w9TYbyScRZOdGYfStjBbL0vQtug3BO25CVLaDk3QtGz/TRm8KHk7P/IsTLK4YFKwLN+qPdY5dJmwO
	gEREmcapGoaIiS4i7fCcE4pD+rhPoWVLFHUS0TAGrb8/xmc2r7T0arLIR79WDDHVvDn4gn3Ex2r6M
	2Pt9+fYCP0EvadtdJi6B/9+l9ydAmMi8l93zmPmEDeWlSTIpyqYBLlnK2r7jIYcs5T7Bcns1zrnT6
	q7CztUvSac/Kgqglq90Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dNX-00000008drF-31ag;
	Wed, 09 Apr 2025 21:54:39 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cnw-00000008YcV-34fA
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 21:17:53 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-86135ac9542so5642439f.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 14:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233472; x=1744838272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGqNrfhRW/VPigxjf78Q+G9LQoValPWHjpgKCcSc0+A=;
        b=lTqO305++EEFrZmp0cI/Xgyo6Z8JCcWtyoXzftkhlxOLyff7LcgkoVk+9ZA7lMXDj+
         vfVDVJNHv/m9dKOn3bvAaIL2xayqG93Pccl7Vixaj88cWHaIob5rAs2RHavObdbIhFx1
         fed29SILeuK8As5KKiKbze0YInOHDOSZ/7n8630X6UCr7TWT48o9O25cLAKegU+ClN7M
         RgGXohY7okvtGxCmzqZbaaLdxqPDDafsVHMvadUIROZ9cohzjuHta3reB2GHLIwIrgfl
         zUyVIhScRFr87gyg5eJnYXKG7361MarvZr8CZjlY3wNsQAQXq9DGOUg6vfFCpShSrsl4
         5pKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233472; x=1744838272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGqNrfhRW/VPigxjf78Q+G9LQoValPWHjpgKCcSc0+A=;
        b=dDCi0Iuvz6lzP6zIr1Wa6P7k+L8C6Dv+O9+e4oY7U6p72iwuqzi1Cnt9iGxyw5cyDD
         GEe2bD9zy7Pam1tQ4YBDxDXGvsMIRbqN9uiGQL1KvUvqup8BQuO/4YTWKGj2fCWPpw5N
         kdHZ0UOeU7RW4ijikQjOAqggQI74KzM14SkkAS8/exWAQXLZfi0kfRd2xkLKTptAQMHJ
         se3luZg2VBvNFsDaFSJ2cPvuS0XnjR7DfsH5NMPo1SUJYwsTKh73Uon6r9LZzpDhlS4r
         5YBk84xgrPr+wuYHpjPfHkVLIdv9G23xMq9hfB0zvzTShpF4teQyKazgctjMjxy/+IaG
         Tygw==
X-Forwarded-Encrypted: i=1; AJvYcCVT7ZCcLTeakHMfnLQKUros/Xo5kD26icV2l/aVaV+n3Ei5dxZgfdVNfgSw4ZVjRWpGUHuqWiTeO6cF0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaEawx6kUzNYn6rXYtz3HdWXFhmwpPwVQ3Om4wW9PWKOcxUqVP
	WRmRRbhoNWnVm0YrO7dfkuh2Uiv8cG/bispQhWpYYrX8aEKdBRJuIaqDeTiaQxU=
X-Gm-Gg: ASbGncuhKUsaz+kfsGuvaVfoGqIFohFcK+gDctK6959H5FGhvl6F+dJEKVHqL2PYT3m
	CyMPDfmfn99auGR4t2qkjQbuOQhWMQpSIFJ/hIU/wdPOYBSy9YGyWguZTiWkjoR2qKtxETWwFRv
	1KVz4pMngob5ZKPp9D8A+j9ccXCjjrFtY1EDuxiopB6YHuKXnzM+fvXRTqVTXSXCIbiJx6AlBSh
	jVXKv0+U56sez7n63A8UH2/NGLqPKNf3lrhjcRkiRwqPqGF7dXIKEywqc2Ns5OoHy8GOvITxByF
	WLp2P0iUkqAE2LKSm9YPOXg7CDWwLb6llhuGD5Fx0Bvouc7y6raYQeFsyMCKHnmJ4pnA7W3IfZk
	9OW80Yow7K4ZaZA==
X-Google-Smtp-Source: AGHT+IFEHPef9F0uv3pXsoWPI4R+kvDCIMm2kirESEgvm8sQs83/WxUO71MEUbAIM50tLqB7gPts0w==
X-Received: by 2002:a05:6602:19c3:b0:85b:3ae9:da01 with SMTP id ca18e2360f4ac-8616f19e832mr27550439f.4.1744233471871;
        Wed, 09 Apr 2025 14:17:51 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:51 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] clk: spacemit: make clocks optional
Date: Wed,  9 Apr 2025 16:17:38 -0500
Message-ID: <20250409211741.1171584-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211741.1171584-1-elder@riscstar.com>
References: <20250409211741.1171584-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_141752_770635_DBD5C08D 
X-CRM114-Status: GOOD (  13.50  )
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

There are some syscon devices that support both clocks and resets,
but for now only their reset functionality is required.  Make
defining clocks optional for a SpacemiT CCU, though at least one
clock or at least one reset controller must be defined.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 7715cd38434f7..201ffefa5fa9f 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1369,12 +1369,17 @@ static const struct reset_control_ops spacemit_reset_control_ops = {
 };
 
 static int spacemit_ccu_register(struct device *dev,
-				 struct regmap *regmap, struct regmap *lock_regmap,
+				 struct regmap *regmap,
+				 struct regmap *lock_regmap,
 				 const struct spacemit_ccu_data *data)
 {
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
+	/* Clocks are optional */
+	if (!data->clk_hws)
+		return 0;
+
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->clk_num),
 				GFP_KERNEL);
 	if (!clk_data)
@@ -1486,6 +1491,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+/* Match data is required; its clk_hws or reset_data field must be non-null */
 static const struct of_device_id of_k1_ccu_match[] = {
 	{
 		.compatible	= "spacemit,k1-pll",
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
