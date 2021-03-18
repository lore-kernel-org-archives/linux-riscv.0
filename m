Return-Path: <SRS0=IhzG=IQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFB5C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 11:03:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A41BF64E05
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 11:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A41BF64E05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=84BLfVjE3u6VyDw1c1WIP1PxXK5jrbBYr0cyTG906f4=; b=WCXM6VkGdKDNVaHDZ5JNm2JPr
	sgvdnAj6dA0nxKkrRqEVKW0Mn2NzawT7pAY3z+85yRRPOdBK9xIhpPWW8bxB1q2FrwPLe3LIGRgQL
	6BkLjYVTvhjjoGImn4MMJe9sJ1vjNmh3KT+DSHxUA7H3xwGmM3jGHhu5p7U4sy80T8sS6h3oJoMBo
	FknIKVnFmkYyJr1CgeEkuKO5dkRcK1jqZiCsXNA4dUS8kTxx1DadEOYHyYvUmsFhOMtrXBEYtljen
	i6J04M7Btkl+aZqdDAn4GqJETpP+jrTaMaNQQQpSksL2/Qw6SFgLyZeOSgu9EWYVoBtgoaDQTt/7H
	pwXtkEnhw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMqQK-0053eg-7D; Thu, 18 Mar 2021 11:02:40 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMqQC-0053dt-57
 for linux-riscv@lists.infradead.org; Thu, 18 Mar 2021 11:02:34 +0000
Received: by mail-wr1-x431.google.com with SMTP id v4so5014063wrp.13
 for <linux-riscv@lists.infradead.org>; Thu, 18 Mar 2021 04:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RaGPtlv7SLOWssA/2OUjy96UMHcyvtNafHHhHgBI9nE=;
 b=neqRkEFXfZtkXLH4oNWGmf98m9VyR+4pLz7ASX4JlNjSA6r6ofaHXscCkatdoeYd5k
 aRfr5v8VAE6CtRo7HZlZ65DmqICPLY8kkVkihKsluSQcGn3SgGUB/o7MUze+ng08Hmv9
 TL7LKIkxU0b33vA6ReNJYCye9qZjTPlI3wONrsLDAiiZddT4kebuRD9d+rRXJYQp2e3B
 PCIM9nQI6rC18zQbFtlhYEKgzxH0gE5q6MWOdX4RtQjHIGKgbWAZnz/v6PX23SyMKBvU
 /hAsigmRLuPntdq+nMH6jHjHw1/VWop6UFemTQ9ap7osnLB+t5QNs8ctn8ORhViD8nUg
 d+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RaGPtlv7SLOWssA/2OUjy96UMHcyvtNafHHhHgBI9nE=;
 b=f5ojc/tcoY8vm9dc6f/N78GcxFBetRpA/PPv55768kSnRxxprrgp4f48qeNwrfQwEy
 Sb+Wglpf5MmjAXTbcYGiQ+QS34F9Z4cZ3/6thOZN/xKGwSPcTkny6xxysELJA9RiMBZz
 UjAPpICx7HLegXzSoJvnamJgY0Jd8uuOPKOk6pKdynEn5viGIP4xap6fzAyVag0i/4en
 F+ug31Zui0Z1mgD+HYELZi6VGwq1H5o6zGdfvyNXDzYEtexWjlllAt9XJlUBOxfI46zh
 zlunQhSinBp5jMHY5UmW2w1yAtbde4qZurKOHG3EKTlbQ0rGw3dmu+JuIiXYnHiHYAiY
 8jbA==
X-Gm-Message-State: AOAM531mgWtfck1diQh5KejGOR8QkNcEsyGk6MvSi8lol0CF6FFI983X
 NqRUQHvZSmjiav9yyJ1nOYmxqL6zP9ys6vqi/e6NrQ==
X-Google-Smtp-Source: ABdhPJwFsXGsLWhLFOZr4bxCvM8KZC8buTThv4SMuDErXUoXK9GWDjMjklpqTSS37yJlD7sfGHJb4PqkhUXq40SX3e0=
X-Received: by 2002:a05:6000:250:: with SMTP id
 m16mr9289960wrz.325.1616065349871; 
 Thu, 18 Mar 2021 04:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210221093758.210981-1-anup.patel@wdc.com>
 <20210221093758.210981-8-anup.patel@wdc.com>
 <20210305232245.GA820565@robh.at.kernel.org>
 <CAAhSdy0TwcE17-GJp664of4DV_R+6Q-S_h-N4Sbv9KL4Xofxvg@mail.gmail.com>
 <CAL_JsqKPwND6BGq3gEuMugEnv4TNvM2_DMdB-p-v7qh5NXyPiQ@mail.gmail.com>
In-Reply-To: <CAL_JsqKPwND6BGq3gEuMugEnv4TNvM2_DMdB-p-v7qh5NXyPiQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Mar 2021 16:32:18 +0530
Message-ID: <CAAhSdy0ex1PjGa+=KgkSYFd+BteH7txJSrRdOhZnetwXaL42hQ@mail.gmail.com>
Subject: Re: [RFC PATCH 7/8] dt-bindings: Add bindings documentation for
 RISC-V idle states
To: Rob Herring <robh@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Pavel Machek <pavel@ucw.cz>, 
 Sandeep Tripathy <milun.tripathy@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Liush <liush@allwinnertech.com>, 
 devicetree@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_110232_329115_612A385A 
X-CRM114-Status: GOOD (  42.85  )
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

