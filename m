Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C5CC25B4F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 08:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=II6IKf70EKSAWQDCQ9/88CZBQILP5sFPAUPu5vu2dws=; b=mjIgqIqhBwskuTR8NyW9LEP6ey
	SZZj5XUeRHkc2e9lx5BmoB8DuBSWFnyMfc/31VY7D9k6suIh9dpZQQ+ug1wf9kPHN7N5pd2HDFvJ3
	vXjbgBXtBI+HbccL7fnMRbuoGQe/bQoKD7OXLABclYsEjl18O54MPwmbesS+kxGo5hno5QngjSSoU
	VNZKAHJ0NG6hWwIKSzfNpJWEKIQowhSX/G0sJNZUQ6eHUWRcLLuAnxpabCCHRfi1E6cw9/krAtMmR
	EWVUsqbMFj4r/lz2O1kO73fgU3F4wSAuMtGO+0H5hACsGUbEKdWZUQPpRt7A/xojU5BqhR4l2cJyV
	Bb9IR+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5LjS-00000004WNc-0I7V;
	Fri, 10 May 2024 08:35:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5LjO-00000004WN5-3gwX
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 08:35:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A96361E45;
	Fri, 10 May 2024 08:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4180DC113CC;
	Fri, 10 May 2024 08:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715330153;
	bh=CQ60Q4+NgXsh8F6HlVj6l58HkFtjQQJ5uRtYcKoUhLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tOnJNe+0a9PC2UHNB65Y0lB8bnNYsAJrSTeqU3X/gv4dNDkuw4BralKeV4WeuapPD
	 wDrX716S4bEjeRTUxz4FYYAtNu8IUgmsDc5zcBpr5bBy2mEYgzuILg12LZJKz1JMWV
	 wOF7V0VUaAfBsWKazgbRFEXf88llJY05OOXNGRATfoSBSbyb8LkNh08PG8J2pnmcaN
	 nAXbmSCgrZR/fKk12n7pbA23w3xiNuxwNvGi13QhDUvh/0GTATIpXhtVxmRgnLSNAU
	 9tvC7WE2lg2XmD2hIOPOlUmnYGqb5HY2AN94Fiv+IemOXFThs1Sy4wR5OjayIEaSxo
	 OixRso8w9lBrQ==
Date: Fri, 10 May 2024 09:35:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Song Liu <song@kernel.org>, Xi Wang <xi.wang@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] riscv: Support compiling the kernel with more
 extensions
Message-ID: <20240510-pesky-tackling-1b715c4bce35@spud>
References: <20240507-compile_kernel_with_extensions-v2-0-722c21c328c6@rivosinc.com>
 <20240509-uptown-aging-5bdec4730d70@spud>
 <Zj09IUE5k1EJL08X@ghost>
 <20240509-google-passing-3e7577235c44@spud>
 <Zj1UUIY8RYV1kJLM@ghost>
 <20240510-okay-trade-8826cb134979@spud>
MIME-Version: 1.0
In-Reply-To: <20240510-okay-trade-8826cb134979@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_013554_987266_37BD7F11 
X-CRM114-Status: GOOD (  13.81  )
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
Content-Type: multipart/mixed; boundary="===============2094293086569255640=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2094293086569255640==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ai3o+TcwKEPcPexK"
Content-Disposition: inline


--ai3o+TcwKEPcPexK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 09:25:37AM +0100, Conor Dooley wrote:

> > > see why this particular optimisation was worth maintaining 3 code pat=
hs
> >=20
> > I interpreted the "3 code paths" as with Zbb + 64 bit, with Zbb + 32
> > bit, and without Zbb. I directly responded to that by saying that we
> > could eliminate all of the code paths that are not Zbb + 64 bit could be
> > eliminated.

Argh, forgot to say that that was what I meant by the 3 paths, but I
didn't take
| We could just say we don't care about performance if you are running
| 32-bit linux or don't have Zbb, but we would be making that decision
| because we don't feel like maintaining the code. The code was written,
| tested, reviewed, and it provided large performance gains. I fail to
| understand why this is a burden to maintain.
as seriously suggesting that we should remove anything, it read like a
defence of the current code!

--ai3o+TcwKEPcPexK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj3cZQAKCRB4tDGHoIJi
0uIxAP9yoDBxvfeCk961aMZIxkvg+qNdxvB+OMYZaxr8gJAuZQEAravVoFAZw7S5
NSUTstQ+I3BTHjimBeFNG+4vsE+A5wg=
=+hIz
-----END PGP SIGNATURE-----

--ai3o+TcwKEPcPexK--


--===============2094293086569255640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2094293086569255640==--

