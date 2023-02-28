Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2F0C64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 17:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nataUdD565E9pKQqZVTOmAgzVO8kGxcx868BfG/Gqb4=; b=vZXQ8TkIZKdc/D
	G9a/tUiiLLE+J5j4n67gp8/Jum3701mfB2wNjbMbRbq302Xd4FLmSU4LhoVxFMBx/bWMh61USJGGr
	4FxpJ6Lm/7UOvf3qRJ+YQu25ielgNtDAL2n7GL6q6eia3uTtKw41Yn6GXo5Qtp2659p/wKdQucTo8
	cmNbFiUFM+FCIp/C8Ai2KClx8DPGnLuC0kkkmS8iJm6d0hYkauywuqzx+kgixsb4THoVIt3/nNzwF
	Vyz09qF133f/dqnrZbViayYPLIw1aCPJM2xpatDdPYoqfxyFZuSC8FaUbZCXL5y9AdFpJtz3qe/JQ
	28so+C1O+j/K0905QpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX3pn-00Dsq3-Up; Tue, 28 Feb 2023 17:32:16 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX3pk-00Dsou-P6
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 17:32:15 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 90A313F212
	for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 17:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1677605523;
	bh=JFnTwWesuP+6/jfIdHg+eoaheKqjKyvzVA2hbRKkEWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=JHUTLnA8a0rD+a+E7w1nF/h//v9ipdQysHnXincR+6SVaX1MMppwqsjnmrA3HfF1Q
	 onoWN4jiRPAjL/YmawmvGmrpwctxiJpxHgXB6MVdSZus8cJn9hiSwxHIXcZfY4HBYO
	 ebotSjC1TTSp8JxwMswRbsri3qC04mgnSH8YOVp2decyhhpE1UDSoPcXM/EbDWXjbu
	 /tP9/HH/cotRd4P2lKq9euhVSDNEm/GllYtOc4sOO2PAIanC3zxRBDM/3iM1iys6GL
	 AArD5uPv16OpA6xytgHQrx+hFt1y07nYlGF0xAyWdf4iv4WwPHyywrKAt3TIzX8lDD
	 mUZPODUdKjrXQ==
Received: by mail-qt1-f197.google.com with SMTP id w16-20020ac843d0000000b003bfe50a4105so2028919qtn.10
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 09:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFnTwWesuP+6/jfIdHg+eoaheKqjKyvzVA2hbRKkEWA=;
        b=LuY4ImXzyKb6i5J4nZHERH3Vw+GIRZb4KJHJop5sYk9rL48h6j+jGuKpzATVRh45P9
         cgygKl7ZtPwV3D/khGuoB9gXfzdpioszwsUHdpZt+xvOAkOV+4RMmt2w757M1cmVM82Q
         Jy9kbt06lq/b2yebqmUj1sX9lmyNHSRPhe3/RwagT4Cwf6Fi8mGLJyw5+iRgrAVRFHvO
         8RPa96Nrgae3jGBmCeoIa+zkT/0KQDjhqAe2nNAKnyKk05swCWatGEXfXHbH4GcgfUxR
         w06TyXzP2gwOUHJaV5CV6h+GvDOJ8ZnQODH4mqVnPq/N/2eOoab8BHNUBW/Fhh8gGSm7
         5q5g==
X-Gm-Message-State: AO0yUKUuca9yQcRDM4r76zos6Mv17XJ2aJPknrONMyfxHkyWNudaFXYk
	Pxv/YmSTS3N5taiHj56RLjxvuur4rg9d59icALPl4VddYFQAbIzhDkpACH6iA36aYEk72OiUHo+
	IrFgQhR2WU/h7d8+9YgY3bwNB3ZdbINe5LecIGE3aKn89ncYeZX2Wxz3Fqj0B/Q==
X-Received: by 2002:a05:6214:4a4d:b0:571:1409:5ee1 with SMTP id ph13-20020a0562144a4d00b0057114095ee1mr1012576qvb.0.1677605522543;
        Tue, 28 Feb 2023 09:32:02 -0800 (PST)
X-Google-Smtp-Source: AK7set9t/TkmnqfqOwJJveS07Su1pSm1G5Dd3UI8Jt8Yy93BTw9Pdg4PTV8e7Rr83zYdh2FnCK7NZUIMOb2IChn3os8=
X-Received: by 2002:a05:6214:4a4d:b0:571:1409:5ee1 with SMTP id
 ph13-20020a0562144a4d00b0057114095ee1mr1012568qvb.0.1677605522237; Tue, 28
 Feb 2023 09:32:02 -0800 (PST)
