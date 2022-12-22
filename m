Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD699C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 20:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGmGGcg1mHceLIaKSW+I+X/dtARPPjIObWrGgzcQQ10=; b=IR6lSDY9BapDds
	anfVzhFTtR8tKrb3jQDRvBBqNij1gXMg4GWmdGZzSlu6CrUW078h2USJRpiy3CR/exooGy0/1DIOk
	6sUr6NT6GvwP3kmrZMunPnN7ynF6tZNfchv8qpz73mxo+LPwqRES9PjR3ovHk9ng50I3awQPL0lAa
	9pmNoQURllonaXifc4f8H8wAqYBm8UEHfmFsyrXwc2T7lSS8/2p2zZ5ldtZfkn5Ro3TtyENvvAuSB
	x0oK+QlpkZdAc6XuxXHFVa/fTWth0wHKtuT84In3rui+oN46P1vaDiECh9dp++Hxcrz6VvCdQP/0n
	i2t9rhT/1t0v1sOX4huA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8SM0-00Gyus-Uj; Thu, 22 Dec 2022 20:39:48 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8SLx-00Gyrl-B7
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 20:39:47 +0000
Received: by mail-pj1-x102d.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so3046839pjm.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 12:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J3zLUjblmA5mKEiIe8j3yE4p+xtYnnjTwcILFpQqr1k=;
        b=tRr0fSrAlAuA+8qQlf6oLPg79UCe7ol6ReGxgZcf4SGnzupfE2aHJbFlqo/Xdf1ZpD
         EUhGSYp97two/lSMQCeGDZH1GJNsVxsXvMvvD38+DHu7Sq5eZ1BFW2XhwLCo+2ha0JyD
         lgIjSKg7xcoL+s7mNNqu0XAT3rWGWibvbgNhJS4B2c+Y9rFJlbENBKxLwacYLZZ98Rfy
         dcOj9x0Wv+BHTGC8cFhNxffMDG4HFzfjSWLF5dCt8a8t80FD7Rv2ieahh0fmB+Jki8iJ
         d3IIXbNN1o2w8UX1LR8UD94QBRR1YJ8RZKLgnWorYG0np4Vki6JI3y0u+BpljqkAiSQU
         nYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3zLUjblmA5mKEiIe8j3yE4p+xtYnnjTwcILFpQqr1k=;
        b=7cMEwlFIqiWwM5bFHUI9gnJf9tmVfJr6Vr4vOj5OkqmlqpQk+1kO957sN76LFN34DZ
         4lZ/sWzXba7GLMX/hmmkYK8hOM5G/KdMMKgfBVRHgJP/tsV2HW7GWiLFdr98pMOXacqS
         nbPuhWZqm2AqZ5Srzq5rt7Pr6Wu7Ic+lHxiA15bmduZiE/AUPLML3kjrLd5eeXRjZvrZ
         2pc2vFSOkjq41hx+AV02uVd2GicFLk1eqGNVKHAyyTCYb6Ve1S45HKOFydgFDN9cD+kA
         z2wb84sQhPyxzTvTmErcK81SL1AWXU+xt1wKIF22xr+wODuF425J4o5BPL3KjZrOkQBp
         zogA==
X-Gm-Message-State: AFqh2kpWMwNtm7wstx4NhVoU4e6cZWM2SKsf5iB6YHbcxLm9ZmQ7mhn1
	uYy+sFF7e2wZLEUnPtexVp6JFf730cPmPm7Qcmwnlw==
X-Google-Smtp-Source: AMrXdXs1KzVo1N9EgMkuU6lriJgDH0QGtfzhY/506RNYcwO3uIbIeNNlqQOdmKSv6PYn7R0RUAZgCGWR6PQQY3jYAqY=
X-Received: by 2002:a17:903:2154:b0:186:a394:aef7 with SMTP id
 s20-20020a170903215400b00186a394aef7mr453138ple.79.1671741582290; Thu, 22 Dec
 2022 12:39:42 -0800 (PST)
MIME-Version: 1.0
References: <20221221141548.274408-1-conor@kernel.org> <20221222180627.GA1748427-robh@kernel.org>
 <Y6SuyiYC/oLB2VzL@spud> <CAHBxVyEZJeH6H00Jdcm2_=z-D2kYxVTgagYhmLoyJ2CPqcFbgg@mail.gmail.com>
 <Y6S7ENNXQe42ymTz@spud>
In-Reply-To: <Y6S7ENNXQe42ymTz@spud>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 22 Dec 2022 12:39:31 -0800
Message-ID: <CAHBxVyHn7NEYCJTCJYU3Pu4=t7TGssog3ywaxfd1TFXXF9f9+Q@mail.gmail.com>
Subject: Re: [PATCH v1] dt-bindings: riscv: add SBI PMU event mappings
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	Conor Dooley <conor.dooley@microchip.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	apatel@ventanamicro.com, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_123945_436517_C7E080D0 
X-CRM114-Status: GOOD (  40.70  )
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

