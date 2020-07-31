Return-Path: <SRS0=O7qi=BK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DF5C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2020 09:44:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C45BD20829
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2020 09:44:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tLvb8h2s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="ESf1W651"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C45BD20829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5JupHNa/QuGpXjW1fG4B4h9p4KFlpzDohmeXMyj5GBQ=; b=tLvb8h2sGEWqUlmJk2wnIc50x
	8c8uGIRZ3aa/eREW7orybeiXQwf28jNdGUrkwdSrTKZxBlCfOZBJWxKTcrchn2SB3m/iUm/o0Cb9J
	N3BNP2EoSHjSMdIDPpNonGEvdYTaVxTi284Aw5qoJ9Z6E3u/n+o8qLP8as+VTMCwiNQfCcbi0S6lf
	pMKT+NMCzvVSGA7Mk4ZWDO3fMOwkjPWKqKY1Phcbm5SLkaCTqpRi0CTtMWt6kRU3vo/cCRAW7iL7P
	q5hKwG8KhLMHJhrO3eNua43lIqKaYzj+jHF1wtl1th9j2v1AHFEkmavSd7YYq07C7q5RLzRaOd8zm
	1aeXUeyQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1RaY-0003Ws-9c; Fri, 31 Jul 2020 09:44:30 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1RaV-0003Ue-1K
 for linux-riscv@lists.infradead.org; Fri, 31 Jul 2020 09:44:28 +0000
Received: by mail-wr1-x441.google.com with SMTP id r12so27350530wrj.13
 for <linux-riscv@lists.infradead.org>; Fri, 31 Jul 2020 02:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g6XCInppQ4hAyrEImIpQA4KD04+A7IbOsURFL+RrBCA=;
 b=ESf1W651uZ0IWGmVUDMpqq79lA12C8LewiCBE9/zCSYa0Fk411h5s4KeJEtQWzpLP5
 RQxFZ1ttezfbUfkYfYSyvWH+3TMR6ESE0PgoUo7VbNrta/3M6msD24R3Zu32wneold9m
 bwvy4PyzofK3wdjlTei9u2gaJOYMNQML+de0aUKAwTr5LVium502OOQTCbRmW9j7RTnd
 isElkeDdWGV1xsDuS9hMP7HOmuTZp2e7HJttPAKVibDfdNM2XAvm+z2pViexkAcy7BYu
 Z5W9NZyYnWhAAmHlNdASGMhojHfonUxbTNRUOrfVAwoa4IoI60VEUx7cdx9cibcofrrD
 iH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g6XCInppQ4hAyrEImIpQA4KD04+A7IbOsURFL+RrBCA=;
 b=B/Wx+qMzcSnS1eWLYk3QdzWKRULA/SlmPuzeuCF6aYMpyvNxX757bVr43AktAi534S
 mhAg+MV4/JloIF6mtmn2wM6Eb8pjD66sTV0LLrg3aZwd0oUH2yZUw2yUn/0UXXNZo1kg
 Kb6wsswhxLK6U4mmytONE/Jj2gOfOQbc7fW9AEmyb6f2kCYaiQeSxCSfYqW3GZNGazuz
 3bL4jNt1Tai6vVot0VQY7URx+w6aiJzwRuntJqy8arPLcmpRshvTawa1kNPectNiQF/C
 UaQdUYOvdUooqXmh++L7j01KYXO08Yw3GsbD7Dq7LPx+2wO0J8QvTlBLoNxjrJycDRj3
 POnw==
X-Gm-Message-State: AOAM530ZEKSw9dmaVluxi5mp+1sFGOND7TJT20eeq+bNoUKigNHJ3Gkz
 p+eVKaquBUnStwO19hVw99wTiT0YerWhNXGABTIqtw==
