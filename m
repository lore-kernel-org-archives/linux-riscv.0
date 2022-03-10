Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F94C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Mar 2022 07:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=R1/13qZI3GIChRVMt2tgOOIxVQTT4EbqMeTeeMMXNBc=; b=TUFJ2LKtNhcDwcUumBEZFTF+3a
	Mn99wUmwh270UI75qQypfutJWgbjjF3eqNtCNSkMNp4O750Fg5VJFyGloWfw4sQxPL/avd1f0cxSg
	guMCfOh/aSvsh6C+Mqut880ENzh0xsEBAFci+PSwLIFk0GVQBfjhdX47afftgSFS4vosAjVfJjvsm
	QegA9fZMrriw8+kg0xY+qxS/tUCTHVZO/4tfv0GzMXxbRvmdottuJuHrf51GtQQgBbTqNWMhsp65B
	VcBosSvpBt0uMEkTCFV09TYpBXy377qECXR6XxbaSDx4J1Qe0l2rXwzysuVyXho7SvtPnjbSCaV3I
	SE0soR2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSCtB-00BhOO-LV; Thu, 10 Mar 2022 07:07:09 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSCt7-00BhLv-W8
 for linux-riscv@lists.infradead.org; Thu, 10 Mar 2022 07:07:08 +0000
Received: by mail-pf1-x436.google.com with SMTP id g1so4372163pfv.1
 for <linux-riscv@lists.infradead.org>; Wed, 09 Mar 2022 23:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Q9p+Z9UIcIGH1r1Gh/2P/Icl9JR4XR5mVLpW26wd83A=;
 b=1ensALa6NEV3XM+LxptzcfH3PBBd3WFu2n6BMxaHryCWcybRSB3h6tjXdxp1VfRurI
 ycyktmI7KTt8Ohj3v+W4Eit/1TC3O1GSFz6xoQtMmGIeZAS1nceUEzkUuBkehqMT+Vh3
 aoPAbTU/VAQc8uW/0oxz7aqGrEmMaEaQjA6MJHceZ+tiVD33UZnhnbio71bGpFjOlklD
 Z4uFwKT38g9aSpe08Xfwp44wqTT0ZcJEOq4dbZoef+7zyQHR5GJmcuh4uze0K6i5yV7W
 fup0LfNzFvSQbf/dtJK5k4QWApZgeCHgij1HBB4j0tKCZhuIWyywRHzi1UkARFh4GpC2
 fjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Q9p+Z9UIcIGH1r1Gh/2P/Icl9JR4XR5mVLpW26wd83A=;
 b=W4/wUWbOO7qxl5ocHes9O/DkCBoB/bK+EpNRDMXvCBC5ZsQE8VPs6lzjbLOb7d9MDL
 6Ag8+EEt9CT9UdqrPdBtFGD++JlsLveJHcWb0QaDUi9KQ5nH28Yaog3H6GJalUuxMv7Y
 +his7jJ88mGRGY3rJPy1rLRjUpyqJewKYS396hWsN1mYpXhFx0iQiHsDsgC7tZocGQzH
 fQc1C6NnuouQRHZlsSnsrNCiY5dvvMNmAeKUqFhs6QMKJ520eeG2KXDmPyT5OJdRlYzH
 hKPKEiKhVYTVXtAUxT4axapAz2fmKvLeS0if13eAOnCWE/XWPRSgBC96VFM9+Qz3O9eH
 TB9Q==
X-Gm-Message-State: AOAM533LvXqEikYi62CanEesq5v/JRpHT03JZAFsWuVKNiG6JFn2UqqY
 3EHQ+1rHqkIAPqhbg+24ETCviA==
X-Google-Smtp-Source: ABdhPJz4ucB4FyqweBl+yXEIDEO0AJ2c+CUD3gtBCfxujgL6AXGNcBrhdEMVDSoj6JXGJEH6gA3SUw==
X-Received: by 2002:a63:d44c:0:b0:380:8c48:e040 with SMTP id
 i12-20020a63d44c000000b003808c48e040mr3020117pgj.14.1646896023993; 
 Wed, 09 Mar 2022 23:07:03 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 c3-20020a056a00248300b004f6f729e485sm5955166pfv.127.2022.03.09.23.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 23:07:03 -0800 (PST)
