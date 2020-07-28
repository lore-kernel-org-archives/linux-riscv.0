Return-Path: <SRS0=Fr2v=BH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F814C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 12:10:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DBA52065E
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 12:10:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ItdMyekD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Zd5Asr7S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DBA52065E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+oBHCtrQiIOCntV+zM7waiMZFo8myXMxreOnI6PFC6Q=; b=ItdMyekDtr86QQ+L8o4jEBm0L
	9EPeJXoy5a9B0RXB56954U4qZgDE58f050/vKHw2n+t7GXELn3H9K1FSYCh9SCAegoB+r5Fal0Lr8
	HsHK8+j6RR1pMAppibveWhUqnhCGsH8nl8NDHM3F2ZJbDkPCbWHCVp1B31itj+6yKHi73EGbDkEjv
	bhkEkxdfrKbCRd8ofHTHphGcs88g8dn0HLhVyIOYOiYWNp3leqFdsXEAJ8x+yGu/fZFockFbP0AiH
	mjTU0OocBGt3BZfMWVDZ6mmmE/wIOyFZpoC5DUzYNQBI86kXGqS7jEyXEORMRfkibgS9jB3hCQPsq
	59ilSj8Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0OR2-0003v0-3G; Tue, 28 Jul 2020 12:10:20 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0OQx-0003tZ-TL
 for linux-riscv@lists.infradead.org; Tue, 28 Jul 2020 12:10:17 +0000
Received: by mail-wr1-x444.google.com with SMTP id r4so15088048wrx.9
 for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2020 05:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t8t/nSlz4lpWmyzFkayNr8rwYv9dnXqZ170Gj0Ok/Zw=;
 b=Zd5Asr7SgN5FcYTE+czg7NsV8ptIDqmcjOecwPOXrqJoN0/mtQsR7JUkfUvjDDbWEp
 +f8jBTT78XdiI81TKZRGqlcipvl32S9GRXw9uIEBosTfnTuhOcyfSqY8z6/z4xrtR7qj
 qc7+3S2cJA/0ZiNaHWpEB69i3BTZ2oG7KmZnTWFiSDlCDkPhZCzz0YUCqNXaHeZw2YP1
 cz3EuxsMVQeFZGniLtpyj/wftV5HfhKk2JO9xB+KSOya1iaf6nwzAN75kDm9K+iBAJxk
 riD6Dw7ZKmTvcncYi9aYZxExn3F0AtC4qgm5OBrDU0BDSjJ9l/ngQJWY4lVrAmnbxhUV
 GGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t8t/nSlz4lpWmyzFkayNr8rwYv9dnXqZ170Gj0Ok/Zw=;
 b=cNh4zoGheadCDcooBv+hf4KuqOmb7rkxDkp/46ptzZgMFVg913qlc1S3tMKLmU1wT5
 FK/xYQgyvMqf2B+AHXhrKi/XD+qRRlVcOCF2XQuNaATAeySU2RhudJhIa0fBkVDrjAuV
 5iUwC0o/1Zlfyyhuo3wZveXoOisb8njHvxQV6RYW9itcNvS3wo1rvqVN3mzHPn1U2c1c
 MR757t2vb48QuCHnEkRRmQOUqWeQx1R6ZlhUcKOltnks/isrq0ROlazjib5Bwa7jlk0A
 14SHnci70YH+XdDEQVMQ6hnmZrBiGyrcdSD8mPbi34vVQIo5weGhiKiJflrVBxYaXUl0
 fP2A==
X-Gm-Message-State: AOAM530HJB4fm0K3acoiRN7flQSYVSBgzpfEGD7MqThYcP2fnt27y//j
 kOFUJ8oHhBWUcdLcELcVM+xs2g3AkHTFptGi1HowRPYc
X-Google-Smtp-Source: ABdhPJxUIfN2lHDZaf7SgPzxhNgXzRrsZPczW1Q1BqincwdoDDaOzKU4k7U3HtC4liRLR52IpG083mgpLvk2VGb8G+M=
X-Received: by 2002:adf:e7c3:: with SMTP id e3mr25021232wrn.356.1595938214316; 
 Tue, 28 Jul 2020 05:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <a08d725612aac35f30b3c422d3617bc4c733d8c7.1595838303.git.zong.li@sifive.com>
 <CAAhSdy2gSVZcvx0jVgEC7BGDwix62JCVvZeR5-vGWT7MRwf=AA@mail.gmail.com>
 <CANXhq0rBWByF5PxxuctCyM-UUOa3CgQVdxp8xVXUGLjq0Qx5gA@mail.gmail.com>
 <CAAhSdy1TKf4CidGR9pOB29iPuV6hPKr=n7gt=s==v8pu8m8a=Q@mail.gmail.com>
 <CANXhq0oJ9pMnVHfx25yZMJo3yThAZRix_8=BWEo_diNfxxdugQ@mail.gmail.com>
