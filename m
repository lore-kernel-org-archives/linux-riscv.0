Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19F0C64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 15:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Etko9pMn4wh4GOSJLQyGU4uD9dDKdixx5aQTQCJZ8A=; b=xMl9oz1XOcDzrt
	pcKDFddJYvD5AWz+Mv06CqCnlo5twPC88mmZTHCOGrwYIBa4zN1M948/0TSCQeFOKt/FKZzYfO5rM
	0+z91SC4mmqrUNsEASiwgP7oqFikJqa91lw3TljXBgWl3WTAx69vVfuhqE9K8aV/1PhrvMtPxIBm7
	UEoKFaKJOJLrUMNevww5DP8jVMEUQvJxM1xID027F2cc9FhIxAAxBWjzcTnv8Z0Np8VuFQr1d64Xc
	GCDLFjSFHFHYRM3D7Ri7EHm7ysdtkq36SQ1wujj/goAyuPKKsTnMsvpjrFQZZaHDMIE8HT4K6Qlq/
	DvyBpWnVbqQVVL7KmaBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX1SV-00Da7J-QO; Tue, 28 Feb 2023 15:00:03 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX1SS-00Da59-AD
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 15:00:02 +0000
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4F2E03F5A1
	for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 14:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1677596394;
	bh=sR9+TU4QdZ6QdtGKERfD8tPs5IwyEG556JdFrx7slTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=FGS8Nf7p51/tk7lggn1sEZNKBfqOLynAtV+rIRbLG5K2AUM4DwhTksah8KOFHkeNu
	 p5Y7alz6On3kqRc5tPUXZsStK7jFS5uzxwxPEBFMCjRp/xrZbUgN/fnwm7OmteHy9/
	 88iuU0LGkMUuBC6cwQIHPe96Esixpeiwjvcvzlq/KaHs+xCEpFQeAebSTE2NECgBjF
	 f0bwR3txJohRfV+1O6pOE0890p4Ja8G+8Mdxif2ggcfdx5Iq+ih/YJsBUDuJhFVOCl
	 G67SDkBipPwTsURHV+c8IPj3jJGyYOyvY7dApoe02fLgtmyxmgha4+OoYUZ2rVQywr
	 t3v53Dm123jMA==
Received: by mail-qv1-f70.google.com with SMTP id pp11-20020a056214138b00b0056c228fa15cso5249327qvb.4
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 06:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sR9+TU4QdZ6QdtGKERfD8tPs5IwyEG556JdFrx7slTk=;
        b=yY1BU5uqcm4ZkfV06QH63+O+k4oNIG9DyPjuGmo5GaLM05YQwPT4XRPaET7/q/dToC
         IkP8cu/nuUHDmNWapxvlLuYKQuOrVetz0w8O+GTS/QnIL01O6f3w2xOgkE30uFYKCZ/4
         9mA62T6YbhFFjIcJ037OxW6RZrbOmqPo9IuN0ThdzrKGuFNRwuB4a+xP71jOiK3LyQM7
         JjhgGGSe3Y3VeVwGEVAInMUsSccMU7idRZEoN6/FLCqHI2V0vnwDixAZU7uuxmaR1W1w
         XHpLQPJin8IMSuZ1YfrhbL6bdocMI7qAuz0SSmgVCfVA1RgmywSd84m4++6gEz1rpZ6A
         xtTg==
X-Gm-Message-State: AO0yUKXB1/ILmUgF6Hn+IWoqBeEJTUOnMR8sexXcosy2CzJS3vwbSU1k
	c4ago/rn0XfRi2xKhEKSbQ4Prw3RqMRnXLYS679v6BBlgD/dQx8OQXcHo9j2hi8ymvv6fSttHr9
	xndQ9wSZ0+CBSCR8BDEl1KDljCqOM5I3uk5myo4GO2UYUu0OnxXw8j+PgRl0axg==
