Return-Path: <SRS0=G9WA=NZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0211CC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Sep 2021 10:40:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD57B6109E
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Sep 2021 10:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD57B6109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmzNH1LT69dsEbTriOEck8HeaksCt8EdUQJImBRnnCM=; b=3DSUNuAh7Lo36d
	QS066MgUlf3CpClYUPjo1hgSPamPOmmUluJOQkA2y1C3yZyMq7zpio5ZIN+iYJ8rykUoGzwsPuT3G
	YKzpW6vpUOYFdc1b63mQot5IszD7K4hkP3M8PEH2DN/dPiWG9+wRkn3S4oEZTv2jh37eHWiH3VLSt
	Ofr9SqcfTgVWs06YtP67N6QKuxPL/FAWo431ukflVKH9e447GUOQtCmMKu8DGkUmATDXUl/KJMvAz
	JWSZiaEs+uSOotQD/xJxYy2dEp8JUp9AnGFaxBwXVC6/Gra3VjwyXxp92Z7sEuJryOm1usNni39RM
	RUc15Cn2ZGNGGR48d+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM6cZ-00BgOX-Qr; Fri, 03 Sep 2021 10:40:31 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM6cW-00BgK6-1q
 for linux-riscv@lists.infradead.org; Fri, 03 Sep 2021 10:40:29 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso3264733wmr.1
 for <linux-riscv@lists.infradead.org>; Fri, 03 Sep 2021 03:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gQwd8S30SMMSUoUfiujLV3m0uDIvIxN2gb+ceJ/Cjqc=;
 b=hoIfoySMft4uXS5Emu+pqPpJ4ycBAvbSH05oi2TGL/pME7DAJrclBEuM41TOlIlDp3
 kC0BlpbbkUAU4vOU4N797gU7Qq1joD17ZGLZZeVQjO/7NoXeHaE2tJDyzQqNrC7ZhC5W
 gK5IJAzTWF4x1ajN7aPgpbAQD5sJdNf/ZefuAXWqPIHJu77Iu1npF+7UaxjGt26KtKr+
 Tr/qGz04mpwlbFm8KZjB/fvu+ADWARhxSGOiHC3MwcI0bfyMYFOB4AKnWHi/b/Ystd3C
 Ei7uG0Em8AWrYeAOupxp1IDXLcBIlcqMLmB2rpNqaZrP1ghZgUket6NCIgVEMN9mdrzd
 DmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gQwd8S30SMMSUoUfiujLV3m0uDIvIxN2gb+ceJ/Cjqc=;
 b=Ov6Gq/8Rm024suXGt0wCT1Gn7e4jzhy0ANt64AABxjdNqAo1KAcsPHG6AGuTlr7ElT
 CMHlT79lvqsIKFLN8RrlhfZOlxl5HiD2mxCQy7dy/MOGMpfP6hEJJjIeoO6MAd8OVKoR
 r+x0+43vxn0fKe2YZNSPYvEK3yZxKduEn4ODvrQs0IJw3cOFvC7e9IYO3npOJmi+Pn0T
 6Ph0+VBybuxee4H9nrt1Yt/VyRKvxcxBzVaeh3BvbYK0f28d1iLe0kqr1Ox3c22YgItp
 g27zWpSM1ahOO2GzgDHK9ChXBLyL6obLW7IXvVwb6uNZnZcqf1SfL4ziatcVBpjXYbRC
 jSOQ==
X-Gm-Message-State: AOAM531n05Z5Mqiu3DnrwmpMlsIcspl+Ud5q8LAbfocljwM8rQu9IaaI
 lNTbqtAMyKC7mPxvJSYLjK4rN5bhj1MvG4EFZiouPw==
X-Google-Smtp-Source: ABdhPJyyTSOea4UvObuNECW9zeYgA6pqjw7cAM6LYRDFNTT1e35OUfvPkO3D9m+EbH2nXHT7Jh7UdULa9shSAeYWdMI=
X-Received: by 2002:a1c:1d87:: with SMTP id d129mr7753647wmd.185.1630665621006; 
 Fri, 03 Sep 2021 03:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210830041729.237252-1-anup.patel@wdc.com>
 <20210830041729.237252-6-anup.patel@wdc.com>
 <YS7WTPRYJWnPu2ii@robh.at.kernel.org>
 <CAAhSdy1mttzt3_CnKc=xhpp5CKOEAasQVobTR-2L6Z26rstn+A@mail.gmail.com>
 <CAL_JsqLT3RgG0MHMWEs8BZPPtOUUcjRw27W+O4z=DNP9M=EKAw@mail.gmail.com>
