Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2F8C36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 21:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9jRErNETf3WrKWZmLL9SKVXiWBazYL+IG1Bsbye+VgE=; b=Saw5+Q23GvKUoT
	fBFRJSy9gXuwuNGMNcBhH1QvV5dd+Y4g+LXPspuWbX6i4riNviXIh1HorOBbYUfJ/AiWiBsZmw+4J
	tK8JeYddpWn6ZMWBaQluVRv8ud0FHLdFfHl4bw+a1qrAZ03u4Ep0vayF1S8FLsdfSLWOFzScaSDil
	WeqJ1clSfWxPc+WkKmHHUCDag4KdMNmpwKeSApk/DWoXf/vq1UwlGGtsANrqB9TChaHy+99FBCyFM
	cfpC6waHSsxDEWr2jxqWp3lyrm6G8FTmUxgdcXEKym8DoTkO4l5mobuGDyA8zYKV1xWXsojnACKkP
	eK5H0QBS7rCM7bRwohFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dNV-00000008dpk-1eeo;
	Wed, 09 Apr 2025 21:54:37 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cnt-00000008Yay-0nT1
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 21:17:50 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3ce886a2d5bso1700365ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 14:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233468; x=1744838268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/Ujt2BqpTFQspxt7ElIhz1eo1LmzpQ0jjYgAj4gQFw=;
        b=Sgw+3DF9mtj1YBGEqQux9iwSI8fOu4DGpV/3NZiW05jcVwnk1TtXln82rrPkreLpUg
         eYpbSPlN6v1BDi4ZYlZNxXCz4qP+xAsx+TdTD3gf4qVcr2XbFhKUmoe0ps1J9b+zV7O3
         UdwH8lkQkutmemr+nW3xby9jX6osImY/vbhFSwIzE41pJ1ibOGEOS4uWEENh7mG7uouh
         Y4yUvPhaixzfi7w7L4h9IZu3kaMDmwUcjk+MvpPKZkddJro7m6JWeQHQhHejPo49B2Ly
         rNFSIrGdKfMJ80OdSYdFnZEBKD/oTwsBXNRPHUHlDZG1MNmlaCvYM6hEiBYoQZFor/xb
         ozgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233468; x=1744838268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/Ujt2BqpTFQspxt7ElIhz1eo1LmzpQ0jjYgAj4gQFw=;
        b=jlib6wy6lbabuuNmQuEh2KcFxw0XmOUjumff6y6eMpm7z2VZkBb+XdSLJuzsRbCPCp
         WT0dW3mazPyKwhFpgmi1wTmSscrqpUrSG5LvCHOzyK/1FTTxIz9oAsNDAtCNCM5btBNj
         K8j7dEZTIiMd6JeSztGf6ZTGoxBVEyi1TX6COjmWhCkZo1MKpWlILoZlXuPgkSwsfb/D
         EDi3s/D20xf96qh8Vb5GtMtsJCEoap3Srll6PVG/KsU8yTWKqGk7HL46uCvWaQqErIzp
         IrjCKwmPJ71FUTzyd632dzB0eb8+95GGXOyBrz67bSkvJcwIm6fKfEvoQGnzTkPX0cXm
         4j0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCrXgNJUguJbWaLEpliGpnoCMKoxsKjRGfpmu1hJe1N+PZTUTO4/mATsllS8L71GlIQktLL+uO1Ao0ag==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlvRY3HpHqA8BnraW643WsiqvFOOWKFYQh97dRyIJRjwiI0sEF
	EaCeDGagrNWeAUa84vBIewBeWwGtckQiYPn7PBX2snjhVgomb8pTzGoQIFhd9VQ=
X-Gm-Gg: ASbGncs+zZ+rFTwV3EB76MUXr2ykoVFGYi0cUPFPNu1GvJxof2Ve+x6KSF38+7uFpg/
	7AXu/mGKPCB+P/KIOF/1+3nmWzj/4UskSXFsit1TFgU3N8ZpBGXv2xuv+2htFXUbDo9pv08zb+F
	6aj7wJ8gJjjsI/Q+tQ5j56Bmz+LdjdHtk9R1ep7ofH68Gsdd24Uxfpfy5kIPrJc9CzwW7kyHOXG
	Z4d7Ak+z6BzAY1yLeBSUAKlEKbTRFdAV7mtFG0QRYB0w56bzYN+c7kD3C+T9luXBgrXk3ep4DS6
	FviR6ZMrIrsl/QkKZBFu9vhV0KCkxY+TMjpJAY7AlMbuxTZd4AWAfzq6F37PDTwS5WiSeookAfx
	XN/mDNCv46QsvGg==
