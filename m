Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5B7C677F1
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 21:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVy+Ac5VWFF1GVYnQb4T2aAPFdJrkGa2QVmza1V5mtA=; b=LJ8hRHSmS2xZVU
	K0FQ+KS7Hh6zeUNXKbFOw3mSqq9PBU9tTU7V4om23olTMMDu65OuCkD7a3PgLfgWG5t/DklBpaFTG
	+p70GqOmd6tO0br9HPH1UXwN3QfnJG/HUS7r18vZ7fkqQ9o3VtJiZppb+It7jiYeeh2z0mNIGg4Td
	ow0bsvTvuaFvbnXuf68vTtifYuxA9zACROEyoX5Bo9m3/3ZcJ9q7FmzuVNSAAszD2J8dlpgAoHqg+
	A7mPp94Px3PCizjclJO6soXcssdCkPM9fEsWTXzgYi6gWr6VOa/9PgXsjBh3JkGP8SIzSdrpK7LtD
	Wvbe9jT4WpiV0PbcnU5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFLxd-008aMt-Sm; Tue, 10 Jan 2023 21:15:09 +0000
Received: from mail-qv1-f53.google.com ([209.85.219.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFLxa-008aLj-GD
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 21:15:08 +0000
Received: by mail-qv1-f53.google.com with SMTP id p17so9389764qvn.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 13:15:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VTwrAlOkb4T+2AUPT7ynzTkpDD8WxyWMcBCwyeuWNno=;
        b=iuc4wksoGzRHKoFuo63ZX9i+x6HDSqtc147+FZtyyqgPlVWLWH2pOkONPadl3vfpje
         QTOv+IxU4IrHL2oBXo+OGDZ1PaX0j76NX0evguZI4xchit31SUYdcA2ivGIL2aFb7m/A
         es7xTsRlBaabqbZX8bjuA/0l970NCZOUKBINGzfp6ly2wZmT3siz5Ln1US6wK0NAfgRD
         XjgvGnCst8y8PaHJFzeIkVtAU8SgOFedHChFStX2+ZUM2LhirCQ27fKjlOAMGJv6EF64
         u5VdPnCT2c+xpIJ4nHzGILsu9mCDnK/z9XekTU8MC5RNO1p9Gw1c+3Ux6T5A7MNYxsyO
         jt2Q==
X-Gm-Message-State: AFqh2kqTV/o+QRT4CgbcuXCuh7hc+dvuCXFTZwh+gTW5GvPB4vzefcIw
	UshyundJ0kjmDZqjXJb4J5uxhfiS+OFEEA==
X-Google-Smtp-Source: AMrXdXs1LnfURpM9iFjModCrp3c3vXJWbjTv/+3QM1VE1RwuHSc1GUdnvxMUXHzwTHOzej4Hhg2pKQ==
X-Received: by 2002:a05:6214:21c9:b0:532:2900:c5cb with SMTP id d9-20020a05621421c900b005322900c5cbmr24766110qvh.29.1673385304376;
        Tue, 10 Jan 2023 13:15:04 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id h9-20020a05620a244900b006cf38fd659asm7904194qkn.103.2023.01.10.13.15.03
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 13:15:03 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id t15so13127912ybq.4
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 13:15:03 -0800 (PST)
X-Received: by 2002:a25:5189:0:b0:7bf:d201:60cb with SMTP id
 f131-20020a255189000000b007bfd20160cbmr515258ybb.365.1673385303381; Tue, 10
 Jan 2023 13:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20221121221414.109965-1-conor@kernel.org> <20221121221414.109965-2-conor@kernel.org>
In-Reply-To: <20221121221414.109965-2-conor@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Jan 2023 22:14:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVoMzox6FdPFsR515nnEYXtCt-Xs5qBgGQigzL2=Q7kPg@mail.gmail.com>
Message-ID: <CAMuHMdVoMzox6FdPFsR515nnEYXtCt-Xs5qBgGQigzL2=Q7kPg@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] RISC-V: introduce ARCH_FOO kconfig aliases for
 SOC_FOO symbols
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Heiko Stuebner <heiko@sntech.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Samuel Holland <samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_131506_573429_22A65C24 
X-CRM114-Status: GOOD (  23.10  )
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

On Mon, Nov 21, 2022 at 11:18 PM Conor Dooley <conor@kernel.org> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> To facilitate a transfer from SOC_FOO to ARCH_FOO, over a release cycle,
> introduce some aliases so that drivers etc that use the SOC_FOO symbols
> can be converted.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch, which is now commit fc43211939bb6874
("RISC-V: kconfig.socs: convert usage of SOC_CANAAN to
ARCH_CANAAN") in riscv/for-next

> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs

> @@ -73,6 +91,9 @@ config SOC_CANAAN_K210_DTB_BUILTIN
>           This option should be selected if no bootloader is being used.
>           If unsure, say Y.
>
> +config ARCH_CANAAN_K210_DTB_SOURCE
> +       def_bool SOC_CANAAN_K210_DTB_SOURCE

This is not correct, as SOC_CANAAN_K210_DTB_SOURCE below is
not a bool, but a string.

> +
>  config SOC_CANAAN_K210_DTB_SOURCE
>         string "Source file for the Canaan Kendryte K210 builtin DTB"
>         depends on SOC_CANAAN

Hence

    obj-$(CONFIG_ARCH_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb.o,
$(CONFIG_ARCH_CANAAN_K210_DTB_SOURCE))

will do the wrong thing later, and I get a non-bootable system (no output)
on my MAiX-BiT.

Unfortunately there is no def_string, so I don't think we can fix this
in a backwards-compatible way, and have to replace all
SOC_CANAAN_K210_DTB_SOURCE by ARCH_CANAAN_K210_DTB_SOURCE,
and urging users to update their .config manually.

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
