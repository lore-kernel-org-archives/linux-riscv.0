Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C2FC25B0E
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 08:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kc4ZBoPeI/9jMAtUp/sX7Nslc/xfvvuJSCqq4pdkKEQ=; b=QEpN3YWMu9shO6
	78ErV1vrQcNM0Te4fB2fJUVuY4GNxwRSg+l6IInAVWtCENUgNPb8OhiyrBxyXPeSVQoV6ceynny+Q
	nnuEiKP6amzHC+oKJSIpkDdtoHVhv1yMb5RELHtFzma5o1vy7etPtMlHFfL9FtMQoAQ4DLIK/GrtI
	0GfbJVRjIe3f0GJ4QDhMMF7/1PlOI+brqgMKz6UgtEBpnS5Uv8nyqPE5jJYXxYrPBhoxcu/jUJR9T
	dXiudlxqAJ15tzJOLEwgbLjGapP6+Ao+xJXyivvKIlPP/ilqYDCkf//npW3D2wxXP6catCykQ9kFo
	yT5T8bYkCNpDECGPiVRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOxam-004GSU-4i; Fri, 19 Aug 2022 08:43:00 +0000
Received: from mail-qv1-f53.google.com ([209.85.219.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOxaj-004GK8-BY
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 08:42:58 +0000
Received: by mail-qv1-f53.google.com with SMTP id de16so551507qvb.12
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 01:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+Cq03o2awZ2CNavLumSobGfio3EFTtGHTSm82q82K2A=;
        b=cB+ihCPsln9FIwgNg7MFTBoEDy7N2g0bJ5XkP+ms7u4j96+WquxoZdlFGOQbYFfnE7
         QlUG9dGwvs7FwYhB1HV1mXkHg1FeyHbbkVqQvb+GP4Bwg4FI73RRXQuIw9HMf/NKnquT
         WYyckhTTObilxzqeNRhnXuaujOMJY9+wdBAAC22THpslX87nvSR9zxA8WoQL+c4ASVND
         uoRORINEC+5CdnVNLCWN+vQjWPxg1gJiFDaMcLgVGgODQIwfGX7QxhDxVtArnRd2D+Dl
         Adl4NXSs3A5sEGDp77QlSARGm9O5VCnwj1OK7BEaqxw7Ygdujl4rj8Dq1h1cbLkNyCrT
         OcZQ==
X-Gm-Message-State: ACgBeo39CrSgkBH8P2zj64RvrHTTGNqR8AYQidmuq5lH+1vE1KbYyHg6
	5V1R6aZ2yXhc4Ocu5cHussreTw6tzZ2ONQ==
X-Google-Smtp-Source: AA6agR7fm0nKBL+x81yxrRkGQwvYUXXs4/I7wtK7Wz6CAK3gZ8sFz7gbVKAGWhgPUisEvtlvlFGHwA==
X-Received: by 2002:a0c:b298:0:b0:473:8d6a:df00 with SMTP id r24-20020a0cb298000000b004738d6adf00mr5519700qve.71.1660898575094;
        Fri, 19 Aug 2022 01:42:55 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id f21-20020a05620a409500b006bb2bca5741sm3746709qko.93.2022.08.19.01.42.54
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 01:42:54 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-324ec5a9e97so104154387b3.7
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 01:42:54 -0700 (PDT)
X-Received: by 2002:a5b:bcd:0:b0:68f:b4c0:7eca with SMTP id
 c13-20020a5b0bcd000000b0068fb4c07ecamr6714080ybr.202.1660898573940; Fri, 19
 Aug 2022 01:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220815151451.23293-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220815151451.23293-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Aug 2022 10:42:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEVtu2zf0R5+LufxHWLtG0=aEvPkfcF=K9V025_TCTrQ@mail.gmail.com>
Message-ID: <CAMuHMdVEVtu2zf0R5+LufxHWLtG0=aEvPkfcF=K9V025_TCTrQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] MAINTAINERS: Add entry for Renesas RISC-V architecture
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <Conor.Dooley@microchip.com>, 
	Anup Patel <anup@brainfault.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_014257_424300_25781074 
X-CRM114-Status: GOOD (  19.25  )
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

Hi Prabhakar,

On Mon, Aug 15, 2022 at 5:16 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Initial Renesas RISC-V architecture support will be for the
> RZ/Five SMARC EVK board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17562,6 +17562,16 @@ F:     drivers/spi/spi-microchip-core.c
>  F:     drivers/usb/musb/mpfs.c
>  F:     include/soc/microchip/mpfs.h
>
> +RISC-V/Renesas RISC-V ARCHITECTURE
> +M:     Geert Uytterhoeven <geert+renesas@glider.be>
> +L:     linux-renesas-soc@vger.kernel.org
> +S:     Supported
> +Q:     http://patchwork.kernel.org/project/linux-renesas-soc/list/
> +C:     irc://irc.libera.chat/renesas-soc
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
> +F:     Documentation/devicetree/bindings/soc/renesas/
> +F:     arch/riscv/boot/dts/renesas/
> +
>  RNBD BLOCK DRIVERS
>  M:     Md. Haris Iqbal <haris.iqbal@ionos.com>
>  M:     Jack Wang <jinpu.wang@ionos.com>

Perhaps we should merge them all into a single section for "Renesas
ARM/ARM64/RISC-V ARCHITECTURE", to follow up on "[PATCH/RFC]
MAINTAINERS: Merge ARM/Renesas ARM64 and ARM/SH-Mobile ARM
architectures" I've just ssent?
https://lore.kernel.org/r/a869b8afdc47aa637ebeefcc1ca7bc61244f34b9.1660898008.git.geert+renesas@glider.be/

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
