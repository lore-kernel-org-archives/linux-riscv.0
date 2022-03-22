Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFBDC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 18:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMsRyApcmBFDP6BYE301DlyqpUX6RBsOmwkZiz48udQ=; b=Zqlyg2pjDIAhrh
	YUCdLVMe6e6krPBAHe1KatsdeYM4udLfabwdQB6e5rbEz87WPGvmcC5o4hrjkm4I5GFcQsjisyAVP
	ul+Py+1ukarjTlWE5K4VL3GTRV8Kj4HVdfjJrCNsFkNnEF+MWUndQNH2yJtDJzm3u81yxlAd3VqZZ
	GIxgJohwuI+r9uLhO2Wu1lHGbz6ZkuMewfzD/2iXojvbVDSVP/yrOt16uJjZIyVDG/mbOqTvG4sUv
	Pfyrhr+P2hfnXvYSmOLM/RLg/plPYb4BJ1K623Vx0gegJdMrwCL5y2RHQ0SIbdMb6mG6BgeEP8wvE
	M3HnFd6M5VZa6dRrQr9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWjN2-00Bt8y-S7; Tue, 22 Mar 2022 18:36:41 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWjMy-00Bt5h-0w
 for linux-riscv@lists.infradead.org; Tue, 22 Mar 2022 18:36:38 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AA5FA3F94C
 for <linux-riscv@lists.infradead.org>; Tue, 22 Mar 2022 18:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647974194;
 bh=5jtpXxEom/a/jiH/sFwvBmFkIoAoceZfaQ8rDmnOzv8=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=o79mDLORM2nA8Epl2qL9p2El4lPMXlCz0ngDd1wsJfuU9PkrtMXdV2mp7aMyBSvXB
 eFnOdt47JGKzN7TttxrefIuL49kZO3GD5OyX0glAqB+hHcTT9u/jUp9dRo5M0JKHnN
 /55EcfsQNWsUAWFWWtgdzqo2i0JKNKuyCl3f3yasYgCzea2PfUO0zGh/borlLeVG5b
 DKRLsAIDd0VRUS8/wgHLdcUw3gAoiFieoAiG/j29NPG1YrIQaubp/kV3g3B6KEyG7/
 8HsCDC85gUPF5FrmX8WjlSB1kiDXRF0PL305GbwSRogr1Ce53/u5HhrYdFWNtrdJq3
 3yiQfvK612dhQ==
Received: by mail-ej1-f72.google.com with SMTP id
 jx2-20020a170907760200b006dfc374c502so5203611ejc.7
 for <linux-riscv@lists.infradead.org>; Tue, 22 Mar 2022 11:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5jtpXxEom/a/jiH/sFwvBmFkIoAoceZfaQ8rDmnOzv8=;
 b=niYrmuphT2Hv+KFnlgT1bad+EHRX73jdmLs7qyb53jQQBsKZAOjW7meVs47VoyRk1I
 unBqsjVWbej16RJO16pNxd1uY3nwLh5DWFbgAhYAqLlDJ8pFq4kHDEsD3/3lrGeqUIl5
 y8ufdYQkavLXbaE6KgDpiaFNHF3W/BYsyj5ATJ9NOmOQNKaDB6SjK41bhqsNevOM0eHB
 Nv49qpAUwglYDZVVWFh50sBOhowKqoNn/tUjNhiiD2eAMt0MDrcN530ERfy3RA7rJ6/c
 2T4thI2Bgc9yyaj2A1Mkf5s7qHUr5Dd/+dr5mRL7htV6nWpoQVqG1CrrSD3/imGcLcAq
 p0Uw==
X-Gm-Message-State: AOAM530d3vb6usxGJ/jxhLQIVaPENFVrA45umaEMEVnvbliuI2tUj+3Q
 mzCB1FRA5GtyKaE/majWsuj7jt/It2FTHR1AcqGwcuu5ScFCEqlnpH3Upm6A0UFwxhX+gihPIwB
 gLdcHbd7sy3vEPKlJKC95ssHQ1SlW5LTJFYxdYf6X5cuw4g==
