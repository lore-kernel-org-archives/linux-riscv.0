Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40592C001B2
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 19:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eDoG8WMMqkYetU78Mwt05+qZOLBVFjpkCY0kZaeO11k=; b=ZblUi805Dl1+P1
	OtQJuMMy8iMPoTWsbjp/ZZf0N7mlKRDeYraRctuNMX/szEHcogyU+hb3KrgSvNXZWU0Ro5Ts+GVCk
	iTT5YUtZdzjT4R0wDMyCgdShVEoo4GJOCsKdvgx1ZfK0TozoTXvAd8Y49FRGCFmIK7uPr6hsY+gzv
	+stEo5GG5WuKTQIyvr9esIN9SXeKsQKhuWvQEj4Mn8oRBqw+3enroyaSKI5jy5RX/8zhP+0ErAkDY
	wQ69vp9LpFh0M/tpSgfUUtdXfnRo8+G7PAUrug2U6lTg1SQWc11IqUFbxZFAyyUM5EeviSKsqxj0b
	uB5rMF2FbZBfqPaSUo1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8RfQ-00GGOJ-9M; Thu, 22 Dec 2022 19:55:48 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8RfJ-00GGIu-PV
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 19:55:44 +0000
Received: by mail-pj1-x102c.google.com with SMTP id k88-20020a17090a4ce100b00219d0b857bcso2945704pjh.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 11:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qENgK5bMvxidfmAY/CbHWGvtCRrxRzra8Ekw+yNOLus=;
        b=hQ8lX61uJO7AZn8IOJCsnlmGTG9MYx5KJKbShwl4MqZkwr0n017fsTkynykRWRh7xT
         KwbzEHh0hdoHrJKIjGUK9dyqdn3OGd0x+yjJJdU1nnB/h8zah7RKyfWVQbGVDX8bSTGB
         rPOhWVuXaIJxc29S7Tjsj48SawemSzhyBfoFeElw0sR7Nt+VEVR7RKr9DX5WRh+NdW66
         SN/wSiTWdVqfi/XwF1E8UJWhsGYSqrj82Na4yTS8ELa9cJSEB4E9M1uZQgp6dHdENlGu
         ZsLudF+kmh4bFCL5ZFqzClgHwLW7tZpBDyN43VrI/zcLR0xrQu/Ls7TCicCxzLecPjch
         jDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qENgK5bMvxidfmAY/CbHWGvtCRrxRzra8Ekw+yNOLus=;
        b=RLmiZFZy5OyUcw2Z0pW1xcLI+rBo0q95cr92Vo5remdtHadgT1qoM28W8kI5iGskxA
         QvScSJopW6DDVgBIgGRzCoeCgWnXbdocf2daGAmmcUVR9nDe7P/BOFYq+yC4M8g1BNGt
         PRV7MHDfUjkq6BZG7fnZVMvZMJyTb0SbGCHLbO5urXKB+f8/Vr3YC2XSEZ66q5YxuKSa
         IwUxJ0HLx4rzXom6sAh4j6zsYpNiisxPAIdBNZ44OX76HiaF/MBi3IrENpdJ8iWTIq6Z
         BhJ6FX/Xfy+s0hGXnP0q0R0EDmJME9V/jkklNVKos43rEUfplDfS5UmvYxI9UTG+CFOR
         GE0A==
X-Gm-Message-State: AFqh2kr8hx3wSy+awrcnYMbNnhaTbrtgjz6CGdLO5kizcRFqriRFMeve
	S9lF0lraXazSYn9BXrwdih3ZRS6T+N53fITcwFmIUw==
X-Google-Smtp-Source: AMrXdXsVqoeRc7k2ZV58wwtc9SPaZAwyII5hfb2lvf4rXI7Hm3dv6bgqAnfpZcaY+LHOWmPptKYy9yv2LI3GmSY64O8=
X-Received: by 2002:a17:902:b592:b0:189:e924:e27d with SMTP id
 a18-20020a170902b59200b00189e924e27dmr379022pls.167.1671738940683; Thu, 22
 Dec 2022 11:55:40 -0800 (PST)
MIME-Version: 1.0
References: <20221221141548.274408-1-conor@kernel.org> <20221222180627.GA1748427-robh@kernel.org>
 <Y6SuyiYC/oLB2VzL@spud>
