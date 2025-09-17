Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36BDCAC592
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 01:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hT7UaOfM+28WKoEJGZxS0OFXdVvUIDXOTMXji1LQ13o=; b=tyJgX64FAXMBdI
	fe5fyNWe6cYUjpWB6sx8//VtBtyAYNOrC7jslsL/k6UYqxhd1x3i3oa0axlpeQqUyo2F3+J5J/ek2
	oyDDSPZclL3onqzaJxGanMVS/nsrnLjoytjCUJu1e0ca/+yLNjeRF5OqXJvIiI7ypv/wOUbKcRm9z
	mqQNgxzXmjMMgDV/Pc0V3l4SKlVVnNbxjbTIC4qbaSFe6DQnw+1aYM0bhjH2/OaZMu85s1eVdCd31
	mosmaoLs4JcTcMqAeeVfR7WLScZUqql1+ru7Gble6YUu0c+zSBw3GHRbnAbP8tazejwyxHgQvt950
	pKFmVNvAx6hraCAi9kYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uygzW-00000009qW9-3ENE;
	Wed, 17 Sep 2025 01:29:50 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uygzU-00000009qUr-354C
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 01:29:49 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 71C89340EF8;
	Wed, 17 Sep 2025 01:29:45 +0000 (UTC)
Date: Wed, 17 Sep 2025 09:29:41 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: dts: spacemit: add UART pinctrl combinations
Message-ID: <20250917012941-GYA1263349@gentoo.org>
References: <20250916064739.196695-1-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250916064739.196695-1-hendrik.hamerlinck@hammernet.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_182948_810493_F28B38EF 
X-CRM114-Status: GOOD (  18.47  )
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

On 08:47 Tue 16 Sep     , Hendrik Hamerlinck wrote:
> Add UART pinctrl configurations based on the SoC datasheet and the
> downstream Bianbu Linux tree. The drive strength values were taken from
> the downstream implementation, which uses medium drive strength.
> CTS/RTS are moved to separate *-cts-rts-cfg states so boards can enable
> hardware flow control conditionally.
> 
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> ---
> Changes in v3:
> - Added /omit-if-no-ref/ to pinctrl states to reduce DT size
> 
> Changes in v2:
> - Split cts/rts into separate pinctrl configs as suggested
> - Removed options from board DTS files to keep them cleaner
> ---
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 432 ++++++++++++++++++-
>  1 file changed, 429 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> index 381055737422..7811fb485bd4 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> @@ -11,12 +11,438 @@
>  #define K1_GPIO(x)	(x / 32) (x % 32)
>  
>  &pinctrl {
> +	/omit-if-no-ref/
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
> +	/omit-if-no-ref/
> +	uart0_1_cfg: uart0-1-cfg {
> +		uart0-1-pins {
> +			pinmux = <K1_PADCONF(108, 1)>,	/* uart0_txd */
> +				 <K1_PADCONF(80, 3)>;	/* uart0_rxd */
> +			power-source = <3300>;
..
> +			bias-pull-up;
here, see comment below
> +			drive-strength = <19>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
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

Sorry, I've overlooked this, the bias-pull-up need to explicitly set to
a vale of 0, 1 - normal pull up, or strong pull up.. for uart, the normal
pull up should be ok

please refer Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml

Since the rc6 is already tagged, I'm about to prepare a PR, so If you able 
to respin a new version quickly, I'd be happy to take, otherwise let's wait
for next merge window (which shouldn't be a big problem)

btw, please always do a DT check: 
  make ARCH=riscv dtbs_check W=1

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
