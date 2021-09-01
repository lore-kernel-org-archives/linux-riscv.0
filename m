Return-Path: <SRS0=l+05=NX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE140C432BE
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Sep 2021 11:57:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9607A60F92
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Sep 2021 11:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9607A60F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ICVTDBhD3KPsbQbws3nd2hAQ3cf6QUCGuGDEkbxOT74=; b=XjWP71t5UqX+E6
	G88f0K2F5Uxjyjqt3ZFuctl8tEp11h799uf5n9pbdO5YIRk4gGeIxMj2L2ip57niefRfo4J2w+sLQ
	xqWgu1ZVxtERTyvveO/LX4ccwjrCjiauaoZoOsa7+2KfP/t2TArjbe8iNswLB+9zjEu6o/CppZsm1
	+on06sL3apmUiIE5fScZgtQw/RMM4qQXahIWw4SXQQx3hgIMp59IuCRWAajnR03BL1dvzmcXM8rqr
	CXRxTc8PjXNm6Mu+f9M88tLRrcSO9PIXW+s9JGM/VV06CPTao3vh1oz/ix2w/IDe45uI5NkxTSqNs
	VN9SLd52wJgNkCCii/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLOrD-005gpT-Lh; Wed, 01 Sep 2021 11:56:43 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLOr0-005goj-3P
 for linux-riscv@lists.infradead.org; Wed, 01 Sep 2021 11:56:34 +0000
Received: by mail-wr1-x42e.google.com with SMTP id u16so4096705wrn.5
 for <linux-riscv@lists.infradead.org>; Wed, 01 Sep 2021 04:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0azurFEdIj3ZC2ZbeqfiGR0BlWdPTBZ0eY7HkyWHa2Y=;
 b=ycqYpYprwv+8Vnwh7DpeornOkThIjfcXQU00tbtCKFpCHePBxPbNfxsWxS9+X/heuV
 0+M9LzyIXjixhFh+xNYeHX4rJ2kn6sngjiL1rWYJPrqlFyAFMcCtMRsp/8UrBiSs/eys
 x037ok1Hsh5ZoGocgpzEaOYXRCha8jvevbd7j+rToaPxjHC0axNKU8QGBvYlJeHROyLq
 8uMJTirpZ7uo8zhWmAroylNa6158dtdBkcyWFfo3QyPnuitMd+2mFw1B67ItQC5Ksncv
 vGpEOcCQ3o3ssY6fhd1bvaYu0c2D0EssflfbhkakAFm8UxPAWbRa+hOpBJSD8RCbVpZz
 /w0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0azurFEdIj3ZC2ZbeqfiGR0BlWdPTBZ0eY7HkyWHa2Y=;
 b=c+Yl16K7eLf8icp262qm+JvTQnTI2oMux8/ITG2iGf+DzeWYdE7io/JlGfPbrn/hI9
 sUZ07pX6ZsKQp2GL7dYH3jHiwLNAdHU1K5AQsK+2oVRXmkzEFpio9ioJbmEtY998phRI
 1gQ6eFeCEMCThwp6gzxnwTWpukVuujVXt6Be7SQRYo+BaaxEOGMoAjE6hYyoDbpPPj6I
 5VXmYQX+1sEHSudIzZoRjvOgMWb2F6LqD3z9L8o0KalCQS52HCIe40jZkLncNWS5Nljc
 xgj0t476ZQU1alp2/bW7wplGtuIOEz8iBx5fjfCley01jxv50B9H/Yif6lH9cK8bsVAj
 eFqg==
X-Gm-Message-State: AOAM532p1NFiDEtQeem7+Gn4hFphLIV0YPqMh7L2pBP7CVPOhPDx7snW
 YUK3vp+mGnGbHRR+VSHERf6ar+IYk2XoU6L1adVWtw==
X-Google-Smtp-Source: ABdhPJzRxVML9moiMgg+a03C/rFPY4kkvpXCjDbBd+shBLGf/JF/Hax8hkKGtVV6C2PckIB2I5y4IK/5UM0VeTmLVho=
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr38038230wrw.390.1630497387244; 
 Wed, 01 Sep 2021 04:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210830041729.237252-1-anup.patel@wdc.com>
 <20210830041729.237252-6-anup.patel@wdc.com>
 <YS7WTPRYJWnPu2ii@robh.at.kernel.org>
