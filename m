Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BB7CCF9E5
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Oct 2025 11:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNiilrsZHZiawCGVMejGYTumS9kEoWyeE/QPoGrOmos=; b=N1udb4TYRFKwmtvzxQSqyQYWDT
	ithoFhfRv+L5hs/UiG99BS88fRW6vy6cV/4e/M12WYWb2j+xY9eNwyoDdLXDbu3/T4T5o7Gf3tNdL
	3m7/3nli+yltk4FzAb0DxUcOrS2U9JST0Fnhxjs27i6/QdIl74cXZ5QTcKFC8yw24RAbQHQvpsqJG
	YEFfsBpTRCVeKaFpsZhZ+uh52aXVQZmFmF9wXJt31fMFcw3mJHLdYoKSNaXoIhl0TqtY1HbpPm4B/
	i2aLIBYtsDZ6TdPnDfLpELzCJCbGT88bVehDUPlw9kXFjAppvtpVY0dng3oKt1x2cAk0Lrzi6YWcp
	p2WQoqIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCyih-0000000CGti-1Zqt;
	Sun, 26 Oct 2025 11:15:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCyig-0000000CGtc-1m2m
	for linux-riscv@lists.infradead.org;
	Sun, 26 Oct 2025 11:15:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0172C60203;
	Sun, 26 Oct 2025 11:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85FEC4CEE7;
	Sun, 26 Oct 2025 11:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761477328;
	bh=HTruYLUWVQCfi6SQXupL+CrOSj/QbB/ZlLpAIxMdvc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V73ECIo6/qSjkcuLQGkEL6W2kesEMvM5bq9FRp1XGZVv8NiaM51qu6ldc7Qa7vdvc
	 QJVQt9rj0VGjJ3Gy3dSKM/SEQYNY2ZVaFbdLfK5gSkqtH/e31tfIa2Rts5siCzxzY2
	 ++KB+9gshe03RFO46IUNzIOpfNKG0z9tBnh15KrhE15ArshgIv8VfX2wL6hfdn1agY
	 kmtYZdQIUfFd0OlrGuGHovyiPNsn4FBP+UVcqgaB78lsKFzT5RHt7KeltqIFW5L/w5
	 d4NJwYQAuy/80sybUdG1hW3Tkm1eeo6/OMK4nyehaVTtqfQnPdokN35ICwjgd2KVLs
	 Dwqb+gBXVPLBA==
Date: Sun, 26 Oct 2025 04:14:50 -0700
From: Drew Fustini <fustini@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Benno Lossin <lossin@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, Elle Rhumsaa <elle@weathered-steel.dev>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v16 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Message-ID: <aP4CqqOL7xEyFZ0w@gen8>
References: <CGME20251016133814eucas1p199cb62658c016e84e34d525e7c87f16e@eucas1p1.samsung.com>
 <20251016-rust-next-pwm-working-fan-for-sending-v16-0-a5df2405d2bd@samsung.com>
 <47ut33rck4xoh3d7d6t3d7twqag3u7eusbruc2i2veqf2umpga@ipamilvshysw>
MIME-Version: 1.0
In-Reply-To: <47ut33rck4xoh3d7d6t3d7twqag3u7eusbruc2i2veqf2umpga@ipamilvshysw>
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
Content-Type: multipart/mixed; boundary="===============7741580569581465090=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7741580569581465090==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hu0VeUTprsM8C7Nl"
Content-Disposition: inline


--Hu0VeUTprsM8C7Nl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 25, 2025 at 02:26:31PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Thu, Oct 16, 2025 at 03:38:00PM +0200, Michal Wilczynski wrote:
> > Michal Wilczynski (7):
> >       pwm: Export `pwmchip_release` for external use
> >       rust: pwm: Add Kconfig and basic data structures
> >       rust: pwm: Add complete abstraction layer
> >       pwm: Add Rust driver for T-HEAD TH1520 SoC
> >       dt-bindings: pwm: thead: Add T-HEAD TH1520 PWM controller
> >       riscv: dts: thead: Add PWM controller node
> >       riscv: dts: thead: Add PWM fan and thermal control
>=20
> I applied patches #1-#5 to
>=20
> 	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/f=
or-next
>=20
> . If I should take the riscv dts changes, too, please tell me.

I can take them through my thead-dt-for-next branch.

Thanks,
Drew

--Hu0VeUTprsM8C7Nl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaP4CpAAKCRDb7CzD2Six
DFmwAP0XV04YlT43vkUJmO2Q22KkuSgNzqJMOqSjgRNYzlZG8AEA3UwESVtDL40X
5JE1LibqO78mAkoeDlA3Gy1lXXPr8AE=
=4yF3
-----END PGP SIGNATURE-----

--Hu0VeUTprsM8C7Nl--


--===============7741580569581465090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7741580569581465090==--

