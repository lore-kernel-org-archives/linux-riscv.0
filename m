Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F8DD3DEA2
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2024 17:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JGk3H63TVErdoAN3zymJTDZhFKJoChekwHLEv+iMcQ=; b=dqyPQMa7arQP8gznVbffQJ3FzG
	ilgu5PfJ6uKjdQ3ZCaXu1BoqQaSNIQ/2DelxmYEWaeokRaCPGhloQvCgqPENIJf3vxQ/KtRxDf7Up
	Zcd7MOHtDBqBSg5tNNXnVceOxUfqDUYgCQXtv0zl75+/yt631t9HYfcTU7DOvOY5mWWjxRIH+up1t
	M3YN292gSlV+vm/kV3O57KoG4XjGdbmcFDTJ5gm8gOnBjPhd4dJKRHAMtEUa347lUWmWWGt291dq8
	giqDtANYVHUygUMN+FtI7v59MSjUy1cayfbM3oy0ljUC9eO91wIBDoh7JXYL8D4JtJbb3+TX4T9jl
	VzwKbmVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1qiL-00000001Tgl-1Tm1;
	Fri, 18 Oct 2024 17:24:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1qiI-00000001TcM-1Swq
	for linux-riscv@lists.infradead.org;
	Fri, 18 Oct 2024 17:24:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 685575C0669;
	Fri, 18 Oct 2024 17:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68027C4CEC3;
	Fri, 18 Oct 2024 17:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729272267;
	bh=UGHLHISoYwkqg+DTIVYr4W8oQySlGfFRFD1iqVqMmgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XiBvq8X7aIa0wZEWnG/9imW3rNMoM6AJo0UhETW/fgSaW8EaqNGfJCntNSIQrsReO
	 JSNj3OexlaByHpKtwhxXbFDV1I33PU5PWz5LhGMZkQAvZxGEU23oIhm8twSpKtlaB/
	 t/6fkMSyc8wjjpd+h764qieoaaDF0l37y/M0WS0hrVGx5YCU0olkg1YfYj1YJhNBDO
	 Z4nL7nbKVrq/QHj/HMfECa6WrWmKFJGHrxXAC66B1Nw+Y+P2ywkU7srntwn7plX1q9
	 sOzbCha4EPrri8fLbMYgitYicSvH9ide2QPRmPgtq/Yfzr0HN51UiPFdIETO9LbvcK
	 f2O/YItJs4/4w==
Date: Fri, 18 Oct 2024 18:24:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v5 00/10] riscv: add initial support for SpacemiT K1
Message-ID: <20241018-drapery-stable-cc31a97cda90@spud>
References: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
 <mhng-5bc45db9-5deb-4db6-8733-561768b2968c@palmer-ri-x1c9>
 <20240917-spoilage-nimble-a8303fd04482@squawk>
MIME-Version: 1.0
In-Reply-To: <20240917-spoilage-nimble-a8303fd04482@squawk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_102434_503846_055DD125 
X-CRM114-Status: GOOD (  18.07  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, Haylen Chu <heylenay@4d2.org>, dlan@gentoo.org, devicetree@vger.kernel.org, Troy Mitchell <troymitchell988@gmail.com>, anup@brainfault.org, matthias.bgg@kernel.org, Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, Jesse T <mr.bossman075@gmail.com>, samuel.holland@sifive.com, cyy@cyyself.name, inochiama@outlook.com, Paul Walmsley <paul.walmsley@sifive.com>, kevin.z.m@hotmail.com, krzk+dt@kernel.org, linux-riscv@lists.infradead.org, zhangmeng.kevin@spacemit.com
Content-Type: multipart/mixed; boundary="===============5003974946361378091=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5003974946361378091==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zVmVDX70lgniahsX"
Content-Disposition: inline


--zVmVDX70lgniahsX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 10:08:03PM +0100, Conor Dooley wrote:
> In other news, nobody has really made an "official" statement about who
> is going to maintain this particular platform. People have expressed
> interest (including the submitter of the series, IIRC) but there's no
> MAINTAINERS entry added here AFAICT. I used to have an entry that
> covered arch/riscv/boot/dts/*, with exclusions for sunxi and renesas,
> but with Drew taking on thead and sophgo being the res=E3=81=BDonsibility=
 of
> Chen Wang and Inochi, I no longer have that wildcard.
>=20
> I'm happy to apply patches for the platform if noone else is interested
> in that side of things, provided there are willing reviewers, but I
> would much rather that someone else took up the responsibility of
> applying patches and sending PRs - and of course I am happy to help
> whoever that is with the process.

On second thoughts (and on a second opinion) I am not actually willing
to apply patches for this platform, since it isn't sustainable to take
on each and every platform that there's no maintainer for.

+CC a few more people that have been involved in the platform.

Yixun Lan, you're kinda the "prime" person to maintain the platform
since you're the one who took up the core support work etc. Is
maintaining the platform, maybe with the help of one of the other folks
working on it something you can do?

Mostly the responsibilities are just applying patches for fixes/new
content and sending PRs to the soc maintainers - but knowing what's
right or not obviously requires familiarity with the platform which
people that work on it are best placed to do. Myself and the soc
maintainers will help if whoever does this runs into any trouble.
There is some documentation here https://docs.kernel.org/process/maintainer=
-soc.html
that will assist somewhat with getting up to speed with the process
also.

Cheers,
Conor.

--zVmVDX70lgniahsX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxKZxQAKCRB4tDGHoIJi
0lfFAP9yFxHQOJ/OkaYQK8k/a0PV/yBA+uo7ifvmKP3Ead3A/QEA9gcX6Ab7ArzU
mZJ8lU8o6rziz2CihRSyejYXShCi7wE=
=vT0s
-----END PGP SIGNATURE-----

--zVmVDX70lgniahsX--


--===============5003974946361378091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5003974946361378091==--

