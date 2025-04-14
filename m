Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91793C369BB
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 19:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOWqS0Z8eZrjncGs3ZTYTiKHejoPigqxpOyVUsFBiUI=; b=PO1TIkMhUlCdKN
	yUrSg8dYoumQ+T9a9KryRfuKanXXwK1IQ4yLzT4wtSLyqkffxdnim/ry9Uk/PcdJJKwaDpiAeW16V
	jOwVoD3Tn0HjhXGGGhdJh+KCRYnzdB0ur8mcu5xTTjAt5gfBx7brNjD6sRm4yYECvX1RFKtoaMkjO
	sfvhwBO4x1ZnR0UMFnhFfqdVziRtZTj6cQTg/AkyzMfEQDYSpqxwzxqBNyH/ePAQH6MWoI6Y1R7t3
	2ncjCS3S4hp6A0vcZAvu05dNY5wGJU04JcsXuQko13qcvHg9zbSh74+Wv/fmmJCPV8tmR/Tqis6VV
	nuzTtHGJGcc+2Afou6zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PN4-00000003JZx-0x7A;
	Mon, 14 Apr 2025 19:21:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PJq-00000003I2v-10FM
	for linux-riscv@bombadil.infradead.org;
	Mon, 14 Apr 2025 19:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PQupJEb/nO7YYkb/BsP/LHrq8C6tspApeBZ7h7HnR4g=; b=WmqWFyY54IROwtIIav41JcMbEH
	Ltfk8y9h2jMZYqgu9zRSVpFGxg6/qh5Ddaai6ifQ9iLLOPfRUaU8gSogJRAkUKSEgNiAqQm8hZwNH
	8Ot4dkQE0AxEdtjBnIiB/24vb27VNTXN0xKdaqDVIbNstR2uuCXgjWuGowUqZlG4NQh5t48AiK4f2
	L5oHRKZQ2ts8L3OzVOUfU7qAwWVQpEuNFQoPOWkzDVjafX8e8aCsesuj0n93dTgpn2xyw5tehZnd7
	4kJoHm6N2dCSxF3FvGoNLNe36NSdPdBzQ0WfvBAqGQQcqFWhEujuyXCIvL0IywIAaLxEoUKs0Pz0y
	nRP9w9tw==;
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4PJd-00000009l6h-2Ag3
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 19:18:08 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-85e751cffbeso365464739f.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 12:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744658244; x=1745263044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQupJEb/nO7YYkb/BsP/LHrq8C6tspApeBZ7h7HnR4g=;
        b=VGJg0JUxPYqK+G+jcu53DIbRJ5E7PTvqHAPDduenDf7k1I8vZBo7whNkR4KKHYz/Ot
         PFUZygctxhfs28GysEv6CnepPzX7ENSAiMOYFgajVFLvoSjxHV6INW4m52NizwLp0HJp
         DILbxp9sl6ipvpj3FnwtWjs0WaypvQga6SSZWhwXp9qUcDUQVz108DOfJqAg001OB3y6
         qThuEM0TmvmBWc+wzecRKUE1Io6672mkg/nfHiwZC81rGiVWmoXKVVpbtZxnNC31Ly01
         xCk0bgWGLgkTNtK39fFG/M6Ma8jDi3f5Nx0TW90axrBTCh6j7S78SEBSyqFw4CFuaAiC
         D3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658244; x=1745263044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQupJEb/nO7YYkb/BsP/LHrq8C6tspApeBZ7h7HnR4g=;
        b=J1RyRxhzMo7NHyza7GtlzKL6irG6LtqZoFcOfxWYa2YUodyjMsMG6VbufSLqRzjUDR
         jWpHAeuWsViXtL50f1MeZzl2FWDKLzQ0Yviyh8QmhxPZR4F31bHdUECNnE3X4cC+Xfaz
         olKPHDQyF3SPIOCX+mDgYTM0MyyJ2CW0NMEb0FSwMxD1fQt1Ts+q0x3OILd+GG2Pfz6e
         Obkmv+JeoQJ65Kmfhq+ZKMKnpHzrJehp2tYGDd4VGXAut84a4FBy0XIEXI5xYe8+o7eP
         ZF+6pNTQNhaUh/VJftyYi+hP7BIaTnTHyRRGGXTo2v48n/eypsUJKEDYCj4VUeCmPBdX
         xKhg==
X-Forwarded-Encrypted: i=1; AJvYcCXi3OBIl9jUbyXggdYjNATRim4W182hYpkgc1PtUNU+Sd66Arf8F4cyo0ss65dNHMUut8cxKxWnErliwg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqab6+ojPMjdGX00N9Uav5jHzadfbkIAkfVz7q8nxYqeWumTNl
	7ayoLlBy7d6dJxqHDXYIQaJdASVM126AT7GcUTsuBjLFNaCS7oGHbjvMzHIUL8Q=
X-Gm-Gg: ASbGncumkxpCrCrMkfjkGjVm1q1i6Sz4udRigHY5Dlg0eqaHzbCMmNZL6bBDYOo4kuS
	rQBOR58WsILT8rQ+Ev70ssgBBV3P7jRmDJpdp1j7sG/kGcm4UQ4zgKrvqEmswclTVYpUF0x+ADx
	s96arEcrjyEkEq9CKF8YIvyKu2mYf3hQU5YIlB/Eeec9JllW1UD9zmUq5Heby4WhyjlFIWPgoO3
	oDaAOF6qsXWl2fcdxFmzakyRvrAQgZVG3IbhdkPheSBID7ZVPNzMt8K7qLVLsg4Y19NO/jli+sH
	o6tUCvwAK7+kyz44nwOKLhxzMxnK4qDo4FPDhJbkwyEIya5FyoFXbl8cz6V0Ljj0qzjw6NAwR2s
	Ywymbv69mMzfE291ZH5ruip9L
X-Google-Smtp-Source: AGHT+IHzgkKPo3rteT6o1FQjeZVctNmK9CtfxtQBm7TMKIVPM8zC+qltuaZQi09FYGKSfneN1EH7HA==
X-Received: by 2002:a05:6602:4145:b0:85b:3885:1592 with SMTP id ca18e2360f4ac-8617cc32960mr1403266539f.10.1744658243876;
        Mon, 14 Apr 2025 12:17:23 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e026d1sm2715662173.94.2025.04.14.12.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:17:23 -0700 (PDT)
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
Subject: [PATCH v4 2/7] clk: spacemit: rename spacemit_ccu_data fields
Date: Mon, 14 Apr 2025 14:17:09 -0500
Message-ID: <20250414191715.2264758-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414191715.2264758-1-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_201757_678144_41A050E1 
X-CRM114-Status: GOOD (  12.60  )
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
---
 drivers/clk/spacemit/ccu-k1.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index a55957806db31..4db91c1b1d280 100644
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