Date: Wed, 09 Mar 2022 23:07:03 -0800 (PST)
X-Google-Original-Date: Wed, 09 Mar 2022 22:57:17 PST (-0800)
Subject: Re: [PATCH v7 00/11] Update the Icicle Kit device tree
In-Reply-To: <c94f9c0a-6dbe-c1f4-daff-e4d29f3ace02@conchuod.ie>
CC: lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
 ivan.griffin@microchip.com, Atish Patra <atishp@rivosinc.com>,
 conor.dooley@microchip.com, 
 linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
 jassisinghbrar@gmail.com, 
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 a.zummo@towertech.it, 
 alexandre.belloni@bootlin.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 geert@linux-m68k.org, krzysztof.kozlowski@canonical.com,
 linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mail@conchuod.ie, sboyd@kernel.org
Message-ID: <mhng-bb42ad9f-5772-4749-97e1-9f6c511654f6@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_230706_118056_95A699AD 
X-CRM114-Status: GOOD (  33.27  )
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

On Wed, 23 Feb 2022 12:48:16 PST (-0800), mail@conchuod.ie wrote:
> On 14/02/2022 13:58, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> This series updates the Microchip Icicle Kit device tree by adding a
>> host of peripherals, and some updates to the memory map. In addition,
>> the device tree has been split into a third part, which contains "soft"
>> peripherals that are in the fpga fabric.
>>
>> Several of the entries are for peripherals that have not get had their
>> drivers upstreamed, so in those cases the dt bindings are included where
>> appropriate in order to avoid the many "DT compatible string <x> appears
>> un-documented" errors.
>>
>> Depends on mpfs clock driver binding (on clk/next) to provide
>> dt-bindings/clock/microchip,mpfs-clock.h for the device tree
>> and on the other changes to the icicle/mpfs device tree from geert
>> that are already in linux/riscv/for-next.

So that's causing this to not build, as I can't build without the 
header.  I went ahead and put these on top of that patch, resulting in

    * 48e8641c2bf0 - (HEAD -> riscv-microchip, palmer/riscv-microchip) MAINTAINERS: update riscv/microchip entry (2 minutes ago) <Conor Dooley>
    * 528a5b1f2556 - riscv: dts: microchip: add new peripherals to icicle kit device tree (2 minutes ago) <Conor Dooley>
    * 5b28df37d311 - riscv: dts: microchip: update peripherals in icicle kit device tree (2 minutes ago) <Conor Dooley>
    * c5094f371008 - riscv: dts: microchip: refactor icicle kit device tree (2 minutes ago) <Conor Dooley>
    * 72560c6559b8 - riscv: dts: microchip: add fpga fabric section to icicle kit (2 minutes ago) <Conor Dooley>
    * 6546f920868e - riscv: dts: microchip: use clk defines for icicle kit (2 minutes ago) <Conor Dooley>
    * df77f7735786 - dt-bindings: pwm: add microchip corepwm binding (2 minutes ago) <Conor Dooley>
    * 735806d8a68e - dt-bindings: gpio: add bindings for microchip mpfs gpio (2 minutes ago) <Conor Dooley>
    * 4cbcc0d7b397 - dt-bindings: rtc: add bindings for microchip mpfs rtc (2 minutes ago) <Conor Dooley>
    * b435a1728c9f - dt-bindings: soc/microchip: add info about services to mpfs sysctrl (2 minutes ago) <Conor Dooley>
    * 213556235526 - dt-bindings: soc/microchip: update syscontroller compatibles (2 minutes ago) <Conor Dooley>
    * 2145bb687e3f - (clk/clk-microchip) dt-bindings: clk: microchip: Add Microchip PolarFire host binding (6 weeks ago) <Daire McNamara>
    * e783362eb54c - (tag: v5.17-rc1) Linux 5.17-rc1 (7 weeks ago) <Linus Torvalds>

sboyd: IIRC it's OK to consider clk-microchip as a stable branch?  If 
not I can just wait until you send your PR to Linus and send this later 
in the merge window, no big deal on my end.

I've put this on for-next.  If that's a problem let me know and I'll 
delay it.

Thanks!

>>
>> Additionally, the interrupt-extended warnings on the plic/clint are
>> cleared by [1] & [2].
>>
>> [1] https://lore.kernel.org/linux-riscv/cover.1639744468.git.geert@linux-m68k.org/
>> [2] https://lore.kernel.org/linux-riscv/cover.1639744106.git.geert@linux-m68k.org/
>
> Hey Palmer,
>
> dt-bindings should be set now, so if you're still happy to take the
> series via riscv, that'd be great. i2c, spi & usb patches ended going
> via the sub-system trees (and have been dropped from the series), in
> case those generate warnings for you.

