Return-Path: <SRS0=0BIX=N5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C204C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Sep 2021 13:48:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7F7F61101
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Sep 2021 13:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7F7F61101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U40kYN3wk9YN5KFX9tBbG3ufpM4bo3+Kby0rTMjv6DQ=; b=oGMSzcyCwJIBvA
	I7pcYHz3JRR9UddFfXhBXh10PthHTOTSV4Vg2JSiZZU6W1LHI4QwmdEBbUiEBgnW9hVlVdxOBlfUB
	ErehqnUqC/k8hDFRGl07CTbufmeDXbM1+dbGmvwvewGa3HiJUSGLLd+DYqxkmzBgOMF8BBIWEV0aD
	gnQmONxtreSf9YKKx16vdWcZWuF49kNjuK0HVwCzeW3ZaqDGBCJuHJudLRoSUJEeDu3DvrkDkxami
	0d/0MxZDWYS2tU0A6lYYHHsTdy2EsjZ7bqogzH8Z+16F06Q49kdmih0KRtVkMSEtI/EuU8qIe2Nzh
	4db7HcIOKG9oYVADDxig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNbSY-003nbk-2o; Tue, 07 Sep 2021 13:48:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNbSU-003nbL-Vy
 for linux-riscv@lists.infradead.org; Tue, 07 Sep 2021 13:48:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B8D761106
 for <linux-riscv@lists.infradead.org>; Tue,  7 Sep 2021 13:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631022498;
 bh=ArpxA6KfyIfvsZ8d82ObTY6A8wEvx7a+tmGvpZbu1u4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kjFgQpGggoy8m98tICr9x1g/hjx8Ox1hcrlhLrM57ioC/90iFja0mnBM3BeeeXra7
 JphW+wIgU5CgTBCD7TCnN2d829H8+hK/9F04EvWUG7EcgiBWoqEX0x/1Cp4BxXbO00
 g1m9dO0al8adpXdoAQvlQtk2A/X+AWihwQ96o6nGRto6rP0BtE5+5BZv9lBD1b28v3
 04A3PskMinulB06flbwsREV2MJDtiWNWN9ZAkcLRSCruam2qU+0eUq9wbxclMYk0OP
 Kwq4TUZaSuQfrMGbUJ3lXBVPDJM8hJndeyPZaB2avbVoEpLx3QWOSIgkcb0aGchnUH
 7v+Tt6cPGmMTQ==
Received: by mail-ej1-f54.google.com with SMTP id bt14so19841639ejb.3
 for <linux-riscv@lists.infradead.org>; Tue, 07 Sep 2021 06:48:18 -0700 (PDT)
X-Gm-Message-State: AOAM531AN6CCUzB57dRNuoeOZVmEAVW4bfN9p4Gpj98ggG8oHPL1oT8/
 d7HcLg6nLbI29NuwC+IVNhhG9DLZhfpxXmZMeg==
X-Google-Smtp-Source: ABdhPJwiAjWbUjHP2uyVj2Z+vPdtXWFsSipWwKu5pprpfvFabFFsaLXHejznbz/SkeiF6IcWA3068Sgq+uoQxj6jDr4=
X-Received: by 2002:a17:906:9a4e:: with SMTP id
 aj14mr18654434ejc.84.1631022496627; 
 Tue, 07 Sep 2021 06:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210830041729.237252-1-anup.patel@wdc.com>
 <20210830041729.237252-6-anup.patel@wdc.com>
 <YS7WTPRYJWnPu2ii@robh.at.kernel.org>
 <CAAhSdy1mttzt3_CnKc=xhpp5CKOEAasQVobTR-2L6Z26rstn+A@mail.gmail.com>
 <CAL_JsqLT3RgG0MHMWEs8BZPPtOUUcjRw27W+O4z=DNP9M=EKAw@mail.gmail.com>
 <CAAhSdy1NBNTQ5F=4MjjwLb4k_kGgB9j5iFxJ6qoGSCuGkn=66g@mail.gmail.com>
In-Reply-To: <CAAhSdy1NBNTQ5F=4MjjwLb4k_kGgB9j5iFxJ6qoGSCuGkn=66g@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 7 Sep 2021 08:48:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLXnYAGY5yqVkazeVdUgOtbbOZ2DMCU0_O892suYA4d-w@mail.gmail.com>
Message-ID: <CAL_JsqLXnYAGY5yqVkazeVdUgOtbbOZ2DMCU0_O892suYA4d-w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210907_064819_109783_8C28E656 
X-CRM114-Status: GOOD (  39.03  )
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

