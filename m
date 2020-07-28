Return-Path: <SRS0=Fr2v=BH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78CC3C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 03:27:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F92B2072E
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 03:27:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gzGfT5Kz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="SePSrIoi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F92B2072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1boJtkrR2aHXmj4fC/o09U1z1tml9/YvOMeGXHQ5Jro=; b=gzGfT5Kzws9iBEC2gkwZqDYIR
	by22gZ1f0Nh6eRH9A78vuF5T6qKhVXgu20feqfQrBBFaQRqbQ0z/Nf7/16cY9xX82WJShhTy83IdX
	9w05TQN0BRVSpVojSTFeAA9rsUpzAMvCeRhXeTIlsDtsDG8bv2f7qSsofTeeLgcBQ2jEMs6mWXqVD
	0IYSeMDUqLoFy1r+kdsKT/6YikvlNL3nZgedJGO0anEButKGXZBN8ZeE6QmI4g5orRCEW0JE/G21D
	esx7bD0JIj5Vwtfy5lnD3Lm+KNOV19AUUEbG8Nu7jWrYtJQUDAYrkS6gpb/IisBHDR9XWefYhwvdP
	DejxG2jnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0GGx-0002t3-N6; Tue, 28 Jul 2020 03:27:23 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0GGu-0002sZ-Cv
 for linux-riscv@lists.infradead.org; Tue, 28 Jul 2020 03:27:21 +0000
Received: by mail-wr1-x443.google.com with SMTP id r2so11710411wrs.8
 for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2020 20:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rmjHfcCVZCRWvKHYGzBCG0XjLTdENRQeAttTcWoSs1M=;
 b=SePSrIoi9boiynoNnozxQAzCERlWY+fNloo7z/krozRvfodK+V3JOr1+l9CCUXx+Ck
 D07BC+K6aa5l3hOpiTJeVzpYh1U0xcvrE2AKN94s+h1Vau35KMAseqdISOit+8D7Sz+K
 ajw4//eQehnD/ntUBU3jIbjdj0JySk9iQZwiggZix6Ocqmg0HtfvmYtXea+gaa1UVqFj
 D66kxchl92lHak4Yv81P5N5TaviGj5lFQ7LpVckdZZSOObO3TKOe5xP43tmYvfu7KYAW
 zEK2s8207P+mar9FIivvbRzt4Z7jsLZFOWDoGRrnhA67qVBEYRIQZAeidayfOw1fR9ay
 LrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rmjHfcCVZCRWvKHYGzBCG0XjLTdENRQeAttTcWoSs1M=;
 b=Kvpy8KaRq1hKbJ0l0f03cNNHcew7vQA8Bx3HwsFZUywYjHY+Dyt8rhmADVb11zVcR0
 pR+hg7bu+YKr9wJf7BBciEJIMTa86957PjQrDf03WTnRkW8RTBag4/X43hKTP2slUGzJ
 Try3gQi2HCRIsMDjjI3J+JXC5+AdYNPdUBj+neh0aYJ8mkOSBv4U5ONF0huetERbGwTZ
 +DX+cenrzRG39ZXObwzVL8mKMnEZCslI72fscQG4yUpX+K1naiuXi2qqVXCMWzvWTBGA
 ZjdMN12DRK/afsb/JIyz32e79F0OUCG4iPI3rHeWjDkVAbhQV/5CRRmnmlz4yvj+yGJD
 HNhw==
X-Gm-Message-State: AOAM533ktTeqHGIVbKuq9jSOnYNY8SGRgvYi0QSZIuBlJ0Z+FcFBl+kO
 J2qD1zWZPyjxLMeymBxeU6tRCxGurHXEKy06NGiKsx3K
X-Google-Smtp-Source: ABdhPJz/hGkYVUBwwiEVrKtu0/zgfjyPxEjyNgxmtUptOXjuT/BH+k8KYm09pz164lu3BBlntQ4L3DY6po7CvmK5C2g=
X-Received: by 2002:adf:f186:: with SMTP id h6mr23283462wro.144.1595906838381; 
 Mon, 27 Jul 2020 20:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <a08d725612aac35f30b3c422d3617bc4c733d8c7.1595838303.git.zong.li@sifive.com>
 <CAAhSdy2gSVZcvx0jVgEC7BGDwix62JCVvZeR5-vGWT7MRwf=AA@mail.gmail.com>
 <CANXhq0rBWByF5PxxuctCyM-UUOa3CgQVdxp8xVXUGLjq0Qx5gA@mail.gmail.com>
In-Reply-To: <CANXhq0rBWByF5PxxuctCyM-UUOa3CgQVdxp8xVXUGLjq0Qx5gA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Jul 2020 08:57:05 +0530
Message-ID: <CAAhSdy1TKf4CidGR9pOB29iPuV6hPKr=n7gt=s==v8pu8m8a=Q@mail.gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: riscv: Add YAML documentation for PMU
To: Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_232720_569151_7BD65D94 
X-CRM114-Status: GOOD (  35.12  )
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

