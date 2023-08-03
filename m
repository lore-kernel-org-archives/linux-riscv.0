Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1219C001DF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 20:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odUw8/02zOjESyykPZPAQmd6X42U05VrXlBdPiS2QUY=; b=qxBGs2vyK2ax4r
	GHgwuj083V5QlR3v0R73i8Q0ekqfH2ZgHWyWe07eFgPzjhJSxaldChazgLNuCPAt5Ys5PcMtW7Kld
	4LJRVEHl24Ct2O9QmZGBCzHDzdT2jY77jydefUGOUVtYICVbgf02rjp64YmQn23XT3cXTpQAIMfUK
	bgWtMbhYPB/bRkXfBTFlExWNulZ8SqXagADJWU82oyu/16mPtYjUQEotkWM96iR6rP1wM2KhJYDi/
	2183X8YTn8Yjb/My29WqerpjQr4d9wMXTCnw+aahVZKWdY5C1FW7e5VsKMQHzv9fR7QaU/jdj1LCX
	eLW9ZhiGzQSnXE0xk0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRfKr-00ArhU-0n;
	Thu, 03 Aug 2023 20:54:17 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRfKo-00Argz-2B;
	Thu, 03 Aug 2023 20:54:15 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3110ab7110aso1294468f8f.3;
        Thu, 03 Aug 2023 13:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691096050; x=1691700850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf1shgUQGecS6+2Jrf1Rltefiiin3z+1dw5kwESQLOE=;
        b=I6Svwboa/Lf/XyjqjzLySQ9kXd+YTlRJ8bqidzr0kT/mN0bm9TJmPdDtGmjQcXnC0g
         zBQcpCDi35SqsW4FPFXJHJj1RZUVxAG9y3+pn5FcNg+hMxFImMO4JlkCc7O3h49ok1V8
         G/20JB9KiEbch9eu2VgRw53YLAthzMbfB9hN0mvkNqWW9kQrPE/hV2NIulEL5VRoAnXS
         evmwhdHh7JDKmSF6Y/M4AdK9qWhx3PFjZO4y4hKiuXkoQ6gxswG6Axdus7k3PRoWYMTP
         4D7au3z7X+c80V1G7thDEkn34K/tsUprsXm94oz75+/9csJ5cy2vfl5U+fW7nNy78IwX
         KCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691096050; x=1691700850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gf1shgUQGecS6+2Jrf1Rltefiiin3z+1dw5kwESQLOE=;
        b=mAunjTloZBTi/s/KF/8O3vCutwtamV8dOidr0Z5sezCGdojqq9XUxHQa5hiD/nPQPN
         vBA00XETrwjZqod+R5HXAMUrjD26QRMKrO5eC5sp6lKrA8nnJO+gYypeMhnPjOtGW0JE
         b6qpTv/hwfwoJNKOF1boChoO07uday73AKJYFoJVj5jby1VbS8r1p9PJEiY8K6XqvGx1
         REsB8oKXFjnbul+NSQuw4YV5MQzgYyjD4w+BNjZ54HheJesrkFjvYrgdJbkkBjASaOV3
         O8UWzH3QTyMw3AJzXOu2VWuRSOtlOnxhmQWWb3c17MWRu4hLaOJ9tArzR6rv3nNymMT+
         z6JA==
X-Gm-Message-State: ABy/qLZoSFS33VPKuXkcFzPXsD4jRx+J3TKcDtqw0v8kByGRCAL+q4Hg
	pGGxXgINu4AQmouvDfpjMw8=
X-Google-Smtp-Source: APBJJlFSz8tLD3zPBalpC68JbS4T65s5zlyPapVF+FrzONfDahN32ei4XWvdQHLX7eTvk9Ddujpkrg==
X-Received: by 2002:adf:e105:0:b0:314:11f3:ca94 with SMTP id t5-20020adfe105000000b0031411f3ca94mr8109045wrz.41.1691096050225;
        Thu, 03 Aug 2023 13:54:10 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id d6-20020adff2c6000000b003172510d19dsm743046wrp.73.2023.08.03.13.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 13:54:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, John Watts <contact@jookia.org>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Specify default CAN pins
Date: Thu, 03 Aug 2023 22:54:08 +0200
Message-ID: <2151031.irdbgypaU6@jernej-laptop>
In-Reply-To: <20230731023701.2581713-1-contact@jookia.org>
References: <20230731023701.2581713-1-contact@jookia.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_135414_717866_27155CCD 
X-CRM114-Status: GOOD (  13.48  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, John Watts <contact@jookia.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

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
