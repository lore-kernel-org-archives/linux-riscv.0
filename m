Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922BEC19F28
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Aug 2022 17:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVdWvY37m/ygj39WC9LPQz+IwlofnUZGBlbIy6DH1kM=; b=eG/GMlWVwVcXUv
	/FmM8YmCMhdwFkEoU13acNh9v3VDYJoPeBjS4rTsrpSTSgnOHneT3GPNaigKsDwhijM37oV/G3YYy
	uIZGNfvDAuNi00B4ILOAQcLAghIKEsDizAB7vpen5+aQ8LSafTpKVtGWDNgObZ0Z1ghd+PZsUOICm
	ZizQ6ScDdYbIRJ6otkOGNyMiGXH4BY8//C2hS3xVn+dEWjXpGtk3Ws6VvQ9tyGPhxpBsRbJWFObB9
	aQCvKC43zwruCIPJtCewelgFzt4MUCiUzNbP0O//VikDO6LESmQ2ZetgBTsQHGt8zvOOM2z9zYk2P
	O6yiujP0U7pwP4eFUXdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJHtc-007nQW-KV; Wed, 03 Aug 2022 17:11:00 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJHtZ-007nNS-Op
	for linux-riscv@lists.infradead.org; Wed, 03 Aug 2022 17:10:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id p8-20020a05600c05c800b003a50311d75cso757175wmd.4
        for <linux-riscv@lists.infradead.org>; Wed, 03 Aug 2022 10:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=1fAk4ASz3j0xha63REYMD8PuhThvSqQh4ahLrujukbo=;
        b=fs8yHgiyhdA1z0EfcjsTOlbF/Qf13OpncAruAPpIot21aLel7s2ehUdyenO25g6CQj
         NVUtOYE2bsobRFwH8pWvNKZGKGKh2++uX78eKQKbOSvpp049wjuIeULxUWj4DmU1l6Ie
         78yNqus2CplIZdOcptHaiVXjJZjNzhv9CGbHZ55Q86RgVAuQLa8eEtZ0UDxLJyQBpXes
         YAdyLSUklyNf/ZNpfzEOB+FUj6SEkUGmLO8kj3dc2jFTrj2U9TGfv2IGhgSXJarD1UFp
         AAtuAJIOWf/ylmYmEWjK2c/vJ10ZklcAXN+aHqDur6Qkk6ebGjYwdLueICwtvwTbeqLP
         Ytrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=1fAk4ASz3j0xha63REYMD8PuhThvSqQh4ahLrujukbo=;
        b=e4cGnISbeZ7wRmDGhl+/D0PqtDIzyaNhQozmpAphtMq6toOdr15S3oWtffWAvyyYgQ
         dU040BRqfVHpesQiwF2PVp9m3Z6dUOT3VIehbkf4vju6tuiJWT7mmyCtCfMiZY1WFGnn
         xJoDalzuq1eO49v+CQqoAPHdUlPQWfcmvw/u+eT6sotnF3IDNNPSLGh/7izoOv8pI5pm
         lijOLbr6uWy3E+4DZFuDDN1dAY8NZR+pPceO6RYdNl1lLVWkc06mzXt+Qqi5aPFpO5M6
         PkESEdvcpImEnZtg/TT6OjqV2OhUp7pE+0s+e7mXokPWRjVoNB9EfE+qozz4W9a/UGYy
         0uXQ==
X-Gm-Message-State: ACgBeo3A0ccsG3JGwhfpDpY5OAjvitMWUzrgb4JN3dQzWTTw5qx6BmPR
	QoKf0gMfSkIQz5f4tuqmzsHP+g==
X-Google-Smtp-Source: AA6agR5gNYn6xzGqz1YkXULMVMLoYYGFqBEwcNhkUvbXkMokw4Rv8B9RQK07KqPxYcYtx73VEWTlDQ==
X-Received: by 2002:a05:600c:4fc5:b0:3a3:2d73:c147 with SMTP id o5-20020a05600c4fc500b003a32d73c147mr3525753wmq.197.1659546652339;
        Wed, 03 Aug 2022 10:10:52 -0700 (PDT)
