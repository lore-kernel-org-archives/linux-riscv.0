Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4191DC61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 17:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5WEAgVAtbbRiPtBpxACeSjJUYkf+4LJ46xkpKGagAU=; b=4xBYlqqn3nEt5HLD8iyHZm4ZHY
	Um7mGf0/XvOmNX9I9YjMls8d0JXzTzQ7evi2FrVKjRI4wQlbiwHLx1K6qHXntS3ASv3sx8D5RJd5z
	177ZT+2e+lBMD2MY0NbOTiAZhyAXZDI1R9wpdmGmreVojZ3VoDzeqasNRbdvue3z8BsIi4UaDOCny
	VcfDe4nmDHF+a0zG9qByQLxkFKf9K758643CierYzpFpOPNX0LXT/g0PfyJYDD50HuWcWW30Bszt9
	GQskf3fdUqq1g02Zs3QJ4eHbW7D0jRyIxeGfuasjivHgFiG+LGwyNrDLSgDF7Jwu2yp6j+072nMiS
	OiU7BXmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUW3h-00947G-QR; Tue, 21 Feb 2023 17:04:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUW3b-009448-9S
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 17:04:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4F5160F82;
	Tue, 21 Feb 2023 17:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9B2C433EF;
	Tue, 21 Feb 2023 17:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676999038;
	bh=Qnh0EERUxpKQwR06nwCqwR4x3GBsbnbkgHVMUazIAAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NqqMNO1k/8gwXWzWHds8Y5Po1S3dNJqT9piZAYj/t3hMItxadAHciBBsvngEh8wfF
	 K4zdR070NAa0r5sMuo4yZmbGwoMz5T25KrNJZQzpZ0FaG1NhsuzkrWA9IvlVz3c8+w
	 YO6SwRMYwu52FkDDaoj4P06YI9dPtnqgO89sxQw4SDO4p8fUWxBLPYGV5RfxWVn1ju
	 I+JHmtzqn4x2qjpiauoG4yDJnVoLOVv49Yln7YYYC4NCLoK3i+JPceMY1F3xAjiRyd
	 70hCQVYEcXSxyNKQ2xND2n5eCo6olbo6+ubQq21e3VB9hIHk+vg2PE530SxdHHR41Q
	 zrH/8dRfRbmOQ==
Date: Tue, 21 Feb 2023 17:03:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 17/19] riscv: dts: starfive: Add initial StarFive
 JH7110 device tree
Message-ID: <Y/T5eL4s8FSlbgQh@spud>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-18-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230221024645.127922-18-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_090359_390796_B6413457 
X-CRM114-Status: GOOD (  13.51  )
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
Content-Type: multipart/mixed; boundary="===============5337126777783308144=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5337126777783308144==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zV97GbCkITlnNHaF"
Content-Disposition: inline


--zV97GbCkITlnNHaF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 21, 2023 at 10:46:43AM +0800, Hal Feng wrote:

> +		S7_0: cpu@0 {
> +			compatible = "sifive,s7", "riscv";
> +			reg = <0>;
> +			d-cache-block-size = <64>;
> +			d-cache-sets = <64>;
> +			d-cache-size = <8192>;
> +			d-tlb-sets = <1>;
> +			d-tlb-size = <40>;
> +			device_type = "cpu";
> +			i-cache-block-size = <64>;
> +			i-cache-sets = <64>;
> +			i-cache-size = <16384>;
> +			i-tlb-sets = <1>;
> +			i-tlb-size = <40>;
> +			mmu-type = "riscv,sv39";
> +			next-level-cache = <&ccache>;
> +			riscv,isa = "rv64imac_zicsr_zba_zbb";

I still think that adding just zicsr here is pointless. If you're going
to be specific, why not also mention that you have zifencei too?

> +			tlb-split;
> +			status = "disabled";
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};

Rest of this looks fine to me though, thanks for adding the s7
compatible and zba/zbb :)


--zV97GbCkITlnNHaF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/T5eAAKCRB4tDGHoIJi
0krCAP0WvomVWVTumjltZETdZGiWXtffg+jVhmIVSy7BtSwvZAD/erv0jRnX/bvF
4+QnC46U7EwjU++x1eOoHA1kJnAbNgE=
=k2Zd
-----END PGP SIGNATURE-----

--zV97GbCkITlnNHaF--


--===============5337126777783308144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5337126777783308144==--

