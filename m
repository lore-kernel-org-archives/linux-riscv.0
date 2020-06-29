Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8010FC433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 04:28:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 379F420748
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 04:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hz5qjWWS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="gKkqbViB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 379F420748
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IuadT4U1NfMn+aRt57zKyrzuoh0/TyAUttETlifaKhU=; b=Hz5qjWWSqehL2hL9sxNkXtZGF
	E/GrWO1iwBFPXBnTXqXKaxCRdxKOO8oCizvt4YwdrLtotzXxO0rbAWjsJb9XKpPg9urN9X18nsQ9d
	t8CSugYhy1G1KonBdk3TBPEETBKTanWgQNt+mI3/D0/ViK7M6Z9FlC7drX6JNxpeLQgu8e9gMqoC+
	/SFPpkEJx9aOoW4P/m8IqCRj2AE3d85buLMbJpMkeoPMdkhwX500Ogp8687cggZ6rOYYert3mesB7
	OhJ4sl02krriokqAr8j1WsktjKcBkfIcrA3/3VJAnzg8bK36hjir/4V4udRF6PUD7wY+NJjbnSjpj
	vAXT1sTrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jplP6-0004dX-UM; Mon, 29 Jun 2020 04:28:24 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jplP3-0004d5-9H
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 04:28:24 +0000
Received: by mail-ot1-x342.google.com with SMTP id m2so14241142otr.12
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 21:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LmoPe2SauK8cs9bRn6bTRLzxO3FPfMTTx1fSlCe95d8=;
 b=gKkqbViBG7WBVI5NjrSJyQpjokEKocyZ3xjP0GI/wEF4IAQ7TEArhrPTCE+86csn4t
 ztJcVsQFb2Orb6efdvOELarX0CiP0FF2xymfqPLneU0JpjIBn6WmXIplFSoK/jeHnG0W
 QOLquAkwHNFaNJBDm11vaWQpobVgNFAP61VOwdt7aqGlfRNUnW9u514s+inD30VQ4b6R
 30GBa2KaGsG4Lcrs82P7D3k9iiSws9rXH2MkssoFiSefo1r/OFakPuV0gEiPCcZbtJdr
 fqc9J32Vk9mDg9Swwavm1Y2ft01ftY/ulLiRRebj6eG6tThHnF7ciSywIQjkC/6ioRRN
 V1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LmoPe2SauK8cs9bRn6bTRLzxO3FPfMTTx1fSlCe95d8=;
 b=g+9CMTQCZEflHdr3lnm3UoHJyjJMSW/UbZuIFFbKTDnSWsOkZRik852QAxD5xLWerV
 9iCrGmOT1DKEIbEPmuzwkJAOo/e0kJL1r88zQ8cIkTvEHxVUK5uwYn6AhajmeKUut7yq
 uPp6DyJIZAqAtlArf2ShtH4UV7mJArTBIvwFGV8ytar2ejft8Aoyv/yJSAbepI4M83Mh
 IAzXrnZ/TRdg2SR4TETrDseuNmqJ9wexyLH7msJprEROWe7U+U4j6+JB68j2am/2Bbb9
 076Mjn58nHo0impoGYlDcKA3Xcw1xsVEVd3OHDWbdGEQPrsfB9DoG35sggvVlFOsx3Ih
 huvQ==
X-Gm-Message-State: AOAM533GfRd546VcaQe1XWjtRLwNnvqfZgAPJs6rYv/8MYtdYdvN8a+Z
 qKneirAJQ5EijjDSRi7xe48tn6LDwFjPJqASfvoM+Q==
X-Google-Smtp-Source: ABdhPJxuV9e/bdajpyOTCW3jUhfFs6GfvwaIjwyWuTWIcFYCNOoZ17sobH1l6CwPKbEcdycLek+MonZIX94hGVZ+Wls=
X-Received: by 2002:a9d:186:: with SMTP id e6mr12147068ote.33.1593404899159;
 Sun, 28 Jun 2020 21:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593397455.git.zong.li@sifive.com>
 <3de3a480517d167a3faae086aa8ab0c0c7141d99.1593397455.git.zong.li@sifive.com>
 <CAAhSdy3VBUTMg_b2tO12cTYuvHYtH=4dj9-qT-at35Whf3w_7w@mail.gmail.com>
In-Reply-To: <CAAhSdy3VBUTMg_b2tO12cTYuvHYtH=4dj9-qT-at35Whf3w_7w@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 29 Jun 2020 12:28:08 +0800
Message-ID: <CANXhq0pV87oSzyAt80ySoXGRXp26bCnahPW0r27J+wjj5yc=nw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] dt-bindings: riscv: Add YAML documentation for PMU
To: Anup Patel <anup@brainfault.org>
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
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 29, 2020 at 12:09 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Jun 29, 2020 at 8:49 AM Zong Li <zong.li@sifive.com> wrote:
> >
> > Add device tree bindings for performance monitor unit. And it passes the
> > dt_binding_check verification.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  .../devicetree/bindings/riscv/pmu.yaml        | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/pmu.yaml b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > new file mode 100644
> > index 000000000000..f55ccbc6c685
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > @@ -0,0 +1,59 @@
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
> > +  riscv,width-base-cntr:
> > +    description: The width of cycle and instret CSRs.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  riscv,width-event-cntr:
> > +    description: The width of hpmcounter CSRs.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> The terms "base" and "event" is confusing because
> we only have counters with no interrupt associated with it.
>
> The RISC-V spec defines 3 counters and rest are all
> implementation specific counters.

As I know, there are 2 counters of spec definition: cycle and instret.
What is the 3rd counter you mentioned?

>
> I suggest using the terms "spec counters" and "impl counters"
> instead of "base counters" and "event counters".

OK, they are good to me. Let me change it.


>
> Further, "riscv,width" properties are redundant because
> RISC-V spec clearly tells that counters are 64bit for both
> RV32 and RV64.
>
> > +
> > +  riscv,n-event-cntr:
> > +    description: The number of hpmcounter CSRs.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  riscv,hw-event-map:
> > +    description: The mapping of generic hardware events. Default is no mapping.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +  riscv,hw-cache-event-map:
> > +    description: The mapping of generic hardware cache events.
> > +      Default is no mapping.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +required:
> > +  - compatible
> > +  - riscv,width-base-cntr
> > +  - riscv,width-event-cntr
> > +  - riscv,n-event-cntr
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    pmu {
> > +      compatible = "riscv,pmu";
> > +      riscv,width-base-cntr = <64>;
> > +      riscv,width-event-cntr = <40>;
> > +      riscv,n-event-cntr = <2>;
> > +      riscv,hw-event-map = <0x0 0x0 0x1 0x1 0x3 0x0202 0x4 0x4000>;
> > +      riscv,hw-cache-event-map = <0x010201 0x0102 0x010204 0x0802>;
> > +    };
> > +
> > +...
> > --
> > 2.27.0
> >
>
> Regards,
> Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
