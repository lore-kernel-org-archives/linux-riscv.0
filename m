Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A1FC36005
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 07:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1kXF9PbMbticclpOripiRfzx9h0qYnpLQkxtgtD6Ock=; b=4yGKpZaq8wjKh8
	RJ9uVyrNiNHmBtCBn3H2WivHEbeGiiu6yrkGQF2MzPWxp4FyTGl6HrsLax97bAw+bcy/qdiWU+VfJ
	b+/G/AgH2NJ2h0R1cJHVhe2jhtaHGp30NZCEH5c2AAaljYKFfuCUxBX4yQTpvR+SclPuZZANswSc8
	whmXABoU6VfJCvGbqY6tWne0MSeUl6f+5/r4QRmqsj79YIkGK9ajJWTnLrgLyDhqdBUMcc3VDogyp
	Nn/0tKhQOjipA5RF6gWEQExno65Vs8eQVEc+wUiLyWbvU8DeyV2Bj0xX6XhGRzTVHCyVvOjmQ/6rf
	hcFVvgf4nQ7IdibQIiRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IqB-00000005EgS-2htB;
	Mon, 28 Apr 2025 07:23:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9InL-00000005E1i-2bht
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 07:20:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E76F44732;
	Mon, 28 Apr 2025 07:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE7BC4CEE4;
	Mon, 28 Apr 2025 07:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745824851;
	bh=5tPn82Z4K4C3F6jERk27M/8ekeMYd4Wx2QdTkLSm6RU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iEEvrYUwjp5iD+Fwc8MWJgYhGQRqUuE9fE+OTTYmEvR6lmLht2I+gnmBlAN9+ZWDo
	 oejuqWMM4LZLxEfzZ06PO+Hc0+jhsD0XxXffO/s5ofPgBkkzGoY0MCO/7YENkyWVcD
	 k35jZGWBRIgpA/53uaolNXyMfakImTsgEE+56sWE/FeMucH7ii6bjvZLEcvrtXV8kH
	 rIxucaj2U0WIS2SOYNrtY8TPKZ55/E0x/8OeEuoB3yU3on1KT59kc09plYHP2uy5hD
	 hSA21tKdd7XQ6U67JnwRgpgNX9xst/5/U8DRcbnxmOeC/Tv/9ZboLx+FWN3FgQCzqX
	 SaicGIYWeHBlQ==
Date: Mon, 28 Apr 2025 09:20:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
Message-ID: <20250428-smiling-azure-sunfish-7c1c25@kuoka>
References: <20250424062017.652969-1-uwu@icenowy.me>
 <20250424062017.652969-2-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250424062017.652969-2-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_002051_683539_FD245878 
X-CRM114-Status: GOOD (  13.85  )
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

On Thu, Apr 24, 2025 at 02:20:15PM GMT, Icenowy Zheng wrote:
> The JH7110 SoC could support internal GPI signals to be routed to not
> external GPIO but internal low/high levels.
> 
> Add two macros, PAD_INTERNAL_LOW and PAD_INTERNAL_HIGH, as two virtual
> "pads" to represent internal GPI sources with fixed low/high levels.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> index 3865f01396395..3cca874b2bef7 100644
> --- a/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> +++ b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> @@ -126,6 +126,10 @@
>  #define	PAD_GMAC0_TXEN		18
>  #define	PAD_GMAC0_TXC		19
>  
> +/* virtual pins for forcing GPI */
> +#define PAD_INTERNAL_LOW	254
> +#define PAD_INTERNAL_HIGH	255

Why this cannot be 20 and 21? These are not values for registers, but
abstract numbers.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
