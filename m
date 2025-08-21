Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4E1CA0EF8
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 12:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pf2pTo6C7VcyLDllZAEwFD1UMEeg1RNELrzGAjggvqU=; b=zpeRn0p9u4Z4Oh
	QsPQyhgXYAj+nRDdxlRjXGRYgWiTLFXLwe3VskLpYu5HplSc8iSzKYJYoyqXbZJskUofbxy4dQbfJ
	rNkAKa31KMWqm4k8awP8vMQk/wGjfqKRdNxkCQ6MwOT28iLPbgYirgXEPfC+XILz0nKxPb1xPG5Bs
	7qrpj1wBrF0gNbKnbhK1Q5wyXwMYRHB4aAFeSbTgSpqhXxHfIKRx0iZWpiG/aJVlv61a/NrYlHAeP
	DbXqOvkLXLFEzX4H1C6McTljdKXFd3rhmpDqbbWPwjvgL8c08t4Z9oI9sbhq5f4p/hsIVqpAj7M9U
	RTm155nchCW0trG+wzIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4B1-0000000Grvz-3khR;
	Thu, 21 Aug 2025 12:13:55 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1W7-0000000GOBi-2Vkq
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 09:23:32 +0000
Received: from localhost (unknown [180.158.240.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0CD3A340DED;
	Thu, 21 Aug 2025 09:23:28 +0000 (UTC)
Date: Thu, 21 Aug 2025 17:23:23 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lukas Wunner <lukas@wunner.de>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: gpio: Minor whitespace cleanup in example
Message-ID: <20250821092323-GYC1065530@gentoo>
References: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_022331_664971_B421F438 
X-CRM114-Status: GOOD (  12.36  )
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

Hi Krzysztof, 

On 10:32 Thu 21 Aug     , Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/gpio/maxim,max31910.yaml  | 6 +++---
>  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml          | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
..
> diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> index ec0232e72c71..83e0b2d14c9f 100644
> --- a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> @@ -80,7 +80,7 @@ examples:
>      gpio@d4019000 {
>        compatible = "spacemit,k1-gpio";
>        reg = <0xd4019000 0x800>;
> -      clocks =<&ccu 9>, <&ccu 61>;
> +      clocks = <&ccu 9>, <&ccu 61>;
>        clock-names = "core", "bus";
>        gpio-controller;
>        #gpio-cells = <3>;
> -- 
> 2.48.1
> 

thanks, for spacemit,k1-gpio

Acked-by: Yixun Lan <dlan@gentoo.org>
-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
