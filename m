Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0433FC7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 16:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rC+fL7TdK/q2fpC9tTU7TGempaRegxwx3GkkhikpSDY=; b=FQFWicuHavbKU/LsSusHmvLRmc
	7pWIxIlAKiPJTTFBvgUsD85qBVa1qup5HGb/zzydjaT9VlUmb98pnlHiYQ5ikrC3m4z5WzOmT+LnI
	1qaF8Km+85o50VQFpNLAStKu6DNW5r+Z+ZQSaaSUm+2sT1HeKVAkHycbo1FC5wz5BnspqfbRSVj4d
	RYyk7U6FjZ8dYes/MdidMDojzAHxgSC/H1+OxUMRvqFVye05dTOu/jnTvFw3KiPGgrPSRS+DYJi2E
	huAviSUETSLr9iWihNKm86UtkLqDHJppGg5UKr5yiNtcJJHnaYIsreMzy3/FOedNEhjMuFRSQZx6J
	w8O02Xbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Oh7-000TGz-1Y;
	Wed, 31 May 2023 16:29:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Oh3-000TG3-2e
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 16:29:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C43E63B19;
	Wed, 31 May 2023 16:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B26C433D2;
	Wed, 31 May 2023 16:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685550540;
	bh=2DPmqH41nj7TTQeLCW2cj8dAxqMnQAvSWlrm0fLb+0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IuhjRqmqy+q7X4w8AXgprvr+XbiiHE8U7fo3RFN/LJJSzFlUEnehvi1OZCkHpJ6v7
	 OUUjGEfmu7tjvnkEuojRNtIytQBpZp/S90wMZmiY4aSLLiigcvEhs8BcqHYmG7k3HO
	 aZpnbYLGP8/WRogGHBP5gJBn9/XTXh7CkdiIDMk+Miuq5WHiEXfNkLK+nEp82W3OFg
	 QEQtbwTlLjr6YhzD53zGcKUVjtw6gLviaYvSy/QMBMhqcGAIS6vfUhFRtRIPOi3Vn+
	 e/D7eU70svoa85j/BRVTWXlavd7B6/AAbpUjCGT9By1HzSXIzhZ3ZXYzSCybCVGmjW
	 QzGngXOVRITJw==
Date: Wed, 31 May 2023 17:28:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 4/6] riscv: mm: pass noncoherent or not to
 riscv_noncoherent_supported()
Message-ID: <20230531-applied-antacid-77abfb5b2e55@spud>
References: <20230526165958.908-1-jszhang@kernel.org>
 <20230526165958.908-5-jszhang@kernel.org>
 <20230529-gainfully-ribbon-48520d25ef6e@wendy>
 <ZHdmnfJvF1N5rgvx@xhacker>
 <ZHdnliDU7ikKaFoX@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZHdnliDU7ikKaFoX@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_092901_942076_AB59F580 
X-CRM114-Status: GOOD (  40.62  )
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
Content-Type: multipart/mixed; boundary="===============8001992729050621596=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8001992729050621596==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BjOrWNtSKlv6yyL3"
Content-Disposition: inline