On Tue, Mar 16, 2021 at 9:24 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Mar 7, 2021 at 8:18 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Sat, Mar 6, 2021 at 4:52 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Sun, Feb 21, 2021 at 03:07:57PM +0530, Anup Patel wrote:
> > > > The RISC-V CPU idle states will be described in DT under the
> > > > /cpus/riscv-idle-states DT node. This patch adds the bindings
> > > > documentation for riscv-idle-states DT nodes and idle state DT
> > > > nodes under it.
> > > >
> > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > ---
> > > >  .../bindings/riscv/idle-states.yaml           | 250 ++++++++++++++++++
> > > >  1 file changed, 250 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/riscv/idle-states.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/riscv/idle-states.yaml b/Documentation/devicetree/bindings/riscv/idle-states.yaml
> > > > new file mode 100644
> > > > index 000000000000..3eff763fed23
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/riscv/idle-states.yaml
> > > > @@ -0,0 +1,250 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/riscv/idle-states.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: RISC-V idle states binding description
> > > > +
> > > > +maintainers:
> > > > +  - Anup Patel <anup.patel@wdc.com>
> > > > +
> > > > +description: |+
> > > > +  RISC-V systems can manage power consumption dynamically, where HARTs
> > > > +  (or CPUs) [1] can be put in different platform specific suspend (or
> > > > +  idle) states (ranging from simple WFI, power gating, etc). The RISC-V
> > > > +  SBI [2] hart state management extension provides a standard mechanism
> > > > +  for OSes to request HART state transitions.
> > > > +
> > > > +  The platform specific suspend (or idle) states of a hart can be either
> > > > +  retentive or non-rententive in nature. A retentive suspend state will
> > > > +  preserve hart register and CSR values for all privilege modes whereas
> > > > +  a non-retentive suspend state will not preserve hart register and CSR
> > > > +  values. The suspend (or idle) state entered by executing the WFI
> > > > +  instruction is considered standard on all RISC-V systems and therefore
> > > > +  must not be listed in device tree.
> > > > +
> > > > +  The device tree binding definition for RISC-V idle states described
> > > > +  in this document is quite similar to the ARM idle states [3].
> > > > +
> > > > +  References
> > > > +
> > > > +  [1] RISC-V Linux Kernel documentation - CPUs bindings
> > > > +      Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > +
> > > > +  [2] RISC-V Supervisor Binary Interface (SBI)
> > > > +      http://github.com/riscv/riscv-sbi-doc/riscv-sbi.adoc
> > > > +
> > > > +  [3] ARM idle states binding description - Idle states bindings
> > > > +      Documentation/devicetree/bindings/arm/idle-states.yaml
> > >
> > > I'd assume there's common parts we can share.
> >
> > Yes, except few properties most are the same.
> >
> > We can have a shared DT bindings for both ARM and RISC-V but
> > both architectures will always have some architecture specific details
> > (or properties) which need to be documented under arch specific
> > DT documentation. Is it okay if this is done as a separate series ?
>
> No...

Okay, I will create a common DT bindings for both ARM and RISC-V
in the next revision.

>
> > > > +
> > > > +properties:
> > > > +  $nodename:
> > > > +    const: riscv-idle-states
> > >
> > > Just 'idle-states' like Arm.
> >
> > I had tried "idle-states" node name but DT bindings check complaints
> > conflict with ARM idle state bindings.
>
> ...and this being one reason why.
>
> Actually, I think this can all be in 1 doc if you want. It's fine with
> me if a common doc has RiscV and Arm specific properties.

Sure, will add common DT bindings.

>
> > > > +
> > > > +patternProperties:
> > > > +  "^(cpu|cluster)-":
> > > > +    type: object
> > > > +    description: |
> > > > +      Each state node represents an idle state description and must be
> > > > +      defined as follows.
> > > > +
> > >
> > >        additionalProperties: false
> >
> > okay, will update.
> >
> > >
> > > > +    properties:
> > > > +      compatible:
> > > > +        const: riscv,idle-state
> > > > +
> > > > +      local-timer-stop:
> > > > +        description:
> > > > +          If present the CPU local timer control logic is lost on state
> > > > +          entry, otherwise it is retained.
> > > > +        type: boolean
> > > > +
> > > > +      entry-latency-us:
> > > > +        description:
> > > > +          Worst case latency in microseconds required to enter the idle state.
> > > > +
> > > > +      exit-latency-us:
> > > > +        description:
> > > > +          Worst case latency in microseconds required to exit the idle state.
> > > > +          The exit-latency-us duration may be guaranteed only after
> > > > +          entry-latency-us has passed.
> > > > +
> > > > +      min-residency-us:
> > > > +        description:
> > > > +          Minimum residency duration in microseconds, inclusive of preparation
> > > > +          and entry, for this idle state to be considered worthwhile energy
> > > > +          wise (refer to section 2 of this document for a complete description).
> > > > +
> > > > +      wakeup-latency-us:
> > > > +        description: |
> > > > +          Maximum delay between the signaling of a wake-up event and the CPU
> > > > +          being able to execute normal code again. If omitted, this is assumed
> > > > +          to be equal to:
> > > > +
> > > > +            entry-latency-us + exit-latency-us
> > > > +
> > > > +          It is important to supply this value on systems where the duration
> > > > +          of PREP phase (see diagram 1, section 2) is non-neglibigle. In such
> > > > +          systems entry-latency-us + exit-latency-us will exceed
> > > > +          wakeup-latency-us by this duration.
> > > > +
> > > > +      idle-state-name:
> > > > +        $ref: /schemas/types.yaml#/definitions/string
> > > > +        description:
> > > > +          A string used as a descriptive name for the idle state.
> > > > +
> > > > +    required:
> > > > +      - compatible
> > > > +      - entry-latency-us
> > > > +      - exit-latency-us
> > > > +      - min-residency-us
> > > > +
> > > > +additionalProperties: false
> >
> > I will move this up.
>
> TBC, you need this at 2 levels. Both the idle-states node and child nodes.

Sure, I will add at both levels.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
