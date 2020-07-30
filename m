Return-Path: <SRS0=rfC7=BJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C25C433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2020 05:54:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F137C2083B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2020 05:54:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OXgAyRyJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OKgsD0pt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F137C2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kZ5CI5mrMkOj8tvHXr63pnjKmK/QnJBg8il5FNxcCPs=; b=OXgAyRyJhNzS6jJpF8tJbNl4E
	wXx/6UoI3uhJlIk7RgbbenvgLpi4E1w+LDxCyNU9nknIpRCbSrNlnRM19lOzWX7G9S7usNSJxDmiE
	AmT/lGZqIQkw9aaxA7JSyPEubhGe8zDi2Le6gbOzjsZoYILwefH/IchdTJe63nyOZNQJK1rYlo72i
	FHMVicRusbqo4uk/6Ae43p4RX/8gc4UkEF7WZUiXO1imuXoK9my5Iy0c3lXOQLl7uSW8UTlouBHZ5
	6nGhVY/Uaksu1qNoSMAD3CF7jSZmA44yHaxBwH47o2Kwxf8gX6rw8XOC6xCrllopyauOE/duLqzsi
	K+txuEcvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k11Vu-00006j-RL; Thu, 30 Jul 2020 05:53:58 +0000
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k11Vr-00005j-Tt
 for linux-riscv@lists.infradead.org; Thu, 30 Jul 2020 05:53:57 +0000
Received: by mail-oo1-xc44.google.com with SMTP id s190so5006294ooa.13
 for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2020 22:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PWUTm2B80IONga0zPA82n4NGLygl8hqkfhDBqeWGO10=;
 b=OKgsD0ptguuxMevvxHZS/VsWHJx+P9tbFF5PDDJjyM/BAFL7ly0ccRWUf2gnBJ4RhW
 eFkmU4dAW82kDIsULIyjcp3uiaLA3Bf7/j69hXUuEopjiokB5CMkb54cMEY3bokKiFex
 q+JVmxpuiQiwOZUS66WalGiqOjMVIqe5RxJcoOUGgsZBpLD61rNNWIDyou265vdSaZ8U
 KgbkiLCZp/tFOc9pKSJ3N25xHp52+2sPHtRo0jsuzQBtZLeswO6XZP+kYyBdd/c/EWmN
 ylhTGi+9AmNLM/jwRO+lCPi/iXfFrBQ2UlqodvQymylpqUfBBX1MRpuhewO1fZZRPSv2
 V9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PWUTm2B80IONga0zPA82n4NGLygl8hqkfhDBqeWGO10=;
 b=Z+sj9ejVYkFLET5PUxr8mEJDwgJ0778BKaHm3xQOMN/weSA+Ev4Cjp+9ZqNz0pfw2O
 QNWPqHBTMtd0ZjAyAMGJ8CPSWjBgNoi+QC3OFDYrAAUTxhSgf/z5tRWIisb63i4Pi22g
 VmtMPIIqwreBAFygXq+8LhEB8NYGa8ZUD2XI7rD6fYFQ85N8VNeDZKPIwbBXOUn/7nJC
 vKl4gXwVYZx0bQbGtY1q8OFc9Kq9scEq8uedFNn+AQkQEFJD56w3SSIM1cCCXZiOfY03
 hKugZpYb4STPbN5TR+MYXnPiZM+koUIkAjsqKsdy2qk/WPihBfUORUS0f4QoZXC6hiK9
 Fvbw==
X-Gm-Message-State: AOAM531++C9NdrYbbdn6fcW5dkgYfEboNoeefygv9tgV7I8l708bgaXe
 GQeb4/wKEQS3ogylk9pnZ/0UtK2D1yMuD/WhpL3cSA==
X-Google-Smtp-Source: ABdhPJz9TpDQO4ZgBSrIG6ChrX56f9O4/KpkHakzON17TvYQRzpyeWdTGfolWDSz4r9/lG9eE9SqePRMTrWAMQUhQlQ=
X-Received: by 2002:a4a:9c50:: with SMTP id c16mr1094092ook.63.1596088431963; 
 Wed, 29 Jul 2020 22:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <a08d725612aac35f30b3c422d3617bc4c733d8c7.1595838303.git.zong.li@sifive.com>
 <CAAhSdy2gSVZcvx0jVgEC7BGDwix62JCVvZeR5-vGWT7MRwf=AA@mail.gmail.com>
 <CANXhq0rBWByF5PxxuctCyM-UUOa3CgQVdxp8xVXUGLjq0Qx5gA@mail.gmail.com>
 <CAAhSdy1TKf4CidGR9pOB29iPuV6hPKr=n7gt=s==v8pu8m8a=Q@mail.gmail.com>
 <CANXhq0oJ9pMnVHfx25yZMJo3yThAZRix_8=BWEo_diNfxxdugQ@mail.gmail.com>
 <CAAhSdy2BrAXLbv3tgj3U58ZshMFW6VCRG9-AJV5u8HUyuCw5Uw@mail.gmail.com>
