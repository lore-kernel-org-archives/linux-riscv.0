Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB361C4708E
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 16:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SkmXwaQWu84GHs/bMaPWhd0XJmGLaL4OctF5ZVkal2g=; b=JibA1jh4Z8GUzJ
	Dgj7SHYAR+IUGDVWtyCk7MK5wsHV3fvw1fZsSGD9ZrX/aM83RMGrDzS45VZ1BBhLVy1R+AHl5o3Dq
	+jA9GPbENkrV5/IW6HUs6NsnGQt+6slB3f0egBCM1wnG0pXebp+RC3oNV3u7/ogfHEWCk6M80Jjde
	uctAzcxuMroAc6sDq9DjHgrNIUBp0QNkZEqQxbDpQ7Ns44FFftyBn1pAqYuEBUZylMb0umWdr7wpu
	TEWLNXwa0NjD0qPNxPPw5SeRvfDosZDPH2yREOcBoLVFJq7iSXkSjpdo/XHhv0K7ZmNwJMOGL72kr
	jMLzTJgbPYSY3y30125Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNGQ-00Ca7S-U2; Mon, 02 Jan 2023 16:02:14 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNEU-00CZiF-1T
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 16:00:16 +0000
Received: by mail-ej1-x634.google.com with SMTP id kw15so67336479ejc.10
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jan 2023 08:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QdGO/Cj1/ubTCIoWpQ1S17UZ9pxZ4OvM4+Xa6YgQiKA=;
        b=PzS1VDjsgwqEFFBxDnR4rAJhgt6ILaS1/BVhKMvhwbL/KbZqWLE/l+GqAzUq9z1MSB
         ip+m7PvwO0uPL2HCaEFZkI56EU+PlILA7jM17YwIcS4b1GWyoFDn9xrELjYoh3z9Pz73
         iprMd1cKooSGQ4XnShExYuUrtsix+0IZhz8i+Pd9tipprU3jJ1sZN41AjTsJB/7XYHEn
         mAtldrkozc+3z4EWoRAO0h1OV9IQ4uoobHRgRE7VxMumBnCDw1rW66/P7rRltVZHCuak
         y+RRK4+di0lVdxsuxFACUACFXwa0kskdwOGWjDva0Pqhlt3MJuQ8USFXBTTptK4+BTOX
         3IUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdGO/Cj1/ubTCIoWpQ1S17UZ9pxZ4OvM4+Xa6YgQiKA=;
        b=WD01rpitPpysyHaLXfzGi/7cbCacFza+ldYm9/Z3WWu9LsP0lubXJzwbrHq4pFDVuM
         yI7ZgUHWvVKZW1uXyckvwRroHpt41Hrm2g+1fFUV1g9svY9YB0LzXvE954+QBhoZhSDG
         WzUBGeMFKhZMJILggXmXKTiUGfIv0Jsh0vY4E3hKDEgjT330MSEKVPACPmWX2tZOUawv
         ZXr1Ihb8VStPjLeBwv3GXsgajJpdLxZIpVDxerV/Ya7SqraPZO/p3kdM2BMdp/bsy5JO
         Tx14iedw8fffbBrIeV2zZcUIbDsmjEHj1YCK/wJTtjgYKcrLNaLJDMb21NU+QBin4j8m
         skTQ==
X-Gm-Message-State: AFqh2koI1O/X+vvBcgp0H6G0wT/r/KNA659PV7KnLshFuEhDFHM9em9S
	5o8xbft2m7/k2avtQ/FglmwYyVlZ3FFEaTgI1GmaAg==
X-Google-Smtp-Source: AMrXdXs/VZbo17ZwC4OQSrc7NldaTAtNJO2KsXVEHRQyJnMVyMmMgaXn+sI/CGaUaRj3me6hgBfuqsoiNCGsM2hwXFw=
X-Received: by 2002:a17:906:3385:b0:7b2:7af0:c231 with SMTP id
 v5-20020a170906338500b007b27af0c231mr2689886eja.240.1672675211538; Mon, 02
 Jan 2023 08:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-5-apatel@ventanamicro.com> <9be58cb4-4ee8-a6e0-7a0a-f2f581e394d3@linaro.org>
 <CAK9=C2X55CG6tjjiTPrecnnZZiwTOS1BSH3UTPa-fLBm38WdLA@mail.gmail.com> <20221116191436.GA576695-robh@kernel.org>
