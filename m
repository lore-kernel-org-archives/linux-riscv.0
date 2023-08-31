Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532FBC83F2E
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 16:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+jgTyAveJ0sWo4GnbxpYWL1j6UxPnvwQqR6JUvQ1OQ=; b=NY0BY/WqRimIope8Yq1/jrZkek
	XjaaCwlx60utLHI6bdi8S/V+iGlJVGASly4hGsHf7aI9vCuM3srooozewzXKrI/xefJ4nBnALTvwX
	62gHG8zFmhhJpFXdgMqX9ntpeqiH7klkbcIh5EjzbIxgKhr4kphijuyTpMcW9EWON4Jc74AJX3Orb
	n5EKXPZTiWWWMP8+ofmKSyeZg30udluB60d8uex1fScL0tCcfM+pdbBavYUEjLuLIXBjs4CjUtmas
	bWMNKmKikz8VXKnJPFI2X+rb1cfsACZVHDwhDkMeOD0HZiaiiNimXPcBaQ+gZLXSV1ZQ1dkO2pPwu
	qogTb1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbkof-00Fakp-1x;
	Thu, 31 Aug 2023 16:46:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbkoc-00FakM-2R
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 16:46:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3A831B82208;
	Thu, 31 Aug 2023 16:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346E4C433C7;
	Thu, 31 Aug 2023 16:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693500399;
	bh=+QeSu+XLoumAaxHoK4bpb2RAP5jvtiVuVne+SAiQ8Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mgjE5DerzyTDih01XYNIJ/BuTXvC20Votu9r7ab5u8gCnvRlXwgAYw1U2MsOX1Ri8
	 NuFyiV5xZOnczRFeEmLyTKNZCeVH5ZD2r0aB3qqV2By55WNfuWuOlpjURFkSkaDTnu
	 mE2dk+u/wj1m+E2K372kSKIXhGAzBEWjb934SOC95NsA098cWVpF3JDzWhtDelmfIK
	 XvpmrVN6szkLYT3M6a+S4yBluarnWC3K8Te+eZ+Sc4WrouLPP0zmE0+Z5CNaMSBpjv
	 +TGG8Arm2WO2UNkMxkZcT0gjnYG1x6RHG8gf6ElZ4SaUiWTkDo1vw9qmZzDiTI6+jw
	 glNtDC69BIGtw==
Date: Thu, 31 Aug 2023 17:46:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, evan@rivosinc.com,
	conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH v2 2/6] RISC-V: Enable cbo.zero in usermode
Message-ID: <20230831-bully-unstable-bcc71b884f11@spud>
References: <20230830164954.91987-8-ajones@ventanamicro.com>
 <20230830164954.91987-10-ajones@ventanamicro.com>
 <20230831-tacking-fiction-1f18a30714d7@spud>
 <20230831-9f48b535fe9a486d04f3076a@orel>
MIME-Version: 1.0
In-Reply-To: <20230831-9f48b535fe9a486d04f3076a@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_094642_940151_A47DB2B7 
X-CRM114-Status: GOOD (  17.29  )
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
Content-Type: multipart/mixed; boundary="===============7801649460174602675=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7801649460174602675==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gEeduDcvKVSEHWnX"
Content-Disposition: inline


--gEeduDcvKVSEHWnX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 06:39:30PM +0200, Andrew Jones wrote:
> On Thu, Aug 31, 2023 at 05:24:41PM +0100, Conor Dooley wrote:
> > On Wed, Aug 30, 2023 at 06:49:57PM +0200, Andrew Jones wrote:

> > > @@ -130,6 +131,21 @@ riscv_has_extension_unlikely(const unsigned long=
 ext)
> > >  	return true;
> > >  }
> > > =20
> > > +static __always_inline bool riscv_cpu_has_extension_likely(int cpu, =
const unsigned long ext)
> > > +{
> > > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_lik=
ely(ext))
> > > +		return true;
> >=20
> > It'd have been nice to put the explanation for this into the commit
> > message I think, but w/e. Do it if there's a v3 I guess.
>=20
> Do you mean the "why gate on the alternative config" explanation? If so, I
> can certainly do that for v3.

Yeah, should maybe have specified, sorry.

--gEeduDcvKVSEHWnX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPDD6wAKCRB4tDGHoIJi
0kL1AQCpJW/qREPMRKCYYx2qlYsCtC/u6CualRTnnJdqj8/n0wEAkXoLSqRJucwV
UfoLbmt0X95DPfxZbb7jPi79eGhe+wA=
=TmZ1
-----END PGP SIGNATURE-----

--gEeduDcvKVSEHWnX--


--===============7801649460174602675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7801649460174602675==--