X-Google-Smtp-Source: ABdhPJzqzWWboLVNWykF/RkCrGtdznOCbCBfr6cIlDPEg4l1E66wtQwA9Ue2S9N/7KsHMcp5Ic262Peadlaw1doGEa0=
X-Received: by 2002:adf:f247:: with SMTP id b7mr2920218wrp.128.1596188664034; 
 Fri, 31 Jul 2020 02:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <a08d725612aac35f30b3c422d3617bc4c733d8c7.1595838303.git.zong.li@sifive.com>
 <CAAhSdy2gSVZcvx0jVgEC7BGDwix62JCVvZeR5-vGWT7MRwf=AA@mail.gmail.com>
 <CANXhq0rBWByF5PxxuctCyM-UUOa3CgQVdxp8xVXUGLjq0Qx5gA@mail.gmail.com>
 <CAAhSdy1TKf4CidGR9pOB29iPuV6hPKr=n7gt=s==v8pu8m8a=Q@mail.gmail.com>
 <CANXhq0oJ9pMnVHfx25yZMJo3yThAZRix_8=BWEo_diNfxxdugQ@mail.gmail.com>
 <CAAhSdy2BrAXLbv3tgj3U58ZshMFW6VCRG9-AJV5u8HUyuCw5Uw@mail.gmail.com>
 <CANXhq0qLM-9ijY=97w3GKL+M777r=T5JBNrS26PTMBGgfvpmKg@mail.gmail.com>
In-Reply-To: <CANXhq0qLM-9ijY=97w3GKL+M777r=T5JBNrS26PTMBGgfvpmKg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 31 Jul 2020 15:14:12 +0530
Message-ID: <CAAhSdy01rbGjw-Euhjt5UyUukP9-DYDZWg++pRozP3ZOGBgH3w@mail.gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: riscv: Add YAML documentation for PMU
To: Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_054427_248038_9942EDAD 
X-CRM114-Status: GOOD (  60.35  )
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

