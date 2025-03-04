Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03F1C282D6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 12:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nA1ZeHqeejf6hW65h+jDOjeZLwnR/ODueVyW4mtCGAw=; b=m/nfZnrg0+uUTVKc7PfPaJYpJt
	Abz3Si5SkXj/zfnrqG1Mt/rqAfny40++IaP2rli14VxLk9cIclOvzAx42x2mKlMlvmNKBNlMuD7lW
	xWeZxTQT0V2l35FhzNiIfZwXcG4UCCr0etI9eIHMazwvMk+ZmEa3l4vqHNawDJjGB+1HlU/Xv/vdD
	Tdlm0lb/J1SjGW07CdlxJzT/+Ts5YBbHzdf8DDQXkaPxhln64rfEBhPKSSrIrYXT0qVIdU1PtrER7
	rc9M0oYb+QUtBuOp8SNiUHJdcXVxXXBy1X6Yo6icxTqCSu4UIldQVQ8cMcxE9gB5K0Wh8WhEzbF+q
	dJkfsXpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRJE-00000004cW1-2MUU;
	Tue, 04 Mar 2025 12:23:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRGk-00000004cDW-1PQP
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 12:21:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 537905C5432;
	Tue,  4 Mar 2025 12:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEAEC4CEE5;
	Tue,  4 Mar 2025 12:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741090859;
	bh=taClQ70iXUCxoBxQy+spoV3xp0cK5c2B/aMQ1g+Bskc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBZa+w2LbNsESgBAPZX6UEPhovRhFX5Tc+R52ZiLfaEi5DmjRmhvH+GRRx9IB/rv6
	 4YXeu3MiDZblvKq44oil0/bluQXnpATS37rslyPOfYiJHN+tdeOR1EScqyNH/A94G8
	 H/qkSacFKTTpNKScquLNMilB6iDr0gbjVkSUOlP1unsyleeIebeR35+9tCK2JVMCNM
	 Ld0FyKkcTIPSEXmDXYvMF+IY9GqsEVk07wg9QYS7jrGWNzuu+pmB833CgFA0irDmo0
	 DzGSH0aySFcWtQ54uMjHf4iUAOzeTdcncPi8Bog/zcOSHwDdftIvJ3XlLeMhQRT7ef
	 q54c0BN9Nxdhg==
Date: Tue, 4 Mar 2025 12:20:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: Longbin Li <looong.bin@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev
Subject: Re: [PATCH v2 2/2] spi: sophgo: add SG2044 SPI NOR controller driver
Message-ID: <74a0cbdf-d303-459e-977a-2be1a6c9d274@sirena.org.uk>
References: <20250304083548.10101-1-looong.bin@gmail.com>
 <20250304083548.10101-3-looong.bin@gmail.com>
 <AM7P189MB100970D57C974DD7CC5DB156E3C82@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <AM7P189MB100970D57C974DD7CC5DB156E3C82@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
X-Cookie: Do not disturb.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_042106_411795_DEAFEC43 
X-CRM114-Status: GOOD (  11.64  )
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
Content-Type: multipart/mixed; boundary="===============6536900140646209388=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6536900140646209388==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="54Oj86wu4iRnfpKp"
Content-Disposition: inline


--54Oj86wu4iRnfpKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 04, 2025 at 10:14:14AM +0100, Maud Spierings wrote:
> On 3/4/25 9:35 AM, Longbin Li wrote:
> > Add support for SG2044 SPI NOR controller in Sophgo SoC.
> >=20
> > Signed-off-by: Longbin Li<looong.bin@gmail.com>
> > ---
> >   drivers/spi/Kconfig          |   9 +
> >   drivers/spi/Makefile         |   1 +

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--54Oj86wu4iRnfpKp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfG8CUACgkQJNaLcl1U
h9DOQgf+OsNrZsX/GHTkpQKuxufWPNRty1/mIYWBycNxDjbSbZiY+WW5d6Fk02kn
hnr0S0ij9L2cHr5tPo1PuDuGHZlzaYgIpW9cUcN8jzH9dmMpUFN9i+idwW1Fs5Rh
OM1AwzX4tTG8AwxRxXf4VvkMnErnIuNSbfmXX0zJJHFodbOPH8E8z6JaI6uCwdpG
miC89wz3PNXKOs5Z9X1lVFP9sTuqgsVyFFOXxVjciqJmXkrPhB6d4p9lqC+k49UV
ak64KOr+wKGgj8qaVCifbcZJFYp5naHizOSCa8pYgNzoNB9oqYsOqX9kODPgesC2
a0NLs2CyfcbMKLXco2+SWo2461KDnA==
=/APl
-----END PGP SIGNATURE-----

--54Oj86wu4iRnfpKp--


--===============6536900140646209388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6536900140646209388==--

