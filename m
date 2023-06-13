Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4493CEB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 19:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfVz8XffSbOQhdzMyWJJj90sE++ndMGnnhHOeAesEQg=; b=crREIgzSm/9J2rHlfQJnRu/nj8
	swBiWI2iwRQbqJet3DiNardMr+rtpOIoLQEEMx+4uq7W6dbp0IXnpufQrjwQGA5LliIoa8PpGDcip
	3/XgO4nxyuqpYkKzJPWBROBrn7yZl73vQ+rtGAi1mIXQ1Ejqxlf5FBAcjAVhWunbHuxmO1YWXRhvF
	RPGsvIDbHaVUn6tH24Hd7WL9emgKwIx7aP+rMgIpxjOoFR4LhETIqW/16jjoFtfzWhGvqQ88KM0fu
	nSPNM6M35RswEF+dzecW0rHZi2d5UKh6/Lw20Ecq/VCNC5wmxCIiep4bn6NIKdDhktozFBg6vSoYL
	YKEP6G+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q99LM-008vtg-0Z;
	Tue, 13 Jun 2023 19:06:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q99LI-008vtC-1D
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 19:06:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E1DA06183B;
	Tue, 13 Jun 2023 19:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0553FC433F0;
	Tue, 13 Jun 2023 19:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686683171;
	bh=JVKNrqDZfREE/1K1QquNLqZUTAYZnNkSzqm/PaREPsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z+36+jPZTAltXrM/lDBUwXgSMLpX4CeqEC8/CHrmQR9FAwMTmfwBGJJfoe1idMxCk
	 eIPVuTFphnleBAd+/rpRQXkvE+QQ2A3NtLmYyiZ/wO8SQsdvQ4V6GL/aWiCGzNyXOS
	 9+p/FKK7EinYAza1QjeiBSoLlnH3giRpDEPVCWp9/8fbL/ddUgtq6uOagW4b1dJjSr
	 sD7xdMaehaHoxflnunHDnMyqxfyOR31UXU3Yfm6MqzPhkHTo2OSZgGneTXcJIMNyQ0
	 eURsSWboWmfqJlOV6ZY6bidlsTU5wH1ze4UCnxlMGmw6qAz5ZpW9fgoGuv0ook8r5V
	 0ljaEBGAgCmow==
Date: Tue, 13 Jun 2023 20:06:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 1/7] dt-bindings: clock: Add StarFive JH7110 PLL clock
 generator
Message-ID: <20230613-surrender-surcharge-8778867e58c1@spud>
References: <20230613125852.211636-1-xingyu.wu@starfivetech.com>
 <20230613125852.211636-2-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230613125852.211636-2-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_120612_502919_2FA6126A 
X-CRM114-Status: GOOD (  16.07  )
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
Content-Type: multipart/mixed; boundary="===============6262461822977783796=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6262461822977783796==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V86L6w1gIPDva+D3"
Content-Disposition: inline


--V86L6w1gIPDva+D3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Xingyu,

Couple nitpick items to be fixed if you resubmit.

On Tue, Jun 13, 2023 at 08:58:46PM +0800, Xingyu Wu wrote:
> +  This PLL are high speed, low jitter frequency synthesizers in JH7110.

nit: These PLLs are

> +  Each PLL clocks work in integer mode or fraction mode by some dividers,
> +  and the configuration registers and dividers are set in several syscon
> +  registers. So pll node should be a child of SYS-SYSCON node.

nit: Each PLL can work in integer or fractional mode, with controlled by
configuration registers in the sys syscon.

> +  The formula for calculating frequency is that,

nit: s/ that//

> +examples:
> +  - |
> +    pll-clock-controller {

nit: s/pll-//

> diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt=
-bindings/clock/starfive,jh7110-crg.h
> index 06257bfd9ac1..086a6ddcf380 100644
> --- a/include/dt-bindings/clock/starfive,jh7110-crg.h
> +++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
> @@ -6,6 +6,12 @@
>  #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>  #define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
> =20
> +/* PLL clocks */
> +#define JH7110_CLK_PLL0_OUT			0
> +#define JH7110_CLK_PLL1_OUT			1
> +#define JH7110_CLK_PLL2_OUT			2
> +#define JH7110_PLLCLK_END			3

Please CC me on the patches fixing this for U-Boot :)

Nitpicking aside, which only needs to be fixed if you end up submitting
a new version for other reasons,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--V86L6w1gIPDva+D3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIi+HQAKCRB4tDGHoIJi
0s2YAP9fY80PpW7x8lDibgVYA9PDnGUbJY/AkWQnjg1rf9TwwwEAqBCba6ZRQKlo
zxhNvp+yHUur3Xea7D25AcZmYwEwkwI=
=lL9I
-----END PGP SIGNATURE-----

--V86L6w1gIPDva+D3--


--===============6262461822977783796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6262461822977783796==--

