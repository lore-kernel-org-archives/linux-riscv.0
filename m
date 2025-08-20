Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E24BCA0EFA
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 01:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ldD+ie58DB+McWRvh09Nm+RdtvEo9h7ur5qnGK13eT4=; b=z3B2yCiJtMWjde
	ksuZsrpHMRTtsXCw9fQTiuEtW8Osk0Jcnciud2sLqtPqQGDgVagEINza12WK0N8GyNdX7ELqyXwse
	pkNTz5R9YJRrtTJ9+gHSbpFqNRNyuWN9XWwNb1vSH6a7Pf4sUMA2gcGUvUAhLewchFqcCEBbTQx/n
	+qibCNpD9Jqgbr+sJYbY+HkvyoNG9IRvACAqJkeMZskPpsE5zs1hiEWWO2qvcMhforhTHRzaGgikM
	FIqXjDtdEAXcq2Uf65b3gB81xN8Lvf/OlrkOkF5K7kz11MDEtN21myV6zNY3k/wobJtw4pzdYqmz0
	rPlOYHf/+0eGpHoE5x6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uouSc-0000000FV7G-3ZfB;
	Thu, 21 Aug 2025 01:51:26 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uos5T-0000000FBWd-02pJ
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 23:19:24 +0000
Received: from localhost (unknown [180.158.240.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D8A5D340E0E;
	Wed, 20 Aug 2025 23:19:21 +0000 (UTC)
Date: Thu, 21 Aug 2025 07:19:17 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: add UART resets for Soc K1
Message-ID: <20250820231917-GYB1065530@gentoo>
References: <20250807191817.157494-1-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250807191817.157494-1-hendrik.hamerlinck@hammernet.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_161923_080252_6EBACD8A 
X-CRM114-Status: GOOD (  20.74  )
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

On 21:18 Thu 07 Aug     , Hendrik Hamerlinck wrote:
> Add reset control entries for all UARTs in the SpaceMIT K1 SoC Device Tree.
> UART0 was functional as it did not need a reset. But the other UARTs were
> unable to access their registers without the reset being applied.
> 
..
> Although perhaps not needed I did add the reset for UART0 as well,
> to ensure consistency across all UARTs. With the current-speed set to
> 112500 baud rate, it matches the factory U-Boot settings.
> This should not give issues with early console usage. But perhaps it could
> be a good idea to let somebody else confirm this as well.
> 
Adding reset to UART0 is just fine, so we don't need to presume it will
rely on bootloader to de-assert the controller

please write changelogs in imperative mood, you can follow
https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog

> Tested this locally on both Orange Pi RV2 and Banana Pi BPI-F3 boards. 
> I enabled the UART9 and was able to use it successfully.
> 
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index abde8bb07c95..7a5196a98085 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -667,6 +667,8 @@ uart0: serial@d4017000 {
>  				clocks = <&syscon_apbc CLK_UART0>,
>  					 <&syscon_apbc CLK_UART0_BUS>;
>  				clock-names = "core", "bus";
..
> +				current-speed = <115200>;
please drop this property, dtsi file should contain generic info for SoC,
even in real cases, all boards use UART0 as serial output and configured
at baudrate 115200, it still be able to alter to different frequency..

besides, if you really want to set baudrate, then I'd suggest to configure
it at board specific dts file, 
  stdout-path = "serial0:115200n8";

> +				resets = <&syscon_apbc RESET_UART0>;
>  				interrupts = <42>;
>  				reg-shift = <2>;
>  				reg-io-width = <4>;
> @@ -680,6 +682,7 @@ uart2: serial@d4017100 {
>  				clocks = <&syscon_apbc CLK_UART2>,
>  					 <&syscon_apbc CLK_UART2_BUS>;
>  				clock-names = "core", "bus";
> +				resets = <&syscon_apbc RESET_UART2>;
>  				interrupts = <44>;
>  				reg-shift = <2>;
>  				reg-io-width = <4>;
> @@ -693,6 +696,7 @@ uart3: serial@d4017200 {
>  				clocks = <&syscon_apbc CLK_UART3>,
>  					 <&syscon_apbc CLK_UART3_BUS>;
>  				clock-names = "core", "bus";
> +				resets = <&syscon_apbc RESET_UART3>;
>  				interrupts = <45>;
>  				reg-shift = <2>;
>  				reg-io-width = <4>;
> @@ -706,6 +710,7 @@ uart4: serial@d4017300 {
>  				clocks = <&syscon_apbc CLK_UART4>,
>  					 <&syscon_apbc CLK_UART4_BUS>;
>  				clock-names = "core", "bus";
> +				resets = <&syscon_apbc RESET_UART4>;
>  				interrupts = <46>;
>  				reg-shift = <2>;
>  				reg-io-width = <4>;
> @@ -719,6 +724,7 @@ uart5: serial@d4017400 {
>  				clocks = <&syscon_apbc CLK_UART5>,
>  					 <&syscon_apbc CLK_UART5_BUS>;
>  				clock-names = "core", "bus";
> +				resets = <&syscon_apbc RESET_UART5>;
>  				interrupts = <47>;
>  				reg-shift = <2>;
>  				reg-io-width = <4>;
> @@ -732,6 +738,7 @@ uart6: serial@d4017500 {
>  				clocks = <&syscon_apbc CLK_UART6>,
>  					 <&syscon_apbc CLK_UART6_BUS>;
>  				clock-names = "core", "bus";
> +				resets = <&syscon_apbc RESET_UART6>;
>  				interrupts = <48>;
>  				reg-shift = <2>;
>  				reg-io-width = <4>;
> @@ -745,6 +752,7 @@ uart7: serial@d4017600 {
>  				clocks = <&syscon_apbc CLK_UART7>,
>  					 <&syscon_apbc CLK_UART7_BUS>;
>  				clock-names = "core", "bus";
> +				resets = <&syscon_apbc RESET_UART7>;
>  				interrupts = <49>;
>  				reg-shift = <2>;
>  				reg-io-width = <4>;
> @@ -758,6 +766,7 @@ uart8: serial@d4017700 {
>  				clocks = <&syscon_apbc CLK_UART8>,
>  					 <&syscon_apbc CLK_UART8_BUS>;
>  				clock-names = "core", "bus";
> +				resets = <&syscon_apbc RESET_UART8>;
>  				interrupts = <50>;
>  				reg-shift = <2>;
>  				reg-io-width = <4>;
> @@ -771,6 +780,7 @@ uart9: serial@d4017800 {
>  				clocks = <&syscon_apbc CLK_UART9>,
>  					 <&syscon_apbc CLK_UART9_BUS>;
>  				clock-names = "core", "bus";
> +				resets = <&syscon_apbc RESET_UART9>;
>  				interrupts = <51>;
>  				reg-shift = <2>;
>  				reg-io-width = <4>;
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
