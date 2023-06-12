Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7E9C88CB2
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 15:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7IYEG+U5ypYkVblrPKeBIzl/rcm9twle0ZiGmhN1H4=; b=wP+ahZegWRfcvFxASTESrrTf6i
	UpvtSpprWAU0WXfNMlFMvafXlkoNu/JU/XLXCynVjbSC7HQMVFd11VWj+ZMZLPBIjVl40V5EtJwCl
	XGacgPus02nNJzB9rfLbYUtU3XFDI+IJ2OwJ8HSsNBHfzOONSzHM5NsknLk3kQoKRHPlR+l5ysQDz
	0+2kMfIjGYErXc+Au77oUPNQbxWWHEbUuDqr1z78mcgvfh6/7H8zGCqOIKBBAzvGcG0oPmEK57rwS
	xY/Qvkq9+w51FXZY9lj6UewglZ+Rp+Z2FzxHZARp8GC5PRmou+QezoADVlm0eTa2wSvc4aAfgRpdA
	bueink1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8jVW-004UCK-0R;
	Mon, 12 Jun 2023 15:31:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8jVT-004UBV-1p
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 15:31:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8970161FB6;
	Mon, 12 Jun 2023 15:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E36C433D2;
	Mon, 12 Jun 2023 15:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686583858;
	bh=aFc6TD3wBbrCfDUAR5RQLktMO2u4XJbJ/nVed90tLXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+ui65KKFX+skDn1ESE21bsAJISKPh2uX01w9QSyXB+vY0a6eeMFG1ihCwn2CCpBT
	 TeiHxt2+MdX0Ra5t86fM5SV2VPw+yToKF1JsbK8BPbR3qLjoXutrxBNSjMc4elFXLl
	 oKXcJUj03u0J6/YAJ+Cfdnuxm1s5OpDxMSQkHdZFfvZEQJHVS2xD9drFeb0Imt3oyT
	 YHPxqSwvyDeQtt78ctdk7SJNygdxZHRMKrkF0cHLVJ2+yQQ2w+H07+InZF4QXOpHG8
	 e/b2FP0qguwkhJz3/rY2f3lHjsxev+wgV19PQjZut8vBHXeiBclExkL3PkCplJiTJN
	 CfvAJXaYqewvg==
Date: Mon, 12 Jun 2023 16:30:54 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next v21 20/27] riscv: hwcap: change ELF_HWCAP to a
 function
Message-ID: <20230612-walrus-trickster-c49072f0d3e5@spud>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
 <20230605110724.21391-21-andy.chiu@sifive.com>
 <20230605-embattled-navigator-408a7b60b2ab@spud>
 <2311672.PxeS7tEIvr@basile.remlab.net>
MIME-Version: 1.0
In-Reply-To: <2311672.PxeS7tEIvr@basile.remlab.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_083059_663503_14655C85 
X-CRM114-Status: GOOD (  20.12  )
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
Content-Type: multipart/mixed; boundary="===============4989010954411265487=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4989010954411265487==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sUHAfzovr5A8SJS8"
Content-Disposition: inline


--sUHAfzovr5A8SJS8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 05:36:32PM +0300, R=E9mi Denis-Courmont wrote:
> Le maanantaina 5. kes=E4kuuta 2023, 19.24.53 EEST Conor Dooley a =E9crit :
> > On Mon, Jun 05, 2023 at 11:07:17AM +0000, Andy Chiu wrote:
> > > Using a function is flexible to represent ELF_HWCAP. So the kernel may
> > > encode hwcap reflecting supported hardware features just at the momen=
t of
> > > the start of each program.
> > >=20
> > > This will be helpful when we introduce prctl/sysctl interface to cont=
rol
> > > per-process availability of Vector extension in following patches.
> > > Programs started with V disabled should see V masked off in theirs
> > > ELF_HWCAP.
> >=20
> > For the uninformed, like myself, this needs to be a function, rather
> > than open coding the masking of the V bit at the one user of ELF_HWCAP
> > this series adds, because the binfmt stuff needs to get the value in
> > create_elf_fdpic_tables() & co?
>=20
> No, this is to deal with existing userspace that expects vectors to "just=
=20
> work" when the V bit is set (e.g. FFmpeg 6.0).

Is that not what create_elf_fdpic_tables() & its ilk do? Inform
userspace of whether the V bit is set?

Cheers,
Conor.

--sUHAfzovr5A8SJS8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIc6LgAKCRB4tDGHoIJi
0pqrAP9m83XVSHg8I6stGwWqYmNzT+hIP3B9Yvt9r1mZbLvnDQEAjvVerH3N2/9Y
cZBzSr1r543GHFACdMcXugWT8KVjJQI=
=JT4d
-----END PGP SIGNATURE-----

--sUHAfzovr5A8SJS8--


--===============4989010954411265487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4989010954411265487==--

