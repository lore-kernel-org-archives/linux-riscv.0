Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5131EC28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 21:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rftJBSLF9Bv0wi16R846lC6ztDq50D4PudjCLdrqXGw=; b=dP8ezLEENP4kHd
	hLOm7JmE4NX7ljbSLHal563u3oE2MRLd/Itk7ZtJHhsJetHKyJhPsnRXEs0LvrKvTuHFTEfAGY3RM
	0cdU2xK/2ErymnmJSl7AUwvVLxdC/ZN84d6FJI2c96Q0mjJ5f5SLt/10YDsXOpZP0eVCMcgchaeMl
	d3Yes62D+o3KWCFnjzGeDVwD42ivrkA/RjDNF6Dh1gyKQiwe0M+Eko0dP9RLpt7/yd9rx7ViigOV2
	zt/HRkKK3cr7lPPRyPuMIe2IMcN7/ZKuojj3yGAy8AzqGRIDfoyqnDQpfEL9zIzhmNe1fzlJhvYGh
	dYiD/4qJspeC2WvUfjMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyGqi-0000000EJ53-2LlR;
	Fri, 28 Mar 2025 21:02:44 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyGqf-0000000EJ3X-1Ag0
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 21:02:42 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3cfeff44d94so9002825ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 14:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195760; x=1743800560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EIFREDKUdAp5cmkKXroBOp9ZjEFUNtcVcLKCQaMF1U=;
        b=1jdAPqxKFeCXAd11o9zxe7LljOUuwgBD996SsS7hSisOQ1NQcWUY6PAoG7EexiRSrj
         r8EFJX6Mswd7npD6VqbFI6jRuvvYnHLjMycOVCX9RgUWR8vEAzLEQd8nyGbeWgDUfgL4
         oo7EH+or8CBNhdHuE+fMKGDvLA+zp3sWEh8bmFZWnaC70drk/vcj7j154x+C0P6YBFw4
         7i13bUQI1gSHKYfkrhN7wJ2XswWXTPSTmWMRD1NuuhFdI9YUik/VEU8JPmq91TbPAKHf
         4NegACU5j4+WgcSHJIc76PxtkIj1oo2uU9DQOQDiQN9IsMpQGfx0SrJAqCdbeEFdnXGL
         7i5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195760; x=1743800560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EIFREDKUdAp5cmkKXroBOp9ZjEFUNtcVcLKCQaMF1U=;
        b=N1VFz+8eLsDc6Bpq/WOSa5fQCQtdFGOEe/Vb7C9QlA3zlKHD8C9Y2R+mvURMdJRDmQ
         km4oVX3AzaVWyDsj7kSYODF1w120ez8vNdfYMdF+hlASGhd9ibR6LNdWjLBU2c1r4G1o
         FsXsrj1wjvQP7Taa9ISctpLF86R3jzVf2f4lEZJB5NYlouLC7qcLKQFpVyxXY94HefGw
         Shz/Wf15QyHZKk9Deenvq8VYXqWt7rbu2mMIrhHtq5OQulpds3UlymW/ZXgQLI8jocsl
         drTeZCAkOF51vvmWxx41evdQewsTPruG2SrM5MNM/2MSeyHOZZ5S2SJSpkbqtLpoy/X8
         hbqw==
X-Forwarded-Encrypted: i=1; AJvYcCXLo/azLan6MXOKvEndkD8+/9hpjS7xlQaIQWgP0YwgubYQwJIcAfs8lv+R279D5G3T5YxZu2YvQlcdMw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzU5corCr+OmNv14R9Vg3O1gmxXjzOWHnlJVKkgrmuSqj/S2jau
	P5JKb5fwqbi/4IS0PT/G5GrbA/GoqcC6QWY7XBfi50Ct/IpyB1ib3YQUlZXJ5uQ=
X-Gm-Gg: ASbGnctlBx7sTBxGuf6D2qnhFBoTWOOeprmz2IC1dFuyGEyTpdQNTXv1swssl5yOfFW
	xhJcSLMnCrfBnz6iACG7MjDe+L56+nHTrA72Q+sivmV/1awjSzZMq4D4jLF3ryBLKmRf0B1UluL
	qEWa6kv0Qued/UUnFiLIFufAEnOTM1+v7Rkc09JHiiwXnvpTmjezTELMzioFbqu+ePHKOjRl+S7
	Qo2k/ijjbTx9+A8GYq37m9+Ef3u5hWbuTkmjT+Rbp3aSnOHxAcOUEZdoMH/4b6lfs3+4NepG8UP
	JTvPq7+nQu9ktRlqfAOpjlpA2epsjPVe5r8Ro9+gWfiVN7zGU9QHVDeK8HR4lyZDLgYqFIK5JgC
	OcHtIpAyNn8S7km6f6g==
X-Google-Smtp-Source: AGHT+IGv/tQ9yOo+nSa2AdmuIJoHsAcKRHvpATkGTYnJegSwl7f8akCnzw41qA7R6W+uGcKVHvpvvQ==
X-Received: by 2002:a05:6e02:3906:b0:3d3:eeec:8a0b with SMTP id e9e14a558f8ab-3d5e091406dmr8990475ab.10.1743195760197;
        Fri, 28 Mar 2025 14:02:40 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:39 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
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
Subject: [PATCH v2 2/7] clk: spacemit: define struct spacemit_ccu_data
Date: Fri, 28 Mar 2025 16:02:27 -0500
Message-ID: <20250328210233.1077035-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328210233.1077035-1-elder@riscstar.com>
References: <20250328210233.1077035-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_140241_318604_B4980933 
X-CRM114-Status: GOOD (  20.05  )
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

