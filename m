Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF58C83F17
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 17:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imURMg7fS7g6DDpsxfkA4Ls8wpHgpeZ8RGG2ZGbfwRQ=; b=xo4m/nXOhtsMRSHcwp8q3PB0p2
	3AkL16523lVF+AOgbOoWhKFOo79hj7oLSUgbf3/vtt4+uUTleApv6+bEKXG3nC/tQUHZFkHJMp0LF
	OEX+5meCoOjUjayuXhx6sGB0Zm5sDx6PtwRgUtds6SAkapetIGpIlR7dnMvqZ7uLgxacgCfjFnSum
	hiU8BkbHD724MB2+3GkkpYlVFW9AQYcpq2+3MPeKDPGG3/l7jChFqRroZ6SclJ+/dsv94Ech4lENW
	ibM8jRA0kIH/Z0emekHKL4VY43mqv7aGyzB0iqyUQwvVjNCclvsKmll3obxRMYltXArOjNFQZLEv+
	7VwsIsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvBM-0000000CbMf-1EJ3;
	Thu, 10 Jul 2025 17:35:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZt9y-0000000CFOE-42lJ
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 15:26:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F165061160;
	Thu, 10 Jul 2025 15:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E056C4CEE3;
	Thu, 10 Jul 2025 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752161135;
	bh=D08Lkk2/aUoWyaOxgce4WKYWUMnpW+kGZF62H6dE1og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sbNzlHFkSHr2wwFrXT/oCFx04FFufvhMd+QHP2p9Tx88ZCipeqOLTY2JWx5SfjmF3
	 MAbaQK3u8fOzh5ZP6zT7KW8kjYadwCBNwALnVO/sN9ogjx74dqO4K5W+TOckaIOpB+
	 gXyJUfoDLh9OeDZnIKiDYZXaI6uH85CQlP2kDUcpg6OIijpWE4+QS++x2pJRb3SzrK
	 lG92meFv/whim9PpfXhf5IvlGcaSHDGi6c7j2IfOkK+Gq+9OZdrUS8X0+1/ueXRSof
	 fsaEghgHMNELqGuwl6KfTWW+9lsKBXHKvuq/VaqMdadl+LoH74u8cV7q3QxXmrJl0z
	 LF5h4KD7AbImw==
Date: Thu, 10 Jul 2025 17:25:33 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Benno Lossin <lossin@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v10 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Message-ID: <4hmb3di5x2iei43nmrykrj5wzlltrf3vrnqvexiablonbscn57@4bbsz5c76t63>
References: <CGME20250707094926eucas1p155bd967b6986c4a999776839b1aa1fc6@eucas1p1.samsung.com>
 <20250707-rust-next-pwm-working-fan-for-sending-v10-0-d0c5cf342004@samsung.com>
 <e8a4a821-e7e4-4bcd-a2ac-f6b684b6ceea@samsung.com>
 <ipvaegqlkco5qinhvn33mqvg7ev2walvs74xtzvhimxsfsfzhv@gcmpxcdtetdn>
 <e77eab1c-446f-4620-95be-d343684d1e95@samsung.com>
MIME-Version: 1.0
In-Reply-To: <e77eab1c-446f-4620-95be-d343684d1e95@samsung.com>
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
Content-Type: multipart/mixed; boundary="===============8736622430578147705=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8736622430578147705==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vsmmyrmvbcyclmm4"
Content-Disposition: inline


--vsmmyrmvbcyclmm4
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
MIME-Version: 1.0

Hello Michal,

On Thu, Jul 10, 2025 at 03:48:08PM +0200, Michal Wilczynski wrote:
> On 7/10/25 15:10, Uwe Kleine-K=F6nig wrote:
> > On Thu, Jul 10, 2025 at 10:42:07AM +0200, Michal Wilczynski wrote:
> >> On 7/7/25 11:48, Michal Wilczynski wrote:
> >>> The series is structured as follows:
> >>>  - Expose static function pwmchip_release.
> >=20
> > Is this really necessary? I didn't try to understand the requirements
> > yet, but I wonder about that. If you get the pwmchip from
> > __pwmchip_add() the right thing to do to release it is to call
> > pwmchip_remove(). Feels like a layer violation.
>=20
> It's required to prevent a memory leak in a specific, critical failure
> scenario. The sequence of events is as follows:
>=20
>     pwm::Chip::new() succeeds, allocating both the C struct pwm_chip and
>     the Rust drvdata.
>=20
>     pwm::Registration::register() (which calls pwmchip_add()) fails for
>     some reason.

If you called pwmchip_alloc() but not yet pwmchip_add(), the right
function to call for cleanup is pwmchip_put().

>     The ARef<Chip> returned by new() is dropped, its reference count
>     goes to zero, and our custom release_callback is called.
>=20
> [...]
> >>> ---
> >>> base-commit: 47753b5a1696283930a78aae79b29371f96f5bca
> >=20
> > I have problems applying this series and don't have this base commit in
> > my repo.
>=20
> Sorry for the confusion. Base commit doesn't exist in the mainline
> kernel or linux-next, cause I've added some dependecies for compilation,
> like IoMem for the driver (uploaded full branch on github [1]). The
> bindings however doesn't depend on anything that's not in linux-next.

The series didn't apply to my pwm/for-next branch.

Note that the base-commit should always be a publically known commit.
See the chapter about "Base Tree Information" in git-format-patch(1).

Best regards
Uwe

--vsmmyrmvbcyclmm4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhv22oACgkQj4D7WH0S
/k7FGwf/cqRWrlLanx6ioFRjOHNq0dg1uOzf9q5rmP+qdZZDUVpurU+JPbrTIyng
NkftG4puPCrcs4b7Xkn7KS1bA302jmVka4SChzfg17kxpi/b5EofhGVr/ugZawtg
bKQGDuRQTkzwXfaqAa178a7PccvyzXUL40H7MREmLIjeeo2Qvh5lMUj7NcHWjfkJ
JtfCpq5VKkYyyxgD/M7n/0210G3ukwej2RhdWjkAwW1u09RCYBg13oy8fmtTAJkO
+/T/7BXuRxhQDBXKM7SwRySTqcH/CkvS6xXVBT5QZya3KSNbfQM9OV3moE0GzB2u
OabPXlh8CQ3Pwo1DFGc6g/7ZY9+Iag==
=KUxs
-----END PGP SIGNATURE-----

--vsmmyrmvbcyclmm4--


--===============8736622430578147705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8736622430578147705==--

