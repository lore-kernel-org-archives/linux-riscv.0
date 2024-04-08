Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15DAC67861
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2024 08:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubI5v96RRnydNjyFZnYzhYyaPKhy/NNLBk+BBHrfia0=; b=ev+D2p0ICcD/86MYoddi0iTcYM
	GyKyXKXUEWU//LV8K+qFPups+xAjLpAgniBsjiE3Fpixor0j2RmyQSehpi1fZRhmR/OdjRXzIN7SL
	QWz99/m0035JAPCxeBc5y4UEkHMpIsQSHxSFDdFvobx2/vUqNDjNCX5h43SuU6tW1I4sqMQJUbKbO
	DuQYjYvSEIsxOm8zAbd8Ltu0h+9J6UqCEsUSHzclh8hynwoVM28ZD//yfzXI62iaqeLYiC9TQnGWr
	zHptoBAGhe/XGUM+tDNDQ//gVaC0wQ8q0W/DBMRZW1jGoCikpEgsMv/aBuMv6a4kDFHs7IJFR3ynA
	jEQpSXAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtk5o-0000000EqEr-1efA;
	Mon, 08 Apr 2024 08:11:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtk5U-0000000Eq6u-1KtO
	for linux-riscv@lists.infradead.org;
	Mon, 08 Apr 2024 08:10:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3297760EAB;
	Mon,  8 Apr 2024 08:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA2AC433C7;
	Mon,  8 Apr 2024 08:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712563825;
	bh=yqiVE4oOJ/gIlN9qWpoU6AB/pFNy8uHPjaDhffYbiOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOSlqe9ooFAE+xEuEvFhU73tgJwlTKO2GXJ2y50/dMwuCl9s/Sj9DTtVajE/V1QeR
	 4RHMeegHvTnP/6ti3t5dpS7+0UaQPeF6mQknZ319QerAH9VxbKda0wAaApNMTeFKfW
	 5xlt8LIqc+S7RIeuNaSRKnh0itiH6vGaTJB6AD+bB446Q9qfJ2/0zlX3mJ6fLRXHes
	 JqoQCufIZikyuzKogLjynQB5cPPSGTQlipoiDPGWtWIN02ijND8aTcGaUE7eq79U23
	 JLb2qi0Izz5QzS8Pja3GmxUf+pNRr9v9dD3oz7V35DHMTcv+ZHEAZarpkz1qWorrU1
	 qM5nddh3uIT6Q==
Date: Mon, 8 Apr 2024 09:10:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>
Cc: Yangyu Chen <cyy@cyyself.name>, ajones@ventanamicro.com, alex@ghiti.fr,
	alistair.francis@wdc.com, Albert Ou <aou@eecs.berkeley.edu>,
	bjorn@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	cooper.qu@linux.alibaba.com, dbarboza@ventanamicro.com,
	Qingfang Deng <dqfext@gmail.com>, eric.huang@linux.alibaba.com,
	heiko@sntech.de, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, philipp.tomsich@vrull.eu,
	samuel.holland@sifive.com, zhiwei_liu@linux.alibaba.com,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3 2/2] riscv: T-Head: Test availability bit before
 enabling MAE errata
Message-ID: <20240408-dispersal-foster-49c4e269216e@spud>
References: <20240407213236.2121592-3-christoph.muellner@vrull.eu>
 <tencent_CF232CDF85208DF6BFA3076E73CC4E087306@qq.com>
 <CAEg0e7h0F_LaeMoS6Co1UjgLM6ML8SXtTfHW5+OQS6yedjdZPQ@mail.gmail.com>
 <tencent_459BC09115173E0624A4A0F19D2F43704F05@qq.com>
 <CAEg0e7jW=Sfc3tcc0eJwbTx=vb0HM49ZWpda972E-t=Fj1PG+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEg0e7jW=Sfc3tcc0eJwbTx=vb0HM49ZWpda972E-t=Fj1PG+g@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============7861746348229723571=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7861746348229723571==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eyhaaW+BF6W5xuPl"
Content-Disposition: inline


--eyhaaW+BF6W5xuPl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 08, 2024 at 09:55:48AM +0200, Christoph M=C3=BCllner wrote:
> On Mon, Apr 8, 2024 at 9:37=E2=80=AFAM Yangyu Chen <cyy@cyyself.name> wro=
te:
> > > On Apr 8, 2024, at 14:00, Christoph M=C3=BCllner <christoph.muellner@=
vrull.eu> wrote:
> > > On Mon, Apr 8, 2024 at 3:58=E2=80=AFAM Yangyu Chen <cyy@cyyself.name>=
 wrote:
> > >> On 2024/4/8 05:32, Christoph M=C3=BCllner wrote:
> > >>> T-Head's memory attribute extension (XTheadMae) (non-compatible
> > >>> equivalent of RVI's Svpbmt) is currently assumed for all T-Head har=
ts.
> > >>> However, QEMU recently decided to drop acceptance of guests that wr=
ite
> > >>> reserved bits in PTEs.
> > >>> As XTheadMae uses reserved bits in PTEs and Linux applies the MAE e=
rrata
> > >>> for all T-Head harts, this broke the Linux startup on QEMU emulatio=
ns
> > >>> of the C906 emulation.
> > >>>
> > >>> This patch attempts to address this issue by testing the MAE-enable=
 bit
