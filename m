Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2A1FB3CE4
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pu6iea5XDK1E6FZ3qDYqDwemAhQyWhhbZ9YgKoVttI8=; b=hTh3dpqOya2xhr
	D0g2UmMbDowoQKGtW0WkwwCf1J4z6RZM9R8QIj4GChdj35YVNzqniq1ZANHze0s8wOFKvyfbHq57j
	JPQVTcviRPKSCY/FEeNm4bZtooOUOYK6BAs/4sKYlBPo3JDrH2tcmHcZCkK2O/FqMx//BpFhesNK7
	58SWaILzykBBlfIH4EH5158BXOatEpqKwVPqnE0yrEPVzPP4U34yLIBCYYrEF3JV6ygW/7MO4HVWs
	zUnDSVho8H3x0x9y6plqCQKd8thTSjA/LotFr/yj9ODcviZ3xuTVwqjuMoUw8pJL0aBdja+Y6YlDG
	7zMAGAsUcNOSJkVdIE6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78cW-0000000Aw1p-3hHk;
	Mon, 30 Mar 2026 09:09:16 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78cQ-0000000Aw0P-3EjN
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 09:09:15 +0000
Date: Mon, 30 Mar 2026 17:08:48 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774861735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Jvy42babhOLsHiEQ6usNzQ70aeU07GAe8AZCgZgAp8=;
	b=EAV1f4c4rRJWfcl66mXI8RIvG/+1PnohQ+N3Fx6jEMv01wFPvtDOsKPATMBafNwdrjPmpA
	e2jyI6OCvpHWkEwrwJ23WJwDsKzU11dkXc+pjZnCVfED5pLIZZrs7eLTrl6Bttex14rseG
	k6ClXdR3bPy2XILQhP1XJHwYHuu6lKs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH v5 5/9] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
Message-ID: <aco9oLumPh4OZtIo@kernel.org>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
 <20260330-orangepi-sd-card-uhs-v5-5-bd853604322d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-5-bd853604322d@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_020911_253872_EF4D924F 
X-CRM114-Status: GOOD (  15.70  )
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

On Mon, Mar 30, 2026 at 16:38:06 CST, Iker Pedrosa wrote:
> Add SD card controller infrastructure for SpacemiT K1 SoC with complete
> pinctrl support for both standard and UHS modes.
> 
> - Add sdhci0 controller definition with clocks, resets and interrupts
> - Add mmc1_cfg pinctrl for 3.3V standard SD operation
> - Add mmc1_uhs_cfg pinctrl for 1.8V UHS high-speed operation
> - Configure appropriate drive strength and power-source properties
> 
> This provides complete SD card infrastructure that K1-based boards can
> enable.
> 
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 40 ++++++++++++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi         | 13 +++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> index b13dcb10f4d66022d27307de73a6ea3287e97441..8d82011f1af666fb78c282a2abcc0cb88f962053 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> @@ -570,4 +570,44 @@ pwm14-1-pins {
>  			drive-strength = <32>;
>  		};
>  	};
> +
> +	mmc1_cfg: mmc1-cfg {
> +		mmc1-data-cmd-pins {
> +			pinmux = <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
> +				 <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
> +				 <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
> +				 <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
> +				 <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
> +			bias-pull-up = <1>;
> +			drive-strength = <7>;
I'm a bit concerned about this value. Looking at the downstream 6.6 code, 3.3V uses DS4,
which equals 13mA. Since 7mA maps to DS0, what's the reasoning for using it here?
Do we have any documentation or measurement to back this up?
> +			power-source = <3300>;
> +		};
> +
> +		mmc1-clk-pins {
> +			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
> +			bias-pull-down = <1>;
> +			drive-strength = <7>;
> +			power-source = <3300>;
> +		};
> +	};
> +
> +	mmc1_uhs_cfg: mmc1-uhs-cfg {
> +		mmc1-data-cmd-pins {
> +			pinmux = <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
> +				 <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
> +				 <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
> +				 <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
> +				 <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
> +			bias-pull-up = <1>;
> +			drive-strength = <13>;
See above.

                                      - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