X-Received: by 2002:a05:6402:1941:b0:413:2555:53e3 with SMTP id
 f1-20020a056402194100b00413255553e3mr30164488edz.164.1647974184167; 
 Tue, 22 Mar 2022 11:36:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXjJuzBLH9hbRDSjsXFrbLCVkaIICKYGv+IQ5EfXGkXfhv1U2vMFYP/O//lEDRT2Fv/Gfc1w==
X-Received: by 2002:a05:6402:1941:b0:413:2555:53e3 with SMTP id
 f1-20020a056402194100b00413255553e3mr30164440edz.164.1647974183906; 
 Tue, 22 Mar 2022 11:36:23 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 d4-20020a1709067a0400b006d6e3ca9f71sm8816466ejo.198.2022.03.22.11.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 11:36:23 -0700 (PDT)
Message-ID: <ff8da126-8eac-7b72-c992-3b4223f2b077@canonical.com>
Date: Tue, 22 Mar 2022 19:36:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 00/18] dt-bindings: irqchip: include generic schema
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
 Krzysztof Halasa <khalasa@piap.pl>, Michael Walle <michael@walle.cc>,
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Daniel Palmer <daniel@thingy.jp>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Lucas Stach
 <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Birger Koblitz <mail@birger-koblitz.de>, Bert Vermeulen <bert@biot.com>,
 John Crispin <john@phrozen.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Sagar Kadam <sagar.kadam@sifive.com>,
 Suman Anna <s-anna@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-oxnas@groups.io
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <YjjJpxLWJ/YOe0OX@robh.at.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YjjJpxLWJ/YOe0OX@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_113636_235866_80682C80 
X-CRM114-Status: GOOD (  17.40  )
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

On 21/03/2022 19:53, Rob Herring wrote:
> On Thu, Mar 17, 2022 at 12:55:24PM +0100, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> The DTS patches can be picked up independently.
>>
>> Best regards,
>> Krzysztof
>>
>> Krzysztof Kozlowski (18):
>>   ARM: dts: nspire: use lower case hex addresses in node unit addresses
>>   ARM: dts: ox820: align interrupt controller node name with dtschema
>>   ARM: dts: socfpga: align interrupt controller node name with dtschema
>>   dt-bindings: irqchip: actions,owl-sirq: include generic schema
>>   dt-bindings: irqchip: fsl: include generic schema
>>   dt-bindings: irqchip: ingenic: include generic schema
>>   dt-bindings: irqchip: intel,ixp4xx: include generic schema
>>   dt-bindings: irqchip: kontron,sl28cpld: include generic schema
>>   dt-bindings: irqchip: loongson: include generic schema
>>   dt-bindings: irqchip: microchip,eic: include generic schema
>>   dt-bindings: irqchip: mrvl,intc: include generic schema
>>   dt-bindings: irqchip: mstar,mst-intc: include generic schema
>>   dt-bindings: irqchip: mti,gic: include generic schema
>>   dt-bindings: irqchip: nuvoton,wpcm450-aic: include generic schema
>>   dt-bindings: irqchip: realtek,rtl-intc: include generic schema
>>   dt-bindings: irqchip: renesas: include generic schema
>>   dt-bindings: irqchip: sifive: include generic schema
>>   dt-bindings: irqchip: ti: include generic schema
> 
> I'm somewhat on the fence about these. Originally only devices with a 
> bus or child nodes included a common schema. For 'simple' providers 
> with mainly a '#<provider>-cells' property, we had to set the 
> constraints on the number of cells anyways, so referencing another 
> schema doesn't save anything. It is nice to declare the 'class' of the 
> device though.
> 
> It makes the schema be applied twice (if the node name matches). That's 
> not all bad because it finds cases of wrong node name. However, 
> sometimes we have devices which are multiple providers and can't set the 
> node name. So those can't reference interrupt-controller.yaml.

Indeed there were cases of MSI and interrupt controller.

> 
> It also means that 'interrupt-map' for example is now valid. That could 
> be fixed by splitting 'interrupt-map' related properties to its own 
> schema. 

Yes, that's a side effect. Maybe my series should be abandoned.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
