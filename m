Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B853C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Mar 2022 19:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7R1Rvx5ULo44Co7Al8CJM8VNZhrQMhqwkLnkrFEzYc=; b=b5E3wpbe33bJ0f
	wJ+K8TAYFtySfiu+mrkO9aM8EjYvfbO5TdtLttNyIBXUs+5R004irW3qTtByFj/twAKusa9hse5mq
	sxs8RRZXM9U/p5YW9UBsIIUr1bdviGQdf3x3ohS4gMoMSq4f/7tDiNz6akS8Gv9x1jIHFNVWllTKH
	h8RyWt+p4U/7BBB1F6UjhMSDvojnRSW2Xvd4EliYz/tXLyc+YrwpGl37FEzPRf7CukJZxHxk7Te5i
	AbLQp5YgvahflXZzMkvPpRNhs1jjccJTVJGBAk6TBeJ/d1bvmRdNYnt5eEhsk75vqjsoGUm3OFiVr
	/p5dlAftYXt2YBS/Bkog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSlNs-0008KO-Mj; Fri, 11 Mar 2022 19:57:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSlNo-0008Jl-Vj
 for linux-riscv@lists.infradead.org; Fri, 11 Mar 2022 19:57:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id i66so5704194wma.5
 for <linux-riscv@lists.infradead.org>; Fri, 11 Mar 2022 11:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hyHFdMu5+sDMX2FabVDzHh3nvTbk2iDwWgSCYauJ5LM=;
 b=App1+65z5XOBrhAKeiDdnq7Tl9pLK8rvdlav6iMyD4bmdsMMutsQPAGkKezmR3oiws
 uHZpXEmk/56Xe0gVRdVF9f3CbIFP+aDNU2MFB2ajlwd8LDY3zyqEePomlN/iSiVcsTIU
 RPYQYXdQgm9n3AJ1+vKXN79PLzEjLrl28l2w57/lJXTbTlFN/utHHatVRl2xHQyultSN
 QA5wOIIsU/X50VKXyLul+EmL4GroIPapmJcJRe4iA/gbbgSWWBLBwgBmhBOzTtyjdtpZ
 eLSzMPo6UuVIgLI1XFJyijPwofz9voR90MTlJ4OGpz8kMmepfUYR8bVRlN5FYXw0I2Yn
 URQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hyHFdMu5+sDMX2FabVDzHh3nvTbk2iDwWgSCYauJ5LM=;
 b=noNyIHXq1LSU9ZI4M1SVh6CQaVyAV87IQcGukGCG1dwgmgsVS5yvvw9IzO9SbhYRaa
 jE/JDL2mQGqfJhwgkOnnULnGns5KdYiJ1CyZzuRCrp4q5azjPS2eiP9/pvq2hkNLWRw4
 REjpNY4zYE0jxMGTzAXOOBwpI0QnFJ52CNcoA/mW3l7jELT0iuPU9T1J4CG9ipb6AKEp
 S5hPn0+3BBQgphucvISYXQpJ6cWr6BomU0/OWAEYbeQ0jpX6iCjo+yBJNip21RNBvO7E
 +haIt2p6ZQLTahovIBFYAqAzkDtEkYujdMy2j5tV4rLlo3Z1n7rKUlxQhyTXBfSaKzK7
 8DqQ==
X-Gm-Message-State: AOAM532Arqr1iAlHXkuN83huho6uNmVi39YUhMNUzr06apv4vY2qA6rQ
 MYGE+mJzt6EZVji8YdO4mnRgrQ==
X-Google-Smtp-Source: ABdhPJyfcz6JQlr/qzmlbw18c4zbQShcJ+zFmYG81nNEPwjxlj9hg0tSW/T0xVZo7ONXtDqgW/WguQ==
X-Received: by 2002:a1c:2904:0:b0:37b:ea53:4cbf with SMTP id
 p4-20020a1c2904000000b0037bea534cbfmr8788549wmp.46.1647028622112; 
 Fri, 11 Mar 2022 11:57:02 -0800 (PST)
