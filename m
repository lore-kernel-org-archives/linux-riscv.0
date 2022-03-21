Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94794C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Mar 2022 18:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukukIJuuwwuCL/w1SwCLkEQmvS8W4Eh+dADAnMQVeA0=; b=2iJTLHrVTIDY2G
	R3YV4be3SeqxLzkZlr+1ND2F+0JzG98jpczCtBaxxUiH9jBmHj4qh2ZgC+zKyLSodajwENwSCtCAB
	AiasvIoGlVqNofnddgZtS4yrD6u+coIlzts76UMMXx+moU5OJGRz2KEQ2SmW9nLdQ1Plr94KKy2oZ
	Pro/rpg+Cc21oH6kgSsYefxweN+x+snqWDdJmFdttIZJ+a/86NZvlPIJAT5qWAS/LSO8SOHUha63N
	xG8ZMhnJXFHsH7VqbhNi1yiZhEvxirfANsvILOwiJgb1RvEvZW/9qkxKQyZLQKk1dQjCSJGAxB1hi
	2VFyi+Ng368FuDg9jkGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWNA4-008mAI-6K; Mon, 21 Mar 2022 18:53:48 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWN9r-008m7y-Hu; Mon, 21 Mar 2022 18:53:36 +0000
Received: by mail-oi1-f174.google.com with SMTP id q129so15214760oif.4;
 Mon, 21 Mar 2022 11:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a7Xyf2QArSyizp0F9X7a7N1r4113OGPHtnk41fQc9lc=;
 b=VHxVO0fVMQh48ajeouVgazPH0BE2717Z43+HH5kXaZKCHIyvp20idwIMP8Pzz9mDIh
 qtLn4uu4OyVvHA19PG04r+96vWbQhltkpdW4zAjH3xUAV8O+5O97mUcwgG6BwK9a6RMK
 k9pXdxEWc1wb5LfhB1ywSMJ3zCqLogQvD30AMDOKqZwhCAS/sNw13nF9xDGPiAbT/M1l
 yBKW0/Lqe5M/B50szKtn1PXO1X979EsHNWqDj7nv1ThQZ6BHDpFuEfexHN/MKZ6HCALf
 oYlYrxZsshCzHZwVWvcYiLtPRwk6l9sgYE/8yTKRLV63Sy4wXhZwWPnjWTZIo0SpR2Zh
 neAQ==
X-Gm-Message-State: AOAM531mK9SqOXGGs9ZNMT0re+dzDfbIq9cUwo7hJ2c/4yxu7b8viDrZ
 bYhndHcS+7FEq11AYPwvzQ==
X-Google-Smtp-Source: ABdhPJym1cVJ6hIiuqEDxMhZRQrspeqqkZR5PA/kFVaC8hdwQ5SdvwfkufWH3kcX6wu+LcnGMs9IxQ==
X-Received: by 2002:a05:6808:f88:b0:2da:850d:18f0 with SMTP id
 o8-20020a0568080f8800b002da850d18f0mr270615oiw.19.1647888810502; 
 Mon, 21 Mar 2022 11:53:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e8-20020a9d63c8000000b005b235a56831sm7783461otl.49.2022.03.21.11.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 11:53:29 -0700 (PDT)
Received: (nullmailer pid 359469 invoked by uid 1000);
 Mon, 21 Mar 2022 18:53:27 -0000
Date: Mon, 21 Mar 2022 13:53:27 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, 
 Krzysztof Halasa <khalasa@piap.pl>, Michael Walle <michael@walle.cc>, 
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Daniel Palmer <daniel@thingy.jp>, 
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Birger Koblitz <mail@birger-koblitz.de>, 
 Bert Vermeulen <bert@biot.com>, John Crispin <john@phrozen.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sagar Kadam <sagar.kadam@sifive.com>, 
 Suman Anna <s-anna@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-actions@lists.infradead.org, openbmc@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-oxnas@groups.io
Subject: Re: [PATCH 00/18] dt-bindings: irqchip: include generic schema
Message-ID: <YjjJpxLWJ/YOe0OX@robh.at.kernel.org>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_115335_623433_D8D3DD5E 
X-CRM114-Status: GOOD (  12.51  )
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

On Thu, Mar 17, 2022 at 12:55:24PM +0100, Krzysztof Kozlowski wrote:
> Hi,
> 
> The DTS patches can be picked up independently.
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (18):
>   ARM: dts: nspire: use lower case hex addresses in node unit addresses
>   ARM: dts: ox820: align interrupt controller node name with dtschema
>   ARM: dts: socfpga: align interrupt controller node name with dtschema
>   dt-bindings: irqchip: actions,owl-sirq: include generic schema
>   dt-bindings: irqchip: fsl: include generic schema
>   dt-bindings: irqchip: ingenic: include generic schema
>   dt-bindings: irqchip: intel,ixp4xx: include generic schema
>   dt-bindings: irqchip: kontron,sl28cpld: include generic schema
>   dt-bindings: irqchip: loongson: include generic schema
>   dt-bindings: irqchip: microchip,eic: include generic schema
>   dt-bindings: irqchip: mrvl,intc: include generic schema
>   dt-bindings: irqchip: mstar,mst-intc: include generic schema
>   dt-bindings: irqchip: mti,gic: include generic schema
>   dt-bindings: irqchip: nuvoton,wpcm450-aic: include generic schema
>   dt-bindings: irqchip: realtek,rtl-intc: include generic schema
>   dt-bindings: irqchip: renesas: include generic schema
>   dt-bindings: irqchip: sifive: include generic schema
>   dt-bindings: irqchip: ti: include generic schema

I'm somewhat on the fence about these. Originally only devices with a 
bus or child nodes included a common schema. For 'simple' providers 
with mainly a '#<provider>-cells' property, we had to set the 
constraints on the number of cells anyways, so referencing another 
schema doesn't save anything. It is nice to declare the 'class' of the 
device though.

It makes the schema be applied twice (if the node name matches). That's 
not all bad because it finds cases of wrong node name. However, 
sometimes we have devices which are multiple providers and can't set the 
node name. So those can't reference interrupt-controller.yaml.

It also means that 'interrupt-map' for example is now valid. That could 
be fixed by splitting 'interrupt-map' related properties to its own 
schema. 

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
