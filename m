Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0732BC3DA7A
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 16:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8PZtKu6IDM+R0b4juhyVN1MVpXVxACAdFtCi3X/YTs=; b=a8PnaQBdgBl9eF
	5coSEpzFQgnmUSPClMairBTmeyM5gdCe7zDZYqc45qS1/KsCgV0vUSTQm6yDQdTGahJ4VBszYcbl5
	EtutzBAUxSNpXkcTezF4FyEN2P3CtnBDQ6p3Fd3TCPO1zkhkLzUc215iDmpDLvfgd+KlFo3EJ7eKK
	gBJmWv4wY0P5ucq/fD8m2LcNnYWFzLJ7K2Lrr8lr9x3e36xIeoJqK89e/8plE7trZLvSl2cfoy8ev
	jFZDJ9wzytLW6GkIHkVCTmi/URXeKktL1X9h+MhXDJyWD2cICV6mtF/qBdwcDVcAla3rOemQ76Ycv
	7mSSqkSHyhc23/BHrIlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBf1d-007eUj-31; Sat, 31 Dec 2022 16:48:01 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBf0E-007dgG-Iz; Sat, 31 Dec 2022 16:46:36 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id E78D55C00C9;
	Sat, 31 Dec 2022 11:46:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 31 Dec 2022 11:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672505193; x=1672591593; bh=UI
	LhNGgAzXEExQUtc1nNgyH89N42rlAHuhv77zefq20=; b=wxutMGFlw5JuLTULHY
	ICfG5YZe8MGmJd13HbOs49Rwr1BTJMYmTJF7RanCKX5v/pIkIolcu+XB0QPs1t0p
	aF1VCBdvM5FTYjuOr32gnnPH6li9riPD1+THcukilntiAQM5f8Lr1V0asrRbTZuX
	ebwljvg691LN4J1kTgjOnbCXV1NQKfkd92CxbDamvNCeUlwEmAdtzD2N6zKInssO
	zZsFCInQpe9DcmlIqrTgNkWTPvyhDM7vCdXwvAGRXvBBLriK/BOTb+UqDASfw4Sx
	t8OwQAxuKX6DgWip+gW/dAQ7cNeHxVrfpQW4AJYAz6v2WSPCe/SpXivmILbW5q/H
	K2KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672505193; x=1672591593; bh=UILhNGgAzXEEx
	QUtc1nNgyH89N42rlAHuhv77zefq20=; b=W2R7B7UuVmY4PqOUJ+Pl+jCR/n30I
	VMu3xI5IzfzIP6Lrql/4T/GS/1dlwjRt94y+iiHvd4lcQwmvbxQpSkBxUp031GmL
	/IKlHLiSH0FzMOhe0/7UEVELnuabns1r3GcAqNE6nNlI7Hx9SxAIoi4yxeXbX255
	frFsMCHFdpXim881nK1biCZ1t3+rG7KtP2bAR20b+jZS0zmTUEF6YgE2eXtey12x
	c43W9rNxo3KgHruxdCOekj4cZ4LKsYriH58CU3YQIBtGhNpoiTfB6qVcmQBKQy8j
	izezOOA7eQxXFQrrecJONMccXkb/YqLk95Eyl8p3KeqCnhoqkCWMXPAjA==
X-ME-Sender: <xms:aWewYwmnzfLZgQzcm3nf__685uZkbcKHVWv_anSvtZJzwLzUGdn2XQ>
    <xme:aWewY_1Q5Dc31wrZg7_KgDv9iTJWJkjkIGgzroXCl-TKOpfVqF-mDRAFNia7O45l8
    xNEsUZBUaBwsAmg6w>
X-ME-Received: <xmr:aWewY-ohlvMzAoDd_F8B7RyDXya3X5II5SGadfvb3PQL_62ouHdj99VDXX_Qv5DkRHTGNx3FUiLgN4f6x1IdIKfZTRbi90IP2vHV0sqeokFUhrjt1GHGbzZoVV-VHyYydqbivg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieekgdelvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:aWewY8kYAA4LnC0T8wuzl6f9IgSvnl4T3d1e8hmiNx1tmxB5_XSiiA>
    <xmx:aWewY-3n3m_muuWkRR1FDc0Yqyaa45FxoB1Usrxu74aWcDsNfRW_Ug>
    <xmx:aWewYztKqru5VnxSO6czmIVMtDtyUnPGX5vd6PiXAtdFBAZCesJ-Iw>
    <xmx:aWewY1uVhnRUWthpZvDARZ3F6H_BxiJh74M-E_-FvdTWnMhKDjAnQg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 11:46:32 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/4] media: dt-bindings: cedrus: Make allwinner,sram optional
Date: Sat, 31 Dec 2022 10:46:25 -0600
Message-Id: <20221231164628.19688-3-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221231164628.19688-1-samuel@sholland.org>
References: <20221231164628.19688-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_084634_744238_B46E6365 
X-CRM114-Status: GOOD (  10.48  )
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

Allwinner SoCs can remap some bits of peripheral SRAM to a contiguous
range of addresses for use by early boot software. Usually the video
engine's SRAM is used for this purpose, so its mapping must be switched
back before the hardware can be used.

However, the D1 and related SoCs use the DSP SRAM for this purpose. As a
result, the video engine SRAM is not switchable, and there is no need
for an allwinner,sram reference in the devicetree.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../bindings/media/allwinner,sun4i-a10-video-engine.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index d5be7f604e8c..74363b242fff 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -73,7 +73,6 @@ required:
   - clocks
   - clock-names
   - resets
-  - allwinner,sram
 
 additionalProperties: false
 
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