On Thu, Jul 30, 2020 at 11:23 AM Zong Li <zong.li@sifive.com> wrote:
>
> On Tue, Jul 28, 2020 at 8:10 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Tue, Jul 28, 2020 at 9:38 AM Zong Li <zong.li@sifive.com> wrote:
> > >
> > > On Tue, Jul 28, 2020 at 11:27 AM Anup Patel <anup@brainfault.org> wrote:
> > > >
> > > > On Tue, Jul 28, 2020 at 8:35 AM Zong Li <zong.li@sifive.com> wrote:
> > > > >
> > > > > On Mon, Jul 27, 2020 at 9:13 PM Anup Patel <anup@brainfault.org> wrote:
> > > > > >
> > > > > > On Mon, Jul 27, 2020 at 1:57 PM Zong Li <zong.li@sifive.com> wrote:
> > > > > > >
> > > > > > > Add device tree bindings for performance monitor unit. It passes the
> > > > > > > dt_binding_check verification.
> > > > > > >
> > > > > > > Signed-off-by: Zong Li <zong.li@sifive.com>
> > > > > > > ---
> > > > > > >  .../devicetree/bindings/riscv/pmu.yaml        | 71 +++++++++++++++++++
> > > > > > >  1 file changed, 71 insertions(+)
> > > > > > >  create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/riscv/pmu.yaml b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..0c49039a5d3b
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > > > > > > @@ -0,0 +1,71 @@
> > > > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: http://devicetree.org/schemas/riscv/pmu.yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: RISC-V Performance Monitor Units
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Zong Li <zong.li@sifive.com>
> > > > > > > +  - Paul Walmsley <paul.walmsley@sifive.com>
> > > > > > > +  - Palmer Dabbelt <palmer@dabbelt.com>
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    items:
> > > > > > > +      - const: riscv,pmu
> > > > > > > +
> > > > > > > +  riscv,width-hpmcntr:
> > > > > > > +    description: The width of hpmcounter CSRs. Default is 64.
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > > +
> > > > > > > +  riscv,n-hpmcntr:
> > > > > > > +    description: The number of hpmcounter CSRs. Default is zero.
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > > +
> > > > > > > +  riscv,hw-event-map:
> > > > > > > +    description: The mapping of generic hardware events to values of hpmcounter.
> > > > > > > +      The key is the encoding of generic hardware events, and the value is the
> > > > > > > +      actual value which is implemented by platform. If there is no a key-value
> > > > > > > +      pair for specific generic hardware event, view the generic hardware event
> > > > > > > +      as not supported. CYCLE and INSTRET be mapped by default, so we shouldn't
> > > > > > > +      list PERF_COUNT_HW_CPU_CYCLES and PERF_COUNT_HW_INSTRUCTIONS here.
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > > > > +
> > > > > > > +  riscv,hw-cache-event-map:
> > > > > > > +    description: The mapping of generic hardware cache events to values of
> > > > > > > +      hpmcounter. The key is encoding of generic hardware cache events, and the
> > > > > > > +      value is the actual value which is implemented by platform. If there is no
> > > > > > > +      a key-value pair for specific generic hardware cache event, view the
> > > > > > > +      generic hardware cache event as not supported.
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > > > > +
> > > > > > > +  riscv,hpmcntr-of-event:
> > > > > > > +    description: The mapping of platform hardware events to allowed hmpcounters.
> > > > > > > +      The key is the platform hardware event, and the value is the bitmap for
> > > > > > > +      hmpcounters which support this event. If there is no a key-value pair for
> > > > > > > +      specific platform hardware events, view the platform hardware events as
> > > > > > > +      supported by all hpmcounters.
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > > > > +
> > > > > > > +required:
> > > > > > > +  - compatible
> > > > > > > +
> > > > > > > +additionalProperties: false
> > > > > > > +
> > > > > > > +examples:
> > > > > > > +  - |
> > > > > > > +    pmu {
> > > > > > > +      compatible = "riscv,pmu";
> > > > > > > +      riscv,width-hpmcntr = <40>;
> > > > > > > +      riscv,n-hpmcntr = <2>;
> > > > > > > +      riscv,hw-event-map = <0x3 0x0202
> > > > > > > +                            0x4 0x4000>;
> > > > > > > +      riscv,hw-cache-event-map = <0x010201 0x0102
> > > > > > > +                                  0x010204 0x0802>;
> > > > > > > +      riscv,hpmcntr-of-event = <0x100 0x18
> > > > > > > +                                0x400 0x10>;
> > > > > > > +    };
> > > > > > > +
> > > > > > > +...
> > > > > > > --
> > > > > > > 2.27.0
> > > > > > >
> > > > > >
> > > > > > I don't see the point of sending DT bindings documents
> > > > > > until the SBI PMU extension is defined and accepted
> > > > > > by everyone.
> > > > > >
> > > > >
> > > > > It seems to me that it doesn't conflict with the SBI PMU extension.
> > > > > SBI PMU extension is the interface for communication with the lower
> > > > > privilege levels, we still can come out the DT in parallel, and make
> > > > > sure what information is needed by m-mode firmware. OTOH, we also need
> > > > > a Linux driver which has to parse the dtb when we build Linux as nommu
> > > > > and run it on m-mode privilege, so if we could define the DT for PMU
> > > > > node, we can go the driver for nommu first (the implementation would
> > > > > also consider HW counter, SW counter together). I think you have got
> > > > > the picture about m-mode firmware, it would be great to start to
> > > > > collect the idea of DT.
> > > >
> > > > The RISC-V PMU DT binding is not just for Linux. Even M-mode
> > > > runtime firmware (OpenSBI) will be using this binding.
> > > >
> > > > The DT bindings you are proposing is conflicting with the
> > > > expected RISC-V PMU DT bindings:
> > > > 1. The event-map should be mapping SBI PMU event_idx
> > > > to HARDWARE HPMEVENT value whereas this binding
> > > > defines event-map as mapping Linux perf event types to
> > > > HPMEVENT value.
> > >
> > > It is more suitable by using Linux perf event types directly here. On
> > > nommu Linux, it doesn't have additional m-mode firmware, so it doesn't
> > > have the rule like SMI PMU event_idx. Unless we apply the same rule in
> > > nommu pmu drivers as well, it doesn't need to translate the event_idx
> > > to Linux perf event types in Linux nommu driver.
> >
> > This means you will end-up with a separate driver and binding
> > for NoMMU Linux as compared to S-mode Linux. The PMU DT
> > node for M-mode and S-mode will also look totally different.
>
> No, we would have only one driver. The initial idea is that we
> separate the implementation for HW counter, SW counter and nommu
> respectively, they could register callback functions to the main perf
> driver. Ideally, I hope we can have only one binding for m-mode and
> s-mode, these properties are optional, so in the s-mode case, we don't
> need to give the properties which are needed by m-mode.

Let's focus on only one DT binding and driver for RISC-V PMU which
will work for both M-mode and S-mode.

In future, DT bindings document can clearly state that for event-map
properties are only for NoMMU (i.e. M-mode) Linux.

