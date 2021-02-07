Return-Path: <SRS0=UnsP=HJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1C8C433DB
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 17:37:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10D7E64DF2
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 17:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10D7E64DF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gngrjBCtsm3uONavZkIlaY7JQf9EasBxolKMXrllxQk=; b=MQZQaMHaAV7mEsEQRe2OybGdN
	C9HiylyDXMe6QLeAaPcQwfFyNZT5r8nsuCkGZSvKtGkTllW+Y26QXoP4uxEqFbiHZT5Whwa4Tp+Hp
	PCEckyk1Uv9U81IGdPMyvMqXEwSSJAZsxQrHUilECNGXYHPaejB11v40wD92sAuk0vNAHq4A5uFpL
	Ql9UT1bYc8ynlsdqiG648nzKD9i80HJD46s6BsHSZ2m5AgbQOxTwEPIy4Z2Ud/ztmkpifnPjgUVbG
	8VTyb6RTbmkCZplEobP82d2XtiX5hdSjXy0jchUr58qq4lJ1Xar7TAAQBGsLaLAONJ1QFrjWhha34
	Tgma1OuBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8nzv-0003BO-Fn; Sun, 07 Feb 2021 17:37:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8nzt-0003B3-9D
 for linux-riscv@lists.infradead.org; Sun, 07 Feb 2021 17:37:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 288D264DFF
 for <linux-riscv@lists.infradead.org>; Sun,  7 Feb 2021 17:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612719439;
 bh=JBrer7MmSp9anIqo1e2OxNMMJMy817bO80gJxVFE9PY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EYwuRWQSF4d2dBLE/FomWvU3udBt4esOW7SbpEznfDpW30nHFBqzKcdYsbfl2teZR
 TM67WfRIuy+S5og2lvVJEo0dvqd1P2O77Ye5Mn7endjOQ3OkUEaHZqqtfF2LhRUlmo
 YFTj0m5qd9oKAdRAU9Aml7b/0UWYillvRh/o0t3MAq7uckZzu3XVWl3a5bJ08u8nFg
 B699LBQ7Q8qAVmbQjy5ymLYXBxc02c1XNNMptfapedeNum+Ka+knaAbrUCGT9YhQB6
 UtMSHDN0cy8IbI78skXClgjqWHnKKwIIypXjx34w6iLzwfolwuDhd/PWQ9Tn/Q2StR
 EOO596oRnbeCw==
Received: by mail-ej1-f49.google.com with SMTP id jj19so21079075ejc.4
 for <linux-riscv@lists.infradead.org>; Sun, 07 Feb 2021 09:37:19 -0800 (PST)
X-Gm-Message-State: AOAM532O/o4lDMhB5wy5ahLNcR/J2gaNp/5GwKQL15fkBNeoSdyq+iqZ
 8WArpJys654MR41SzITVSCndMvtoDs1jbiot+A==
X-Google-Smtp-Source: ABdhPJxfp4HLpgN12t8FTieZA1hQ+bAkJl9Evp8+JJJNEIvi9JOVNC7e9OD8UtC5T9gxhvsaBg5zArv9lFHROO9z6Cs=
X-Received: by 2002:a17:906:af41:: with SMTP id
 ly1mr13062386ejb.525.1612719437760; 
 Sun, 07 Feb 2021 09:37:17 -0800 (PST)
MIME-Version: 1.0
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-8-damien.lemoal@wdc.com>
 <CAL_JsqJNqKrsB3LJvBpNmY6H3V1c5x4duqB_0p8YKit4+ZYRBw@mail.gmail.com>
 <89cccbae5add85c7bd811f3819ea3db7061e928d.camel@wdc.com>
 <CAL_JsqJeF364bPSNQLGujNHDkA7x8H_H7YXQFNZQ7vDzdAevcA@mail.gmail.com>
 <c9d273c87815a89be314e4e824a365313be0d677.camel@wdc.com>
 <CAL_JsqKnAQ+ngNkaKkDAO5Bqd=ZwNm5A4VhxvuVZxgLdxxxpSg@mail.gmail.com>
 <6351faa35c175d38e033ce433780c03c141c0ddf.camel@wdc.com>
 <c170e192-9e3f-5682-5a7f-ac9fc573fd9d@gmail.com>
 <f0b7df37e67151dab5699923549de6b3fbe30367.camel@wdc.com>
 <1726dceb-868e-68a1-38df-2f80ee233ed1@gmail.com>
 <BL0PR04MB651496C3B638E46E178CAC2FE7B19@BL0PR04MB6514.namprd04.prod.outlook.com>
