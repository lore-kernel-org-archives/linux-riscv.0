Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72B8EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 16:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OcVnJehA+BFgo7rRCSVShkYlO7qoDwzeYbKPmarhKWA=; b=0Wf2LNn5X6eSn7
	oZnrnHPxK9XLPcLAmALDrhcFyUAojMzVumRLUGDM3+FuOWmK1sz79/GE+tkwYJhIo69j9pHQgfurd
	Z8HdxD7lFVwBH57j7zA2RaEe47xA6e3H3nhwIqo0HakxJdoBQDNprOyxTrLUR5TmPH2pPXl4wsdFs
	wiaWJOc3wvNAuUCz4MCyG3WxBfzu/rIgy+eZcbqNBb+2URrET6MtBvLj2yQOYUMesyI4lGym+s7To
	rA2iS9CegQ/7ah8+xxlCty1lxuQkGsXhuN7vIV6iYmwdY1ycDRZcep2kb/vNPVXzISFYPnaiSUR0C
	Yx3G0nm3vI92p1hIYSLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDp1x-00AeBT-1r;
	Mon, 26 Jun 2023 16:25:33 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDp1v-00AeAG-1r
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 16:25:32 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-991fee3a6b1so17475866b.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 09:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687796729; x=1690388729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Gm0byWzIZvJKygPvrq4jnlftwE0Yo5FdjhxVJ4PNAE=;
        b=Ne2KXk/Uoxjt97ZERJ/38f00T4yqTnRxlkmWt4VLueghpQYZEWTFslb+q07Ff90vnM
         Q28N1PdFvy+/osrZTUDE7KeufuDp2ox5iC5oeuQXj34xy8pUMSbviwC6rk2/GXilOiUC
         XKhcIQ6oCXUErTh+Piv/iQ3H++7KCUr8nka3/Fs071ly3b8u/2YfZNgOhW1pCNvBviMt
         U4wxrS2I5C4a/uO6S528BRMugKGVIVVCx2WTVtk+PxPQ5q86xMR4UQsTTIo2aYEc/3k2
         N3IalRFKkKRUcsC4/6jQlKke0T7sRrUYb7Drta4ykvBYgOJgrSzNkxfZnJVuuv/huCHT
         dWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687796729; x=1690388729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Gm0byWzIZvJKygPvrq4jnlftwE0Yo5FdjhxVJ4PNAE=;
        b=gsbWGn6/yr77tn2yylzl2UCyK8v0cw5+N2FpufFJWcysEgVmbQg7c53GnzBCvztcqT
         fTV2Ar4C6Cm1VshKJuj1KIQklBPo0+FG/1wncn18ON7xTWlLoQn3T0lkWT0Og6fsys5d
         bz64e6S697towLZ7M+ZDuRQIQHcbXcYt2NGHHHv0ii9wDlN849Tsv+GWoUeOck1/GwIo
         ZLjeIU9U89Ydw8PK31wjeuAzNG8sBquOS9UBwPoLzVXmzFNG0NYbuAYAW/xIcNJZ8oTV
         cD014CXGvM1sgtqY+V2BimeX7k+bSkS08e0ktfO++PPpoB1MrCnevQ28/tsqVYnNFVDT
         VDhw==
X-Gm-Message-State: AC+VfDwRe7Cj3rDFqO7haGdGKx/+jMnMO+49m/Qim9pWTiMumZSxhnsS
	PkFIeZVHuOseqHXL52Icgn+7WA==
X-Google-Smtp-Source: ACHHUZ5aBiBeSUxla3z5EaON8Xp718BV5eWXZ6FB6tziHGOH3UN4WTuOXox8wp/dqsGVNjWJGveLrQ==
X-Received: by 2002:a17:907:97cf:b0:991:e961:a5f4 with SMTP id js15-20020a17090797cf00b00991e961a5f4mr1361813ejc.20.1687796729364;
        Mon, 26 Jun 2023 09:25:29 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v8-20020a170906338800b0099027b40d85sm1716900eja.112.2023.06.26.09.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 09:25:29 -0700 (PDT)
Date: Mon, 26 Jun 2023 18:25:28 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v1 9/9] RISC-V: try new extension properties in
 of_early_processor_hartid()
Message-ID: <20230626-9ed40a55c71d2fe50ed3b8da@orel>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-ardently-caress-7c5886566ea6@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626-ardently-caress-7c5886566ea6@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_092531_614790_E45EBC79 
X-CRM114-Status: GOOD (  18.44  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 26, 2023 at 12:19:47PM +0100, Conor Dooley wrote:
> To fully deprecate the kernel's use of "riscv,isa",
> of_early_processor_hartid() needs to first try using the new properties,
> before falling back to "riscv,isa".
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/cpu.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 046d9d3dac16..332574f27c95 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -61,8 +61,29 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
>  		return -ENODEV;
>  	}
>  
> +	if (of_property_read_string(node, "riscv,isa-base", &isa))
> +		goto old_interface;
> +
> +	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32i", 5))
> +		return -ENODEV;
> +
> +	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64i", 5))
> +		return -ENODEV;
> +
> +	if (!of_property_present(node, "riscv,isa-extensions"))
> +		return -ENODEV;
> +
> +	if (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
> +	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
> +	    of_property_match_string(node, "riscv,isa-extensions", "a") < 0)
> +		return -ENODEV;
> +
> +	return 0;
> +
> +old_interface:
>  	if (of_property_read_string(node, "riscv,isa", &isa)) {
> -		pr_warn("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hart);
> +		pr_warn("CPU with hartid=%lu has no \"riscv,isa-base\" or \"riscv,isa\" property\n",
> +			*hart);
>  		return -ENODEV;
>  	}
>  
> -- 
> 2.40.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
