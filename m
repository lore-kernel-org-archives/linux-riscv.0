Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A768FC46467
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Jan 2023 20:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyLSyus3srCKvWOqygEzNkDS8MF+lLfSoQy2kcRkrFU=; b=RN7D4AeZU8wj/Y
	XPJ5TWFf9S+D/YWutN7Tc9b3L6atjvgcl9WNcVn1I/EiOoM6eFi69dStWY48RsxTGgIxIgjs1jqBU
	7bx2ywDL4y/3Kxrd3nz6glv+jaGvL9r8hfz4SpkXj+htBfG10UTcQncURut48dkxNk8pzvaY1+TWh
	eAAJ1rS2CEIQIqrjNaNSuV2e6m8/YFvDwtEbk3q47WPq0dsBQVILrWqNqyBzJIi6+wzua1BUqfFTq
	Zgp4OUbCe3jKOTdegQ2Cc2k6UX5wbalA2pZVUu+0lqcr9ZRY+fFfIymZ6jcU17HqjnA5H3wvOFeeq
	+gumm5yWNdIcBF/GtKdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEG3Y-008Kff-I8; Sat, 07 Jan 2023 20:44:46 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEG3I-008KeR-4o
	for linux-riscv@lists.infradead.org; Sat, 07 Jan 2023 20:44:29 +0000
Received: by mail-qk1-x72c.google.com with SMTP id h8so2365736qkk.8
        for <linux-riscv@lists.infradead.org>; Sat, 07 Jan 2023 12:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v91NOW33Yw4ld/8hrWNvp88PBg4HhV/z+jC8/6Hxg/g=;
        b=fZ54oarpBPjAErlsUXRhoViKjxS+Cn/Z4UkwKhEcRGsQDW4RJIJGXfbAoqE2KMfT5Z
         mtzUWGbDpzL+U2fJAyQ2Bc5Ccei++KTSWP4KT2QaNJWASRx9wjAjBuNsppuntANxPDE5
         EBGIcqdIoSm3nvswcInG0XGOIAG/LpLwfpYjM0PKqfMVyBbegDMMI2EsM7YRWsr8PYB0
         bt9AxzZ3WSvpTveM6PESRVHeCr6l83+hi0j7+0vyjo7U9JiX3VmUHpBErsd/rI37PUSc
         vTP8BDwvD6Fq8izxU3I0okzgZLMeFfe9VLSubS+S/xXzegRG4FuY4VtCFEzJfJc2Zi0g
         Q8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v91NOW33Yw4ld/8hrWNvp88PBg4HhV/z+jC8/6Hxg/g=;
        b=rvxTVdPJYnpI5lWpC5rkRibcqkz8VpDjXpeR9nl1wQXDR6az6VeCHwXOf4zBV31GkB
         tYIPfr+cpomAqMPw831hqf0np5OkLcBc7Dev9lGVAAsIwX3p+4qWrkCqz+873dD84oA3
         boin3HtwisblxdeEEA/oaCeJ0fptNflNeYS22Q+1v0WUpfnTqTzuOmK1nu8EexF5EpNE
         JLA3hI5S1Ihw9WkPCMwPHCLwZnq0E3Tl3wuBSHFxWMsmCasfHmjh/IgDS+cw14Pj8wO/
         yvnSiFdSdVWi/6SU6KudyD5L2ubpazSaEfGn3Bx+GsXh0G1ySki3zPZeJoJl4f079sYg
         RcXQ==
X-Gm-Message-State: AFqh2kq8g/RDmyGsX43mbnm8THrkCYwBPWmHbEnOQ0fYDXjrLbxPYUCo
	gp2XdnFpOPhheIDicl/VTMKJz1V0kDycX97kN/I=
X-Google-Smtp-Source: AMrXdXueMgeOelADEFUHqX0SiYMVBoF5mWwpL5jyMWhIhE/iVeSWmNE99SCl+Gxh0Q60C5zbuPWE2aryRDkuCqQ+oa0=
X-Received: by 2002:a37:38f:0:b0:6ff:b5c2:9c88 with SMTP id
 137-20020a37038f000000b006ffb5c29c88mr2926548qkd.575.1673124265987; Sat, 07
 Jan 2023 12:44:25 -0800 (PST)
MIME-Version: 1.0
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230106185526.260163-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <Y7iYZqKcoRycsoTg@spud>
In-Reply-To: <Y7iYZqKcoRycsoTg@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 7 Jan 2023 20:43:59 +0000
Message-ID: <CA+V-a8uBDx42o12UUwP=bBjeGzJJSP=jPcQr0xgkvkkoA7_vFA@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] dt-bindings: cache: r9a07g043f-l2-cache: Add DT
 binding documentation for L2 cache controller
To: Conor Dooley <conor@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_124428_230173_31C281CE 
X-CRM114-Status: GOOD (  23.20  )
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

Hi Conor,

Thank you for the review.

On Fri, Jan 6, 2023 at 9:53 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Fri, Jan 06, 2023 at 06:55:24PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add DT binding documentation for L2 cache controller found on RZ/Five SoC.
> >
> > The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> > Single) from Andes. The AX45MP core has an L2 cache controller, this patch
> > describes the L2 cache block.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> > v5 -> v6
> > * Included RB tag from Geert
>
> I think not!
>
Sorry that was a typo. I meant Rob  :)

> > v4 -> v5
> > * Dropped L2 cache configuration properties
> > * Dropped PMA configuration properties
> > * Ordered the required list to match the properties list
> >
> > RFC v3 -> v4
> > * Dropped l2 cache configuration parameters
> > * s/larger/large
> > * Added minItems/maxItems for andestech,pma-regions
> > ---
> >  .../cache/andestech,ax45mp-cache.yaml         | 81 +++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> > new file mode 100644
> > index 000000000000..9f0be4835ad7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> > @@ -0,0 +1,81 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (C) 2022 Renesas Electronics Corp.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Andestech AX45MP L2 Cache Controller
> > +
> > +maintainers:
> > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > +
> > +description:
> > +  A level-2 cache (L2C) is used to improve the system performance by providing
> > +  a large amount of cache line entries and reasonable access delays. The L2C
> > +  is shared between cores, and a non-inclusive non-exclusive policy is used.
> > +
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - andestech,ax45mp-cache
> > +
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: andestech,ax45mp-cache
> > +      - const: cache
>
> You might find value in a specific compatible for your SoC & enforce
> constraints for it. Or you might not & I don't care either way :)
>
Good point actually. Geert what do you think?

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
