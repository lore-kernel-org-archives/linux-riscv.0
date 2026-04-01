Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C10AD35177
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 12:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oc6Ew69puDu3K9Uge0ZaZd9aYHmnN2LrPYFOccdJNuw=; b=Rak0JdCNp8DigG3EbNX+vNkeuM
	wYshzYHKAH/ztHHppgaCpfx/KwXGobMvfquGXw6o089PEz/4M48ZthFAph2XLuVXDENpZjwMIc6pb
	QqYj3Gqvts3RrNhqf/3lGdbYqsYEJIRcRXPEpKt4osAjO7kBg3e7YJE8HPq7KHWwW/VCtEsEgwto+
	QfoptJQlCpkoP+dJ5tFJ1n5hW2/wu/BMRxBjKaReQ1rZVHVXRACYnM3SaApD2u6eGuznWSB4HwRfR
	Q0rNGx/CusHqirQr/1FAJDTK2ncYXPb/7yzCNPIC8GeKNfyRcWJrDVwODyxuLTXfUASQ6ArVtIeIo
	2mT53Heg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7uni-0000000FB5w-2NMW;
	Wed, 01 Apr 2026 12:36:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7uRo-0000000EuFc-0iUk
	for linux-riscv@bombadil.infradead.org;
	Wed, 01 Apr 2026 12:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KJhQIZeVkIrhOM7OqSbKMruxwd2qCLEXuLSacKa0N3s=; b=LhzktUKhVO44BXgJloCW0YVjlu
	CaSs2hk9lk67fmK5YzuY88T+IA7V8Y0CdseA7gkjRlz0MM8CIteMWC6+MRKhO9+f1p4UjY9UJgXpu
	f/aupeVigBsCcvoWLvPnPH7mmplw7n2CCygVdsIWZ7Tgldc3GkiP1dK66YpWqA8dDnSfzfWBHYlae
	d+IQgc+w9Vgc05zSYE4a4uS4rw7Y+ZRveGLDj6fd4VMwJzCMtiYw1673/ScU5XnZKm/oiDqyvgd8A
	hn8R0qOhwtXnO1nVRCB1EhMwqOQgwueIPrQ8T/50lybqNTVMZnOoUK+M+kXdUyzb8tfiWx6FxLYgK
	+k7kAg7Q==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7uRk-00000000JA6-42iD
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 12:13:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F671408C5
	for <linux-riscv@lists.infradead.org>; Wed,  1 Apr 2026 12:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A39CC4CEF7;
	Wed,  1 Apr 2026 12:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775045596;
	bh=6br/MLePdMI3AkPJbIOmW9UoWVIoX/scxBnPpD+TQBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d9Q/Yehy+MCwQqApK5wqRTtUjb7sPykHR74PeUlkOjbo6qRI9wnfELafl/3pUOb1h
	 p73wYJWDVCGDuIPlCg8r4nkwNdTkcUJhmz0Dk7IrOAHiylMFeSK5qmD3OOffCuQec6
	 lkzc0+nT2C2Q/VOZ2KGztDlkwj1zOvhnrXeWfaBSU7M4Jh+/J0zFMi/03EtLUu1f6X
	 4inBTo7hKwG9+A+Y/ryQWaJ/FhVOnKS5Tgp2t2aFdYdXxw2kIdPGcEjmJ0JqiKmma6
	 K4w2QbCahPetqz6EkRTkvbj46EJoPnHflFLmTIuh9ScGKaV4GYULn4V1YpLtGjvQEN
	 h/1Z+crOOGdWg==
Date: Wed, 1 Apr 2026 13:13:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] ~RISC-V~Microchip soc fixes for v7.0-rc6
Message-ID: <20260401-proving-recede-80a274af26f7@spud>
References: <20260326-vertebrae-relatable-adfa3baabfd6@spud>
 <20260401-bold-positive-flounder-6e7b0d@quoll>
MIME-Version: 1.0
In-Reply-To: <20260401-bold-positive-flounder-6e7b0d@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_131321_268967_9F18ED14 
X-CRM114-Status: GOOD (  17.67  )
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
Content-Type: multipart/mixed; boundary="===============7911532171682989383=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7911532171682989383==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pT0cUuiUhHUhFJ/x"
Content-Disposition: inline


--pT0cUuiUhHUhFJ/x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2026 at 01:44:04PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Mar 26, 2026 at 11:21:39AM +0000, Conor Dooley wrote:
> > Hey folks,
> >=20
> > Another small PR here, worth pointing out that the exact contents has
> > been in linux-next but not as these commit hashes yet, I squashed a
> > fixup patch just now that I hadn't realised got pushed without being
> > squashed. Might be worth letting it marinate for a few days if that's
> > a concern.
> >=20
> > Cheers,
> > Conor.
> >=20
> > The following changes since commit 0528a348b04b327a4611e29589beb4c9ae81=
304a:
> >=20
> >   cache: ax45mp: Fix device node reference leak in ax45mp_cache_init() =
(2026-02-06 19:54:40 +0000)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags=
/riscv-soc-fixes-for-v7.0-rc6
> >=20
> > for you to fetch changes up to c7596f9001e2b83293e3658e4e1addde69bb335d:
> >=20
> >   firmware: microchip: fail auto-update probe if no flash found (2026-0=
3-26 11:14:11 +0000)
>=20
> Thanks, applied
>=20
> Probably better if the fixes branch would move to v7.0-rc1, not
> continuing the v6.19.

Yeah, I probably could have moved it to a -rc, cos there was some
fiddling about when my week2 merge window fixes PR got merged I opted to
leave my branch on top of that tag, lest there are conflicts caused by
later fixes patches. Ordinarily, I fast forward to -rc1.

Thanks,
Conor.

--pT0cUuiUhHUhFJ/x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCac0L1AAKCRB4tDGHoIJi
0j/5AQCWgbbodhrF2m/5RCiOWgYx4FeqAmURWJ5fRsnGdvRshgEAoODMTonwPO9k
5q9LlitJftSma4GUt8JDxbtcNpwEKgk=
=nKh7
-----END PGP SIGNATURE-----

--pT0cUuiUhHUhFJ/x--


--===============7911532171682989383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7911532171682989383==--

