Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDED8C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 15:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIIG0adCRpvjjx8LyKVWmP2aSr9NlFzOAmfLYR6Z3vk=; b=ARj/x1njvchMo4zFonore7UUX1
	PYAhg/YuIB1u3JXyz6g3lqUV7U9QQtOj9nzVAwYXVWSB3ktg2+Uolt1zKY3TYJOu2AuSvYgGQhZfW
	zUKiThOs8gB9xXS6rTXYCuUdC5p5QOPDZzmpXT2xBK638ihn4Q6r63099SxCL+5dxtet/8HJw5Xq3
	3ENTyROU9Yo3LPziMk65xMgouIyLldPz4ln1WBLVkGMf/svYFIeSSqT8Edde30QsFv4f3RVMZGKuX
	FVbkHWBcrjfE5fud26x3ln8J2HhRxHkdjZM8V87XkD+PteIunITip1i143tCx9BbEXFUJf6Fg1aJJ
	aWDzA7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD4ZN-00C1nf-01;
	Tue, 12 Dec 2023 15:21:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD4ZL-00C1mb-0F
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 15:21:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id BC4FFB81736;
	Tue, 12 Dec 2023 15:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413F7C433CD;
	Tue, 12 Dec 2023 15:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702394469;
	bh=fPuUDXbvyQcdlGJVGtxadUQq7xMHYvrITxb/nuVFpzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pEfIG+fp3V3eVe8VWoQtmtv+FXpOuNu3/MG6SEfZZ+KyCRN04C+P7+erYFvaQTgu9
	 eFPz0FROSykUvwNHpaprw6hk/xBHZSUxxTMeNeeFuGVg9fqOVwA6eRSAzr5D0ez7lS
	 3LKTuyn3OiGjvvCai7cPIr+AvhERotkqxzy2y8duCmo1F2SyuVevlyU/SdcrJBs+y+
	 fB1SptobaXSXxZ9of5YqHPKZW5qEA8zl+nnvZ6Yo1pmfdRArJx7NpFLopx40DOXhrf
	 24VPA4wdHtUwSiwBWsw5lljmlcASYmQSa71ZEL2gZ69mu+LMtwe0MPIT4VTGOETttN
	 ZEnEiZkxpELPA==
Date: Tue, 12 Dec 2023 15:21:04 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, lkp@intel.com,
	linux-mm@kvack.org, linux@weissschuh.net, llvm@lists.linux.dev,
	mcgrof@kernel.org, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next] drivers: perf: Fix build error by adding const to
 ctl_table argument of handler
Message-ID: <20231212-garage-pellet-c6a2bd34854c@spud>
References: <202312062242.RFPPozG9-lkp@intel.com>
 <20231207083512.51792-1-alexghiti@rivosinc.com>
 <877cljsbes.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
In-Reply-To: <877cljsbes.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_072111_246974_FDC060E5 
X-CRM114-Status: GOOD (  17.98  )
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
Content-Type: multipart/mixed; boundary="===============2232470990769674520=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2232470990769674520==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u+TMTYDuzJdAB5mY"
Content-Disposition: inline


--u+TMTYDuzJdAB5mY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 04:11:55PM +0100, Bj=F6rn T=F6pel wrote:
> Alexandre Ghiti <alexghiti@rivosinc.com> writes:
>=20
> > The ctl_table argument of the proc_handler field was constified treewide
> > but somehow missed the occurrence in the riscv pmu sbi driver, so add t=
he
> > const to fix the build error.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202312062242.RFPPozG9-lkp=
@intel.com/
> > Fixes: c8be9e66ca1e ("sysctl: treewide: constify the ctl_table argument=
 of handlers")
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  drivers/perf/riscv_pmu_sbi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > index 16acd4dcdb96..97e345f7d25d 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -986,7 +986,7 @@ static void riscv_pmu_update_counter_access(void *i=
nfo)
> >  		csr_write(CSR_SCOUNTEREN, 0x2);
> >  }
> > =20
> > -static int riscv_pmu_proc_user_access_handler(struct ctl_table *table,
> > +static int riscv_pmu_proc_user_access_handler(const struct ctl_table *=
table,
> >  					      int write, void *buffer,
> >  					      size_t *lenp, loff_t *ppos)
>=20
> Adding linux-riscv.
>=20
> Reviewed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

There's already a patch for this:
https://lore.kernel.org/linux-riscv/20231206084642.802053-1-m.szyprowski@sa=
msung.com/

The maintainer of the tree with the broken patch (Luis) has not deigned to
pick it up yet unfortunately. It can't go into Palmer's tree cos it will
break the build if applied there.

Cheers,
Conor.

--u+TMTYDuzJdAB5mY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXh6YAAKCRB4tDGHoIJi
0rA3AP45hqW77ceWdDa3OBX5lwstdHr3WTXrkkHheKfXIwqn3QEAnEtNdsZN1rp1
dMhZ39fGppXobCP3M3OQjxQjrt3cjQs=
=f5mp
-----END PGP SIGNATURE-----

--u+TMTYDuzJdAB5mY--


--===============2232470990769674520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2232470990769674520==--

