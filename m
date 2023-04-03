Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C174C76188
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 22:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gurvNMZpy4bA4bDRwGKkK7ahJxFPttAsufzwZn8LiYM=; b=E89kSr28ImSbZO2DXQO5VuCu7Y
	lj1S65bwunJ4uW5OqTkgdzOA/P9r8DoeUa/DajxXcX8lT/7QNf2bv470DiAcTHl7QfOUzCPRZaRRw
	d5RFJdozeynisIRj0Qc8u7d3ZoAOP+eg/sqvDfTTMI9yPA1hS9fQ1ApkP5PShK82LC7maMM09dXim
	8DIANk9XIuIsY5SOeYZgmgv1cHGtmNsSqLEQKa317XlW09qRVz+aVegJvqkjNZAuI2AmC3avGWAtq
	Fpi038Ddk7IJVGGCTYZ2aYHFwJEnQf2AxS3XyNoGJGDd6cbGMcSkKoSoNEWKyeIhePEUQWaZaezyi
	OhbXRw1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjSSQ-00H2BO-07;
	Mon, 03 Apr 2023 22:15:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjSSN-00H2At-2D
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 22:15:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4266A61DB5;
	Mon,  3 Apr 2023 22:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88528C433D2;
	Mon,  3 Apr 2023 22:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680560118;
	bh=57QA0D3vMKUxVxiGwf9bCE+CVxDRjP2244HhifV2zpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=auNZJlAFrquPLRfqf4+Mg/ydhzeX03nR2BHZhssNIr60GLrXdRFNwla7sdquGTJoX
	 tBbn5zn2w8ojwIgOPCaItN0L5jGXwCWYg5S1/0qNdQnCSOLYVbN3bVxx/3nd5EoVjW
	 j8zAZJWIbikpAOY/ED/FMva8a8pLbAPt5IXQwkI0uaoVQWYJuID/nk+YyCNjsSB0KP
	 rGPENaVbj+1STeyw2qGcV9iAiQ1dUhB9K2UnXQt3AfHA/InzLMtIws22kBDTSWaBeE
	 mue4cTvAiNQ235Dl8Hm+DOjuHi0KpNfe0owHejloFUH1I/3zGu5xp8rHafdMl5EiID
	 s8+Eu9k14Tg2A==
Date: Mon, 3 Apr 2023 23:15:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Samin Guo <samin.guo@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jose Abreu <joabreu@synopsys.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: Re: [-net-next v10 5/6] net: stmmac: Add glue layer for StarFive
 JH7110 SoC
Message-ID: <20230403-data-dawdler-afaaaf6fa87c@spud>
References: <20230403065932.7187-1-samin.guo@starfivetech.com>
 <20230403065932.7187-6-samin.guo@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230403065932.7187-6-samin.guo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_151519_768889_9364407F 
X-CRM114-Status: GOOD (  11.60  )
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
Content-Type: multipart/mixed; boundary="===============5328563678834917115=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5328563678834917115==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="84nP7Z0ce07Qtixm"
Content-Disposition: inline


--84nP7Z0ce07Qtixm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 03, 2023 at 02:59:31PM +0800, Samin Guo wrote:

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6b6b67468b8f..a9684b3c24f9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19909,6 +19909,7 @@ STARFIVE DWMAC GLUE LAYER
>  M:	Emil Renner Berthing <kernel@esmil.dk>
>  M:	Samin Guo <samin.guo@starfivetech.com>
>  S:	Maintained

> +F:	Documentation/devicetree/bindings/net/dwmac-starfive.c

Funny name you got for a binding there mate!

--84nP7Z0ce07Qtixm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCtP7wAKCRB4tDGHoIJi
0myQAP9wARDgakX8FcF58KbJswTnvpTw2I1YphYE7uWfxOLrlwD7Bo0T6w52woIL
AhFB+0TUkn9D0MEdo0+3Cvoz6DRWuww=
=tani
-----END PGP SIGNATURE-----

--84nP7Z0ce07Qtixm--


--===============5328563678834917115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5328563678834917115==--

