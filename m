Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE13CDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 09:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JIG3IF2Yt2pzLzrKQdtU11Y9nlByNkse2UssZLSgd3Q=; b=rzN3EOMbo86kKR+sMw36q23OkW
	auc4f0gKgH1BJE78vbb5sLbkWUstKyUAHkHtpNvdFQp+5h81hN58FUr7beH9dvgMcHQPpVA8VkqIx
	LmqVKbJ8cDm5rNzJaxICoNxFDAY28Nb6YtkEVENDToIJGknBgM9JBbHP6a0yMUTr/n09cBduyMU1s
	gZqQmrfWQRuzLJicfRrvxvrGFRTnydDkI4OdS7jKVBxR3rrQ3wkjr8K7ZNRzMyjAkjHBSCpjqJ1b3
	Ec5dwdPjeWkmuNgjoudM4+AcFmFKg79e4eOK4iITLslNukGMrwxf6B/33B1WQdbH0fGR5PQ4qHsU6
	oLO0cpsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtlRm-001dJl-2O;
	Fri, 20 Oct 2023 09:05:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtlRi-001dIE-1e;
	Fri, 20 Oct 2023 09:05:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D05CDCE35DF;
	Fri, 20 Oct 2023 09:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40FD4C433C7;
	Fri, 20 Oct 2023 09:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697792728;
	bh=Q2i9cGMMYMVelZA9jo7bWwCUpM96iBnURwnpSnHzXg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wchl94Qi9hV+Vi4rtCKso9+DojD9vgE2mBuYsml/2HTQuuWqaONwikdibV/L0utDh
	 W6e1US1Qu5JgEufPe+Emtd4PAffm3XUuWyL/4rT95jwY3iwbPdDh9m3rUPx67XPWnA
	 xVIvSoGT0aBVZiU4KdO94lDZ7MYCO1v2sMB0pp1ViK/HxJdG11ikb6AxRaxdmLUXsB
	 Yr7gaptM/hY5iKNqz5+Jjb2238Nrwdta3o7XyczhhEqegkZcKMinWS4Zuk1cgeErzy
	 mMF5Js9z7hOATCKn6/uJpXuQGLOo8PKG5JwEhhgR77Zg8Sv5fc1ikxAz8N0bRgrQJ7
	 Ka2/s4MKLegQw==
Date: Fri, 20 Oct 2023 10:05:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu-Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [RFC PATCH v2 07/10] perf: RISC-V: Move T-Head PMU to CPU
 feature alternative framework
Message-ID: <20231020-snippet-diffusive-1a6052d52aae@spud>
References: <20231019140119.3659651-1-peterlin@andestech.com>
 <20231019-predator-quartet-e56f43d5aa8d@spud>
 <ZTJAYqk_DnrR9-Sc@APC323>
MIME-Version: 1.0
In-Reply-To: <ZTJAYqk_DnrR9-Sc@APC323>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_020530_925391_01559C72 
X-CRM114-Status: GOOD (  37.58  )
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
Cc: mark.rutland@arm.com, heiko@sntech.de, atishp@atishpatra.org, conor.dooley@microchip.com, guoren@kernel.org, jszhang@kernel.org, linux-riscv@lists.infradead.org, will@kernel.org, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, dylan@andestech.com, ajones@ventanamicro.com, aou@eecs.berkeley.edu, prabhakar.mahadev-lad.rj@bp.renesas.com, locus84@andestech.com, tim609@andestech.com, paul.walmsley@sifive.com, linux-arm-kernel@lists.infradead.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com
Content-Type: multipart/mixed; boundary="===============4419618162700882045=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4419618162700882045==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XvYVzaew7WL+CCDC"
Content-Disposition: inline