On Tue, Jul 28, 2020 at 8:35 AM Zong Li <zong.li@sifive.com> wrote:
>
> On Mon, Jul 27, 2020 at 9:13 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Mon, Jul 27, 2020 at 1:57 PM Zong Li <zong.li@sifive.com> wrote:
> > >
> > > Add device tree bindings for performance monitor unit. It passes the
> > > dt_binding_check verification.
> > >
> > > Signed-off-by: Zong Li <zong.li@sifive.com>
> > > ---
> > >  .../devicetree/bindings/riscv/pmu.yaml        | 71 +++++++++++++++++++
> > >  1 file changed, 71 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/pmu.yaml b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > > new file mode 100644
> > > index 000000000000..0c49039a5d3b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > > @@ -0,0 +1,71 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/riscv/pmu.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: RISC-V Performance Monitor Units
> > > +
> > > +maintainers:
> > > +  - Zong Li <zong.li@sifive.com>
> > > +  - Paul Walmsley <paul.walmsley@sifive.com>
> > > +  - Palmer Dabbelt <palmer@dabbelt.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: riscv,pmu
> > > +
> > > +  riscv,width-hpmcntr:
> > > +    description: The width of hpmcounter CSRs. Default is 64.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +
> > > +  riscv,n-hpmcntr:
> > > +    description: The number of hpmcounter CSRs. Default is zero.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +
> > > +  riscv,hw-event-map:
> > > +    description: The mapping of generic hardware events to values of hpmcounter.
> > > +      The key is the encoding of generic hardware events, and the value is the
> > > +      actual value which is implemented by platform. If there is no a key-value
> > > +      pair for specific generic hardware event, view the generic hardware event
> > > +      as not supported. CYCLE and INSTRET be mapped by default, so we shouldn't
> > > +      list PERF_COUNT_HW_CPU_CYCLES and PERF_COUNT_HW_INSTRUCTIONS here.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +
> > > +  riscv,hw-cache-event-map:
> > > +    description: The mapping of generic hardware cache events to values of
> > > +      hpmcounter. The key is encoding of generic hardware cache events, and the
> > > +      value is the actual value which is implemented by platform. If there is no
> > > +      a key-value pair for specific generic hardware cache event, view the
> > > +      generic hardware cache event as not supported.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +
> > > +  riscv,hpmcntr-of-event:
> > > +    description: The mapping of platform hardware events to allowed hmpcounters.
> > > +      The key is the platform hardware event, and the value is the bitmap for
> > > +      hmpcounters which support this event. If there is no a key-value pair for
> > > +      specific platform hardware events, view the platform hardware events as
> > > +      supported by all hpmcounters.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +
> > > +required:
> > > +  - compatible
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    pmu {
> > > +      compatible = "riscv,pmu";
> > > +      riscv,width-hpmcntr = <40>;
> > > +      riscv,n-hpmcntr = <2>;
> > > +      riscv,hw-event-map = <0x3 0x0202
> > > +                            0x4 0x4000>;
> > > +      riscv,hw-cache-event-map = <0x010201 0x0102
> > > +                                  0x010204 0x0802>;
> > > +      riscv,hpmcntr-of-event = <0x100 0x18
> > > +                                0x400 0x10>;
> > > +    };
> > > +
> > > +...
> > > --
> > > 2.27.0
> > >
> >
> > I don't see the point of sending DT bindings documents
> > until the SBI PMU extension is defined and accepted
> > by everyone.
> >
>
> It seems to me that it doesn't conflict with the SBI PMU extension.
> SBI PMU extension is the interface for communication with the lower
> privilege levels, we still can come out the DT in parallel, and make
> sure what information is needed by m-mode firmware. OTOH, we also need
> a Linux driver which has to parse the dtb when we build Linux as nommu
> and run it on m-mode privilege, so if we could define the DT for PMU
> node, we can go the driver for nommu first (the implementation would
> also consider HW counter, SW counter together). I think you have got
> the picture about m-mode firmware, it would be great to start to
> collect the idea of DT.

The RISC-V PMU DT binding is not just for Linux. Even M-mode
runtime firmware (OpenSBI) will be using this binding.

The DT bindings you are proposing is conflicting with the
expected RISC-V PMU DT bindings:
1. The event-map should be mapping SBI PMU event_idx
to HARDWARE HPMEVENT value whereas this binding
defines event-map as mapping Linux perf event types to
HPMEVENT value.
2. Each HPMCOUNTER can support a different set of events
so this DT bindings won't work for it.
3. The SBI PMU driver can have optional edge-triggered
per-HART interrupts for overflow detection. This DT bindings
does not consider this as well.

The SBI PMU event_idx definition is not yet finalized. Please
wait for SBI PMU extension to be finalized.

Please avoid adding DT bindings without SBI PMU extension
being finalized.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
