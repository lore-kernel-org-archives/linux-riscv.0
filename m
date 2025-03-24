Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736BCC36002
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 20:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcjWkUF6mCmYIaFUaBvgBdcwEBFSeLQtseTbGY7xmdQ=; b=GMZfW3fI10V/fS
	+ilcFrCfE7RSk2p3/HPq8ZrMvJvsxZAOMrM63UXikYDWlbDjrBPfVFLc2oxpKkV9kuQkPq1MOFT/Z
	ApGfYGUk/TgkI1x1QSobrX0y+w2iqpxdt54UHsPn2ubi1/W7BsdCnDT3tinKc7taQm8PCQTXAy4rL
	H1FkBz7aWzauerPLS/k/PPixiAyQB79qIGE+NlGuElm8wBTCqSUu11Tw4hmA0OgQIfu5xc9/4x91I
	/FOmQ5RQSKKUNj7txVw2DgUj+rLc1v6j25fnU/U7w8LjJ/zuSgMcxykPgvx6ojlpe0v5uhUgEoNRE
	UoLEjZWxULJSQS65aKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twoiQ-00000004EAe-1sBR;
	Mon, 24 Mar 2025 20:48:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twoSl-00000004CZd-0Oyd;
	Mon, 24 Mar 2025 20:32:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80E0943D0F;
	Mon, 24 Mar 2025 20:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD08C4CEDD;
	Mon, 24 Mar 2025 20:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742848318;
	bh=LDTKp3W7h188ixr/vX4U7f5V6ZusmxQCsTGFE63qb20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LT4IM+bMgEYMcruZeVIseTw5+f/xunSV2APT5kPRxD76MAc1Wg24Tz9VlF5iGCEJ8
	 YGA3pU5hhz60cKgndPvFxfYPqSfkx+uKYR8Ng1dEAgUkAuntkDeqdCo3O6sv9oZCQT
	 BHq12rVUyZKUjeLPjwOBkXH67myUVkzMBvIMF1tI162dpJ164PUMYyCtgJEvOJ6+XD
	 Ieh4KXL553HZi1EfaxUqE9ucsNEN6JV/54/KoUh5zaDIwxvyEDeXgIfttMQh0fCKGu
	 2QSf4KQPT+3uNDxjNU8LfOuup5OaEntF3WyDC49zxcpk7BtqntxOwdwWjdFc4D43NO
	 527MT5yxxsFBg==
Date: Mon, 24 Mar 2025 15:31:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Bert Vermeulen <bert@biot.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-gpio@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Maxime Ripard <mripard@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-riscv@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Shawn Guo <shawnguo@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Fabio Estevam <festevam@gmail.com>,
	Sander Vanheule <sander@svanheule.net>
Subject: Re: [PATCH] dt-bindings: gpio: Correct indentation and style in DTS
 example
Message-ID: <174284830296.819870.8907081146872259608.robh@kernel.org>
References: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_133159_150451_3303CAB0 
X-CRM114-Status: GOOD (  11.01  )
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


On Mon, 24 Mar 2025 13:53:26 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
> unused labels.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/gpio/atmel,at91rm9200-gpio.yaml  | 16 ++---
>  .../bindings/gpio/fairchild,74hc595.yaml      | 20 +++---
>  .../devicetree/bindings/gpio/gpio-mxs.yaml    | 70 +++++++++----------
>  .../devicetree/bindings/gpio/nxp,pcf8575.yaml | 24 +++----
>  .../bindings/gpio/realtek,otto-gpio.yaml      |  8 +--
>  .../bindings/gpio/renesas,em-gio.yaml         | 20 +++---
>  .../bindings/gpio/renesas,rcar-gpio.yaml      | 24 +++----
>  .../devicetree/bindings/gpio/sifive,gpio.yaml |  6 +-
>  .../bindings/gpio/toshiba,gpio-visconti.yaml  | 24 +++----
>  .../bindings/gpio/xlnx,gpio-xilinx.yaml       | 48 ++++++-------
>  10 files changed, 130 insertions(+), 130 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
