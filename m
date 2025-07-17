Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B002C83F34
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 17:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IIejnwxy5yewR3tTu6zYryP9jVPBalsr86JllEqjWw=; b=4OZ7CnPeKFQy9RKXfohUkWcbib
	9O3qIvy5d2WHIGTaaTfqbC2xF5amTv9N5/NATCL+2S3O+qCV5zyKRLWY3UjWBdILl/0Q35eR3ob+o
	ZJ3vOJKYrDG0/V4xeFf+trCI/JkVP1NrlkOgWKndeCCT2jkBEg946S3/LTxnsMYqotUsFA29fFFE3
	ohVtDhnxvmQHx261ytELsd3AdH8nhhthpIr4LxqZJq7YOm05JhEr9sqlKcLmfDVhZmhaiEjBlZ5aN
	g5NGOc/hKH//8djerA23Wk9wLq4dx+5WuhlcoYRFiYGwJCvxn8ygDHBY5OIMsUSJbsrqA5Zsvd2uj
	1JTYApyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSZA-0000000Aoxa-227J;
	Thu, 17 Jul 2025 17:38:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSL8-0000000AmlZ-2ibC
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 17:24:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F488A40065;
	Thu, 17 Jul 2025 17:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF616C4CEE3;
	Thu, 17 Jul 2025 17:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752773045;
	bh=JH7VSFk/zK+FQ9CRe5bDUMbGMnh0P9SvywzJv9eWuQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sde9pVkvxPodunTdA5DIJh3VknjZw7jKpSaAUcVcCMeyKCTWYX01W/0ZSwmDUcGR7
	 VM8+USj5T+EuNh3ObNgME/jVErTbCIkZ9ufsN0ABlk6sXhhjoiVCoZHFtN1nsdnAhm
	 ImoEakWy4hHg9vAfRYM4O6MB2KmpzYq3JvoKN6YSiixl0SLNjncBfwmhH3lUBYEjV/
	 u1+BW/EacLw95IrpD2AmOHK1ZEqg/qaPTCM7d3HyhbttwvzBIHiieyyAX4CT2Dg/Y5
	 W/+rhlGV9ZDe3ZYt4sg4nw82K6Vdcj5JUFuM8xDYCgxPQEXpGosSfRoFhYHIWFY0PA
	 f7IUpJiiYL+7A==
Date: Thu, 17 Jul 2025 18:24:00 +0100
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-milkv-mars sort properties
Message-ID: <20250717-recapture-frostbite-80d22fa325bf@spud>
References: <20250716061940.180231-1-e@freeshell.de>
 <CAJM55Z_77aygReSPJyZMtfZWk_UPYTzYLH5E5uEw6K=GSu0LNQ@mail.gmail.com>
 <20250716-strategy-evasive-57b400af9366@spud>
 <c3d8693e-f7f5-4072-bdce-2bb0778c77c3@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <c3d8693e-f7f5-4072-bdce-2bb0778c77c3@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_102414_758641_52A4FF5C 
X-CRM114-Status: GOOD (  15.38  )
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
Content-Type: multipart/mixed; boundary="===============1532249848795049551=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1532249848795049551==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KKorxj2ps5Qyg8DE"
Content-Disposition: inline


--KKorxj2ps5Qyg8DE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 12:06:57AM -0700, E Shattow wrote:
>=20
>=20
> On 7/16/25 08:28, Conor Dooley wrote:
> > On Wed, Jul 16, 2025 at 02:17:34AM -0700, Emil Renner Berthing wrote:
> >> E Shattow wrote:
> >>> Improve style with node property order sort of common properties befo=
re
> >>> vendor prefixes
> >>>
> >>> Signed-off-by: E Shattow <e@freeshell.de>
> >>
> >> Thanks!
> >>
> >> Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >=20
> > I'm going to pick this up, but it may be very late for 6.17.
>=20
> Yes. The other questionable sort style in this dts I was looking at are
> whether we want "compatible" before "model" in the root '/' node?  And

I think usually model comes first, yeah. Whether that's worth doing
something about, I'll leave up to you.

> then why we have this common pattern of 'pinmux' (or pinctrl*)
> prioritized firstly in the natural sort order, also pinctrl-names before
> pinctrl-N is a common pattern that seems an arbitrary reversal of
> natural sort order?

Usually "foo" is followed by "foo-names", but pinctrl does appear to be
a bit different since everything has a -something suffix. Skimming, it
looks like there are actually more instances where pinctrl-names appears
before pinctrl-N.

--KKorxj2ps5Qyg8DE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaHkxsAAKCRB4tDGHoIJi
0u/iAP9jwxr4ZffYF8ASjcQj8Jk2UVLg2Psjh9pxqVhd2DEAhgEAmt8l09YsKsMe
nQWKkN3C+dhb2aPlJaM9ndgQv0SCQgw=
=vtGl
-----END PGP SIGNATURE-----

--KKorxj2ps5Qyg8DE--


--===============1532249848795049551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1532249848795049551==--

