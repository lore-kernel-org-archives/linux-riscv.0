Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4D9C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 10:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVQLPMan/u4PWaBY0h5d5uSPXdWySVAK7ejyxUc1dvU=; b=a8oifiPpQ8YaHW
	MnqKMDL6kKSq57wcxl1elZt1r6OkWj0URaEJHFyoyilevH2Gdxh23gKq/n1uK+IdXdceTQs06+0I0
	C9Jr2Wrta7EwVxe/R53LJ8O5nOY6+ooMrJHb/viGBB3T7i9+JKzzLTbH4PCk9Jx2TkJnxOcaNc5PU
	VsaUoHVg4bGATx7qQeYWeN8qm5WBBqENl8Qq64dsNVTPHubiCSdiCkfvC/byQX7cl3ONAr7YliUtR
	yGa4A0yK09sGuksi4yoK79QjDlAHEErf6eamZuHL1lpdtSZoQ5WXIXsWR9pL6yqr4p/iFpD6BC9ns
	mfFD1qJ/jVPqDViDh5sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owhnL-003kZy-Jl; Sun, 20 Nov 2022 10:43:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owhnJ-003kWI-0H
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 10:43:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E388D60BFB;
	Sun, 20 Nov 2022 10:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E80C433C1;
	Sun, 20 Nov 2022 10:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668941003;
	bh=hLIopbsnkZXEWa0jZnTmGnZwva+kc5FQSOWtuZHmza4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T7qtsoZ8b04G25CKrYlSPqXeZ6ut1+TEmOhEW250vBTdI+2Vwci3RJ1pTbi+arrcW
	 Ar2vdz7Kn4dCf6/U5gEy+yfg9p8pOYi38pLLZfTp80wre0aNYnLOVDP/h8vJq1Jn2j
	 QdZ6hy7vrm9I7cQb29I0eGfbANIswcTiI8loNRO/wMr50QoUOKTGw8YSRQ70hwIqV6
	 XhN+bLxPA+gFWV2WAcC3vL1Mg04lZbxblSvsCUXDiUOTj1TMlSCHmxD9FhdKZV+ZzN
	 mv7yIwPaZe4WG1icB7lv6c48TfsYAVXBIegt571iVR9y5mKTQva9JoTfxaQmQsv5PF
	 JjwAPOwVk4YRw==
Date: Sun, 20 Nov 2022 10:43:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/7] riscv: add the Bouffalolab SoC family Kconfig option
Message-ID: <Y3oExmuiH95NWGUL@spud>
References: <20221120082114.3030-1-jszhang@kernel.org>
 <20221120082114.3030-5-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221120082114.3030-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_024325_121870_4E4DB926 
X-CRM114-Status: GOOD (  16.11  )
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

On Sun, Nov 20, 2022 at 04:21:11PM +0800, Jisheng Zhang wrote:
> The Bouffalolab bl808 SoC contains three riscv CPUs, namely M0, D0 and
> LP. The D0 is 64bit RISC-V GC compatible, so can run linux.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Could you also add this new SOC_BOUFFALOLAB symbol to defconfig please?

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/Kconfig.socs | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 69774bb362d6..90256f44ed4a 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -1,5 +1,11 @@
>  menu "SoC selection"
>  
> +config SOC_BOUFFALOLAB
> +	bool "Bouffalolab SoCs"
> +	select SIFIVE_PLIC
> +	help
> +	  This enables support for Bouffalolab SoC platforms.
> +
>  config SOC_MICROCHIP_POLARFIRE
>  	bool "Microchip PolarFire SoCs"
>  	select MCHP_CLK_MPFS
> -- 
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