In-Reply-To: <CANXhq0oJ9pMnVHfx25yZMJo3yThAZRix_8=BWEo_diNfxxdugQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Jul 2020 17:40:02 +0530
Message-ID: <CAAhSdy2BrAXLbv3tgj3U58ZshMFW6VCRG9-AJV5u8HUyuCw5Uw@mail.gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: riscv: Add YAML documentation for PMU
To: Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_081016_541038_BF15727A 
X-CRM114-Status: GOOD (  47.42  )
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

On Tue, Jul 28, 2020 at 9:38 AM Zong Li <zong.li@sifive.com> wrote:
>
> On Tue, Jul 28, 2020 at 11:27 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Tue, Jul 28, 2020 at 8:35 AM Zong Li <zong.li@sifive.com> wrote:
> > >
> > > On Mon, Jul 27, 2020 at 9:13 PM Anup Patel <anup@brainfault.org> wrote:
> > > >
> > > > On Mon, Jul 27, 2020 at 1:57 PM Zong Li <zong.li@sifive.com> wrote:
> > > > >
> > > > > Add device tree bindings for performance monitor unit. It passes the
> > > > > dt_binding_check verification.
> > > > >
> > > > > Signed-off-by: Zong Li <zong.li@sifive.com>
> > > > > ---
> > > > >  .../devicetree/bindings/riscv/pmu.yaml        | 71 +++++++++++++++++++
> > > > >  1 file changed, 71 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/riscv/pmu.yaml b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..0c49039a5d3b
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > > > > @@ -0,0 +1,71 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/riscv/pmu.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: RISC-V Performance Monitor Units
> > > > > +
> > > > > +maintainers:
> > > > > +  - Zong Li <zong.li@sifive.com>
> > > > > +  - Paul Walmsley <paul.walmsley@sifive.com>
> > > > > +  - Palmer Dabbelt <palmer@dabbelt.com>
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    items:
> > > > > +      - const: riscv,pmu
> > > > > +
> > > > > +  riscv,width-hpmcntr:
> > > > > +    description: The width of hpmcounter CSRs. Default is 64.
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +
> > > > > +  riscv,n-hpmcntr:
> > > > > +    description: The number of hpmcounter CSRs. Default is zero.
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +
> > > > > +  riscv,hw-event-map:
> > > > > +    description: The mapping of generic hardware events to values of hpmcounter.
> > > > > +      The key is the encoding of generic hardware events, and the value is the
> > > > > +      actual value which is implemented by platform. If there is no a key-value
> > > > > +      pair for specific generic hardware event, view the generic hardware event
> > > > > +      as not supported. CYCLE and INSTRET be mapped by default, so we shouldn't
> > > > > +      list PERF_COUNT_HW_CPU_CYCLES and PERF_COUNT_HW_INSTRUCTIONS here.
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > > +
> > > > > +  riscv,hw-cache-event-map:
> > > > > +    description: The mapping of generic hardware cache events to values of
> > > > > +      hpmcounter. The key is encoding of generic hardware cache events, and the
> > > > > +      value is the actual value which is implemented by platform. If there is no
> > > > > +      a key-value pair for specific generic hardware cache event, view the
> > > > > +      generic hardware cache event as not supported.
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > > +
> > > > > +  riscv,hpmcntr-of-event:
> > > > > +    description: The mapping of platform hardware events to allowed hmpcounters.
> > > > > +      The key is the platform hardware event, and the value is the bitmap for
> > > > > +      hmpcounters which support this event. If there is no a key-value pair for
> > > > > +      specific platform hardware events, view the platform hardware events as
> > > > > +      supported by all hpmcounters.
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > > +
> > > > > +required:
> > > > > +  - compatible
> > > > > +
> > > > > +additionalProperties: false
> > > > > +
> > > > > +examples:
> > > > > +  - |
> > > > > +    pmu {
> > > > > +      compatible = "riscv,pmu";
> > > > > +      riscv,width-hpmcntr = <40>;
> > > > > +      riscv,n-hpmcntr = <2>;
> > > > > +      riscv,hw-event-map = <0x3 0x0202
> > > > > +                            0x4 0x4000>;
> > > > > +      riscv,hw-cache-event-map = <0x010201 0x0102
> > > > > +                                  0x010204 0x0802>;
> > > > > +      riscv,hpmcntr-of-event = <0x100 0x18
> > > > > +                                0x400 0x10>;
> > > > > +    };
> > > > > +
> > > > > +...
> > > > > --
> > > > > 2.27.0
> > > > >
> > > >
> > > > I don't see the point of sending DT bindings documents
> > > > until the SBI PMU extension is defined and accepted
> > > > by everyone.
> > > >
> > >
> > > It seems to me that it doesn't conflict with the SBI PMU extension.
> > > SBI PMU extension is the interface for communication with the lower
> > > privilege levels, we still can come out the DT in parallel, and make
> > > sure what information is needed by m-mode firmware. OTOH, we also need
> > > a Linux driver which has to parse the dtb when we build Linux as nommu
> > > and run it on m-mode privilege, so if we could define the DT for PMU
> > > node, we can go the driver for nommu first (the implementation would
> > > also consider HW counter, SW counter together). I think you have got
> > > the picture about m-mode firmware, it would be great to start to
> > > collect the idea of DT.
> >
> > The RISC-V PMU DT binding is not just for Linux. Even M-mode
> > runtime firmware (OpenSBI) will be using this binding.
> >
> > The DT bindings you are proposing is conflicting with the
> > expected RISC-V PMU DT bindings:
> > 1. The event-map should be mapping SBI PMU event_idx
> > to HARDWARE HPMEVENT value whereas this binding
> > defines event-map as mapping Linux perf event types to
> > HPMEVENT value.
>
> It is more suitable by using Linux perf event types directly here. On
> nommu Linux, it doesn't have additional m-mode firmware, so it doesn't
> have the rule like SMI PMU event_idx. Unless we apply the same rule in
> nommu pmu drivers as well, it doesn't need to translate the event_idx
> to Linux perf event types in Linux nommu driver.

