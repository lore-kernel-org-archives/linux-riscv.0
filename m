Return-Path: <SRS0=Fr2v=BH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5F8C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 03:06:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06431207CD
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 03:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O42ClHJY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UudWTHLK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06431207CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=klawYSGgNR7UPDzIQ8TPEhnTfvwo6jNlHQwG9u8MkbM=; b=O42ClHJYHwTBwg0zBGKfyQ2Ma
	/wQsU2qZzJKYUI1PTeHk8eMng6ol4uP5p0o+4CogPmQW8kgZyQaLJmyroftT2C6fwZyCO+nnIqWAU
	v0b5ey6CE5iMP4kDPwm8tfgVdAxYh6JmyphWExDiupwK6Qn6FM+oYd02sbUtgpw9+ar+w4NXROooD
	W11Wv3VHphftBUbZXMDsk+abRi9JkuR0Dbgkud8FZQCXT/meeHvWPucMu3m5DiFDAIyaWI/akuNLZ
	+vmVLtvnknvEMUaZjsR1h/UdiFmrcPgcPB7qgMVFjakvtOSzFrWHWffIxdH8d+Yz4/8k2BCKSUIEV
	lLDdY9iCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0FwM-000893-Mi; Tue, 28 Jul 2020 03:06:06 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0FwE-00083N-3W
 for linux-riscv@lists.infradead.org; Tue, 28 Jul 2020 03:06:03 +0000
Received: by mail-ot1-x343.google.com with SMTP id o72so8311436ota.11
 for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2020 20:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3HHCJZLxmDPwmA/gcfaaBrHm3OmBoC06ozSzAZfM6z8=;
 b=UudWTHLKV5+M7mTjvBoHnx9nJw5khr6CWL5pqONh9U8dY+b32AIB3uqVpCISqvW7mp
 jmt8xzjiNDRZVjIYxKuaoGbNJPT/iHZ/qdcSihhBon2KxvDgssUZv4a+/lBBQzFaa97p
 7GJuJDmlOupci/ykFFc9Kgtpg8MW51AN2GvtK9A/Hs9wcXnNFZ8jAPjLDBi4H9SHA/5t
 VHNSDAQ7GJ6UbVZA1b5GH7vp4Le+/Pfu20/2EbOyiDdBlPY57KLzuNoYFplPbjIudH43
 uskNgUOp/tun1cS+BjmIvoQFqxNJU78QxXO3fApdR39VxTxxh91aktYNOAHVANncs9bb
 JfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3HHCJZLxmDPwmA/gcfaaBrHm3OmBoC06ozSzAZfM6z8=;
 b=hkgOkOZ6V/NWJK7h79TPxHaAD98Lrp3rfXV9WgxjYJZNYCRcMsWTNieDIuj61Clqg/
 dZ6+WaDDRmGZn7jAc5HP8ocvqIDS17CrFS82zxXI9FRWRvnHQGHvLaCfzGW2pYuBhInE
 TCeBCy6XkkjUkrEqKN9Su70Yyb3siI/cZbWvunLwusk1vk620+sJDJcJ7piJrALdntcA
 RJSO6e86g3ChpGqI7dBQQPby7oTh2LljrwoLF5u5HBgXiqnhaf/1D53kGB9Sh7IedItc
 0se373fp+V8UUYZ1RjUZmTwmWjk/kqyxJXvEmlLmWr7XFeyNJPsQHAgxtoPVmG6PU9oM
 ncEQ==
X-Gm-Message-State: AOAM530+9QzplEd08Vcv7lmvh9hwqJkYPu4aPbfVjBp6FHgOGaCHry6J
 1ogQWcFRCQ4H/8GFkSUWO5aS6r7mauWQGg2a1Wv56B25jlc=
X-Google-Smtp-Source: ABdhPJxViXYB7FOfUxf4sXx0NLCtAG78+H7WqQR2ivLbld4lqe+2jnm2z4CVgsD9FhJ73MKDlohnYUg8v4MB882Jtc0=
X-Received: by 2002:a9d:4002:: with SMTP id m2mr22948664ote.129.1595905553181; 
 Mon, 27 Jul 2020 20:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <a08d725612aac35f30b3c422d3617bc4c733d8c7.1595838303.git.zong.li@sifive.com>
 <CAAhSdy2gSVZcvx0jVgEC7BGDwix62JCVvZeR5-vGWT7MRwf=AA@mail.gmail.com>
