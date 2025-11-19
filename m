Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FFBCF259E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 08:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yj9eb9OTfwC+7+x7EvGQGnD2nf8u75Ccq3435FqHGIw=; b=hDN3QOvkabIIu+
	K1K6lVvIF+5P7zL2LyQtL/LsEga7Zb6u8ho4olXdfZ7r0kH+CvTcfvZ6n/4AhUQss+t2wbp3dtu+b
	Y3NmkYiUMA8lt5B32IxS8BlSJrc8Z4p+QTO43hGhYo4b8eCO51g57g2nWhofss88cUXbVhNqwa0SV
	v3Uw0ybR3TSuF4j2sHXeo5pH2LKnoeyx2peTmREtUYtXEWuhsGI/r7VRnfekvok9PQTsQIrU2tBHI
	/cUOei6F01xSlQ8pop/xmY4pFMK08C3BpzTn9rsIIDGQ5N8hrPewh5Qqp9O367XeEy6aH0wZ3Naz5
	j7M/9RvsAe7tJ+l0/gNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdwQ-00000002p3x-2Dgj;
	Wed, 19 Nov 2025 08:53:30 +0000
Received: from mail-vs1-f49.google.com ([209.85.217.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdwO-00000002p3W-0WeD
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 08:53:29 +0000
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5dd6fbe50c0so2585192137.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Nov 2025 00:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763542406; x=1764147206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LS0PIRW3Q0/zfkvWSrpPbMhxA5dRo1SmIMgccBT+00o=;
        b=T9WSpjmzV1HV5BCeWa2zWGDfF2n++F9Y3pH5lPymeuYzC15iZpyo9b5QHApaGchnuT
         VnA+qnhbVHeuHaI8bgQY7jqc0BV0nV/hPLodeunEK0s4AnfNH4jfJ8sFFCl+FZbdamDN
         zJiLlmB8xoFX3mk+LhyU12CryAcYVH4uGGY1qwty41lFSPeVIO+02Yx5vJowEb/bKMCa
         fqUn65Wf7woBKAgGhB57XJNW2Q4pvShzZ1OgX+M65wHkkcorQ9k3S60IsAIff7/wsAwN
         F23EwAYS/144u5gy4YvJO/qLq1llhDy3efNEcP59t55aIz/ignJN5qK6VZCOLPdd5g9Q
         REOA==
X-Forwarded-Encrypted: i=1; AJvYcCUDVPgRwbUiGzO13MtuxezoGBiD86Z4pYOJCjtn22U+BJxK4Absia7Rw018X2iN0pdVcncM1jHkUELcaA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yysek67jJa4B8mW6Ee3igzlAhpO7l2i7QOeAuAmVuMmK3TSYCoF
	HFdZmQToGm3LqqvlGRGvLBuY65lxpcJPkM9MWHOcfA4u1Q9rTulRgx2dh9RWHjJy
X-Gm-Gg: ASbGncs9LfFkRHJFbklEcNBwz2pmn2uDaKZN/1wwtnOub5KIqDQheQ6l5iYYGRXJYtA
	VjcWDDzN/W965tCWhqwhULigGAVOc7+oMlOo1e07iEmdDjAWTfwRaH7SGteYZhs63cECnm18VH+
	/17UIhSDn5hnYtXo5E0fp5NNZQsYAU1G8xA0o07tPS9T2z8owPDUrAAbqgPZkt6evFEvWG2h8at
	pYSWxgEvDVAPZbDRQpHaPBvgd/qdxdKKZBTWvKLcmfdAhI8rePv35+Cqnez8AGH3Fpg3Qt56t6A
	HDMrwS97q8OodzFjeyr/yg9n+xDUm7fpdWEAU8xabez6GN/dL+n9OIsTXdwSJsQZIVhxiqFI/4L
	NknbVCEkHCvCWnDoV9LPsI3tY4Gr2ZLu8F9Perj7pr1xG258PmS/Y25+1/8R/C4MOHLuriu3ny+
	zqadHflZsUyqSM1S6qbZNCmoOWcXGPswsf7BsU1S/p67Nmf8OR
X-Google-Smtp-Source: AGHT+IHnpqcXpb6Tdf5SbDh+k8CmOhuslSEN7gJYPYfrrJP/G6ScNU55qTl+Qb9Hl0H3kb3qszmEnQ==
X-Received: by 2002:a05:6102:e07:b0:5db:cfb2:e602 with SMTP id ada2fe7eead31-5e1a6cb16a0mr550843137.11.1763542406490;
        Wed, 19 Nov 2025 00:53:26 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1844c582dsm2591189137.5.2025.11.19.00.53.25
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 00:53:25 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9372310418bso1798300241.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Nov 2025 00:53:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/I37chG+LnyKp2X0JednHEhAZlLO5YrwUnnR2nIFR2KRQ4YyEy7eivT07ri0EE+BE91qezfDsteQ86w==@lists.infradead.org
X-Received: by 2002:a05:6102:41ab:b0:5df:b4a8:fbaf with SMTP id
 ada2fe7eead31-5e1a6dfeb50mr481222137.31.1763542404865; Wed, 19 Nov 2025
 00:53:24 -0800 (PST)
MIME-Version: 1.0
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <b037f67a-b241-4689-9914-57ff578c1454@sirena.org.uk> <1a4d2276-75e1-4aa0-8ff2-c932ce5d6edc@kernel.org>
In-Reply-To: <1a4d2276-75e1-4aa0-8ff2-c932ce5d6edc@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Nov 2025 09:53:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgq=Zv3GQes_d_eyCcB7m--PaEGSQJtUWiRjj-7gBVkw@mail.gmail.com>
X-Gm-Features: AWmQ_bmK2x20bqzBbl34KnFcBc219BFFPGMTWyPQr3AqlLeaP7gK9n05hJwL6mw
Message-ID: <CAMuHMdXgq=Zv3GQes_d_eyCcB7m--PaEGSQJtUWiRjj-7gBVkw@mail.gmail.com>
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without interrupts
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_005328_194961_D9E4A692 
X-CRM114-Status: GOOD (  32.44  )
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

On Tue, 18 Nov 2025 at 20:55, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 18/11/2025 20:34, Mark Brown wrote:
> > On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wrote:
> >> The Devicetree Specification states:
> >>
> >>     The root of the interrupt tree is determined when traversal of the
> >>     interrupt tree reaches an interrupt controller node without an
> >>     interrupts property and thus no explicit interrupt parent.
> >>
> >> However, of_irq_init() gratuitously assumes that a node without
> >> interrupts has an actual interrupt parent if it finds an
> >> interrupt-parent property higher up in the device tree.  Hence when such
> >> a property is present (e.g. in the root node), the root interrupt
> >> controller may not be detected as such, causing a panic:
> >
> > I'm seeing a boot regression on the TI x15 platform in -next which
> > bisects to this patch in -next, unfortunately even with earlycon (though
> > just earlycon, I don't know the platform specific runes) the board just
> > dies with no output:
> >
> >   https://validation.linaro.org/scheduler/job/4252918#L409
> >
> > It does seem like a plausible patch for this sort of issue though, and
> > the bisect converges smoothly:
>
> All Samsung platforms fail as well. I was waiting with bisection but
> Marek was as usually very fast:
>
> https://lore.kernel.org/all/20251118115037.1866871-1-m.szyprowski@samsung.com/

Yeah, the various ti,omap[45]-wugen-mpu nodes have interrupt-parent
properties, but no interrupts{-extended} properties.

Does the following (whitespace-damaged) patch, to restore finding an
explicit interrupt-parent, fix the issue?

--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -685,6 +685,8 @@ void __init of_irq_init(const struct of_device_id *matches)
                desc->interrupt_parent = of_parse_phandle(np,
"interrupts-extended", 0);
                if (!desc->interrupt_parent && of_property_present(np,
"interrupts"))
                        desc->interrupt_parent = of_irq_find_parent(np);
+               if (!desc->interrupt_parent)
+                       desc->interrupt_parent = of_parse_phandle(np,
"interrupt-parent", 0);
                if (desc->interrupt_parent == np) {
                        of_node_put(desc->interrupt_parent);
                        desc->interrupt_parent = NULL;

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