On Thu, Dec 22, 2022 at 12:16 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Thu, Dec 22, 2022 at 11:55:29AM -0800, Atish Kumar Patra wrote:
> > On Thu, Dec 22, 2022 at 11:24 AM Conor Dooley <conor@kernel.org> wrote:
> > > On Thu, Dec 22, 2022 at 12:06:27PM -0600, Rob Herring wrote:
> > > > On Wed, Dec 21, 2022 at 02:15:49PM +0000, Conor Dooley wrote:
> > > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > > >
> > > > > The SBI PMU extension requires a firmware to be aware of the event to
> > > > > counter/mhpmevent mappings supported by the hardware. OpenSBI may use
> > > > > DeviceTree to describe the PMU mappings. This binding is currently
> > > > > described in markdown in OpenSBI (since v1.0 in Dec 2021) & used by QEMU
> > > > > since v7.2.0.
> > > > >
> > > > > Import the binding for use while validating dtb dumps from QEMU and
> > > > > upcoming hardware (eg JH7110 SoC) that will make use of the event
> > > > > mapping.
> > > > >
> > > > > Link: https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_support.md
> > > > > Co-developed-by: Atish Patra <atishp@rivosinc.com>
> > > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > +description: |
> > > > > +  SBI PMU extension supports allow supervisor software to configure, start &
> > > > > +  stop any performance counter at anytime. Thus, a user can leverage full
> > > > > +  capability of performance analysis tools such as perf if the SBI PMU
> > > > > +  extension is enabled. The OpenSBI implementation makes the following
> > > > > +  assumptions about the hardware platform:
> > > > > +    MCOUNTINHIBIT CSR must be implemented in the hardware. Otherwise, the SBI
> > > > > +    PMU extension will not be enabled.
> > > > > +
> >
> > This is no longer true since OpenSBI commit b28f070. We should remove
> > this from OpenSBI docs as well.
>
> Since you know the detail of it, I volunteer you for that one ;)
>

Done.

> > > > > +    The platform must provide information about PMU event to counter mapping
> > > > > +    via device tree or platform specific hooks. Otherwise, the SBI PMU
> > > > > +    extension will not be enabled.
> > > > > +
> > > > > +    The platforms should provide information about the PMU event selector
> > > > > +    values that should be encoded in the expected value of MHPMEVENTx while
> > > > > +    configuring MHPMCOUNTERx for that specific event. This can be done via a
> > > > > +    device tree or platform specific hooks. The exact value to be written to
> > > > > +    the MHPMEVENTx is completely dependent on the platform. The generic
> > > > > +    platform writes the zero-extended event_idx as the expected value for
> > > > > +    hardware cache/generic events as suggested by the SBI specification.
> > > > > +
> >
> > But the larger question is these are OpenSBI implementation specific
> > assumptions. Should it be included in
> > the DT binding?
>
> Probably not. I'll drop it for v2.
>
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: riscv,pmu
> > > > > +
> > > > > +  riscv,event-to-mhpmevent:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > > > +    description:
> > > > > +      Represents an ONE-to-ONE mapping between a PMU event and the event
> > > > > +      selector value that platform expects to be written to the MHPMEVENTx CSR
> > > > > +      for that event.
> > > > > +      The mapping is encoded in an array format where each row represents an
> > > >
> > > > s/array/matrix/
> > > >
> > > > > +      event. The first element represents the event idx while the second &
> > > > > +      third elements represent the event selector value that should be encoded
> > > > > +      in the expected value to be written in MHPMEVENTx.
> > > > > +      This property shouldn't encode any raw hardware event.
> > > > > +    minItems: 1
> > > > > +    maxItems: 255
> > >
> > > I copied these 255s from dt-schema somewhere as a sane max.
> > > Atish, is there a cap here or should we allow as many as someone likes?
> > > The md binding doesn't mention any limits - is it in the SBI spec?
> > > The strongest wording I saw there was "limited" & event idx is 20 bits
> > > wide as per the spec [0]. Does that make 2^20 the hard limit here?
> > >
> >
> > This is for hardware & cache events. The total number of events
> > defined there are 52 (10 HW + 42 Cache) events.
> > So 255 is a sane max that provides enough room for expansion in future
> > if required.
>
> WFM.
>
> > > > > +  riscv,raw-event-to-mhpmcounters:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > > > +    description:
> > > > > +      Represents an ONE-to-MANY or MANY-to-MANY mapping between the rawevent(s)
> > > > > +      and all the MHPMCOUNTERx in a bitmap format that can be used to monitor
> > > > > +      that raw event.
> > > > > +      The encoding of the raw events are platform specific. The information is
> > > > > +      encoded in an array format where each row represents the specific raw
> > > > > +      event(s). The first element is a 64-bit match value where the invariant
> > > > > +      bits of range of events are set. The second element is a 64-bit mask that
> > > > > +      will have all the variant bits of the range of events cleared. All other
> > > > > +      bits should be set in the mask. The third element is a 32-bit value to
> > > > > +      represent bitmap of all MHPMCOUNTERx that can monitor these set of
> > > > > +      event(s). If a platform directly encodes each raw PMU event as a unique
> > > > > +      ID, the value of select_mask must be 0xffffffff_ffffffff.
> > > > > +    minItems: 1
> > > > > +    maxItems: 255
> > > > > +    items:
> > > > > +      $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > > +      maxItems: 5
> > > > > +
> > > > > +required:
> > > > > +  - compatible
> > > >
> > > > I assume at least one of the other properties must be present?
> > >
> > > Atish: (and +CC the OpenSBI list)
> > > Which properties are actually needed here? Or are any? The md binding
> > > in the OpenSBI sources doesn't seem to require anything other than the
> > > compatible?
> > >
> >
> > That's true. Opensbi allows the platform to define functions
> > to provide the mapping. Now that's an OpenSBI implementation thing.
> > Other implementations may choose to use it differently.
>
> In the case where the platform can define functions, the "bare" node
> with just the compatible is still required though in that case, right?
>

Yup.

> Thanks,
> Conor.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
