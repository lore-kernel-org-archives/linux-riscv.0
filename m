Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B90EC61CE8
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 05:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w00tPq4YZpma+LpB57caHg0GpnDVQ5BNHIdeuiX5M9o=; b=ND4w8lbXPOdkl7Aj5TMvhrSiuJ
	+k7QLrPVNYY2QMxR+zJ5UKGCP3jzXWMPyBiTp/1sK4lP29gZVGnSBKZVLHkxSek1VWXI1Y4gPED/G
	Y9EzFTLLrAZt4kxZ4GUDkDU5CrwpTHu3VRnmK27KxPTSqMMANz1naniwG+OzZKFyirnxVU+uOJOFJ
	7GLcd9YKYCK447ghnao1lIBFe3dvEEEvtyv46AF8yd0um9ynC3MfCak6zz45pC1Y/qVdzYL8K51xJ
	4Iislz4C3qTKq5BkB9wAYvZr76xIDxM1mhSfBm064uzgyusyHJASGN+RdTtZbjK8aIsyaIfEQSxNQ
	SolQBOMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPa4g-0000000CBxS-2WYy;
	Thu, 12 Jun 2025 05:02:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPa4f-0000000CBx2-1Uy1
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 05:02:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 752FC60EDF;
	Thu, 12 Jun 2025 05:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B056C4CEEA;
	Thu, 12 Jun 2025 05:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749704520;
	bh=AtroGsAe8tO4vVOIvU9dZHQFrQmVDJFDiGO4t+qeGxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p36EjwWzOyew02KLXojOZJEFfyicj5NHustdqU8N+dsi1IDmylP1c8gN3qks1itWY
	 me2jipboB28iWBiTsqUO/GaetMRgUflT+wIoiYUjzdarPmtHZTlexvOeh2FpQFlIiB
	 tmqLKmihEz0qniwD96JID3jgHjsjSFyhPquQLjPxgByUTBuDGuBAvTpMjbO9N7Zhz2
	 3g2JFPiNzTW71iZB1+er7DSSAzbJlurmx97+56uHNiAfSc3aUr9kw2oS8yMgcMbNEl
	 eWhL1AK6GHUABpFlLu156DKXuFbHz1V4yN5SC54F+8dibyD7rLKT+BzGsCyoOeMQlL
	 eI3GbtCoOJ4iA==
Date: Thu, 12 Jun 2025 07:01:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Drew Fustini <drew@pdp7.com>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Benno Lossin <lossin@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Message-ID: <t26bhukukjzy7e4d2omtvjchxxzlnfyx54ku7xbytcnxkuk7xk@6tap2t3z2oaq>
References: <CGME20250610125330eucas1p2a573627ca8f124fe11e725c2d75bdcc9@eucas1p2.samsung.com>
 <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
 <aEifXZnLxKd2wa0w@x1>
 <6ca6016e-3b17-48a0-ad8d-bb05317aa100@samsung.com>
 <aEoWtviFl0vYATXe@x1>
MIME-Version: 1.0
In-Reply-To: <aEoWtviFl0vYATXe@x1>
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
Content-Type: multipart/mixed; boundary="===============6499834595770859465=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6499834595770859465==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xq7etcxgxyqwg5gi"
Content-Disposition: inline


--xq7etcxgxyqwg5gi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
MIME-Version: 1.0

Hello Drew,

On Wed, Jun 11, 2025 at 04:52:22PM -0700, Drew Fustini wrote:
> I also enabled the pwm fan driver. However, there is a probe failure:
>=20
> [    1.250921] pwm-fan pwm-fan: Failed to configure PWM: -524
> [    1.256546] pwm-fan pwm-fan: probe with driver pwm-fan failed with err=
or -524

524 =3D ENOTSUPP, so it seems the request had duty_offset > 0. Does your
fan use PWM_POLARITY_INVERTED? If so, try without that flag. If your fan
really needs an inverted PWM this of course makes fan control buggy.
With the next revision it should work fine (as a duty_offset > 0 should
get rounded down to 0).

Best regards
Uwe

--xq7etcxgxyqwg5gi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhKX0IACgkQj4D7WH0S
/k5cmwgAojpI13yoKGdS0NWryMcPvKU5a+1JbPt59o4PXbaSw5knpBShYrBVXz/I
7d18yAnyyXsniwR1hd0KJPktunPYQR6xtv6d6TiaoiJhfziuznFm6d/lbC4ORtJe
pXXEp1J1wCQobTjVt6PTmqNSkqStH5vAl6uEEb/0zHIiJ7DGKlqu7cKqlkeo6InV
e/1Qsf85Pkc8v57zQBRoukYNU2MjJNh12bBfeYX8jCsxkU2FZuYljB22ByRqH15S
hTJVeizgoIuoxNWKiI4nL1nVAr0YF40ieDXvpFIAHDbkPuu2hvvWzsl49PX9yWjs
kgjE/rz6QmYYc90F6zSylgYQ14rObA==
=nVye
-----END PGP SIGNATURE-----

--xq7etcxgxyqwg5gi--


--===============6499834595770859465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6499834595770859465==--

