Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C2CC00528
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 20:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sE0pxn5UFNQp9PYveqCCAR0hwKNsM78Kuaaei0TI2A=; b=O21UZm5PM4task
	zd2YnOKh+t7/TJEN0DHSMBtQyHWRnOZOJPsZWrcya7lFJOkVm4r/nQ+ofwY4jjfyW2BLGiSsc0gFb
	BgsmD+FL6lHqoEpcxUDvAouVoGXrJIk8VCEvl4fzT6tuTWeekgXGNWfLUH8k/oSQiHZb7jSWOy4SS
	W9krxb/3B26WtMC/+PrRjRu4fYxdROFyA2Gsi3tL45oP0dbYqG/+q5SjUXE1TEn5+NoPqtNptTu0S
	8wwSwae0Vy/6XCIKRcYL9f8hmEHRjskArox3z1em82Zz+B1JBwQxIA2yL8B+yQLPHTAzjSQJ18FZb
	ZyMooLelQrFIZlYDNVXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRfQ7-00As8r-2a;
	Thu, 03 Aug 2023 20:59:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRfQ3-00As7r-2P;
	Thu, 03 Aug 2023 20:59:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe2d218eedso14424105e9.0;
        Thu, 03 Aug 2023 13:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691096373; x=1691701173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DP2b+AILmlpdJLSBdLdZp7i7Y6kRAXSbaj0B+upIxrM=;
        b=KzzRQ4S29CvAU+TMW8J+OxQJT0N2VhnDo449Nyam5kEaT/lCE1i/60oslFCK2Hsg9Y
         GJ8tR5nS/QQr2daknYxum4FyeNCoXDvPajZSppWA6fXsarteFlTEBTQle6I5+qDh5yVh
         ngnmh8QazL+AyBdq85o1BjPm/64gbyFgTStzkiooUU9Phj5GbPjSBKK5KeinEBVRMQLR
         MDoaI9uwvFjXnuP2iW6YwDSKktwQRl82ymGuY3S2+HdlfHslVj6n95vbQklGMBrrmdrM
         8IYb17FZ/8wMlU/YHeTfKrPsbOBC64FDYeO76bYT6bsFN3xrpmEJ2qCgl3q0dXPynKZV
         LtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691096373; x=1691701173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DP2b+AILmlpdJLSBdLdZp7i7Y6kRAXSbaj0B+upIxrM=;
        b=NB5ZsZv58LwFuXT/FyBqrW5W+fO+BuAjeBUGhaLiAQMcBlshNMH5p6EHZuoPD+qPpQ
         to4mO2bLcxvzAm6PJLY7Q/hn9MXmXWXx+AuqzrFpatn5W/j9C9aGgnRouJKl2iMCjExT
         CSrrEdsFUo8DwWB2vlGBDFxbajZcKTB5U6D0uhWll3X/BCKnZo8DZTP3uwrtk0q5kxSa
         8bRou+D6zofKfQIlyf9QMG3CnmK+uERCFxaK48RWH0qYMfIDcR/9jdDZhr882sYQ9oCS
         +1c5Dsodq01QMx8v+Kv3yjz552mCU/bnWtoFMzqLtZ617lls6Gednh6ucLyEmtlGV5Ta
         +uXA==
X-Gm-Message-State: ABy/qLaEVRSwTPwgZAg31wSuGHk0JFUWL7pz2Fc8mGRjEhmQ6U7pfvdE
	RnwU+MLKymfYh8TjG7yZ+fhadU0QG+T2Iw==
X-Google-Smtp-Source: APBJJlHHfuo6kBelJvqwbXH9kUi+80SC8CQMEFEj5k03HeeeLJcquEgoQREJ2cxFra7O+czacV7ZcQ==
X-Received: by 2002:a5d:69c1:0:b0:314:c9c:bc96 with SMTP id s1-20020a5d69c1000000b003140c9cbc96mr7821541wrw.7.1691096372657;
        Thu, 03 Aug 2023 13:59:32 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id u7-20020a5d5147000000b0031437ec7ec1sm770658wrt.2.2023.08.03.13.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 13:59:32 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, John Watts <contact@jookia.org>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Specify default CAN pins
Date: Thu, 03 Aug 2023 22:59:30 +0200
Message-ID: <3248110.44csPzL39Z@jernej-laptop>
In-Reply-To: <20230731023701.2581713-1-contact@jookia.org>
References: <20230731023701.2581713-1-contact@jookia.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_135939_789681_FDE2EE91 
X-CRM114-Status: GOOD (  16.62  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, John Watts <contact@jookia.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-riscv@lists.infradead.org, mkl@pengutronix.de, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

/cc Marc

Dne ponedeljek, 31. julij 2023 ob 04:36:59 CEST je John Watts napisal(a):
> There are only one set of CAN pins available on these chips.
> Specify these as the default to avoid redundancy in board device trees.
> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi index
> 4086c0cc0f9d..b27c3fc13b0d 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -898,6 +898,8 @@ can0: can@2504000 {
>  			interrupts = <SOC_PERIPHERAL_IRQ(21) 
IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&ccu CLK_BUS_CAN0>;
>  			resets = <&ccu RST_BUS_CAN0>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&can0_pins>;
>  			status = "disabled";
>  		};

pinctrl-names and pinctrl-0 are usually at the top. However, since there is no 
hard rule (I've seen it mixed), I'm fine with it.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Since original DT node entry goes through netdev tree, this should be picked 
there or it can be dropped there and I pick both patches or I can pick patch 
for later kernel version.

Best regards,
Jernej

> 
> @@ -907,6 +909,8 @@ can1: can@2504400 {
>  			interrupts = <SOC_PERIPHERAL_IRQ(22) 
IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&ccu CLK_BUS_CAN1>;
>  			resets = <&ccu RST_BUS_CAN1>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&can1_pins>;
>  			status = "disabled";
>  		};
>  	};





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