MIME-Version: 1.0
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-5-william.qiu@starfivetech.com> <20230220234335.GA615198-robh@kernel.org>
 <348796cc-72d9-4dcf-9f09-4c2aa55cb858@starfivetech.com> <20230227222904.GC1048218-robh@kernel.org>
 <f8d2b665-ce5d-81f8-8c55-81f1a4cb62b9@starfivetech.com> <54f51fa0-7821-b67b-b782-eb9a35b7bba9@linaro.org>
 <CAJM55Z85fitjBOcCLqad9W-a7h3iN9bxtctVGzPgqCbf5fWobw@mail.gmail.com>
 <a0168d89-3c30-55e1-cf4c-37f7fe90aae4@linaro.org> <CAJM55Z8dR4TDJNeO-qiS9CurfCWM1ccNigOA1fDb7S1VKCxv2Q@mail.gmail.com>
 <be911895-4944-e983-1af5-b11ff5e8e7cc@linaro.org>
In-Reply-To: <be911895-4944-e983-1af5-b11ff5e8e7cc@linaro.org>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 28 Feb 2023 18:31:46 +0100
Message-ID: <CAJM55Z99FZteGkzFC-cSCrTKD_qBn8huzcnynM9Xd7-4F_9rGQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] dt-bindings: syscon: Add StarFive syscon doc
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: William Qiu <william.qiu@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_093213_000746_8B455A70 
X-CRM114-Status: GOOD (  49.49  )
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

On Tue, 28 Feb 2023 at 17:59, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 28/02/2023 15:59, Emil Renner Berthing wrote:
> > On Tue, 28 Feb 2023 at 12:28, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> On 28/02/2023 12:02, Emil Renner Berthing wrote:
> >>> On Tue, 28 Feb 2023 at 11:40, Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 28/02/2023 10:05, William Qiu wrote:
> >>>>>
> >>>>>
> >>>>> On 2023/2/28 6:29, Rob Herring wrote:
> >>>>>> On Tue, Feb 21, 2023 at 10:44:02AM +0800, William Qiu wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>> On 2023/2/21 7:43, Rob Herring wrote:
> >>>>>>>> On Wed, Feb 15, 2023 at 07:32:49PM +0800, William Qiu wrote:
> >>>>>>>>> Add documentation to describe StarFive System Controller Registers.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> >>>>>>>>> ---
> >>>>>>>>>  .../bindings/soc/starfive/jh7110-syscon.yaml  | 51 +++++++++++++++++++
> >>>>>>>>>  MAINTAINERS                                   |  5 ++
> >>>>>>>>>  2 files changed, 56 insertions(+)
> >>>>>>>>>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
> >>>>>>>>>
> >>>>>>>>> diff --git a/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
> >>>>>>>>> new file mode 100644
> >>>>>>>>> index 000000000000..fa4d8522a454
> >>>>>>>>> --- /dev/null
> >>>>>>>>> +++ b/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
> >>>>>>>>> @@ -0,0 +1,51 @@
> >>>>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>>>>>>>> +%YAML 1.2
> >>>>>>>>> +---
> >>>>>>>>> +$id: http://devicetree.org/schemas/soc/starfive/jh7110-syscon.yaml#
> >>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>>>>>> +
> >>>>>>>>> +title: StarFive JH7110 SoC system controller
> >>>>>>>>> +
> >>>>>>>>> +maintainers:
> >>>>>>>>> +  - William Qiu <william.qiu@starfivetech.com>
> >>>>>>>>> +
> >>>>>>>>> +description: |
> >>>>>>>>> +  The StarFive JH7110 SoC system controller provides register information such
> >>>>>>>>> +  as offset, mask and shift to configure related modules such as MMC and PCIe.
> >>>>>>>>> +
> >>>>>>>>> +properties:
> >>>>>>>>> +  compatible:
> >>>>>>>>> +    items:
> >>>>>>>>> +      - enum:
> >>>>>>>>> +          - starfive,jh7110-stg-syscon
> >>>>>>>>> +          - starfive,jh7110-sys-syscon
> >>>>>>>>> +          - starfive,jh7110-aon-syscon
> >>>>>>>>
> >>>>>>>> Is 'syscon' really part of what the blocks are called? Is just 'stg',
> >>>>>>>> 'sys' and 'aon' not unique enough?
> >>>>>>>>
> >>>>>>>> Rob
> >>>>>>> Hi Rob,
> >>>>>>>
> >>>>>>> In StarFive SoC, we do have syscrg/aoncrg/stgcrg, which is uesd to be the clock
> >>>>>>> controller, so 'syscon' is added to avoid confusion.
> >>>>>>
> >>>>>> You've only added to my confusion. 'syscrg' and 'sys-syscon' are 2
> >>>>>> different h/w blocks and unrelated to each other? Or 'syscrg' is the
> >>>>>> clock portion of 'sys-syscon'? In that case, 'syscrg' should be a child
> >>>>>> of 'sys-syscon' or possibly just all one node. Please provide details on
> >>>>>> the entire h/w block so we can provide better input on the bindings.
> >>>>>>
> >>>>>> Rob
> >>>>>
> >>>>> Hi Rob,
> >>>>>
> >>>>> It's my description that's problematic.'syscon' here refers to the hardware module
> >>>>> inside our JH7110, which is different from the syscon interface in linux. The syscon
> >>>>> I added now uses the syscon interface of linux to read and write the syscon register
> >>>>> in our JH7110. So we decided to name it that way.
> >>>>
> >>>> You didn't really answer Rob's questions.
> >>>>
> >>>> Also, syscon is Linux term, so are you sure hardware module is called
> >>>> like this? Hardware engineers took pure Linux name and used it?
> >>>
> >>> Yes, from the documentation I could find[1] there are CRG blocks
> >>> (Clock and Reset Generator) and SYSCON blocks:
> >>> SYS CRG
> >>> STG CRG
> >>> AON CRG
> >>> SYS SYSCON
> >>> STG SYSCON
> >>> AON SYSCON
> >>>
> >>> The CRG blocks contain registers to control clocks and resets that
> >>> follow a pattern used by the clock and reset drivers. The SYSCON
> >>> blocks just seem to contain registers to control whatever didn't fit
> >>> in any other blocks, but might be vaguely related to the peripherals
> >>> that run off clocks controlled by the corresponding CRG block.
> >>
> >> The memory map [1] suggests these are indeed separate address spaces,
> >> e.g. AON CRG, AON SYSCON and AON GPIO, but now I would argue that this
> >> might be still one device - AON (or STG, SYS). Just like PCIE0 has four
> >> address spaces, it does not mean you have four separate PCIE0 devices.
> >> You have only one PCIE0, just like you have only one AON, one STG and
> >> one SYS (System).
> >
> > I see what you mean, but if you look into what the registers in the
> > SYSCON blocks actually do it's not clear to me that they should be
> > grouped with the clocks/resets any more than say the pinctrl/GPIO
> > node. Maybe it's my fault for not giving you the full picture. Eg. for
> > "system" and "always-on" there are blocks:
> >
> > SYS CRG
> > SYS SYSCON
> > SYS IOMUX
> > AON CRG
> > AON SYSCON
> > AON IOMUX
> >
> > ..and it really don't see why eg. SYS CRG and SYS SYSCON should be
> > thought of as one device, but not include SYS IOMUX then.
>
> ... include sys iomux as well, just like GPIO is included for AON.

