Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5276CAC598
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 07:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmBIoAKIotBvL2QJlJZttRJ9agUJ5SJyZ76hpEaF7i8=; b=4jb73bycI5D6wT
	oVX0cJyoqYnky7opTzAj4f6S/a6SlzhCL7bIwltfO0ZRmNJ7fKBxHUZW/EBi7XPp6Kin+yT4XRBO2
	4Gpi/JkUa2HyqpjMGMb8EW/1uGcXnQi3EIP3hCNBwyuZS87tiZ++s8114lK+iTr+Gnpj2zKQognHu
	eZ3lIeD+7KGqjuYxH4JqkYedKNNncpp/lzI7Mp3Hj7zNnz/mafBynX8FApms8nBOz1u+zf9xbLPDw
	bmoHrBdKpuujsBvHpqIlMqh+Puol+RnYxLHk5+BjQgI8jKqIt26cal16iZWWuKu5BUXfDyX05mpeV
	C428nPcnnRtHCmQr0W6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymtY-0000000AWPF-3e7l;
	Wed, 17 Sep 2025 07:48:04 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymtV-0000000AWLP-0plu
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 07:48:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758095195;
	bh=yTX0x8gU1Ol11kjsyuMqYbNOX/fW7mmYpB0x86VgsQ0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=T3Bv7osEBCFi75NcazqW316VsEePOrryMwDMNircE9pGz9zflgAoSlwNbr29BI4iq
	 LfDnsZefkvxTeGYbyJPm1iFCSNB+d64ebUaP6akED5ZSsncy6DNcTzeYFh1bQ7HoCd
	 UyaP7Vh1LssI7LGGeDO9PEuvO7VilGkXwASpxaq4=
