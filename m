Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904F0C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 20:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGOlqxeIapf3jT+mKwMliO0O3u0I3m2mMv1/ZQNs7oE=; b=UJVLZsl284/qXGwQAB8saHgXBx
	J92b0txqS9KmgF6rt/nfYRdyNbQwghCQsJwJKwiOwdz4mLeiwVwNKGixL6edfZ6cPg8i96xzXwaoj
	FM9iXhKrEovc1LibGJkVKX3oInKJV6ucPi9qh61r3CUMQQ77eLpkw6XS+mShwiYJafhk8Jh/5c+iA
	jGhvZT57WVUnqU2Iihpu1BpaF8lE0V/LeOJrVqfUn26U8o+CUUMC52XT9cx4N1hjko0Twm+x9FDzM
	uqSeZ8ah9pZiSNOp/TwbrM+4LLns3c7vNhWXhqbed+QP58OBkpzdCAnkg174cYuPNlT2I9zddZs6y
	vawV9zSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHUtN-0000000E5RJ-3AZj;
	Wed, 12 Jun 2024 20:48:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHUtL-0000000E5Ps-03r1
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 20:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1EDCACE22A5;
	Wed, 12 Jun 2024 20:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3126C116B1;
	Wed, 12 Jun 2024 20:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718225300;
	bh=MfGZFVPsFpf3+XCOO+MmYqSxn4sBXKGuxmCFvCgEDG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UgrkWcnvbcG+QCx5ZOYMW8duHqfdUz0RMpJBQxsDa3J/CS1kht88B60gsxIsW3A3k
	 KnKojcgQJMQLWvYpbWqsNcB/2ka8srXcU1BLFjr09Nryldm3DjaupHRjCqZVNyIHpE
	 +5GZyxy114uCqtB20n0g8S+RjZ0cZWzg9/YS60GaaDp5++zq5hCQUyKCveUWOEV9z8
	 5OyWEQMvUHS9Q2LjOU8M3PZZbUR8xk4m3L++O8kNBUodevnuI4JLumx2y+jjfDJlbS
	 XowRSqyOqDISCAQuWAdxBCSyZ2O0Lfx/ujN6Q0bWQegM8QzewB9TenZTRFMF2+iV5i
	 v6uNYH53jOokw==
Date: Wed, 12 Jun 2024 21:48:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-mmc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, cyril.jean@microchip.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: Re: [RFC v1 2/3] spi: microchip-core-qspi: Add regular transfers
Message-ID: <20240612-spending-stalling-62070dbbcf3d@spud>
References: <20240612-brigade-shell-1f626e7e592f@spud>
 <20240612-uphold-dinner-a47b4c44be18@spud>
 <ZmnPh39YyfS4ocNU@finisterre.sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <ZmnPh39YyfS4ocNU@finisterre.sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_134823_259184_51C031D1 
X-CRM114-Status: GOOD (  11.24  )
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
Content-Type: multipart/mixed; boundary="===============1059035783610443154=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1059035783610443154==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="biSQJgC0nBJ0ng09"
Content-Disposition: inline


--biSQJgC0nBJ0ng09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 05:40:39PM +0100, Mark Brown wrote:
> On Wed, Jun 12, 2024 at 04:48:32PM +0100, Conor Dooley wrote:
>=20
> > +	//TODO: questionable robustness if both cs_change and cs_off toggle
> > +	list_for_each_entry(t, &m->transfers, transfer_list) {
> > +		//cs_change being set means we need to re-enable
>=20
> Is it not possible to implement prepare_message() and transfer_one()
> rather than open coding all this?

If I can, I will. I already found one issue with the cs toggling in the
code Cyril gave me and I need to figure out why there's a udelay(750)
required later on in the function anyway!

--biSQJgC0nBJ0ng09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmoJkAAKCRB4tDGHoIJi
0oIOAQCI5MxS5rORWIKfQ0df26eMH0LZJpvdduLKgF9ND2AMjwEAjwqa72ze/NHD
y6U4StWSZ8PThzRWia2S0or0/neQvA4=
=JRBj
-----END PGP SIGNATURE-----

--biSQJgC0nBJ0ng09--


--===============1059035783610443154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1059035783610443154==--