Something went off the rails in email land and #0 and #2 didn't end up 
in my patch queue but the rest did.  Luckily enough made it through that 
it didn't get lost, and lore's pretty great so this sort of thing isn't 
that big of a deal these days.  That said, email is a bit of a black box 
so figured I'd give you a heads up.

>
> Thanks,
> Conor.
>>
>> Changes from v6:
>> - Dropped i2c patch, as its in i2c-next
>> - Added ack on gpio, reviewed-by on rtc
>> - Dropped child nodes from sysctrl binding entirely, added a link to
>>    the online documenation for the services the system controller can
>>    provide
>> - Dropped the #pwm-cells and replaced with a ref, a la Krzysztof's
>>    series
>>
>> Changes from v5:
>> - reworded the descriptions in the pwm binding to (hopefully) add
>>    clarity
>> - added -mask to the custom properties and made them 32 bit
>> - renamed the i2c binding to corei2c, since it is not mpfs specific
>> - removed the child nodes of the system controller in example/dts &
>>    will create them in the driver.
>>    @Rob, I assume keeping them documented is the correct thing to do?
>> - removed the dependancy on the clock binding from the examples
>> - reformatted rtc interrupts as per Rob's suggestion
>>
>> Changes from v4:
>> - dont include icicle_kit_defconfig, accidentally added in v3
>> - drop prescaler from mpfs-rtc & calculate the value instead
>> - use corei2c as a fallback device for mpfs-i2c
>> - drop spi dt-binding (on spi-next)
>>    commit 2da187304e556ac59cf2dacb323cc78ded988169
>> - drop usb dt-binding (on usb-next)
>>
>> Changes from v3:
>> - drop "mailbox: change mailbox-mpfs compatible string", already upstream:
>>    commit f10b1fc0161cd99e ("mailbox: change mailbox-mpfs compatible string")
>> - fix copy paste error in microchip,mpfs-mailbox dt-binding
>> - remove whitespace in syscontroller dt entry
>>
>> Changes from v2:
>> - dropped plic int header & corresponding defines in dts{,i}
>> - use $ref to drmode in mpfs-musb binding
>> - split changes to dts{,i} again: functional changes to existing
>>    elements now are in a new patch
>> - drop num-cs property in mpfs-spi binding
>> - dont make the system controller a simple-mfd
>> - move the separate bindings for rng/generic system services into the
>>    system controller binding
>> - added an instance corei2c as i2c2 in the fabric dtsi
>> - add version numbering to corepwm and corei2c compat string (-rtl-vN)
>>
>> Conor Dooley (11):
>>    dt-bindings: soc/microchip: update syscontroller compatibles
>>    dt-bindings: soc/microchip: add info about services to mpfs sysctrl
>>    dt-bindings: rtc: add bindings for microchip mpfs rtc
>>    dt-bindings: gpio: add bindings for microchip mpfs gpio
>>    dt-bindings: pwm: add microchip corepwm binding
>>    riscv: dts: microchip: use clk defines for icicle kit
>>    riscv: dts: microchip: add fpga fabric section to icicle kit
>>    riscv: dts: microchip: refactor icicle kit device tree
>>    riscv: dts: microchip: update peripherals in icicle kit device tree
>>    riscv: dts: microchip: add new peripherals to icicle kit device tree
>>    MAINTAINERS: update riscv/microchip entry
>>
>>   .../bindings/gpio/microchip,mpfs-gpio.yaml    |  79 ++++++
>>   ...ilbox.yaml => microchip,mpfs-mailbox.yaml} |   6 +-
>>   .../bindings/pwm/microchip,corepwm.yaml       |  81 ++++++
>>   .../bindings/rtc/microchip,mfps-rtc.yaml      |  58 ++++
>>   .../microchip,mpfs-sys-controller.yaml        |  40 +++
>>   ...icrochip,polarfire-soc-sys-controller.yaml |  35 ---
>>   MAINTAINERS                                   |   2 +
>>   .../dts/microchip/microchip-mpfs-fabric.dtsi  |  25 ++
>>   .../microchip/microchip-mpfs-icicle-kit.dts   | 115 ++++++--
>>   .../boot/dts/microchip/microchip-mpfs.dtsi    | 254 ++++++++++++++----
>>   10 files changed, 591 insertions(+), 104 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
>>   rename Documentation/devicetree/bindings/mailbox/{microchip,polarfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} (82%)
>>   create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
>>   create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
>>   create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
>>   create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
