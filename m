Return-Path: <SRS0=emcE=ME=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B541C07E99
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jul 2021 11:24:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 065CD610C7
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jul 2021 11:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 065CD610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJyhzew8VcuvbBEaN3U1aB+SobeKCUS9wJXvSWPRvTM=; b=sVLIgGMdCbmCo4
	slzPUO688gzfyHgg7Tij8J1e/Dl3WvTS/Ax9bv9s+sgkfTHYA08olmay+buLwa3oCkaWIbd3H1R+S
	V7yp+6rGwG0v/b7fSbzNQg45/SZlq2ajdGQKf0+MiLU2kyqM27lYt64QYjTo6fQkoqfGZMkoxXrYh
	RELPXSm8X2Elng8DW5N93/pDed3iJBmjGVRY/so3rZQsLcCDVKVExPXm/JF+loO9Ji7n1Ww/6piKr
	RjVnRLLxCEDYFozDWGSlY3b4bhn/SiAyfchYKcUc5sF5zQnc7xWwqHXdPYmBF2m9zOu/k3fyIhG9e
	VQ6Si4znQ3g74SvmaM3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2u39-00784B-PI; Mon, 12 Jul 2021 11:24:35 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2u37-00783f-2h
 for linux-riscv@lists.infradead.org; Mon, 12 Jul 2021 11:24:34 +0000
Received: by mail-vk1-f171.google.com with SMTP id az15so175261vkb.9
 for <linux-riscv@lists.infradead.org>; Mon, 12 Jul 2021 04:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wSI56+0wl/8uoFZkYYEX3Cn5WjSYU9NFzgAm+bp0lBU=;
 b=tB3fP/8dw4kNEicV26Mc0eJ88JvZ9ngZIi1FkicY8MbxMS8NJ3Do64TdzexiSFMYf1
 PcjiX4G9AcqSe4A2eAkGH06dNKN1eilzMOkAYQ8F0VKWgq/fqDUe8mxhTH8oFnogWHVC
 aZykCqTP4xKWMAbPqV2d5vkHkQg6YzSLDLT3vFDeAfPLC2+VG03brryegvltd2NQOR4b
 AzloCFoeaTUSN8foJv9vaVyHC15fBj+fekmmGpLtmD8nwHNOKU+e1+0nk+oRj1XNAH5i
 g4i3skSxxsQ3TerVHV/MA01nmbaYEc5OUYQf/ZTaoRhWG34emboHDd3tV/Q2a+P99DFL
 50aQ==
X-Gm-Message-State: AOAM5328NuSdDz7UDtV4ylNYoNkyuDwe2kbNhiXGqlMWjKlJRCF8sYvi
 sWSlr/qOhP4ZPekUqpCIUxY55NlrL/JcdrCXPFE=
X-Google-Smtp-Source: ABdhPJzl+b8ID+5NtPNSzacYozt9cW/uQxXEYZQYcG4NKJ5aeR9N2kMo9YCHMcaHTF4gY4uSOKuGr5NU+gxzNe5ovNo=
X-Received: by 2002:a1f:1a41:: with SMTP id a62mr42439346vka.5.1626089070907; 
 Mon, 12 Jul 2021 04:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210709201603.2625664-1-drew@beagleboard.org>
In-Reply-To: <20210709201603.2625664-1-drew@beagleboard.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jul 2021 13:24:19 +0200
Message-ID: <CAMuHMdVBVAzy3cZtR1pOTNq3wTgGx+0_dvUXU118XfT+rCOSrw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: riscv: add starfive jh7100 bindings
To: Drew Fustini <drew@beagleboard.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Zhu <michael.zhu@starfivetech.com>,
 Wei Fu <tekkamanninja@gmail.com>, Jack Zhu <jack.zhu@starfivetech.com>, 
 Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Emil Renner Berthing <kernel@esmil.dk>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_042433_161871_FFCFFB7A 
X-CRM114-Status: GOOD (  23.02  )
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

Hi Drew,

On Fri, Jul 9, 2021 at 10:17 PM Drew Fustini <drew@beagleboard.org> wrote:
> Add DT binding documentation for the StarFive JH7100 Soc [1] and the
> BeagleV Starlight JH7100 board [2].
>
> [1] https://github.com/starfive-tech/beaglev_doc
> [2] https://github.com/beagleboard/beaglev-starlight
>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> v3 changes:
> - added revision number for the board and soc after question from Palmer

Thanks for the update!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/starfive.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive SoC-based boards
> +
> +maintainers:
> +  - Michael Zhu <michael.zhu@starfivetech.com>
> +  - Drew Fustini <drew@beagleboard.org>
> +
> +description:
> +  StarFive SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: beagle,beaglev-starlight-jh7100-r0
> +          - const: starfive,jh7100-r0

While I can be convinced about the board revision number (probably you
know better if there will be different board revisions that matter),
I'm wondering if the revision number makes sense for the SoC part.
Will there be a new revision of jh7100, or will the next revision
be jh7110, which will use a different compatible value anyway?
Is there an on-chip register that allows the kernel to find out the
revision info? Might be better to use that with soc_device_register()
and soc_device_match().

> +
> +additionalProperties: true
> +
> +...

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