In-Reply-To: <CAAhSdy2BrAXLbv3tgj3U58ZshMFW6VCRG9-AJV5u8HUyuCw5Uw@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 30 Jul 2020 13:53:41 +0800
Message-ID: <CANXhq0qLM-9ijY=97w3GKL+M777r=T5JBNrS26PTMBGgfvpmKg@mail.gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: riscv: Add YAML documentation for PMU
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_015356_256785_819CE84D 
X-CRM114-Status: GOOD (  55.93  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 28, 2020 at 8:10 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Jul 28, 2020 at 9:38 AM Zong Li <zong.li@sifive.com> wrote:
> >
> > On Tue, Jul 28, 2020 at 11:27 AM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Tue, Jul 28, 2020 at 8:35 AM Zong Li <zong.li@sifive.com> wrote:
> > > >
> > > > On Mon, Jul 27, 2020 at 9:13 PM Anup Patel <anup@brainfault.org> wrote:
> > > > >
> > > > > On Mon, Jul 27, 2020 at 1:57 PM Zong Li <zong.li@sifive.com> wrote:
> > > > > >
> > > > > > Add device tree bindings for performance monitor unit. It passes the
> > > > > > dt_binding_check verification.
> > > > > >
> > > > > > Signed-off-by: Zong Li <zong.li@sifive.com>
> > > > > > ---
> > > > > >  .../devicetree/bindings/riscv/pmu.yaml        | 71 +++++++++++++++++++
> > > > > >  1 file changed, 71 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/riscv/pmu.yaml b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..0c49039a5d3b
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > > > > > @@ -0,0 +1,71 @@
> > > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/riscv/pmu.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: RISC-V Performance Monitor Units
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Zong Li <zong.li@sifive.com>
> > > > > > +  - Paul Walmsley <paul.walmsley@sifive.com>
> > > > > > +  - Palmer Dabbelt <palmer@dabbelt.com>
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    items:
> > > > > > +      - const: riscv,pmu
> > > > > > +
> > > > > > +  riscv,width-hpmcntr:
> > > > > > +    description: The width of hpmcounter CSRs. Default is 64.
> > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > +
> > > > > > +  riscv,n-hpmcntr:
> > > > > > +    description: The number of hpmcounter CSRs. Default is zero.
> > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > +
> > > > > > +  riscv,hw-event-map:
> > > > > > +    description: The mapping of generic hardware events to values of hpmcounter.
> > > > > > +      The key is the encoding of generic hardware events, and the value is the
> > > > > > +      actual value which is implemented by platform. If there is no a key-value
> > > > > > +      pair for specific generic hardware event, view the generic hardware event
> > > > > > +      as not supported. CYCLE and INSTRET be mapped by default, so we shouldn't
> > > > > > +      list PERF_COUNT_HW_CPU_CYCLES and PERF_COUNT_HW_INSTRUCTIONS here.
> > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > > > +
> > > > > > +  riscv,hw-cache-event-map:
> > > > > > +    description: The mapping of generic hardware cache events to values of
> > > > > > +      hpmcounter. The key is encoding of generic hardware cache events, and the
> > > > > > +      value is the actual value which is implemented by platform. If there is no
> > > > > > +      a key-value pair for specific generic hardware cache event, view the
> > > > > > +      generic hardware cache event as not supported.
> > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > > > +
> > > > > > +  riscv,hpmcntr-of-event:
> > > > > > +    description: The mapping of platform hardware events to allowed hmpcounters.
> > > > > > +      The key is the platform hardware event, and the value is the bitmap for
> > > > > > +      hmpcounters which support this event. If there is no a key-value pair for
> > > > > > +      specific platform hardware events, view the platform hardware events as
> > > > > > +      supported by all hpmcounters.
> > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > > > +
> > > > > > +required:
> > > > > > +  - compatible
> > > > > > +
> > > > > > +additionalProperties: false
> > > > > > +
> > > > > > +examples:
> > > > > > +  - |
> > > > > > +    pmu {
> > > > > > +      compatible = "riscv,pmu";
> > > > > > +      riscv,width-hpmcntr = <40>;
> > > > > > +      riscv,n-hpmcntr = <2>;
> > > > > > +      riscv,hw-event-map = <0x3 0x0202
> > > > > > +                            0x4 0x4000>;
> > > > > > +      riscv,hw-cache-event-map = <0x010201 0x0102
> > > > > > +                                  0x010204 0x0802>;
> > > > > > +      riscv,hpmcntr-of-event = <0x100 0x18
> > > > > > +                                0x400 0x10>;
> > > > > > +    };
> > > > > > +
> > > > > > +...
> > > > > > --
> > > > > > 2.27.0
> > > > > >
> > > > >
> > > > > I don't see the point of sending DT bindings documents
> > > > > until the SBI PMU extension is defined and accepted
> > > > > by everyone.
> > > > >
> > > >
> > > > It seems to me that it doesn't conflict with the SBI PMU extension.
> > > > SBI PMU extension is the interface for communication with the lower
> > > > privilege levels, we still can come out the DT in parallel, and make
> > > > sure what information is needed by m-mode firmware. OTOH, we also need
> > > > a Linux driver which has to parse the dtb when we build Linux as nommu
> > > > and run it on m-mode privilege, so if we could define the DT for PMU
> > > > node, we can go the driver for nommu first (the implementation would
> > > > also consider HW counter, SW counter together). I think you have got
> > > > the picture about m-mode firmware, it would be great to start to
> > > > collect the idea of DT.
> > >
> > > The RISC-V PMU DT binding is not just for Linux. Even M-mode
> > > runtime firmware (OpenSBI) will be using this binding.
> > >
> > > The DT bindings you are proposing is conflicting with the
> > > expected RISC-V PMU DT bindings:
> > > 1. The event-map should be mapping SBI PMU event_idx
> > > to HARDWARE HPMEVENT value whereas this binding
> > > defines event-map as mapping Linux perf event types to
> > > HPMEVENT value.
> >
> > It is more suitable by using Linux perf event types directly here. On
> > nommu Linux, it doesn't have additional m-mode firmware, so it doesn't
> > have the rule like SMI PMU event_idx. Unless we apply the same rule in
> > nommu pmu drivers as well, it doesn't need to translate the event_idx
> > to Linux perf event types in Linux nommu driver.
>
> This means you will end-up with a separate driver and binding
> for NoMMU Linux as compared to S-mode Linux. The PMU DT
> node for M-mode and S-mode will also look totally different.

No, we would have only one driver. The initial idea is that we
separate the implementation for HW counter, SW counter and nommu
respectively, they could register callback functions to the main perf
driver. Ideally, I hope we can have only one binding for m-mode and
s-mode, these properties are optional, so in the s-mode case, we don't
need to give the properties which are needed by m-mode.

>
> For S-mode case, we only need compatible string and optional
> interrupts DT property.
>
> >
> > > 2. Each HPMCOUNTER can support a different set of events
> > > so this DT bindings won't work for it.
> >
> > There is a property "riscv,hpmcntr-of-event" to indicate which
> > counters can serve the specific event, if we don't list the particular
> > event in this property, we view this event could be served by all
> > counters.
>
> The name of this property is totally misleading.

Yes, I also struggled with the name for it, welcome to improve it if
you have a good idea.

>
> >
> > > 3. The SBI PMU driver can have optional edge-triggered
> > > per-HART interrupts for overflow detection. This DT bindings
> > > does not consider this as well.
> > >
> >
> > We don't have an overflow interrupt mechanism in RISC-V spec now, we
> > should postpone and add the properties of interrupt stuff after the
> > mechanism is standardized.
>
> I totally disagree. The RISC-V spec does not prevent any RISC-V
> implementation from having per-HART edge triggered interrupts
> which are routed through PLIC.
>

Yes, I know, my point is that we don't have a standard way to
implement overflow interrupt mechanism for PMU yet, it is being
discussed, so even through we give the interrupt properties, it
doesn't seem to be used for current driver.

> (Please see the discussion on RISC-V privilege mailing list).
>
> That's why RISC-V PMU DT bindings should have an optional
> interrupts DT property.
>
> >
> > > The SBI PMU event_idx definition is not yet finalized. Please
> > > wait for SBI PMU extension to be finalized.
> > >
> >
> > As I mentioned above, it need to be discussed whether we should do id
> > translation in Linux nommu driver.
>
> All this implies that you want two separate drivers, bindings and DT
> nodes for M-mode and S-mode cases.

No, I hope we only have one driver and one binding, so we should come
out a common way for them.

>
> I disagree with this approach. This will lead to a lot of duplication
> and confusion.
>
> Better approach would be to have SBI PMU event_idx to HPMEVENT
> CSR value mappings in the DT properties. For M-mode (NoMMU) linux,
> we convert the Linux perf event to SBI PMU event_idx and then to the
> HPMEVENT value using event-map. For S-mode (MMU) linux, we can
> convert the Linux perf event to the SBI PMU event_idx and then use
> this SBI PMU event_idx with SBI_PMU_SET_EVENT call.

It is trade off, we can let m-mode driver convert the event between
SBI event_idx and Linux perf event, we also can let opensbi convert
the event between Linux perf event and SBI event_idx, But I think your
approach is also good to me, because we can make s-mode and m-mode
driver use identical way to get the actual value of hpmcounter, even
m-mode driver doesn't need to give an abstract level for SBI PMU
event_idx

>
> The optional interrupts DT property should be available in both M-mode
> (NoMMU) and S-mode cases so that RISC-V implementation can at
> least provide edge-triggered per-HART interrupts which are routed
> through PLIC.
>
> Please wait for the SBI PMU extension to be finalized. Once it is
> finalized, we can come-up with a common RISC-V PMU driver which
> works for both M-mode (NoMMU) Linux and S-mode Linux.
>

Ok, fine, though I think DT and SBI PMU extension can be in parallel,
let's postpone the DT definition.

> Regards,
> Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
