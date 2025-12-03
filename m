Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796BAD12D69
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 14:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+JxAZ22/6rjNrM+pnH6uEnuMMxKKKKVIFAs9w9WA6E=; b=ittVU+tBGIsfo3aDz/eEORNOLm
	aCyzwYklZNNu+FjRr0q6uxmSn31B6ERuMP4DtbRgjr63vc2FHfHMq1A6onPfqvZDdETn3TcFG2HY5
	AlkF2qr9oNSWHuFNdhIGrxfeopEPGL0KGQGfqWMXHB7/w0U1iTbLafh+usaFb4Z5RZBeln2/VAnAe
	kAC/iUnLRKLgleLjwySOz98gUtu0/8nsjkKcwrtEahgNuqmAEcPQH1LcPc+YNUesj9NcFUH5X5TFZ
	gJkz/rrDgBLp5XmiaxQWV/MIV1WXE0UYLjAUbofdLqoaaegmiXwsQO7y3+BfrSJ7VDlPJlbysQu3R
	xKc2Lo/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQnaK-00000006dGb-0CYm;
	Wed, 03 Dec 2025 14:12:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQnaI-00000006dGU-3Lod
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 14:11:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EFAFF60158;
	Wed,  3 Dec 2025 14:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2990BC4CEF5;
	Wed,  3 Dec 2025 14:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764771117;
	bh=xuE5sa0P0kdmX+1IVQZ7pAu008bNjN32zP9oWawUpT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sICBhn5bIYCiDisebCCftrApMVqgWTUedeR8E0zJrxp2IADY51qvXuCT4TNdYuQMm
	 57R6dESs9tV/9OftnXO7hzZdeqtMZDUWAJk32EsU3XKtZL88mIOHWhN3g0Rkuvo3N+
	 HjPb4LQ1V8lNYQrXoGauHvZwBCSi7goRar0iid/TpzhEbW5hA61p70WPR5Ei/g8nWs
	 pe89nFoS0wEsdlDX2bmdN8pLQlwNJLLf6ZV9Y04W27yWV5AxvFsmNScDEaGWjaNl49
	 ORrfaFpWP9QfVs8BmT6UJ3unLEIgiXLmBy5m5fB1nkXSb5Cd2EZ/gnlzF0Hy4ONqIE
	 FEFMl5k7PbeOA==
Date: Wed, 3 Dec 2025 14:11:52 +0000
From: Conor Dooley <conor@kernel.org>
To: q691800735@163.com
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, p.zabel@pengutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: reset: Add Kendryte K230 reset controller
 bindings
Message-ID: <20251203-spectator-apple-a3f50d52d441@spud>
References: <20251203092632.219525-1-q691800735@163.com>
MIME-Version: 1.0
In-Reply-To: <20251203092632.219525-1-q691800735@163.com>
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
Content-Type: multipart/mixed; boundary="===============4148740763668336135=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4148740763668336135==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yefhawvbBAcoYuHz"
Content-Disposition: inline


--yefhawvbBAcoYuHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 05:26:32PM +0800, q691800735@163.com wrote:
> From: jybruceupup <q691800735@163.com>
>=20
> Add canaan-k230-reset.h to define reset IDs, types and register offsets
> for Kendryte K230 RISC-V SoC, covering CPU, peripherals and subsystems.
>=20
> Update MAINTAINERS RISC-V entry to include the new reset binding header
> for proper maintenance tracking.
>=20
> Signed-off-by: jybruceupup <q691800735@163.com>
> ---
>  MAINTAINERS                                   |   1 +
>  include/dt-bindings/reset/canaan-k230-reset.h | 513 ++++++++++++++++++
>  2 files changed, 514 insertions(+)
>  create mode 100644 include/dt-bindings/reset/canaan-k230-reset.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d83920cbc..b489ab6cd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22105,6 +22105,7 @@ C:	irc://irc.libera.chat/riscv
>  P:	Documentation/arch/riscv/patch-acceptance.rst
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
>  F:	arch/riscv/
> +F:	include/dt-bindings/reset/canaan-k230-reset.h

Something to note here is that adding these files to the main arch/riscv
maintainers entry is not appropriate. These should instead be added to a
dedicated entry for the canaan k230 reset driver and bindings, with
people who specifically care about the device as maintainers (hint:
usually that's the author of the driver and bindings).

>  F:	include/dt-bindings/soc/canaan,k230_pm_domains.h
>  N:	riscv
>  K:	riscv

--yefhawvbBAcoYuHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTBFKAAKCRB4tDGHoIJi
0ldNAQDVpsh8a8mY5+Equ89fltAnVPedoFeU+ZnnBLJGZk43KQD/YTsXqXqpu1Rj
MF8Ktv+JdSSo1X8a0sLwhTC2JFTsPgI=
=VaOT
-----END PGP SIGNATURE-----

--yefhawvbBAcoYuHz--


--===============4148740763668336135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4148740763668336135==--

