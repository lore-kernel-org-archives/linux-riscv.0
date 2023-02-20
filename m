Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F4FC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 03:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UeqemSvIbIQ3ZbFQ4O4C+Ow6dHZzmyGrW6nJUzzlcF0=; b=UgOcwERmVcqbe8
	NRPKQVr+PVBtvYP+fULq4HXUudsM4hpX4ntw0BPM2grKCxUbKJ61No5bZFmmxQ5PARthkuOJWGSGi
	BWh8os3QODMyrs4GblDrcxUyBaiDgZc3pxFU5nNmvqhRaUdUfWrfWqwmB7K/haJzpzDInhrB0bn6o
	0j27btgtrBrudnd3+M8UvFksCfATF29Byo1XYC6PGByC5TTrMd7fYmZRQxN/ho+tacnTYuiSbkK1g
	2gWO6L2Td/wiW1nmXu9A7DxRaEPPTNGmuL+BjPAoGi3WKsfsnvF6Guw/NCKN1RcShiLa7/o1qFQkX
	tzkcDA19tnYfuJyREhcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTweX-002sLO-O8; Mon, 20 Feb 2023 03:15:45 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTweU-002sKk-CL
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 03:15:43 +0000
Received: by mail-vk1-xa31.google.com with SMTP id bv12so998586vkb.1
        for <linux-riscv@lists.infradead.org>; Sun, 19 Feb 2023 19:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qDEo7h14JCqjFZhX9T9o37K1/31fniHrrScLeZaTu44=;
        b=iwTYhHPzEmsEYTsJ38WY7NZ9WL0o7hbRKDkv+cgmSVaE2uoSciZmW70L9fmjw26p2C
         yyfWgWPclCkgM71Ho2+n4ptR08pLTqmCt7l5oHWekRShFF3rLK++OK/XVyUbYcHK+0c3
         J299bPGl/FHqFdgLeIaI8HU+g6iwzvbnNgWQ8boH6WsxgpWBrHNiTy+nJlTsKOk3zICf
         7upg4roVGRkbgul1SOTb/JScpnpO299x9rEeH3yGRQZJAi7e5+uHmcYl1nX2WJPLkwG+
         dzydwyc8fonnWyAEP4apnXaMI/DQcMkyyHI6XNl7wVRxlr90ufygyWTW1QViqThTlewh
         sy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDEo7h14JCqjFZhX9T9o37K1/31fniHrrScLeZaTu44=;
        b=dPWEYxiiK6V9ow96u4mEOt7hHlo3wOSB/cXRONU+TtacWq8muuwOewXboAthfxRA23
         lzsfMfYIUqbLV5BpJQkCTTuxO7gF6LLH5j2zna2UkEhUOcV7Q4FK1UkzDSxj0zcziFdC
         GHs5z1O4laUU858Uqp5BSjW9zKZDLfDxtsxtEVTINmKKnlgj/sacrZ7DpH80w8BEGIlX
         ubnesbCFR0byNhe8rNi5NjsMin19Ux1L2Ph6/rfZLBMSsFJ25raTMptwd2fNi7AkUbRD
         9gsA8K9CrlZVtoihqn3Qd+hiv3iDP2+lbVcvqFMJX+CAWYiA2e0f1dq20li4Yy6i8zm8
         aoSA==
X-Gm-Message-State: AO0yUKW0TgYN0slxz9LLJ4r2Hfk1DZL6ilxCMmxKqdq1jH3OjgG7/ZRH
	6PyQhlx/bKndUfznpP0XEBzeuBb6PhfolNW4EMyPEA2sJuNe3w==
X-Google-Smtp-Source: AK7set+NMrUhJmp47RKiMI0WwF/B4IjKr/OM5C9J0CG4b84WmRB/0szDBNaOmRhNMMUCW/p8YcNtiRuVpTm12Pn2BHQ=
X-Received: by 2002:a1f:a682:0:b0:3d5:9b32:7ba4 with SMTP id
 p124-20020a1fa682000000b003d59b327ba4mr85115vke.15.1676862939933; Sun, 19 Feb
 2023 19:15:39 -0800 (PST)
MIME-Version: 1.0
References: <20230103141409.772298-1-apatel@ventanamicro.com>
 <20230103141409.772298-5-apatel@ventanamicro.com> <Y7YJ9j9a+DQVF/dp@spud>
In-Reply-To: <Y7YJ9j9a+DQVF/dp@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 20 Feb 2023 08:45:28 +0530
Message-ID: <CAK9=C2WZ-RGQNK2p6AJwRKZ5mknh2A7DGN_GvTPtu1k2BuahmQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] dt-bindings: interrupt-controller: Add RISC-V
 incoming MSI controller
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_191542_450526_82031CD3 
X-CRM114-Status: GOOD (  17.29  )
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

On Thu, Jan 5, 2023 at 4:51 AM Conor Dooley <conor@kernel.org> wrote:
>
> Hey Anup,
>
> On Tue, Jan 03, 2023 at 07:44:04PM +0530, Anup Patel wrote:
> > We add DT bindings document for the RISC-V incoming MSI controller
> > (IMSIC) defined by the RISC-V advanced interrupt architecture (AIA)
> > specification.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > +  The IMSIC is a per-CPU (or per-HART) device with separate interrupt file
> > +  for each privilege level (machine or supervisor).
>
> > +  The device tree of a RISC-V platform will have one IMSIC device tree node
> > +  for each privilege level (machine or supervisor) which collectively describe
> > +  IMSIC interrupt files at that privilege level across CPUs (or HARTs).
>
> > +examples:
> > +  - |
> > +    // Example 1 (Machine-level IMSIC files with just one group):
> > +
> > +    imsic_mlevel: interrupt-controller@24000000 {
> > +      compatible = "riscv,qemu-imsics", "riscv,imsics";
> > +      interrupts-extended = <&cpu1_intc 11>,
> > +                            <&cpu2_intc 11>,
> > +                            <&cpu3_intc 11>,
> > +                            <&cpu4_intc 11>;
> > +      reg = <0x28000000 0x4000>;
> > +      interrupt-controller;
> > +      #interrupt-cells = <0>;
> > +      msi-controller;
> > +      riscv,num-ids = <127>;
> > +    };
> > +
> > +  - |
> > +    // Example 2 (Supervisor-level IMSIC files with two groups):
> > +
> > +    imsic_slevel: interrupt-controller@28000000 {
> > +      compatible = "riscv,qemu-imsics", "riscv,imsics";
> > +      interrupts-extended = <&cpu1_intc 9>,
> > +                            <&cpu2_intc 9>,
> > +                            <&cpu3_intc 9>,
> > +                            <&cpu4_intc 9>;
> > +      reg = <0x28000000 0x2000>, /* Group0 IMSICs */
> > +            <0x29000000 0x2000>; /* Group1 IMSICs */
> > +      interrupt-controller;
> > +      #interrupt-cells = <0>;
> > +      msi-controller;
> > +      riscv,num-ids = <127>;
> > +      riscv,group-index-bits = <1>;
> > +      riscv,group-index-shift = <24>;
> > +    };
>
> How is, say linux, meant to know which of the per-level imsic DT nodes
> applies to it?
> I had a quick look in the driver, but could see no mechanism for it.
> Apologies if I missed something obvious!

This is very straightforward. We simply look at the local interrupt number
in the "interrupts-extended" DT property.

Currently, we use the same technique in PLIC driver to distinguish
M-mode PLIC context from S-mode PLIC context.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
