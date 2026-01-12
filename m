Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182C4CF45D2
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 21:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ked9oltrOhhnjbM39BjcxPGnhYVOfz6s3rAao4EoJIU=; b=op6pjcSnDnLP/hbwx9VbV7aYpV
	lm4apNzFtVCx79JTPmVG3RGKISEYm0kOfj/zNyJ87CbI3BwHq7BqG8pfqofCz/om20e2Lg2SiGlkA
	ozV6I453AF7xK/j9mH6iT2HZ/6UVNavfzMiqRJuIAKZxIjciYLrtyaCWB9tJDN8vYF0Gpmh89zcoX
	xug220nNa9RR78KvjlJYZy6Rr2au1i3/8rnZwsR49iozyvfbvwVv0Kt4YHT32ealZuRYTzmOToM6i
	o2jB9ig/0OGgbgdwdXw6OCnwagdiamTyS0eXZqUUles2scbrTfVlJTtcjJb+pfwf16D0GnowvSl8R
	yPtomz9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPfl-00000006E8b-0wyI;
	Mon, 12 Jan 2026 21:42:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPfi-00000006E8F-1J4w
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 21:41:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9E6E40DC7;
	Mon, 12 Jan 2026 21:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3B2C116D0;
	Mon, 12 Jan 2026 21:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768254117;
	bh=sGJCmX/HliLDAhFR8jn4f9Rtt6JLol6dbDTmt2tzDk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t6pGwNlliZ6xm7wTeAHvptowfLFeYMm1dKlTw9AKn8l5NB2hf1kNqB0W2FlbcUH8H
	 G7nbLAZD5N+8n3gqVh55QqwyqE86qGmsPCquA9fOLtBRVlXTtIHNtxUKrvXmzRaaFW
	 Se0h7Q0Xux08r3DC3Rm87rHCtc2bATy2X/NAkleGFRRyUGf6IOy4OMsMopLXEsS4TE
	 Fd7mzDpRkY9sDgmkIeDRmct/nj3VTo8YpIjg6OE5vf/JMGOqTvthlebkqV7cD1a7c7
	 9AvziqXSsWN3w4g9JzAWbGfyxC0oLyU2wgBcRk/Ae8D8rZfjKGd+VJINDO4RSH12k1
	 ayWRj5yc2mwTQ==
Date: Mon, 12 Jan 2026 21:41:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 06/11] dt-bindings: riscv: Add B ISA extension
 description
Message-ID: <20260112-veal-retaliate-7cf9a2981aaf@spud>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
 <20260110-k3-basic-dt-v4-6-d492f3a30ffa@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20260110-k3-basic-dt-v4-6-d492f3a30ffa@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_134158_393037_19F74DB8 
X-CRM114-Status: GOOD (  14.45  )
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
Content-Type: multipart/mixed; boundary="===============3689586811701159896=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3689586811701159896==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jl0lukoungssHXqm"
Content-Disposition: inline


--jl0lukoungssHXqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2026 at 01:18:18PM +0800, Guodong Xu wrote:
> Add description of the single-letter B extension for Bit Manipulation.
> B is mandatory for RVA23U64.
>=20
> The B extension is ratified in the 20240411 version of the unprivileged
> ISA specification. According to the ratified spec, the B standard
> extension comprises instructions provided by the Zba, Zbb, and Zbs
> extensions.
>=20
> Add two-way dependency check to enforce that B implies Zba/Zbb/Zbs; and
> when Zba/Zbb/Zbs (all of them) are specified, then B must be added too.
>=20
> The reason why B/Zba/Zbb/Zbs must coexist at the same time is that
> unlike other single-letter extensions, B was ratified (Apr/2024) much
> later than its component extensions Zba/Zbb/Zbs (Jun/2021).
>=20
> When "b" is specified, zba/zbb/zbs must be present to ensure
> backward compatibility with existing software and kernels that only
> look for the explicit component strings.
>=20
> When all three components zba/zbb/zbs are specified, "b" should also be
> present. Making "b" mandatory when all three components are present.

> Existing devicetrees with zba/zbb/zbs but without "b" will generate
> warnings that can be fixed in follow-up patches.

Are you going to send these fixup patches for other devicetrees? The
majority appear to be other spacemit devices.

--jl0lukoungssHXqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWVqngAKCRB4tDGHoIJi
0qwfAQCamQ336+8Ol6Cm4BGdZ1WngDrqc6adOnM/s3WibPSj1gEA5adimCDCrVEG
eLvwJuJiBsmzP57dHrSu22VBtIaN9gE=
=7BIS
-----END PGP SIGNATURE-----

--jl0lukoungssHXqm--


--===============3689586811701159896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3689586811701159896==--