In-Reply-To: <CAAhSdy2gSVZcvx0jVgEC7BGDwix62JCVvZeR5-vGWT7MRwf=AA@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 28 Jul 2020 11:05:44 +0800
Message-ID: <CANXhq0rBWByF5PxxuctCyM-UUOa3CgQVdxp8xVXUGLjq0Qx5gA@mail.gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: riscv: Add YAML documentation for PMU
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_230558_897346_D56A96ED 
X-CRM114-Status: GOOD (  31.11  )
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

On Mon, Jul 27, 2020 at 9:13 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Jul 27, 2020 at 1:57 PM Zong Li <zong.li@sifive.com> wrote:
> >
> > Add device tree bindings for performance monitor unit. It passes the
> > dt_binding_check verification.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  .../devicetree/bindings/riscv/pmu.yaml        | 71 +++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/pmu.yaml b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > new file mode 100644
> > index 000000000000..0c49039a5d3b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > @@ -0,0 +1,71 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/riscv/pmu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V Performance Monitor Units
> > +
> > +maintainers:
> > +  - Zong Li <zong.li@sifive.com>
> > +  - Paul Walmsley <paul.walmsley@sifive.com>
> > +  - Palmer Dabbelt <palmer@dabbelt.com>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: riscv,pmu
> > +
> > +  riscv,width-hpmcntr:
> > +    description: The width of hpmcounter CSRs. Default is 64.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  riscv,n-hpmcntr:
> > +    description: The number of hpmcounter CSRs. Default is zero.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  riscv,hw-event-map:
> > +    description: The mapping of generic hardware events to values of hpmcounter.
> > +      The key is the encoding of generic hardware events, and the value is the
> > +      actual value which is implemented by platform. If there is no a key-value
> > +      pair for specific generic hardware event, view the generic hardware event
> > +      as not supported. CYCLE and INSTRET be mapped by default, so we shouldn't
> > +      list PERF_COUNT_HW_CPU_CYCLES and PERF_COUNT_HW_INSTRUCTIONS here.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +  riscv,hw-cache-event-map:
> > +    description: The mapping of generic hardware cache events to values of
> > +      hpmcounter. The key is encoding of generic hardware cache events, and the
> > +      value is the actual value which is implemented by platform. If there is no
> > +      a key-value pair for specific generic hardware cache event, view the
> > +      generic hardware cache event as not supported.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +  riscv,hpmcntr-of-event:
> > +    description: The mapping of platform hardware events to allowed hmpcounters.
> > +      The key is the platform hardware event, and the value is the bitmap for
> > +      hmpcounters which support this event. If there is no a key-value pair for
> > +      specific platform hardware events, view the platform hardware events as
> > +      supported by all hpmcounters.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +required:
> > +  - compatible
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    pmu {
> > +      compatible = "riscv,pmu";
> > +      riscv,width-hpmcntr = <40>;
> > +      riscv,n-hpmcntr = <2>;
> > +      riscv,hw-event-map = <0x3 0x0202
> > +                            0x4 0x4000>;
> > +      riscv,hw-cache-event-map = <0x010201 0x0102
> > +                                  0x010204 0x0802>;
> > +      riscv,hpmcntr-of-event = <0x100 0x18
> > +                                0x400 0x10>;
> > +    };
> > +
> > +...
> > --
> > 2.27.0
> >
>
> I don't see the point of sending DT bindings documents
> until the SBI PMU extension is defined and accepted
> by everyone.
>

It seems to me that it doesn't conflict with the SBI PMU extension.
SBI PMU extension is the interface for communication with the lower
privilege levels, we still can come out the DT in parallel, and make
sure what information is needed by m-mode firmware. OTOH, we also need
a Linux driver which has to parse the dtb when we build Linux as nommu
and run it on m-mode privilege, so if we could define the DT for PMU
node, we can go the driver for nommu first (the implementation would
also consider HW counter, SW counter together). I think you have got
the picture about m-mode firmware, it would be great to start to
collect the idea of DT.

> Regards,
> Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
