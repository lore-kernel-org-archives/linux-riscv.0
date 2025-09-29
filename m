Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3791CAC5B0
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 18:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7w2nO4U3484kzFKbr93iYZXb6rof4aiQK2y9fk7hXX4=; b=roZBa0S6nmfTTywUfGi00BO2x6
	GRqrMfw9/imnGT1N+hlarcQhR1WXxbuTkooxjQ3d/aFJ+Q0cDPZoksu0RPqKosBo92jduHPEK6kGA
	yJq5G7zJV3MeJEeCYag4mIWXJaCrSaqWRJcr3w478rSxqPyFvjJ/K9GRxFqZYb6Ghy9MzzTjBoW8W
	MAbUbqrGun+agGke356IcFsMe8yGfkGxAO5RE/c0SZxPaqkxtlBrchuys6yoS3wGjlAYQSGQUYD3d
	sspm5KcnjH134FI+SkdU/bJoHIj77hlB3BQMowq1F0bWssS3vI65aMj4d5voocVXdYnzxnQqpGvB2
	UHilj3og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ItW-00000003HIs-2Fiw;
	Mon, 29 Sep 2025 18:46:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ItU-00000003HIi-3OM8
	for linux-riscv@lists.infradead.org;
	Mon, 29 Sep 2025 18:46:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5BA7626E6;
	Mon, 29 Sep 2025 18:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C7CC4CEF4;
	Mon, 29 Sep 2025 18:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759171599;
	bh=TNlhXabPzTPBnmWxeucl0sJUD7WaZdRbq2zbsllnuPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cQcaNUdKQA6pggrC6CKP9nrssk0n+iS1wwK/CpqYxj6HL1Q943J8xN+mHitHJmC/a
	 7oh8mR2bn3LtHTdPHRf4OmmA43NX1EgE8yC+auScD3r228BBf7XvC1dW41bTuD4uQE
	 GoPhVWzrQZekO3MrWnwsoj8Q3r1P5tsfLTJwZ44rg80HFP8CuJeRw3rnCw5MdrrtPC
	 ouxIO4F4vcgb8ybECkfRNtofFg0Fpajv57KKg614+3Vbq86vHjPX9TJKGQwGlzZ0Lc
	 pyd5a31ZCWnB3Tetlp39lTpA8FIAC0JaWcbqCwC3lQZ68uVW1FKLWt+ZIaGtN0SVwW
	 +7cJQAuB9qFSg==
Date: Mon, 29 Sep 2025 19:46:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 00/11] riscv: Add initial support for Anlogic DR1V90
Message-ID: <20250929-unhappily-circulate-5e516175ad0f@spud>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
 <20250925-chowtime-stove-4078dc1af2b0@spud>
MIME-Version: 1.0
In-Reply-To: <20250925-chowtime-stove-4078dc1af2b0@spud>
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
Content-Type: multipart/mixed; boundary="===============4894083157003256694=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4894083157003256694==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dz2AhysS4RVYF5ne"
Content-Disposition: inline


--dz2AhysS4RVYF5ne
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 06:22:41PM +0100, Conor Dooley wrote:
> On Mon, Sep 22, 2025 at 08:46:30PM +0800, Junhui Liu wrote:
> > This patch series introduces initial support for the Anlogic DR1V90 SoC
> > [1] and the Milianke MLKPAI-FS01 [2] board.
>=20
> It's a bit late for v6.18 content, since the merge window likely opens
> on Monday, but how do you intend getting the series into mainline?
>=20
> There is a document https://docs.kernel.org/process/maintainer-soc.html
> containing information about how the platform maintenance process works.
> Arnd has suggested that the best way to get a platform initially added
> is to send the whole patchset, rather than a PR - it leaves you with
> fewer things to deal with at once. This patchset should be sent to
> soc@kernel.org, with a note saying that it is ready for inclusion in
> your cover letter.=20
>=20
> Ideally, the initial patchset for an SoC should contain clock (and
> pinctrl) support, rather than use fake fixed-clocks, but you have none of
> those in your base dts so I have no objections. fixed-clocks can become
> a problem if the dts is imported into U-Boot via OF_UPSTREAM or
> elsewhere, since it can cause regressions for them. I would highly
> suggest that upstreaming the clock/reset controller is the next step
> that you take, because other peripherals are going to need clocks.
>=20
> Please let me know if you have any questions - either by email (and it
> can be off-list if needed if it relates to platform maintenance
> questions) or on irc (I'm conchuod on libera.chat).

I had a chat with Junhui on irc the other day, where they expressed
unwillingness to act as the platform maintainer, to avoid being in
conflict with the vendor. I'm disappointed of course that the vendor's
behaviour has had this impact, but of course I understand where Junhui
is coming from.

Fortunately Junhui is still willing to post patches for the platform, as
they want to run mainline on their board. I will add the platform to my
"misc" branch, along with the other platforms I apply patches for until
either Junhui changes their mind or until people who understand the
process and standards wish to take it over.

Cheers,
Conor.

--dz2AhysS4RVYF5ne
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNrUCQAKCRB4tDGHoIJi
0qzSAP0cvO1DFs2n6IQ7S/IJRMg2ehNjpGRU7+R8PXLZ24qfwgD/T4EEVP1tHhtS
C3gmCx92Pnopimxtjl3Swp77c18Csw4=
=zNQt
-----END PGP SIGNATURE-----

--dz2AhysS4RVYF5ne--


--===============4894083157003256694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4894083157003256694==--

