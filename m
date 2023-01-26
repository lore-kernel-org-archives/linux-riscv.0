Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EC8C54E94
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 06:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fK+Kcj0wigJitSKuOfNMuXtTow3rOYMQfG3OqfRgnXk=; b=iSYNH+cjTDySQW
	OGvtBaSemTTz9w06K4556QmYKoEmXgkr/SADJMILos7mqZ0Y5SUrYFBjw46eTrs0kXQhg07lZKjV7
	D6NhYzy0f+gtojjHBPEGkMCf47vmFiIWMtv4NweO6Xq9AQ/gjr8tNdUefVBAzI12rOEyC56t8trky
	jOCbAkXI1meKWUQxAfKANJIptmFe8r9YBMOVRlLp1JXrpO46Dqy8oJmVmuFqtg71eg8jolXQZKSdE
	/wv/WjLqsHzXIC1m6jz+Nx0+xuTAAURq2fxcxSBnH4uPGypS0ikRLgVjzPYOkSUvfqNPaXArDEb7T
	NSrYe2M0lha+0OAZrNlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKvqC-009kFg-Tu; Thu, 26 Jan 2023 06:34:32 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKvq1-009kDK-5T; Thu, 26 Jan 2023 06:34:22 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 65C9C320092E;
	Thu, 26 Jan 2023 01:34:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 26 Jan 2023 01:34:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1674714859; x=1674801259; bh=pM4BStLL1Skg7XYi8QBrjhe75
	9beNnudPI+N5t2B+7k=; b=fcdfsYfbNuArt6RiTqBpWcKepcfZaPq1wXfDbqwCq
	x8fAjOwldYSJf9R4aZJoyJOoUzewDtDjLiS8fl2AgEMT3zhco/MMZUmz3Los98rE
	FfoxySb8yolewD6x3dQQVo2OxWv1MbQOuoAtQik3uedkMvG4k289uYFjDA9q0in3
	BQrPxq3MO7qu2HDPEvUe6kYggu5Iy55niel/LyWmaTTptMhNoVj3lE5ytOu2FkZU
	K1zQiSjhfXTM0qnRN+5FwKpNVEmtQI54uXeRyqEY7BL6jNB4W40RMIv/7ok59rgo
	2Pr7LyOhiLNYVrK/9cUPc9CIwOr7QGNutCm8wJtiecYkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1674714859; x=1674801259; bh=pM4BStLL1Skg7XYi8QBrjhe759beNnudPI+
	N5t2B+7k=; b=Z2tV6s0/t1DitCs9Q/rJfW9tb4dNUdqfCmI3qnROFrMxY9Ch4+6
	do+HlGjSdH8B7uWL6bWnIxxWA5T36WRgo7dQkewuIkb6n/m5jvup0tM5naeWzcWd
	cu51hnyoSqhMFT/ylZcXpjzgUX+L+thuB3Fijku8P+UDAfdlb89K0B0EAq7c2AQK
	E1wy0d8sqBH5X1TPWqJy+sCmVFfkLCAXrRpUxR1K2jbldwtEZbMlYr4fPQo/eEnN
	+dI8RmXat/s6RGq0H9p35PgRvFtD2tfgt7lRbGX1OHu0DwkOAkzg2UVwWk38U3O/
	M1BBti3djo89xgGINTZgUa2/m/tAVXcG/tA==
X-ME-Sender: <xms:6h7SY41wiFkNZXhR-rcMMy_ydx5D9SlyZa_5zwe3pHhrhIBbuEaN_w>
    <xme:6h7SYzG2KARsiy_joUPRqd_HG26HjzzIL-BCra36ZFW73Oz4O13UXTBu-LyXJ-xhG
    n5XoqB6GHO-1QQeXA>
X-ME-Received: <xmr:6h7SYw7xkcPwDdGGq10ES-71fehaOKH-uMyxrho5SPxgUpTs7cZoHigf6XG2jgV1J8JkiAXe8Y_5ZCOJylY_QlxHv1jL0FEOSie7h89V423QA78erd-wo0Dm0GxBSulKz6GuZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvfedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepvddtleeugeefjeetudejvddujeetteehveelkedvgfetgedtvdeikedu
    hfelgeevnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
    rdhorhhg
X-ME-Proxy: <xmx:6h7SYx2jgQWeAgkktSiNLoWATqc5HVM5awBfnJjzW75iLnjmUk-nYQ>
    <xmx:6h7SY7FFvpHvNkjZxI7jp0nsY8bv-da4GGgIw3sZmHGOxFm8yjr88Q>
    <xmx:6h7SY69Osz6m0B9IX4gDi1IECGPY64CYrxkaR5G66fXBLC8x9agKhw>
    <xmx:6x7SY7GsgiaYtpvbd4AVkjnK3y9hLZXARYD915kqu7PQKoPG2jTPSQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 01:34:17 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Conor Dooley <conor@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/3] Allwinner D1 power domain support
Date: Thu, 26 Jan 2023 00:34:16 -0600
Message-Id: <20230126063419.15971-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_223421_277043_A61D3BD7 
X-CRM114-Status: GOOD (  12.10  )
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

This series adds support for the power controller found in D1 and other
recent Allwinner SoCs. There is no first-party documentation, but there
are a couple of vendor drivers for different hardware revisions[1][2],
and the register definitions were easy to verify empirically.

I have tested this driver on D1 with the video engine.

[1]: https://github.com/mangopi-sbc/tina-linux-5.4/blob/main/drivers/soc/sunxi/gpu_domain.c
[2]: https://github.com/mangopi-sbc/tina-linux-5.4/blob/main/drivers/soc/sunxi/pm_domains.c

Changes in v2:
 - Removed quotes from "PPU"
 - Fixed indentation in binding example
 - Removed possibly misleading comment from the Kconfig description
 - Include a patch adding the device tree node

Samuel Holland (3):
  dt-bindings: power: Add Allwinner D1 PPU
  soc: sunxi: Add Allwinner D1 PPU driver
  riscv: dts: allwinner: d1: Add power controller node

 .../power/allwinner,sun20i-d1-ppu.yaml        |  54 +++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |   8 +
 drivers/soc/sunxi/Kconfig                     |   8 +
 drivers/soc/sunxi/Makefile                    |   1 +
 drivers/soc/sunxi/sun20i-ppu.c                | 207 ++++++++++++++++++
 .../power/allwinner,sun20i-d1-ppu.h           |  10 +
 6 files changed, 288 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
 create mode 100644 drivers/soc/sunxi/sun20i-ppu.c
 create mode 100644 include/dt-bindings/power/allwinner,sun20i-d1-ppu.h

-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
