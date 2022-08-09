Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CF2C19F2D
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Aug 2022 14:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6I5zrxkSHvI1IHbk3lTtxO8+JLjmweaTwHVzEA2enBM=; b=JUXwCfFSJ3+jZp
	Xe1i2gTT7R2iNtCs1hcyenMMxxMNg5rsBnkCMebC6U1ii2IJSlFUyLg90MLbjjwNBo1aDYXfOi+Nh
	peUTcz4Zz9zUcdKvq4Rceryw1HasFGCCsL1+fPRu78DW4+JZamX20OuX23+lPlsYciKepNdm+7rxx
	ARfhz0Hvih7qiHzauP5LjrCoTmKAq5vWcwj1f0l5j0wQk5r4G3F6B1uwuzfo+8xi/TnY3zkYKl7P6
	Q2RuF3jBPGSvY+zMK2UuKhCrR6M4lNYnMAZ9Vf/STUyl6JcOx/4gyeY0nknLCokc3k2c5yMn1XNaq
	EhHgElawQPU9AdbwPF2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLQ2E-004K6I-6d; Tue, 09 Aug 2022 14:16:42 +0000
Received: from mail-il1-f180.google.com ([209.85.166.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLQ2A-004K3Y-Vc
	for linux-riscv@lists.infradead.org; Tue, 09 Aug 2022 14:16:40 +0000
Received: by mail-il1-f180.google.com with SMTP id p10so6574080ile.5
        for <linux-riscv@lists.infradead.org>; Tue, 09 Aug 2022 07:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Q9mXyBIsDcHFkxvhhPAewKIvUVNC7xu4zQ9cHub7pU8=;
        b=wl4fpsVRynld5GKu6EKnzs73+EP5Vf7F+kJZNubka+mo6w8bXfPkpCKHYvfFixNdK4
         NpHFFxmBFFDoQyWpBrQPphNjmDZSyqbv4/DMLnWDCC7Y78qA/dIIbmjvumshv3BxySBm
         7u/dks7j3Ji8O4c3C8OLrQkFfntg15yRdwHU1iJRHadxQzLCZfZ2osA3eJyARvAbrCd6
         JoCG+HQUmXoXQZVkD4WmRSJHHuhtsEKmI4ejTju175BMqA2pJEGMZ3id4Mi2MPgyk+Zs
         LvTwQNg2o6qADAx3KYIuJNqREWOcXIDMm1zgAdiDYD0xVw4HPQ37Ia1HfHeEtrpfteeh
         lWxA==
X-Gm-Message-State: ACgBeo1Te6cnQ7wjvXNiYafMTUR2gsWDqCYYRPmI6D6HgUbGWkPKHxcI
	nB4JnyEl5poyA4lZc7Y8fg==
X-Google-Smtp-Source: AA6agR5sKNiD1jY7asRAYAJjA4Ioov1LBgXDA+f5syLv9nnxp52HOBVCeed/e86Hnn99NJMdjRx1Dw==
X-Received: by 2002:a92:c247:0:b0:2df:2e4d:5930 with SMTP id k7-20020a92c247000000b002df2e4d5930mr10661115ilo.229.1660054596321;
        Tue, 09 Aug 2022 07:16:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b16-20020a05660214d000b00684a7617f14sm1144598iow.10.2022.08.09.07.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 07:16:35 -0700 (PDT)
Received: (nullmailer pid 1749632 invoked by uid 1000);
	Tue, 09 Aug 2022 14:16:32 -0000
Date: Tue, 9 Aug 2022 08:16:32 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Sagar Kadam <sagar.kadam@sifive.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH 1/3] dt-bindings: timer: sifive,clint: add legacy riscv
 compatible
Message-ID: <20220809141632.GB1706120-robh@kernel.org>
References: <20220805162844.1554247-1-mail@conchuod.ie>
 <20220805162844.1554247-2-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220805162844.1554247-2-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_071639_039537_3A65FC5E 
X-CRM114-Status: GOOD (  17.49  )
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

On Fri, Aug 05, 2022 at 05:28:43PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> While "real" hardware might not use the compatible string "riscv,clint0"
> it is present in the driver & QEMU uses it for automatically generated
> virt machine dtbs. To avoid dt-validate problems with QEMU produced
> dtbs, such as the following, add it to the binding.
> 
> riscv-virt.dtb: clint@2000000: compatible:0: 'sifive,clint0' is not one of ['sifive,fu540-c000-clint', 'starfive,jh7100-clint', 'canaan,k210-clint']
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/timer/sifive,clint.yaml           | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index e64f46339079..9fcf20942582 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -22,12 +22,18 @@ description:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - sifive,fu540-c000-clint
> -          - starfive,jh7100-clint
> -          - canaan,k210-clint
> -      - const: sifive,clint0
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sifive,fu540-c000-clint
> +              - starfive,jh7100-clint
> +              - canaan,k210-clint
> +          - const: sifive,clint0
> +      - items:
> +          - const: sifive,clint0
> +          - const: riscv,clint0
> +        deprecated: true
> +        description: For legacy systems & the qemu virt machine only

I would drop 'legacy systems'.

>  
>      description:
>        Should be "<vendor>,<chip>-clint" and "sifive,clint<version>".
> -- 
> 2.37.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
