Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF4C606A884
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dimRRJqj;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=wxXP4u/S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F1PcEE6m4FAZ6x/bwf8yDogPdRO90a3zb9h/3k9vHzQ=; b=dimRRJqjJaTWs13+leqtdiEmql
	5ma43R7q1K6UefCC4NJ9/dWH/BYmjMZxvhpUMw6xOfZWR6A1jUOieRR2OdAagBDh+zmFA3bOjaXyQ
	Qig7uF0XzKM7BH2ITYGpqBskL7lqRB0nZ2sS6lUQz6qpliZ0BcxoFCT1iVToGmmxUfxJw8TKtrt5r
	2rO6eUG91ipcyYnHnhmYNN2nDhLSwh6oAJOHOhzyCpxx6fLH1C58RRprNDmd+K0k/uvRr5LX631gg
	U9Rz0muZRS45IgE0QaDRUP0NdOS2Dmx5c5/6xWgEuQ26Nr66ttVBJRflobAjHd89RNBgeqF8RmVtH
	kpuITr5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmK6-0000000BzBo-09qL;
	Fri, 13 Nov 2026 08:07:50 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmK2-0000000Bz8i-0UnB
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 08:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794557255;
	bh=4hU5uldfxHAYDoQxeLuo91xKme7lL3iEklihd2gkQEM=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=wxXP4u/SOHkkTVCbN0JxSi3W0+e6cE6K7IVz6X56g7rE/nObaFm/FQuOlC6jP8VBv
	 Qxd/bovAsV05sMy4xJuX1jJx/laJ2sXm1wx5cJnmHNqyJa1Gyq0L9/8IneGjG8P5v5
	 X/aOBSvwgil1Sa8CMsNiL/hQ4GHWsN9t73XK5HdI=
X-QQ-mid: zesmtpgz5t1794557253tbc5d26c9
X-QQ-Originating-IP: FjNqnou82m/a4LkyUcHcc9Tuhz5TiqOdNLxcrb8zkf0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Nov 2026 16:07:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13851320892259870204
EX-QQ-RecipientCnt: 16
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 13 Nov 2026 08:07:29 +0000
Message-Id: <DMTXGBJLGVER.1WG847Y2M9AJM@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Guodong
 Xu" <docular.xu@gmail.com>, "Yangyu Chen" <cyy@cyyself.name>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 BS01DCMA support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Emil Renner Berthing" <emil.renner.berthing@canonical.com>
In-Reply-To: <CAJM55Z_HOuvxNmAi2m3kjtQ3tuYEDNtfyvrcb=F-Z1p6K1VSCQ@mail.gmail.com>
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
 <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com>
 <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
 <CAJM55Z9nuO3MneQqBm3K2V2SjOXqXsZcDx9pMzVhxMJJ73xc9Q@mail.gmail.com>
 <DMNTD3S9CNW1.1H4CMNHDJM69D@linux.spacemit.com>
 <CAJM55Z_HOuvxNmAi2m3kjtQ3tuYEDNtfyvrcb=F-Z1p6K1VSCQ@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NFQMG86uACrUzvxdUHdia0jpfQuv8DhlfyGHUK4MPHJi2fy17q/BQejn
	EWOCs9NMotANKU2R0YSiV823QZbFi8NoGrQG298mAySMsdyP03gmwH+BlYJQvGtQgyzfBrc
	9VXHBiiU6Oq+xJvussGMeymBhZj3lVvZWS1FQnmGipK6n40zh/kdfaMWJRhO92oAeJOLe6t
	arZBIIOP34gsjOxZtjFDQ30QvRmeD3Ublwxm25f7dEpoUP+uB5Stask4T/ph51lU0NICchr
	md20Qz33GOIB4lWHo8n7rjimUnwphH3cKMWUCca9k/KgJ+IDx/DO7sHR9opIkN9rjXgN6bz
	x12AbgKpFugeb7vFzZzAaWY2MVEbo7SgezdIYbt2X0lKYRMdF6+XHf2I3E6BzMcU32VTZUh
	00MB3JW+rvZw89XV1EJjTo50vgB4w9bJPY69HoOaPjBlI2BhJZwScgyVAZGY+ncPKnp+6wU
	THOoWoZRywiOjzmP8Svu0+L4U4XgBF1XWQS4xvWXD2OvNBUmjDExb8uClTfSwjJ3OwILUle
	B8BKVRUHqXXoambzfB4pTLg9GtsoZXytGlY/ZtwX0y7zSBCzL7uF3K2lTfMFdsd83qU6Hpn
	HGY3ErRoHSrh/EIW7bka5cfIxOQj8zalUOOig5+RNS5exySwdLYPlEVf6d0VTIrzGZhArTE
	DR8Qz5xqvOkx3tihRf7jOiQrm5qXfPD1+8N3Afargof2gop3HIwV8wmgPeDbR4Fzn6tSEVe
	zh609XhqxUr8LtwSRv5wSQZ9aUhyJ3vR8vipCi48dXWzWYRO48/FrqJf5EEuMAeUHF1FMoV
	nMg7dwyTcH9IhcfPQJtuxwL58QL/E3EZn/lrd/MaFsa8Vpr1KWXEyHTWA2pHBgvc1lGfZlq
	teOCsPdRb5myym1W0KWBKzWzTg2FGdEcvTIlEmOyQN65RoFxCH+Xro7TiPswCaskouFSI1L
	kGUk7p+ptustxSyZjf2vChf8TycNHz+fIGrOb9G1IgZFjnFOs5f0WlRj+u3CfmKSQD6A1qc
	UQsEKVlLf++O92trg1lcAzxCryy3wbIlWF+CQdAxX1A4ElU0bdr4iTQvbLxHos3rqElc41A
	w==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_000747_081135_AAC74DE4 
X-CRM114-Status: GOOD (  10.71  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0864719028311752994=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0864719028311752994==
Content-Type: multipart/signed;
 boundary=55ddbb8033dcf0d44c3f2031ef165224813818d398fd0f2c0b9d3848268d;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--55ddbb8033dcf0d44c3f2031ef165224813818d398fd0f2c0b9d3848268d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, 9 Nov 2026 12:10:10 +0100, Emil Renner Berthing wrote:
> Honestly I'd still rather have the k3-bs01dcma-rv2768.dts. It's hard
> to predict the future and I think having the extra file is a very
> small price to pay compared to the confusion of having
> 'spacemit,k3-bs01dcma' describe the RV2768 server and then something
> else to describe the module, that's actually called just BS01DCMA if
> someone ever makes a different carrier for the module. Also it makes
> the physical reality of the RV2768 being a server of multiple BS01DCMA
> modules more obvious from just reading the device trees.

Fair enough, I'll split it in v2: k3-bs01dcma.dtsi for the module and
k3-bs01dcma-rv2768.dts for the RV2768, with
"spacemit,k3-bs01dcma-rv2768", "spacemit,k3-bs01dcma", "spacemit,k3"
as the compatible.

--=20
Troy Mitchell

--55ddbb8033dcf0d44c3f2031ef165224813818d398fd0f2c0b9d3848268d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavbFQSEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+bJwD/cTWK4yfvLKek
iKSpvbRgeuw9ugOpMKbp6SIUnby8dr0A/35wZ+z92YfzDXXxb6U2HKJ4nANco/5l
wL8UcakcR7wB
=1j0q
-----END PGP SIGNATURE-----

--55ddbb8033dcf0d44c3f2031ef165224813818d398fd0f2c0b9d3848268d--


--===============0864719028311752994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0864719028311752994==--

