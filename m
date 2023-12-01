Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5327C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 00:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UpLQlGwbjrkAysg8QenUytphixuNLl7+lwb6G/tEN4=; b=CIznjEBBzwJBJRVKiwdk/WmEzX
	WNdBM3UVxRmgs7xW+wRfpIao4TbvfU5pc/3bjAXPHNgaDVRjYlmS13CE+NkmdkxLyPp6Xqc8Uxq4T
	11z9/gdQRDXJ8IJWV/FkujHoL0ISIkqdUKI1+QwMog22l3rV6D+NRsl6qQU1GEmfMoh75bOe5IQ+u
	EZnTWfCkoKOUrlhwVYEfZE6DRYYqoicF8NYT4eEEScYBz12SiELUMQftmgRmz3ysa8vT3ZOU7BChX
	lPkoGcd/7Jxkas95pueOyimk2MvxCC70hPb4Jq59LuVV8f/Qcoa7LTjr4UjJLZy4Set5XhURqkW5X
	FjsEWE9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8rZs-00CHEq-20;
	Fri, 01 Dec 2023 00:40:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8rZp-00CHDT-0d;
	Fri, 01 Dec 2023 00:40:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 13EBAB845CD;
	Fri,  1 Dec 2023 00:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE544C433C7;
	Fri,  1 Dec 2023 00:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701391214;
	bh=Bwi6rHBnTF4XvJJlKCsW+lAw3yuN1E/2bSWXjFUXBlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJWxdQjHwFwzN3MDNBVDR9RVIKZHH+ZYWbc+bsJ3IEuZxNsvfUAdPFaMh8SqqcEpe
	 pGBa87uCh0j+Lv/eilOH/rMkvTe69hfhziRTHvL47PeiWR+/WFBiNvdN35yA7RHo6a
	 eSto+KrCfTk37oNICO5zL0io4r/qCny2XTAgIqgrcXiovqvj7O25sK0Hg/xMFxuIFx
	 94ZnLTXkFr3gYPVwFqJcYHNqqmcy4HtjQmHdCDtBpj48WK/YpokXA2x9ctnUeVqYTl
	 ULUC/rQPetIL8xAghf3/VmAmfbSnztqMRVIpwaLCgwVYEc4F5LLhfYONb6qoTk/nHX
	 7MagA3g4gefBg==
Date: Fri, 1 Dec 2023 00:40:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH v4 09/13] dt-bindings: riscv: Add T-Head PMU extension
 description
Message-ID: <20231201-hatchback-lustily-a516298c3556@spud>
References: <20231130-isotope-runaround-9afb98579734@spud>
 <IA1PR20MB495378652B09B37E92D8BB04BB82A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB495378652B09B37E92D8BB04BB82A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_164017_536117_3B379852 
X-CRM114-Status: GOOD (  27.99  )
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
Content-Type: multipart/mixed; boundary="===============4633421695834804718=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4633421695834804718==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aS5JTpy0ABLKb+d2"
Content-Disposition: inline


--aS5JTpy0ABLKb+d2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 07:11:31AM +0800, Inochi Amaoto wrote:
> >
> >On Thu, Nov 30, 2023 at 08:16:38PM +0800, Inochi Amaoto wrote:
> >>>
> >>> Hi Inochi,
> >>>
> >>> On Thu, Nov 30, 2023 at 04:29:22PM +0800, Inochi Amaoto wrote:
> >>>>>
> >>>>> Hi Guo Ren,
> >>>>>
> >>>>> On Thu, Nov 23, 2023 at 05:14:30AM +0800, Guo Ren wrote:
> >>>>>> On Wed, Nov 22, 2023 at 8:17=E2=80=AFPM Yu Chien Peter Lin
> >>>>>> <peterlin@andestech.com> wrote:
> >>>>>>>
> >>>>>>> Document the ISA string for T-Head performance monitor extension
> >>>>>>> which provides counter overflow interrupt mechanism.
> >>>>>>>
> >>>>>>> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> >>>>>>> ---
> >>>>>>> Changes v2 -> v3:
> >>>>>>>   - New patch
> >>>>>>> Changes v3 -> v4:
> >>>>>>>   - No change
> >>>>>>> ---
> >>>>>>>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++=
++
> >>>>>>>  1 file changed, 6 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/Documentation/devicetree/bindings/riscv/extensions.y=
aml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> >>>>>>> index c91ab0e46648..694efaea8fce 100644
> >>>>>>> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> >>>>>>> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> >>>>>>> @@ -258,5 +258,11 @@ properties:
> >>>>>>>              in commit 2e5236 ("Ztso is now ratified.") of the
> >>>>>>>              riscv-isa-manual.
> >>>>>>>
> >>>>>>> +        - const: xtheadpmu
> >>>>>>> +          description:
> >>>>>>> +            The T-Head performance monitor extension for counter=
 overflow. For more