>
> >
> > For S-mode case, we only need compatible string and optional
> > interrupts DT property.
> >
> > >
> > > > 2. Each HPMCOUNTER can support a different set of events
> > > > so this DT bindings won't work for it.
> > >
> > > There is a property "riscv,hpmcntr-of-event" to indicate which
> > > counters can serve the specific event, if we don't list the particular
> > > event in this property, we view this event could be served by all
> > > counters.
> >
> > The name of this property is totally misleading.
>
> Yes, I also struggled with the name for it, welcome to improve it if
> you have a good idea.
>
> >
> > >
> > > > 3. The SBI PMU driver can have optional edge-triggered
> > > > per-HART interrupts for overflow detection. This DT bindings
> > > > does not consider this as well.
> > > >
> > >
> > > We don't have an overflow interrupt mechanism in RISC-V spec now, we
> > > should postpone and add the properties of interrupt stuff after the
> > > mechanism is standardized.
> >
> > I totally disagree. The RISC-V spec does not prevent any RISC-V
> > implementation from having per-HART edge triggered interrupts
> > which are routed through PLIC.
> >
>
> Yes, I know, my point is that we don't have a standard way to
> implement overflow interrupt mechanism for PMU yet, it is being
> discussed, so even through we give the interrupt properties, it
> doesn't seem to be used for current driver.

Based on discussions on RISC-V privilege mailing list, it seems
we won't have major changes in current PMU CSRs. Mostly
one optional hpmoverflow CSR would be added to handle
overflow interrupts.

This means the RISC-V PMU driver will certainly need an optional
interrupts property.

The RISC-V PMU driver is now gated by SBI PMU extension
and improved PMU support in RISC-V privilege spec.

>
> > (Please see the discussion on RISC-V privilege mailing list).
> >
> > That's why RISC-V PMU DT bindings should have an optional
> > interrupts DT property.
> >
> > >
> > > > The SBI PMU event_idx definition is not yet finalized. Please
> > > > wait for SBI PMU extension to be finalized.
> > > >
> > >
> > > As I mentioned above, it need to be discussed whether we should do id
> > > translation in Linux nommu driver.
> >
> > All this implies that you want two separate drivers, bindings and DT
> > nodes for M-mode and S-mode cases.
>
> No, I hope we only have one driver and one binding, so we should come
> out a common way for them.
>
> >
> > I disagree with this approach. This will lead to a lot of duplication
> > and confusion.
> >
> > Better approach would be to have SBI PMU event_idx to HPMEVENT
> > CSR value mappings in the DT properties. For M-mode (NoMMU) linux,
> > we convert the Linux perf event to SBI PMU event_idx and then to the
> > HPMEVENT value using event-map. For S-mode (MMU) linux, we can
> > convert the Linux perf event to the SBI PMU event_idx and then use
> > this SBI PMU event_idx with SBI_PMU_SET_EVENT call.
>
> It is trade off, we can let m-mode driver convert the event between
> SBI event_idx and Linux perf event, we also can let opensbi convert
> the event between Linux perf event and SBI event_idx, But I think your
> approach is also good to me, because we can make s-mode and m-mode
> driver use identical way to get the actual value of hpmcounter, even
> m-mode driver doesn't need to give an abstract level for SBI PMU
> event_idx

I think having HW event to SBI event_idx mapping in DT bindings is
the way to go because this will avoid making DT bindings Linux specific
and other OSes (e.g. FreeBSD) can also use the same DT bindings.

>
> >
> > The optional interrupts DT property should be available in both M-mode
> > (NoMMU) and S-mode cases so that RISC-V implementation can at
> > least provide edge-triggered per-HART interrupts which are routed
> > through PLIC.
> >
> > Please wait for the SBI PMU extension to be finalized. Once it is
> > finalized, we can come-up with a common RISC-V PMU driver which
> > works for both M-mode (NoMMU) Linux and S-mode Linux.
> >
>
> Ok, fine, though I think DT and SBI PMU extension can be in parallel,
> let's postpone the DT definition.

We will try to close the SBI PMU extension sooner. Even if SBI v0.3 spe
release with SBI PMU extension happens much later. The OpenSBI PMU
extension efforts are also gated on SBI PMU extension.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