In-Reply-To: <Y6SuyiYC/oLB2VzL@spud>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 22 Dec 2022 11:55:29 -0800
Message-ID: <CAHBxVyEZJeH6H00Jdcm2_=z-D2kYxVTgagYhmLoyJ2CPqcFbgg@mail.gmail.com>
Subject: Re: [PATCH v1] dt-bindings: riscv: add SBI PMU event mappings
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	Conor Dooley <conor.dooley@microchip.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	apatel@ventanamicro.com, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_115541_852038_EB319D4E 
X-CRM114-Status: GOOD (  60.15  )
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

On Thu, Dec 22, 2022 at 11:24 AM Conor Dooley <conor@kernel.org> wrote:
>
> Hey Rob,
>
> On Thu, Dec 22, 2022 at 12:06:27PM -0600, Rob Herring wrote:
> > On Wed, Dec 21, 2022 at 02:15:49PM +0000, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > The SBI PMU extension requires a firmware to be aware of the event to
> > > counter/mhpmevent mappings supported by the hardware. OpenSBI may use
> > > DeviceTree to describe the PMU mappings. This binding is currently
> > > described in markdown in OpenSBI (since v1.0 in Dec 2021) & used by QEMU
> > > since v7.2.0.
> > >
> > > Import the binding for use while validating dtb dumps from QEMU and
> > > upcoming hardware (eg JH7110 SoC) that will make use of the event
> > > mapping.
> > >
> > > Link: https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_support.md
> > > Co-developed-by: Atish Patra <atishp@rivosinc.com>
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > > I asked Rob on IRC about these bindings a few weeks ago & he said he
> > > would be willing to take them. I have modified wording slightly in the
> > > descriptions, but have mostly left things as close to the OpenSBI
> > > documentation as possible.
> >
> > Please CC the perf maintainers. Might be crickets, but so they at least
> > have a chance to see it.
>
> Yah, I was kinda unsure who to CC. It does list them as being
> specifically ARM so I probably made the wrong choice about inclusion.
> I've added them now.
>
> > > I'm not super sure about what I've done with the properties being
> > > correct type wise, I went digging in bindings and am sorta using the
> > > first thing that "fit".
> > >
> > > Since you wrote the md doc Atish, I put your co-developed-by. OpenSBI
> > > is BSD-2-Clause licensed so I am also unsure as to what license I can
> > > use for this binding since that's where I took it from.
> > > ---
> > >  .../devicetree/bindings/perf/riscv,pmu.yaml   | 158 ++++++++++++++++++
> > >  1 file changed, 158 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> > > new file mode 100644
> > > index 000000000000..d65f937680af
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> > > @@ -0,0 +1,158 @@
> > > +# SPDX-License-Identifier: BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/perf/riscv,pmu.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: RISC-V SBI PMU events
> > > +
> > > +maintainers:
> > > +  - Atish Patra <atishp@rivosinc.com>
> > > +
> > > +description: |
> > > +  SBI PMU extension supports allow supervisor software to configure, start &
> > > +  stop any performance counter at anytime. Thus, a user can leverage full
> > > +  capability of performance analysis tools such as perf if the SBI PMU
> > > +  extension is enabled. The OpenSBI implementation makes the following
> > > +  assumptions about the hardware platform:
> > > +    MCOUNTINHIBIT CSR must be implemented in the hardware. Otherwise, the SBI
> > > +    PMU extension will not be enabled.
> > > +

This is no longer true since OpenSBI commit b28f070. We should remove
this from OpenSBI docs as well.

> > > +    The platform must provide information about PMU event to counter mapping
> > > +    via device tree or platform specific hooks. Otherwise, the SBI PMU
> > > +    extension will not be enabled.
> > > +
> > > +    The platforms should provide information about the PMU event selector
> > > +    values that should be encoded in the expected value of MHPMEVENTx while
> > > +    configuring MHPMCOUNTERx for that specific event. This can be done via a
> > > +    device tree or platform specific hooks. The exact value to be written to
> > > +    the MHPMEVENTx is completely dependent on the platform. The generic
> > > +    platform writes the zero-extended event_idx as the expected value for
> > > +    hardware cache/generic events as suggested by the SBI specification.
> > > +

But the larger question is these are OpenSBI implementation specific
assumptions. Should it be included in
the DT binding ?

