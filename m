Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B30C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  3 May 2022 23:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zqqk/Vi4CcjcU6UdOBly0hUmKoizsMneAYdvovcbdAk=; b=HtrUMPMUJt+qZF
	Cj8aV8Z2Q4M00YSqPGXN6/0oq0g9ylS3/bps6ByFZjiijlAyxZD996MvjpwwgQ3GlpA4EHCqUnj2F
	ZVyPMJpeun1PwmCXV+AiP/EOzlq8iaxxwARZFYRv1j/TJ2pohXWMa7gKnfqPS7M5BGTbBn16T5K7P
	OZhNO05x3g0gNO+2Xtq4/RwRtAy6YhWfiO9ywyTxhBdSX358Zgse805wLwlF5sQL5qdstPHwU7tuu
	jhqBLSX4zP2U4MOq0Q/Gkhob/s26uJSUlQ0OwR/EGmuotzQOH80jL7Iy8THECD4Qap4/rPpIzwLuq
	B4POgLrnfcUNf58WrAWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm1y8-0083ny-Qt; Tue, 03 May 2022 23:30:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm1y6-0083n2-Oy
 for linux-riscv@lists.infradead.org; Tue, 03 May 2022 23:30:12 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nm1xv-0004a6-LY; Wed, 04 May 2022 01:29:59 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: krzk+dt@kernel.org, palmer@dabbelt.com, robh+dt@kernel.org,
 linux-riscv@lists.infradead.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 palmer@rivosinc.com, arnd@arndb.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 1/8] riscv: dts: microchip: remove icicle memory clocks
Date: Wed, 04 May 2022 01:29:57 +0200
Message-ID: <2237223.ElGaqSPkdT@phil>
In-Reply-To: <20220501192557.2631936-2-mail@conchuod.ie>
References: <20220501192557.2631936-1-mail@conchuod.ie>
 <20220501192557.2631936-2-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_163010_858599_6905B947 
X-CRM114-Status: GOOD (  14.95  )
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

Am Sonntag, 1. Mai 2022, 21:25:52 CEST schrieb Conor Dooley:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The clock properties in the icicle kit's memory entries cause dtbs_check
> errors:
> arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: /: memory@80000000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Get rid of the clocks to avoid the errors.
> 
> Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
> Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
> Fixes: 5b28df37d311 ("riscv: dts: microchip: update peripherals in icicle kit device tree")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

I guess the memory controller consuming this clock will be sitting
somewhere in the io-area of the soc instead

> ---
>  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> index 3392153dd0f1..c71d6aa6137a 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -32,14 +32,12 @@ cpus {
>  	ddrc_cache_lo: memory@80000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x80000000 0x0 0x2e000000>;
> -		clocks = <&clkcfg CLK_DDRC>;
>  		status = "okay";
>  	};
>  
>  	ddrc_cache_hi: memory@1000000000 {
>  		device_type = "memory";
>  		reg = <0x10 0x0 0x0 0x40000000>;
> -		clocks = <&clkcfg CLK_DDRC>;
>  		status = "okay";
>  	};
>  };
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
