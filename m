Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AA1C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 16:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1P+e0GyvGwyttI/Smn+CO2WdUvez7JaMlDd+agJ877U=; b=MsEkIwcDzccub9+cq7QbNQnU3m
	HvHdEQY04QiZULP0F3Ru9RCuxHBSSkRbZ4Cwmbq1my/K24odL5YxnkLg8XJx6Ut0XdKgK02u5XiFm
	I0w6OFb0FcSm24c5998ADKOoHcWgKxY4DZ0lZZAq55vz4BJh0ilDUs0vOqmXP4ArJHyuzKTLlxc2Y
	6MWqxVEVrQXtYVI6QwL/YMdsck97WJ3EFUcsilUqrncyeo2MBvPMeCxYfOj2QADswxxarYqApGYRs
	6yGgzoL83MEzXZPENghJnoBjUnTqDwVde4N08mK4lmLFr5UKVmTTKObK522XSDctCaNFBMq9o+j5K
	2O7D1MPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOJZ0-000000042pR-2eWx;
	Mon, 01 Jul 2024 16:07:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOJYx-000000042os-23sh
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 16:07:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C4EB614C7;
	Mon,  1 Jul 2024 16:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741AAC116B1;
	Mon,  1 Jul 2024 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719850050;
	bh=QmDYLMDzbFAVik/DkbW1mPXPNZZJPZCYP+cxE0Noy/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uXK3nvxmKjdsvXXxrtAWaSHnZkAUlaUuJBPDy40HGmKXOTYz9qvAPCJ/VWkKuXzeC
	 9BK4oHFzZm7/Iv3j7kqGx0hxYpqDFXLLi0Kc71J2emXTqu+ldPODcayLA7sI6t8Wys
	 t27pi7dbWc11aw0WhjACbSc85SAa0kOKjo676X82j+pPaju7yudbTHQabykdScnMhW
	 stGPYShnDpxTDnTs9/jSJtnlVZm9x899zHEPNhoiox8yfQudEwc05S++FtV+fVaf9W
	 P+wYvJY+KEXuHltHCHrAA2srbDje5YHXtLXj/6FkqBgIKMRlBujmZ9YeuNBu1K8TAa
	 vJx2aVCLZ4YDw==
Date: Mon, 1 Jul 2024 17:07:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>, peterlin@andestech.com
Subject: Re: [PATCH v3 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Message-ID: <20240701-prancing-outpost-3cbce791c554@spud>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
 <20240619-xtheadvector-v3-3-bff39eb9668e@rivosinc.com>
 <0cc13581-5cc4-4a25-a943-7a896f42da4c@sifive.com>
MIME-Version: 1.0
In-Reply-To: <0cc13581-5cc4-4a25-a943-7a896f42da4c@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_090731_652051_3025540A 
X-CRM114-Status: GOOD (  24.19  )
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
Content-Type: multipart/mixed; boundary="===============8788808837418146347=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8788808837418146347==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2wEs3Y52yP3HfYxY"
Content-Disposition: inline


--2wEs3Y52yP3HfYxY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 10:27:01AM -0500, Samuel Holland wrote:
> Hi Charlie,
>=20
> On 2024-06-19 6:57 PM, Charlie Jenkins wrote:
> > The D1/D1s SoCs support xtheadvector so it can be included in the
> > devicetree. Also include vlenb for the cpu.
> >=20
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
>=20
> The other C906/C910/C920-based SoCs need devicetree updates as well, alth=
ough
> they don't necessarily need to be part of this series:
>=20
>  - sophgo/cv18xx.dtsi
>  - sophgo/sg2042-cpus.dtsi
>  - thead/th1520.dtsi

Yeah, I think I pointed that out before with the same "escape hatch" of
it not needing to be in the same series.

>=20
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv=
/boot/dts/allwinner/sun20i-d1s.dtsi
> > index 64c3c2e6cbe0..6367112e614a 100644
> > --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > @@ -27,7 +27,8 @@ cpu0: cpu@0 {
> >  			riscv,isa =3D "rv64imafdc";
>=20
> The ISA string should be updated to keep it in sync with riscv,isa-extens=
ions.

This probably looks like this cos I said that the kernel shouldn't parse
vendor extensions from "riscv,isa". My rationale was that we have
basically no control of what a vendor extension means in riscv,isa so=20
we shouldn't parse them from it (so marginally worse than standard
extensions, where it means what the spec says except when it doesn't).

Given how we implement the parsing, it also meant we weren't implying
meanings for vendor extensions ACPI-land, where we also can't ensure the
meanings or that they remain stable. That change is in a different
series:
https://patchwork.kernel.org/project/linux-riscv/patch/20240609-support_ven=
dor_extensions-v2-1-9a43f1fdcbb9@rivosinc.com/

Although now that I think about it, this might break xandespmu... I
dunno if the Andes guys switched over to using the new property outside
of the single dts in the kernel tree using their SoC. We could
potentially special-case that extension if they haven't - but my
position on this mostly is that if you want to use vendor extensions you
should not be using riscv,isa (even if the regex doesn't complain if you
add them). I'd like to leave the code in the other patch as-is if we can
help it.

I added Yu Chien Peter Lin here, maybe they can let us know what they're
doing.

Thanks,
Conor.

--2wEs3Y52yP3HfYxY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoLUOwAKCRB4tDGHoIJi
0rw0AQCnXybJz50BMTgjwNiigJMGvS3LXS+gpH8vsiDf6bY5nQEA8gffrOCUKPqX
QYl/5hn3gmXORavNMM6uYbvMldYgpA8=
=cmG6
-----END PGP SIGNATURE-----

--2wEs3Y52yP3HfYxY--


--===============8788808837418146347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8788808837418146347==--

