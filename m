Return-Path: <SRS0=/4Rd=NY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD6CC432BE
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Sep 2021 00:34:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A470861058
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Sep 2021 00:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A470861058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ly7UYsn5nroQoMFi/4xfl7kChGfGQ4ItDl95Qc8dr8g=; b=2+K15I7w848ZGX
	e5cduP2Scj744O8hdPFPxqEoto5FTx4qSWP8yr8buBnZxpd2El94ey+scvOeY9k+kF5AZkhX/6vKS
	JNdooQh8CTB2GBm/koYiA91Yq1s4tc36Yl7lCFXKesjBwJ6ZbCi4/cWsPXFuU1krBnFs2WIRwrZwL
	6cdLmD2hH6clD2XvtyqSn2G7/GhYdUb7Ngraoq8MRZPz1UrzpzBfZsBpcaA45dEMsudScOaABTBPl
	k8wMhY4YcmRgg+EvY4uwK5Sr7wSrztduN4CX5u8FRjZK3iZioku0gN2fMo8l3yw64T9Ow4KJbXC7i
	LIAathSh53js9Ac8m+lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLagA-0080kv-QK; Thu, 02 Sep 2021 00:34:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLag5-0080k0-HQ
 for linux-riscv@lists.infradead.org; Thu, 02 Sep 2021 00:34:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E1D361058
 for <linux-riscv@lists.infradead.org>; Thu,  2 Sep 2021 00:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630542841;
 bh=AULb94u8DPCVX3NAb7nJvJEiQNrMkPYbLeM6cmrGsVQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=R5howx/slD6zitOsueBZeXYbzp7F84HlafFu1dVLGq4uq281lmnC57T2+uWta3HJD
 S15CzUjxueIDPs5cAAlgANkTtsW7JqakZhw9Qf6EyJSNhvxwuzMN1s1BpdWoE9PHbj
 7loNUHXawi2/7w47UBDxKeQcF1I7HUZTfzJYVVQ4tbB5ibfvE5WSdTRg0KPpkBwe8m
 1O+1Oq2STduH+00FSfXRjziqFMs9YMITvOW50nNRS8+j3/PxnVA0BGZJY0lSSx2iYA
 jm7Zp55tIZ+0vsmllcsHJS4Ks84cokDhE0Yw+1xYi133y/3qv+7zFIzM1E+S0mWibh
 61uHJXKQS+AXw==
Received: by mail-ej1-f43.google.com with SMTP id me10so226253ejb.11
 for <linux-riscv@lists.infradead.org>; Wed, 01 Sep 2021 17:34:00 -0700 (PDT)
X-Gm-Message-State: AOAM5319R4uDdfSSIumJQ12GytPGIpxCySQ72UWAchqme8faFuhTqP/j
 xzARqED41a8YVvAsxhV+Zs84lCKiz1gh3DWJmg==
X-Google-Smtp-Source: ABdhPJx7u5F8Nk4zeQKwACQmAUvSnPMJrvfvsim7Oy27vFJxP7EV+LC3aHBRTgoZs71PV9j+8DsQqnm0r5jmZOj1foQ=
X-Received: by 2002:a17:906:25db:: with SMTP id
 n27mr663241ejb.108.1630542839613; 
 Wed, 01 Sep 2021 17:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210830041729.237252-1-anup.patel@wdc.com>
 <20210830041729.237252-6-anup.patel@wdc.com>
 <YS7WTPRYJWnPu2ii@robh.at.kernel.org>
 <CAAhSdy1mttzt3_CnKc=xhpp5CKOEAasQVobTR-2L6Z26rstn+A@mail.gmail.com>
In-Reply-To: <CAAhSdy1mttzt3_CnKc=xhpp5CKOEAasQVobTR-2L6Z26rstn+A@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 1 Sep 2021 19:33:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLT3RgG0MHMWEs8BZPPtOUUcjRw27W+O4z=DNP9M=EKAw@mail.gmail.com>
Message-ID: <CAL_JsqLT3RgG0MHMWEs8BZPPtOUUcjRw27W+O4z=DNP9M=EKAw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 05/11] dt-bindings: interrupt-controller: Add
 ACLINT MSWI and SSWI bindings
To: Anup Patel <anup@brainfault.org>
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
X-CRM114-CacheID: sfid-20210901_173401_650899_E49A382D 
X-CRM114-Status: GOOD (  30.92  )
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

On Wed, Sep 1, 2021 at 6:56 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Wed, Sep 1, 2021 at 6:54 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, Aug 30, 2021 at 09:47:23AM +0530, Anup Patel wrote:
> > > We add DT bindings documentation for the ACLINT MSWI and SSWI
> > > devices found on RISC-V SOCs.
> > >
> > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > ---
> > >  .../riscv,aclint-swi.yaml                     | 95 +++++++++++++++++++
> > >  1 file changed, 95 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> > > new file mode 100644
> > > index 000000000000..68563259ae24
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> > > @@ -0,0 +1,95 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/interrupt-controller/riscv,aclint-swi.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: RISC-V ACLINT Software Interrupt Devices
> > > +
> > > +maintainers:
> > > +  - Anup Patel <anup.patel@wdc.com>
> > > +
> > > +description:
> > > +  RISC-V SOCs include an implementation of the M-level software interrupt
> > > +  (MSWI) device and the S-level software interrupt (SSWI) device defined
> > > +  in the RISC-V Advanced Core Local Interruptor (ACLINT) specification.
> > > +
> > > +  The ACLINT MSWI and SSWI devices are documented in the RISC-V ACLINT
> > > +  specification located at
> > > +  https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc.
> > > +
> > > +  The ACLINT MSWI and SSWI devices directly connect to the M-level and
> > > +  S-level software interrupt lines of various HARTs (or CPUs) respectively
> > > +  so the RISC-V per-HART (or per-CPU) local interrupt controller is the
> > > +  parent interrupt controller for the ACLINT MSWI and SSWI devices.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/interrupt-controller.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +        - enum:
> > > +          - riscv,aclint-mswi
> > > +
> > > +      - items:
> > > +        - enum:
> > > +          - riscv,aclint-sswi
> >
> > All this can be just:
> >
> > enum:
> >   - riscv,aclint-mswi
> >   - riscv,aclint-sswi
> >
> > However...
> >
> > > +
> > > +    description:
> > > +      For ACLINT MSWI devices, it should be "riscv,aclint-mswi" OR
> > > +      "<vendor>,<chip>-aclint-mswi".
> > > +      For ACLINT SSWI devices, it should be "riscv,aclint-sswi" OR
> > > +      "<vendor>,<chip>-aclint-sswi".
> >
> > s/OR/AND/
> >
> > There must be a compatible for the implementation. Unless RiscV
> > implementations of specs are complete describing all clocks, power
> > domains, resets, etc. and are quirk free.
> >
> > But don't write free form constraints...
>
> It is possible that quite a few implementations (QEMU, FPGAs, and
> other simulators) will not require implementation specific compatible
> strings. Should we still mandate implementation specific compatible
> strings in DTS for such cases?

No, but the schema says you only have those cases. Are there not any
actual implementations?

Minimally make "<vendor>,<chip>-aclint-mswi" into a schema pattern for
the first entry and perhaps a note to replace with actual strings when
there are some. It's ultimately up to the RiscV maintainers to require
SoC specific compatibles here. Allowing a generic one alone makes that
harder because the schema can't enforce it.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
