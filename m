Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34FDCF3196
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 10:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zaqtgo7edUtJFFA4nSnNhZ0sb7tuKxykDVhCgyUg8b0=; b=BGNfR9z8HDspXg
	vg9WJrMDYnHcrlpR3lfi9AfWyUtgxz6vY4zz1B3hdonjqjC98Sv7W6jD6BrOFrYM2LAYCwMqf0sIk
	5GuDj6USFMIw06pRSO9X5FFI8cuouB3GXttji5bWBupcB3CjUAqNG+HvXNjmE250iGkwsquF79/nE
	7tqAxbew4cZXfyq8Um1c48ZEs06U5DtnIb9VGG1CMzVn25CR9hewYhfsvp2lA0jy3DkEmSVaM2bPs
	AA/cEZj7OBVnOSGfuRxojZq9QJNSIGj9b8msL2ZwL2KIEKQDv2JWyTiFbYyZ6IkWTnn0FnG6ON+Pv
	rAjbDmeVb+J4qjGPRFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfuH-00000002zw6-2ium;
	Wed, 19 Nov 2025 10:59:25 +0000
Received: from mail-ua1-f50.google.com ([209.85.222.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfuE-00000002zvX-3RzE
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 10:59:24 +0000
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9374ecdccb4so3685736241.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Nov 2025 02:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763549961; x=1764154761;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01vJ+iTaEhlqFfqqNaTQ+Xj9o5ybGoOTheiB42bAFn0=;
        b=j79CHbM7tXi8DEwEe/nfryxoSrM5fcIGY2iiNvCb5CoiNZjPNBx2mOi8sW3lt+Mq8s
         rGdU5mwKmndQ7xLIOTAUgd4WJaG2oaLsobZ1qHJo2SKjfWVJKCpOMDCz8a3s4TBiubJr
         lqnhuNfPqROKR1go1rcD0OrgTh6ETrURp6IhgzjpwUZWj2xx4QHU/7UcjV2T5dzACKzo
         gSDaLeRWofUcDG3qfw+2/jttxxLsHPc/wrzpZblTR4fldvgJcsUtzhCpHG+AgqSol2Oq
         L6JXSzTWRnXnoycfrsetVnPcYDSj7Ey7qy6GAWqiAbhVuirQ8CU3nHt850k8cGO28jGo
         ISkA==
X-Forwarded-Encrypted: i=1; AJvYcCV2A16i7qWNHPKGrRtD9Cfl7Lh0UYXwSaS+IwAGz5k6hywvosznID1h5HQI1B6jxJikUbsGnND3qj8/Yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRSMZD+IsvaeB66sqDN+mbIx3OjVsdVkiGHTvhs1t1mUN7rwV5
	9ha7A0TQPQCgUY0LaLEdXSjlz2yB4KfImQm0jowqYJ+xG07vA/BSaHEWK9YMMxg0
X-Gm-Gg: ASbGncsHcLuvYlI8p1HVsp8cy9XxNuC/PQ0iCO+U81K1Ol3QWYzahoF/rdxaSCxNJIW
	sGtpuxkzkmxA5dHkk5WDfHryN54MjfaWNNPPdYc0V9uOCDQF7CI6xhhqFOomQPkuW4RzBuAzVff
	HY/WM4476BFSXuz2RZjaCGU6E63rnysQUOV2ouKrT5hW2V98YzTg5LEsN9k4oFW6Jbxd39Iy9sv
	zB+tySGgXod6QS/6xPS9H5IJsnvyPiVn1Idun0TvUTlp3+mLId7nkawqDgmjSvNtli1MZvbUX0j
	EHJSQ614G2HPsP43WBGWUzH77Io56MpO5gqVsJF/d/VlUBNrYLCt42hjLYvmSO+thOkNznsfeEY
	mEhWGRkJJ+zBZTv3Wklb1DMtahRSIqKmDtGz2J+CyU1p9L+2JVQjgjRWBHHKsNN4AWbekU0LM/d
	02hNVBAQUIWboz7HgxPLXYkVOXLuNvhXUOR33BoXQ5y9zpI+zwMVsRtqeODw9EdHzt9zo=
X-Google-Smtp-Source: AGHT+IF89OC2VLR6Q1BaByW22UvX75mYJmJknY2X+czuvaqpZPJ0sQM8GMUPUQoFTzTWTjO64vWUzQ==
X-Received: by 2002:a05:6102:c4f:b0:5d7:e0ea:8d25 with SMTP id ada2fe7eead31-5dfc5bd27bcmr6936073137.38.1763549960894;
        Wed, 19 Nov 2025 02:59:20 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93761196556sm5803442241.9.2025.11.19.02.59.19
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 02:59:20 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5597330a34fso4001889e0c.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Nov 2025 02:59:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVjo6OuuS5HrGMgfrKDJ480FSS+oSjiF3e6Z7RLDk/QzJ4D31WLffcd7KoSUywt27UqkTI5QQpyLlTpkQ==@lists.infradead.org
X-Received: by 2002:a05:6122:4582:b0:549:f04a:6eb3 with SMTP id
 71dfb90a1353d-55b1be64f5amr6929551e0c.9.1763549959520; Wed, 19 Nov 2025
 02:59:19 -0800 (PST)
MIME-Version: 1.0
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <b037f67a-b241-4689-9914-57ff578c1454@sirena.org.uk> <1a4d2276-75e1-4aa0-8ff2-c932ce5d6edc@kernel.org>
 <CGME20251119085902eucas1p223cb580bdd4cef2698382835c77210e8@eucas1p2.samsung.com>
 <CAMuHMdXgq=Zv3GQes_d_eyCcB7m--PaEGSQJtUWiRjj-7gBVkw@mail.gmail.com> <765d114d-6a03-4535-a644-5e7581dfbccc@samsung.com>
In-Reply-To: <765d114d-6a03-4535-a644-5e7581dfbccc@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Nov 2025 11:59:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5ixRpE+yPbggBG91+516YD+ARkaCLN-gM8bQLvtqrYg@mail.gmail.com>
X-Gm-Features: AWmQ_bmyj7uEfaaHTRs_Dlhmh8ug_B799_bBc6DeLqXxY0jfIRw0Qy-WNEKxB9g
Message-ID: <CAMuHMdU5ixRpE+yPbggBG91+516YD+ARkaCLN-gM8bQLvtqrYg@mail.gmail.com>
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without interrupts
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_025922_906371_E5644C66 
X-CRM114-Status: GOOD (  36.18  )
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

Hi Marek,

On Wed, 19 Nov 2025 at 10:55, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> On 19.11.2025 09:53, Geert Uytterhoeven wrote:
> > On Tue, 18 Nov 2025 at 20:55, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On 18/11/2025 20:34, Mark Brown wrote:
> >>> On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wrote:
> >>>> The Devicetree Specification states:
> >>>>
> >>>>      The root of the interrupt tree is determined when traversal of the
> >>>>      interrupt tree reaches an interrupt controller node without an
> >>>>      interrupts property and thus no explicit interrupt parent.
> >>>>
> >>>> However, of_irq_init() gratuitously assumes that a node without
> >>>> interrupts has an actual interrupt parent if it finds an
> >>>> interrupt-parent property higher up in the device tree.  Hence when such
> >>>> a property is present (e.g. in the root node), the root interrupt
> >>>> controller may not be detected as such, causing a panic:
> >>> I'm seeing a boot regression on the TI x15 platform in -next which
> >>> bisects to this patch in -next, unfortunately even with earlycon (though
> >>> just earlycon, I don't know the platform specific runes) the board just
> >>> dies with no output:
> >>>
> >>>    https://protect2.fireeye.com/v1/url?k=7efe2b91-216202bb-7effa0de-000babe598f7-79b85fd5422be185&q=1&e=a2b4aea0-c947-472b-ae80-9160750f84a2&u=https%3A%2F%2Fvalidation.linaro.org%2Fscheduler%2Fjob%2F4252918%23L409
> >>>
> >>> It does seem like a plausible patch for this sort of issue though, and
> >>> the bisect converges smoothly:
> >> All Samsung platforms fail as well. I was waiting with bisection but
> >> Marek was as usually very fast:
> >>
> >> https://lore.kernel.org/all/20251118115037.1866871-1-m.szyprowski@samsung.com/
> > Yeah, the various ti,omap[45]-wugen-mpu nodes have interrupt-parent
> > properties, but no interrupts{-extended} properties.
> >
> > Does the following (whitespace-damaged) patch, to restore finding an
> > explicit interrupt-parent, fix the issue?
>
> This also fixes Exynos case without any need for the changes in

Thanks for testing!

> arch/arm/mach-exynos/suspend.c. The question is which approach is preferred?

It looks like several other drivers are affected.  So I think it
makes sense to handle the presence of an explicit "interrupt-parent"
in an interrupt-less interrupt controller node in the core, instead
of in each affected driver.

> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -685,6 +685,8 @@ void __init of_irq_init(const struct of_device_id *matches)
> >                  desc->interrupt_parent = of_parse_phandle(np, "interrupts-extended", 0);
> >                  if (!desc->interrupt_parent && of_property_present(np, "interrupts"))
> >                          desc->interrupt_parent = of_irq_find_parent(np);
> > +               if (!desc->interrupt_parent)

Or "else if (!desc->interrupt_parent)", to avoid repeating part of
of_irq_find_parent() when an "interrupts" property is present?

> > +                       desc->interrupt_parent = of_parse_phandle(np, "interrupt-parent", 0);
> >                  if (desc->interrupt_parent == np) {
> >                          of_node_put(desc->interrupt_parent);
> >                          desc->interrupt_parent = NULL;

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