X-Received: by 2002:a05:6214:1907:b0:56e:fbea:9e9a with SMTP id er7-20020a056214190700b0056efbea9e9amr883156qvb.0.1677596392455;
        Tue, 28 Feb 2023 06:59:52 -0800 (PST)
X-Google-Smtp-Source: AK7set98OeQlNbOvVCz2xGtQT7yvm5Bp1FcodjBI6u1K21A/NvB5+qKnCOMGlj1gPexULiX05yQ8xWlgU7ItfF52m8w=
X-Received: by 2002:a05:6214:1907:b0:56e:fbea:9e9a with SMTP id
 er7-20020a056214190700b0056efbea9e9amr883147qvb.0.1677596392033; Tue, 28 Feb
 2023 06:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-5-william.qiu@starfivetech.com> <20230220234335.GA615198-robh@kernel.org>
 <348796cc-72d9-4dcf-9f09-4c2aa55cb858@starfivetech.com> <20230227222904.GC1048218-robh@kernel.org>
 <f8d2b665-ce5d-81f8-8c55-81f1a4cb62b9@starfivetech.com> <54f51fa0-7821-b67b-b782-eb9a35b7bba9@linaro.org>
 <CAJM55Z85fitjBOcCLqad9W-a7h3iN9bxtctVGzPgqCbf5fWobw@mail.gmail.com> <a0168d89-3c30-55e1-cf4c-37f7fe90aae4@linaro.org>
In-Reply-To: <a0168d89-3c30-55e1-cf4c-37f7fe90aae4@linaro.org>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 28 Feb 2023 15:59:25 +0100
Message-ID: <CAJM55Z8dR4TDJNeO-qiS9CurfCWM1ccNigOA1fDb7S1VKCxv2Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] dt-bindings: syscon: Add StarFive syscon doc
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: William Qiu <william.qiu@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_070000_802154_2CB638B4 
X-CRM114-Status: GOOD (  39.53  )
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

