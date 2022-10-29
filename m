Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBF2C38A02
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Oct 2022 04:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZNarE1llbm4gCS8KxZUpfAy9BE4+ybnjqOEscAb1+w=; b=lZ1hGScEcabRf4
	7RK9dnEA27Efj5icglYLZtw4uIUYtz+rQdirUZuAQlotvA3yFtaznU27pCzt7i7msgTY0hslN43V6
	Y5d3MtvE9dCciHdyWqTPnd6S35LRuafuISIU6yV6GUtHl1WnR8TIhQk65P6AEaskovjPR+T3fxFLt
	jMpMEU/BQKpc/1oX4yA2Dntwi4knGXcpI78iYwBGZSaljSoKpWpw0NJ5Hr7KeaeUHzLtBPYUbtyfB
	peYmbJedPkSywkDoc4c3L+zurTi2TZ7JL7Vl8tmbw8XePBnUb43mPuj5LUzNgcNsTWEtKZ0nREypU
	+lCMPfK/DYUP0BUYHsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oodSw-004cXK-UZ; Sat, 29 Oct 2022 04:29:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oodSu-004cWU-7W
	for linux-riscv@lists.infradead.org; Sat, 29 Oct 2022 04:29:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D6E77B82CDB
	for <linux-riscv@lists.infradead.org>; Sat, 29 Oct 2022 04:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E143C43470
	for <linux-riscv@lists.infradead.org>; Sat, 29 Oct 2022 04:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667017737;
	bh=aTygU2PRy7lfkCjg6NARWEJFi56C6SOOGo8ciffs0M4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kC2UVQISZ4nPYgwr4pAfEbOBLInAwPZ7BrO0UqU77CO3g/1OthskPiQ56m4beDNuo
	 kirUfT3Yx90wgKypNS+4vJq45qniwWZUc61/bK/BpC/gURWj1Nrz+9NX2M9R8k6QG1
	 JVdJ2764RFk/m7zvOiE5C6G0+diBCReXzgYnEmWeTT79aQqxt/Q0xE0GTJlZAgQkQ+
	 o05mujJ+CZu7Sj9aiS4aEm70LUW60rqBZVnpJa9ILh9PC6R6K5OhZ6IOgrL0GuWS8I
	 ayIRuIXNfHl/AlNCL8ZzAEKdDVQYeKE8CeQo6WEcorRvAhqZDpo2cCwIauEQDlxiZU
	 gwXMZ1oaJI3hg==
Received: by mail-oi1-f170.google.com with SMTP id y67so8167378oiy.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 21:28:57 -0700 (PDT)
X-Gm-Message-State: ACrzQf0u3F0oOfUKvQ9d1CPriylDvb99Jxe5S5PvskYv1OCpDtA/y/Jf
	vRUs/oDpUfUpuncYq35o4n3DoLB9MRUTJTTQN/4=
X-Google-Smtp-Source: AMsMyM7qr9dXGyzxd/3829olJulGF7SulN3N+dRbu+X5QyTSvh7ZfeE/P62C1xUQsuyr9RgMVhxxfngZ/+bX0pJujPk=
X-Received: by 2002:a05:6808:f0e:b0:359:b055:32ea with SMTP id
 m14-20020a0568080f0e00b00359b05532eamr9050147oiw.112.1667017736773; Fri, 28
 Oct 2022 21:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221028165921.94487-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221028165921.94487-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 29 Oct 2022 12:28:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSJML1buw3mO-2Oy8SAsHFk0hqKabiKhAQLfyuOcnas-g@mail.gmail.com>
Message-ID: <CAJF2gTSJML1buw3mO-2Oy8SAsHFk0hqKabiKhAQLfyuOcnas-g@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] riscv: configs: defconfig: Enable Renesas RZ/Five SoC
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
X-CRM114-CacheID: sfid-20221028_212900_576855_2B284F14 
X-CRM114-Status: GOOD (  17.97  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Sat, Oct 29, 2022 at 12:59 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
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
>
> v2 -> v3
> * Included RB tags
> * Updated commit description
>
> v1 -> v2
> * New patch
> ---
>  arch/riscv/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 05fd5fcf24f9..97fba7884d7a 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -29,6 +29,8 @@ CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_STARFIVE=y
>  CONFIG_SOC_VIRT=y
> +CONFIG_ARCH_RENESAS=y
> +CONFIG_ARCH_R9A07G043=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
>  CONFIG_PM=y
> @@ -123,6 +125,7 @@ CONFIG_INPUT_MOUSEDEV=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_OF_PLATFORM=y
> +CONFIG_SERIAL_SH_SCI=y
>  CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_HW_RANDOM=y
>  CONFIG_HW_RANDOM_VIRTIO=y
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
