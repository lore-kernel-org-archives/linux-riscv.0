Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFA4C004D4
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Jan 2023 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydTnO3Nvf+KaYr2CH5uWN5I0YBsHK0Uul8zWdPpZu/8=; b=gPMFdHT+JIYEV6TDKNCKhYm0KT
	XqXdCVqSZHKqBYThI2YUEDRzxD2NHpSWFmAzEJCCvG6tkt9L+klr9sdnVjmJA1eq5YjT8DpYwidqG
	7qKn9/XF+k0Ocxo5Uus3nSfcxd98Gz0dtlTobVH0+0zwiLhJ9tkTstMygnUxwsfPbl+DS9feffKfN
	/C69kHm8cmVoSZK1Sx6/REL3XLVecoRRpfzsrENPd3PIQ0NVecFNNAxmCSKy/xvpSJ1KFe4RbZaQs
	+ft+oGppkiZ1QJiIaIxX7SeVwMMVqwkiLJEN9ARfjG6zXRDfkMvHI5rhcHAw1Try3qANdDMosJUIw
	Ds+KRZMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJFMU-00E13T-54; Sat, 21 Jan 2023 15:00:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJFMR-00E12r-S7
	for linux-riscv@lists.infradead.org; Sat, 21 Jan 2023 15:00:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4F750B80815;
	Sat, 21 Jan 2023 15:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BBEC433D2;
	Sat, 21 Jan 2023 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674313249;
	bh=xw2Z/7VGgf6MRizE7aJiA1LL99jH3my9WFA793dqn9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JgzGqOv038rBIyhf+03U/zbPgYEf5M/2qfzuF7XpKSnCGXy/OGJ4WC5wEcUmAoDEW
	 pV4Tus09/AATTuLzuSAxFeYjeIhaHOs8ZuVyw0jalt8uUilJJxoWpRbiiQALeMbqWT
	 3kNXzEoxsxC9Pbl0I1jZbyJk2XVPwCcrkbojYopxetw+h9kK9Q8pJn5+9a95jukbBm
	 pDeBtWqHAEYuRiqd7Wv2AIEtVPOaBW7NAX+lOo2aa1etDjs47DFVsQeKDgh/xTsCyJ
	 KLCCsdcQBquFq5Z0bD3l43OhHIC4JJ6GNwL18Lcfi77CHWCMmqOCEqIAvL6D2v/gE0
	 mA5kY9WLUNk/A==
Date: Sat, 21 Jan 2023 15:00:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yimin Gu <ustcymgu@gmail.com>, Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v1 1/2] riscv: Kconfig: Allow RV32 to build with no MMU
Message-ID: <Y8v+HOkrT5RF0Ysn@spud>
References: <20230119052642.1112171-1-Mr.Bossman075@gmail.com>
 <20230119052642.1112171-2-Mr.Bossman075@gmail.com>
 <Y8pJ4y7FyBDQPqIT@wendy>
 <056f0d30-d340-fdc4-3744-1cdedd8b4048@gmail.com>
 <Y8r9GuyUAfJWYY5Z@spud>
 <Y8r+B3TZpeI32iTz@spud>
 <31646cc6-0ed7-89b8-06f9-aaa584ef8047@gmail.com>
 <Y8sAQqOo4DX7GwHN@spud>
MIME-Version: 1.0
In-Reply-To: <Y8sAQqOo4DX7GwHN@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_070052_094212_786A41DA 
X-CRM114-Status: GOOD (  17.08  )
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
Content-Type: multipart/mixed; boundary="===============6869685135551731253=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6869685135551731253==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fRlkre/rkur7aMjh"
Content-Disposition: inline


--fRlkre/rkur7aMjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 20, 2023 at 08:57:38PM +0000, Conor Dooley wrote:
> > > > diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
> > > > index 67a7cb3503c3..17c5bfb384ad 100644
> > > > --- a/drivers/clk/clk-k210.c
> > > > +++ b/drivers/clk/clk-k210.c
> > > > @@ -495,7 +495,7 @@ static unsigned long k210_pll_get_rate(struct c=
lk_hw *hw,
> > > >   	f =3D FIELD_GET(K210_PLL_CLKF, reg) + 1;
> > > >   	od =3D FIELD_GET(K210_PLL_CLKOD, reg) + 1;
> > > > -	return (u64)parent_rate * f / (r * od);
> > > > +	return div_u64(parent_rate * f, r * od);
> > >=20
> > > Nope, that's wrong. I omitted the cast...
> > >=20
> > > 	return div_u64((u64)parent_rate * f, r * od);
>=20
>=20
> > Ah that's a much better fix, shall I prepend this to the set and author=
 you?
>=20
> Uh, I'd rather check that it is a functional fix first!
> I have the board, so I'll give it a go tomorrow and let you know.

Gave it a go, board still works with revised version of this change in
place.

Thanks,
Conor.


--fRlkre/rkur7aMjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8v+HAAKCRB4tDGHoIJi
0m6AAQCZuIQY4wCVK265zGzoLEP15W5Ue5T/PLw4PH1FspFktQEAsy6GmdgtX5pe
US6Z4LVXtfXIev97q8Yz8HvU6BeFKwM=
=YZ5v
-----END PGP SIGNATURE-----

--fRlkre/rkur7aMjh--


--===============6869685135551731253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6869685135551731253==--

