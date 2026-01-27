Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4652FD2F00D
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 12:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dT/dKeH044Go+4NU0Uly6gstGp7vr2a15ZEWywtwQM=; b=dBYoaOp8mWm8Q8sTJ5ns9sAPvM
	dpPD0PxhmvMX4U/fqGZU++8UyAOxf1XqaOXLU1wG3zqksu7Eul5jVN9MNMtLU2FjsQ/jJC9fpP6yv
	vicMeyr09iqAiLlDPvIt6xX7XUlZvKr7DWlj+NVAwN8AEVimAPxHhenmk9mw+p4pUyO86w7EYzw/u
	ITci1D75qwVuaPdWAMCYjdEdYMAjC34cS1nbcrW7P4Ulnj3A9RjP1d8MNZuJpZPtdc1vXC33PB6Y0
	PVEpC/Uq2EkeST7XF8ATkINoLHtPh6xODZ1RwGYuTUxqoLD6ywHWRyySUix6sIgDThV3hoIfWBT6h
	zEMCRM9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiWt-0000000EGkZ-0vd9;
	Tue, 27 Jan 2026 12:50:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiWp-0000000EGjO-1FBi
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 12:50:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98443405A1;
	Tue, 27 Jan 2026 12:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17019C116C6;
	Tue, 27 Jan 2026 12:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769518240;
	bh=yR0xQFj1SPiElELNM2aUlYLKzZ+HjyHsWuNBAkW9wEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IJDahrVSeY0j+JNbmUcys/dq1kvYkOjn5dmXcCY3U+ip7+zvhhQexofT1/vICTkF8
	 RbhBc/WRI6igOGrN6psH3uRkq79zmx6QW4mP2JWNliPu5BgKeYdQhZD3UJpQMp/CIH
	 u9i8YcwNC5774//uKqRYmbc/SRQKYzQeRvORsz2Qj4XBEfbW73zlZxcTnk3tJww8Bo
	 msF/q08p6GQTQHbH6RxOuQ+MUvPKk5H/ouTMFCiFxYCiKTX3nABRa3jV6kREhgv3e8
	 ucerZWmE2qL3Bb4Y/QialspvoC7ZWV6v4O2Vo88tSNb6Ff5hIactQOwVkYvWIr5bqi
	 ECe2T6bCeoaCA==
Date: Tue, 27 Jan 2026 12:50:34 +0000
From: Mark Brown <broonie@kernel.org>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/6] ASoC: sophgo: add CV1800 I2S controllers support
Message-ID: <50b16e42-2621-46d9-bb3f-5b4ea20aaaa5@sirena.org.uk>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
X-Cookie: I brake for chezlogs!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_045043_369983_5D850248 
X-CRM114-Status: GOOD (  11.95  )
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
Content-Type: multipart/mixed; boundary="===============8286903902025958351=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8286903902025958351==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j5gRACT764pWXPnU"
Content-Disposition: inline


--j5gRACT764pWXPnU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 20, 2026 at 11:06:02PM +0400, Anton D. Stavinskii wrote:
> This patch series adds basic audio support for Sophgo CV1800B,
> as used on boards such as the Milk-V Duo.
> The series introduces the I2S controller driver,
> the DAC and ADC codec drivers, corresponding DT bindings,
> and DTS updates to wire the components together.

I'm going to apply these, but there's a couple of small issues - please
send incremental patches fixing these.

--j5gRACT764pWXPnU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml4tJkACgkQJNaLcl1U
h9C15gf+LZ2vbf2V2mzyVpx5/XVKRAXSeNrkBB4ee2C+1MBVFvWzgMa54NBdBqHQ
8rE7a4b2rJRF7x09H+YuUnzZasLwzzWVXG6MwsUqJq4avihbona0li959wEXDT7+
8eMzdUwcKRpm8YkFBZIeBe6MEiCQz+OuFRuDR9kCnwlIx3D0R+sdDjUDpFgwglTW
kNJb9syIqewNcmaYN73SMFtTNTr+ujXd5QjE1vHUM/wnILWk6sN2NI5XXyr64kQ+
TlUQ9lTyeeKXsauW/RrhJQDQsNgLpifHqYMUWCVzLJ1/Tujwaut6rSFXxkXloUUK
09CzNq6iyeXviiBHoz2vQvqQVQxNRg==
=JDcg
-----END PGP SIGNATURE-----

--j5gRACT764pWXPnU--


--===============8286903902025958351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8286903902025958351==--

