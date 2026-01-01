Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C100AEEB573
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jan 2026 00:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/qw9dUoCc228ykrJPe+px+rKU2nkZ7HjjeQcmQVefw=; b=I3rN0HMrwQq4H3/22TsE/pIZZM
	Ga7Q4VC2+x94fHkpZ+L07cpmL30h+4hU/iRZpjq1OLR/f0CWc11UlwdgYGyfN2ouAAxRNeORBLWiD
	vN2FLMW54yx33EZKeDF8hfalkigpanuz+JPwG5O1zD+C4ehw69OYHfOF+uMH2WVglNNZZDnFXIvlg
	ua9MqYINuSbBZlRcDKZGCq8kdYfFd/DUhcpHPFKA3SVj4v+cterwlVwxFDTTAdxqsY+yVZiBylBPX
	dbgwIcSocVptV0PWn/7n8H9mEfW9FqP05nw+9rXgDtRU59dBug4ghSI/EngoaSllu828FMAxTZ/Ia
	150+Qd1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb6GA-00000006Rup-2O8x;
	Thu, 01 Jan 2026 00:09:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb6G7-00000006RuO-3ilN
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jan 2026 00:09:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83BB84382D;
	Thu,  1 Jan 2026 00:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD769C113D0;
	Thu,  1 Jan 2026 00:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767226183;
	bh=RILLXhyY4Mlu3hOHqGqx10mtCM/lR3o8tAxRU/3QtiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lVq9HYgTCPP77Z3n5Y2SJ8ehzFMrgHQ9Ws32jsVao/aS+bhE7gwEZnIVN2LSfxepI
	 iR0Rdr6Ty4MiEgCMfiPjzS26IV8ICJRgIy+8AYAY5koUzenCEmDH5AICL4uz02Wd4o
	 hNLLlAGxEkSOJtMAIXwiaiA1xvhaLGb/bC6NwNk+Lf9UvIyJ/IEbKYepkAcm7XOgoX
	 lkWapahe1VEG4JAVd6iZdhK4sOcDGfDsnEILLMGMpCuPYXJ7YRJHlY3LQvwWw1RAAd
	 wBZv12FmPOAABy0hSp9iYCAVrWLkxfnpc+hzy7eKsZSGIUp2uo+9ag5XKo91b8FULN
	 OyUGhgA+7WyaQ==
Date: Thu, 1 Jan 2026 00:09:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2] dt-bindings: riscv: update ratified version of h,
 svinval, svnapot, svpbmt
Message-ID: <20260101-prong-carnage-bbb6272e23c1@spud>
References: <20251225-h-description-v2-1-b0c66080c704@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20251225-h-description-v2-1-b0c66080c704@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_160943_945772_44ABB303 
X-CRM114-Status: GOOD (  10.67  )
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
Content-Type: multipart/mixed; boundary="===============2606894202492036033=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2606894202492036033==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pFpxG+nA7D9mVAyZ"
Content-Disposition: inline


--pFpxG+nA7D9mVAyZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 25, 2025 at 02:24:20PM +0800, Guodong Xu wrote:
> The descriptions for h, svinval, svnapot, and svpbmt extensions currently
> reference the "20191213 version of the privileged ISA specification".
> While an Unprivileged ISA document exists with that date, there is no
> corresponding ratified Privileged ISA specification.
>=20
> These extensions were ratified in the RISC-V Instruction Set Manual,
> Volume II: Privileged Architecture, Version 20211203. Update the
> descriptions to reference the correct specification version.
>=20
> RISC-V International hosts a website [1] for ratified specifications.
> Following the "Ratified ISA Specifications", historical versions of
> Volume II Privileged ISA can be found.
>=20
> Link: https://riscv.org/specifications/ratified/ [1]
> Fixes: aeb71e42caae ("dt-bindings: riscv: deprecate riscv,isa")
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

I've put this on my dt-fixes branch, but shout Paul if you'd rather this
went via you.

--pFpxG+nA7D9mVAyZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaVW7QgAKCRB4tDGHoIJi
0vP4AQDoWEJMGKVW3w5G4gvUDJtrMadHT8+Q7v2esA4P78t43wEAg3ekCCQIaJId
P2NC+7H9pd+2dJoSX1Zkua3l9gKW5wA=
=+uvj
-----END PGP SIGNATURE-----

--pFpxG+nA7D9mVAyZ--


--===============2606894202492036033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2606894202492036033==--