On Fri, Sep 3, 2021 at 5:40 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Sep 2, 2021 at 6:04 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Sep 1, 2021 at 6:56 AM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Wed, Sep 1, 2021 at 6:54 AM Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Mon, Aug 30, 2021 at 09:47:23AM +0530, Anup Patel wrote:
> > > > > We add DT bindings documentation for the ACLINT MSWI and SSWI
> > > > > devices found on RISC-V SOCs.
> > > > >
> > > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > > > ---
> > > > >  .../riscv,aclint-swi.yaml                     | 95 +++++++++++++++++++
> > > > >  1 file changed, 95 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..68563259ae24
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> > > > > @@ -0,0 +1,95 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/interrupt-controller/riscv,aclint-swi.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: RISC-V ACLINT Software Interrupt Devices
> > > > > +
> > > > > +maintainers:
> > > > > +  - Anup Patel <anup.patel@wdc.com>
> > > > > +
> > > > > +description:
> > > > > +  RISC-V SOCs include an implementation of the M-level software interrupt
> > > > > +  (MSWI) device and the S-level software interrupt (SSWI) device defined
> > > > > +  in the RISC-V Advanced Core Local Interruptor (ACLINT) specification.
> > > > > +
> > > > > +  The ACLINT MSWI and SSWI devices are documented in the RISC-V ACLINT
> > > > > +  specification located at
> > > > > +  https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc.
> > > > > +
> > > > > +  The ACLINT MSWI and SSWI devices directly connect to the M-level and
> > > > > +  S-level software interrupt lines of various HARTs (or CPUs) respectively
> > > > > +  so the RISC-V per-HART (or per-CPU) local interrupt controller is the
> > > > > +  parent interrupt controller for the ACLINT MSWI and SSWI devices.
> > > > > +
> > > > > +allOf:
> > > > > +  - $ref: /schemas/interrupt-controller.yaml#
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    oneOf:
> > > > > +      - items:
> > > > > +        - enum:
> > > > > +          - riscv,aclint-mswi
> > > > > +
> > > > > +      - items:
> > > > > +        - enum:
> > > > > +          - riscv,aclint-sswi
> > > >
> > > > All this can be just:
> > > >
> > > > enum:
> > > >   - riscv,aclint-mswi
> > > >   - riscv,aclint-sswi
> > > >
> > > > However...
> > > >
> > > > > +
> > > > > +    description:
> > > > > +      For ACLINT MSWI devices, it should be "riscv,aclint-mswi" OR
> > > > > +      "<vendor>,<chip>-aclint-mswi".
> > > > > +      For ACLINT SSWI devices, it should be "riscv,aclint-sswi" OR
> > > > > +      "<vendor>,<chip>-aclint-sswi".
> > > >
> > > > s/OR/AND/
> > > >
> > > > There must be a compatible for the implementation. Unless RiscV
> > > > implementations of specs are complete describing all clocks, power
> > > > domains, resets, etc. and are quirk free.
> > > >
> > > > But don't write free form constraints...
> > >
> > > It is possible that quite a few implementations (QEMU, FPGAs, and
> > > other simulators) will not require implementation specific compatible
> > > strings. Should we still mandate implementation specific compatible
> > > strings in DTS for such cases?
> >
> > No, but the schema says you only have those cases. Are there not any
> > actual implementations?
>
> All existing RISC-V boards have SiFive CLINT and ACLINT is backward
> compatible with SiFive CLINT so we do have actual implementations.

So there's a SiFive compatible you can add here?

> None of the existing RISC-V boards have special clocks, power domain,
> resets etc for these devices.
>
> >
> > Minimally make "<vendor>,<chip>-aclint-mswi" into a schema pattern for
> > the first entry and perhaps a note to replace with actual strings when
> > there are some. It's ultimately up to the RiscV maintainers to require
> > SoC specific compatibles here. Allowing a generic one alone makes that
> > harder because the schema can't enforce it.
>
> Can we have a common compatible string for QEMU, FPGAs, etc ?
>
> For example,
> compatible = "riscv,generic-aclint-mswi", "riscv,aclint-mswi";

This is not any better than just allowing "riscv,aclint-mswi" by
itself as someone could just use the above strings on their new
implementation to avoid warnings.

You could just not worry about the QEMU and FPGA cases. FPGAs are
probably not upstream and if they are, don't they need specific
compatibles tied to versions of FPGA images? QEMU generating its own
DT doesn't run schema validation though that could change. I'm looking
at enabling schema validation at runtime for purposes of firmware
testing and with that QEMU generated DT may be something we test.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
