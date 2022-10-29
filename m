Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F40AC38A02
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Oct 2022 04:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9e1hQo9bBQ10ZveBNw5ypbd3PyGo4T9XLue8Dd1VHJU=; b=0ztny9ZotQN3o8
	nfZnRkZTqV9GyiT9U3G7tmecb1U2vJKGFuTx0JWIIy7yNxwPVBdq81k4AdGFrUoCLPUI2Pc2kYgXq
	fioxkD5ih3JEtrsT1dAx7yv5jMuQArvFl22cu0sIswidQE1FLFZOGZMQltlVJ12/CAKlvixcvK36l
	hQKFGz862zZ1w4twaRceMYWHFcmpYwl61JyarIUacYwogy8WjwdKTaF7PX8v81izDv9r/yxh+tG8f
	dOmgYew35FI6lG4NPs98BSCedU+K2xCx2KSMWGlkCI2BLzmU1H0/7I54alGoyKZolkQ9xjDIh7ZZ6
	WSc6EaNliUHMTOIRd2oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oodJ5-004bOF-K4; Sat, 29 Oct 2022 04:18:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oodJ2-004bN1-UQ
	for linux-riscv@lists.infradead.org; Sat, 29 Oct 2022 04:18:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B1E2E601CD
	for <linux-riscv@lists.infradead.org>; Sat, 29 Oct 2022 04:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D12C43470
	for <linux-riscv@lists.infradead.org>; Sat, 29 Oct 2022 04:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667017121;
	bh=tGuK0t80zkZtAo5Nex2KKRFbSxKUDdhcBhWx7hEFvuk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RtJVoTaiv6EMCogDfUCGceorfx6aaNUEll7Q8rg5fLr4HKY1itrLCISTS66FC9/ou
	 AqMIT41osUEC2q49MQnPmnraOkPUzAlNo9WvaRfZiYZbDasUQjpTYFjJ2Fwki1nIIh
	 mEDao7xBQ/2A+LLlPqKlV3rJG3JD6ALZJIy9rfXz2RoAllGP/eKfRqV4X8Rue3VXPm
	 9jL+GLbvXY/yXvS+RWVJrFou+hGiwvcu0hcYmg6jc/v1tbSAwq0nzkkMBhMSqOzSSj
	 d0InLC5Oell6Uj4hUF11zfJ8oydSQddODUY90kMN1YBhV0Klv/O10as6l2gSjMCrEw
	 suM1eiENECX5w==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-13c2cfd1126so8417966fac.10
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 21:18:41 -0700 (PDT)
X-Gm-Message-State: ACrzQf0EF2JMxMLYfNb1tjb0NiER+Th+PCn07nFxt5j/ueUAm9hHXOCw
	NQDExLEGiPR/LP6OMSYnGQiF/MOFjaxWs2n6Q5w=
X-Google-Smtp-Source: AMsMyM7e6IHCx9azxcE286jAdW0V+KhXxyaPIe0xY+vKOQn5w6MOSy85TfhuXUeFW6s9kqA39gLLKuYmyas/W8K7zG4=
X-Received: by 2002:a05:6870:5803:b0:12c:c3e0:99dc with SMTP id
 r3-20020a056870580300b0012cc3e099dcmr10197639oap.19.1667017120186; Fri, 28
 Oct 2022 21:18:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221028165921.94487-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221028165921.94487-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 29 Oct 2022 12:18:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTxzV3M0b4UbPpyUtNTKtT6ViU1i=hihcnneM2M-2jR3A@mail.gmail.com>
Message-ID: <CAJF2gTTxzV3M0b4UbPpyUtNTKtT6ViU1i=hihcnneM2M-2jR3A@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
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
X-CRM114-CacheID: sfid-20221028_211849_099146_2F334C47 
X-CRM114-Status: GOOD (  18.61  )
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
> Add ARCH_RENESAS config option to allow selecting the Renesas RISC-V SoCs.
> We currently have the newly added RZ/Five (R9A07G043) RISC-V based SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v4 -> v5
> * Sorted as per SoC name
> * Included RB tag from Conor
>
> v3 -> v4
> * Dropped SOC_RENESAS_RZFIVE config option
> * Dropped explicitly selecting SOC_BUS/GPIOLIB/PINCTRL configs
>   under ARCH_RENESAS
> * Updated commit message
> * Dropped RB tag
> * Used riscv instead of RISC-V in subject line
>
> v2 -> v3
> * Included RB tag from Geert
>
> v1 -> v2
> * No Change
> ---
>  arch/riscv/Kconfig.socs | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 69774bb362d6..75fb0390d6bd 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -7,6 +7,11 @@ config SOC_MICROCHIP_POLARFIRE
>         help
>           This enables support for Microchip PolarFire SoC platforms.
>
> +config ARCH_RENESAS
> +       bool "Renesas RISC-V SoCs"
> +       help
> +         This enables support for the RISC-V based Renesas SoCs.
> +
Looks good.

Reviewed-by: Guo Ren <guoren@kernel.org>

>  config SOC_SIFIVE
>         bool "SiFive SoCs"
>         select SERIAL_SIFIVE if TTY
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
