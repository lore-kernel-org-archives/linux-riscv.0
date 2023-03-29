Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD6DC74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 15:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dH9rC7gEOY4RZRlH3W71GwF957pcCQnBSeQWXHZfrOY=; b=aL0QREhkU+dpTSJkdY1mXk5p+D
	MHAJ/cf0JWB3JYFxe1JSl3O0grZCM5azTm0cu8YBjTpwpBNdo4dGEY7rd75jrcV6eFfSsHVIS3VW9
	qPIRLuGEeVumKWxVfyR2C9izjm0UtSdtqoO6xjGmDFkfu3asV3wKho5UT4qjDYQh64N3E2XBib2SK
	RuPn3UqLPR0Kv8qrV6Cif1yWeOrobPdOKRn4anfLrp8eAMieJRP4QJBzk1IVEW2laDCnM1+5Q5pgk
	XuSn9cVwq3Ff4S6YWBT4b2vMjya2bTDQpsFmYAU9EfK8HxnFbb+UHhVUeMMzeR5yBeDiKfwgJurPG
	7hT8SOgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phXoA-000niZ-1B;
	Wed, 29 Mar 2023 15:33:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phXo7-000nhK-2w
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 15:33:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5192FB82370;
	Wed, 29 Mar 2023 15:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28112C433D2;
	Wed, 29 Mar 2023 15:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680104030;
	bh=IxAbBP9UjglHluPryJjf4M5TDGTVE3KN+oepn4YHf/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g0APkOz/qZlNfpr2NCNDI4Pxe00LN4KoAe4O+FwTiY/73aViE1XZUWX9msBX4VEUR
	 p67+BKKQJlNR7Lj+fjdM/ZfVWb7Pr4yAP9i4Rp+Vi8KFRw651xspY0SFOzlqLnxZON
	 zMant2XIebI+d/+eV80EXyK5c1zt8Bnxuvd/ML9bnE7tdAUwkJLJGhGtpTPlaX0s8/
	 oLpETCOSK91MCNujSKsefWxOSoATkQBWOh7cqWCK7bYp7Vct5dDH63jYR1czg6Z6V6
	 ipU59BL2UDAV4M9hPSAlmyAXIQIF562uUKjo0eRIta/o6JPHxAVR3g+JrDcSwIEIwi
	 Yh7SKufVBPXmg==
Date: Wed, 29 Mar 2023 16:33:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes v2 3/3] riscv: No need to relocate the dtb as it
 lies in the fixmap region
Message-ID: <9c90f390-92d2-4dde-8cd7-b50e9c858787@spud>
References: <20230329081932.79831-1-alexghiti@rivosinc.com>
 <20230329081932.79831-4-alexghiti@rivosinc.com>
 <381c2753-cbcc-40a0-bcb2-67d18e367822@spud>
 <CAHVXubhVGR1vjqFVv1vuDGDMSiG0JBpKtRZnzgzpa9VBK+BuNw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHVXubhVGR1vjqFVv1vuDGDMSiG0JBpKtRZnzgzpa9VBK+BuNw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_083352_106057_E4BDD24C 
X-CRM114-Status: GOOD (  18.89  )
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
Content-Type: multipart/mixed; boundary="===============1220040190055419317=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1220040190055419317==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nf9NXaBcWq31jVDo"
Content-Disposition: inline


--nf9NXaBcWq31jVDo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 04:40:18PM +0200, Alexandre Ghiti wrote:
> On Wed, Mar 29, 2023 at 3:56=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Wed, Mar 29, 2023 at 10:19:32AM +0200, Alexandre Ghiti wrote:
> > > We used to access the dtb via its linear mapping address but now that=
 the
> > > dtb early mapping was moved in the fixmap region, we can keep using t=
his
> > > address since it is present in swapper_pg_dir, and remove the dtb
> > > relocation.
> > >
> > > Note that the relocation was wrong anyway since early_memremap() is
> > > restricted to 256K whereas the maximum fdt size is 2MB.
> >
> > So, should this be marked as a fix, and backported along with 1/3?
>=20
> Hmmm the whole series should be backported, it does not make sense to
> move the dtb mapping and keep accessing it using its linear mapping
> address since it could fail for the exact reason the relocation was
> implemented in the first place and the relocation is wrong.
>=20
> Maybe we should simply add a "Cc: stable@vger.kernel.org" on all the patc=
hes?

Yup, although hopefully Palmer can handle that if nothing else needs
changing.

--nf9NXaBcWq31jVDo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCRaWQAKCRB4tDGHoIJi
0mnyAQDXKpwmfpB5q4X6QPOw2jiCPiYKY75s1bbJ5ruHbLirBAD/XxFephOltSEa
xNmJKur1/tjGtJkHfUraiWjc0d6WGgo=
=WNhR
-----END PGP SIGNATURE-----

--nf9NXaBcWq31jVDo--


--===============1220040190055419317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1220040190055419317==--

