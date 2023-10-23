Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69550C25B41
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 08:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KhcZEkcSCq3gLY8bqcUuxuEOh/xiu3fHpfju0jTscQ=; b=XOp5ViBHMGbCcuuv25inmaOe9r
	/d7bTEKUUGgwd9cmTPIY63rCgRQtPAZx/TWWlMnNVYJ0KoL5px4BBR+Dl7QkoipBH1QFQGIFSr7fk
	K+EEmraJJYuLvqu7s6ndM5oXPgy4jwUDWUrUUiJ6iO/5ehvU0C5mmsNgSSJKqC0PKOW55rVXMxZlC
	/aGn365vKOfaW2f5lc8CICUKWVT+oRbXVSNqu8Lg92dDi/41c5WQq0eT4jnK0d8JugKaq47K9w3oz
	gwdUO68sU1s9lyBvJkMCMts6ne+scglyNb1Fa1hBzXBnztFB9G8nP1T8JtT0yK8w3UsMI2YOBafjD
	OlzkK0/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqGV-006kJf-0R;
	Mon, 23 Oct 2023 08:26:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqGR-006kHo-2T;
	Mon, 23 Oct 2023 08:26:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 09391CE0ACA;
	Mon, 23 Oct 2023 08:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7716AC433C7;
	Mon, 23 Oct 2023 08:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698049576;
	bh=QM64lPqdI6BQGLDm91ZW9OBJezFuw8NFSML0z7gI9+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jd/ehic1pBzvp6zxfw6Su5iynYrBleMT4gcJTQK2BMRblhpuvwDLIl4iSqwdnwk8L
	 aSExVjyu5gKodRUjg9CmNlgtJqpat6jxUh/laOyFXp2RdVcn66B97M02hJ8is29nq9
	 qCzxBN5I+KJVPDvekj6jpQyVCoj5xQyJ7VGRufovW/GtKQWJF9s8NNa21uqe1JBdBc
	 dcUIvRmByNsUU9dG8o6B5LSKQeXDQrG4Efqy8ZxwJy88Bu1LDK/qtX4+NZpFmjTdsR
	 SVtmfREpU71Of7yv+BeOJLkOTPsXyf8YnOQaM/9RcfbpTqp+MsugvYPgvojnuuCa0e
	 mSJhcLMFh7miw==
Date: Mon, 23 Oct 2023 09:26:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu-Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [RFC PATCH v2 07/10] perf: RISC-V: Move T-Head PMU to CPU
 feature alternative framework
Message-ID: <20231023-impulse-quickness-4c7076e6eb58@spud>
References: <20231019140119.3659651-1-peterlin@andestech.com>
 <20231019-predator-quartet-e56f43d5aa8d@spud>
 <ZTJAYqk_DnrR9-Sc@APC323>
 <20231020-snippet-diffusive-1a6052d52aae@spud>
 <ZTTmtVnZrioRWpJx@APC323>
MIME-Version: 1.0
In-Reply-To: <ZTTmtVnZrioRWpJx@APC323>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_012620_145340_27914DE3 
X-CRM114-Status: GOOD (  51.30  )
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
Content-Type: multipart/mixed; boundary="===============1560739732917438607=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1560739732917438607==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hsHv2ICBfypmqCUB"
Content-Disposition: inline


