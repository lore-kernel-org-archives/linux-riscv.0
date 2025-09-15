Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC3FCAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 12:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDkP9pEwUTP6NPYC7yAoYhR6z8xq6Ea9yU4NlirQ1WE=; b=rAT6i90rgqqbXa
	uZ2IF9JQlTtcifNUE/mjgBiRKzcxWpsRbIFSoUE9+yH8hQBafu3lj7H1r/2K0sUMstqh6zxKSNu0v
	H3t2owvpqxHohfKXTBD/K1l3P9goMFRnF2S2f0e83l5nu9iCRvRO0jB4yZmUUkqKRG5+s25k2KVcy
	Avh1/hRJ9tjRXF4mtbwLnYHRFs+nU3515fCF8raGZPuIihBtjl1Psfz8rri+i9UKVwr1F/98cyNTY
	vZjzOgQ/ODIQbt7icgIDZIQjzp8iY80v7xJy7+s6C4B9/zl21woz4PoiiR0rbtilbJq+Rrkbotha+
	aQ0D35SnI5LkkZqdQOdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7t2-0000000434w-1O6B;
	Mon, 15 Sep 2025 12:00:48 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7sz-00000004341-2W8D
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 12:00:46 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 91C7F340F3A;
	Mon, 15 Sep 2025 12:00:43 +0000 (UTC)
Date: Mon, 15 Sep 2025 20:00:31 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: spacemit: add UART pinctrl combinations
Message-ID: <20250915120031-GYA1251948@gentoo.org>
References: <20250915112845.58134-1-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915112845.58134-1-hendrik.hamerlinck@hammernet.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_050045_669033_05921A0C 
X-CRM114-Status: GOOD (  16.85  )
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

Hi Hendrik,

