Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2A3C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 15:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUtwCazOD+XRZNkThw5qahCYbBTUKEHgNFU3AKOl7wk=; b=gTIjF8TdTvrPiB
	1BjTv3IsdO1jPBuT+/K6AIAoVy6YmqZKqod0W5BHLf3GuJ35MEd+o2z9m7lzK8/mi67IQDBz42Ahd
	6ihAR+64yHBtL82L4jbUcTyKIKhqfKDhZL8qcuYQ2R8L4O3cpnl8vodAk6vrkWvzPxiC1rS8HMtIY
	guf0VPN4FBTRZLDbxO2whKZ8npx7p/tYhrdzMU0OuLuNfndKJIF0AGyrsFJRrPpr8INP7I5ECB8O0
	MP17SKOnKmGNSDKSzi1wfAsktwk9WlLV+YaSYdi962s9VQQl2nCDPt+LxAfrx+uHDeTb2mIdsFHvG
	DyCBADPO4vTcGYf4XbWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQte-006aMM-1C; Tue, 08 Nov 2022 15:52:18 +0000
Received: from mail-qt1-f179.google.com ([209.85.160.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQtZ-006aLa-BE
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 15:52:17 +0000
Received: by mail-qt1-f179.google.com with SMTP id l2so8850301qtq.11
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 07:52:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5KUR+OrhKv8Dk8eQjpB3hNK7Qj5y9AJxP2N44RuaHw=;
        b=Jrf2agyfcEaHq1BH+ISHmfuRfiksBocRIqQQuxEKSbzUTeoxiuJbbpyDKPHr/MQPxO
         VAPm0pl3/GYVrc06seDPgPbRkdfyk/KEqXQTtkpiMWp/I6zRyKCsKFF/nTweSVFLiLnp
         sL7U7SXT3ZgzV58KPuF0ikETAkOYd0p3CwDG7QkC41K9cn4gZV9pzcpQ6lt13jq/u6LJ
         oTLZzBsgh/qkC8aZHDZF4488bm8v551m4ICHIhX6D8Pv0wSXiXFeyR8PqpagW9SYwT/S
         aXqicro6vFTzR9nARpzbzFhkrzcEaPTZ4EkcJDU2gBDoOecsseEES9KXIItXxTQWr35R
         xXTw==
X-Gm-Message-State: ACrzQf2EKLT+KOGH4mosM9HrFYcpondzJi3VxbLFcEkVFwyiM4yUo6T6
	fmHtjc8ny2t5SuMf/iZ8WNX49Crfy0FdfBGM
X-Google-Smtp-Source: AMsMyM5+XaHX3PptgxrkGyPlFit8B/vR9V8Q2xTsFrjDg6yyvLBLdwlkF4fAgJ3hzNx3dHWgqIfQqg==
X-Received: by 2002:a05:622a:1654:b0:39c:ded0:4780 with SMTP id y20-20020a05622a165400b0039cded04780mr44157141qtj.688.1667922730228;
        Tue, 08 Nov 2022 07:52:10 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id c22-20020ac87d96000000b003a5416da03csm8446753qtd.96.2022.11.08.07.52.08
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 07:52:08 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-333a4a5d495so137416127b3.10
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 07:52:08 -0800 (PST)
X-Received: by 2002:a81:b80f:0:b0:36b:56d3:71b8 with SMTP id
 v15-20020a81b80f000000b0036b56d371b8mr923825ywe.384.1667922727704; Tue, 08
 Nov 2022 07:52:07 -0800 (PST)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221028165921.94487-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221028165921.94487-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Nov 2022 16:51:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKVxO24Qgyx37tbs5+m0Us0VF3eTZCC2KV=AC8z2JneQ@mail.gmail.com>
Message-ID: <CAMuHMdUKVxO24Qgyx37tbs5+m0Us0VF3eTZCC2KV=AC8z2JneQ@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] riscv: configs: defconfig: Enable Renesas RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_075215_906310_58D350B2 
X-CRM114-Status: GOOD (  22.55  )
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

On Fri, Oct 28, 2022 at 6:59 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable Renesas RZ/Five SoC config in defconfig. It allows the default
> upstream kernel to boot on RZ/Five SMARC EVK board.
>
> Alongside enable SERIAL_SH_SCI config so that the serial driver used by
> RZ/Five SoC is built-in.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4 -> v5
> * No change
>
> v3 -> v4
> * Explicitly enabled ARCH_R9A07G043 config (note I have restored the RB
>   tags with this change)
> * Used riscv instead of RISC-V in subject line

Thanks for the update!

> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -29,6 +29,8 @@ CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_STARFIVE=y
>  CONFIG_SOC_VIRT=y
> +CONFIG_ARCH_RENESAS=y
> +CONFIG_ARCH_R9A07G043=y

You forgot to refresh after moving ARCH_RENESAS in v5 of "riscv:
Kconfig.socs: Add ARCH_RENESAS kconfig option", and after relying on
ARCH_R9A07G043 in drivers/soc/renesas/Kconfig.

>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
>  CONFIG_PM=y

PM and GPIOLIB are auto-selected by ARCH_R9A07G043 (through ARCH_RZG2L)
resp. SOC_RENESAS, so they can be dropped.  But it's better to do this
after the release of v6.2-rc1, when all pieces have fallen together.

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