This would at least take the view that the blocks named alike should
be thought of as a single device to its logical conclusion.
Unfortunately we're a bit late for that. The pinctrl/GPiO bindings and
drivers are already merged:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d6e0a660097dcdb80e7c5c859eb12f776060b02e

> >
> > As an examly the SYS SYSCON includes registers to control:
> > - remapping of different peripherals from SD controller to video encoders
> > - voltage select for certain GPIO pins
> > - phy interface selection for ethernet and CAN
> > - QuadSPI delay chain and SRAM configuration
> > - PLL configuration
> > - endian selection for the SD controller
> >
> > To me this is pretty much exactly described by the syscon device tree binding:
> > "System controller node represents a register region containing a set
> > of miscellaneous registers. The registers are not cohesive enough to
> > represent as any specific type of device. [..]"
> > In any case it's clear that however the SYSCON blocks are represented
> > in the device tree, a driver for it would need to export registers in
> > the SYSCON block for other drivers to use.
>
> You started entire sentence with "but" so you disagree but with what
> exactly? The naming? But syscon is fine - hardware manual calls it like
> that.
>
> The point was that AON is one device (consisting of multiple blocks).

Yes, and what I'm trying to explain is that I'm not convinced that's
the right model. The CRG blocks and IOMUX blocks don't really have
anything in common other than the name StarFive gave them. You can
argue that the CRG and IOMUX blocks overlap with the corresponding
SYSCON block, but so do a lot of other peripherals as you can see from
the list above.

I think the IOMUX and SYSCON blocks are just named after the clock
domain they're under, but a lot of other peripherals are also under
the SYS and AON clock domains and we don't model them as one big
device.

/Emil

>
> Best regards,
> Krzysztof
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
