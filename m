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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F28C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 01:56:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F7C223A5A
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 01:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F7C223A5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BlPyYWkZm4eq4nNL1uiGNpU3RL19mz7ZDd9AXWqA3S0=; b=Bmo25hSZd0oFrTx/XH7CH6xI1
	7JT+NZPVNQwuflEMhT6i8u+4x1Asfo2D/6vWztO0GLLE7tgap2/QJBBwPEB+RG6pRMseOXKvBJwQl
	p82H1uSLiPoRQxlXl3dG3CpEDLrieDYplu1XtLJ1sLX+SSLFsFNkXW/5GN0rI4bbe4hq8lgEb9QbT
	jGrIzT7p0KAcRwoK48fkX14KeFdcncSOD165+Gz5gxQFFZWBtaow06KYyynpItf3rsxv7u4yLXrFP
	8GojwpBLyoQKyWjWFsuo3rOSh8ogz+ywnNIvw8spXpAFWl46ZxxGnNtDpWH0nvPttubo6387su9j8
	3hSIIo8HQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Dgm-0003O4-NM; Fri, 15 Jan 2021 01:14:08 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Dgk-0003Nc-CZ
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 01:14:07 +0000
Received: by mail-qk1-x730.google.com with SMTP id 143so10256139qke.10
 for <linux-riscv@lists.infradead.org>; Thu, 14 Jan 2021 17:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rCFQSwEwY3HPss2ls/il++/j0iVsxWDp1nHOMvfQLcY=;
 b=PZRYrHEIITzKpb63s3JM12SbUBA7W+1HTFJXdUFW9ZaWkXj7nLHKjlWZnRYSDmoM4N
 2cKHeOPg80AXk1CIUzBJfTKoaojQlT+KymVVN9daEl3p8LGROMLvJo3Vt6W1MP7Hvz+q
 hoJGsnjVcu99RnWHyVooalAyiOebc93pKYmOIOSfiqEK9k4MNYp7hUiVlxbnM7TnDfyU
 p5vgxf6/XqqyvVPCCAEKmSEAf0tw4xETHzE90cPYKKToxyg45f1Av79O6EEsnb2CtjOY
 JhGsAdZ25lrA2T/uaRZD5Pscpg+gQ/eALVuKgJapiS2Hv/0IJalTv3siF+Iov7kKiYzR
 toEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rCFQSwEwY3HPss2ls/il++/j0iVsxWDp1nHOMvfQLcY=;
 b=bEIpepV4K8iJ8kQysUJaGvyQmVngaXpyiy2lrPgzmsK638m1qVh8or1k0NkWg4vREl
 aNtpclhKM8fU2DPFeXKQD6I6ct7zV1QRLUNBGc6w2ecAfVrKvMs54BYv+tP652gmVmnt
 8m5dSXfIhsJ9S3UFghPfzOn57s4BLUcLWfrlw9YyqHtMdJchWZcp0qVQACaV50jfnThw
 hIP1EGF+7mNN3g3rZMy+zJFlA167l7IQWTOSrZR3Wt0NarDS2R3uniJp0TSI8wrf6EM4
 9NLREnPyjPAKV9w/zPCQ9Q2sVRuGsG/VBwjUweYnnL0iSP9lVlWrz6bZc/M8O/txfacQ
 BbIw==
X-Gm-Message-State: AOAM532oMMsTFyW78Yc8zmOOPi3bNhXE+on6iD3cQ0WBzO4tH2poK3p8
 2qFhBTiDP8p5ljj8jQRPWOdUO6avbms=
X-Google-Smtp-Source: ABdhPJyY+oMpklso/bwBXlbM/NkT47VrLB46Bf/VvGXVEWGFa1Qxc7G81LbKJUrSsshudGNoLeaVOg==
X-Received: by 2002:a37:6744:: with SMTP id b65mr9968151qkc.199.1610673244190; 
 Thu, 14 Jan 2021 17:14:04 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162]) by smtp.googlemail.com with ESMTPSA id
 j124sm4101075qkf.113.2021.01.14.17.14.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 17:14:03 -0800 (PST)
