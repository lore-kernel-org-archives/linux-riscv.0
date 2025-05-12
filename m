Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A279C3ABD2
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 10:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=moBbPwKMlSei7QRoJfFOuBY9j+iHW2z2rUkigO3ds5M=; b=xhfLtzsoImcETiZGQcYBwNb04X
	GvEGQSZ4W15lfdWkeeVQkeFHfi6HTZBSHJQ1bXluk3C6HSsoYWx7JO1TSdf2THRvnfSwtPbRv+1xc
	HLv92+4TEZqp0Thu7DUszWlBWSUB8Srtwak6bVn/IkCWXLnSho7u7CrPGkKvfrZZG2k0G0rtO5nzk
	TSDZSJbsS6HmHOY5x/1tYIhtYaD2R+vIcF7dzckZ7on1dM54W9mmJKFyOCb1+UJdly+CdJaMhCome
	sOWQIhmsQq0vrgzJGk9PYrM4TRVpfMKH4pM2YuiYOY8B3ID9EXxVZP3IJ5vPqz2Tx1YS0QtA9b8Pd
	8dzvKB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQNR-000000095wq-400S;
	Mon, 12 May 2025 10:27:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPwE-000000092ez-0WOn
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 09:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C4C05C62B2;
	Mon, 12 May 2025 09:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2088AC4CEE9;
	Mon, 12 May 2025 09:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747043949;
	bh=hQq4dgkefAJ7TlKM+qmR+trX2qmtOXQN1XFTxNeYjv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eKIZxZgUcpIdJIgPHWL0aesXJ2smhpbgLsD6Jr6VKaT7jbdAkX49iBGHc58mzpD2i
	 gWmtaagi/Hl12iaVzIWdyOxu768wRILascShFnYhipazodOmQ5sP4/CuPIRPzJWL3g
	 /QEYv8kSKIyeOlhiWYXdor0VtlmO3fgs6CAnC9e71fB5pdY4Bg2XOYdbbeHw8aMk8i
	 mnU+lPNu+pyAGbCscGXMk3sRFdybT1K3r6r3E0EqxxbZEm0x2a9IR9TGuPfFQUpcsI
	 0IVrKa/+JDUcZYgl6lKm819JXi9Z1XfQqDNmsdMxy65e9GMGpOYTh9ttE99zMRqO3B
	 HIXs8lszHhKvQ==
Date: Mon, 12 May 2025 10:59:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/2] dt-bindings: cache: add specific RZ/Five
 compatible to ax45mp
Message-ID: <20250512-disaster-plaster-9dc63205cd6e@spud>
References: <20250509-sapling-exhale-72815a023ac1@spud>
 <20250509-dwindle-remold-98b3d03d0631@spud>
 <CAMuHMdVWznEm4Kg-MvgCT5+cBtdwGi9YrzFK6mBaoPJ+VK8S+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVWznEm4Kg-MvgCT5+cBtdwGi9YrzFK6mBaoPJ+VK8S+Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_025910_203735_16A22589 
X-CRM114-Status: GOOD (  19.89  )
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
Content-Type: multipart/mixed; boundary="===============7115555725531020319=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7115555725531020319==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NMTCdSap5S5GkUZg"
Content-Disposition: inline


--NMTCdSap5S5GkUZg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 11:01:26AM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
>=20
> On Fri, 9 May 2025 at 17:39, Conor Dooley <conor@kernel.org> wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > When the binding was originally written, it was assumed that all
> > ax45mp-caches had the same properties etc. This has turned out to be
> > incorrect, as the QiLai SoC has a different number of cache-sets.
> >
> > Add a specific compatible for the RZ/Five for property enforcement and
> > in case there turns out to be additional differences between these
> > implementations of the cache controller.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks for your patch!
>=20
> > --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.ya=
ml
> > +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.ya=
ml
> > @@ -28,6 +28,7 @@ select:
> >  properties:
> >    compatible:
> >      items:
> > +      - const: renesas,r9a07g043f-cache
>=20
> This name looks a bit too generic to me, as this is not a generic
> cache on the R9A07G043F SoC, but specific to the CPU cores.

So "reneasas,r9...-cpu-cache"?

--NMTCdSap5S5GkUZg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCHGaAAKCRB4tDGHoIJi
0h8xAP9xn+oRWIL9u932ivjRElxLh5Z6yxeCLMgzrNL2ZuQIVwEAxGvRg0THrVnD
gBIkCnCEprfllLwvU04AG68v/uxxAgY=
=I1/M
-----END PGP SIGNATURE-----

--NMTCdSap5S5GkUZg--


--===============7115555725531020319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7115555725531020319==--

