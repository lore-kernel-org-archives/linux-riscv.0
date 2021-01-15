Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F483C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 00:35:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5771F23AA7
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 00:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5771F23AA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HOJWmujUlQRKN2wmws656b7cmtvMi5BCWa2kGCGv3l0=; b=Wn1TJTxMx2SJ5WwwPEy9KG3Y+
	xjURe1Muin4XiLKsejmM5KxESfOVyGsqa97WCIgmrrsL4cz7AO2sPr6mCKekFrr+GBsWxL+mAvYvi
	GYRc/yjlrT54YU69QwgHrLyTHsBRu8a8bt+PedGmOliGXa9NwPi3STUVa3z0gNUnK1bcaXe7/nuE0
	+zudK8yCD9rSosy5qkG1XRCNQizvKIlaZsmPsVRKoLKBvo/bTrBTG99Mxxx27V1VWsVOjFJ0xN10E
	x6WzIC+2VALlchgG6oCg7zTWX3KjnP5azQhZVXpgXr7ru6Tp1CXHLkkXFqrd8+WdzwrTj6SHgBQ0U
	8VbbJOAkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0D5W-0001T0-0r; Fri, 15 Jan 2021 00:35:38 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0D5T-0001S5-Cs
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 00:35:36 +0000
Received: by mail-qk1-x72d.google.com with SMTP id 186so10229123qkj.3
 for <linux-riscv@lists.infradead.org>; Thu, 14 Jan 2021 16:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3PxwXOyKQ3VQyBGmQW1n6Fgpy5pTtQU8FEDLLOeJ71w=;
 b=uQtSbCjx4yUt58E72UspMXTQdmTBjEl+DXZqYUmEwZptUEEtfRwhyc+UCMNBUlN7rl
 ay2LweF2JlXxC3vk5vki9L28ZIWX5Sh3n1JbdrcTugQGs6QuZaRlQR4n9SmY28xjpicV
 bvM6Gb9hr2NwAoZdpecxgyDRpdDsG5f6QaBA3GeKplMPbbOGKh898L6IWuRTKtfGVwpG
 bGy3u9NsCk0zjiNQhzclxtE1hDbjp8ekAmX+0EBXKJmOPqKVd9ATeexvRnahbBk6AClq
 HVs6s5pOkCX3hV3/ygZFU1oScZjfBn3jTemKpRH4rxX41+NlFzjaGBJnZy8rQhorWfAa
 8T2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3PxwXOyKQ3VQyBGmQW1n6Fgpy5pTtQU8FEDLLOeJ71w=;
 b=M9+Qm3SVAfAZpRaR5ouWjf/qvlAnP4wxZZTpjzNRAjoRTVMbPtTvNCdZ6ANNHaBRpn
 +ILdf26kNC+g7CxmA8Sdyz9XU9fTMf8YComXQVm5npxx2O++6lVLjp+o9I141fPyEQvO
 2nrny1nvzF1JV/7pKtBnJLDX9BDFVvooxUAWoEh6Fp1hflRoPTyFA0Jn3zaa11l1uH+w
 XYIal7o0iRd/KdDpehAlF0YoQ8q2cEsGcpMjdePL4gUks0OEzdgn0AY9HpThyN0WeKJx
 MvHkQK05K0/0EFZIbg7/5AkPYo/QklFz0VEWmexr/kkhFLq4JNTKn2Kj0MHkc+w1kLHy
 //1w==
X-Gm-Message-State: AOAM5300+8S0Mz52BWkzOI6OjZ6Fn3ynJw8rew2L2v5IT9AOs1RFzdMN
 wwoDPezq/4r5Pbz7crZiCj5zu1G+8ds=
X-Google-Smtp-Source: ABdhPJxujLCxOhwwF4u2B0gUY4H8bREGZMGlgSpfBRkj7U5jX43GtC3BptribpA2KBCCOE6FPxEuwQ==
X-Received: by 2002:a37:86c2:: with SMTP id i185mr9834483qkd.477.1610670933230; 
 Thu, 14 Jan 2021 16:35:33 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id a5sm3907527qtn.57.2021.01.14.16.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 16:35:32 -0800 (PST)
Subject: Re: [PATCH v11 03/10] riscv: Update Canaan Kendryte K210 device tree
From: Sean Anderson <seanga2@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Damien Le Moal <Damien.LeMoal@wdc.com>
References: <mhng-b30be63a-5293-4d18-85cb-fb2c62b3188e@palmerdabbelt-glaptop>
 <9d32abd1-ffb4-a887-a40d-fc173a371d23@gmail.com>
 <484787f2-558c-1eb4-7ab0-23f0ac5e6cd5@gmail.com>
