Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B47C54EBD
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 23:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNVSYr2TJKs14dJ1t05BPdsWrrdLUkjXyDgZ0RC1RJs=; b=pHVyaOOk43JeYllnzhEOJKyt4j
	bg7GG1a9B+6TA6fJy6umyhqQp/X8xP+lq71YwdBHu8w1i+Uh2WqguRNFX3HeNzEKOLTAFbsvjeo0a
	+KsFAaw82MkB6qHuJMPSX/MPDI3rldTm1AdNiwvsNzmr1KrnWyYXjqX41vHHvVt6xHhOWl2sy9Uta
	z7SkQl6+Umh2s0bXXc+lVgVEcayiSyuhn/RaPPyvVQT2H+mwErf51cl4re+XUqYGpa89kxwkNauVr
	CCY3/BhNeCv2TznyeQPeESkNZ4/izg0QqCxbkHBjGbmV2YBePi51D0PcRU20vUNHN1CMkN2fNZvu0
	b6Tki+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDw9Z-00Fceo-Rl; Fri, 06 Jan 2023 23:29:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDw9S-00Fcd1-KC
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 23:29:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E5246B81EFE;
	Fri,  6 Jan 2023 23:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BDE8C433F1;
	Fri,  6 Jan 2023 23:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673047767;
	bh=lwfSS0TgVuKSvxQOB/bNeAFUOiWtAHKnU5ZnPUUTNEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ULdwoj/gG2DPRAGGJsQ3OqOTh9Enpy6KWAhHuyXwQ9Fdu2fEwDf74kkhjpuMqXqgu
	 /PkdkXEW2V6/f+KQivQFkow/YQEfq7O7bzv+pPzQHvg5dmjmn1/V9Yh8zrobOlRCpF
	 thu9X2dG5ul/lcEvLObRvWedWq7GI64cgp47X8dmeoAHJFNQb98Zi84N/vy/WRe9RW
	 MK9887gUerXGBByoJX4Oo1X0A3+a/KG7GQhc2WF0iMAVW0TNYCWIh7RJTCYU3BLgvg
	 3YsV5ejs5uWIu6nNw80w3D9FwG+gKOghpvK9vLBiZeIKht6yUxFv1MGUitLSpLUorz
	 s/t41KtAuuv2A==
Date: Fri, 6 Jan 2023 23:29:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	"Conor.Dooley" <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	guoren <guoren@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	devicetree@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: Re: [RFC PATCH v6 1/6] riscv: mm: dma-noncoherent: Switch using
 function pointers for cache management
Message-ID: <Y7iu0RC9jgWh7hfJ@spud>
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230106185526.260163-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <6f7d06ef-d74d-4dfc-9b77-6ae83e0d7816@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <6f7d06ef-d74d-4dfc-9b77-6ae83e0d7816@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_152935_549502_D429CEC8 
X-CRM114-Status: GOOD (  16.29  )
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
Content-Type: multipart/mixed; boundary="===============0735411069014682021=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0735411069014682021==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OpZnInV74VOFB1Cb"
Content-Disposition: inline


--OpZnInV74VOFB1Cb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 06, 2023 at 11:31:33PM +0100, Arnd Bergmann wrote:
> On Fri, Jan 6, 2023, at 19:55, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > +struct riscv_cache_ops zicbom_cmo_ops =3D {
> > +	.clean_range =3D &zicbom_cmo_clean_range,
> > +	.inv_range =3D &zicbom_cmo_inval_range,
> > +	.flush_range =3D &zicbom_cmo_flush_range,
> > +};
> > +#else
> > +struct riscv_cache_ops zicbom_cmo_ops =3D {
> > +	.clean_range =3D NULL,
> > +	.inv_range =3D NULL,
> > +	.flush_range =3D NULL,
> > +	.riscv_dma_noncoherent_cmo_ops =3D NULL,
> > +};
> > +#endif
> > +EXPORT_SYMBOL(zicbom_cmo_ops);
>=20
> Same here: If the ZICBOM ISA is disabled, nothing should
> reference zicbom_cmo_ops.

> Also, since ZICBOM is a standard
> extension, I think it makes sense to always have it enabled,
> at least whenever noncoherent DMA is supported, that way
> it can be the default that gets used in the absence of any
> nonstandard cache controller.

While I think of it, this is not possible as Zicbom requires toolchain
support whereas the alternative methods for non-coherent DMA do not.

Thanks,
Conor.


--OpZnInV74VOFB1Cb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7iu0AAKCRB4tDGHoIJi
0lKnAPwP9GjTSF/p2NWFDVeTSbVY5BU7VIVCG30YMppNdquBvQEAtC4SemaEoAHM
I5qlKNDdbS2X3qEHRE9DcLDTqdRtMA0=
=ztwi
-----END PGP SIGNATURE-----

--OpZnInV74VOFB1Cb--


--===============0735411069014682021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0735411069014682021==--

