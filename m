Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4099C83F26
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 19:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alI8fV9oaA2ch3tRXrleAyc5tzsRnbIF+c+VQqqFUSs=; b=vmqSrmC6p9QvPjGUVhDKMIT2n9
	IdQ3RCM6E+qOVtlfz9EJkshNZ15QVjNaydIqVEFY1W0MGYwWhM7fNQVkocPihct2HTd2ZRL0p2BVl
	qE+Tq0+t6DPZLc3BSzJHIjmiJFo0Y6zCtj6vLYdTRpgEYl3PSS/CUCsDxxPFKeQWZ6bIPDFmEKyrg
	8P0TOApLldn/TkXPStKlS/S79XJn+XzEobPF5tKoScrgt2L5u2N9KZw04DMLNdwk2hOhbqs3QZNps
	e7/6+yQfrzSo/oUuFDpbjrCWjC2XOkfITLMy+gBTIwwlPSi1VKvFJkN9z2enqq4xkb3uUKlq1IFzE
	lXkbHhIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTox-0000000FKj2-3xkK;
	Mon, 28 Jul 2025 19:47:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTnV-0000000FKdu-0kcJ
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 19:46:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5BE8FA550AE;
	Mon, 28 Jul 2025 19:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0CCC4CEE7;
	Mon, 28 Jul 2025 19:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753731968;
	bh=vkFmvW0ralitXVuSrvM0Wv8KMqEcIIlZY0sV1TH3CwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y1ddsK0TBt+NFGoz/OiNF+Maev8B9OZDT9kPtvcij9T0zCfw7oiMvw3xZiYPQrpRn
	 Wi853MbFXUHTMTuzzYJp0BwrAT/GK7yUGha2yh8Hy0v618DNVDqsIDUG/HjnaZHunF
	 EGdbfEm/AlZW20/jTPzyRK0QpAkzhPV1h/cS6UBJLrys8rW77vG0Yp83Q0B9JIeR4M
	 0jWJGSMyc9+Ox47hl/nYIRMpSKdNlw48k1EcFpl+nHimbciMHk9xW+ms22ygI49Iqp
	 7LZiiTaJMrkI6VBt5en5w5+rakQ10oog9zPw5D3LaE0UODOh3mE75S+QcSYDnsyGcF
	 qeO3xkwNLEb9g==
Date: Mon, 28 Jul 2025 20:46:02 +0100
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	William Qiu <william.qiu@starfivetech.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
	Minda Chen <minda.chen@starfivetech.com>
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: drop no-sdio
 property from mmc1
Message-ID: <20250728-brought-substance-d7ad9377e4bd@spud>
References: <20250724075600.239522-1-e@freeshell.de>
 <20250724-equal-limb-2922f240961e@spud>
 <43c5908c-c478-4e00-b1e5-955296e4ec24@freeshell.de>
 <20250725-disorder-graceless-23c95454244d@spud>
 <8841923c-cbb6-4cce-97f4-a851783b6102@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <8841923c-cbb6-4cce-97f4-a851783b6102@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_124609_285681_DC9A52AA 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4484445039167516470=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4484445039167516470==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4qpDYMW6E/gOYVfF"
Content-Disposition: inline


--4qpDYMW6E/gOYVfF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 27, 2025 at 08:52:50PM -0700, E Shattow wrote:
>=20
> Hal and/or Minda (from StarFive) any comment about this? I would ask
> William but they are not involved anymore. Can we drop some of these
> suspicious mmc properties, what are the reasons for these?

Additionally, William is mentioned in several maintainers entries, could
you StarFive folks either replace/remove him please?

--4qpDYMW6E/gOYVfF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaIfTagAKCRB4tDGHoIJi
0lS1AP4/OL97jNH95DHx8/E0CKPdGzjeTOrojLRX58lketIMZwD9GTGwavZOZA+r
K7Qjbg9nBY5nCMJoRF+P6BRFViEzFwU=
=BWbl
-----END PGP SIGNATURE-----

--4qpDYMW6E/gOYVfF--


--===============4484445039167516470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4484445039167516470==--