This means you will end-up with a separate driver and binding
for NoMMU Linux as compared to S-mode Linux. The PMU DT
node for M-mode and S-mode will also look totally different.

For S-mode case, we only need compatible string and optional
interrupts DT property.

>
> > 2. Each HPMCOUNTER can support a different set of events
> > so this DT bindings won't work for it.
>
> There is a property "riscv,hpmcntr-of-event" to indicate which
> counters can serve the specific event, if we don't list the particular
> event in this property, we view this event could be served by all
> counters.

The name of this property is totally misleading.

>
> > 3. The SBI PMU driver can have optional edge-triggered
> > per-HART interrupts for overflow detection. This DT bindings
> > does not consider this as well.
> >
>
> We don't have an overflow interrupt mechanism in RISC-V spec now, we
> should postpone and add the properties of interrupt stuff after the
> mechanism is standardized.

I totally disagree. The RISC-V spec does not prevent any RISC-V
implementation from having per-HART edge triggered interrupts
which are routed through PLIC.

(Please see the discussion on RISC-V privilege mailing list).

That's why RISC-V PMU DT bindings should have an optional
interrupts DT property.

>
> > The SBI PMU event_idx definition is not yet finalized. Please
> > wait for SBI PMU extension to be finalized.
> >
>
> As I mentioned above, it need to be discussed whether we should do id
> translation in Linux nommu driver.

All this implies that you want two separate drivers, bindings and DT
nodes for M-mode and S-mode cases.

I disagree with this approach. This will lead to a lot of duplication
and confusion.

Better approach would be to have SBI PMU event_idx to HPMEVENT
CSR value mappings in the DT properties. For M-mode (NoMMU) linux,
we convert the Linux perf event to SBI PMU event_idx and then to the
HPMEVENT value using event-map. For S-mode (MMU) linux, we can
convert the Linux perf event to the SBI PMU event_idx and then use
this SBI PMU event_idx with SBI_PMU_SET_EVENT call.

The optional interrupts DT property should be available in both M-mode
(NoMMU) and S-mode cases so that RISC-V implementation can at
least provide edge-triggered per-HART interrupts which are routed
through PLIC.

Please wait for the SBI PMU extension to be finalized. Once it is
finalized, we can come-up with a common RISC-V PMU driver which
works for both M-mode (NoMMU) Linux and S-mode Linux.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