In-Reply-To: <20221116191436.GA576695-robh@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 Jan 2023 21:29:59 +0530
Message-ID: <CAAhSdy02xHvwbv53rH+mdp1=0V-i5EgDjEUY0Tr=4nzg8fK3sQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] dt-bindings: Add RISC-V incoming MSI controller bindings
To: Rob Herring <robh@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Atish Patra <atishp@atishpatra.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_080014_346102_9597F605 
X-CRM114-Status: GOOD (  35.21  )
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

On Thu, Nov 17, 2022 at 12:44 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Nov 14, 2022 at 05:36:06PM +0530, Anup Patel wrote:
> > On Mon, Nov 14, 2022 at 3:19 PM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > >
> > > On 11/11/2022 05:42, Anup Patel wrote:
> > > > We add DT bindings document for RISC-V incoming MSI controller (IMSIC)
> > > > defined by the RISC-V advanced interrupt architecture (AIA) specification.
> > > >
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > ---
> > > >  .../interrupt-controller/riscv,imsic.yaml     | 174 ++++++++++++++++++
> > > >  1 file changed, 174 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
> > > > new file mode 100644
> > > > index 000000000000..05106eb1955e
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
> > > > @@ -0,0 +1,174 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/interrupt-controller/riscv,imsic.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: RISC-V Incoming MSI Controller (IMSIC)
> > > > +
> > > > +maintainers:
> > > > +  - Anup Patel <anup@brainfault.org>
> > > > +
> > > > +description:
> > > > +  The RISC-V advanced interrupt architecture (AIA) defines a per-CPU incoming
> > > > +  MSI controller (IMSIC) for handling MSIs in a RISC-V platform. The RISC-V
> > > > +  AIA specification can be found at https://github.com/riscv/riscv-aia.
> > > > +
> > > > +  The IMSIC is a per-CPU (or per-HART) device with separate interrupt file
> > > > +  for each privilege level (machine or supervisor). The configuration of
> > > > +  a IMSIC interrupt file is done using AIA CSRs and it also has a 4KB MMIO
> > > > +  space to receive MSIs from devices. Each IMSIC interrupt file supports a
> > > > +  fixed number of interrupt identities (to distinguish MSIs from devices)
> > > > +  which is same for given privilege level across CPUs (or HARTs).
> > > > +
> > > > +  The arrangement of IMSIC interrupt files in MMIO space of a RISC-V platform
> > > > +  follows a particular scheme defined by the RISC-V AIA specification. A IMSIC
> > > > +  group is a set of IMSIC interrupt files co-located in MMIO space and we can
> > > > +  have multiple IMSIC groups (i.e. clusters, sockets, chiplets, etc) in a
> > > > +  RISC-V platform. The MSI target address of a IMSIC interrupt file at given
> > > > +  privilege level (machine or supervisor) encodes group index, HART index,
> > > > +  and guest index (shown below).
> > > > +
> > > > +  XLEN-1           >=24                                 12    0
> > > > +  |                  |                                  |     |
> > > > +  -------------------------------------------------------------
> > > > +  |xxxxxx|Group Index|xxxxxxxxxxx|HART Index|Guest Index|  0  |
> > > > +  -------------------------------------------------------------
> > > > +
> > > > +  The device tree of a RISC-V platform will have one IMSIC device tree node
> > > > +  for each privilege level (machine or supervisor) which collectively describe
> > > > +  IMSIC interrupt files at that privilege level across CPUs (or HARTs).
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/interrupt-controller.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - enum:
> > > > +          - vendor,chip-imsics
> > >
> > > There is no such vendor... As Conor pointed out, this does not look
> > > correct. Compatibles must be real and specific.
> >
> > Previously, Rob had suggest to:
> > 1) Mandate two compatible strings: one for implementation and
> >     and second for specification
> > 2) Since this is new specification with QEMU being the only
> >     implementation, we add "vendor,chip-imsics" as dummy
> >     implementation specific string for DT schema checkers
> >     to pass the examples. Once we have an actual implementation,
> >    we will replace this dummy string.
>
> What will QEMU's DT use? That's an implementation we can and do run
> validation on. Your choices are define a QEMU specific compatible string
> or allow the fallback alone. I'm fine either way. With the latter,
> someone has to review that the fallback is not used alone in .dts files
> while doing the former allows the tools to check for you. It also
> encourages making every new difference a property rather than implied by
> compatible, but those should be caught in review.
>
> If you go with the fallback only, just make it clear that it's for QEMU
> or s/w models only.

Sure, I will add  "riscv,qemu-imsics" as QEMU specific compatible string.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
