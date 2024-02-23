Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58125C54E49
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 11:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJOiIQi3LMVZqIDn7hsocXVZ2R60V5Fe9vUu4jtXolY=; b=40SnpcC1TkPmmhxRgApJB7lyUz
	wrkZYqouY9JIzukKO9+w9Au19RGskgjpKH9OxOhNWyeJ6w65TdAqdufTzhOUp6v07HdsPdpkjtLS8
	Ohm1sKH8rtQmEWWhwvaLVEg9Uy53AZMN5o95a2Jtl9SFKpPpHxAWg5do6Z0JhDAPGrjNvGVqa9IB/
	AOLN8W8IJoR4dBF8WfJIyAitE4eaV2OvhDafgglR4X7ahq8B1Vi+8zcSCtjL50ihHmzPKbuzDWQ6v
	R7gHhfLyYJBRAb8rEkzbKBB0zqFUPsAP7Knxv6Fkx0W9/HXRSuNMhGxqnPcmibaxtFcWxe0kQ6ezf
	5WaOMFRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdTuX-00000009ASX-1Jdv;
	Fri, 23 Feb 2024 11:40:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdTtl-00000009A9i-300r
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 11:39:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D3540CE2301;
	Fri, 23 Feb 2024 11:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 135CFC433C7;
	Fri, 23 Feb 2024 11:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708688355;
	bh=W1EZlzIrLFHKafLcbOnnHszzlaYoezY3kK+xhHhq64I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aJc0hWRqnYwibP/uyaZ7etm2qnhJct/f568CwQewP0Nj4B3GHIPmPAD+4pO8ae23s
	 1DvwoKw4TXi8tFLE9+NJvZXl0wNAdrDS1toPC8Nx/WHrvpYoyeLGymEgI5bjsPtejU
	 akXSGAsIFIMzt1JSfxqdj++8Op8hOOEreZNQeRYxJviBE1FzdjUHkm4CA6F/oOyQCg
	 IxDMM/uRLag2XNyXjU93buJEz7tE1R61sn4Q9OZ9Fupq/as8gzOpVfAiFyzpucXv24
	 1PBH/biuAHCUrH8ytb4A894hIuXa0pRbh+SnLcwvRVY/BriA9ZriGGJJnaSEH74ikt
	 Bgkb1Gs07qxQQ==
Date: Fri, 23 Feb 2024 11:39:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] riscv: dts: Allow BUILTIN_DTB for all socs
Message-ID: <20240223-amino-barbell-59214fa9aa95@spud>
References: <tencent_AB625442CC1BCFF86E04D7B5891C43719109@qq.com>
 <20240221-islamic-quartered-3863e44bc862@spud>
 <tencent_DF3D7C2E8248DA188E3FB8DF31FE21478D08@qq.com>
 <20240222-crawlers-prankish-ecf425d1f0b5@spud>
 <tencent_AF1B1DF96C041FB57D1C4770356254431E09@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_AF1B1DF96C041FB57D1C4770356254431E09@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_033926_777561_C3F533FB 
X-CRM114-Status: GOOD (  19.25  )
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
Content-Type: multipart/mixed; boundary="===============6502404152816442551=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6502404152816442551==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YWxBLTxQFvyXO2f2"
Content-Disposition: inline


--YWxBLTxQFvyXO2f2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 03:42:01PM +0800, Yangyu Chen wrote:
> To sum up, I agree with the reasons to refuse it for debugging purposes. I
> am wondering what to do next. After reviewing the code carefully, I found
> this feature not only for K210 but also for other SoCs. But for other SoC=
s,
> it is broken as it will link multiple dtbs to the kernel, but the kernel
> will always pick up the first dtb to use as discussed on this thread [2].
> That is because SOC_BUILTIN_DTB_DECLARE is removed from this patch [3] th=
en
> no code to select for multiple dtbs now. And makefiles on other soc which=
 is
> on the mainline kernel currently will build every dtb object file from th=
is
> patch [4]. So this feature for other SoCs is broken now.
>=20
> Choices might be one of the following:
>=20
> 1. Remove BUILTIN_DTB feature if K210 support get removed
> 2. Continue to add this feature to get this work for other socs
>=20
> I prefer to continue to get this feature to work. Not only for my debuggi=
ng
> purposes but also for fixes.

My email might have been a bit unclear because I responded to things out
of order. My final thoughts were that we should apply a v2 (or 3 etc) of
this patch if for no other reason than fixing BUILTIN_DTB. I could not
really justify refusing your changes when a patch fixing BUILTIN_DTB for
the non-k210 platforms that support it would look almost identical to
this patch. Apologies if you misunderstood.

I left some comments on the patch itself with a v2 in mind.

Thanks,
Conor.

--YWxBLTxQFvyXO2f2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdiD3gAKCRB4tDGHoIJi
0ix7AP4yMMgNUyiA1o4UrMBOtHcThn4TBnzGlxw++LdHRXz5dQD/X0dO6ukK7Mq+
8u/+x6VnQEcRzl+/0IyWAT/pD/FS8ws=
=7EAC
-----END PGP SIGNATURE-----

--YWxBLTxQFvyXO2f2--


--===============6502404152816442551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6502404152816442551==--

