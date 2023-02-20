Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7A5C05027
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 05:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uFufnEqUo/tx6iVtHAy8Nq/LfIJRzxa6PwRX69uxRmE=; b=rxXbEPAylrI/Di
	I+F9mrPN4QEE9JiUegPZuckg3BAUEcG04vLyk2On+qvz/nYTkenFHRoKyl4eoVr9Olj+706oAJrTI
	UMJbieai94J9icpmrS4/CIsYlyetzQak0aWo3uLADmXElZYHsen722BCMC5NcgnOWv8+Yas6CIyrb
	NVMh4WV0jvsQ3saSNFJ4TpHnYXhUUQqWM7kdRi526MNzixFJMlgPBQVDl7wSCD0uveNIXDiQOptl/
	X0lvM6Kx0rbbIDbewtKuhrq0AeBAUL6YM9XuefljdVpywqNiha0y4cxccr+V1Fv2TiV013jyHoxSW
	dzydVnxUTLmTWgubly5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTyRK-00324r-GZ; Mon, 20 Feb 2023 05:10:14 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTyRH-003242-Hn
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 05:10:13 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id g35so220542vkd.6
        for <linux-riscv@lists.infradead.org>; Sun, 19 Feb 2023 21:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NgBPiBFudnfp+7ZvqZ/TkWNG31i8uXBHpDwh2oWMqzE=;
        b=BDBIi58gFTYL1Ye7j2+aVGb70PhaM+5gaPYE8OtvNOkBlo7FTuGosQ8ay6pWKO2h6m
         kS9KKzq5TEJ2hWGzG0sI5nB3LW/7nI6yrJHRnInnrC5vbkGG8YCJ4y3WW5Iooh4el4eQ
         bEb42TocXTFACSywTV1SjaK7X/96qaPoCdOj0LocD77SCoSrPuqSZQIxtISDdVA5ntJ0
         eQRzfTQGp3RxpUHAbgp5o5/hzCrVGvyD6CkgCOKTxcmg1xigEhpyDyncoAQPYYKrbG06
         f1LwWcRQ6m6PYNltlepXhqFYnOKoWugCGEtPDsq0bNCpYdQWLlqe2TvOEt6ST9ZD+uvG
         0/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgBPiBFudnfp+7ZvqZ/TkWNG31i8uXBHpDwh2oWMqzE=;
        b=G6BZJoCTNfrf1gHdvhP+cCUr9w2urToypU7ttVXLRub/UPJDvFY2adjDYsDDybJ/sU
         qpjyUmdijlAOcrnKVt16fo1Kd/XW/OEOb+2l5Jgzdo18hwfi4e9ssIdPyANwRysHFMZR
         d6RDLkJRuPDDpK35RquutukbD0peG7tvOn3VdNhK0nDgHJ/7W/ZGrVMtR3fLibyLHIBp
         9Cj+F9w8+HtBlwbrdPjSQz103325duALsFlQeR3Ws+9dfIaAZrVDtQkZmNgQXkzkcNpa
         yketOOIdF7CGTjz++dQt6DYk2HVkqs0V+pWOfXHyVggJFUkE/bRhGbkt1fH9Plq4701z
         Z6UQ==
X-Gm-Message-State: AO0yUKUnLd0g7jXtaTQj5yGv4V7sgKoGEk8vetHDewoJQNSTJQNIIJ1P
	N+La163sHfdjs0wYLtCW2qckkrBfiHpLNLukF5u/Dw==
X-Google-Smtp-Source: AK7set8FC6hXeAgP2mDNjCcg4nLEnoSw3NsjrH4zo8zCcxifANoD+MXxgaK8eYhqFpLzsjpz6TDINMrGKctI5n+y9eY=
X-Received: by 2002:a1f:a682:0:b0:3d5:9b32:7ba4 with SMTP id
 p124-20020a1fa682000000b003d59b327ba4mr119794vke.15.1676869807876; Sun, 19
 Feb 2023 21:10:07 -0800 (PST)
MIME-Version: 1.0
References: <20230103141409.772298-1-apatel@ventanamicro.com>
 <20230103141409.772298-7-apatel@ventanamicro.com> <4bd8c6da-6ad4-5e1a-169c-48f48560b36b@dram.page>
In-Reply-To: <4bd8c6da-6ad4-5e1a-169c-48f48560b36b@dram.page>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 20 Feb 2023 10:39:56 +0530
Message-ID: <CAK9=C2XpGRH98MvrnwiuS7zhT8woKnnihGSinkNP1vcKz3WtRQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] dt-bindings: interrupt-controller: Add RISC-V
 advanced PLIC
To: Vivian Wang <uwu@dram.page>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_211011_616739_131C6B7A 
X-CRM114-Status: GOOD (  38.17  )
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

