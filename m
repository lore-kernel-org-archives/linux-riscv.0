Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2122D6EC00
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Nov 2024 11:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psrTBYS97JfYFxJM0i7QSTyu8jMutH4GNKrsqzhAIsU=; b=hRRyZHidJjPZPB6kACa7jsf8Ox
	jw63GVc5qVk8yIvHjMW/CkzhveWm1ylD6YSGxMHyLvTWz0k9cDhpNELx1/OiwBFWh6iT0CBcw5NH0
	VAEWQ9zZNywZbyFMn+z6kE6WZXnug8m85GJp1KfaQvqa9PqF87ucnfbA76eM04JJlbjwN31hgadXs
	dA9TmQLtB4eHTsFdpyomf4XEn6+4cNuZM6Rzi2wuW9bQEpZ71/7l3Wiino2nmZmpECsCOdPksSw5b
	uqqV2Uq/zoCah2O5Whk1ucXzT8xozxBzQzQf0U6M3MK5ftkW6Wf991R+5HJwevs9ZBTOhN1nEdQ5p
	toxnQw1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGzaw-000000000dg-3KYL;
	Fri, 29 Nov 2024 11:55:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGzau-000000000cf-1lKF
	for linux-riscv@lists.infradead.org;
	Fri, 29 Nov 2024 11:55:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6817A43E5B;
	Fri, 29 Nov 2024 11:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3271BC4CECF;
	Fri, 29 Nov 2024 11:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732881331;
	bh=PCwTZksW8jw/sIiLZC5grod741cJ0Qggc5kuzZnMjc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IenEB1RUjTD2vJ2SdbTKEJqOBiPEdSJOudSSe17Uuf887IXYRMO3EYFhPG9pf2wmA
	 xjPPTBEzYLBJvZ9vx7XesuEoyDj9Z0uroTq3sAGGIxa5j38JUy5yrf98bTvklzvGI3
	 I7XH8S0gcprBYOl8xdwWkqDT3TIlN2IFWPzAmlrD1DmS1duYfpuryieGcKf2Bl8JPQ
	 BMkVbXNuT4qdiurJdAnb7ohcDXf9x8WII8Ww4N5z1Eyaw7JadxvrikcXT7k7Qt3kbx
	 leByzmM5MtgFlHrVFv5yJvx7+Ab6oownwSp1z+WF+gnHndKOtXioZWVy7YwOgOpdeN
	 2HZMXs9vgM9Sg==
Date: Fri, 29 Nov 2024 11:55:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Guo Ren <guoren@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v6 13/13] riscv: Add qspinlock support
Message-ID: <20241129-proxy-mantra-f58352723906@spud>
References: <20241128134135.GA3460@willie-the-truck>
 <20241128-uncivil-removed-4e105d1397c9@wendy>
 <90533aa9-186a-4f75-b3c5-d93d6682056b@ghiti.fr>
 <20241128-goggles-laundry-d94c23ab39a4@spud>
 <CAJF2gTST0kduYpuqd4mX0byetWMRJT-AAyH0GGiaysZG64Byhw@mail.gmail.com>
 <CAJF2gTRQg=w3sGN0Sdzf+_adRo44z4H6Zd6=C6qXq+ARR5BjSg@mail.gmail.com>
 <CAJF2gTSX82rGp-9xZHvg1Y3SpO516YCcqSBLKFgWEQ5G-iWR4A@mail.gmail.com>
 <CAHVXubgXiD5Bi6ytyDHXXOONovWHZTSvr4+oADCvuic5ObGXpQ@mail.gmail.com>
 <20241129-encrust-thumping-b6c6a3399b98@spud>
 <20241129-clay-trimester-91a0f281a95d@spud>
MIME-Version: 1.0
In-Reply-To: <20241129-clay-trimester-91a0f281a95d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_035532_543213_7475713B 
X-CRM114-Status: GOOD (  13.22  )
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
Content-Type: multipart/mixed; boundary="===============6615137841130364658=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6615137841130364658==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B3rY1u54z6BEJe5L"
Content-Disposition: inline


--B3rY1u54z6BEJe5L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2024 at 11:43:44AM +0000, Conor Dooley wrote:
> On Fri, Nov 29, 2024 at 11:18:24AM +0000, Conor Dooley wrote:
> >=20
> > I tried this diff, and it doesn't actually fix the problem - either in
> > QEMU or in hardware. I'll do some more poking.
>=20
> Looks like it might have been my fault, typo while hand-applying the
> diff pasted above cos it was corrupted :/ Rebuilding..


sans-typo, the diff does make it boot, my bad.


--B3rY1u54z6BEJe5L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0mrrAAKCRB4tDGHoIJi
0o2cAP9wDMq1AIQu+yNhsWztBDTj6piw+4PfqFq1bQAAh9U/EwEAkLXlNZGUGStI
QBEc03DcU7n3hnf7FTsBRSBls8a6WQE=
=dKan
-----END PGP SIGNATURE-----

--B3rY1u54z6BEJe5L--


--===============6615137841130364658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6615137841130364658==--