Received: from [192.168.2.222] ([109.76.4.19])
 by smtp.gmail.com with ESMTPSA id
 p125-20020a1c2983000000b00389cc36a3bfsm10091830wmp.6.2022.03.11.11.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 11:57:01 -0800 (PST)
Message-ID: <66d64241-d2bc-d25a-4204-56f10521ad6c@conchuod.ie>
Date: Fri, 11 Mar 2022 19:56:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 00/11] Update the Icicle Kit device tree
Content-Language: en-US
To: Zong Li <zong.li@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Conor Dooley
 <Conor.Dooley@microchip.com>, Lewis.Hanly@microchip.com,
 Daire.McNamara@microchip.com, Ivan.Griffin@microchip.com,
 atishp@rivosinc.com, linus.walleij@linaro.org, brgl@bgdev.pl,
 Rob Herring <robh+dt@kernel.org>, jassisinghbrar@gmail.com,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 Lee Jones <lee.jones@linaro.org>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven
 <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-gpio@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <mhng-bb42ad9f-5772-4749-97e1-9f6c511654f6@palmer-mbp2014>
 <e9287c9b-6ac7-dcb3-3b03-98bc83bbf119@microchip.com>
 <CANXhq0rPVKSF64Hwd9+jD3ut0y7VCE940V5do0Hn8=mnoX97yw@mail.gmail.com>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <CANXhq0rPVKSF64Hwd9+jD3ut0y7VCE940V5do0Hn8=mnoX97yw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_115705_129094_274FA2FB 
