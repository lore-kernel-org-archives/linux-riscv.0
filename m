Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E613AC54E4A
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 17:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHjF9QVIeiTeur29V7/DwtXK3mHrbPEMpu8My9MVLZo=; b=3cn5aLXsa6mC/tGIMJjRhQfpl0
	Vi/4o+28x6wJp0bprtMZSiz8QRXZtASG6SbNu4jJTO7ftYRBjsxllyIo+l4w/w/XDIWAJFuHKHxDG
	Jk4N5ZxxkkmR4KALx7P0n8Q8UbD84wWz2hF4NuVsMYlUCgtjuBtb65cgnqdelrXX7k8a6Z2CQWsTV
	sfMpfNlt+ReuggYP91EXe4tcT8aLc+SxYao3jRKhXXXJZs5QiK2B5qLZZTMQVwxGJaHPYN06DNzfa
	fv+j0WFR4pIkxDGV9wgL2+FtLX+oW5wQzTpRpGQ4RUxFTZf4frW7P2pk09ItHI/hOrK3ikmMctwfa
	xWJpXmnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhYXI-0000000Eg3i-3M94;
	Tue, 05 Mar 2024 17:25:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhYXF-0000000Eg07-0Fao
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 17:25:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 14F1BCE1D32;
	Tue,  5 Mar 2024 17:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11305C433F1;
	Tue,  5 Mar 2024 17:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709659491;
	bh=QsenZAH1ku6PvZX7ejloa6VeWLc+wSXNgpDQ7jBBw5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YwuXR1oOn3cAnb66aX7pDqhqWQLptn4H9mnfjQtk/eTS9nk8mhADs3PIdTBJtx1v+
	 eXYLcsE8SLBPnVvzQPmrR0WRuPjOwBtyluyHD/lk6499LHFcOSRPLxAIJg5uJ+z4pp
	 q6tCLX6KoE6uIeS7G8tTGq0y/9S5pb6Y5+pSis931MFL0rAYzY3fsYxUrcLAmeCvSd
	 hF5K+Xaz2Z2kDqD4eIAl0woUZKrIQki6a5BJSF44bN0Bl3IIPIhWGSG8V6tPyGKSc5
	 l9Ir+vsBnXa/O+oRyIz1BpUXjV+XwEp7486g39dzlv+pC1fmgXkyKW9o6fI6yuO7Zi
	 KJWXqw++Ejd+A==
Date: Tue, 5 Mar 2024 17:24:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, guoren@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/7] riscv: dts: add initial canmv-k230 and k230-evb
 dts
Message-ID: <20240305-ripcord-engraving-af3310d62a67@spud>
References: <mhng-f1aa91d4-211f-4eb4-a94d-a9d88b0d3f6a@palmer-ri-x1c9>
 <7A86D933-B85F-4B29-8D6D-AB414A42AC06@cyyself.name>
 <tencent_B2C1146D4947315C8018AE90EDC64F3E6207@qq.com>
 <20240305-shorten-disallow-eae65fdc8fdb@spud>
 <tencent_3638D6E106C784859837E6F3C10BDA688F0A@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_3638D6E106C784859837E6F3C10BDA688F0A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_092501_301674_FE91B387 
X-CRM114-Status: GOOD (  11.25  )
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
Content-Type: multipart/mixed; boundary="===============1034167433524501734=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1034167433524501734==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vhZQxYF104MnbLU5"
Content-Disposition: inline


--vhZQxYF104MnbLU5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2024 at 01:17:29AM +0800, Yangyu Chen wrote:
> > On Mar 6, 2024, at 01:01, Conor Dooley <conor@kernel.org> wrote:
> > On Wed, Mar 06, 2024 at 12:37:16AM +0800, Yangyu Chen wrote:

> >>> Link: https://github.com/cyyself/opensbi/commit/b113c1c01d700314a4a69=
6297ec09031a9399354
> >>>=20
> >>> Furthermore, I wonder whether a CPU node like this would be acceptabl=
e.
> >>> I don't have any other details of how another CPU from K230 SoC works=
 on
> >>> Linux.
> >=20
> > A CPU node like what? It is not clear to me.
>=20
> It in the k230.dtsi file. Only has big core there.

The node that is currently there looks fine to me.

--vhZQxYF104MnbLU5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZedVXgAKCRB4tDGHoIJi
0saeAP4pPuYdIfPpajZxYSLmdBJkzM9jXmO55zWBkmcKkm1OrwEAjXqI9zESV97A
Cl7lBRtyzckFGrJKMW1RI+mIFSqnGgg=
=bd1D
-----END PGP SIGNATURE-----

--vhZQxYF104MnbLU5--


--===============1034167433524501734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1034167433524501734==--