> > > +properties:
> > > +  compatible:
> > > +    const: riscv,pmu
> > > +
> > > +  riscv,event-to-mhpmevent:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > +    description:
> > > +      Represents an ONE-to-ONE mapping between a PMU event and the event
> > > +      selector value that platform expects to be written to the MHPMEVENTx CSR
> > > +      for that event.
> > > +      The mapping is encoded in an array format where each row represents an
> >
> > s/array/matrix/
> >
> > > +      event. The first element represents the event idx while the second &
> > > +      third elements represent the event selector value that should be encoded
> > > +      in the expected value to be written in MHPMEVENTx.
> > > +      This property shouldn't encode any raw hardware event.
> > > +    minItems: 1
> > > +    maxItems: 255
>
> I copied these 255s from dt-schema somewhere as a sane max.
> Atish, is there a cap here or should we allow as many as someone likes?
> The md binding doesn't mention any limits - is it in the SBI spec?
> The strongest wording I saw there was "limited" & event idx is 20 bits
> wide as per the spec [0]. Does that make 2^20 the hard limit here?
>

This is for hardware & cache events. The total number of events
defined there are 52 (10 HW + 42 Cache) events.
So 255 is a sane max that provides enough room for expansion in future
if required.

> 0 - https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc#11-performance-monitoring-unit-extension-eid-0x504d55-pmu
>
> > > +    items:
> > > +      $ref: /schemas/types.yaml#/definitions/uint32-array
> >
> > Huh? A property can only have 1 type. I wonder what the tools do with
> > this...
>
> I suppose I left this over (by accident) from when I had it arranged
> slightly differently. I guess I never actually noticed as the tools
> don't appear to complain. Now dropped :)
>
> > > +      maxItems: 3
> >
> > Better to do:
> >
> >          items:
> >            - description: what's in the 1st word
> >            - description: what's in the 2nd word
> >            - description: what's in the 3rd word
> >
> > And rework the overall description to not say the same thing.
>
> Yah, good idea. I'll do that for the next version.
>
> > > +  riscv,event-to-mhpmcounters:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > +    description:
> > > +      Represents a MANY-to-MANY mapping between a range of events and all the
> > > +      MHPMCOUNTERx in a bitmap format that can be used to monitor these range
> > > +      of events. The information is encoded in an array format where each
> > > +      row represents a certain range of events and corresponding counters.
> > > +      The first element represents starting of the pmu event id and 2nd column
> > > +      represents the end of the pmu event id. The third element represent a
> > > +      bitmap of all the MHPMCOUNTERx.
> > > +      This property is mandatory if event-to-mhpmevent is present. Otherwise,
> > > +      it can be omitted.
> >
> > No need to state this in freeform text, use 'dependencies'.
>
> Oh! I didn't know that that existed. I was going to go and do some sort
> of required properties dance but perhaps that's not needed now (at least
> to the same extent).
>
> > > +      This property shouldn't encode any raw event.
> > > +    minItems: 1
> > > +    maxItems: 255
> > > +    items:
> > > +      $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +      maxItems: 3
> > > +
> > > +  riscv,raw-event-to-mhpmcounters:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > +    description:
> > > +      Represents an ONE-to-MANY or MANY-to-MANY mapping between the rawevent(s)
> > > +      and all the MHPMCOUNTERx in a bitmap format that can be used to monitor
> > > +      that raw event.
> > > +      The encoding of the raw events are platform specific. The information is
> > > +      encoded in an array format where each row represents the specific raw
> > > +      event(s). The first element is a 64-bit match value where the invariant
> > > +      bits of range of events are set. The second element is a 64-bit mask that
> > > +      will have all the variant bits of the range of events cleared. All other
> > > +      bits should be set in the mask. The third element is a 32-bit value to
> > > +      represent bitmap of all MHPMCOUNTERx that can monitor these set of
> > > +      event(s). If a platform directly encodes each raw PMU event as a unique
> > > +      ID, the value of select_mask must be 0xffffffff_ffffffff.
> > > +    minItems: 1
> > > +    maxItems: 255
> > > +    items:
> > > +      $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +      maxItems: 5
> > > +
> > > +required:
> > > +  - compatible
> >
> > I assume at least one of the other properties must be present?
>
> Atish: (and +CC the OpenSBI list)
> Which properties are actually needed here? Or are any? The md binding
> in the OpenSBI sources doesn't seem to require anything other than the
> compatible?
>

That's true. Opensbi allows the platform to define functions
to provide the mapping. Now that's an OpenSBI implementation thing.
Other implementations may choose to use it differently.


> Thanks Rob,
> Conor.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