On Tue, 28 Feb 2023 at 12:28, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 28/02/2023 12:02, Emil Renner Berthing wrote:
> > On Tue, 28 Feb 2023 at 11:40, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 28/02/2023 10:05, William Qiu wrote:
> >>>
> >>>
> >>> On 2023/2/28 6:29, Rob Herring wrote:
> >>>> On Tue, Feb 21, 2023 at 10:44:02AM +0800, William Qiu wrote:
> >>>>>
> >>>>>
> >>>>> On 2023/2/21 7:43, Rob Herring wrote:
> >>>>>> On Wed, Feb 15, 2023 at 07:32:49PM +0800, William Qiu wrote:
> >>>>>>> Add documentation to describe StarFive System Controller Registers.
> >>>>>>>
> >>>>>>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> >>>>>>> ---
> >>>>>>>  .../bindings/soc/starfive/jh7110-syscon.yaml  | 51 +++++++++++++++++++
> >>>>>>>  MAINTAINERS                                   |  5 ++
> >>>>>>>  2 files changed, 56 insertions(+)
> >>>>>>>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
> >>>>>>>
> >>>>>>> diff --git a/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
> >>>>>>> new file mode 100644
> >>>>>>> index 000000000000..fa4d8522a454
> >>>>>>> --- /dev/null
> >>>>>>> +++ b/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
> >>>>>>> @@ -0,0 +1,51 @@
> >>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>>>>>> +%YAML 1.2
> >>>>>>> +---
> >>>>>>> +$id: http://devicetree.org/schemas/soc/starfive/jh7110-syscon.yaml#
> >>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>>>> +
> >>>>>>> +title: StarFive JH7110 SoC system controller
> >>>>>>> +
> >>>>>>> +maintainers:
> >>>>>>> +  - William Qiu <william.qiu@starfivetech.com>
> >>>>>>> +
> >>>>>>> +description: |
> >>>>>>> +  The StarFive JH7110 SoC system controller provides register information such
> >>>>>>> +  as offset, mask and shift to configure related modules such as MMC and PCIe.
> >>>>>>> +
> >>>>>>> +properties:
> >>>>>>> +  compatible:
> >>>>>>> +    items:
> >>>>>>> +      - enum:
> >>>>>>> +          - starfive,jh7110-stg-syscon
> >>>>>>> +          - starfive,jh7110-sys-syscon
> >>>>>>> +          - starfive,jh7110-aon-syscon
> >>>>>>
> >>>>>> Is 'syscon' really part of what the blocks are called? Is just 'stg',
> >>>>>> 'sys' and 'aon' not unique enough?
> >>>>>>
> >>>>>> Rob
> >>>>> Hi Rob,
> >>>>>
> >>>>> In StarFive SoC, we do have syscrg/aoncrg/stgcrg, which is uesd to be the clock
> >>>>> controller, so 'syscon' is added to avoid confusion.
> >>>>
> >>>> You've only added to my confusion. 'syscrg' and 'sys-syscon' are 2
> >>>> different h/w blocks and unrelated to each other? Or 'syscrg' is the
> >>>> clock portion of 'sys-syscon'? In that case, 'syscrg' should be a child
> >>>> of 'sys-syscon' or possibly just all one node. Please provide details on
> >>>> the entire h/w block so we can provide better input on the bindings.
> >>>>
> >>>> Rob
> >>>
> >>> Hi Rob,
> >>>
> >>> It's my description that's problematic.'syscon' here refers to the hardware module
> >>> inside our JH7110, which is different from the syscon interface in linux. The syscon
> >>> I added now uses the syscon interface of linux to read and write the syscon register
> >>> in our JH7110. So we decided to name it that way.
> >>
> >> You didn't really answer Rob's questions.
> >>
> >> Also, syscon is Linux term, so are you sure hardware module is called
> >> like this? Hardware engineers took pure Linux name and used it?
> >
> > Yes, from the documentation I could find[1] there are CRG blocks
> > (Clock and Reset Generator) and SYSCON blocks:
> > SYS CRG
> > STG CRG
> > AON CRG
> > SYS SYSCON
> > STG SYSCON
> > AON SYSCON
> >
> > The CRG blocks contain registers to control clocks and resets that
> > follow a pattern used by the clock and reset drivers. The SYSCON
> > blocks just seem to contain registers to control whatever didn't fit
> > in any other blocks, but might be vaguely related to the peripherals
> > that run off clocks controlled by the corresponding CRG block.
>
> The memory map [1] suggests these are indeed separate address spaces,
> e.g. AON CRG, AON SYSCON and AON GPIO, but now I would argue that this
> might be still one device - AON (or STG, SYS). Just like PCIE0 has four
> address spaces, it does not mean you have four separate PCIE0 devices.
> You have only one PCIE0, just like you have only one AON, one STG and
> one SYS (System).

I see what you mean, but if you look into what the registers in the
SYSCON blocks actually do it's not clear to me that they should be
grouped with the clocks/resets any more than say the pinctrl/GPIO
node. Maybe it's my fault for not giving you the full picture. Eg. for
"system" and "always-on" there are blocks:

SYS CRG
SYS SYSCON
SYS IOMUX
AON CRG
AON SYSCON
AON IOMUX

..and it really don't see why eg. SYS CRG and SYS SYSCON should be
thought of as one device, but not include SYS IOMUX then.

As an examly the SYS SYSCON includes registers to control:
- remapping of different peripherals from SD controller to video encoders
- voltage select for certain GPIO pins
- phy interface selection for ethernet and CAN
- QuadSPI delay chain and SRAM configuration
- PLL configuration
- endian selection for the SD controller

To me this is pretty much exactly described by the syscon device tree binding:
"System controller node represents a register region containing a set
of miscellaneous registers. The registers are not cohesive enough to
represent as any specific type of device. [..]"
In any case it's clear that however the SYSCON blocks are represented
in the device tree, a driver for it would need to export registers in
the SYSCON block for other drivers to use.

/Emil



> [1] https://doc-en.rvspace.org/JH7110/TRM/JH7110_TRM/system_memory_map.html
>
>
> Best regards,
> Krzysztof
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
