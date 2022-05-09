Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A150C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 11:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBxYntgpI7WSNAJAV7ZM8kFjeH3jiLuwt4HKpbe2IYo=; b=Cltoel7A3D4aCV
	WnAGXmToHYfUmS5L/xqUmLTIpUM9mu5cl7wBPLvvnL3f4Sb9AO7VZETONUZxK60GqbMSR6cWEu8Wb
	FMV1YQeG5XZAuHL/wy8b++y9VTI/Z2gxOWTm44ZLIHBzWbhdMXfowlLLODGZHA+YuuMj0pinOMGJx
	zMBU6N/ZA3e2eWR13nteGqoQcnqhYRj5bLAuzb+xlS4cA6KbfCQbWiLlQJAzdFwS5DG6IOFkA3fsj
	Gzsz+PBaSZ4EG49XR5ZEnjsD46hCDCEt9g4iIcgqAz6XJITkz8rKaXDcMCAmA15015bIA80qfO39E
	wSgLYUL1FV9p3S7eds7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no1Bx-00DyPb-Bo; Mon, 09 May 2022 11:04:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no1Bm-00DyKq-4H
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 11:04:31 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1no1Bc-0005dn-5v; Mon, 09 May 2022 13:04:20 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: krzk+dt@kernel.org, palmer@dabbelt.com, robh+dt@kernel.org,
 Conor Dooley <mail@conchuod.ie>
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 palmer@rivosinc.com, arnd@arndb.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/8] riscv: dts: microchip: move sysctrlr out of soc bus
Date: Mon, 09 May 2022 13:04:19 +0200
Message-ID: <2826000.e9J7NaK4W3@diego>
In-Reply-To: <20220504203051.1210355-3-mail@conchuod.ie>
References: <20220504203051.1210355-1-mail@conchuod.ie>
 <20220504203051.1210355-3-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_040430_267368_D699F051 
X-CRM114-Status: GOOD (  15.97  )
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

Am Mittwoch, 4. Mai 2022, 22:30:46 CEST schrieb Conor Dooley:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The MPFS system controller has no registers of its own, so move it out
> of the soc node to avoid dtbs_check warnings:
> arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: soc: syscontroller: {'compatible': ['microchip,mpfs-sys-controller'], 'mboxes': [[15, 0]], 'status': ['okay']} should not be valid under {'type': 'object'}
> 
> Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
> Suggested-by: Rob Herring <robh@kernel.org>
> Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index 746c4d4e7686..bf21a2edd180 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -146,6 +146,11 @@ refclk: mssrefclk {
>  		#clock-cells = <0>;
>  	};
>  
> +	syscontroller: syscontroller {
> +		compatible = "microchip,mpfs-sys-controller";
> +		mboxes = <&mbox 0>;
> +	};
> +
>  	soc {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -446,10 +451,5 @@ mbox: mailbox@37020000 {
>  			#mbox-cells = <1>;
>  			status = "disabled";
>  		};
> -
> -		syscontroller: syscontroller {
> -			compatible = "microchip,mpfs-sys-controller";
> -			mboxes = <&mbox 0>;
> -		};
>  	};
>  };
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