--hsHv2ICBfypmqCUB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 22, 2023 at 05:09:09PM +0800, Yu-Chien Peter Lin wrote:
> On Fri, Oct 20, 2023 at 10:05:20AM +0100, Conor Dooley wrote:
> > On Fri, Oct 20, 2023 at 04:54:58PM +0800, Yu-Chien Peter Lin wrote:
> > > On Thu, Oct 19, 2023 at 05:13:00PM +0100, Conor Dooley wrote:
> > > > On Thu, Oct 19, 2023 at 10:01:19PM +0800, Yu Chien Peter Lin wrote:
> > > >=20
> > > > $subject: perf: RISC-V: Move T-Head PMU to CPU feature alternative =
framework
> > > >=20
> > > > IMO, this should be "RISC-V, perf:" or just "RISC-V" as the changes
> > > > being made to the arch code are far more meaningful than those
> > > > elsewhere.
> > >=20
> > > OK will update the subject to "RISC-V:"
> > >=20
> > > > > The custom PMU extension was developed to support perf event samp=
ling
> > > > > prior to the ratification of Sscofpmf. Instead of utilizing the s=
tandard
> > > > > bits and CSR of Sscofpmf, a set of custom CSRs is added. So we may
> > > > > consider it as a CPU feature rather than an erratum.
> > > > >=20
> > > > > T-Head cores need to append "xtheadpmu" to the riscv,isa-extensio=
ns
> > > > > for each cpu node in device tree, and enable CONFIG_THEAD_CUSTOM_=
PMU
> > > > > for proper functioning as of this commit.
> > > >=20
> > > > And in doing so, you regress break perf for existing DTs :(
> > > > You didn't add the property to existing DTS in-kernel either, so if=
 this
> > > > series was applied, perf would just entirely stop working, no?
> > >=20
> > > Only `perf record/top` stop working I think.
> > >=20
> > > There are too many users out there, and don't have the boards to
> > > test, so leave those DTS unchanged, it would be great if T-Head
> > > community could help to check/update their DTS.
> >=20
> > So, there are too many users to add xtheadpmu to the devicetrees, but
> > not too many users to make changes that will cause a regression?
> > I'm not following the logic here, sorry.
>=20
> humm, I'll try. I assume that the sun20i-d1s.dtsi is all I need
> to update for T-Head PMU.

I think you can actually add it to all users of T-Head CPUs currently in
mainline since all those cpus report the 0 mimpid and 0 marchid that is
being used as the detection method in the current code.

That said, changing the in-kernel devicetrees doesn't solve the
regression problem. Not every dts lives in the linux codebase, for
example, and just because they don't, doesn't mean we can just not
care about them!

As a result, I don't think that we can just do a conversion here from
one method to another like this, since it's likely to break things for
people. Certainly interested in hearing from those that support the
T-Head IP based SoCs about whether they'd be okay with something like
this.

> > > > > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > > > > ---
> > > > > Hi All,
> > > > >=20
> > > > > This is in preparation for introducing other PMU alternative.
> > > > > We follow Conor's suggestion [1] to use cpu feature alternative
> > > > > framework rather than errta, if you want to stick with errata
> > > > > alternative or have other issues, please let me know. Thanks.
> > > >=20
> > > > Personally, I like this conversion, but it is going to regress supp=
ort
> > > > for perf on any T-Head cores which may be a bitter pill to get peop=
le to
> > > > actually accept...
> > > > Perhaps we could add this "improved" detection in parallel, and
> > > > eventually remove the m*id based stuff in the future.
> > > >=20
> > > > > [1] https://patchwork.kernel.org/project/linux-riscv/patch/202309=
07021635.1002738-4-peterlin@andestech.com/#25503860
> > > > >=20
> > > > > Changes v1 -> v2:
> > > > >   - New patch
> > > > > ---
> >=20
> > > > > @@ -805,7 +816,8 @@ static int pmu_sbi_setup_irqs(struct riscv_pm=
u *pmu, struct platform_device *pde
> > > > >  	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
> > > > >  		riscv_pmu_irq_num =3D RV_IRQ_PMU;
> > > > >  		riscv_pmu_use_irq =3D true;
> > > > > -	} else if (IS_ENABLED(CONFIG_ERRATA_THEAD_PMU) &&
> > > > > +	} else if (riscv_isa_extension_available(NULL, XTHEADPMU) &&
> > > > > +		   IS_ENABLED(CONFIG_THEAD_CUSTOM_PMU) &&
> > > > >  		   riscv_cached_mvendorid(0) =3D=3D THEAD_VENDOR_ID &&
> > > > >  		   riscv_cached_marchid(0) =3D=3D 0 &&
> > > > >  		   riscv_cached_mimpid(0) =3D=3D 0) {
> > > >=20
> > > > Can all of the m*id checks be removed, since the firmware is now
> > > > explicitly telling us that the T-Head PMU is supported?
> > >=20
> > > I can only comfirm that boards with "allwinner,sun20i-d1" compatible
> > > string uses the T-Head PMU device callbacks.
> >=20
> > I'm not sure how that is an answer to my question.
>=20
> Sorry for that unclear answer.
> Yes, I agree we no longer need to check the m*id here.

> In OpenSBI, it appears that allwinner D1 is the only platform that
> has T-Head PMU support, the other T-Head platforms need to ensure
> that the callbacks [1] are registered in order to work with SBI
> PMU driver in kernel.

> [1] https://github.com/riscv-software-src/opensbi/blob/v1.3.1/platform/ge=
neric/allwinner/sun20i-d1.c#L263-L272

There may be forks of OpenSBI, or other SBI providers, in use that
configure this correctly for other SoCs with T-Head cores, so while this
is a good indicator, it can't really be taken as gospel. Although, the
T-Head vendor fork can be ignored, as that doesn't even seem to be
capable of booting mainline kernels, given recent issues with the th1520
systems.

Cheers,
Conor.

--hsHv2ICBfypmqCUB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTYuIQAKCRB4tDGHoIJi
0tNXAQDfAMhgJsETy7fO+P8fM3IdnDEk3QtOJjIEpr/vVLa+AAEAnt2g8+h2DAqJ
ghfe/MYLiGfgoqr9D49LM1GCA8RFSAo=
=vkex
-----END PGP SIGNATURE-----

--hsHv2ICBfypmqCUB--


--===============1560739732917438607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1560739732917438607==--