Message-ID: <fbff79af-deb7-e400-4e1b-cc1ef814451d@gmail.com>
Date: Thu, 14 Jan 2021 19:35:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <484787f2-558c-1eb4-7ab0-23f0ac5e6cd5@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_193535_462677_6F350AA8 
X-CRM114-Status: GOOD (  22.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/14/21 7:06 PM, Sean Anderson wrote:
> 
> On 1/14/21 7:01 PM, Sean Anderson wrote:
>>
>> On 1/14/21 6:32 PM, Palmer Dabbelt wrote:
>>> On Mon, 11 Jan 2021 16:58:41 PST (-0800), Damien Le Moal wrote:
>>>> Update the Canaan Kendryte K210 base device tree k210.dtsi to define
>>>> all peripherals of the SoC, their clocks and reset lines. The device
>>>> tree file k210.dts is renamed to k210_generic.dts and becomes the
>>>> default value selection of the SOC_CANAAN_K210_DTB_BUILTIN_SOURCE
>>>> configuration option. No device beside the serial console is defined by
>>>> this device tree. This makes this generic device tree suitable for use
>>>> with a builtin initramfs with all known K210 based boards.
>>>>
>>>> These changes result in the K210_CLK_ACLK clock ID to be unused and
>>>> removed from the dt-bindings k210-clk.h header file.
>>>>
>>>> Most updates to the k210.dtsi file come from Sean Anderson's work on
>>>> U-Boot support for the K210.
>>>>
>>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>>> Reviewed-by: Anup Patel <anup@brainfault.org>
>>>> ---
>>>>  arch/riscv/Kconfig.socs                     |   2 +-
>>>>  arch/riscv/boot/dts/canaan/k210.dts         |  23 -
>>>>  arch/riscv/boot/dts/canaan/k210.dtsi        | 551 +++++++++++++++++++-
>>>>  arch/riscv/boot/dts/canaan/k210_generic.dts |  46 ++
>>>>  include/dt-bindings/clock/k210-clk.h        |   1 -
>>>>  5 files changed, 573 insertions(+), 50 deletions(-)
>>>>  delete mode 100644 arch/riscv/boot/dts/canaan/k210.dts
>>>>  create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
>>>
>>> [Snipping this to the relevant bits, in case you missed it before.]
>>>
>>>> @@ -81,40 +107,515 @@ in0: oscillator {
>>>>      soc {
>>>>          #address-cells = <1>;
>>>>          #size-cells = <1>;
>>>> -        compatible = "kendryte,k210-soc", "simple-bus";
>>>> +        compatible = "canaan,k210-soc", "simple-bus";
>>>>          ranges;
>>>>          interrupt-parent = <&plic0>;
>>>>
>>>> -        sysctl: sysctl@50440000 {
>>>> -            compatible = "kendryte,k210-sysctl", "simple-mfd";
>>>> -            reg = <0x50440000 0x1000>;
>>>> -            #clock-cells = <1>;
>>>> +        debug0: debug@0 {
>>>> +            compatible = "canaan,k210-debug", "riscv,debug";
>>>
>>> I'm still getting lots of warnings about undocumented DT compatible strings
>>> from checpatch.  Some of them might be in flight, but I don't see many of them
>>> (including both of these debug ones) having been defined anywhere.  We went
>>> through a whole process to sort out the SiFive DT naming conventions, I don't
>>> want to just circumvent that for the Canaan stuff by merging it as-is.
>>
>> As far as I'm aware, it's recommended practice to add device-specific compatible
>>
> 
> Here it's because "riscv,debug" doesn't exist. This is the "debug"
> device as described in the debug spec. AFAIK Linux never needs to
> configure this device. It could probably be removed.
> 
> I am going to try and go through the list of nonexistant compatibles and
> see if there are any other devices like this (nothing else like it in
> Linux).
> 
> --Sean

Ok, here is the (abbreviated) output:


> cpu@0: compatible: ['canaan,k210', 'sifive,rocket0', 'riscv'] is not valid under any of the given schemas (Possible causes of the failure):
> cpu@0: compatible: ['canaan,k210', 'sifive,rocket0', 'riscv'] is too long
> cpu@0: compatible:0: 'canaan,k210' is not one of ['sifive,rocket0', 'sifive,bullet0', 'sifive,e5', 'sifive,e7', 'sifive,e51', 'sifive,e71', 'sifive,u54-mc', 'sifive,u74-mc', 'sifive,u54', 'sifive,u74', 'sifive,u5', 'sifive,u7']

This is a device-specific compatible string as recommended by the
current DT docs.

> cpu@0: mmu-type:0: 'none' is not one of ['riscv,sv32', 'riscv,sv39', 'riscv,sv48']

This should be added (though it is technically incorrect).

(perhaps a version number should be added like 'riscv,sv39-1.10')

> cpu@0: riscv,isa:0: 'rv64imafdgc' is not one of ['rv64imac', 'rv64imafdc']

Should probably be fixed, as the g is redundant. However, this is
probably not a good warning going forward, as more exotic combinations
of extensions are implemented.

> cpu@1: compatible: ['canaan,k210', 'sifive,rocket0', 'riscv'] is not valid under any of the given schemas (Possible causes of the failure):
> cpu@1: compatible: ['canaan,k210', 'sifive,rocket0', 'riscv'] is too long
> cpu@1: compatible:0: 'canaan,k210' is not one of ['sifive,rocket0', 'sifive,bullet0', 'sifive,e5', 'sifive,e7', 'sifive,e51', 'sifive,e71', 'sifive,u54-mc', 'sifive,u74-mc', 'sifive,u54', 'sifive,u74', 'sifive,u5', 'sifive,u7']
> 
> cpu@1: mmu-type:0: 'none' is not one of ['riscv,sv32', 'riscv,sv39', 'riscv,sv48']
> cpu@1: riscv,isa:0: 'rv64imafdgc' is not one of ['rv64imac', 'rv64imafdc']

see above

> serial@38000000: compatible:0: 'canaan,k210-uarths' is not one of ['sifive,fu540-c000-uart', 'sifive,fu740-c000-uart']

device-specific, and intentional

> gpio-controller@38001000: compatible:0: 'canaan,k210-gpiohs' is not one of ['sifive,fu540-c000-gpio', 'sifive,fu740-c000-gpio']

ditto

> gpio-controller@38001000: 'ngpios' does not match any of the regexes: 'pinctrl-[0-9]+'

known shortcoming with this dt property, but alas

> gpio-controller@50200000: $nodename:0: 'gpio-controller@50200000' does not match '^gpio@[0-9a-f]+$'

This matches devicetree/bindings/gpio/snps,dw-apb-gpio.yaml

> gpio-controller@50200000: compatible: ['canaan,k210-gpio', 'snps,dw-apb-gpio'] is too long
> gpio-controller@50200000: compatible: Additional items are not allowed ('snps,dw-apb-gpio' was unexpected)
> gpio-controller@50200000: 'gpio1@0' does not match any of the regexes: '^gpio-(port|controller)@[0-9a-f]+$', 'pinctrl-[0-9]+'
> serial@50210000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is not valid under any of the given schemas (Possible causes of the failure):
> serial@50210000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is too long
> serial@50210000: compatible:0: 'canaan,k210-uart' is not one of ['renesas,r9a06g032-uart', 'renesas,r9a06g033-uart']
> serial@50210000: compatible:0: 'canaan,k210-uart' is not one of ['rockchip,px30-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rv1108-uart']
> serial@50210000: compatible:0: 'canaan,k210-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart']
> 
> serial@50220000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is not valid under any of the given schemas (Possible causes of the failure):
> serial@50220000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is too long
> serial@50220000: compatible:0: 'canaan,k210-uart' is not one of ['renesas,r9a06g032-uart', 'renesas,r9a06g033-uart']
> serial@50220000: compatible:0: 'canaan,k210-uart' is not one of ['rockchip,px30-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rv1108-uart']
> serial@50220000: compatible:0: 'canaan,k210-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart']
> 
> serial@50230000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is not valid under any of the given schemas (Possible causes of the failure):
> serial@50230000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is too long
> serial@50230000: compatible:0: 'canaan,k210-uart' is not one of ['renesas,r9a06g032-uart', 'renesas,r9a06g033-uart']
> serial@50230000: compatible:0: 'canaan,k210-uart' is not one of ['rockchip,px30-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rv1108-uart']
> serial@50230000: compatible:0: 'canaan,k210-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart']

More device-specific strings.

> spi@50240000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is not valid under any of the given schemas (Possible causes of the failure):
> spi@50240000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is too long
> spi@50240000: compatible:0: 'canaan,k210-spi' is not one of ['snps,dw-apb-ssi', 'snps,dwc-ssi-1.01a']
> spi@50240000: compatible:0: 'canaan,k210-spi' is not one of ['mscc,ocelot-spi', 'mscc,jaguar2-spi']

ditto

> i2c@50280000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is not valid under any of the given schemas (Possible causes of the failure):
> i2c@50280000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is too long
> 
> i2c@50290000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is not valid under any of the given schemas (Possible causes of the failure):
> i2c@50290000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is too long
> 
> i2c@502A0000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is not valid under any of the given schemas (Possible causes of the failure):
> i2c@502A0000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is too long

ditto

> timer@502D0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is not valid under any of the given schemas (Possible causes of the failure):
> timer@502D0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is too long
> timer@502D0000: compatible:0: 'canaan,k210-timer' is not one of ['snps,dw-apb-timer-sp', 'snps,dw-apb-timer-osc']
> 
> timer@502D0000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'

`resets` is the correct name for this property.

> timer@502E0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is not valid under any of the given schemas (Possible causes of the failure):
> timer@502E0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is too long
> timer@502E0000: compatible:0: 'canaan,k210-timer' is not one of ['snps,dw-apb-timer-sp', 'snps,dw-apb-timer-osc']

More device-specific.

> timer@502E0000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
> timer@502F0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is not valid under any of the given schemas (Possible causes of the failure):
> timer@502F0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is too long
> timer@502F0000: compatible:0: 'canaan,k210-timer' is not one of ['snps,dw-apb-timer-sp', 'snps,dw-apb-timer-osc']
> 
> timer@502F0000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
> watchdog@50400000: compatible: ['canaan,k210-wdt', 'snps,dw-wdt'] is not valid under any of the given schemas (Possible causes of the failure):
> watchdog@50400000: compatible: ['canaan,k210-wdt', 'snps,dw-wdt'] is too long
> watchdog@50400000: compatible:0: 'canaan,k210-wdt' is not one of ['rockchip,rk3066-wdt', 'rockchip,rk3188-wdt', 'rockchip,rk3288-wdt', 'rockchip,rk3368-wdt']
> 
> watchdog@50410000: compatible: ['canaan,k210-wdt', 'snps,dw-wdt'] is not valid under any of the given schemas (Possible causes of the failure):
> watchdog@50410000: compatible: ['canaan,k210-wdt', 'snps,dw-wdt'] is too long
> watchdog@50410000: compatible:0: 'canaan,k210-wdt' is not one of ['rockchip,rk3066-wdt', 'rockchip,rk3188-wdt', 'rockchip,rk3288-wdt', 'rockchip,rk3368-wdt']
> 
> spi@52000000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is not valid under any of the given schemas (Possible causes of the failure):
> spi@52000000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is too long
> spi@52000000: compatible:0: 'canaan,k210-spi' is not one of ['snps,dw-apb-ssi', 'snps,dwc-ssi-1.01a']
> spi@52000000: compatible:0: 'canaan,k210-spi' is not one of ['mscc,ocelot-spi', 'mscc,jaguar2-spi']
> 
> spi@53000000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is not valid under any of the given schemas (Possible causes of the failure):
> spi@53000000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is too long
> spi@53000000: compatible:0: 'canaan,k210-spi' is not one of ['snps,dw-apb-ssi', 'snps,dwc-ssi-1.01a']
> spi@53000000: compatible:0: 'canaan,k210-spi' is not one of ['mscc,ocelot-spi', 'mscc,jaguar2-spi']
> 
> spi@54000000: compatible: ['canaan,k210-ssi', 'snps,dwc-ssi-1.01a'] is not valid under any of the given schemas (Possible causes of the failure):
> spi@54000000: compatible: ['canaan,k210-ssi', 'snps,dwc-ssi-1.01a'] is too long
> spi@54000000: compatible:0: 'canaan,k210-ssi' is not one of ['snps,dw-apb-ssi', 'snps,dwc-ssi-1.01a']
> spi@54000000: compatible:0: 'canaan,k210-ssi' is not one of ['mscc,ocelot-spi', 'mscc,jaguar2-spi']

Ok, so the vast majority of these warnings are from unknown compatible
strings. IMO this is not an issue, but the simple fix is to just add
these strings to the yaml files.

--Sean

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
