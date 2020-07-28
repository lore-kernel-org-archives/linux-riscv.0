Return-Path: <SRS0=Fr2v=BH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21188C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 04:09:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E09E020714
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 04:09:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x6rU6muu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SYuVxD9f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E09E020714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fD2QsjjCDuYtDft1BR0ujv+9zYsB851/x9w7L/WuXY0=; b=x6rU6muuZuE5FnEynUZPjeIIM
	5bOHUtATW6rcRKpplyE1EtOb8LQl4pTWOhPpLn7kxKVL33Y0Yruktx26y0atPFahLULCocxaxiFC1
	QIXwMwuc7iouFlIc0G4EL3Un/xcB+QSrKZRf9CTpDYe86JQAOF8+wofbFlryqtw4PiENz05B1467V
	av9VB4DiGh+BG5amCqwIZaV0ddeoOXDHw9AFB5A1ga6DDwbeUtLmEvR4eTsU5zLqRWtQD6dzJbU5K
	SB0GtuprDii2y1YdKV4nL5Hfjhx6BOvrE7XxMy/Ui608eSQ5Du9quA1l1nkTJgFdH3HaKITqchzx3
	c+qBQaHcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0Gv1-0007TI-PQ; Tue, 28 Jul 2020 04:08:47 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0Guy-0007Sk-09
 for linux-riscv@lists.infradead.org; Tue, 28 Jul 2020 04:08:45 +0000
Received: by mail-oi1-x241.google.com with SMTP id 12so16317895oir.4
 for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2020 21:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=euTeqDKNAGSf6/X9fSvefbeZ7y0J+qB1d2te/nck8wI=;
 b=SYuVxD9fT1MVqQMPZnHxHxwYGh85zE9kk+m+CHBFgdOSxj4v5e1n0FpvPnSLO+uLbn
 LVz9SJx2NINDshka5VOSonPKtFsOf6P11+U4wdQrRIRkVeGINLKQLoQCTT8YJQdY0+k9
 cHJEgVDI8H2XXEr/JP51lgrRu8xsYeMkULWEJq1luc2XDjamNutZnv9OumYHgCTEwLpH
 M8w/iMPwtCoJUuh+hri35+g4gnnosi7YHz+jeE4kRdNqt6XkDERgHDV3PgOSipFDXRh/
 pK7QOc62j2yTgitEgW46NDadXY0OLHVqKfmoWNemdwzMZrLN6beBTRME9PTDhNsdDpRG
 S9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=euTeqDKNAGSf6/X9fSvefbeZ7y0J+qB1d2te/nck8wI=;
 b=CVRhtf6a/i401/4tgmJQGFQelcVH/Z9hbiZSGLhmqerqodH87n+Ham4XBQbhNULJOQ
 Aq1iP5hp6OkQU72z6xQpYBmFklLHAzo58zG4AOCTp/5CeCm31x6MXDzSNOmC+k5pyw5L
 B2GLDOgU3z/nuwFlA/vJ5ElBQaNtYvi0ecrnxBv91IHU2l64v95IBpWjWO1ByKE3ngmG
 2vdZPlOK+OlY8ugY651bfoLvQnXAiWDYuZaZZYWgbkSvNYc2FzMq0YWKhyVn5woBZNt7
 /WAGMHwRvGNb3KvsLD08aF4XG8DjEf4Cq/F+si6Zr5STbsSaIzzy0LCyH9CmEBm95ZZW
 0ARA==
X-Gm-Message-State: AOAM532sMwTTkpC174E3lsFX95Mt35Xny57Af7J9U2e4Sk6uPFjy+3un
 cDJHu6sSRGhp/iPt8encQu0RcWoC6jajpHRfqjGsi4cPVzM=
X-Google-Smtp-Source: ABdhPJwivUTBSKwfFvXA6FzaWR+sGQLpm591fM9jw5wIG1/52okR5NFzw7oNSVKzT8THEOxtjLWogt5W8C70OsMEuwM=
X-Received: by 2002:aca:7512:: with SMTP id q18mr1921514oic.116.1595909320125; 
 Mon, 27 Jul 2020 21:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <a08d725612aac35f30b3c422d3617bc4c733d8c7.1595838303.git.zong.li@sifive.com>
 <CAAhSdy2gSVZcvx0jVgEC7BGDwix62JCVvZeR5-vGWT7MRwf=AA@mail.gmail.com>
 <CANXhq0rBWByF5PxxuctCyM-UUOa3CgQVdxp8xVXUGLjq0Qx5gA@mail.gmail.com>
 <CAAhSdy1TKf4CidGR9pOB29iPuV6hPKr=n7gt=s==v8pu8m8a=Q@mail.gmail.com>
In-Reply-To: <CAAhSdy1TKf4CidGR9pOB29iPuV6hPKr=n7gt=s==v8pu8m8a=Q@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 28 Jul 2020 12:08:31 +0800
Message-ID: <CANXhq0oJ9pMnVHfx25yZMJo3yThAZRix_8=BWEo_diNfxxdugQ@mail.gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: riscv: Add YAML documentation for PMU
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_000844_339532_CC9C3F64 
X-CRM114-Status: GOOD (  41.08  )
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

