Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87024C38A02
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Oct 2022 04:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gf3VQO29q/O83KxkUJfMAbepywzAZasfFWLcz+CtPgM=; b=rm1B+aVCZvpUEK
	TEJj+kJrlTo6bqIROalMVdMVqDWxqcWleGJ4eEIFZCnDt6Ee476+HAqbfC9pzQIe3HuFic+7E0yDl
	b3wgoozjHKKM8+rotBPzL3nhHpLbVSqBPg4h33M7CiGW2PBrvZCg9haxI5ZbYz4+SHpfgRY2uyuls
	bS7zRH5yp2kX6jVmETHZobDtidm2FqMK2owvetiPcTQIQ5tsRuUVWEH6OX9kL4tW72q59lbJSEcEL
	TmZwPF/dMYyy5szwNdnXwDnGjupzkC9uUmPLQdSi0iqqLreoZus3LYICOYCCNGrzmCNoX6s58KAxQ
	CaTGMpx9n8CreoVhOsLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oodSC-004cOs-2d; Sat, 29 Oct 2022 04:28:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oodS9-004cOG-N5
	for linux-riscv@lists.infradead.org; Sat, 29 Oct 2022 04:28:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A4B760A0B
	for <linux-riscv@lists.infradead.org>; Sat, 29 Oct 2022 04:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9DFC433B5
	for <linux-riscv@lists.infradead.org>; Sat, 29 Oct 2022 04:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667017692;
	bh=l3gTHpSgHNXx654qe9ChihbsrZyGKjLLonsuLZ91Shc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VreITvgrAng8RK/2/3eW0U6l8vfXPB3rYYtlTDtZ/Yh0OufW0qX7nHUOPgyxoE7wo
	 cd1pJViTBE+TzGElUxJk/kN235MWlDydvrjfLKZKWv3o+S50MIAhOoHz8TObcBildH
	 Rt2OHz55/zr3Qw1SldexHpWY/9HP2CKqqJqL0kA1vOSJwLgSsJkIh8vHFc434dbWGc
	 9PGEdLLPoKaCNgpnXjUbK9FQY+aX7Ji3Lqa+XTg5K6OwkNPprBCW+HJURXHewvinRM
	 /vasdphnq2SyKZmoFLOsVFJG+gekpklyhldCTpREZKuaWXFGEdzn6cCr0vn69kmNHh
	 ZIJYtS6GaOfpQ==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-13c2cfd1126so8430247fac.10
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 21:28:11 -0700 (PDT)
X-Gm-Message-State: ACrzQf3fCy1IHSlIzkKC11zt8Z3JyzUE5gkOdCyYNMiXiaRR4ixSxWqU
	xylMwmuf3trixvm5uTLMpQcvyeYbAwgdaI3KaIg=
X-Google-Smtp-Source: AMsMyM7D0WVKxMG8lGL27vGBxZiQxWd/LF+z4X/5eJ9XrOaf52xEFlmhom7cKtUmBn7oO/eOl5+OgclQkUpbt9HX9f0=
X-Received: by 2002:a05:6871:b0d:b0:13b:b91:dc94 with SMTP id
 fq13-20020a0568710b0d00b0013b0b91dc94mr11309668oab.112.1667017691168; Fri, 28
 Oct 2022 21:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221028165921.94487-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221028165921.94487-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 29 Oct 2022 12:27:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS999PrC+uNntH4NF=ppLY0hbNCs=607=z3+LKWBWV3KQ@mail.gmail.com>
Message-ID: <CAJF2gTS999PrC+uNntH4NF=ppLY0hbNCs=607=z3+LKWBWV3KQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] MAINTAINERS: Add entry for Renesas RISC-V
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_212813_847010_F5D68499 
X-CRM114-Status: GOOD (  19.11  )
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

On Sat, Oct 29, 2022 at 12:59 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add RISC-V architecture as part of ARM/Renesas architecture, as they have
> the same maintainers, use the same development collaboration
> infrastructure, and share many files.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v4 -> v5
> * Rebased on -next
> * Included RB tag from Conor
>
> v3 -> v4
> * Included RB tag from Geert
>
> v2 -> v3
> * Merged as part of ARM
>
> v1 -> v2
> * New patch
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6cdc2a74c7a2..0204f106d8c2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2691,7 +2691,7 @@ F:        arch/arm/boot/dts/rtd*
>  F:     arch/arm/mach-realtek/
>  F:     arch/arm64/boot/dts/realtek/
>
> -ARM/RENESAS ARCHITECTURE
> +ARM/RISC-V/RENESAS ARCHITECTURE
Great! Good luck RISC-V RENESAS ARCHITECTURE.

Reviewed-by: Guo Ren <guoren@kernel.org>

>  M:     Geert Uytterhoeven <geert+renesas@glider.be>
>  M:     Magnus Damm <magnus.damm@gmail.com>
>  L:     linux-renesas-soc@vger.kernel.org
> @@ -2713,6 +2713,7 @@ F:        arch/arm/include/debug/renesas-scif.S
>  F:     arch/arm/mach-shmobile/
>  F:     arch/arm64/boot/dts/renesas/
>  F:     arch/arm64/configs/renesas_defconfig
> +F:     arch/riscv/boot/dts/renesas/
>  F:     drivers/soc/renesas/
>  F:     include/linux/soc/renesas/
>
> --
> 2.25.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
