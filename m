Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E9CC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 12:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkL+QArtFxxSdcav37F06K7HpZ4eLiddi+2vL3ez3s0=; b=q/bNCDy8b6tN7/aCVdNaiWvvNQ
	VdH2VTSAMudNe07wxKYfj9kTgB2wEqU76chkxAaWGI+ivbQmJN1a+YuWUBeWM/z8wDSRVoKQcCYHv
	Ewz9tfkdKVXub9e/EtZN/e+eppG/aC1RBzMpDmSpwQtSQRxLSmEJh17cTop4sxHfLjsUC5VmpCXU9
	FDNZqBKH+Avx9TVn7MrVDKkltRxxnzc/DRoq2fCsP+T9cGVhj3RaHpS1OZWSemanBXCl3i59cVY8f
	MnB0kSkLNIQevfJDckU9rx/iCHjMGzMKTagtQjikSDv5/AiG/f3w53+Uovx1dAG+kYQu0R7ehss90
	mhEicBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JlU-008LwH-2o;
	Wed, 29 Nov 2023 12:34:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JlQ-008LuS-2k;
	Wed, 29 Nov 2023 12:34:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 586CBB83EBB;
	Wed, 29 Nov 2023 12:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCF62C433C7;
	Wed, 29 Nov 2023 12:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701261237;
	bh=rcKNM4SrzvOTPOMTTnNAkDwa6umDcm/Z1HWPpEbPqyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tjRhol3cWY3zuGru3VVvU0O2nvIZ1iroKFgUGd5udxtr1+fOZwwjI4yf34DDZBv6e
	 3prqd/wUw5nFVikChUwzQVlOj3jKDgliaH6N/gbEFyGYqMRPILgkTeJgSOPo6go4Ru
	 QA0lsDQ1IkYy0myr5ssNkCMZE4Fye5x+f/6igxF5houf7db1oPc0rp0j7PyJpwicjP
	 dnGM+Ga37Jy74eyQgKrb/5PqccEYDaKnLbwudYSK4RJ+LSyr3qDaXHuk+396BqI0ae
	 ZJRjIlDqvg/ucpgMXN/p3WqucvWHyOw6mCXMInn8nuHvw2Wfvi4HdmHJxvZUsU5dII
	 SB0+fpQJHj75w==
Date: Wed, 29 Nov 2023 12:33:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu-Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v4 09/13] dt-bindings: riscv: Add T-Head PMU extension
 description
Message-ID: <20231129-curvature-stainable-bf77c735438f@spud>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-10-peterlin@andestech.com>
 <20231123-obscurity-copied-7a7bcc66d69d@wendy>
 <ZWb6qqaNzzNUJ7aX@APC323>
MIME-Version: 1.0
In-Reply-To: <ZWb6qqaNzzNUJ7aX@APC323>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_043401_154389_1155F770 
X-CRM114-Status: GOOD (  22.55  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============4122583368403543619=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4122583368403543619==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Utvw2SdgzW4fg31u"
Content-Disposition: inline


--Utvw2SdgzW4fg31u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 04:47:38PM +0800, Yu-Chien Peter Lin wrote:
> Hi Conor,
>=20
> On Thu, Nov 23, 2023 at 02:48:20PM +0000, Conor Dooley wrote:
> > On Wed, Nov 22, 2023 at 08:12:31PM +0800, Yu Chien Peter Lin wrote:
> > > Document the ISA string for T-Head performance monitor extension
> > > which provides counter overflow interrupt mechanism.
> > >=20
> > > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > > ---
> > > Changes v2 -> v3:
> > >   - New patch
> > > Changes v3 -> v4:
> > >   - No change
> > > ---
> > >  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml =
b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > index c91ab0e46648..694efaea8fce 100644
> > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > @@ -258,5 +258,11 @@ properties:
> > >              in commit 2e5236 ("Ztso is now ratified.") of the
> > >              riscv-isa-manual.
> > > =20
> > > +        - const: xtheadpmu
> > > +          description:
> > > +            The T-Head performance monitor extension for counter ove=
rflow. For more
> > > +            details, see the chapter 12 in the Xuantie C906 user man=
ual.
> > > +            https://github.com/T-head-Semi/openc906/tree/main/doc
> >=20
> > I'm pretty sure that I asked on the previous revision for you to
> > identify a specific revision of this document.
>=20
> Sorry, I'm still searching for it.

Identifying a specific commit from that repo as the revision would be
okay. Follow the format used elsewhere for the standard extensions.

Cheers,
Conor.

--Utvw2SdgzW4fg31u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWcvqgAKCRB4tDGHoIJi
0pQuAQDZZfwrh03OUXbGE0xwEKsxZcfxxPGdlMVElJGo9ksISAD+KCK6j7yitR3a
gkIK95gOtiUMn/8ZposqtImCwROI7gg=
=RvjF
-----END PGP SIGNATURE-----

--Utvw2SdgzW4fg31u--


--===============4122583368403543619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4122583368403543619==--