In-Reply-To: <YS7WTPRYJWnPu2ii@robh.at.kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 1 Sep 2021 17:26:16 +0530
Message-ID: <CAAhSdy1mttzt3_CnKc=xhpp5CKOEAasQVobTR-2L6Z26rstn+A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 05/11] dt-bindings: interrupt-controller: Add
 ACLINT MSWI and SSWI bindings
To: Rob Herring <robh@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, Bin Meng <bmeng.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_045630_228547_DE5E3DCC 
X-CRM114-Status: GOOD (  28.97  )
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

On Wed, Sep 1, 2021 at 6:54 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Aug 30, 2021 at 09:47:23AM +0530, Anup Patel wrote:
> > We add DT bindings documentation for the ACLINT MSWI and SSWI
> > devices found on RISC-V SOCs.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >  .../riscv,aclint-swi.yaml                     | 95 +++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> > new file mode 100644
> > index 000000000000..68563259ae24
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> > @@ -0,0 +1,95 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/riscv,aclint-swi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V ACLINT Software Interrupt Devices
> > +
> > +maintainers:
> > +  - Anup Patel <anup.patel@wdc.com>
> > +
> > +description:
> > +  RISC-V SOCs include an implementation of the M-level software interrupt
> > +  (MSWI) device and the S-level software interrupt (SSWI) device defined
> > +  in the RISC-V Advanced Core Local Interruptor (ACLINT) specification.
> > +
> > +  The ACLINT MSWI and SSWI devices are documented in the RISC-V ACLINT
> > +  specification located at
> > +  https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc.
> > +
> > +  The ACLINT MSWI and SSWI devices directly connect to the M-level and
> > +  S-level software interrupt lines of various HARTs (or CPUs) respectively
> > +  so the RISC-V per-HART (or per-CPU) local interrupt controller is the
> > +  parent interrupt controller for the ACLINT MSWI and SSWI devices.
> > +
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +        - enum:
> > +          - riscv,aclint-mswi
> > +
> > +      - items:
> > +        - enum:
> > +          - riscv,aclint-sswi
>
> All this can be just:
>
> enum:
>   - riscv,aclint-mswi
>   - riscv,aclint-sswi
>
> However...
>
> > +
> > +    description:
> > +      For ACLINT MSWI devices, it should be "riscv,aclint-mswi" OR
> > +      "<vendor>,<chip>-aclint-mswi".
> > +      For ACLINT SSWI devices, it should be "riscv,aclint-sswi" OR
> > +      "<vendor>,<chip>-aclint-sswi".
>
> s/OR/AND/
>
> There must be a compatible for the implementation. Unless RiscV
> implementations of specs are complete describing all clocks, power
> domains, resets, etc. and are quirk free.
>
> But don't write free form constraints...

It is possible that quite a few implementations (QEMU, FPGAs, and
other simulators) will not require implementation specific compatible
strings. Should we still mandate implementation specific compatible
strings in DTS for such cases?

I was not sure so I used "OR".

Regards,
Anup

>
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#interrupt-cells":
> > +    const: 0
> > +
> > +  interrupts-extended:
> > +    minItems: 1
> > +    maxItems: 4095
> > +
> > +  interrupt-controller: true
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts-extended
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +
> > +examples:
> > +  - |
> > +    // Example 1 (RISC-V MSWI device used by Linux RISC-V NoMMU kernel):
> > +
> > +    interrupt-controller@2000000 {
> > +      compatible = "riscv,aclint-mswi";
> > +      interrupts-extended = <&cpu1intc 3>,
> > +                            <&cpu2intc 3>,
> > +                            <&cpu3intc 3>,
> > +                            <&cpu4intc 3>;
> > +      reg = <0x2000000 0x4000>;
> > +      interrupt-controller;
> > +      #interrupt-cells = <0>;
> > +    };
> > +
> > +  - |
> > +    // Example 2 (RISC-V SSWI device used by Linux RISC-V MMU kernel):
> > +
> > +    interrupt-controller@2100000 {
> > +      compatible = "riscv,aclint-sswi";
> > +      interrupts-extended = <&cpu1intc 1>,
> > +                            <&cpu2intc 1>,
> > +                            <&cpu3intc 1>,
> > +                            <&cpu4intc 1>;
> > +      reg = <0x2100000 0x4000>;
> > +      interrupt-controller;
> > +      #interrupt-cells = <0>;
> > +    };
> > +...
> > --
> > 2.25.1
> >
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
