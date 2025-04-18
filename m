Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EB6C369D0
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 14:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upCjtaMgViBdIDR4N9waia3oMvTzmvzh460KJWwp3Bo=; b=1qKZyxnlgGffil
	7j1vrcRxuIAdCeySBM1V85O/NTvjKztVaFeTtqtgwFEFoJOX9HBmFT2YVVcQW7c5RIj2/uXah3fgA
	pgl7DLFJ0GS3y1xO2d7qofNI1TLurz/TRSN+dWw1U8iU7YdUXl7iGNBNvAd6zBVveKqOHPANThzBu
	ewOyCNIM9eGvfkWyyI3T6CvJzI3hK4N7nO1pIfKIIHQWsQmAewC/Tl8qfGiRAUBJKeGOwyhH6fp6H
	0bxGpqGz1Kb39LiYGMn1322zCkfBb/9tT/42sDu/AnjFTHEAxof69pkLEsm8jf0xwlLxZTTaw2SUM
	//LJ0LOFaFNl69r3DNAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n8D-0000000GWz8-07Do;
	Fri, 18 Apr 2025 14:55:53 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n6Y-0000000GWPE-0dHJ
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 14:54:11 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-476a720e806so16510491cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Apr 2025 07:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988049; x=1745592849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGLQrJG9/WVjMRDCZD5X9MgDJzulV+jWlnrfByD2cXU=;
        b=ckgX7QVwKMOOxByoNOtoRrNSelw65KIh/VJVT+bSeVdkLvTsWG5GoYEEX0FgGB6fQ1
         1b8tcNZ31cHjhh1bkkDHFwUfan2pBC8lhL48YLhg+9oOeEYshWkZI10CF3N8WjLCznZv
         LDYzbhRUnP4hQE+HV/t92g6WazYwvwjNbrDJiBtPB0D0+AtKZwxuy4qFj6XRIfSU5cgf
         cA5riP90hiseCeH4fKgKjbiNscCMyCrjQuJIozDuoVvzQDLRVCHgvdp/mRR/uqfCTsyy
         tUQNDmEP0Ysh7IDT/3NsvcBjtvx/pvT46hJothxG2YMUAmsfZ3tZdEkVKcXxMCeGnWQf
         Li0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988049; x=1745592849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGLQrJG9/WVjMRDCZD5X9MgDJzulV+jWlnrfByD2cXU=;
        b=KybzExJQVIk2CyHcgfW5LnejmDzO4EqIOzZTlvA7yAqTCMIrbpFS6dVYaRyBl+EG7k
         nMWQI3IAYwd2WdBt4nV3qRfSfDj1yJ/PGgfz7D6m+QjeBDDs6x9McrO5MFw2F2SMRXy3
         aR0wVHhuAu/aa/qcVJUp9qbR7/IXZDqR7unS5qmKxBEBkGGPOcjltfAnbpcthIkpQwmp
         ryBBkAIS3lU9R2T07OLWmz16VeB61oO0EUrbeBvfU1cYN7op1A2r7o90ExiaQvIS5Oj3
         FxTes41M5wIWasbgGJpBRDK8QRN7an79e9BOa85dKj3A21lQTI9WLfivKzkVPGVBYe92
         0ThQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0ObBiwtRuvFBvMkjwXcZvMP/Bhv4ynC3p00dmfSl9pSbYwZ2D0SObfmkBbTw2LhZS5ObQCsXSDmlfGg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl3LNEqUWNv1Aq2F5mKBEM0GDJ+Ggqi1VkD75Y16n3Xd+2Uxcq
	q6yPOkH/GOpyL7XOxoNRiNppDDUxjVm8qEjxgPXxY8lJ2vgKp/03wD2eGaED9GU=
X-Gm-Gg: ASbGnctnckV26EMdUJ0stu6eQDh5Iq1CPE5eWHRVb2L9Ab3v7Pz0i2kFM86yzMQX41Z
	6gqhv/uYrJhcK099RYqru31cr3AyIF1ybcCkp3/WaMSxQBRaNERpYJIoOAi/X45PhRvKlxxyQBA
	sbTx3p1O+7yGJvJUFmngcHOJe8aDq7JVBPpPganm9h2F04iCBX6pEmdAtu0oMtUDbbrLvEfpXiL
	3QLz37bYfYtBQuk3RKx4mOEiezaAYdaV34HDPMinukyZWJV9GuBWn9NTBnbKzGBVlDkl5uXIDuw
	R+7lHLxdvNvtGtSMMvXuSqBbvZnQ828yTMhCcdKhnolKJX4T532SJAqK/NsZnPz9WQjE7KTH8rO
	ES7Atac7xWaSJXA==
X-Google-Smtp-Source: AGHT+IHEqzlEJZsM9ibzpxY3pVimq3gvrY9lGtxVp45evTuL1ehJDJBIbt283Y62JHB4YPt3Xe3sXw==
X-Received: by 2002:a05:622a:1987:b0:472:133f:93ae with SMTP id d75a77b69052e-47aec4cf703mr39891641cf.48.1744988049055;
        Fri, 18 Apr 2025 07:54:09 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:08 -0700 (PDT)
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
Subject: [PATCH v5 2/7] clk: spacemit: rename spacemit_ccu_data fields
Date: Fri, 18 Apr 2025 09:53:54 -0500
Message-ID: <20250418145401.2603648-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>
References: <20250418145401.2603648-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_075410_192592_50985482 
X-CRM114-Status: GOOD (  11.96  )
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

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Haylen Chu <heylenay@4d2.org>
---
 drivers/clk/spacemit/ccu-k1.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index cdde37a052353..a7712d1681a11 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -130,8 +130,8 @@
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
 struct spacemit_ccu_data {
-	struct clk_hw **hws;
-	size_t num;
+	struct clk_hw **clk_hws;
+	size_t clk_num;
 };
 
 /* APBS clocks start, APBS region contains and only contains all PLL clocks */
@@ -819,8 +819,8 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_pll_data = {
-	.hws	= k1_ccu_pll_hws,
-	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
+	.clk_hws	= k1_ccu_pll_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_pll_hws),
 };
 
 static struct clk_hw *k1_ccu_mpmu_hws[] = {
@@ -860,8 +860,8 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.hws	= k1_ccu_mpmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
+	.clk_hws	= k1_ccu_mpmu_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
 };
 
 static struct clk_hw *k1_ccu_apbc_hws[] = {
@@ -968,8 +968,8 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
-	.hws	= k1_ccu_apbc_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
+	.clk_hws	= k1_ccu_apbc_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_apbc_hws),
 };
 
 static struct clk_hw *k1_ccu_apmu_hws[] = {
@@ -1038,8 +1038,8 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
-	.hws	= k1_ccu_apmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
+	.clk_hws	= k1_ccu_apmu_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
 static int spacemit_ccu_register(struct device *dev,
@@ -1050,13 +1050,13 @@ static int spacemit_ccu_register(struct device *dev,
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
 
@@ -1081,7 +1081,7 @@ static int spacemit_ccu_register(struct device *dev,
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