X-QQ-mid: zesmtpgz8t1758095191t60bda5af
X-QQ-Originating-IP: v9NVhKXhmwVLHDhgwvRC4v2vtIiR8kazfo72W7ZeXi8=
Received: from = ( [14.123.253.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 17 Sep 2025 15:46:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9741036035539461399
EX-QQ-RecipientCnt: 16
Date: Wed, 17 Sep 2025 15:46:29 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, dlan@gentoo.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v4] riscv: dts: spacemit: add UART pinctrl combinations
Message-ID: <F213A85E78015F1A+aMpnVc9S_ynYGDF8@LT-Guozexi>
References: <20250917065907.160615-1-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250917065907.160615-1-hendrik.hamerlinck@hammernet.be>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NOIkHYnr7Vzd8ZIp8f55FeCbzpuMcJQT24NrxeYRgkV7rluluqLcNjCz
	v3juQ6aUCfg4dKNGCSFaDwibWNjJLcNM0A5+uwTbp2UvqUpkTXVFbEfPrwwPTiYlDG8sl8v
	25EmddcdbOK+HejbYCePaffAlA020j1+XybBTG57UGyl9KSMKSqaGi92J0nwkNl3x95dCT5
	5Daxd06W9q6ubRz4UajZuNkCohbF1L2Nup57BS1zusUadS5cae0uatQ2KwKLcslz45M1b9B
	zHVafbzjw/kO9y/fJXZ5jDBT0xCwt2xHmXXZxxLuypjBHgIWno8gydayUw83i2mjj8BGQ2T
	y0rGdXsKAU7dZNmkxrIlxm8/FEOOyFx8Dp+HUI20H9Zx73AdoXggFGyLBysnr0Ram90Kc4c
	be7A0WnnDlNiolbvcG7eFVCp2QBkswECUbBd8GyGj66KSwiMzbeEMjAjsP7wOUSjM0TVpEz
	UWQUMSDLyWCKtu+wVHysnldHDpakkOlI3jpiHWOZVAMDbUJOONtB18KkjEeZ7LNE5cWV5Sg
	DCRC+bi6rflRsxf9I2gwipZhbnGcoGtDaNuQl3j/qvoFawxXkt94qUM4FRo4IKgvHk6vuFW
	LQSq+Ijv4AHDQxBBzlJkHyGuPSuhMzo8i8sHz+nd/onGdKS8WIgojMZXYw3M9Ib9Oc9Jzgs
	BChbqBnlGLOCI0T3wkXfxuGbrdtFzWYOjUFKb1DAq8Jiwe57bXK9VhvRYriKIvY2gsp6rFR
	gs+nSocHdfO60tBVeR3vDQpdmzlOmoJAAsSVf097LV+7Cd3zMxwkBi7QQXa3S0KvRECsI9+
	u66hNs9HHYzDvyAF4sR9Mo+UuXWy8g3S29cjPmwt3JoeGUwIA/l1a6KNEw6t4riFXoy52Z6
	Aq0iNF02wYHWwMnFR8x4CFZ96fu8AEVF7zaKaGd3QYxleC2ClSt5jY+kUJl79ZIIC6g8MQ2
	CXzj84dTyLhG3gfiDQywr90vELrwJkwv9HBZVFu/18dQWx9PS/bwgWPrlKU6BoqBZCV57rx
	mnv5sxF/tv92xYz9DCOxSI9XpDhRVRT6bAngO1122xmhS/ICT1vPj5elcSDLnwgSPXwOL9h
	w==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_004801_978649_51B6331D 
X-CRM114-Status: GOOD (  17.38  )
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

Hi Hendrik, Thanks for your patch!

On Wed, Sep 17, 2025 at 08:59:07AM +0200, Hendrik Hamerlinck wrote:
> Add UART pinctrl configurations based on the SoC datasheet and the
> downstream Bianbu Linux tree. The drive strength values were taken from
> the downstream implementation, which uses medium drive strength.
> CTS/RTS are moved to separate *-cts-rts-cfg states so boards can enable
> hardware flow control conditionally.
> 
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>
> ---
> Changes in v4:
> - Explicitly use 0 as bias-pull-up value
> 
> Changes in v3:
> - Added /omit-if-no-ref/ to pinctrl states to reduce DT size
> 
> Changes in v2:
> - Split cts/rts into separate pinctrl configs as suggested
> - Removed options from board DTS files to keep them cleaner
> ---
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 430 ++++++++++++++++++-
>  1 file changed, 428 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> +	/omit-if-no-ref/
> +	uart2_0_cts_rts_cfg: uart2-0-cts-rts-cfg {
> +		uart2-0-pins {
> +			pinmux = <K1_PADCONF(23, 1)>,	/* uart2_cts */
> +				 <K1_PADCONF(24, 1)>;	/* uart2_rts */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
We are currently using the 8250 UART driver, but hardware flow control does not
work properly on K1. We are considering fixing this when time permits.

Should we add a comment here to avoid confusing others who may run into this?
If so, I will remove the comment once the issue has been fixed.

Anyway,

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> +
> +	/omit-if-no-ref/
> +	uart3_0_cfg: uart3-0-cfg {
> +		uart3-0-pins {
> +			pinmux = <K1_PADCONF(81, 2)>,	/* uart3_txd */
> +				 <K1_PADCONF(82, 2)>;	/* uart3_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart3_0_cts_rts_cfg: uart3-0-cts-rts-cfg {
> +		uart3-0-pins {
> +			pinmux = <K1_PADCONF(83, 2)>,	/* uart3_cts */
> +				 <K1_PADCONF(84, 2)>;	/* uart3_rts */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart3_1_cfg: uart3-1-cfg {
> +		uart3-1-pins {
> +			pinmux = <K1_PADCONF(18, 2)>,	/* uart3_txd */
> +				 <K1_PADCONF(19, 2)>;	/* uart3_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart3_1_cts_rts_cfg: uart3-1-cts-rts-cfg {
> +		uart3-1-pins {
> +			pinmux = <K1_PADCONF(20, 2)>,	/* uart3_cts */
> +				 <K1_PADCONF(21, 2)>;	/* uart3_rts */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart3_2_cfg: uart3-2-cfg {
> +		uart3-2-pins {
> +			pinmux = <K1_PADCONF(53, 4)>,	/* uart3_txd */
> +				 <K1_PADCONF(54, 4)>;	/* uart3_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart3_2_cts_rts_cfg: uart3-2-cts-rts-cfg {
> +		uart3-2-pins {
> +			pinmux = <K1_PADCONF(55, 4)>,	/* uart3_cts */
> +				 <K1_PADCONF(56, 4)>;	/* uart3_rts */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart4_0_cfg: uart4-0-cfg {
> +		uart4-0-pins {
> +			pinmux = <K1_PADCONF(100, 4)>,	/* uart4_txd */
> +				 <K1_PADCONF(101, 4)>;	/* uart4_rxd */
> +			power-source = <3300>;
> +			bias-pull-up = <0>;
> +			drive-strength = <19>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart4_1_cfg: uart4-1-cfg {
> +		uart4-1-pins {
> +			pinmux = <K1_PADCONF(83, 3)>,	/* uart4_txd */
> +				 <K1_PADCONF(84, 3)>;	/* uart4_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart4_1_cts_rts_cfg: uart4-1-cts-rts-cfg {
> +		uart4-1-pins {
> +			pinmux = <K1_PADCONF(81, 3)>,	/* uart4_cts */
> +				 <K1_PADCONF(82, 3)>;	/* uart4_rts */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart4_2_cfg: uart4-2-cfg {
> +		uart4-2-pins {
> +			pinmux = <K1_PADCONF(23, 2)>,	/* uart4_txd */
> +				 <K1_PADCONF(24, 2)>;	/* uart4_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart4_3_cfg: uart4-3-cfg {
> +		uart4-3-pins {
> +			pinmux = <K1_PADCONF(33, 2)>,	/* uart4_txd */
> +				 <K1_PADCONF(34, 2)>;	/* uart4_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart4_3_cts_rts_cfg: uart4-3-cts-rts-cfg {
> +		uart4-3-pins {
> +			pinmux = <K1_PADCONF(35, 2)>,	/* uart4_cts */
> +				 <K1_PADCONF(36, 2)>;	/* uart4_rts */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart4_4_cfg: uart4-4-cfg {
> +		uart4-4-pins {
> +			pinmux = <K1_PADCONF(111, 4)>,	/* uart4_txd */
> +				 <K1_PADCONF(112, 4)>;	/* uart4_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart4_4_cts_rts_cfg: uart4-4-cts-rts-cfg {
> +		uart4-4-pins {
> +			pinmux = <K1_PADCONF(113, 4)>,	/* uart4_cts */
> +				 <K1_PADCONF(114, 4)>;	/* uart4_rts */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart5_0_cfg: uart5-0-cfg {
> +		uart5-0-pins {
> +			pinmux = <K1_PADCONF(102, 3)>,	/* uart5_txd */
> +				 <K1_PADCONF(103, 3)>;	/* uart5_rxd */
> +			power-source = <3300>;
> +			bias-pull-up = <0>;
> +			drive-strength = <19>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart5_1_cfg: uart5-1-cfg {
> +		uart5-1-pins {
> +			pinmux = <K1_PADCONF(25, 2)>,	/* uart5_txd */
> +				 <K1_PADCONF(26, 2)>;	/* uart5_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart5_1_cts_rts_cfg: uart5-1-cts-rts-cfg {
> +		uart5-1-pins {
> +			pinmux = <K1_PADCONF(27, 2)>,	/* uart5_cts */
> +				 <K1_PADCONF(28, 2)>;	/* uart5_rts */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart5_2_cfg: uart5-2-cfg {
> +		uart5-2-pins {
> +			pinmux = <K1_PADCONF(42, 2)>,	/* uart5_txd */
> +				 <K1_PADCONF(43, 2)>;	/* uart5_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart5_2_cts_rts_cfg: uart5-2-cts-rts-cfg {
> +		uart5-2-pins {
> +			pinmux = <K1_PADCONF(44, 2)>,	/* uart5_cts */
> +				 <K1_PADCONF(45, 2)>;	/* uart5_rts */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart5_3_cfg: uart5-3-cfg {
> +		uart5-3-pins {
> +			pinmux = <K1_PADCONF(70, 4)>,	/* uart5_txd */
> +				 <K1_PADCONF(71, 4)>;	/* uart5_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart5_3_cts_rts_cfg: uart5-3-cts-rts-cfg {
> +		uart5-3-pins {
> +			pinmux = <K1_PADCONF(72, 4)>,	/* uart5_cts */
> +				 <K1_PADCONF(73, 4)>;	/* uart5_rts */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart6_0_cfg: uart6-0-cfg {
> +		uart6-0-pins {
> +			pinmux = <K1_PADCONF(86, 2)>,	/* uart6_txd */
> +				 <K1_PADCONF(87, 2)>;	/* uart6_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart6_0_cts_rts_cfg: uart6-0-cts-rts-cfg {
> +		uart6-0-pins {
> +			pinmux = <K1_PADCONF(85, 2)>,	/* uart6_cts */
> +				 <K1_PADCONF(90, 2)>;	/* uart6_rts */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart6_1_cfg: uart6-1-cfg {
> +		uart6-1-pins {
> +			pinmux = <K1_PADCONF(0, 2)>,	/* uart6_txd */
> +				 <K1_PADCONF(1, 2)>;	/* uart6_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart6_1_cts_rts_cfg: uart6-1-cts-rts-cfg {
> +		uart6-1-pins {
> +			pinmux = <K1_PADCONF(2, 2)>,	/* uart6_cts */
> +				 <K1_PADCONF(3, 2)>;	/* uart6_rts */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart6_2_cfg: uart6-2-cfg {
> +		uart6-2-pins {
> +			pinmux = <K1_PADCONF(56, 2)>,	/* uart6_txd */
> +				 <K1_PADCONF(57, 2)>;	/* uart6_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart7_0_cfg: uart7-0-cfg {
> +		uart7-0-pins {
> +			pinmux = <K1_PADCONF(88, 2)>,	/* uart7_txd */
> +				 <K1_PADCONF(89, 2)>;	/* uart7_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart7_1_cfg: uart7-1-cfg {
> +		uart7-1-pins {
> +			pinmux = <K1_PADCONF(4, 2)>,	/* uart7_txd */
> +				 <K1_PADCONF(5, 2)>;	/* uart7_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart7_1_cts_rts_cfg: uart7-1-cts-rts-cfg {
> +		uart7-1-pins {
> +			pinmux = <K1_PADCONF(6, 2)>,	/* uart7_cts */
> +				 <K1_PADCONF(7, 2)>;	/* uart7_rts */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart8_0_cfg: uart8-0-cfg {
> +		uart8-0-pins {
> +			pinmux = <K1_PADCONF(82, 4)>,	/* uart8_txd */
> +				 <K1_PADCONF(83, 4)>;	/* uart8_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart8_1_cfg: uart8-1-cfg {
> +		uart8-1-pins {
> +			pinmux = <K1_PADCONF(8, 2)>,	/* uart8_txd */
> +				 <K1_PADCONF(9, 2)>;	/* uart8_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart8_1_cts_rts_cfg: uart8-1-cts-rts-cfg {
> +		uart8-1-pins {
> +			pinmux = <K1_PADCONF(10, 2)>,	/* uart8_cts */
> +				 <K1_PADCONF(11, 2)>;	/* uart8_rts */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart8_2_cfg: uart8-2-cfg {
> +		uart8-2-pins {
> +			pinmux = <K1_PADCONF(75, 4)>,	/* uart8_txd */
> +				 <K1_PADCONF(76, 4)>;	/* uart8_rxd */
> +			power-source = <3300>;
> +			bias-pull-up = <0>;
> +			drive-strength = <19>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart8_2_cts_rts_cfg: uart8-2-cts-rts-cfg {
> +		uart8-2-pins {
> +			pinmux = <K1_PADCONF(77, 4)>,	/* uart8_cts */
> +				 <K1_PADCONF(78, 4)>;	/* uart8_rts */
> +			power-source = <3300>;
> +			bias-pull-up = <0>;
> +			drive-strength = <19>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart9_0_cfg: uart9-0-cfg {
> +		uart9-0-pins {
> +			pinmux = <K1_PADCONF(12, 2)>,	/* uart9_txd */
> +				 <K1_PADCONF(13, 2)>;	/* uart9_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart9_1_cfg: uart9-1-cfg {
> +		uart9-1-pins {
> +			pinmux = <K1_PADCONF(116, 3)>,	/* uart9_txd */
> +				 <K1_PADCONF(117, 3)>;	/* uart9_rxd */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart9_1_cts_rts_cfg: uart9-1-cts-rts-cfg {
> +		uart9-1-pins {
> +			pinmux = <K1_PADCONF(110, 3)>,	/* uart9_cts */
> +				 <K1_PADCONF(115, 3)>;	/* uart9_rts */
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
>  
> +	/omit-if-no-ref/
> +	uart9_2_cfg: uart9-2-cfg {
> +		uart9-2-pins {
> +			pinmux = <K1_PADCONF(72, 2)>,	/* uart9_txd */
> +				 <K1_PADCONF(73, 2)>;	/* uart9_rxd */
>  			bias-pull-up = <0>;
>  			drive-strength = <32>;
>  		};
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