On Sun, Feb 19, 2023 at 5:18 PM Vivian Wang <uwu@dram.page> wrote:
>
> On 1/3/23 22:14, Anup Patel wrote:
> > We add DT bindings document for RISC-V advanced platform level
> > interrupt controller (APLIC) defined by the RISC-V advanced
> > interrupt architecture (AIA) specification.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  .../interrupt-controller/riscv,aplic.yaml     | 159 ++++++++++++++++++
> >  1 file changed, 159 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
> > new file mode 100644
> > index 000000000000..b7f20aad72c2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
> > @@ -0,0 +1,159 @@
> >
> > <snip>
> >
> > +  riscv,children:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    minItems: 1
> > +    maxItems: 1024
> > +    items:
> > +      maxItems: 1
> > +    description:
> > +      A list of child APLIC domains for the given APLIC domain. Each child
> > +      APLIC domain is assigned child index in increasing order with the
> > +      first child APLIC domain assigned child index 0. The APLIC domain
> > +      child index is used by firmware to delegate interrupts from the
> > +      given APLIC domain to a particular child APLIC domain.
> > +
> > +  riscv,delegate:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    minItems: 1
> > +    maxItems: 1024
> > +    items:
> > +      items:
> > +        - description: child APLIC domain phandle
> > +        - description: first interrupt number (inclusive)
> > +        - description: last interrupt number (inclusive)
> > +    description:
> > +      A interrupt delegation list where each entry is a triple consisting
> > +      of child APLIC domain phandle, first interrupt number, and last
> > +      interrupt number. The firmware will configure interrupt delegation
> > +      registers based on interrupt delegation list.
> > +
>
> I'm not sure if this is the right place to ask, since it could be more
> of a OpenSBI/QEMU problem, but I think a more detailed description about
> what 'the firmware' does is appropriate here.
>
> My main confusion is how to describe wired interrupts connected to
> APLICs. Say we have two APLIC nodes with labels aplic_m and aplic_s that
> are the APLIC domains for M-mode and S-mode respectively. IIUC, wired
> interrupts are connected directly to aplic_m. So how do I refer to it in
> the device nodes?

Please see my previous reply to Conor about these DT properties.
The riscv,children DT property describes HW child numbering whereas
the riscv,delegate DT propert is a table of IRQ delegation.

In your example, let's assume we have N wired interrupts. This
means we will have devices connected to the root APLIC domain
(aplic_m). Now since aplic_s is a child of aplic_m, we will have
N wired interrupts going from from aplic_m to aplic_s where
aplic_m will route a wired/device interrupt x to aplic_s if
sourcecfg[x].D = 1 and sourcecfg[x].child = 0.

>
>  1. <&aplic_s num IRQ_TYPE_foo>, but it would be a lie to M-mode
>     software, which could be a problem. QEMU 7.2.0 seems to take this
>     approach. (I could also be misunderstanding QEMU and it actually
>     does connect wired interrupts to the S-mode APLIC, but then
>     riscv,children and riscv,delegate would be lies.)

No, it's not a lie. The <&aplic_s num IRQ_TYPE_foo> in a device DT
node is based on the IRQ delegation fixed by the RISC-V platform.
QEMU has its own strategy of delegating IRQs to APLIC S-mode
while other platforms can use a different strategy.

>  2. <&aplic_m ...>, and when M-mode software gives S-mode software
>     access to devices, it delegates relevant interrupts and patches it
>     into <&aplic_s num IRQ_TYPE_foo>. Seems to be the 'correct'
>     approach, but pretty complicated.

The APLIC M-mode domain is not accessible to S-mode software so
Linux cannot create an irqdomain using APLIC M-mode DT node. This
means device DT nodes must have <&aplic_s num IRQ_TYPE_foo>
which points to APLIC S-mode domain.

It is totally up to RISC-V firmware and platform if it wants to dynamically
add/patch <&aplic_s num IRQ_TYPE_foo> in device DT nodes. Currently,
we do not patch device DT nodes in OpenSBI and instead have the
device DT nodes point to correct APLIC domain based on the IRQ
delegation.

>  3. <&aplic_m ...>, S-mode software sees this, and sees that aplic_m has
>     num in riscv,delegate, so goes to find the child it's been delegated
>     to, which is (should be) aplic_s. A bit annoyingly abstraction
>     breaking, since S-mode shouldn't even need to know about aplic_m.

Yes, S-mode should know about aplic_m and if it tries to access aplic_m
then it will get an access fault.

This is exactly why device DT node should have "interrupts" DT property
pointing to the actual APLIC domain which is delivering interrupt to S-mode.

>
> I see that others are also confused by riscv,delegate and riscv,children
> properties. It would be great if we could clarify the expected behavior
> here rather than just saying 'the firmware will do the thing'.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
