Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D88C87FCB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 10:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ev1a+b8kb3gQ13hTJdkruWaB1mFa91a+QM8eknnILAI=; b=028lOf+9dMBHberX5gqO8ZVHd2
	KBK1lIs78BCVoy6otTbCG613hWiitzHYEZrK3hOEWaRecMFcekRtFphrgz+Afv4v0d7Wc3arNKX2Z
	rpHJLndouZ1dQ3XRNdRZl69KZ/RSSAMFLzAj1rdmhXRA9q1fkCs470pcNA4tV1wb7vW2uzrPB5nw5
	EY4yIBZ5DTEMu7B7o4T9CG6LoaoAi3Nan90cFCR9lCDQuATZXNEBtQX7BlbaiM5rr4p73XfSYw00M
	aD+uoWk+hFWdP/fPI+K/LDwjME4DJVkf14UE1Q17RZhFZBayQ6G8kTQ9O4bm4NhuDFmnSQMaUC/9z
	/ISuZU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uisqf-0000000AEd3-23Nv;
	Mon, 04 Aug 2025 10:55:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uish7-0000000ADI5-1vTO
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 10:45:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31C2B45CFC;
	Mon,  4 Aug 2025 10:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC83C4CEF7;
	Mon,  4 Aug 2025 10:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754304328;
	bh=rtsaWUajhwl7HqaJuXOdQM8ui9VtQUKyeIYR+6mQOEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Am8XXDsLutdMj01Ypv1GK768KA8uqK/DoqQSrS7fr5DnWfuDN0aCM5dvh4IngJLXM
	 Cz85uQ8RWlAEvIAgJZ0cIqDURNrdgAh8DFO9IC6S28aNzXjFcwMRnFYVr4bN5PLmLy
	 rBDzM9KgA3g+ELGnFH9XGIQfGI/UwXxni1yDu28O04nVTj8XQWVVzhQLQz3v6xbfeu
	 7nbDXwyA9po5SXQwfbCQFHgeWrzfDWGuNgZ6DR/htCbZkgc+Jfb5/wKzicydYuTm4l
	 V3nglhJA0LBX4ts2K1cQJoC3BrtgG2mTwv+8OdPP27bA/fo2Giw8w6xCblG7LhVpQz
	 emmoyQ7lMobaA==
Date: Mon, 4 Aug 2025 12:45:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org, 
	Nylon Chen <nylon.chen@sifive.com>, Zong Li <zong.li@sifive.com>, 
	Vincent Chen <vincent.chen@sifive.com>, paul.walmsley@sifive.com, samuel.holland@sifive.com, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.6 28/59] pwm: sifive: Fix PWM algorithm and
 clarify inverted compare behavior
Message-ID: <xgy4dio2oqwqow7k5nlbf2vgrx63ptmtsi533wad7pfa3v23tk@nzrkhb2nytpb>
References: <20250804003413.3622950-1-sashal@kernel.org>
 <20250804003413.3622950-28-sashal@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250804003413.3622950-28-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_034529_539527_1C463824 
X-CRM114-Status: GOOD (  14.14  )
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
Content-Type: multipart/mixed; boundary="===============8299859328143895187=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8299859328143895187==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ffr2hu7lxjke47gh"
Content-Disposition: inline


--ffr2hu7lxjke47gh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH AUTOSEL 6.6 28/59] pwm: sifive: Fix PWM algorithm and
 clarify inverted compare behavior
MIME-Version: 1.0

Hello,

On Sun, Aug 03, 2025 at 08:33:42PM -0400, Sasha Levin wrote:
> From: Nylon Chen <nylon.chen@sifive.com>
>=20
> [ Upstream commit 7dbc4432ea6bf9d709391eb57f1e9fb44e99845a ]
>=20
> The `frac` variable represents the pulse inactive time, and the result
> of this algorithm is the pulse active time. Therefore, we must reverse
> the result.
>=20
> Although the SiFive Reference Manual states "pwms >=3D pwmcmpX -> HIGH",
> the hardware behavior is inverted due to a fixed XNOR with 0. As a result,
> the pwmcmp register actually defines the low (inactive) portion of the pu=
lse.
>=20
> The reference is SiFive FU740-C000 Manual[0]
>=20
> Link: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b=
16acba_fu740-c000-manual-v1p6.pdf [0]
>=20
> Co-developed-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> Link: https://lore.kernel.org/r/20250529035341.51736-3-nylon.chen@sifive.=
com
> Signed-off-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

Please drop this patch from your queue, see
https://lore.kernel.org/all/52ycm5nf2jrxdmdmcijz57xhm2twspjmmiign6zq6rp3d5w=
t6t@tq5w47fmiwgg/
for the rationale.

This is the fourth mail of this type I'm writing. For the future: Is it
enough to raise these concerns once only and maybe even make it easier
on your end, too? If so, should I better pick the oldest or the newest
base version series to reply?

Best regards
Uwe

--ffr2hu7lxjke47gh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmiQj0EACgkQj4D7WH0S
/k6oMQf+O4wdYC4RKeBWaggB5ZX3bh1tCXkDhGIpvm2OyM/W3MrVOVzUXSMjrNtm
ecvkwgDbn/USVwyOzHklS9m9/LfSY26y5XFh+XY6rArW8lb2OAVMjTWSrWLN2P5n
hkUTREkNNNJ0tj1/iFKGubbLPKw8pbjPe9QSEkcXvniQZKdvsd1VO2vwKIxWcgur
TQrdn+/UPXa+DW3LfinaeVPG9g5qMPhAV2esa0/DmrZ/RRikYxLu8HCWcrtTCGYw
nAfXXztH7v33LxjLcqta7zsG3f2QDBBhBZsodu1D11vjMkL2RvcwCAU/10ABDSXe
2XiXiVcXGexyUzBZdzMpcJxS0WETXw==
=ICmB
-----END PGP SIGNATURE-----

--ffr2hu7lxjke47gh--


--===============8299859328143895187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8299859328143895187==--

