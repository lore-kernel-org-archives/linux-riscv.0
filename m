Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8522BC369A2
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 16:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8DRutCz1cPWCCCkdxlagTGKEwtJQg+fWwaX5SPsB1jc=; b=otnyNER3KK6Pne
	APGoKMMg6G6OiPq/CX1LQpkrC9v5vj91d3FrZGWDL9wGxUjAfTiYf+8Vcmmx7LAP7+eD+18CTNGg7
	P//H1yLNEiGEiUqbTmMshUf6NBgXVilDNWiQijq5eMizpH6idNMZBxnKWBcniza2E87v/W/Bu8d64
	jnW2135P5y8/sn5oFu/2g3h1Hbq1eTLF25C71UN+PFi7ucnu0yHKwFV/89EnGBc58nQIfuVSAaqTv
	bNNZpQ38ySmKt7gS50e+g2KCtsKVJRDspRH4wmAlIibfaE81zxl/tE00cBEDkCW8Ytu/DyNy3Gv8D
	X/RKPBaHSgruWKAfQA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pKO-00000001BI9-0pHn;
	Mon, 07 Apr 2025 16:28:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nVc-00000000k8p-0PLe
	for linux-riscv@bombadil.infradead.org;
	Mon, 07 Apr 2025 14:31:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=q6tTSWcm2DXYoa05+QfeLQWnQ/k6Gldr6KJyW63Pyas=; b=aSDT3rxRq8aLA2FA7UAMTEXPMX
	568ZzkhNoQzl5GN7E8aG3ZV6fOJTJVYVPElcuF1BgpVvg3ekt2CSuFhwSpAZuP3qRdctmlLb/UO/N
	Uo8VGizHuforvYDdG1UEzQpqnCDyHhS/frVknUITpU8/u1ViwAOPlg78ELvh3+pL8sHUhBZ2Fovoq
	wugnr4AfzFwBLj42i7LTIgX8MsNRO91bWHzFewWI1FdWD8ru84cG/+Da6Bdd+EdMU0dAxPa7TeCLR
	zwoaMTcGDoItanloeh9vVzSYIK+omTOLXoPWlFLyKERY6y2sIQCeb+PlseodnRDv9KJwWbWrYiof5
	rfRw2pIA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nVY-00000007zAt-3rug
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 14:31:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0D9D49EC5;
	Mon,  7 Apr 2025 14:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A8FC4CEDD;
	Mon,  7 Apr 2025 14:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744036285;
	bh=zmG+WoiwkUCuBe9DZidtoGv6whGm/dOIb2tKqTnPHCo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZszCh9tAu6wD27hvttJjNDFtg9psZ/tTYx8jBK+4cw369xBNIyk7GfcxBux1+2UZj
	 RtszRrzBxnD1iZXymhmCHCWnfCxOfZOSAPDHEFJAQl/GqeQyuntbBt065pLPMSjGf8
	 Nx/9Jlqxt3QA8HI8tCusKkAyRJDU7HLA3EC7L124d83aXlwC8Wcu8J3IA2cqsAdVpg
	 T7pGCv38OoJFzv7OhjkJh+dHrzDOv2MptqYfgqmkB9oMcRi3jJbFt1gF9FiDe1e3Tv
	 VgiT80PMv60Z08ZphcnddEkjr1dAHXPubigJQBWQTBZKY3UdkgSSO1HYcSHZbIiEr0
	 KJuQMZu3IxAag==
Message-ID: <45ec17f3-37e8-4af8-8bb3-463e3f26e112@kernel.org>
Date: Mon, 7 Apr 2025 16:31:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] riscv: dts: andes: add Voyager board device tree
To: Ben Zong-You Xie <ben717@andestech.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tglx@linutronix.de, daniel.lezcano@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com
References: <20250407104937.315783-1-ben717@andestech.com>
 <20250407104937.315783-9-ben717@andestech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250407104937.315783-9-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_153129_410507_BE52F7C0 
X-CRM114-Status: GOOD (  13.30  )
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

On 07/04/2025 12:49, Ben Zong-You Xie wrote:
> Introduce the device tree support for Voyager development board.
> 
> Currently only support booting into console with only uart,
> other features will be added later.
> 
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  arch/riscv/boot/dts/Makefile                |  1 +
>  arch/riscv/boot/dts/andes/Makefile          |  2 ++
>  arch/riscv/boot/dts/andes/qilai-voyager.dts | 19 +++++++++++++++++++
>  3 files changed, 22 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/andes/Makefile
>  create mode 100644 arch/riscv/boot/dts/andes/qilai-voyager.dts
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index 64a898da9aee..3b99e91efa25 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  subdir-y += allwinner
> +subdir-y += andes
>  subdir-y += canaan
>  subdir-y += microchip
>  subdir-y += renesas
> diff --git a/arch/riscv/boot/dts/andes/Makefile b/arch/riscv/boot/dts/andes/Makefile
> new file mode 100644
> index 000000000000..c833e041c220
> --- /dev/null
> +++ b/arch/riscv/boot/dts/andes/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_ANDES) += qilai-voyager.dtb
> \ No newline at end of file

You have patch warnings.

> diff --git a/arch/riscv/boot/dts/andes/qilai-voyager.dts b/arch/riscv/boot/dts/andes/qilai-voyager.dts
> new file mode 100644


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