On 13:28 Mon 15 Sep     , Hendrik Hamerlinck wrote:
> Add UART pinctrl configurations based on the SoC datasheet and the
> downstream Bianbu Linux tree. The drive strength values were taken from
> the downstream implementation, which uses medium drive strength.
> CTS/RTS are moved to separate *-cts-rts-cfg states so boards can enable
> hardware flow control conditionally.
> 
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> ---
> Changes in v2:
> - Split cts/rts into separate pinctrl configs as suggested
> - Removed options from board DTS files to keep them cleaner
> ---
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 389 ++++++++++++++++++-
>  1 file changed, 386 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> index 381055737422..8f87f8baaf77 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> @@ -11,12 +11,395 @@
>  #define K1_GPIO(x)	(x / 32) (x % 32)
>  
>  &pinctrl {
Generally I'm good with this version, only have one minor comment

How about adding a "/omit-if-no-ref/" before each pin cfg?
This will shrink the final blob size if no referece to the node

> +	uart0_0_cfg: uart0-0-cfg {
> +		uart0-0-pins {
> +			pinmux = <K1_PADCONF(104, 3)>,	/* uart0_txd */
> +				 <K1_PADCONF(105, 3)>;	/* uart0_rxd */
> +			power-source = <3300>;
> +			bias-pull-up;
> +			drive-strength = <19>;
> +		};
> +	};
> +
> +	uart0_1_cfg: uart0-1-cfg {
> +		uart0-1-pins {
> +			pinmux = <K1_PADCONF(108, 1)>,	/* uart0_txd */
> +				 <K1_PADCONF(80, 3)>;	/* uart0_rxd */
> +			power-source = <3300>;
> +			bias-pull-up;
> +			drive-strength = <19>;
> +		};
> +	};
> +
>  	uart0_2_cfg: uart0-2-cfg {
>  		uart0-2-pins {
> -			pinmux = <K1_PADCONF(68, 2)>,
> -				 <K1_PADCONF(69, 2)>;
> +			pinmux = <K1_PADCONF(68, 2)>,	/* uart0_txd */
> +				 <K1_PADCONF(69, 2)>;	/* uart0_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
>  
> -			bias-pull-up = <0>;
> +	uart2_0_cfg: uart2-0-cfg {
> +		uart2-0-pins {
> +			pinmux = <K1_PADCONF(21, 1)>,	/* uart2_txd */
> +				 <K1_PADCONF(22, 1)>;	/* uart2_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart2_0_cts_rts_cfg: uart2-0-cts-rts-cfg {
> +		uart2-0-pins {
> +			pinmux = <K1_PADCONF(23, 1)>,	/* uart2_cts */
> +				 <K1_PADCONF(24, 1)>;	/* uart2_rts */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart3_0_cfg: uart3-0-cfg {
> +		uart3-0-pins {
> +			pinmux = <K1_PADCONF(81, 2)>,	/* uart3_txd */
> +				 <K1_PADCONF(82, 2)>;	/* uart3_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart3_0_cts_rts_cfg: uart3-0-cts-rts-cfg {
> +		uart3-0-pins {
> +			pinmux = <K1_PADCONF(83, 2)>,	/* uart3_cts */
> +				 <K1_PADCONF(84, 2)>;	/* uart3_rts */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart3_1_cfg: uart3-1-cfg {
> +		uart3-1-pins {
> +			pinmux = <K1_PADCONF(18, 2)>,	/* uart3_txd */
> +				 <K1_PADCONF(19, 2)>;	/* uart3_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart3_1_cts_rts_cfg: uart3-1-cts-rts-cfg {
> +		uart3-1-pins {
> +			pinmux = <K1_PADCONF(20, 2)>,	/* uart3_cts */
> +				 <K1_PADCONF(21, 2)>;	/* uart3_rts */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart3_2_cfg: uart3-2-cfg {
> +		uart3-2-pins {
> +			pinmux = <K1_PADCONF(53, 4)>,	/* uart3_txd */
> +				 <K1_PADCONF(54, 4)>;	/* uart3_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart3_2_cts_rts_cfg: uart3-2-cts-rts-cfg {
> +		uart3-2-pins {
> +			pinmux = <K1_PADCONF(55, 4)>,	/* uart3_cts */
> +				 <K1_PADCONF(56, 4)>;	/* uart3_rts */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart4_0_cfg: uart4-0-cfg {
> +		uart4-0-pins {
> +			pinmux = <K1_PADCONF(100, 4)>,	/* uart4_txd */
> +				 <K1_PADCONF(101, 4)>;	/* uart4_rxd */
> +			power-source = <3300>;
> +			bias-pull-up;
> +			drive-strength = <19>;
> +		};
> +	};
> +
> +	uart4_1_cfg: uart4-1-cfg {
> +		uart4-1-pins {
> +			pinmux = <K1_PADCONF(83, 3)>,	/* uart4_txd */
> +				 <K1_PADCONF(84, 3)>;	/* uart4_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart4_1_cts_rts_cfg: uart4-1-cts-rts-cfg {
> +		uart4-1-pins {
> +			pinmux = <K1_PADCONF(81, 3)>,	/* uart4_cts */
> +				 <K1_PADCONF(82, 3)>;	/* uart4_rts */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart4_2_cfg: uart4-2-cfg {
> +		uart4-2-pins {
> +			pinmux = <K1_PADCONF(23, 2)>,	/* uart4_txd */
> +				 <K1_PADCONF(24, 2)>;	/* uart4_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart4_3_cfg: uart4-3-cfg {
> +		uart4-3-pins {
> +			pinmux = <K1_PADCONF(33, 2)>,	/* uart4_txd */
> +				 <K1_PADCONF(34, 2)>;	/* uart4_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart4_3_cts_rts_cfg: uart4-3-cts-rts-cfg {
> +		uart4-3-pins {
> +			pinmux = <K1_PADCONF(35, 2)>,	/* uart4_cts */
> +				 <K1_PADCONF(36, 2)>;	/* uart4_rts */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart4_4_cfg: uart4-4-cfg {
> +		uart4-4-pins {
> +			pinmux = <K1_PADCONF(111, 4)>,	/* uart4_txd */
> +				 <K1_PADCONF(112, 4)>;	/* uart4_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart4_4_cts_rts_cfg: uart4-4-cts-rts-cfg {
> +		uart4-4-pins {
> +			pinmux = <K1_PADCONF(113, 4)>,	/* uart4_cts */
> +				 <K1_PADCONF(114, 4)>;	/* uart4_rts */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart5_0_cfg: uart5-0-cfg {
> +		uart5-0-pins {
> +			pinmux = <K1_PADCONF(102, 3)>,	/* uart5_txd */
> +				 <K1_PADCONF(103, 3)>;	/* uart5_rxd */
> +			power-source = <3300>;
> +			bias-pull-up;
> +			drive-strength = <19>;
> +		};
> +	};
> +
> +	uart5_1_cfg: uart5-1-cfg {
> +		uart5-1-pins {
> +			pinmux = <K1_PADCONF(25, 2)>,	/* uart5_txd */
> +				 <K1_PADCONF(26, 2)>;	/* uart5_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart5_1_cts_rts_cfg: uart5-1-cts-rts-cfg {
> +		uart5-1-pins {
> +			pinmux = <K1_PADCONF(27, 2)>,	/* uart5_cts */
> +				 <K1_PADCONF(28, 2)>;	/* uart5_rts */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart5_2_cfg: uart5-2-cfg {
> +		uart5-2-pins {
> +			pinmux = <K1_PADCONF(42, 2)>,	/* uart5_txd */
> +				 <K1_PADCONF(43, 2)>;	/* uart5_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart5_2_cts_rts_cfg: uart5-2-cts-rts-cfg {
> +		uart5-2-pins {
> +			pinmux = <K1_PADCONF(44, 2)>,	/* uart5_cts */
> +				 <K1_PADCONF(45, 2)>;	/* uart5_rts */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart5_3_cfg: uart5-3-cfg {
> +		uart5-3-pins {
> +			pinmux = <K1_PADCONF(70, 4)>,	/* uart5_txd */
> +				 <K1_PADCONF(71, 4)>;	/* uart5_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart5_3_cts_rts_cfg: uart5-3-cts-rts-cfg {
> +		uart5-3-pins {
> +			pinmux = <K1_PADCONF(72, 4)>,	/* uart5_cts */
> +				 <K1_PADCONF(73, 4)>;	/* uart5_rts */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart6_0_cfg: uart6-0-cfg {
> +		uart6-0-pins {
> +			pinmux = <K1_PADCONF(86, 2)>,	/* uart6_txd */
> +				 <K1_PADCONF(87, 2)>;	/* uart6_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart6_0_cts_rts_cfg: uart6-0-cts-rts-cfg {
> +		uart6-0-pins {
> +			pinmux = <K1_PADCONF(85, 2)>,	/* uart6_cts */
> +				 <K1_PADCONF(90, 2)>;	/* uart6_rts */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart6_1_cfg: uart6-1-cfg {
> +		uart6-1-pins {
> +			pinmux = <K1_PADCONF(0, 2)>,	/* uart6_txd */
> +				 <K1_PADCONF(1, 2)>;	/* uart6_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart6_1_cts_rts_cfg: uart6-1-cts-rts-cfg {
> +		uart6-1-pins {
> +			pinmux = <K1_PADCONF(2, 2)>,	/* uart6_cts */
> +				 <K1_PADCONF(3, 2)>;	/* uart6_rts */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart6_2_cfg: uart6-2-cfg {
> +		uart6-2-pins {
> +			pinmux = <K1_PADCONF(56, 2)>,	/* uart6_txd */
> +				 <K1_PADCONF(57, 2)>;	/* uart6_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart7_0_cfg: uart7-0-cfg {
> +		uart7-0-pins {
> +			pinmux = <K1_PADCONF(88, 2)>,	/* uart7_txd */
> +				 <K1_PADCONF(89, 2)>;	/* uart7_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart7_1_cfg: uart7-1-cfg {
> +		uart7-1-pins {
> +			pinmux = <K1_PADCONF(4, 2)>,	/* uart7_txd */
> +				 <K1_PADCONF(5, 2)>;	/* uart7_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart7_1_cts_rts_cfg: uart7-1-cts-rts-cfg {
> +		uart7-1-pins {
> +			pinmux = <K1_PADCONF(6, 2)>,	/* uart7_cts */
> +				 <K1_PADCONF(7, 2)>;	/* uart7_rts */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart8_0_cfg: uart8-0-cfg {
> +		uart8-0-pins {
> +			pinmux = <K1_PADCONF(82, 4)>,	/* uart8_txd */
> +				 <K1_PADCONF(83, 4)>;	/* uart8_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart8_1_cfg: uart8-1-cfg {
> +		uart8-1-pins {
> +			pinmux = <K1_PADCONF(8, 2)>,	/* uart8_txd */
> +				 <K1_PADCONF(9, 2)>;	/* uart8_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart8_1_cts_rts_cfg: uart8-1-cts-rts-cfg {
> +		uart8-1-pins {
> +			pinmux = <K1_PADCONF(10, 2)>,	/* uart8_cts */
> +				 <K1_PADCONF(11, 2)>;	/* uart8_rts */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart8_2_cfg: uart8-2-cfg {
> +		uart8-2-pins {
> +			pinmux = <K1_PADCONF(75, 4)>,	/* uart8_txd */
> +				 <K1_PADCONF(76, 4)>;	/* uart8_rxd */
> +			power-source = <3300>;
> +			bias-pull-up;
> +			drive-strength = <19>;
> +		};
> +	};
> +
> +	uart8_2_cts_rts_cfg: uart8-2-cts-rts-cfg {
> +		uart8-2-pins {
> +			pinmux = <K1_PADCONF(77, 4)>,	/* uart8_cts */
> +				 <K1_PADCONF(78, 4)>;	/* uart8_rts */
> +			power-source = <3300>;
> +			bias-pull-up;
> +			drive-strength = <19>;
> +		};
> +	};
> +
> +	uart9_0_cfg: uart9-0-cfg {
> +		uart9-0-pins {
> +			pinmux = <K1_PADCONF(12, 2)>,	/* uart9_txd */
> +				 <K1_PADCONF(13, 2)>;	/* uart9_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart9_1_cfg: uart9-1-cfg {
> +		uart9-1-pins {
> +			pinmux = <K1_PADCONF(116, 3)>,	/* uart9_txd */
> +				 <K1_PADCONF(117, 3)>;	/* uart9_rxd */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart9_1_cts_rts_cfg: uart9-1-cts-rts-cfg {
> +		uart9-1-pins {
> +			pinmux = <K1_PADCONF(110, 3)>,	/* uart9_cts */
> +				 <K1_PADCONF(115, 3)>;	/* uart9_rts */
> +			bias-pull-up;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	uart9_2_cfg: uart9-2-cfg {
> +		uart9-2-pins {
> +			pinmux = <K1_PADCONF(72, 2)>,	/* uart9_txd */
> +				 <K1_PADCONF(73, 2)>;	/* uart9_rxd */
> +			bias-pull-up;
>  			drive-strength = <32>;
>  		};
>  	};
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
