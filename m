Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1105AC3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 05:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4s2ehAMU5SiRwo+nCXxADzgIZS4ETdsBbkf056jj1Cc=; b=JkSMCNNKQzCkm/
	grbFWOH9Hmr+JVc/lbCZ9E2TlI0JjPA/K5/Vy5zh9eo1IDeGKq8eYUZYpLrbXj+4+F6KiBppNkFZx
	M8AMWc4wwE6UT/u8sQ37nAYG8T748LSVRCzxzA9TmU76wVunLJOe4E2MuBEIU2BoQa/LJZTtSty0b
	4gIl/7C3sBokHVf15zNh0FPkZb4tNn68nT1jbm7ZY1sasgbKnSwDhh3ahhn1D+xoG5Mbz+ebC+sOe
	Uqf3GJxZKf60TI52cj7I7oExoZu85hFCqB73VuavAXj10FA4YAohdYVhl/l1FsnQi64i2kg6rjM2u
	GcmEAHZOC6uHiWRoE3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCZZn-00GdzZ-Ht; Tue, 03 Jan 2023 05:11:03 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCZZc-00Gdv8-O9
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 05:10:54 +0000
Received: by mail-vk1-xa32.google.com with SMTP id n205so7805579vkf.13
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jan 2023 21:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G1lF+uQj+FQsqhODd3DjLZyHBCSILu/V4r6YB+47iCA=;
        b=R4naHoGAnjr4w90CecJAm62X3fhC3J8oS6g5fRqtT1ap4xcepx+v9BGDMaDsVmDhnd
         f8W68HvcCLB/Vp8eyQgnfImvPKFqYlk2bBC8fUb09rqHRbt1U4nMEYhLBhrx+2gGQxWg
         CcDFDyLGVSLsMxP4Ad9Q9/e7MWD5LMYYtDRe81pBL0eC8ywRV5Y7m/G2x9+UKNNYrhuP
         3zAbZtisGYN4olRPjtBtEifauiPo1D1PD7EyI1zbJrI3elFDblsyP45oXXD6c5Z/CY2Y
         f0C+6adIEZfc8qfFOIEhm9OoyiWKdM1/HNQSOm3387gm9czDviOvHcT7EVCV39Vm70nh
         DPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1lF+uQj+FQsqhODd3DjLZyHBCSILu/V4r6YB+47iCA=;
        b=A3WwWZCd8Iszx28pixcvxabI3T8I0d6Kbtrr5SsoTtKoujGvEBYaMl7AOP0NSd+Vm/
         kR+AXacSzjIh5YP/mnU0eRbam3DxvxAgLjGTxdj+08gBE6+MtVCWCcgssBUtgKIdcY1c
         wQfLAbexF678T9OIQPmfnQme453dDJRmA5ujfULhZCdqRyUNmDB1SXlmjAUM3kAfb+3q
         LQmEZRANvt/1K507u/0Vc+TeDV6yEf/3lL0XZPQzKZmxwNCfOG2O1wKe5ZL3zRCZ8Kwm
         Yy2jtAltStN8NJbK6+raZ7U2z4lNJ/66IuNt34nsk8j/zD8XrhM3NUYosuSqWHFNUwVh
         jtqQ==
X-Gm-Message-State: AFqh2kpvg4wnsLJxkBW/j9WHm87xfl6Z8cW4xsw6Gf1SYv4V0knuuDo4
	BSDjsagp9YoyEoBzflak1ugQ4v39T0Tm9JvQ7WFT5Q==
X-Google-Smtp-Source: AMrXdXslkxL7UBNfkOhYC3B8zZdJn9HFotr+MwajcwvZmQTG61DbbRtZtGg7pjiZG0uYr4oy2I+EySvFDHjgctf1gGI=
X-Received: by 2002:a1f:c345:0:b0:3b8:2d76:434d with SMTP id
 t66-20020a1fc345000000b003b82d76434dmr4520082vkf.31.1672722648007; Mon, 02
 Jan 2023 21:10:48 -0800 (PST)
MIME-Version: 1.0
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-7-apatel@ventanamicro.com> <Y3EQ4JU7uGbIMGiW@spud>
 <CAAhSdy2UAMmX+W5Cm3DuTJzZ0jJ3=CW4PhjctQNdfeS+4hqWqg@mail.gmail.com> <Y7MfyZBAErYGMZBK@spud>