Subject: Re: [PATCH v11 03/10] riscv: Update Canaan Kendryte K210 device tree
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <mhng-b30be63a-5293-4d18-85cb-fb2c62b3188e@palmerdabbelt-glaptop>
 <9d32abd1-ffb4-a887-a40d-fc173a371d23@gmail.com>
 <484787f2-558c-1eb4-7ab0-23f0ac5e6cd5@gmail.com>
 <fbff79af-deb7-e400-4e1b-cc1ef814451d@gmail.com>
 <BL0PR04MB6514593E3235BBFE84D74BB2E7A70@BL0PR04MB6514.namprd04.prod.outlook.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <d6cbb729-0824-1527-f749-e45b55c8840f@gmail.com>
Date: Thu, 14 Jan 2021 20:14:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <BL0PR04MB6514593E3235BBFE84D74BB2E7A70@BL0PR04MB6514.namprd04.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_201406_504828_FC9F9D1D 
X-CRM114-Status: GOOD (  29.46  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Linus Walleij <linus.walleij@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/14/21 8:03 PM, Damien Le Moal wrote:
> On 2021/01/15 9:35, Sean Anderson wrote:
>> On 1/14/21 7:06 PM, Sean Anderson wrote:
>>>
>>> On 1/14/21 7:01 PM, Sean Anderson wrote:
>>>>
>>>> On 1/14/21 6:32 PM, Palmer Dabbelt wrote:
>>>>> On Mon, 11 Jan 2021 16:58:41 PST (-0800), Damien Le Moal wrote:
>>>>>> Update the Canaan Kendryte K210 base device tree k210.dtsi to define
>>>>>> all peripherals of the SoC, their clocks and reset lines. The device
>>>>>> tree file k210.dts is renamed to k210_generic.dts and becomes the
>>>>>> default value selection of the SOC_CANAAN_K210_DTB_BUILTIN_SOURCE
>>>>>> configuration option. No device beside the serial console is defined by
>>>>>> this device tree. This makes this generic device tree suitable for use
>>>>>> with a builtin initramfs with all known K210 based boards.
>>>>>>
>>>>>> These changes result in the K210_CLK_ACLK clock ID to be unused and
>>>>>> removed from the dt-bindings k210-clk.h header file.
>>>>>>
>>>>>> Most updates to the k210.dtsi file come from Sean Anderson's work on
>>>>>> U-Boot support for the K210.
>>>>>>
>>>>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>>>>> Reviewed-by: Anup Patel <anup@brainfault.org>
>>>>>> ---
>>>>>>   arch/riscv/Kconfig.socs                     |   2 +-
>>>>>>   arch/riscv/boot/dts/canaan/k210.dts         |  23 -
>>>>>>   arch/riscv/boot/dts/canaan/k210.dtsi        | 551 +++++++++++++++++++-
>>>>>>   arch/riscv/boot/dts/canaan/k210_generic.dts |  46 ++
>>>>>>   include/dt-bindings/clock/k210-clk.h        |   1 -
>>>>>>   5 files changed, 573 insertions(+), 50 deletions(-)
>>>>>>   delete mode 100644 arch/riscv/boot/dts/canaan/k210.dts
>>>>>>   create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
>>>>>
>>>>> [Snipping this to the relevant bits, in case you missed it before.]
>>>>>
>>>>>> @@ -81,40 +107,515 @@ in0: oscillator {
>>>>>>       soc {
>>>>>>           #address-cells = <1>;
>>>>>>           #size-cells = <1>;
>>>>>> -        compatible = "kendryte,k210-soc", "simple-bus";
>>>>>> +        compatible = "canaan,k210-soc", "simple-bus";
>>>>>>           ranges;
>>>>>>           interrupt-parent = <&plic0>;
>>>>>>
>>>>>> -        sysctl: sysctl@50440000 {
>>>>>> -            compatible = "kendryte,k210-sysctl", "simple-mfd";
>>>>>> -            reg = <0x50440000 0x1000>;
>>>>>> -            #clock-cells = <1>;
>>>>>> +        debug0: debug@0 {
>>>>>> +            compatible = "canaan,k210-debug", "riscv,debug";
>>>>>
>>>>> I'm still getting lots of warnings about undocumented DT compatible strings
>>>>> from checpatch.  Some of them might be in flight, but I don't see many of them
>>>>> (including both of these debug ones) having been defined anywhere.  We went
>>>>> through a whole process to sort out the SiFive DT naming conventions, I don't
>>>>> want to just circumvent that for the Canaan stuff by merging it as-is.
>>>>
>>>> As far as I'm aware, it's recommended practice to add device-specific compatible
>>>>
>>>
>>> Here it's because "riscv,debug" doesn't exist. This is the "debug"
>>> device as described in the debug spec. AFAIK Linux never needs to
>>> configure this device. It could probably be removed.
>>>
>>> I am going to try and go through the list of nonexistant compatibles and
>>> see if there are any other devices like this (nothing else like it in
>>> Linux).
>>>
>>> --Sean
>>
>> Ok, here is the (abbreviated) output:
>>
>>
>>> cpu@0: compatible: ['canaan,k210', 'sifive,rocket0', 'riscv'] is not valid under any of the given schemas (Possible causes of the failure):
>>> cpu@0: compatible: ['canaan,k210', 'sifive,rocket0', 'riscv'] is too long
>>> cpu@0: compatible:0: 'canaan,k210' is not one of ['sifive,rocket0', 'sifive,bullet0', 'sifive,e5', 'sifive,e7', 'sifive,e51', 'sifive,e71', 'sifive,u54-mc', 'sifive,u74-mc', 'sifive,u54', 'sifive,u74', 'sifive,u5', 'sifive,u7']
>>
>> This is a device-specific compatible string as recommended by the
>> current DT docs.
>>
>>> cpu@0: mmu-type:0: 'none' is not one of ['riscv,sv32', 'riscv,sv39', 'riscv,sv48']
>>
>> This should be added (though it is technically incorrect).
> 
> will do.
> 
>>
>> (perhaps a version number should be added like 'riscv,sv39-1.10')
>>
>>> cpu@0: riscv,isa:0: 'rv64imafdgc' is not one of ['rv64imac', 'rv64imafdc']
>>
>> Should probably be fixed, as the g is redundant. However, this is
>> probably not a good warning going forward, as more exotic combinations
>> of extensions are implemented.
> 
> I had removed the "g" here. I guess I messed up a rebase and it is back. Will
> fix that.
> 
>>
>>> cpu@1: compatible: ['canaan,k210', 'sifive,rocket0', 'riscv'] is not valid under any of the given schemas (Possible causes of the failure):
>>> cpu@1: compatible: ['canaan,k210', 'sifive,rocket0', 'riscv'] is too long
>>> cpu@1: compatible:0: 'canaan,k210' is not one of ['sifive,rocket0', 'sifive,bullet0', 'sifive,e5', 'sifive,e7', 'sifive,e51', 'sifive,e71', 'sifive,u54-mc', 'sifive,u74-mc', 'sifive,u54', 'sifive,u74', 'sifive,u5', 'sifive,u7']
>>>
>>> cpu@1: mmu-type:0: 'none' is not one of ['riscv,sv32', 'riscv,sv39', 'riscv,sv48']
>>> cpu@1: riscv,isa:0: 'rv64imafdgc' is not one of ['rv64imac', 'rv64imafdc']
>>
>> see above
>>
>>> serial@38000000: compatible:0: 'canaan,k210-uarths' is not one of ['sifive,fu540-c000-uart', 'sifive,fu740-c000-uart']
>>
>> device-specific, and intentional
> 
> We can add this one to the sifive serial yaml.
> 
>>
>>> gpio-controller@38001000: compatible:0: 'canaan,k210-gpiohs' is not one of ['sifive,fu540-c000-gpio', 'sifive,fu740-c000-gpio']
>>
>> ditto
>>
>>> gpio-controller@38001000: 'ngpios' does not match any of the regexes: 'pinctrl-[0-9]+'
>>
>> known shortcoming with this dt property, but alas
> 
> Yes. The driver was fixed. But the yaml is behind I guess. Will send a patch for
> this one.
> 
>>
>>> gpio-controller@50200000: $nodename:0: 'gpio-controller@50200000' does not match '^gpio@[0-9a-f]+$'
>>
>> This matches devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
> 
> This may be similar to the ngpios problem: the core expect something while the
> yaml defines something older... Will have a look.
> 
>>
>>> gpio-controller@50200000: compatible: ['canaan,k210-gpio', 'snps,dw-apb-gpio'] is too long
>>> gpio-controller@50200000: compatible: Additional items are not allowed ('snps,dw-apb-gpio' was unexpected)
> 
> I wonder if we can just remove 'canaan,k210-gpio' here ?
> 
>>> gpio-controller@50200000: 'gpio1@0' does not match any of the regexes: '^gpio-(port|controller)@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 
> Not sure what to do about this one.
> 
>>> serial@50210000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is not valid under any of the given schemas (Possible causes of the failure):
>>> serial@50210000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is too long
>>> serial@50210000: compatible:0: 'canaan,k210-uart' is not one of ['renesas,r9a06g032-uart', 'renesas,r9a06g033-uart']
>>> serial@50210000: compatible:0: 'canaan,k210-uart' is not one of ['rockchip,px30-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rv1108-uart']
>>> serial@50210000: compatible:0: 'canaan,k210-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart']
>>>
>>> serial@50220000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is not valid under any of the given schemas (Possible causes of the failure):
>>> serial@50220000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is too long
>>> serial@50220000: compatible:0: 'canaan,k210-uart' is not one of ['renesas,r9a06g032-uart', 'renesas,r9a06g033-uart']
>>> serial@50220000: compatible:0: 'canaan,k210-uart' is not one of ['rockchip,px30-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rv1108-uart']
>>> serial@50220000: compatible:0: 'canaan,k210-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart']
>>>
>>> serial@50230000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is not valid under any of the given schemas (Possible causes of the failure):
>>> serial@50230000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is too long
>>> serial@50230000: compatible:0: 'canaan,k210-uart' is not one of ['renesas,r9a06g032-uart', 'renesas,r9a06g033-uart']
>>> serial@50230000: compatible:0: 'canaan,k210-uart' is not one of ['rockchip,px30-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rv1108-uart']
>>> serial@50230000: compatible:0: 'canaan,k210-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart']
>>
>> More device-specific strings.
>>
>>> spi@50240000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is not valid under any of the given schemas (Possible causes of the failure):
>>> spi@50240000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is too long
>>> spi@50240000: compatible:0: 'canaan,k210-spi' is not one of ['snps,dw-apb-ssi', 'snps,dwc-ssi-1.01a']
>>> spi@50240000: compatible:0: 'canaan,k210-spi' is not one of ['mscc,ocelot-spi', 'mscc,jaguar2-spi']
>>
>> ditto
> 
> Actually a false warning from checkpatch. canaan,k210-spi was already added to
> the DW spi yaml.
> 
>>
>>> i2c@50280000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is not valid under any of the given schemas (Possible causes of the failure):
>>> i2c@50280000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is too long
>>>
>>> i2c@50290000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is not valid under any of the given schemas (Possible causes of the failure):
>>> i2c@50290000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is too long
>>>
>>> i2c@502A0000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is not valid under any of the given schemas (Possible causes of the failure):
>>> i2c@502A0000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is too long
>>
>> ditto
>>
>>> timer@502D0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is not valid under any of the given schemas (Possible causes of the failure):
>>> timer@502D0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is too long
>>> timer@502D0000: compatible:0: 'canaan,k210-timer' is not one of ['snps,dw-apb-timer-sp', 'snps,dw-apb-timer-osc']
>>>
>>> timer@502D0000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
>>
>> `resets` is the correct name for this property.
>>
>>> timer@502E0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is not valid under any of the given schemas (Possible causes of the failure):
>>> timer@502E0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is too long
>>> timer@502E0000: compatible:0: 'canaan,k210-timer' is not one of ['snps,dw-apb-timer-sp', 'snps,dw-apb-timer-osc']
>>
>> More device-specific.
>>
>>> timer@502E0000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
>>> timer@502F0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is not valid under any of the given schemas (Possible causes of the failure):
>>> timer@502F0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is too long
>>> timer@502F0000: compatible:0: 'canaan,k210-timer' is not one of ['snps,dw-apb-timer-sp', 'snps,dw-apb-timer-osc']
>>>
>>> timer@502F0000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
>>> watchdog@50400000: compatible: ['canaan,k210-wdt', 'snps,dw-wdt'] is not valid under any of the given schemas (Possible causes of the failure):
>>> watchdog@50400000: compatible: ['canaan,k210-wdt', 'snps,dw-wdt'] is too long
>>> watchdog@50400000: compatible:0: 'canaan,k210-wdt' is not one of ['rockchip,rk3066-wdt', 'rockchip,rk3188-wdt', 'rockchip,rk3288-wdt', 'rockchip,rk3368-wdt']
>>>
>>> watchdog@50410000: compatible: ['canaan,k210-wdt', 'snps,dw-wdt'] is not valid under any of the given schemas (Possible causes of the failure):
>>> watchdog@50410000: compatible: ['canaan,k210-wdt', 'snps,dw-wdt'] is too long
>>> watchdog@50410000: compatible:0: 'canaan,k210-wdt' is not one of ['rockchip,rk3066-wdt', 'rockchip,rk3188-wdt', 'rockchip,rk3288-wdt', 'rockchip,rk3368-wdt']
>>>
>>> spi@52000000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is not valid under any of the given schemas (Possible causes of the failure):
>>> spi@52000000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is too long
>>> spi@52000000: compatible:0: 'canaan,k210-spi' is not one of ['snps,dw-apb-ssi', 'snps,dwc-ssi-1.01a']
>>> spi@52000000: compatible:0: 'canaan,k210-spi' is not one of ['mscc,ocelot-spi', 'mscc,jaguar2-spi']
>>>
>>> spi@53000000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is not valid under any of the given schemas (Possible causes of the failure):
>>> spi@53000000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is too long
>>> spi@53000000: compatible:0: 'canaan,k210-spi' is not one of ['snps,dw-apb-ssi', 'snps,dwc-ssi-1.01a']
>>> spi@53000000: compatible:0: 'canaan,k210-spi' is not one of ['mscc,ocelot-spi', 'mscc,jaguar2-spi']
> 
> canaan,k210-spi is already added to the dw spi doc. Will check that again.
> canaan,k210-ssi is missing though but since there is no quirk associated with
> it, we should not need to mention it in the yaml.
> 
>>>
>>> spi@54000000: compatible: ['canaan,k210-ssi', 'snps,dwc-ssi-1.01a'] is not valid under any of the given schemas (Possible causes of the failure):
>>> spi@54000000: compatible: ['canaan,k210-ssi', 'snps,dwc-ssi-1.01a'] is too long
>>> spi@54000000: compatible:0: 'canaan,k210-ssi' is not one of ['snps,dw-apb-ssi', 'snps,dwc-ssi-1.01a']
>>> spi@54000000: compatible:0: 'canaan,k210-ssi' is not one of ['mscc,ocelot-spi', 'mscc,jaguar2-spi']
>>
>> Ok, so the vast majority of these warnings are from unknown compatible
>> strings. IMO this is not an issue, but the simple fix is to just add
>> these strings to the yaml files.
> 
> We could, but given that checkpatch spits out warnings for the ones already
> added, we should probably start with fixing checkpatch :)

Well, it could also be that I was on the wrong branch, or had some old
build artifacts.

> 
> And there are some nodes that have no drive in Linux, so no yaml. So a warning
> will remain for these but I do not want to remove the nodes.
> 
> Thansk for checking all this !

Just install dt-schema and you can check it too ;)

--Sean

> 
> 
>>
>> --Sean
>>
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
