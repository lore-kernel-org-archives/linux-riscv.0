Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30E7C46CCD
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Dec 2023 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OuVNHs18Mji94CHlfbOVmKKyAj/pSdIPKu9dI3kUiYA=; b=0LyFs+2Y7Wlc/tMhW8p50NZUaQ
	DgH53L70GEDJHUAyG1YgZebXZ9xLeTSruJH1J3kSwZ3heuOQAF82TG6L1WLfxLj0j8HNDYtNx/pU7
	T9Fm+9oruXX7LXWs7GSCcOOPtriiPIMEaQWBEpbCW2pOybrbrzcJpF3KkedEp0MXq27HHOiy/vKK2
	3/29JY9AbeKu3JFalA9HicKwNbV0jlmQ+9binePXIBKwHHpMvTikS3abQS1oOHoZz6DvHl8oVYEgn
	qtNPv9Mb7hopJVRQKhGB15wHgR57Y1XewioJY6wyGipZAUiXWj75KeKy8ee/WIsOg1l1jKl2YXBiG
	vEj2UBIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEVB5-006A5H-1v;
	Sat, 16 Dec 2023 13:58:03 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEVB1-006A44-28
	for linux-riscv@lists.infradead.org;
	Sat, 16 Dec 2023 13:58:02 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8E58E3F2C6
	for <linux-riscv@lists.infradead.org>; Sat, 16 Dec 2023 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702735076;
	bh=1IDqTgxXQymbTimq5NcK1mhvY0gI9NehYSyLAkXJSA4=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=s7136yApbUMQIVm5zgZmdOTlzWyCrnNdkOAFsY5rmrEctRk7Ji4EE+b+lh4dxJQ/4
	 EstfAwxqgzdF2QW+9uEwprda72J2+s+1W6Nbf+S1kCyGBkLWJO+XoKyrItVAvovK1B
	 m50AEF8cKQQqrgq8EC0iK20eM2p2ze8CPvGEqDVsDqsoOCKdgSZw6pIKdL5CCku5SG
	 tvJFQ4BnSvWF7FEP9924+je/593NZk8l332anB4kl9UfawKcPSPFgJ3kmPt0FLnVUG
	 DC8HbVPDMsUywzD6Db9qxcIVceb+BotGpU6YJLyr0PA1PUHjmPuwUgYlCuZuX7Kj4Z
	 I/AR8E7IRiiSw==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-425a62f0997so26113851cf.0
        for <linux-riscv@lists.infradead.org>; Sat, 16 Dec 2023 05:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702735075; x=1703339875;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1IDqTgxXQymbTimq5NcK1mhvY0gI9NehYSyLAkXJSA4=;
        b=ODGbfMGl8LLD7qy6/fHUMXplTc59j5mIn9wSBcwC+ejHilo2CxaOA2r0M+87Adtd7+
         wgYL5dKKfDUy1zdkImWX5LdatwyOFtB+UQDfs2D2LIBj9oQj/5RW8fHSHAki8YhUoQan
         F/qlJOQbCLxCuFtQfk9eTl44BPF3B6IZp4+GJ378WT1UrRm5byNxX/scANmM1HAUUvrs
         G2X9/JRpOrQJITduRq0f15/ISbdyYZRl4O1iupoRHziazX8goY712E+y/2IGecJCMIki
         lVPTaz7bxvdP/8jeBU+fZGZn5J+dwV2upvJbrBXM2aaH6ipB7uA01tGNiGWb4H9gzeIn
         mXqg==
X-Gm-Message-State: AOJu0YxB6BPijGzZrzJsIBhTy4s0nlOoZkc7wf9EHUcrFClLB7IJB9VJ
	UNmv949QbdOW344YZ5osW6K7lIoAezVXZk1zzbIDz9qxFdf7VBmHq/OKjVQDTpQeljOPvEdEzAI
	la9EVyfu3300nfTOLjD1cfZBYdg3R+6Mr860HnUBN/IPzBE01H1UJu/VPpNmyRA==
X-Received: by 2002:ac8:5d8d:0:b0:425:72f3:efc2 with SMTP id d13-20020ac85d8d000000b0042572f3efc2mr17906423qtx.23.1702735075343;
        Sat, 16 Dec 2023 05:57:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2z15djvfq92lfCW5SVLTfQogWiKIQlYCWLwzNRZaqcornDI7KUR95VQS0vrC8KmFSlGJ+d0WEqwEbw0+MxUQ=
X-Received: by 2002:ac8:5d8d:0:b0:425:72f3:efc2 with SMTP id
 d13-20020ac85d8d000000b0042572f3efc2mr17906407qtx.23.1702735074956; Sat, 16
 Dec 2023 05:57:54 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 16 Dec 2023 05:57:54 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231215202137.GA317624-robh@kernel.org>
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
 <20231215143906.3651122-2-emil.renner.berthing@canonical.com> <20231215202137.GA317624-robh@kernel.org>
Mime-Version: 1.0
Date: Sat, 16 Dec 2023 05:57:54 -0800
Message-ID: <CAJM55Z9pBpYfwpxPH7bUumuosVDn9DHLSBngW6CtG7aK_z+_bQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
To: Rob Herring <robh@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_055800_061207_84254C94 
X-CRM114-Status: GOOD (  35.10  )
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

