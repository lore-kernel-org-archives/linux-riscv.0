Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC2CC76188
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 16:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRCJhTlENMRaOSgyczKshT+C/rOEH16wYO+Ro6i+zmo=; b=R9ujZV9b1F8u7qjTibKnE33HmP
	fjEqhDzPuaNJ9+HapelCRcv3IWYcsPPAW5f90EW1bKXRO8W+3r4MFm+vc3r6BmSxtjhGScC2W3Gw6
	rLke1jrcnFSjEJyXiMCiay+LeOxYaHj4WHBH0wqbOhM7aN1DTCwRz0SU6qZCozP8ejvt2kSs37VsE
	fxJ/ooROT96Cy0+boFGKQuHKDXHTQw0p7jN6VsYpQRJPqzMVTAnLJEcdRj1dxf+Ss25xnqjHi9GH9
	INnTcIN0VxGq6CjWWwORll0EYa4eMSuGKsSn5BUndm+/j6V7187eeQ2eZdyAKMR4MvnqoZLdvX381
	gkZ8lDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk69H-0058ZS-26;
	Wed, 05 Apr 2023 16:38:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk69F-0058Yt-0W
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 16:38:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B6D94625BE;
	Wed,  5 Apr 2023 16:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCB3C43443;
	Wed,  5 Apr 2023 16:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680712692;
	bh=syKhDH18sc1NcY1/ySSVPv2qM6XNI1spR3GACAOsNJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBNtu1Pr52mhp899qkiRAQ3jV6O5ZfF7agoRgDSfE2Kov/aUqK7ByJkK10TOdw+0X
	 3WCXsxvRS43Z9Lyz2xY9BnQKKVTRIKzEr0FgrLu2MU8LYBrhazoPa55y5z8bI5WkR+
	 YwSQAMOiAhxm282qCVUe1Y1cNJvZQhpBqkqcEYC/swER81ncPq3WNN1br3XCS9klTf
	 T4F1g/Cab+mZbp1h5rPIys/HbGY0wqQ8feM7ryyu5WBcX0QZsD1r3NV6ay0UWmai08
	 psHGP5jshPyXILDcFR39tHCWgW05oHtBCZvCvRF4cKAun42UDKb6omKeU7L/Mo6QwE
	 IH0DbsmV6DXog==
Date: Wed, 5 Apr 2023 17:38:07 +0100
From: Conor Dooley <conor@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [RESEND v6 1/2] dt-bindings: soc: starfive: Add StarFive syscon
 doc
Message-ID: <20230405-bullseye-handsaw-5c2e4dab772f@spud>
References: <20230315055813.94740-1-william.qiu@starfivetech.com>
 <20230315055813.94740-2-william.qiu@starfivetech.com>
 <850bc37e-c6d1-2381-a851-965a4cbee8a0@linaro.org>
 <e38efd81-9c79-553b-7556-7aff30f6ec50@starfivetech.com>
 <f25cc55e-3405-4b17-fb45-5ae5eb36a404@linaro.org>
 <d0b1d44e-6d6e-536c-046e-be6a53f1d240@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <d0b1d44e-6d6e-536c-046e-be6a53f1d240@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_093813_238365_CF3C15A4 
X-CRM114-Status: GOOD (  14.54  )
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
Content-Type: multipart/mixed; boundary="===============0148835308402116058=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0148835308402116058==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l1+mDrVx6go5Y/WQ"
Content-Disposition: inline


--l1+mDrVx6go5Y/WQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 03:32:14PM +0800, William Qiu wrote:

> >>> Does not look like you tested the bindings. Please run `make
> >>> dt_binding_check` (see
> >>> Documentation/devicetree/bindings/writing-schema.rst for instructions=
).
> >>>
> >>> ... or your PLL clock controller was not tested.
> >>>
> >>> Best regards,
> >>> Krzysztof
> >>>
> >> Hi Krzysztof,
> >>=20
> >> I've already done`make dt_binding_check`, and get no error. So maybe P=
LL clock controller
> >> was not tested which I didn't add in this patch series. And PLL clock =
controller belongs
> >> to Xingyu Wu, I would tell him.
> >=20
> > What's confusing you do not allow here clock controller.

> I'll add it then.

What's the plan here William?
Can you sort something out with Xingyu Wu so that the dt-binding is
added in a complete manner?
In the meantime, gonna drop this series as "Changes Requested" from
patchwork.

Cheers,
Conor.

--l1+mDrVx6go5Y/WQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZC2j7wAKCRB4tDGHoIJi
0k+4AQCdBamxHmK76N715U1XwXpOgMU26jEqAcw7pKiI/4fH4gD9GXFxFJgrDOfu
irkLH3kj2KloYVZ/9eNvQHp19BK9NQ4=
=bLQ4
-----END PGP SIGNATURE-----

--l1+mDrVx6go5Y/WQ--


--===============0148835308402116058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0148835308402116058==--

