Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B9DC6FD19
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Mar 2023 18:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gywgqarn4iHLYbxjvekDONbwOyW3MfsN5pQtuBi54ec=; b=38O2at4sGPu/r4SMz9y40FEB6k
	UZzkZ58JFSfAryvup9Z4ssc0ymm0TaJgPYh+0w1GPQvEdXB9ckUsTULt704dJMJel1VgDGUjRQgqx
	tFUXIkyt7wD8ZSomxGF/8IF2jivbZ9rBf24Q+JWGImuWuKzxn4I1aEsbgD+5eiF/sZuUKLc6NqFiO
	Znhbj3/XTDopUxFIAsBtk/ghSgEyXsPny3TP0MyDoCV+sbxSJUpMEFewbNUu2Tc1OUEZzPgQaZshZ
	XjtW6QlqcvC7+l2gadw4g5pOWrX/6EkZHW4I8M2csSCXlDNbEFK240Pw9FiFf6gPbx4/Ctktn/qqv
	aRv3jrMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbmms-007HIK-NE; Mon, 13 Mar 2023 18:20:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbmmp-007HFt-MM
	for linux-riscv@lists.infradead.org; Mon, 13 Mar 2023 18:20:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 14DDEB811D7;
	Mon, 13 Mar 2023 18:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B98C433EF;
	Mon, 13 Mar 2023 18:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678731638;
	bh=hWZMAojXtdkUk6KFcyUE0Rz28e+UOMEvZEJ96F+azlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=knALUTadtrScx9Y9mKwpTpov9X7zeATC4Joo8OUk0+vUJfvIBwRf6fGxEDeFWEDsv
	 KGadp18xHvxd7l6SQ8+bPK9WPuJb8fL5PpnkCPhpmZjLiQQAPWZUKZanqAOwGLh2WV
	 cmMiDuSMrtGob+DSXw96C6WOh2eBAJecnFemtOHkUJ7JaRD8dwtuOVi/RxcQkQtWfb
	 MOjXHJ/NuLcycZc38YO+xqjqJJ/awT86FlmD52x3ig9WdIw7P8DYXADcS5C5Pjzvmy
	 sBGeLqNSWoPUkAwrBU1WzeSngkKyNKI/yIY5s5Gpv+Tm/y6VSLRJFTVMqIRQzaRBXh
	 HgIZ7Q05tozJw==
Date: Mon, 13 Mar 2023 18:20:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Song Shuai <suagrfillet@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, conor.dooley@microchip.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	pierre.gondois@arm.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "riscv: Set more data to cacheinfo"
Message-ID: <b9138aac-9f53-4e75-9377-660c5a6c9e25@spud>
References: <20230308064734.512457-1-suagrfillet@gmail.com>
 <20230308113510.fb6y2xhylavkrgtl@bogus>
 <CAAYs2=jFe_ejN9O26AMCZqDtnVkt1bpyMUw2nx1Q9t=SBWj79A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAYs2=jFe_ejN9O26AMCZqDtnVkt1bpyMUw2nx1Q9t=SBWj79A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_112044_056706_C5F3F997 
X-CRM114-Status: GOOD (  22.16  )
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
Content-Type: multipart/mixed; boundary="===============5428817818677798867=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5428817818677798867==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZOtQIau5vhqWU/6/"
Content-Disposition: inline


--ZOtQIau5vhqWU/6/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 07:54:45AM +0000, Song Shuai wrote:
> Hi, Conor & Sudeep :
>=20
> Sudeep Holla <sudeep.holla@arm.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=888=E6=
=97=A5=E5=91=A8=E4=B8=89 11:35=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, Mar 08, 2023 at 02:47:34PM +0800, Song Shuai wrote:
> > > This reverts commit baf7cbd94b5688f167443a2cc3dcea3300132099.
> > >
> > > There are some duplicate cache attributes populations executed
> > > in both ci_leaf_init() and later cache_setup_properties().
> > >
> > > Revert the commit baf7cbd94b56 ("riscv: Set more data to cacheinfo")
> > > to setup only the level and type attributes at this early place.
> > >
> >
> > I had noticed the same and had something similar when we did some rework
> > around for v6.1 merge window. But there were lot of other issues to be
> > addressed at the moment and hence deferred this.
> >
> > So for the change in general, but as Conor responded, it would be good
> > to do some checking to ensure nothing breaks and all the requirements
> > this patch(baf7cbd94b56) addressed are already handled in the core.
>=20
> As you suggested, commit (da29dbcda49d "riscv: Add cache information
> in AUX vector")
> in the "Get cache information from userland" series should be checked.
>=20
> The commit da29dbcda49d adds the cacheinfo (read from
> ci_cacheinfo(cpu)) in ELF auxiliary vectors,
> so process can fetch the cacheinfo through glibc sysconf() after ELF load=
ing.
> At the same time, the glibc related support was enabled by its commit
> (15b38ffc10 "riscv: Get cache information through sysconf")
>=20
> With this reverting patch applied, the output of `getconf -a` looks good
> in Qemu sifive_u machine and rootfs image with glibc-2.35.

If, as I think you're implying, it is unchanged before/after:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--ZOtQIau5vhqWU/6/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZA9pVQAKCRB4tDGHoIJi
0om5AP4iccnul9cT0OrpPO01ZCjDIOxZ78jM8HFJl3V76uGWoAD8DL+ICgZ6Bb0w
SzWLYX3+MYIrd1PDzPDzuSA7odXTaAg=
=kkO8
-----END PGP SIGNATURE-----

--ZOtQIau5vhqWU/6/--


--===============5428817818677798867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5428817818677798867==--