--XvYVzaew7WL+CCDC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 04:54:58PM +0800, Yu-Chien Peter Lin wrote:
> On Thu, Oct 19, 2023 at 05:13:00PM +0100, Conor Dooley wrote:
> > On Thu, Oct 19, 2023 at 10:01:19PM +0800, Yu Chien Peter Lin wrote:
> >=20
> > $subject: perf: RISC-V: Move T-Head PMU to CPU feature alternative fram=
ework
> >=20
> > IMO, this should be "RISC-V, perf:" or just "RISC-V" as the changes
> > being made to the arch code are far more meaningful than those
> > elsewhere.
>=20
> OK will update the subject to "RISC-V:"
>=20
> > > The custom PMU extension was developed to support perf event sampling
> > > prior to the ratification of Sscofpmf. Instead of utilizing the stand=
ard
> > > bits and CSR of Sscofpmf, a set of custom CSRs is added. So we may
> > > consider it as a CPU feature rather than an erratum.
> > >=20
> > > T-Head cores need to append "xtheadpmu" to the riscv,isa-extensions
> > > for each cpu node in device tree, and enable CONFIG_THEAD_CUSTOM_PMU
> > > for proper functioning as of this commit.
> >=20
> > And in doing so, you regress break perf for existing DTs :(
> > You didn't add the property to existing DTS in-kernel either, so if this
> > series was applied, perf would just entirely stop working, no?
>=20
> Only `perf record/top` stop working I think.
>=20
> There are too many users out there, and don't have the boards to
> test, so leave those DTS unchanged, it would be great if T-Head
> community could help to check/update their DTS.

So, there are too many users to add xtheadpmu to the devicetrees, but
not too many users to make changes that will cause a regression?
I'm not following the logic here, sorry.

> > > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > > ---
> > > Hi All,
> > >=20
> > > This is in preparation for introducing other PMU alternative.
> > > We follow Conor's suggestion [1] to use cpu feature alternative
> > > framework rather than errta, if you want to stick with errata
> > > alternative or have other issues, please let me know. Thanks.
> >=20
> > Personally, I like this conversion, but it is going to regress support
> > for perf on any T-Head cores which may be a bitter pill to get people to
> > actually accept...
> > Perhaps we could add this "improved" detection in parallel, and
> > eventually remove the m*id based stuff in the future.
> >=20
> > > [1] https://patchwork.kernel.org/project/linux-riscv/patch/2023090702=
1635.1002738-4-peterlin@andestech.com/#25503860
> > >=20
> > > Changes v1 -> v2:
> > >   - New patch
> > > ---

> > > @@ -805,7 +816,8 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *p=
mu, struct platform_device *pde
> > >  	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
> > >  		riscv_pmu_irq_num =3D RV_IRQ_PMU;
> > >  		riscv_pmu_use_irq =3D true;
> > > -	} else if (IS_ENABLED(CONFIG_ERRATA_THEAD_PMU) &&
> > > +	} else if (riscv_isa_extension_available(NULL, XTHEADPMU) &&
> > > +		   IS_ENABLED(CONFIG_THEAD_CUSTOM_PMU) &&
> > >  		   riscv_cached_mvendorid(0) =3D=3D THEAD_VENDOR_ID &&
> > >  		   riscv_cached_marchid(0) =3D=3D 0 &&
> > >  		   riscv_cached_mimpid(0) =3D=3D 0) {
> >=20
> > Can all of the m*id checks be removed, since the firmware is now
> > explicitly telling us that the T-Head PMU is supported?
>=20
> I can only comfirm that boards with "allwinner,sun20i-d1" compatible
> string uses the T-Head PMU device callbacks.

I'm not sure how that is an answer to my question.

Thanks,
Conor.

--XvYVzaew7WL+CCDC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTJC0AAKCRB4tDGHoIJi
0nHaAP9s0/KCk/++o9jSsTNdeG7318oIWBROwIxsdrZtV6H4SQD7BoW0i5nWJUh4
W9BZgM6pk4vdZ+gv3m1w/T8J/I4KlQQ=
=q6XB
-----END PGP SIGNATURE-----

--XvYVzaew7WL+CCDC--


--===============4419618162700882045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4419618162700882045==--

