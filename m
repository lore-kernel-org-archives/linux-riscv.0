Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C461E7717F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 12:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOiDTG3DuNUmsLakgzxLg0pPdFNwgf5XbGC+IV+En8E=; b=nBB164b3Rk5hmz3vcvdpZpJv3X
	iHgz8KGNe+Oygi486tUFVklvFcTlRCIbsFmRFNz/FZ5oAtFqFflFE+5nBtfO6GI+G+Xj9wAyYz1X5
	I9VF5+V7Q3/fuK2xX/dSGiD+FSIBxOSvt7dMtlPOXpT4dyO7Ubqc51gT/LONny3WWCBAewInkGPsK
	akl2Rbmf0fbtiLeM25X3KbtGY50NM02/RN3tSit+XEl6a14p0EInKc0Vw5THEtD3rLaQVDAOyEoHG
	JC/ATq7McSrFzQ5RonLpbw76OP/Vr8Xwf5Y4eIloP0+DItBYVWxZytaMf+jMlqdiPp52GKKGD87ql
	+ZZGxEKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWQK-0000000DMBW-1jOj;
	Tue, 17 Dec 2024 12:11:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWQH-0000000DMAj-2O76
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 12:11:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1A70AA40D00;
	Tue, 17 Dec 2024 12:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D72EC4CED3;
	Tue, 17 Dec 2024 12:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734437492;
	bh=l3pO0JNjMZnsq5a7fujNN45J7lyZ4k2y+vJ1SY7TY2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lHd62dbSHGsMXodgZvTZzwmJ2UDPi7EacK6iYpYojnssu3rpfB35y35V5Tf89VQ1C
	 ATZ+aCCQF9kCSU83BOro9SAWJpiKkOkfUHehZ9Lk2Rtp1d3KaW8UytD2pSGKKbnWgd
	 sqgfqcWRmiGq7RF6hTnRxd3vTF08pHhSyzo8+AVMeUEYJoTuhUXUqVCgt4fe1HD4dx
	 WH09moysT5NkgBSZiMfd45xnt0zub6eumb/iPGf4vxwMIwZWWQtq9T6lu0/YP/D1/G
	 Oq/Pd+np/E0hQ3blwzCbhwFUheITRy3pmm8znrwaPdPqWPJ1Xin3UVnG52Y1xIFGSu
	 d4ky/5mZrqjNw==
Date: Tue, 17 Dec 2024 12:11:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Yangyu Chen <cyy@cyyself.name>, Chen Wang <unicorn_wang@outlook.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: hwprobe: export bfloat16 ISA extension
Message-ID: <20241217-fondue-candy-55e7efcf2a5e@spud>
References: <20241206055829.1059293-1-inochiama@gmail.com>
 <20241206055829.1059293-4-inochiama@gmail.com>
 <tencent_8F35B6F07D09566A873982E0E2C76085280A@qq.com>
 <sh3fu66fltjccbygbdxilbos4bi5wqk2cdiihc6ixnodsbxtox@rezkyqnpp5yv>
MIME-Version: 1.0
In-Reply-To: <sh3fu66fltjccbygbdxilbos4bi5wqk2cdiihc6ixnodsbxtox@rezkyqnpp5yv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_041133_679433_80E78FE8 
X-CRM114-Status: GOOD (  10.62  )
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
Content-Type: multipart/mixed; boundary="===============8384298941957626937=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8384298941957626937==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u6IT59OqLX/3bsSB"
Content-Disposition: inline


--u6IT59OqLX/3bsSB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 08:40:37AM +0800, Inochi Amaoto wrote:
> On Tue, Dec 17, 2024 at 12:00:23AM +0800, Yangyu Chen wrote:
> > Possible conflict with: https://lore.kernel.org/linux-riscv/20241111-v5=
_user_cfi_series-v8-22-dce14aa30207@rivosinc.com/
> >=20
>=20
> Yeah, I know the conflict. As the time of merging these patch is
> uncertain, what I can do now is to match the upstream code.

The solution is to not worry about it. Palmer can resolve trivial
numerical conflicts like this.

--u6IT59OqLX/3bsSB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2FqbQAKCRB4tDGHoIJi
0gC6AP93cXtfL2os2Bs1KG8DXZDksw/B4lc/JODm5RYX+90VcgEA0/PtcD5OgyqJ
gwb0h/T9khenIvSYh9EI5eAkKgTSnA8=
=5wZ7
-----END PGP SIGNATURE-----

--u6IT59OqLX/3bsSB--


--===============8384298941957626937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8384298941957626937==--