X-CRM114-Status: GOOD (  34.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 11/03/2022 07:59, Zong Li wrote:
> On Thu, Mar 10, 2022 at 3:35 PM <Conor.Dooley@microchip.com> wrote:
>>
>> On 10/03/2022 07:07, Palmer Dabbelt wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On Wed, 23 Feb 2022 12:48:16 PST (-0800), mail@conchuod.ie wrote:
>>>> On 14/02/2022 13:58, conor.dooley@microchip.com wrote:
>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>
>>>>> This series updates the Microchip Icicle Kit device tree by adding a
>>>>> host of peripherals, and some updates to the memory map. In addition,
>>>>> the device tree has been split into a third part, which contains "soft"
>>>>> peripherals that are in the fpga fabric.
>>>>>
>>>>> Several of the entries are for peripherals that have not get had their
>>>>> drivers upstreamed, so in those cases the dt bindings are included where
>>>>> appropriate in order to avoid the many "DT compatible string <x> appears
>>>>> un-documented" errors.
>>>>>
>>>>> Depends on mpfs clock driver binding (on clk/next) to provide
>>>>> dt-bindings/clock/microchip,mpfs-clock.h for the device tree
>>>>> and on the other changes to the icicle/mpfs device tree from geert
>>>>> that are already in linux/riscv/for-next.
>>>
>>> So that's causing this to not build, as I can't build without the
>>> header.  I went ahead and put these on top of that patch, resulting in
>>>
>>>      * 48e8641c2bf0 - (HEAD -> riscv-microchip, palmer/riscv-microchip) MAINTAINERS: update riscv/microchip entry (2 minutes ago) <Conor Dooley>
>>>      * 528a5b1f2556 - riscv: dts: microchip: add new peripherals to icicle kit device tree (2 minutes ago) <Conor Dooley>
>>>      * 5b28df37d311 - riscv: dts: microchip: update peripherals in icicle kit device tree (2 minutes ago) <Conor Dooley>
>>>      * c5094f371008 - riscv: dts: microchip: refactor icicle kit device tree (2 minutes ago) <Conor Dooley>
>>>      * 72560c6559b8 - riscv: dts: microchip: add fpga fabric section to icicle kit (2 minutes ago) <Conor Dooley>
>>>      * 6546f920868e - riscv: dts: microchip: use clk defines for icicle kit (2 minutes ago) <Conor Dooley>
>>>      * df77f7735786 - dt-bindings: pwm: add microchip corepwm binding (2 minutes ago) <Conor Dooley>
>>>      * 735806d8a68e - dt-bindings: gpio: add bindings for microchip mpfs gpio (2 minutes ago) <Conor Dooley>
>>>      * 4cbcc0d7b397 - dt-bindings: rtc: add bindings for microchip mpfs rtc (2 minutes ago) <Conor Dooley>
>>>      * b435a1728c9f - dt-bindings: soc/microchip: add info about services to mpfs sysctrl (2 minutes ago) <Conor Dooley>
>>>      * 213556235526 - dt-bindings: soc/microchip: update syscontroller compatibles (2 minutes ago) <Conor Dooley>
>>>      * 2145bb687e3f - (clk/clk-microchip) dt-bindings: clk: microchip: Add Microchip PolarFire host binding (6 weeks ago) <Daire McNamara>
>>>      * e783362eb54c - (tag: v5.17-rc1) Linux 5.17-rc1 (7 weeks ago) <Linus Torvalds>
>>>
>>> sboyd: IIRC it's OK to consider clk-microchip as a stable branch?  If
>>> not I can just wait until you send your PR to Linus and send this later
>>> in the merge window, no big deal on my end.
>>>
>>> I've put this on for-next.  If that's a problem let me know and I'll
>>> delay it.
>> Great, thanks! Probably worth mentioning that I've deleted the dma node
>> that Zong Li is modifying in his pdma patchset.
>>
> 
> I guess I could re-sent the next version based on top of for-next, or
> delay my patch set until the next tag. What is your perspective?

I'll be honest and say that I have no idea what one is supposed to do here.
Palmer?

> 
>>>
>>> Thanks!
>>>
>>>>>
>>>>> Additionally, the interrupt-extended warnings on the plic/clint are
>>>>> cleared by [1] & [2].
>>>>>
>>>>> [1] https://lore.kernel.org/linux-riscv/cover.1639744468.git.geert@linux-m68k.org/
>>>>> [2] https://lore.kernel.org/linux-riscv/cover.1639744106.git.geert@linux-m68k.org/
>>>>
>>>> Hey Palmer,
>>>>
>>>> dt-bindings should be set now, so if you're still happy to take the
>>>> series via riscv, that'd be great. i2c, spi & usb patches ended going
>>>> via the sub-system trees (and have been dropped from the series), in
>>>> case those generate warnings for you.
>>>
>>> Something went off the rails in email land and #0 and #2 didn't end up
>>> in my patch queue but the rest did.  Luckily enough made it through that
>>> it didn't get lost, and lore's pretty great so this sort of thing isn't
>>> that big of a deal these days.  That said, email is a bit of a black box
>>> so figured I'd give you a heads up.
>>
>> Huh, interesting. I do check after sending that I can see the mails in my
>> other email's inbox & they're there. Guess good thing that I sent the follow up.
>> Thanks,
>> Conor.
>>
>>>
>>>>
>>>> Thanks,
>>>> Conor.
>>>>>
>>>>> Changes from v6:
>>>>> - Dropped i2c patch, as its in i2c-next
>>>>> - Added ack on gpio, reviewed-by on rtc
>>>>> - Dropped child nodes from sysctrl binding entirely, added a link to
>>>>>     the online documenation for the services the system controller can
>>>>>     provide
>>>>> - Dropped the #pwm-cells and replaced with a ref, a la Krzysztof's
>>>>>     series
>>>>>
>>>>> Changes from v5:
>>>>> - reworded the descriptions in the pwm binding to (hopefully) add
>>>>>     clarity
>>>>> - added -mask to the custom properties and made them 32 bit
>>>>> - renamed the i2c binding to corei2c, since it is not mpfs specific
>>>>> - removed the child nodes of the system controller in example/dts &
>>>>>     will create them in the driver.
>>>>>     @Rob, I assume keeping them documented is the correct thing to do?
>>>>> - removed the dependancy on the clock binding from the examples
>>>>> - reformatted rtc interrupts as per Rob's suggestion
>>>>>
>>>>> Changes from v4:
>>>>> - dont include icicle_kit_defconfig, accidentally added in v3
>>>>> - drop prescaler from mpfs-rtc & calculate the value instead
>>>>> - use corei2c as a fallback device for mpfs-i2c
>>>>> - drop spi dt-binding (on spi-next)
>>>>>     commit 2da187304e556ac59cf2dacb323cc78ded988169
>>>>> - drop usb dt-binding (on usb-next)
>>>>>
>>>>> Changes from v3:
>>>>> - drop "mailbox: change mailbox-mpfs compatible string", already upstream:
>>>>>     commit f10b1fc0161cd99e ("mailbox: change mailbox-mpfs compatible string")
>>>>> - fix copy paste error in microchip,mpfs-mailbox dt-binding
>>>>> - remove whitespace in syscontroller dt entry
>>>>>
>>>>> Changes from v2:
>>>>> - dropped plic int header & corresponding defines in dts{,i}
>>>>> - use $ref to drmode in mpfs-musb binding
>>>>> - split changes to dts{,i} again: functional changes to existing
>>>>>     elements now are in a new patch
>>>>> - drop num-cs property in mpfs-spi binding
>>>>> - dont make the system controller a simple-mfd
>>>>> - move the separate bindings for rng/generic system services into the
>>>>>     system controller binding
>>>>> - added an instance corei2c as i2c2 in the fabric dtsi
>>>>> - add version numbering to corepwm and corei2c compat string (-rtl-vN)
>>>>>
>>>>> Conor Dooley (11):
>>>>>     dt-bindings: soc/microchip: update syscontroller compatibles
>>>>>     dt-bindings: soc/microchip: add info about services to mpfs sysctrl
>>>>>     dt-bindings: rtc: add bindings for microchip mpfs rtc
>>>>>     dt-bindings: gpio: add bindings for microchip mpfs gpio
>>>>>     dt-bindings: pwm: add microchip corepwm binding
>>>>>     riscv: dts: microchip: use clk defines for icicle kit
>>>>>     riscv: dts: microchip: add fpga fabric section to icicle kit
>>>>>     riscv: dts: microchip: refactor icicle kit device tree
>>>>>     riscv: dts: microchip: update peripherals in icicle kit device tree
>>>>>     riscv: dts: microchip: add new peripherals to icicle kit device tree
>>>>>     MAINTAINERS: update riscv/microchip entry
>>>>>
>>>>>    .../bindings/gpio/microchip,mpfs-gpio.yaml    |  79 ++++++
>>>>>    ...ilbox.yaml => microchip,mpfs-mailbox.yaml} |   6 +-
>>>>>    .../bindings/pwm/microchip,corepwm.yaml       |  81 ++++++
>>>>>    .../bindings/rtc/microchip,mfps-rtc.yaml      |  58 ++++
>>>>>    .../microchip,mpfs-sys-controller.yaml        |  40 +++
>>>>>    ...icrochip,polarfire-soc-sys-controller.yaml |  35 ---
>>>>>    MAINTAINERS                                   |   2 +
>>>>>    .../dts/microchip/microchip-mpfs-fabric.dtsi  |  25 ++
>>>>>    .../microchip/microchip-mpfs-icicle-kit.dts   | 115 ++++++--
>>>>>    .../boot/dts/microchip/microchip-mpfs.dtsi    | 254 ++++++++++++++----
>>>>>    10 files changed, 591 insertions(+), 104 deletions(-)
>>>>>    create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
>>>>>    rename Documentation/devicetree/bindings/mailbox/{microchip,polarfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} (82%)
>>>>>    create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
>>>>>    create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
>>>>>    create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
>>>>>    delete mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
>>>>>    create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
>>>>>
>>
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