On Tue, Jul 28, 2020 at 11:27 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Jul 28, 2020 at 8:35 AM Zong Li <zong.li@sifive.com> wrote:
> >
> > On Mon, Jul 27, 2020 at 9:13 PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Mon, Jul 27, 2020 at 1:57 PM Zong Li <zong.li@sifive.com> wrote:
> > > >
> > > > Add device tree bindings for performance monitor unit. It passes the
> > > > dt_binding_check verification.
> > > >
> > > > Signed-off-by: Zong Li <zong.li@sifive.com>
> > > > ---
> > > >  .../devicetree/bindings/riscv/pmu.yaml        | 71 +++++++++++++++++++
> > > >  1 file changed, 71 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/riscv/pmu.yaml b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > > > new file mode 100644
> > > > index 000000000000..0c49039a5d3b
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > > > @@ -0,0 +1,71 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/riscv/pmu.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: RISC-V Performance Monitor Units
> > > > +
> > > > +maintainers:
> > > > +  - Zong Li <zong.li@sifive.com>
> > > > +  - Paul Walmsley <paul.walmsley@sifive.com>
> > > > +  - Palmer Dabbelt <palmer@dabbelt.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - const: riscv,pmu
> > > > +
> > > > +  riscv,width-hpmcntr:
> > > > +    description: The width of hpmcounter CSRs. Default is 64.
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +
> > > > +  riscv,n-hpmcntr:
> > > > +    description: The number of hpmcounter CSRs. Default is zero.
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +
> > > > +  riscv,hw-event-map:
> > > > +    description: The mapping of generic hardware events to values of hpmcounter.
> > > > +      The key is the encoding of generic hardware events, and the value is the
> > > > +      actual value which is implemented by platform. If there is no a key-value
> > > > +      pair for specific generic hardware event, view the generic hardware event
> > > > +      as not supported. CYCLE and INSTRET be mapped by default, so we shouldn't
> > > > +      list PERF_COUNT_HW_CPU_CYCLES and PERF_COUNT_HW_INSTRUCTIONS here.
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +
> > > > +  riscv,hw-cache-event-map:
> > > > +    description: The mapping of generic hardware cache events to values of
> > > > +      hpmcounter. The key is encoding of generic hardware cache events, and the
> > > > +      value is the actual value which is implemented by platform. If there is no
> > > > +      a key-value pair for specific generic hardware cache event, view the
> > > > +      generic hardware cache event as not supported.
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +
> > > > +  riscv,hpmcntr-of-event:
> > > > +    description: The mapping of platform hardware events to allowed hmpcounters.
> > > > +      The key is the platform hardware event, and the value is the bitmap for
> > > > +      hmpcounters which support this event. If there is no a key-value pair for
> > > > +      specific platform hardware events, view the platform hardware events as
> > > > +      supported by all hpmcounters.
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    pmu {
> > > > +      compatible = "riscv,pmu";
> > > > +      riscv,width-hpmcntr = <40>;
> > > > +      riscv,n-hpmcntr = <2>;
> > > > +      riscv,hw-event-map = <0x3 0x0202
> > > > +                            0x4 0x4000>;
> > > > +      riscv,hw-cache-event-map = <0x010201 0x0102
> > > > +                                  0x010204 0x0802>;
> > > > +      riscv,hpmcntr-of-event = <0x100 0x18
> > > > +                                0x400 0x10>;
> > > > +    };
> > > > +
> > > > +...
> > > > --
> > > > 2.27.0
> > > >
> > >
> > > I don't see the point of sending DT bindings documents
> > > until the SBI PMU extension is defined and accepted
> > > by everyone.
> > >
> >
> > It seems to me that it doesn't conflict with the SBI PMU extension.
> > SBI PMU extension is the interface for communication with the lower
> > privilege levels, we still can come out the DT in parallel, and make
> > sure what information is needed by m-mode firmware. OTOH, we also need
> > a Linux driver which has to parse the dtb when we build Linux as nommu
> > and run it on m-mode privilege, so if we could define the DT for PMU
> > node, we can go the driver for nommu first (the implementation would
> > also consider HW counter, SW counter together). I think you have got
> > the picture about m-mode firmware, it would be great to start to
> > collect the idea of DT.
>
> The RISC-V PMU DT binding is not just for Linux. Even M-mode
> runtime firmware (OpenSBI) will be using this binding.
>
> The DT bindings you are proposing is conflicting with the
> expected RISC-V PMU DT bindings:
> 1. The event-map should be mapping SBI PMU event_idx
> to HARDWARE HPMEVENT value whereas this binding
> defines event-map as mapping Linux perf event types to
> HPMEVENT value.

It is more suitable by using Linux perf event types directly here. On
nommu Linux, it doesn't have additional m-mode firmware, so it doesn't
have the rule like SMI PMU event_idx. Unless we apply the same rule in
nommu pmu drivers as well, it doesn't need to translate the event_idx
to Linux perf event types in Linux nommu driver.

> 2. Each HPMCOUNTER can support a different set of events
> so this DT bindings won't work for it.

There is a property "riscv,hpmcntr-of-event" to indicate which
counters can serve the specific event, if we don't list the particular
event in this property, we view this event could be served by all
counters.

> 3. The SBI PMU driver can have optional edge-triggered
> per-HART interrupts for overflow detection. This DT bindings
> does not consider this as well.
>

We don't have an overflow interrupt mechanism in RISC-V spec now, we
should postpone and add the properties of interrupt stuff after the
mechanism is standardized.

> The SBI PMU event_idx definition is not yet finalized. Please
> wait for SBI PMU extension to be finalized.
>

As I mentioned above, it need to be discussed whether we should do id
translation in Linux nommu driver.

> Please avoid adding DT bindings without SBI PMU extension
> being finalized.
>
> Regards,
> Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