Rob Herring wrote:
> On Fri, Dec 15, 2023 at 03:38:59PM +0100, Emil Renner Berthing wrote:
> > Add bindings for the pin controllers on the T-Head TH1520 RISC-V SoC.
> >
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > ---
> >  .../pinctrl/thead,th1520-pinctrl.yaml         | 156 ++++++++++++++++++
> >  1 file changed, 156 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..1b1b446cd498
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > @@ -0,0 +1,156 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: T-Head TH1520 SoC pin controller
> > +
> > +maintainers:
> > +  - Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > +
> > +description: |
> > +  Pinmux and pinconf controller in the T-Head TH1520 RISC-V SoC.
> > +
> > +  The TH1520 has 3 groups of pads each controlled from different memory ranges.
> > +  Confusingly the memory ranges are named
> > +    PADCTRL_AOSYS  -> PAD Group 1
> > +    PADCTRL1_APSYS -> PAD Group 2
> > +    PADCTRL0_APSYS -> PAD Group 3
>
> Are the programming models different?

Yes, they control different pads and different number of pads. Pad group 1 also
has some special pins that have bespoke pinconf, no pinconf and/or no
pinmux and a
"gap" in the registers. Also if some day we'll need to set up pinmux
on behald of the
audio co-processor then pad group 1 will be even more special.

> > +
> > +  Each pad can be muxed individually to up to 5 different functions. For most
> > +  pads only a few of those 5 configurations are valid though, and a few pads in
> > +  group 1 does not support muxing at all.
> > +
> > +  Pinconf is fairly regular except for a few pads in group 1 that either can't
> > +  be configured or has some special functions. The rest have configurable drive
> > +  strength, input enable, schmitt trigger, slew rate, pull-up and pull-down in
> > +  addition to a special strong pull up.
> > +
> > +  Certain pads in group 1 can be muxed to AUDIO_PA0 - AUDIO_PA30 functions and
> > +  are then meant to be used by the audio co-processor. Each such pad can then
> > +  be further muxed to either audio GPIO or one of 4 functions such as UART, I2C
> > +  and I2S. If the audio pad is muxed to one of the 4 functions then pinconf is
> > +  also configured in different registers. All of this is done from a different
> > +  AUDIO_IOCTRL memory range and is left to the audio co-processor for now.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - thead,th1520-group1-pinctrl
> > +      - thead,th1520-group2-pinctrl
> > +      - thead,th1520-group3-pinctrl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  '-[0-9]+$':
>
> Please make this a bit more specific. "-grp-[0-9]+$"?

Oh, I was just trying to copy what other drivers did, but I see now that eg.
mediatek,mt6779-pinctrl is not in the majority. Unfortunately "group" already
has 2 meanings in this context. One are the pad groups from the datasheet
described above and then there are the mux groups in the pinctrl framework,
which in this case just contains a single pin since each pin can be muxed
individually. Can we come up with a better name or should we just add this 3rd
type of group?

> > +    patternProperties:
> > +      '-pins$':
> > +        type: object
> > +        $ref: /schemas/pinctrl/pincfg-node.yaml
> > +        description:
> > +          A pinctrl node should contain at least one subnode describing one
> > +          or more pads and their associated pinmux and pinconf settings.
> > +
> > +        properties:
> > +          pins:
> > +            $ref: /schemas/types.yaml#/definitions/string-array
>
> Type is defined in pinmux-node.yaml. You need to reference it and drop
> this.
>
> Normally the possible values are listed out.

This seems to work for me:

allOf:
  - if:
      properties:
        compatible:
          const: thead,th1520-group1-pinctrl
    then:
      patternProperties:
        '-[0-9]+$':
          patternProperties:
            '-pins$':
              properties:
                pins:
                  items:
                    enum:
                      - OSC_CLK_IN
                      - OSC_CLK_OUT
		      ...
  - if:
      properties:
        compatible:
          const: thead,th1520-group2-pinctrl
    then:
      patternProperties:
        '-[0-9]+$':
          patternProperties:
            '-pins$':
              properties:
                pins:
                  items:
                    enum:
                      - QSPI1_SCLK
                      - QSPI1_CSN0
		      ...
  ...

Would that be the way to go about it?

> > +            description: List of pads that properties in the node apply to.
> > +
> > +          function:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            enum: [ "0", "1", "2", "3", "4", "5" ]
> > +            description: The mux function to select for the given pins.
> > +
> > +          bias-disable: true
> > +
> > +          bias-pull-up:
> > +            type: boolean
> > +
> > +          bias-pull-down:
> > +            type: boolean
> > +
> > +          drive-strength:
> > +            enum: [ 1, 2, 3, 5, 7, 8, 10, 12, 13, 15, 16, 18, 20, 21, 23, 25 ]
> > +
> > +          input-enable: true
> > +
> > +          input-disable: true
> > +
> > +          input-schmitt-enable: true
> > +
> > +          input-schmitt-disable: true
> > +
> > +          slew-rate:
> > +            maximum: 1
> > +
> > +          thead,strong-pull-up:
> > +            oneOf:
> > +              - type: boolean
> > +              - $ref: /schemas/types.yaml#/definitions/uint32
> > +                enum: [ 0, 2100 ]
> > +            description: Enable or disable strong 2.1kOhm pull-up.
>
> bias-pull-up can already specify the strength in Ohms.

The strong pull up is a separate bit that can be enabled independently from the
regular pull-up/down, so in theory you could enable both the regular pull-up
and the strong pull-up at the same time, or even the regular poll-down and the
strong pull-up which is probably not advised.
So the idea here was just to make sure that you can do eg.

	thead,strong-pull-up = <0>;

to make sure the bit is cleared.

Thanks!
/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
