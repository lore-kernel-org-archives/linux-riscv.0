Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B075CCD184
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 17:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPZ3qYZCfgbv0DaSmuWL0G8FButbLtcznIZskR2A0Dg=; b=A8WfGHMuBfFK+fM87+cG5roWpq
	ws0M/0Xq4orsHqrBRYGPvfhVKd/o9VocU0Dl4gksQO54UT6tgGqnp7GItgIKW/sLmaO82IDvbVJSf
	7+TMCr/KgaYP5+stO0+q0Q1xyyHZ+dQSGY4Tmo7lBbLZaVlAtVOKMtidV641YXMmAHINN74jZqynG
	0hv0YWfSJTjrWShkKIAsG0eMi3i3W38EMfWUYseWJ6QDqGWfvQAZx0gQuUvLZJidHmQM/n9Qhg1MB
	wvTEhBZDr9lWqPE7YvMosezhQ4yxOePfPa0KXsKL08OWsR8zwkPd9qgApmYVmrsZiR/58JAB/PROD
	R+iLVZ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6u4y-00000006m8U-3MK3;
	Thu, 09 Oct 2025 17:05:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6u4x-00000006m8K-2jk4
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 17:05:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA6BC61F63;
	Thu,  9 Oct 2025 17:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E870BC4CEE7;
	Thu,  9 Oct 2025 17:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760029522;
	bh=K/920CR2Ytam1wn7N7JUroePPcHUf353y47OxV5zx1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YSDSAwKixJwAcuHpinVRh5i8UjuDftvpwmX8U+4+hsr3pjU0Kbr04cRyidWCCnkKM
	 0Zjz/FeI+Ghya5Hv1eFFXoyr2eNZIcuCC1Rgs9j5NzmzqKQcRH0rNdrDwWL8L4FPlc
	 12dmobDe6OngdQ5rB86UsySfUB3ZwpGiX9MhYMHlO2DlkXCuNys8WYxZbOrZU7DXq6
	 2ORjBMXNo7aZziGRzAzMsbtE7rQNSvZXAcexQzPtX4GsFPF+oPa4dnSVExXvVg4EGk
	 1YAqe20JovGVMdObbjqS2teB6rD0y/UbPgM7xVj0Q3ahKEZSDk64uxCety8RxbxE6n
	 ipKVeFwUr/wpw==
Date: Thu, 9 Oct 2025 19:05:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Elle Rhumsaa <elle@weathered-steel.dev>
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
	Drew Fustini <fustini@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v15 3/7] rust: pwm: Add complete abstraction layer
Message-ID: <pxwzgjl4men4ia2jfky6i4pcpzmlxnuorzltfsurrosz27atbz@n2x7bt77nd5n>
References: <20250930-rust-next-pwm-working-fan-for-sending-v15-0-5661c3090877@samsung.com>
 <CGME20250930122733eucas1p1017471af8564a40f60be74c5ae50bbc4@eucas1p1.samsung.com>
 <20250930-rust-next-pwm-working-fan-for-sending-v15-3-5661c3090877@samsung.com>
 <aN2Vrf97-uCR41x9@archiso>
MIME-Version: 1.0
In-Reply-To: <aN2Vrf97-uCR41x9@archiso>
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
Content-Type: multipart/mixed; boundary="===============5471595098074274825=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5471595098074274825==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5mhwlegpqwr4uy3k"
Content-Disposition: inline


--5mhwlegpqwr4uy3k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v15 3/7] rust: pwm: Add complete abstraction layer
MIME-Version: 1.0

Hello Elle,

On Wed, Oct 01, 2025 at 08:57:17PM +0000, Elle Rhumsaa wrote:
> On Tue, Sep 30, 2025 at 02:20:34PM +0200, Michal Wilczynski wrote:
> > [... 700+ lines trimmed]
>=20
> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>

Can you please trim the quoted part when you reply to only contain the
relevant part? Having to scroll several pages to see your one-line reply
is not a good use of my time. Multiply that by the number of recipients
of your mail.

Thanks
Uwe

--5mhwlegpqwr4uy3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjn600ACgkQj4D7WH0S
/k5XeAgAnu0TfZoOsdkntucLzQ0zg0HTTAqaoe7N7MdLgsQQHxRpQxck6cJb3Vw+
1J8jo8DQzCi+lwytWM5iubVukxGFCxFV5h4Qp0bW7/eYCK/fTscZ7g7uuKO+GS0D
7s0Lr6MOsfe1MjqHyqAMKZYHWQjwZresPWVJCpyuInAhCoV60f1SSEoWsrwkpdZX
CFREtKf1Gn5yYj0cNQHl8ubNIZ3uW4tlbvj93wZjztMXQROG/8tvJ29vcUTdSqDR
UbF+xPvIu1hVRAtLjGwm3PBioLnwB01cV0g427s3pDSwNRUrsEC4flnJAqKa9r1g
PvYN7XNxSwfgteGrqDjFVby3Ap8cBw==
=Y2eC
-----END PGP SIGNATURE-----

--5mhwlegpqwr4uy3k--


--===============5471595098074274825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5471595098074274825==--

