Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279F7C35FFC
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 16:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yolPPAMS6t0qPzSONnMZ0CoayfdDVMPjl7PvfD8ADIQ=; b=JY5ZU+fmuTYdsZ
	PU90veicKjbF9pQDLgW9mdBNCQyMJJK5bT7wY8pzeeWN1GnmGB+Ba1jhk0G6EC/zTcZV9aLFOmMtD
	tf0uCQkmD0MXBNv+1biM3p3BDk9HnWS9q9clAeH6FW1lKMzuLdwaNJnH2cixCCJJlrMYF2GZ1ezGE
	P3Atq0UOAPuSEjTs5FKJucqXICH8vVAzBZqm8R95SlP0VuXfrPnAQ2s7TWuoD8hUHObzkGdPaiuP1
	yFoIgOq6xvep7bKa8yvxdrWYxxghVOz0Xh43+Au4lmBAnZw4qVq3h8nxQWZ8h9lctDR16zv5XogOW
	//+g8llOe5ZpPSj9AyVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw21Z-000000006X3-3IPy;
	Sat, 22 Mar 2025 16:48:41 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw21X-000000006Wd-0jmf
	for linux-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 16:48:40 +0000
Received: from localhost (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 14C40343212;
	Sat, 22 Mar 2025 16:48:37 +0000 (UTC)
Date: Sat, 22 Mar 2025 16:48:30 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 7/7] riscv: dts: spacemit: add reset support for
 the K1 SoC
Message-ID: <20250322164830-GYE11633@gentoo>
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-8-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321151831.623575-8-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_094839_236891_EC2C809D 
X-CRM114-Status: GOOD (  13.10  )
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

On 10:18 Fri 21 Mar     , Alex Elder wrote:
> Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
> currently support resets but not clocks in the SpacemiT K1.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 09a9100986b19..f86d1b58c6d35 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -350,6 +350,18 @@ soc {
>  		dma-noncoherent;
>  		ranges;
>  
> +		syscon_rcpu: system-controller@c0880000 {
I'm not sure if syscon_rcpu is good name to go, it's AUDIO Peripherals
in docs, see

7.2 Main CPU Domain Address Mapping
https://developer.spacemit.com/documentation?token=LzJyw97BCipK1dkUygrcbT0NnMg
> +			compatible = "spacemit,k1-syscon-rcpu";
> +			reg = <0x0 0xc0880000 0x0 0x2048>;
> +			#reset-cells = <1>;
> +		};
> +
> +		syscon_rcpu2: system-controller@c0888000 {
not found this address mapping in above docs link
> +			compatible = "spacemit,k1-syscon-rcpu2";
> +			reg = <0x0 0xc0888000 0x0 0x28>;
> +			#reset-cells = <1>;
> +		};
> +
>  		syscon_apbc: system-control@d4015000 {
>  			compatible = "spacemit,k1-syscon-apbc";
>  			reg = <0x0 0xd4015000 0x0 0x1000>;
> @@ -518,6 +530,12 @@ clint: timer@e4000000 {
>  					      <&cpu7_intc 3>, <&cpu7_intc 7>;
>  		};
>  
> +		syscon_apbc2: system-controller@f0610000 {
> +			compatible = "spacemit,k1-syscon-apbc2";
> +			reg = <0x0 0xf0610000 0x0 0x20>;
> +			#reset-cells = <1>;
> +		};
> +
>  		sec_uart1: serial@f0612000 {
>  			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>  			reg = <0x0 0xf0612000 0x0 0x100>;
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