X-Google-Smtp-Source: AGHT+IEA351OHRV1gFr2V6hEs8tVqEYmZ8Jl/cV8rxcpoeDrDqiVZAMMDJF5x+pEwEG48cVA0Jzrbg==
X-Received: by 2002:a05:6e02:308a:b0:3d3:f040:5878 with SMTP id e9e14a558f8ab-3d7e477abafmr8500765ab.21.1744233468227;
        Wed, 09 Apr 2025 14:17:48 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:47 -0700 (PDT)
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
Subject: [PATCH v3 2/7] clk: spacemit: rename spacemit_ccu_data fields
Date: Wed,  9 Apr 2025 16:17:35 -0500
Message-ID: <20250409211741.1171584-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211741.1171584-1-elder@riscstar.com>
References: <20250409211741.1171584-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_141749_226685_5C8B6017 
X-CRM114-Status: GOOD (  14.44  )
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

Add "clk_" to the names of the fields in the spacemit_ccu_data structure
type.  This prepares it for the addition of two similar fields dedicated
to resets.

Move the definition of this type closer to the top of the source file,
after constants are defined but before objects are defined.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 5804c2f854071..8a8d228b46c3f 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -129,6 +129,11 @@
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
+struct spacemit_ccu_data {
+	struct clk_hw **clk_hws;
+	size_t clk_num;
+};
+
 /* APBS clocks start, APBS region contains and only contains all PLL clocks */
 
 /* Frequency of pll{1,2} must not be updated at runtime */
@@ -933,11 +938,6 @@ CCU_GATE_DEFINE(emmc_bus_clk, CCU_PARENT_HW(pmua_aclk),
 		APMU_PMUA_EM_CLK_RES_CTRL, BIT(3), 0);
 /* APMU clocks end */
 
-struct spacemit_ccu_data {
-	struct clk_hw **hws;
-	size_t num;
-};
-
 static struct clk_hw *k1_ccu_pll_hws[] = {
 	[CLK_PLL1]		= &pll1.common.hw,
 	[CLK_PLL2]		= &pll2.common.hw,
@@ -977,8 +977,8 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_pll_data = {
-	.hws	= k1_ccu_pll_hws,
-	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
+	.clk_hws	= k1_ccu_pll_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_pll_hws),
 };
 
 static struct clk_hw *k1_ccu_mpmu_hws[] = {
@@ -1018,8 +1018,8 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.hws	= k1_ccu_mpmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
+	.clk_hws	= k1_ccu_mpmu_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
 };
 
 static struct clk_hw *k1_ccu_apbc_hws[] = {
@@ -1126,8 +1126,8 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
-	.hws	= k1_ccu_apbc_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
+	.clk_hws	= k1_ccu_apbc_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_apbc_hws),
 };
 
 static struct clk_hw *k1_ccu_apmu_hws[] = {
@@ -1196,8 +1196,8 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
-	.hws	= k1_ccu_apmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
+	.clk_hws	= k1_ccu_apmu_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
 static int spacemit_ccu_register(struct device *dev,
@@ -1207,13 +1207,13 @@ static int spacemit_ccu_register(struct device *dev,
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
-	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->clk_num),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
-	for (i = 0; i < data->num; i++) {
-		struct clk_hw *hw = data->hws[i];
+	for (i = 0; i < data->clk_num; i++) {
+		struct clk_hw *hw = data->clk_hws[i];
 		struct ccu_common *common;
 		const char *name;
 
@@ -1238,7 +1238,7 @@ static int spacemit_ccu_register(struct device *dev,
 		clk_data->hws[i] = hw;
 	}
 
-	clk_data->num = data->num;
+	clk_data->num = data->clk_num;
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
 	if (ret)
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