Received: from [192.168.2.222] ([93.107.66.220])
        by smtp.gmail.com with ESMTPSA id f8-20020adfb608000000b002207a0b93b4sm2791809wre.49.2022.08.03.10.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Aug 2022 10:10:51 -0700 (PDT)
Message-ID: <673492ba-caad-bbaa-4952-0ad1dac6eda5@conchuod.ie>
Date: Wed, 3 Aug 2022 18:10:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: DT schema warnings on Risc-V virt machine
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220803170552.GA2250266-robh@kernel.org>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220803170552.GA2250266-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_101057_878258_88799384 
X-CRM114-Status: GOOD (  13.01  )
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

On 03/08/2022 18:05, Rob Herring wrote:
> Hey folks,
> 
> FYI, I ran DT validation on the Risc-V 'virt' machine and these are the 
> warnings:

/sigh
There was I thinking I was almost done with dt warnings!
I guess I'll take a look Rob, thanks for the report.
Conor.

> 
> /home/rob/riscv-virt.dtb: cpu@0: riscv,isa:0: 'rv64imafdcsuh' is not one of ['rv64imac', 'rv64imafdc']
>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/riscv/cpus.yaml
> /home/rob/riscv-virt.dtb: soc: poweroff: {'value': [[21845]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-poweroff']} should not be valid under {'type': 'object'}
>         From schema: /home/rob/proj/git/dt-schema/dtschema/schemas/simple-bus.yaml
> /home/rob/riscv-virt.dtb: soc: reboot: {'value': [[30583]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-reboot']} should not be valid under {'type': 'object'}
>         From schema: /home/rob/proj/git/dt-schema/dtschema/schemas/simple-bus.yaml
> /home/rob/riscv-virt.dtb: uart@10000000: $nodename:0: 'uart@10000000' does not match '^serial(@.*)?$'
>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/serial/8250.yaml
> /home/rob/riscv-virt.dtb: plic@c000000: compatible: 'oneOf' conditional failed, one must be fixed:
>         'sifive,plic-1.0.0' is not one of ['sifive,fu540-c000-plic', 'starfive,jh7100-plic', 'canaan,k210-plic']
>         'sifive,plic-1.0.0' is not one of ['allwinner,sun20i-d1-plic']
>         'sifive,plic-1.0.0' was expected
>         'thead,c900-plic' was expected
>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> /home/rob/riscv-virt.dtb: plic@c000000: '#address-cells' is a required property
>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> /home/rob/riscv-virt.dtb: clint@2000000: compatible:0: 'sifive,clint0' is not one of ['sifive,fu540-c000-clint', 'starfive,jh7100-clint', 'canaan,k210-clint']
>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> /home/rob/riscv-virt.dtb: clint@2000000: compatible:1: 'sifive,clint0' was expected
>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> 
> 
> Also from the 'spike' machine:
> 
> /home/rob/riscv-spike.dtb: cpu@0: riscv,isa:0: 'rv64imafdcsuh' is not one of ['rv64imac', 'rv64imafdc']
>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/riscv/cpus.yaml
> /home/rob/riscv-spike.dtb: clint@2000000: compatible:0: 'sifive,clint0' is not one of ['sifive,fu540-c000-clint', 'starfive,jh7100-clint', 'canaan,k210-clint']
>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> /home/rob/riscv-spike.dtb: clint@2000000: compatible:1: 'sifive,clint0' was expected
>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> 
> 
> There could also be other warnings from non-default configurations.
> 
> To reproduce, dump the dtb and run:
> 
> dt-validate -p Documentation/devicetree/bindings/processed-schema.json riscv-spike.dtb 
> 
> (processed-schema.json is from kernel validation run)
> 
> Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