In-Reply-To: <Y7MfyZBAErYGMZBK@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 3 Jan 2023 10:40:35 +0530
Message-ID: <CAK9=C2WoFZBmnqpNGUZWATMqd22TiHpQehAYbW+DNX8ejHU=RA@mail.gmail.com>
Subject: Re: [PATCH 6/9] dt-bindings: Add RISC-V advanced PLIC bindings
To: Conor Dooley <conor@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_211052_869067_BD153325 
X-CRM114-Status: GOOD (  33.12  )
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

On Mon, Jan 2, 2023 at 11:48 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Jan 02, 2023 at 10:20:48PM +0530, Anup Patel wrote:
> > On Sun, Nov 13, 2022 at 9:14 PM Conor Dooley <conor@kernel.org> wrote:
>
> > > > +  domain.
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/interrupt-controller.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - enum:
> > > > +          - vendor,chip-aplic
> > >
> > > Same comment here about the validity of this placeholder.
> >
> > Okay, I will add "riscv,qemu-aplic" as QEMU specific compatible string.
>
> Ah neat. I think that's a fair compromise.
>
> > > > +      - const: riscv,aplic
>
> > > > +  msi-parent:
> > > > +    description:
> > > > +      The presence of this property implies that given APLIC domain forwards
> > > > +      wired interrupts as MSIs to a AIA incoming message signaled interrupt
> > > > +      controller (IMSIC). This property should be considered only when the
> > > > +      interrupts-extended property is absent.
> > >
> > > This mutual exclusion can be represented, can't it?
> > > IIRC it is some sort of oneOf thing, somewhat like below:
> > > oneOf:
> > >   - required:
> > >       - msi-parent
> > >   - required:
> > >       - interrupts-extended
> > >
> > > AFAIR from doing the i2c ocores binding, this will force the addition of
> > > one, but not both, to a node.
> > >
> > > Or is this not actually mutually exclusive & the msi-parent property is
> > > permitted but just left unused if interrupts-extended is present?
> >
> > If both are present then interrupts-extended is preferred.
>
> Perhaps I am making a fool of myself here, but why would someone include
> both of them at once, if only one is going to be used?
> It would appear that making them explicitly mutually exclusive would
> make the binding easier to understand.
> What am I missing?

If both "interrupts-extended" and "msi-parent" are present then it means
the APLIC domain supports both MSI mode and Direct mode in HW. In this
case, the APLIC driver has to choose between MSI mode or Direct mode.

>
> > > > +  riscv,children:
> > > > +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> > > > +    minItems: 1
> > > > +    maxItems: 1024
> > > > +    description:
> > > > +      This property represents a list of child APLIC domains for the given
> > > > +      APLIC domain. Each child APLIC domain is assigned child index in
> > > > +      increasing order with the first child APLIC domain assigned child
> > > > +      index 0. The APLIC domain child index is used by firmware to delegate
> > > > +      interrupts from the given APLIC domain to a particular child APLIC
> > > > +      domain.
> > > > +
> > > > +  riscv,delegate:
> > > > +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> > > > +    minItems: 1
> > > > +    maxItems: 1024
> > > > +    description:
> > > > +      This property represents a interrupt delegation list where each entry
> > > > +      is a triple consisting of child APLIC domain phandle, first interrupt
> > > > +      number, and last interrupt number. The firmware will configure interrupt
> > > > +      delegation registers based on interrupt delegation list.
> > >
> > > What is the inter dependence of the children and delegate?
> > > Is it valid to have a delegate property without children?
> > > Can the firmware delegate interrupts without the delegation list, based
> > > on the children property alone? Or is it effectively useless without a
> > > children property?
> >
> > Both properties convey different information. The "riscv,childen" describes
> > the association of child indexes with child APLIC domains whereas the
> > "riscv,delegate" describes the interrupt delegation to few of the child
> > APLIC domains.
> >
> >
> > >
> > > In your examples, the second has msi-parent but neither of these custom
> > > properties. Do the children/delegate properties have a meaning in the
> > > msi-parent case?
> >
> > The "riscv,childern" and "riscv,delegate" are only useful when we have
> > hierarchy of multiple APLIC domains. The second example only has
> > one APLIC domain hence these custom properties are absent.
>
> It'd be great if you could include an example that explains the
> difference as, IIRC, both Rob and I both were kinda confused as to how
> the properties differ.

Okay, I will try to improve the examples.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
