Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2902C25B50
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 20:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYcQfr5zX5lkhX+57uithg0k2UUWojRfjse7qpN1RCE=; b=oC/Rkg9JtW9f9KDhqtvdpVKSGv
	/QZxMIURHIJud9cT+AZO7SrJFa9Z2mpD6RxsZnCNU7xspFUN0FBZLroDYQsxDy1EfOEltv6ww/Qfp
	2MGJcL0AFYiy2ZK3dkJ3d+GXAP3RprnmvzYPl135XQeZeMXCqdzD3KfXrRqN79RrRWx/Nqd84WPou
	8ghxVyyFzZhXQeStzJm/XJDR1aPeEx/37HciTXlZYL6UYvWa6yonf7m7lKxatwgS60itgD7C6wDB4
	p9MWwPZ2ajHQpZvjL9YuZnLegqp9il/NEmRPmmSDvPy0WErDw1Isb7OEvk+WyDnBtbvHlP5xLAeSh
	xa0l4IQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIySJ-00CM2B-KK; Fri, 20 Jan 2023 20:57:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIySH-00CM1l-Ig
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 20:57:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 137FFB82906;
	Fri, 20 Jan 2023 20:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C9AC433D2;
	Fri, 20 Jan 2023 20:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674248262;
	bh=C/8n3R+rZQQb5j8MVi2jA+BbWjXT+dLd0rYVZPeipcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WJVf4GMV3FEH+3FCWKviYjp9aqp4vjRp/WCvFOI4pZ4avotIRyNz91jSBYslri+o+
	 vIkyFXeR9NpcXMOpjido+0fsgA/+8vJqJ0fjkN8dzB/KD8yz6n8MisthnzSffY72gV
	 YtRks9E4xOuqSnYN+7MPNunDrgC9/Xet/NHnygpQjv67GfxT3LfJfAVzVsRT4SvIwh
	 ANRmIFqALLPzhDhHb+yfUvvvLAJ7UjrVcRNVpxV+sKozLYYszKdLNt97IhgxERpU7V
	 7aVYth5Su36+i5Y9eEh1fhYDC9rSRixI/KE8G66HQC/iSMsVWd/TIX+RIrpvacNO1l
	 IMpTjFR8tzX1Q==
Date: Fri, 20 Jan 2023 20:57:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yimin Gu <ustcymgu@gmail.com>, Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v1 1/2] riscv: Kconfig: Allow RV32 to build with no MMU
Message-ID: <Y8sAQqOo4DX7GwHN@spud>
References: <20230119052642.1112171-1-Mr.Bossman075@gmail.com>
 <20230119052642.1112171-2-Mr.Bossman075@gmail.com>
 <Y8pJ4y7FyBDQPqIT@wendy>
 <056f0d30-d340-fdc4-3744-1cdedd8b4048@gmail.com>
 <Y8r9GuyUAfJWYY5Z@spud>
 <Y8r+B3TZpeI32iTz@spud>
 <31646cc6-0ed7-89b8-06f9-aaa584ef8047@gmail.com>
MIME-Version: 1.0
In-Reply-To: <31646cc6-0ed7-89b8-06f9-aaa584ef8047@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_125745_794582_308730F0 
X-CRM114-Status: GOOD (  13.40  )
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
Content-Type: multipart/mixed; boundary="===============8085696840447928349=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8085696840447928349==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="07XLlRV5jn2qywcu"
Content-Disposition: inline


--07XLlRV5jn2qywcu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > > diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
> > > index 67a7cb3503c3..17c5bfb384ad 100644
> > > --- a/drivers/clk/clk-k210.c
> > > +++ b/drivers/clk/clk-k210.c
> > > @@ -495,7 +495,7 @@ static unsigned long k210_pll_get_rate(struct clk=
_hw *hw,
> > >   	f =3D FIELD_GET(K210_PLL_CLKF, reg) + 1;
> > >   	od =3D FIELD_GET(K210_PLL_CLKOD, reg) + 1;
> > > -	return (u64)parent_rate * f / (r * od);
> > > +	return div_u64(parent_rate * f, r * od);
> >=20
> > Nope, that's wrong. I omitted the cast...
> >=20
> > 	return div_u64((u64)parent_rate * f, r * od);


> Ah that's a much better fix, shall I prepend this to the set and author y=
ou?

Uh, I'd rather check that it is a functional fix first!
I have the board, so I'll give it a go tomorrow and let you know.

Thanks,
Conor.


--07XLlRV5jn2qywcu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8sAQgAKCRB4tDGHoIJi
0vhbAP0fMqrocwAcaEoLC5D7/DL60mv/eigNGPqrlfaLH6nDPgEAuDLfYrTXU6yJ
e6+P5rt6mKGagWq9oUkp+ecqsMSQCg0=
=gCFN
-----END PGP SIGNATURE-----

--07XLlRV5jn2qywcu--


--===============8085696840447928349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8085696840447928349==--