In-Reply-To: <CAL_JsqLT3RgG0MHMWEs8BZPPtOUUcjRw27W+O4z=DNP9M=EKAw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Sep 2021 16:10:09 +0530
Message-ID: <CAAhSdy1NBNTQ5F=4MjjwLb4k_kGgB9j5iFxJ6qoGSCuGkn=66g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210903_034028_140657_75C1D92E 
X-CRM114-Status: GOOD (  34.59  )
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

On Thu, Sep 2, 2021 at 6:04 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Sep 1, 2021 at 6:56 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Wed, Sep 1, 2021 at 6:54 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Mon, Aug 30, 2021 at 09:47:23AM +0530, Anup Patel wrote:
> > > > We add DT bindings documentation for the ACLINT MSWI and SSWI
> > > > devices found on RISC-V SOCs.
> > > >
> > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > > ---
> > > >  .../riscv,aclint-swi.yaml                     | 95 +++++++++++++++++++
> > > >  1 file changed, 95 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> > > > new file mode 100644
> > > > index 000000000000..68563259ae24
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> > > > @@ -0,0 +1,95 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/interrupt-controller/riscv,aclint-swi.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: RISC-V ACLINT Software Interrupt Devices
> > > > +
> > > > +maintainers:
> > > > +  - Anup Patel <anup.patel@wdc.com>
> > > > +
> > > > +description:
> > > > +  RISC-V SOCs include an implementation of the M-level software interrupt
> > > > +  (MSWI) device and the S-level software interrupt (SSWI) device defined
> > > > +  in the RISC-V Advanced Core Local Interruptor (ACLINT) specification.
> > > > +
> > > > +  The ACLINT MSWI and SSWI devices are documented in the RISC-V ACLINT
> > > > +  specification located at
> > > > +  https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc.
> > > > +
> > > > +  The ACLINT MSWI and SSWI devices directly connect to the M-level and
> > > > +  S-level software interrupt lines of various HARTs (or CPUs) respectively
> > > > +  so the RISC-V per-HART (or per-CPU) local interrupt controller is the
> > > > +  parent interrupt controller for the ACLINT MSWI and SSWI devices.
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/interrupt-controller.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - items:
> > > > +        - enum:
> > > > +          - riscv,aclint-mswi
> > > > +
> > > > +      - items:
> > > > +        - enum:
> > > > +          - riscv,aclint-sswi
> > >
> > > All this can be just:
> > >
> > > enum:
> > >   - riscv,aclint-mswi
> > >   - riscv,aclint-sswi
> > >
> > > However...
> > >
> > > > +
> > > > +    description:
> > > > +      For ACLINT MSWI devices, it should be "riscv,aclint-mswi" OR
> > > > +      "<vendor>,<chip>-aclint-mswi".
> > > > +      For ACLINT SSWI devices, it should be "riscv,aclint-sswi" OR
> > > > +      "<vendor>,<chip>-aclint-sswi".
> > >
> > > s/OR/AND/
> > >
> > > There must be a compatible for the implementation. Unless RiscV
> > > implementations of specs are complete describing all clocks, power
> > > domains, resets, etc. and are quirk free.
> > >
> > > But don't write free form constraints...
> >
> > It is possible that quite a few implementations (QEMU, FPGAs, and
> > other simulators) will not require implementation specific compatible
> > strings. Should we still mandate implementation specific compatible
> > strings in DTS for such cases?
>
> No, but the schema says you only have those cases. Are there not any
> actual implementations?

All existing RISC-V boards have SiFive CLINT and ACLINT is backward
compatible with SiFive CLINT so we do have actual implementations.

None of the existing RISC-V boards have special clocks, power domain,
resets etc for these devices.

>
> Minimally make "<vendor>,<chip>-aclint-mswi" into a schema pattern for
> the first entry and perhaps a note to replace with actual strings when
> there are some. It's ultimately up to the RiscV maintainers to require
> SoC specific compatibles here. Allowing a generic one alone makes that
> harder because the schema can't enforce it.

Can we have a common compatible string for QEMU, FPGAs, etc ?

For example,
compatible = "riscv,generic-aclint-mswi", "riscv,aclint-mswi";

Regards,
Anup

>
> Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
