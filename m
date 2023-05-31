Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13EFC77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 09:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MD3iVc2aBU18jo3BCdl+2zsJlVD1bSqe5OSaXxcb0Zg=; b=MjRKE6/M2e5fkcAFqyorX46pRK
	hkkAKqhlJkEl/mWXi3iN6c1YnBwgZgh8309gGXOQ3bey5IKzENCyKXxe0gJfUtNTcq9xCyLBptHU4
	sGWN0rVUP9v8iF4GodfWCofLPM0xPlIw7R7bzSdCg1XZV4LncqRQMIdNOWxzPYBvxUYymPttSMYLI
	RtxLVw4bB001Fw43WQWaopkpzoDqtk6pMVGRv8xpc6pL3ODYVMggTuMveIU4/YhRcB8yr3Aa2NXK5
	GXhjN25Syo56vSpTEGOdGDVFpPom6QsAeB+v+4pdAQKyrtiExhJR5hHZs48k7kx0urkj89Qlkvy23
	2dYpnnCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4IL7-00Gu4S-2G;
	Wed, 31 May 2023 09:41:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4IL5-00Gu3t-0n;
	Wed, 31 May 2023 09:41:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9ACEF62E35;
	Wed, 31 May 2023 09:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E05EC433EF;
	Wed, 31 May 2023 09:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685526114;
	bh=OpYuIiBiLnyzpoB5h6eTpxpvWnEObc9dvHbiCWMfzTo=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=W4AbLbLeeYM+IIePc9sEUM72Y3WilV1PzJB0le77VhFHuqdCH4XVPioItvTb/aef5
	 ONu8NMAOeU14/JGZAPzlo44TzacC9yR6H+NTnvEYoOzGTxpnZAs9DBGsYClpMKY591
	 ObG84AbOsvyLcWY2Se/bqgUvCXyeSQGlAQ5RMXpWFc5Z6m/boUQhQavvO6C3E/lssP
	 2LRIkhYEti3JKVZJon30sfZcoH1zGvLoBhV3sRkfSOzJAYJM0dH080U3HDl2AgKTPm
	 UEObGABsci4OBUW4r9fO1ppvkC6t0sVYK5ptoU8O+EkEddNJp+KX98PZuwh+gjHgAl
	 BKH5wyKgjLqog==
Date: Wed, 31 May 2023 10:41:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, soc@kernel.org,
	corbet@lwn.net, devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	olof@lixom.net, palmer@dabbelt.com, robh+dt@kernel.org,
	arnd@arndb.de
Subject: Re: [PATCH v2] Documentation/process: add soc maintainer handbook
Message-ID: <20230531-criteria-moaning-c3f08e7330be@spud>
References: <20230530-multiple-whooping-ee5706fceb67@wendy>
 <ZHbpb98Yn7SDZ4XZ@debian.me>
MIME-Version: 1.0
In-Reply-To: <ZHbpb98Yn7SDZ4XZ@debian.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_024155_325273_15FEBAC6 
X-CRM114-Status: GOOD (  23.64  )
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
Content-Type: multipart/mixed; boundary="===============0391167534000446430=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0391167534000446430==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oyaajw1YMpfdB6dR"
Content-Disposition: inline


--oyaajw1YMpfdB6dR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2023 at 01:30:07PM +0700, Bagas Sanjaya wrote:
> On Tue, May 30, 2023 at 01:49:36PM +0100, Conor Dooley wrote:

> > +If changes are being made to a devicetree that are incompatible with o=
ld
> > +kernels, the devicetree patch should not be applied until the driver i=
s, or an

> Until the incompatible driver changes are merged?

Yeah, could probably do with a bit of rework here.

> > +appropriate time later.  Most importantly, any incompatible changes sh=
ould be
> > +clearly pointed out in the patch description and pull request, along w=
ith the
> > +expected impact on existing users, such as bootloaders or other operat=
ing
> > +systems.
> > +
> > +Driver Branch Dependencies
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +A common problem is synchronizing changes between device drivers and d=
evicetree
> > +files, even if a change is compatible in both directions, this may req=
uire
> > +coordinating how the changes get merged through different maintainer t=
rees.
> > +
> > +Usually the branch that includes a driver change will also include the
> > +corresponding change to the devicetree binding description, to ensure =
they are
> > +in fact compatible.  This means that the devicetree branch can end up =
causing
> > +warnings in the "make dtbs_check" step.  If a devicetree change depend=
s on
> > +missing additions to a header file in include/dt-bindings/, it will fa=
il the
> > +"make dtbs" step and not get merged.
>=20
> Sounds like passing `make dtbs` is a merging requirement.

I think it goes without saying that not breaking the build is a merge
requirement!

Cheers,
Conor.

--oyaajw1YMpfdB6dR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHcWXAAKCRB4tDGHoIJi
0qpDAPoC3eWTSA8npwFtMO6Or9dEAkacQ/fV2tnihY8YQwa0xgEAq9dG2ir62vCP
xHbS8/9D66p21zew4ZIDD4v2nUaahA8=
=CguU
-----END PGP SIGNATURE-----

--oyaajw1YMpfdB6dR--


--===============0391167534000446430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0391167534000446430==--