--BjOrWNtSKlv6yyL3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2023 at 11:28:22PM +0800, Jisheng Zhang wrote:
> On Wed, May 31, 2023 at 11:24:19PM +0800, Jisheng Zhang wrote:
> > On Mon, May 29, 2023 at 12:13:10PM +0100, Conor Dooley wrote:
> > > On Sat, May 27, 2023 at 12:59:56AM +0800, Jisheng Zhang wrote:
> > > > We will soon take different actions by checking the HW is noncohere=
nt
> > > > or not, I.E ZICBOM/ERRATA_THEAD_CMO or not.
> > > >=20
> > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > ---
> > > >  arch/riscv/errata/thead/errata.c    | 19 +++++++++++--------
> > > >  arch/riscv/include/asm/cacheflush.h |  4 ++--
> > > >  arch/riscv/kernel/setup.c           |  6 +++++-
> > > >  arch/riscv/mm/dma-noncoherent.c     | 10 ++++++----
> > > >  4 files changed, 24 insertions(+), 15 deletions(-)
> > > >=20
> > > > diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/t=
head/errata.c
> > > > index be84b14f0118..c192b80a5166 100644
> > > > --- a/arch/riscv/errata/thead/errata.c
> > > > +++ b/arch/riscv/errata/thead/errata.c
> > > > @@ -36,21 +36,24 @@ static bool errata_probe_pbmt(unsigned int stag=
e,
> > > >  static bool errata_probe_cmo(unsigned int stage,
> > > >  			     unsigned long arch_id, unsigned long impid)
> > > >  {
> > > > -	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_CMO))
> > > > -		return false;
> > > > -
> > > > -	if (arch_id !=3D 0 || impid !=3D 0)
> > > > -		return false;
> > > > +	bool cmo;
> > > > =20
> > > >  	if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
> > > >  		return false;
> > > > =20
> > > > +	if (IS_ENABLED(CONFIG_ERRATA_THEAD_CMO) &&
> > > > +	    (arch_id =3D=3D 0 && impid =3D=3D 0))
> > > > +		cmo =3D true;
> > > > +	else
> > > > +		cmo =3D false;
> > > > +
> > > >  	if (stage =3D=3D RISCV_ALTERNATIVES_BOOT) {
> > > > -		riscv_cbom_block_size =3D L1_CACHE_BYTES;
> > > > -		riscv_noncoherent_supported();
> > > > +		if (cmo)
> > > > +			riscv_cbom_block_size =3D L1_CACHE_BYTES;
> > > > +		riscv_noncoherent_supported(cmo);
> > > >  	}
> > > > =20
> > > > -	return true;
> > > > +	return cmo;
> > >=20
> > > I don't really understand the changes that you are making to this
> > > function, so that is tries really hard to call
> > > riscv_noncoherent_supported(). Why do we need to always call the func=
tion
> > > in the erratum's probe function, if the erratum is not detected, given
> >=20
> > In one unified kernel Image, to support both coherent and noncoherent
> > platforms(currently, either T-HEAD CMO or ZICBOM), we need to let the
> > kmalloc meet both cases, specifically, ARCH_DMA_MINALIGN aligned.
>=20
> seems adding three words can make it better:
>=20
> kmalloc meet both cases at the beginning, specifically ...
>=20
> > Once we know the underlying HW is coherent, I.E neither T-HEAD CMO nor
> > ZICBOM, we need to notice kmalloc we are safe to reduce the alignment
> > to 1. The notice action is done in patch 5:
> >=20
> > +       } else {
> > +               dma_cache_alignment =3D 1;
> >=20
> >=20
> > > that riscv_noncoherent_supported() is called immediately after
> > > apply_boot_alternatives() in setup_arch()?

This bit here is the key part of my confusion. You try really hard in
the errata stuff to call riscv_noncoherent_supported(), which I do
understand is because of the other branch that you add to the function
later in the series.

What I do not understand is why we are not able to rely on the call to
it in setup_arch() to trigger it when we do not have T-HEAD CMOs or
Zicbom.
You've explained why you want to make sure it always gets called during
boot, but my question is about why it looks like it is being called more
than once.

Actually, now that I think of it, what happens on a T-HEAD system where
there is no T-HEAD CMOs, but there is Zicbom. In theory, this could
exist.
Bear with me here a moment in case I am completely wrong, snippet is
=66rom setup_arch()
	apply_boot_alternatives();
On my example system, this will trigger, eventually sending us into
errata_probe_cmo(), where we will call riscv_noncoherent_supported()
with false, setting dma_cache_alignment to 1.

	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
	    riscv_isa_extension_available(NULL, ZICBOM))
		cmo =3D true;

On this system, this will be true.

	else
		cmo =3D false;
	riscv_noncoherent_supported(cmo);

now riscv_noncoherent_supported() is called with true, and we have
dma_cache_alignment =3D 1 still. Is that not problematic? Or the inverse,
where the T-HEAD system has its custom CMOs and there is no Zicbom, it
gets called twice with different args too.

There's clearly something fundamental that I am missing here, this seems
like it should be immediately obvious why this either cannot happen or
is not a problem, but I can't see it.

Sorry,
Conor.

--BjOrWNtSKlv6yyL3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHd1tQAKCRB4tDGHoIJi
0pGNAPwLSwfmm5OuyEL8BRsFeMVHyDtHAo2DcjggAIKEVSHDngEA0jAajERdcZXM
dZ5aJkHDIEmfSvibu/CfaGJlDgFknQY=
=AxKn
-----END PGP SIGNATURE-----

--BjOrWNtSKlv6yyL3--


--===============8001992729050621596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8001992729050621596==--