> > >>> in the th.sxstatus CSR. This CSR is available in HW and can be
> > >>> emulated in QEMU.
> > >>>
> > >>> This patch also makes the XTheadMae probing mechanism reliable, bec=
ause
> > >>> a test for the right combination of mvendorid, marchid, and mimpid
> > >>> is not sufficient to enable MAE.
> > >>>
> > >>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > >>> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

> > >>> @@ -28,11 +31,14 @@ static bool errata_probe_mae(unsigned int stage,
> > >>>      if (arch_id !=3D 0 || impid !=3D 0)
> > >>>              return false;
> > >>>
> > >>
> > >> I would raise a little concern about keeping this "if" statement for
> > >> arch_id and imp_id after we have probed it in this CSR way. I would =
like to
> > >> remove it and move the CSR probe earlier than RISCV_ALTERNATIVES.
> > >>
> > >> I added CC to guoren for more opinions.
> > >>
> > >> Even T-Head C908 comes in 2023, which supports RVV 1.0 and also keep=
s MAEE.
> > >> But it also supports Svpbmt, and we can perform the switch by cleari=
ng the
> > >> MAEE bit in CSR_TH_MXSTATUS in M-Mode Software.
> > >>
> > >> Moreover, T-Head MAEE may not be removed in the future of T-Head CPU=
s. We
> > >> can see something from the T-Head C908 User Manual that adds a Secur=
ity bit
> > >> to MAEE. So, it might used in their own TEE implementation and will =
not be
> > >> removed.
> > >>
> > >> However, C908 has arch_id and impid, which are not equal to zero. Yo=
u can
> > >> see it from the C908 boot log [2] from my patch to support K230 [3].=
 So, if
> > >> we have probed MAEE using CSR, you confirmed that this bit will also=
 be set
> > >> in the C906 core. We can only probe it this way and no longer use ar=
ch_id
> > >> and imp_id. And if the arch_id and imp_id probes get removed, we sho=
uld
> > >> also move the csr probe earlier than riscv alternatives.
> > >
> > > We keep the probing via arch_id=3D=3D0&&impid=3D=3D0 because we had t=
hat
> > > already in the kernel and don't want to break existing functionality.
> > >
> > > From the discussions that we had about the v1 and v2 of this series,
> > > my impression is that we should use DT properties instead of probing
> > > arch_id and impid. So, if C908 support is needed, this should probably
> > > be introduced using DT properties. The logic would then be:
> > > * if arch_id =3D=3D 0 and impid =3D=3D 0 then decide based on th.sxst=
atus.MAEE
> > > * else test if "xtheadmae" is in the DT
> > >
> > >
> >
> > I know about it, and Conor also mentioned adding this property to DT a =
few
> > months ago. I agree with this at that time. But for now, you have found=
 the
> > T-Head document description about this, and we can probe MAE using CSR =
even
> > on C906. I think only probing in CSR will be a better way to do that. It
> > can maintain compatibility with some early cores, such as C906. And will
> > also support some new cores with non-zero arch_id and impl_id but may h=
ave
> > MAE enabled, such as C908.
> >
> > For future concerns, T-Head said from their documentation that
> > "Availability: The th.sxstatus CSR is available on all systems whose
> > mvendorid CSR holds a value of 0x5B7." [1] and this extension is frozen=
 and
> > stable. I think it's okay to have MAE errara for some cpus whose impl_id
> > and arch_id are non-zero. And T-Head may have used this for their TEE, =
so
> > it might never be removed.
>=20
> I wrote that specification. And yes, T-Head reviewed that part.
> But there is no guarantee for future cores.

Yeah, that is what I assumed. Unless its a 100% certainty that this bit
will always have this meaning, we can't unconditionally assume that it
does.

> > Since it might never be removed, if some vendor uses it and makes it ha=
rd
> > to run the mainline kernel since it requires setting CSR in M-Mode soft=
ware
> > or changing the DT, they may be hard to change for some security reasons
> > for TEE, I think it's not right

> The question is: why should the kernel have to care about that?
> This can all be addressed (hidden) in FW, where core-specific
> routines can test the required bits in vendor CSRs and set DT properties
> that match the core's configuration.

I'm also not super inclined to care about it requiring changes in
firmware, because the last time I checked T-Head's SDK (and therefore
the vendors') use a version of OpenSBI that cannot even run mainline and
needs to be updated to begin with.

--eyhaaW+BF6W5xuPl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhOmawAKCRB4tDGHoIJi
0tr/AQCd+JE5/L+WVnwdvpplHfpAcFtlQe7GsV2410Q6Cosm2wEAvHjLaChHcrUb
ASrH4Zsmcv0BeVXzNNn2VagMox0TzAU=
=HNw+
-----END PGP SIGNATURE-----

--eyhaaW+BF6W5xuPl--


--===============7861746348229723571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7861746348229723571==--

