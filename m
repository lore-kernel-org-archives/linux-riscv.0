Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A4DD6B09D
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 16:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ok56idK7iH0HZ+oKNhIRPN3CzyOHDrjdk0Yvznrd1qg=; b=DF9DP94hXt83Ef9vO66baFdR/S
	vv1WizGKZpIKUyUoaloUuIr7XnzsVpBkhSUoHTTdlSw3A1JjW0htJJLlZTXomhhpSDUSKP2CxiJmL
	/2EHe9nSC+WNbn9axofYU3nkpWNyf0jQqNkTbnhld0+ewi+KthQX0IiLntdUR2HAdBp1QeIE7j2yH
	SbOyCr7/6YB6wdtIA488nlyOPq/KVn/xac7wTI6uxzhYCvtiqb8PXNQ8PR8A+14tfhwkWMUE85lX9
	aRNE2t5uWBM11NQlwL/7mmsT5Us9m3oSEH04WhGOvgOrZyfCf+MqdEuYUYhiwpfFsL3jB3epfiebn
	aO5c1Vdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlV5X-00000000MSj-1opE;
	Thu, 29 Jan 2026 16:41:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlV5V-00000000MSB-04RC
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 16:41:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4AE9E4414C;
	Thu, 29 Jan 2026 16:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F7CC4CEF7;
	Thu, 29 Jan 2026 16:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769704904;
	bh=3qgjo7+fN2h0vrO2MoSb7Sqds7DPYKSytJObQziMuho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vATOZ6vdU7DMd8Q8TA82kTtADtrQWudc/tBoh/4xyu+5TWA9cuX76qboxUn7srk3l
	 Ofh9f0ZmMGqUC6Vp5yT7iHgeRSJi1r/Bv6psL8ZOdd7oRv/ZUCDNyaD3AqYa+LCIiu
	 QPOj5ZrDqKpnH5oEeb8K6+kkJNTkV8zkaEguGkmCneTcJJ2g4LNurkG6d1J9U/ieww
	 /tc6TJCdzuxs94+G7E3z6T9XizzSyDdm6k4DzGZatwkIB8po3yytGb0phT39Iu+Atx
	 rdQ1ac/uYhp2/to4H7L5YYxYKHOdcH1TsVUZ570A3tFpSSrF2j0VxrruBzgs4TftKC
	 xsmEQxtb/5nEw==
Date: Thu, 29 Jan 2026 16:41:38 +0000
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?6YOR5b6L?= <lv.zheng@spacemit.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jingyu Li <joey.li@spacemit.com>, iommu <iommu@lists.linux.dev>,
	linux-perf-users <linux-perf-users@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	spacemit <spacemit@lists.linux.dev>,
	devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH v1.1 4/7] dt-bindings: iommu: Add spacemit/t100 features
Message-ID: <20260129-grandly-compare-e8e3a105f690@spud>
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1769666438.git.lv.zheng@spacemit.com>
 <15209d7b8c5a5055f8944ab7261e440d70a18a03.1769666438.git.lv.zheng@spacemit.com>
 <20260129-evolution-femur-84eb5668f4a7@spud>
 <a4684b7f094a6a5ee87d9db722b75594f851b9fb.d4fb292a.1570.47af.8025.bf9af089dc8a@feishu.cn>
MIME-Version: 1.0
In-Reply-To: <a4684b7f094a6a5ee87d9db722b75594f851b9fb.d4fb292a.1570.47af.8025.bf9af089dc8a@feishu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_084145_100092_8A6D2560 
X-CRM114-Status: GOOD (  19.64  )
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
Content-Type: multipart/mixed; boundary="===============5885643803849856953=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5885643803849856953==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="us38dN0chPlzanlk"
Content-Disposition: inline


--us38dN0chPlzanlk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 06:43:03PM +0800, =E9=83=91=E5=BE=8B wrote:
> > From: "Conor Dooley"<conor@kernel.org>
> > Date:=C2=A0 Thu, Jan 29, 2026, 18:08
> > Subject:=C2=A0 Re: [PATCH v1.1 4/7] dt-bindings: iommu: Add spacemit/t1=
00 features
> > To: "Lv Zheng"<lv.zheng@spacemit.com>
> > Cc: "Tomasz Jeznach"<tjeznach@rivosinc.com>, "Joerg Roedel"<joro@8bytes=
=2Eorg>, "Will Deacon"<will@kernel.org>, "Robin Murphy"<robin.murphy@arm.co=
m>, "Rob Herring"<robh@kernel.org>, "Krzysztof Kozlowski"<krzk+dt@kernel.or=
g>, "Conor Dooley"<conor+dt@kernel.org>, "Paul Walmsley"<pjw@kernel.org>, "=
Palmer Dabbelt"<palmer@dabbelt.com>, "Albert Ou"<aou@eecs.berkeley.edu>, "A=
lexandre Ghiti"<alex@ghiti.fr>, "Jingyu Li"<joey.li@spacemit.com>, "Zhijian=
 Chen"<zhijian@spacemit.com>, <iommu@lists.linux.dev>, <linux-perf-users@vg=
er.kernel.org>, <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.de=
v>, <devicetree@vger.kernel.org>
> > On Thu, Jan 29, 2026 at 02:09:13PM +0800, Lv Zheng wrote:
> > > Adds device tree bindings for SpacemiT T100 specific features.
> > >=C2=A0
> > > vendor-hpm-events: Allow vendor events to be customized in the device
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
tree.
> > > global-filter: The feature saves silicon area by reducing filters to
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0one and use it=
 as a global filter across all events.
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This usually i=
s sufficient for real applications.
> >=C2=A0
> > Why can these not be determined from a device specific compatible?
>=20
> The specification only defines less than 10 standard event types while the
> real silicons should have implemented many other event types based on
> their micro-architecture. I tried to provide a common mechanism for all
> vendor specific event types across different vendors.

Given that the variance is based on uarch, it sounds like it can be
determined from the compatible.

> It is similar for the global filter, the global filter mechanism actually
> complies to the IOMMU specification, users can alter the iohpmevt
> registers as is what is specified in the IOMMU specification. It only
> provides slight application difference between the final effection. Thus
> this could also be a non-device specific option.

What is a "user" in this context? Given you're talking about reducing
silicon area, it sounds like this will be set in stone for each SoC, and
therefore can be determined by compatible. If other devices do this,
they can also determine it from their compatible.

Properties for things that can be determined based on compatible are
generally not permitted, so you'll need to provide a compelling
rationale. Common mechanism isn't one, since determining based on
compatible would be a common mechanism based on match data that people
can tack onto for their devices.

--us38dN0chPlzanlk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXuNvgAKCRB4tDGHoIJi
0jikAQCZmWSwXg8/59q41VlZPIhtwnWk+A1C6nwIdeRyN2GdhgEAmQZsAVDM44Bg
nBgDNFGQgdLtTglrLESe4K/YEyzsZws=
=FXGu
-----END PGP SIGNATURE-----

--us38dN0chPlzanlk--


--===============5885643803849856953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5885643803849856953==--

