Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB627C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 12:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRqh55+eofnXU9D0THVIZ9qKUKqR95pNvaY62AbPeEA=; b=PrWpC6T7zgywdw+7S0Rg8A+Aql
	gbuyB2coYDdqbpb6vmS1OBo3jJqmTl5zGvYfHCCcVD33tnSF9umk2w8mphNxce/VvEFeI614wa7Em
	Sx7t7SDHRxgI/6QU6ExOAdP5mScr7u6FhFlm3mgReKqLOkrpDTt7/8vgJR+ZNKTmEWP2n08dQ26gY
	/WtPX+TNlA/H+o9cIk9VPhK7WW284U9qZStEMqENT8//fVS0SsfZ69yM5WH8WntSbTfwSN8NSolgU
	B6LumfcDOIMIoNHyPyi/e6pCMWSIwR9AgLriDoJU1TBnymysvbyNSEeHYHZQ5XVsWBxBBFRiVNlyR
	dSOafXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8gdB-00AvO2-2n;
	Thu, 30 Nov 2023 12:59:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8gd8-00AvMa-0g;
	Thu, 30 Nov 2023 12:58:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EA9BDB84484;
	Thu, 30 Nov 2023 12:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65182C433C8;
	Thu, 30 Nov 2023 12:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701349132;
	bh=k61SVR5HqRg7HEBrqbj2RC0wILozeLcKJTkF4ff/FCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uZiioLM3vGhd04qm7k7+NnViHdFYh5nUaeVbfNcQ7pkEQfQ53udUJq2BV1hqCB+tL
	 ktmNEhQ5jqdFf0dT1SJRszxd0JNbSxbkgN657cvdVJeVjiqAeOClH5yxYy+qxIT1Sh
	 g93Vc52elbcNEYTcBo891fzZPSWoZiIZZBmjfWHSTHtRfV1qGgNeL1vp3I9yn/wi4g
	 roKhPGMFpeCfecjaRhTv7mdoySSRfO43EizHR3SUVJBZL38KudxZlQ+s3oS+7Zjttc
	 uPBXl52i2/u3veXdotEqe7ANYTsFEwOMLs+S+b4X/3k+frVOkG1tHrGjWiaYGlLkIp
	 WTVcmgGk9zreA==
Date: Thu, 30 Nov 2023 12:58:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH v4 09/13] dt-bindings: riscv: Add T-Head PMU extension
 description
Message-ID: <20231130-isotope-runaround-9afb98579734@spud>
References: <ZWhT_VSpl2aksVK7@APC323>
 <IA1PR20MB4953A05B9162AA2659DE78A5BB82A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953A05B9162AA2659DE78A5BB82A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_045858_535510_27A829CD 
X-CRM114-Status: GOOD (  24.87  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, Guo Ren <guoren@kernel.org>, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, Yu-Chien Peter Lin <peterlin@andestech.com>, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, jszhang@kernel.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============0312293077591031340=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0312293077591031340==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+TcmYWDdQWc1nRE2"
Content-Disposition: inline


--+TcmYWDdQWc1nRE2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 08:16:38PM +0800, Inochi Amaoto wrote:
> >
> >Hi Inochi,
> >
> >On Thu, Nov 30, 2023 at 04:29:22PM +0800, Inochi Amaoto wrote:
> >>>
> >>> Hi Guo Ren,
> >>>
> >>> On Thu, Nov 23, 2023 at 05:14:30AM +0800, Guo Ren wrote:
> >>>> On Wed, Nov 22, 2023 at 8:17=E2=80=AFPM Yu Chien Peter Lin
> >>>> <peterlin@andestech.com> wrote:
> >>>>>
> >>>>> Document the ISA string for T-Head performance monitor extension
> >>>>> which provides counter overflow interrupt mechanism.
> >>>>>
> >>>>> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> >>>>> ---
> >>>>> Changes v2 -> v3:
> >>>>>   - New patch
> >>>>> Changes v3 -> v4:
> >>>>>   - No change
> >>>>> ---
> >>>>>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
> >>>>>  1 file changed, 6 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yam=
l b/Documentation/devicetree/bindings/riscv/extensions.yaml
> >>>>> index c91ab0e46648..694efaea8fce 100644
> >>>>> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> >>>>> @@ -258,5 +258,11 @@ properties:
> >>>>>              in commit 2e5236 ("Ztso is now ratified.") of the
> >>>>>              riscv-isa-manual.
> >>>>>
> >>>>> +        - const: xtheadpmu
> >>>>> +          description:
> >>>>> +            The T-Head performance monitor extension for counter o=
verflow. For more
> >>>>> +            details, see the chapter 12 in the Xuantie C906 user m=
anual.
> >>>>> +            https://github.com/T-head-Semi/openc906/tree/main/doc
> >>>>> +
> >>>>>  additionalProperties: true
> >>>>>  ...
> >>>>> --
> >>>>> 2.34.1
> >>>>>
> >>>> Reviewed-by: Guo Ren <guoren@kernel.org>
> >>>
> >>> Thanks for the review.
> >>> Would you share document about T-Head PMU?
> >>>
> >>
> >> Hi, Peter Lin:
> >>
> >> You can use the following two document to get all events:
> >> https://github.com/T-head-Semi/openc906/tree/main/doc
> >> https://github.com/T-head-Semi/openc910/tree/main/doc
> >>
> >> There are also some RTL code can describe these events:
> >> https://github.com/T-head-Semi/openc910/blob/e0c4ad8ec7f8c70f649d826eb=
d6c949086453272/C910_RTL_FACTORY/gen_rtl/pmu/rtl/ct_hpcp_top.v#L1123
> >> https://github.com/T-head-Semi/openc906/blob/af5614d72de7e5a4b8609c427=
d2e20af1deb21c4/C906_RTL_FACTORY/gen_rtl/pmu/rtl/aq_hpcp_top.v#L543
> >>
> >> The perf events json can also be used as document, this is already
> >> applied (with more detailed explanation):
> >> https://lore.kernel.org/all/IA1PR20MB495325FCF603BAA841E29281BBBAA@IA1=
PR20MB4953.namprd20.prod.outlook.com/
> >
> >Thanks for reaching out!
> >The updated description will be:
> >
> >- const: xtheadpmu
> >  description:
> >    The T-Head performance monitor extension for counter overflow, as ra=
tified
> >    in commit bd9206 ("Initial commit") of Xuantie C906 user manual.
> >    https://github.com/T-head-Semi/openc906/tree/main/doc
> >
> >Is it OK with you?
> >
>=20
> I suggest using perf event json as event description. The jsons provide
> more detailed explanation for these events than the user manual.

Does the "perf event json" describe the registers and interrupt behaviour?

--+TcmYWDdQWc1nRE2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWiHAAAKCRB4tDGHoIJi
0igkAQDOfuuBe9DSefozhmWIFmSJzSSWtODAmHdNEeaJ2/bbUAD+KQI5g0aV+rX2
4Hztl6JmSKirDEkCeX2FqX9R+Ln89A0=
=qBbG
-----END PGP SIGNATURE-----

--+TcmYWDdQWc1nRE2--


--===============0312293077591031340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0312293077591031340==--

