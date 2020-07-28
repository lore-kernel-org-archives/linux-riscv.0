Return-Path: <SRS0=Fr2v=BH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74331C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 16:59:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CE882053B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 16:59:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U0ousvRK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="mNPZ45Hd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CE882053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DfSZJJIo/dj21JWNoHb6IrB1FlotHaPWk3QRNXujArU=; b=U0ousvRKN9lKNgVtpa7fBxI9Y
	jqvxHuqcYH46zjQW/ONdLF5esEO0MkOfTWZ6kHZMoEQSXlea78Yeb2EPAdMF9XZ2mXrDEFu323xNV
	ewnUVFeKhvPjBovYstr4OY45MbyW1Yq5zWfrUyFaQXgH8EqMOng3Foxp4L03EY2lTpDOaHMdTb24W
	05f6KZBwAiftLdvMuAyN6xT5RYps948ikfC3cjwBbXZO6boS5uNej/Prusv5EZLnmAYCaq743vLFK
	P7AYTthlBT1mbty5Jf1z23VL2JKXNQ1/LyYnJe4uDpTXbYOlIl0RpxXh1+iXzk4ZH4/ox32cAtaXE
	6ACUavdGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0SwO-0008GC-92; Tue, 28 Jul 2020 16:59:00 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0SwL-0008Fb-5m
 for linux-riscv@lists.infradead.org; Tue, 28 Jul 2020 16:58:58 +0000
Received: by mail-wr1-x442.google.com with SMTP id b6so18988899wrs.11
 for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2020 09:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LkBf5YhJ5pWzTJbLfxHOR/ozfWB4CH14u6Pc4xD5Aak=;
 b=mNPZ45HdBoSKyPx9vssTBaO2S4K1DdYtgpeFgYeEjDUlYqYV95Z+kVHlIZUXG+tudd
 vu1hXn0QtjimMPo301EKlYU4dBq5UH59jB1tzHHRT3nIABIbcFp6p2HGza2sUzi1suL/
 G6Y+DQFsTONHjNpIoVn+XOjRrYhsifGuVIeGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LkBf5YhJ5pWzTJbLfxHOR/ozfWB4CH14u6Pc4xD5Aak=;
 b=XeUHSgiI/RF2G3aGqoGBJOSA1zd7OS2/7Sn8bopgbBNK6xysOBlOBEIwgC77P0/TKA
 bXtBuoKuTcmFQXJvDFFdYeTzuc5z3gS7Vq9gmlXG5XBb97MBPnkD45M5Z95Yhaoka3uY
 DTQidY2DVAl3gYZAagi9wdpiaRbY5yM8/X8c4MTz+FBEzgSj9NLGkVMrLnafwsvH+dSx
 biZuF899jf8t5+uo6JA4nYqbR1mOKf07rV7jVV4T2U+AHS1UgaOTkCENBtT7R3l8euPM
 ZT4uGMLXJQUN+qSk5mAH+nlrXGmKD3m8PMFrFBXZi3IbpMnLzXfAVUh5Ij3KCjZ8Zi9Z
 Zb2w==
X-Gm-Message-State: AOAM532uOh+p3dqitG/reHWpfkPilFcjxJJoXDZLiCL5KsNBENjirE9z
 pxQPfipSo+hi2Ir2u7+A+qlXzYQU1yB3H9CUQ3FLmNE=
X-Google-Smtp-Source: ABdhPJyaP3afn2ENHJAh8DUCWsXJWoJAgmGsyPUn3sAVz7LsN2ruiouiWq6UE8HxBavBUxLj9Fl3h2hc0j5iY40zpR8=
X-Received: by 2002:adf:f7c3:: with SMTP id a3mr12034550wrq.162.1595955533963; 
 Tue, 28 Jul 2020 09:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <a08d725612aac35f30b3c422d3617bc4c733d8c7.1595838303.git.zong.li@sifive.com>
 <CAAhSdy2gSVZcvx0jVgEC7BGDwix62JCVvZeR5-vGWT7MRwf=AA@mail.gmail.com>
 <CANXhq0rBWByF5PxxuctCyM-UUOa3CgQVdxp8xVXUGLjq0Qx5gA@mail.gmail.com>
 <CAAhSdy1TKf4CidGR9pOB29iPuV6hPKr=n7gt=s==v8pu8m8a=Q@mail.gmail.com>
 <CANXhq0oJ9pMnVHfx25yZMJo3yThAZRix_8=BWEo_diNfxxdugQ@mail.gmail.com>
 <CAAhSdy2BrAXLbv3tgj3U58ZshMFW6VCRG9-AJV5u8HUyuCw5Uw@mail.gmail.com>
In-Reply-To: <CAAhSdy2BrAXLbv3tgj3U58ZshMFW6VCRG9-AJV5u8HUyuCw5Uw@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 28 Jul 2020 09:58:42 -0700
Message-ID: <CAOnJCUKFhBfri+SGguf1A_8MzvPQu6CEr=YJ3V7Gp-kDt_kSFw@mail.gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: riscv: Add YAML documentation for PMU
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_125857_354874_7F89F05B 
X-CRM114-Status: GOOD (  55.58  )
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
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 28, 2020 at 5:10 AM Anup Patel <anup@brainfault.org> wrote:
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
>

I think the bigger question is : Do we even need perf events for NoMMU Linux ?
I am not sure if kendryte supports it. Even if it supports it, it
doesn't have enough memory
to support decent userspace. We are talking about doing a performance
analysis on Kendryte.

IMHO, it is premature to add a driver for something that we may never use.

> The optional interrupts DT property should be available in both M-mode
> (NoMMU) and S-mode cases so that RISC-V implementation can at
> least provide edge-triggered per-HART interrupts which are routed
> through PLIC.
>
> Please wait for the SBI PMU extension to be finalized. Once it is
> finalized, we can come-up with a common RISC-V PMU driver which
> works for both M-mode (NoMMU) Linux and S-mode Linux.
>

Do you want to discuss the SBI PMU proposal in the next unix platform
working group meeting ?

> Regards,
> Anup
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