> >>>>>>> +            details, see the chapter 12 in the Xuantie C906 user=
 manual.
> >>>>>>> +            https://github.com/T-head-Semi/openc906/tree/main/doc
> >>>>>>> +
> >>>>>>>  additionalProperties: true
> >>>>>>>  ...
> >>>>>>> --
> >>>>>>> 2.34.1
> >>>>>>>
> >>>>>> Reviewed-by: Guo Ren <guoren@kernel.org>
> >>>>>
> >>>>> Thanks for the review.
> >>>>> Would you share document about T-Head PMU?
> >>>>>
> >>>>
> >>>> Hi, Peter Lin:
> >>>>
> >>>> You can use the following two document to get all events:
> >>>> https://github.com/T-head-Semi/openc906/tree/main/doc
> >>>> https://github.com/T-head-Semi/openc910/tree/main/doc
> >>>>
> >>>> There are also some RTL code can describe these events:
> >>>> https://github.com/T-head-Semi/openc910/blob/e0c4ad8ec7f8c70f649d826=
ebd6c949086453272/C910_RTL_FACTORY/gen_rtl/pmu/rtl/ct_hpcp_top.v#L1123
> >>>> https://github.com/T-head-Semi/openc906/blob/af5614d72de7e5a4b8609c4=
27d2e20af1deb21c4/C906_RTL_FACTORY/gen_rtl/pmu/rtl/aq_hpcp_top.v#L543
> >>>>
> >>>> The perf events json can also be used as document, this is already
> >>>> applied (with more detailed explanation):
> >>>> https://lore.kernel.org/all/IA1PR20MB495325FCF603BAA841E29281BBBAA@I=
A1PR20MB4953.namprd20.prod.outlook.com/
> >>>
> >>> Thanks for reaching out!
> >>> The updated description will be:
> >>>
> >>> - const: xtheadpmu
> >>>  description:
> >>>    The T-Head performance monitor extension for counter overflow, as =
ratified
> >>>    in commit bd9206 ("Initial commit") of Xuantie C906 user manual.
> >>>    https://github.com/T-head-Semi/openc906/tree/main/doc
> >>>
> >>> Is it OK with you?
> >>>
> >>
> >> I suggest using perf event json as event description. The jsons provide
> >> more detailed explanation for these events than the user manual.
> >
> >Does the "perf event json" describe the registers and interrupt behaviou=
r?
> >
>=20
> It does not. IIRC, the linux just uses SBI as perf driver backend. So
> the registers and interrupt behaviour is primarily for SBI developer.

Interrupts and registers are the reason that this patch (and the rest of
the patchset) exists :)

> For registers and interrup detail, just reference the openc910 doc url
> (https://github.com/T-head-Semi/openc910/tree/main/doc) and the T-HEAD
> PMU driver in OpenSBI.

The former, sure. But I will not accept driver implementations as the
reference in this context.

Thanks,
Conor.

--aS5JTpy0ABLKb+d2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWkrYwAKCRB4tDGHoIJi
0pwIAPwK17iPJiDp9ipZS/utYpBvkvx0ll5v01jA4ntru7UxxQEA4aGN5NO3jlaA
IGvR1UvnavydACZeMLUy8t+jGSuPzAA=
=bY70
-----END PGP SIGNATURE-----

--aS5JTpy0ABLKb+d2--


--===============4633421695834804718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4633421695834804718==--

