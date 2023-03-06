Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79558C678D4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 14:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3VK9Fy2Pms9XtWFSr5xiEYtJmea8waYnxjjOnKb5jkE=; b=hA7iuHMjdQYvyg
	zfaFmwoR29cABJJWiGp9tpccA21+M3Iw5sjKd9AQYgvwc5Zmj8EurwUfUKC4Smf8SlQXLZv1HsJXn
	YT+eQ8XGNdYxf+Hfmfu6vjhkkFb8pcL4Cy82sZd5Ntu1+LMikxxKXKvxc8eiPRhdXZXyZzrB6sTnB
	kcaMPiDZJIRy2Iz9blL7GN2Hj58xEqWHFlSkoQ2Stqey97sGyWO9D8/0MroJqt45GvynCxdiVzr2B
	WVA1F9QNu9yzyFQE6+i3rqtdIbJugB2DC/ADtg4I+GddohI4NjhijNw30wa2K/E7Rccvq8ITfdtmV
	7L2hq5hA5p40NsgqJSUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZCG6-00DTHa-KP; Mon, 06 Mar 2023 14:56:14 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZCC6-00DRGR-5K
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 14:52:08 +0000
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2878E412FF
	for <linux-riscv@lists.infradead.org>; Mon,  6 Mar 2023 14:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678114320;
	bh=/Ed2pnKpFihOgpPVhJbTQbuHmKlsVltnb1sm0Sd0bF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=a7/JSHVI51npvAWV0XP8n7D3hA3EGctpaj8WEazmLKtEsoDKufWJmBLi4sO9a0Udi
	 l7LOFg/QMl/5fJ51gjAT57GHgKYkB5JWwljy9l28AIf0VzNz+UuBCFd41bzQuRKA/k
	 3di35WLWGRt1ar9VXCDW9O1r1N+iUXOXOigJ8uK9EI8PUYhCKZyF42VWqmKYzM74Ro
	 Bww0A4tg+AwSYnrpwsFwr+OLBjQq+PLATL69bPddgcSKT7t5xY1IT7JuDOtb+EYXXt
	 KFp0q/dw1RYycp1USPePlWY9qBsEPEHfuFtA+cB4168xhWi5xvHHGadY+vsHIuUsIl
	 DrCKpbtR/BmZw==
Received: by mail-qk1-f200.google.com with SMTP id c13-20020a05620a0ced00b007422bf7c4aeso5570512qkj.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 06:52:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678114319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ed2pnKpFihOgpPVhJbTQbuHmKlsVltnb1sm0Sd0bF4=;
        b=RgI0FUylxGXzr6aeXUxcO9e32IN8d2WkAtnUmmJtRuVb2VZMOU9BUdXqoSE8T2B5JU
         In/Muv+Iyw+xTuzWG3DOzbiP/DqNWg3o9K3YevNwFxGwykUMy35Nd5OoQh7M9vC4iAnC
         MIhyiYMfebrACiY9pkXP9OikeL3vH+19zONYDbkuo6PAkJrjMdn1cFs+s4L5Q/ogXLWY
         ApAtCPQGQ/w7YpSxUmfWff+L1+nv7qh/3+wqsdVU1xZaSvlwZR15NUQKL2hyWJJIFExF
         c9mTtGJMC66IHX0BR/1v1zkP4XTql9xThoOp8etuNk6csY1QKDXsy7fJR0IuJxPyBgvT
         l+Dg==
X-Gm-Message-State: AO0yUKVpeS9j4XXqi+amyQll1hc1AvChAKEDp43fUXjyiuAqqPwUH8Gw
	uBcteugDe34yfCBC8MqGkySU962ehj12TVc8oBWNB+np//LoLnVnAvsGYo6T9K38VFuy69vQKgq
	EAqyvc5kL3YdFfegXDana7RqX9WgeJf+nBTnBYD6jCmgQzuyI2RMql8fUEawOaQ==
X-Received: by 2002:ac8:4289:0:b0:3bf:c266:da25 with SMTP id o9-20020ac84289000000b003bfc266da25mr2822558qtl.3.1678114319139;
        Mon, 06 Mar 2023 06:51:59 -0800 (PST)
X-Google-Smtp-Source: AK7set8hGVIO5dLFFjZH2MJTAfwE9FdnA1Tbubej5zA4FV5EKtDEGcMH23xPAGo7OGnX+zEfPlevEWgvQY4tT+oFLFQ=
X-Received: by 2002:ac8:4289:0:b0:3bf:c266:da25 with SMTP id
 o9-20020ac84289000000b003bfc266da25mr2822551qtl.3.1678114318908; Mon, 06 Mar
 2023 06:51:58 -0800 (PST)
MIME-Version: 1.0
References: <20230306140430.28951-1-walker.chen@starfivetech.com> <20230306140430.28951-4-walker.chen@starfivetech.com>
In-Reply-To: <20230306140430.28951-4-walker.chen@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 6 Mar 2023 15:51:42 +0100
Message-ID: <CAJM55Z9j79mar+bXrFEu3sZ=THY=LWwQbqQMf0AqgtUs2uJfwg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] riscv: dts: starfive: add dma controller node
To: Walker Chen <walker.chen@starfivetech.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_065206_381913_49187268 
X-CRM114-Status: GOOD (  13.51  )
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

On Mon, 6 Mar 2023 at 15:04, Walker Chen <walker.chen@starfivetech.com> wrote:
> Add the dma controller node for the Starfive JH7110 SoC.
>
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>

Thanks!
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 697ab59191a1..191b6add72c8 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -510,6 +510,24 @@
>                         #gpio-cells = <2>;
>                 };
>
> +               dma: dma-controller@16050000 {
> +                       compatible = "starfive,jh7110-axi-dma";
> +                       reg = <0x0 0x16050000 0x0 0x10000>;
> +                       clocks = <&stgcrg JH7110_STGCLK_DMA1P_AXI>,
> +                                <&stgcrg JH7110_STGCLK_DMA1P_AHB>;
> +                       clock-names = "core-clk", "cfgr-clk";
> +                       resets = <&stgcrg JH7110_STGRST_DMA1P_AXI>,
> +                                <&stgcrg JH7110_STGRST_DMA1P_AHB>;
> +                       interrupts = <73>;
> +                       #dma-cells = <1>;
> +                       dma-channels = <4>;
> +                       snps,dma-masters = <1>;
> +                       snps,data-width = <3>;
> +                       snps,block-size = <65536 65536 65536 65536>;
> +                       snps,priority = <0 1 2 3>;
> +                       snps,axi-max-burst-len = <16>;
> +               };
> +
>                 aoncrg: clock-controller@17000000 {
>                         compatible = "starfive,jh7110-aoncrg";
>                         reg = <0x0 0x17000000 0x0 0x10000>;
> --
> 2.17.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