Define a new structure type to be used for describing the OF match data.
Rather than using the array of spacemit_ccu_clk structures for match
data, we use this structure instead.

Move the definition of the spacemit_ccu_clk structure closer to the top
of the source file, and add the new structure definition below it.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - New structure is called spacemit_ccu_data, not k1_ccu_data
    - Don't check for a null match data pointer; add a comment instead

 drivers/clk/spacemit/ccu-k1.c | 55 ++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 44db48ae71313..5cadb395a7dd6 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -129,6 +129,15 @@
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
+struct spacemit_ccu_clk {
+	int id;
+	struct clk_hw *hw;
+};
+
+struct spacemit_ccu_data {
+	struct spacemit_ccu_clk *clk;		/* array with sentinel */
+};
+
 /*	APBS clocks start	*/
 
 /* Frequency of pll{1,2} should not be updated at runtime */
@@ -1359,11 +1368,6 @@ static CCU_GATE_DEFINE(emmc_bus_clk, CCU_PARENT_HW(pmua_aclk),
 		       0);
 /*	APMU clocks end		*/
 
-struct spacemit_ccu_clk {
-	int id;
-	struct clk_hw *hw;
-};
-
 static struct spacemit_ccu_clk k1_ccu_apbs_clks[] = {
 	{ CLK_PLL1,		&pll1.common.hw },
 	{ CLK_PLL2,		&pll2.common.hw },
@@ -1403,6 +1407,10 @@ static struct spacemit_ccu_clk k1_ccu_apbs_clks[] = {
 	{ 0,			NULL },
 };
 
+static const struct spacemit_ccu_data k1_ccu_apbs_data = {
+	.clk		= k1_ccu_apbs_clks,
+};
+
 static struct spacemit_ccu_clk k1_ccu_mpmu_clks[] = {
 	{ CLK_PLL1_307P2,	&pll1_d8_307p2.common.hw },
 	{ CLK_PLL1_76P8,	&pll1_d32_76p8.common.hw },
@@ -1440,6 +1448,10 @@ static struct spacemit_ccu_clk k1_ccu_mpmu_clks[] = {
 	{ 0,			NULL },
 };
 
+static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
+	.clk		= k1_ccu_mpmu_clks,
+};
+
 static struct spacemit_ccu_clk k1_ccu_apbc_clks[] = {
 	{ CLK_UART0,		&uart0_clk.common.hw },
 	{ CLK_UART2,		&uart2_clk.common.hw },
@@ -1544,6 +1556,10 @@ static struct spacemit_ccu_clk k1_ccu_apbc_clks[] = {
 	{ 0,			NULL },
 };
 
+static const struct spacemit_ccu_data k1_ccu_apbc_data = {
+	.clk		= k1_ccu_apbc_clks,
+};
+
 static struct spacemit_ccu_clk k1_ccu_apmu_clks[] = {
 	{ CLK_CCI550,		&cci550_clk.common.hw },
 	{ CLK_CPU_C0_HI,	&cpu_c0_hi_clk.common.hw },
@@ -1610,9 +1626,13 @@ static struct spacemit_ccu_clk k1_ccu_apmu_clks[] = {
 	{ 0,			NULL },
 };
 
+static const struct spacemit_ccu_data k1_ccu_apmu_data = {
+	.clk		= k1_ccu_apmu_clks,
+};
+
 static int spacemit_ccu_register(struct device *dev,
 				 struct regmap *regmap, struct regmap *lock_regmap,
-				 const struct spacemit_ccu_clk *clks)
+				 struct spacemit_ccu_clk *clks)
 {
 	const struct spacemit_ccu_clk *clk;
 	int i, ret, max_id = 0;
@@ -1648,15 +1668,22 @@ static int spacemit_ccu_register(struct device *dev,
 
 	clk_data->num = max_id + 1;
 
-	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		dev_err(dev, "error %d adding clock hardware provider\n", ret);
+
+	return ret;
 }
 
 static int k1_ccu_probe(struct platform_device *pdev)
 {
 	struct regmap *base_regmap, *lock_regmap = NULL;
+	const struct spacemit_ccu_data *data;
 	struct device *dev = &pdev->dev;
 	int ret;
 
+	data = of_device_get_match_data(dev);
+
 	base_regmap = device_node_to_regmap(dev->of_node);
 	if (IS_ERR(base_regmap))
 		return dev_err_probe(dev, PTR_ERR(base_regmap),
@@ -1677,32 +1704,32 @@ static int k1_ccu_probe(struct platform_device *pdev)
 					     "failed to get lock regmap\n");
 	}
 
-	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
-				    of_device_get_match_data(dev));
+	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data->clk);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
 	return 0;
 }
 
+/* The match data is required to be non-null, and have a non-null clk pointer */
 static const struct of_device_id of_k1_ccu_match[] = {
 	{
 		.compatible	= "spacemit,k1-pll",
-		.data		= k1_ccu_apbs_clks,
+		.data		= &k1_ccu_apbs_data,
 	},
 	{
 		.compatible	= "spacemit,k1-syscon-mpmu",
-		.data		= k1_ccu_mpmu_clks,
+		.data		= &k1_ccu_mpmu_data,
 	},
 	{
 		.compatible	= "spacemit,k1-syscon-apbc",
-		.data		= k1_ccu_apbc_clks,
+		.data		= &k1_ccu_apbc_data,
 	},
 	{
 		.compatible	= "spacemit,k1-syscon-apmu",
-		.data		= k1_ccu_apmu_clks,
+		.data		= &k1_ccu_apmu_data,
 	},
-	{ }
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
 
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
