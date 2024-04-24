Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62333C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 10:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HneVNRiokcA7l3EDl4GGWu5cm8J2neJG51gEKX7Ivvs=; b=VaA3CVh7IbuPXz8C0IGmeQItWX
	E1O0LL2o77vmTC9brTF6yrxJHmL0+Qk80lgb51CeWVoMPyHM9lpeEeclA41svr9soKuX9KMUBBJ4q
	reeAOBSbNZi0DDEkegI161cLf3koO2AUQvD7JjtrQl0kYLAjuOWG7jZeIivj9AX6xTF6gqfgcn/Lu
	m3gZxe+yI25Jc7hietZ8RR08CFO+7Dwk5wR6TafDIwcTBtRTMbb252evQxcIXmE/Oj3C67YqftQ9O
	lZnrZESViLsRz8VU+VV91ZckXvfbwdRm7+uEJCVvjnkDfDoIUgWmlQK3Rruv4j3lhLTlF8tZG92bP
	f9J1CLjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzaAM-00000003l9I-43ay;
	Wed, 24 Apr 2024 10:47:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzaAJ-00000003l8R-0koV
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 10:47:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 311EB619C6;
	Wed, 24 Apr 2024 10:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62473C113CE;
	Wed, 24 Apr 2024 10:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713955668;
	bh=Es+BLiCAY4cW/MeeZ/D/X2HEXZPjviuh/l6QAzLU2PY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qn5tlYpfbEmImm04g9ins0hFSOHkz+yFWGzZr+QtYeABdX8xBxfg4fqfZW2OKV1Bq
	 kIjCDrVCY+wVlQ/QL6VkLb4MilbJDezOeUNprqzO+6N0nOb5qm48lNua0efGwjIgw6
	 oWcy/zie6KHj0pDOTkdVONfuiu882YcaKWpTvYa0dF6Td4+FgKTOc58x6pSjI0Lp3m
	 JpKj2XLjPJd+VSjtMKA744jyk/zuL7R7qsyErtlgavEq2RGYhjFqUvKe6GAa31noac
	 87dUTQfNevj85bruXkfmlYpqpuC/jTAf4CfbwkcaE9V+95iZ6a8w/T4e5pQrrz1pe3
	 ueIh9nTKdx1/w==
Date: Wed, 24 Apr 2024 11:47:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] riscv: Simplify text patching loops
Message-ID: <20240424-gallows-resilient-c46a69705a0c@spud>
References: <20240327160520.791322-1-samuel.holland@sifive.com>
 <20240327160520.791322-5-samuel.holland@sifive.com>
 <20240424-cranial-punch-27b38726d3f7@spud>
MIME-Version: 1.0
In-Reply-To: <20240424-cranial-punch-27b38726d3f7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_034751_292356_1A596C82 
X-CRM114-Status: GOOD (  19.72  )
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
Content-Type: multipart/mixed; boundary="===============7978109196866409321=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7978109196866409321==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="URBwmoCtPsB1XCmP"
Content-Disposition: inline


--URBwmoCtPsB1XCmP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 11:44:17AM +0100, Conor Dooley wrote:
> On Wed, Mar 27, 2024 at 09:04:43AM -0700, Samuel Holland wrote:
> > This reduces the number of variables and makes the code easier to parse.
> >=20
> > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> > ---
> >=20
> > Changes in v2:
> >  - Further simplify patch_insn_set()/patch_insn_write() loop conditions
> >  - Use min() instead of min_t() since both sides are unsigned long
> >=20
> >  arch/riscv/kernel/patch.c | 37 +++++++++++++++++++++----------------
> >  1 file changed, 21 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> > index 9a1bce1adf5a..0d1700d1934c 100644
> > --- a/arch/riscv/kernel/patch.c
> > +++ b/arch/riscv/kernel/patch.c
> > @@ -155,22 +155,24 @@ NOKPROBE_SYMBOL(__patch_insn_write);
> > =20
> >  static int patch_insn_set(void *addr, u8 c, size_t len)
> >  {
> > -	size_t patched =3D 0;
> >  	size_t size;
> > -	int ret =3D 0;
> > =20
> >  	/*
> >  	 * __patch_insn_set() can only work on 2 pages at a time so call it i=
n a
> >  	 * loop with len <=3D 2 * PAGE_SIZE.
> >  	 */
> > -	while (patched < len && !ret) {
> > -		size =3D min_t(size_t, PAGE_SIZE * 2 - offset_in_page(addr + patched=
), len - patched);
> > -		ret =3D __patch_insn_set(addr + patched, c, size);
> > -
> > -		patched +=3D size;
> >  	}
> > =20
> > -	return ret;
> >  }
>=20
> Weren't these actively wrong before, if a non-ultimate
> __patch_insn_set() failed we'd just ignore the error?

nvm, failure to read on my part..

--URBwmoCtPsB1XCmP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZijjUQAKCRB4tDGHoIJi
0jnJAQCZwXvp86ggmW7AzqfFnAHTSRh+t/KIM9IcxGmWgbhAcAEAj4HjXN/D/hkC
9nYTOHV+Z6/tFGPZAWLP52FWBbJNXgo=
=qkLZ
-----END PGP SIGNATURE-----

--URBwmoCtPsB1XCmP--


--===============7978109196866409321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7978109196866409321==--