In-Reply-To: <BL0PR04MB651496C3B638E46E178CAC2FE7B19@BL0PR04MB6514.namprd04.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Sun, 7 Feb 2021 11:37:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJYS1CxpYaucRkUxWSuyDvp=FA81xmsz0i6R+VHHwGNuQ@mail.gmail.com>
Message-ID: <CAL_JsqJYS1CxpYaucRkUxWSuyDvp=FA81xmsz0i6R+VHHwGNuQ@mail.gmail.com>
Subject: Re: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_123721_481069_12ADB8B5 
X-CRM114-Status: GOOD (  39.55  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Anup Patel <Anup.Patel@wdc.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <Atish.Patra@wdc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 5, 2021 at 6:52 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>
> On 2021/02/06 9:31, Sean Anderson wrote:
> > On 2/5/21 6:32 PM, Damien Le Moal wrote:
> >> On Fri, 2021-02-05 at 17:55 -0500, Sean Anderson wrote:
> >>> On 2/5/21 5:53 PM, Damien Le Moal wrote:
> >>>> On Fri, 2021-02-05 at 14:02 -0600, Rob Herring wrote:
> >>>>> On Wed, Feb 3, 2021 at 6:47 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> >>>>>>
> >>>>>> On Wed, 2021-02-03 at 14:41 -0600, Rob Herring wrote:
> >>>>>>> On Wed, Feb 3, 2021 at 6:52 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> >>>>>>>>
> >>>>>>>> On Tue, 2021-02-02 at 13:02 -0600, Rob Herring wrote:
> >>>>>>>>> On Tue, Feb 2, 2021 at 4:36 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> >>>>>>>>>>
> >>>>>>>>>> The sifive gpio IP block supports up to 32 GPIOs. Reflect that in the
> >>>>>>>>>> interrupts property description and maxItems. Also add the standard
> >>>>>>>>>> ngpios property to describe the number of GPIOs available on the
> >>>>>>>>>> implementation.
> >>>>>>>>>>
> >>>>>>>>>> Also add the "canaan,k210-gpiohs" compatible string to indicate the use
> >>>>>>>>>> of this gpio controller in the Canaan Kendryte K210 SoC. If this
> >>>>>>>>>> compatible string is used, do not define the clocks property as
> >>>>>>>>>> required as the K210 SoC does not have a software controllable clock
> >>>>>>>>>> for the Sifive gpio IP block.
> >>>>>>>>>>
> >>>>>>>>>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> >>>>>>>>>> Cc: Rob Herring <robh@kernel.org>
> >>>>>>>>>> Cc: devicetree@vger.kernel.org
> >>>>>>>>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> >>>>>>>>>> ---
> >>>>>>>>>>    .../devicetree/bindings/gpio/sifive,gpio.yaml | 21 ++++++++++++++++---
> >>>>>>>>>>    1 file changed, 18 insertions(+), 3 deletions(-)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> >>>>>>>>>> index ab22056f8b44..2cef18ca737c 100644
> >>>>>>>>>> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> >>>>>>>>>> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> >>>>>>>>>> @@ -16,6 +16,7 @@ properties:
> >>>>>>>>>>          - enum:
> >>>>>>>>>>              - sifive,fu540-c000-gpio
> >>>>>>>>>>              - sifive,fu740-c000-gpio
> >>>>>>>>>> +          - canaan,k210-gpiohs
> >>>>>>>>>>          - const: sifive,gpio0
> >>>>>>>>>>
> >>>>>>>>>>      reg:
> >>>>>>>>>> @@ -23,9 +24,9 @@ properties:
> >>>>>>>>>>
> >>>>>>>>>>      interrupts:
> >>>>>>>>>>        description:
> >>>>>>>>>> -      interrupt mapping one per GPIO. Maximum 16 GPIOs.
> >>>>>>>>>> +      interrupt mapping one per GPIO. Maximum 32 GPIOs.
> >>>>>>>>>>        minItems: 1
> >>>>>>>>>> -    maxItems: 16
> >>>>>>>>>> +    maxItems: 32
> >>>>>>>>>>
> >>>>>>>>>>      interrupt-controller: true
> >>>>>>>>>>
> >>>>>>>>>> @@ -38,6 +39,10 @@ properties:
> >>>>>>>>>>      "#gpio-cells":
> >>>>>>>>>>        const: 2
> >>>>>>>>>>
> >>>>>>>>>> +  ngpios:
> >>>>>>>>>> +    minimum: 1
> >>>>>>>>>> +    maximum: 32
> >>>>>>>>>
> >>>>>>>>> What's the default as obviously drivers already assume something.
> >>>>>>>>>
> >>>>>>>>> Does a driver actually need to know this? For example, does the
> >>>>>>>>> register stride change or something?
> >>>>>>>>>
> >>>>>>>>> Please don't add it if the only purpose is error check your DT (IOW,
> >>>>>>>>> if it just checks the max cell value in gpios phandles).
> >>>>>>>>
> >>>>>>>> If I remove that, make dtbs_check complains. Looking at othe gpio controller
> >>>>>>>> bindings, they all have it. So isn't it better to be consistent, and avoid make
> >>>>>>>> dtbs_check errors ?
> >>>>>>>
> >>>>>>> That would mean you are already using 'ngpios' and it is undocumented
> >>>>>>> (for this binding). If already in use and possibly having users then
> >>>>>>> that changes things, but that's not what the commit msg says.
> >>>>>>>
> >>>>>>> Not *all* gpio controllers have ngpios. It's a good number, but
> >>>>>>> probably more than need it though. If we wanted it everywhere, there
> >>>>>>> would be a schema enforcing that.
> >>>>>>
> >>>>>> If I remove the minimum and maximum lines, I get this error:
> >>>>>
> >>>>> I never said remove minimum/maximum. The suggestion is either add
> >>>>> 'default: 16' or remove 'ngpios' entirely.
> >>>>>
> >>>>>> ./Documentation/devicetree/bindings/gpio/sifive,gpio.yaml:42:10: [error] empty
> >>>>>> value in block mapping (empty-values)
> >>>>>>     CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
> >>>>>> /home/damien/Projects/RISCV/linux/Documentation/devicetree/bindings/gpio/sifive
> >>>>>> ,gpio.yaml: properties:ngpios: None is not of type 'object', 'boolean'
> >>>>>>     SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
> >>>>>> /home/damien/Projects/RISCV/linux/Documentation/devicetree/bindings/gpio/sifive
> >>>>>> ,gpio.yaml: ignoring, error in schema: properties: ngpios
> >>>>>> warning: no schema found in file:
> >>>>>> ./Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> >>>>>
> >>>>> ngpios: true
> >>>>>
> >>>>> or
> >>>>>
> >>>>> ngpios: {}
> >>>>>
> >>>>> Are the minimum valid values for a key. (Though not what should be done here.)
> >>>>>
> >>>>>>
> >>>>>> If I remove the ngpios property entirely, then I get a hit on the device tree:
> >>>>>>
> >>>>>>     CHECK   arch/riscv/boot/dts/canaan/sipeed_maix_bit.dt.yaml
> >>>>>> /linux/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dt.yaml:
> >>>>>> gpio-controller@38001000: 'ngpios' does not match any of the regexes: 'pinctrl-
> >>>>>> [0-9]+'
> >>>>>>           From schema:
> >>>>>> /home/damien/Projects/RISCV/linux/Documentation/devicetree/bindings/gpio/sifive
> >>>>>> ,gpio.yaml
> >>>>>
> >>>>> That's not upstream, right? Then fix it.
> >>>>>
> >>>>>> Now, If I change the property definition to this:
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> >>>>>> b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> >>>>>> index 2cef18ca737c..5c7865180383 100644
> >>>>>> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> >>>>>> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> >>>>>> @@ -40,8 +40,11 @@ properties:
> >>>>>>        const: 2
> >>>>>>
> >>>>>>      ngpios:
> >>>>>> -    minimum: 1
> >>>>>> -    maximum: 32
> >>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>>>>> +    description:
> >>>>>> +      The number of GPIO pins implemented by the controller.
> >>>>>> +      It is 16 for the SiFive SoCs and 32 for the Canaan K210 SoC.
> >>>>>> +
> >>>>>>
> >>>>>>      gpio-controller: true
> >>>>>>
> >>>>>> Then all is OK.
> >>>>>>
> >>>>>> Which option should I go for here ? If we want to avoid a dtbs_check error, as
> >>>>>> far as I can see, we can:
> >>>>>> 1) Remove the ngpios property and remove its use from the DTS, which is not
> >>>>>> nice in my opinion
> >>>>>
> >>>>> Again, it depends if there are users depending on it. A user being a
> >>>>> GPIO driver somewhere, not a DTS file. The GPIO driver in the kernel
> >>>>> doesn't need it. So u-boot? BSD?
> >>>>
> >>>> The Linux driver uses the number of interrupts for the number of gpios but
> >>>> upstream U-Boot uses the ngpios property. So I will change this to use
> >>>> "default: 16" as you suggested.
> >>>
> >>> There is no reasonable default for this hardware. I would much rather
> >>> you keep the schema as-is, or at least go with the second option.
> >>
> >> Since the SiFive official doc seems to say "16" as the number of gpio for this
> >> controller, we could assume that to be the default. No ? But I agree that
> >> clearly, the implementation can be hacked to have any number of GPIOs...

Yes, 'default' is simply what a driver should assume if the property
is not present. Drivers had to assume something already, right? Or
simply the value doesn't matter as I've suggested.

> > Keep in mind that those docs are for SiFive's particular instantiation
> > of that IP, not for the IP in general. Although some parameters (e.g.
> > dsWidth) have defaults, width does not.
>
> OK. Then I think the simplest is to keep the minimum/maximum. Many binding docs
> use that anyway.

Either that or an enum is required IMO.

32 is clearly the max here or the register layout would have to change.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
