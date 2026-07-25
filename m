Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30368C531C9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 03:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iy/re5uieeZg5Wu4/9m5kRR8CCKPGFQV956L2/ZT4wk=; b=3Kn7GwEoyIQd/Q
	xkqTBhZKaXF0weHzyP1ISgzR18g7ljiD4z4YXXITtyzN+Zxl58LMLQQh3kX/l3r5kijRTeOVMSpwo
	PvO/vpieBJLN2jnYNj1JI2DpmhHPkoj4BrnBjxmYr7djTF6ALASXMLe2gwUnpL+ZkCcc/nMg6mwJA
	XP4WZrpDSwwXmOWOlUe4XEAHPlR3JQHsK6CEaeeHPJL/L14HHKeUos7LIunlGxTIfcT/BJjd+KDRX
	G1fizx/Gti7xkrkXU658qlDEDUbsJC3sXpMnTLFs/AmpABtnSrQpisrLCEI3OE/F2oX8roWj4xEnN
	HKZ9dWl6sEfkEBqJjs5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnStp-0000000HXVb-2SGX;
	Sat, 25 Jul 2026 03:18:05 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnStn-0000000HXUr-1hue
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 03:18:04 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-ca24d39d8a4so634586a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 20:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949482; x=1785554282; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G9jy5raEKPdDIP6H9Rn1M27tE88CgVPDyIdAEUIQ/3U=;
        b=OKBYl323bN/vMz2/19OljPnBmLmSewNAnRNOOwKjbDcQnnMHddIsdwYFf4HL2RYEY/
         iNHchfnYNl1GuiwkBIiY6EVFRa9CvCuLYTsdeF0jLAu8gty6mpqlqkHI/9C3yPz837y7
         9vW5velHlPK2t7AuBD3y44mUEYYziPYTPpdN6cqeY1zGpasXpH+x6znXfUsIfuerUhu3
         wRHhPGo8hxhbj3OfOGKwTRB+0NTdcYfCuHG828CORDHPd+Gy8PuOk07y5NitxCP0yQ0N
         +H3b5msDrkvbCb+jrzyqO/uGDS3gNNFJpv0dRuYefigif0zewSvJI58w572h5wTAQ55v
         vU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949482; x=1785554282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9jy5raEKPdDIP6H9Rn1M27tE88CgVPDyIdAEUIQ/3U=;
        b=sHCtMkrHcPlU/ohqW952/jxXaJqxXBvgc9WCLyR/p8plgjFadbxoDS25y4Gw8LWJZf
         2/bLbNPGm7hKW7J0fTqeWXrAXNw33ep3arf90dfgOGH9wFjDiSaE7oHHlJgj3DHwpYOs
         C1kb1isQ2k0MiaT4SluzCNdsb/FpXgR1k5zK5B91YfdpSupmbZQS9ic8Rn8d+QpAuY0H
         2MHHfjn1SiC2y+ZdQY+YkoPLa4gixBmKj6OyJsmQf7/JZk3Zwx3S697kxQXr7sj/9ZQj
         7QCIAl+PE3zo0X79KZbGSLQ5Hw0W139RV059w3Vyc5NOZluFGGDMisUdvmkGV/uE52j5
         w2cg==
X-Forwarded-Encrypted: i=1; AHgh+RpQVG6ldqP6FP3Y4ZRDU8U/BjOyZvFv6eGWBNfUfwF0OwqkRQLN/b3GVKdx1KO1OxQX16CTcpTXuky0Ag==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpoXzSKePPb5lbMCXpEiB8E+xFzRBQ/eHXWt6BPDavkX46Sldo
	6fGFoEs5TrR/LQQ874qM4lWIR50dwgsL3l84l1EKiPyDUJyk56gFfv88
X-Gm-Gg: AR+sD11ItKnx3omNQT3aJTxXX/J/3R5EqIAlkR8L15saoho/nJ692iD5NdAP/EmOFPu
	FTt+1dVdlGJof7ctc3R2HCEJgYkAblZ2Pi0kJNUL+/waamj06KWbLyCMyEFdZqMd34H/e8EV/tb
	uRkHcpEOEv7m7fhffCVTI3p4FztyyypZcUsjeqDXeyb5KFxwLx7K79Ub/74BiMr1wRT98QE7qp9
	BRCDiKXIbQMi/YWIkbwfVf1WM0hg60DkNQYwJg5QJGgjme4Vc0SP8xjDnL5qYPRewJY+X1yjJAf
	8BOpEzamaR+hZ2gnqHAiNEUmDx8O9CD0BKl4ji2gZohYwxitkigg28eKocbsAH6irzISLzeuqmc
	BELITWhyPE0YtS7cvSD6ODE46w0MrCpxQThMhNe02Tqp37hmMRmuLAuISbHVsI+wWGQ==
X-Received: by 2002:a05:6a00:35cc:b0:848:44d2:72a2 with SMTP id d2e1a72fcca58-84e5944c07fmr653876b3a.27.1784949482608;
        Fri, 24 Jul 2026 20:18:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:18:01 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:38 -0400
Subject: [PATCH 06/17] clk: spacemit: k3: parent eDP/DP pixel clock to the
 PHY PLL
MIME-Version: 1.0
Message-Id: <20260724-k3-display-v1-6-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_201803_899255_7F4FA5CB 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

The APMU eDP/DP pixel-clock muxes were parented to a placeholder, because
their real parents (the DP PHY PLLs) did not exist as clocks yet. They do
now, so point each mux at its PLL and let the pixel clock reach the
controller through the clock framework.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 drivers/clk/spacemit/ccu-k3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index cb0c4277f72a..afbbbd797826 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -937,13 +937,13 @@ CCU_MUX_DIV_GATE_FC_DEFINE(ufs_aclk, ufs_aclk_parents, APMU_UFS_CLK_RES_CTRL, 5,
 
 static const struct clk_parent_data edp0_pclk_parents[] = {
 	CCU_PARENT_HW(lcd_pxclk),
-	CCU_PARENT_NAME(external_clk),
+	CCU_PARENT_NAME(edp0_pll_pxclk),
 };
 CCU_MUX_GATE_DEFINE(edp0_pxclk, edp0_pclk_parents, APMU_LCD_EDP_CTRL, 2, 1, BIT(1), 0);
 
 static const struct clk_parent_data edp1_pclk_parents[] = {
 	CCU_PARENT_HW(dsi4ln2_lcd_pxclk),
-	CCU_PARENT_NAME(external_clk),
+	CCU_PARENT_NAME(edp1_pll_pxclk),
 };
 CCU_MUX_GATE_DEFINE(edp1_pxclk, edp1_pclk_parents, APMU_LCD_EDP_CTRL, 18, 1, BIT(17), 0);
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
