Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D764EE498E
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 17:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hDHk0nlr7cdBZe0lELc9hu8rOxa5/BM5mG4SMozUek=; b=VMTMGbpBvoU/nZYgF/2LPfY+Ob
	xfGQBdfz7nHuei6dM5hCKVZIRKPR8uWE8WrwY7GNEoWVsgy1/H/O3ogI57t91s4f7/OTmGggacupF
	m0hfogIbhRxcIisQUy88m9LEKsBtfsX1UUkZIpz1oxnT/9f1KXAoW/6vvMELpmAZP1ThmC14ICUed
	BxHJe8CUlejAG04dU2mrfWUI21nxqSHPE+C/dEZnehhyS2O67wBkRWytcio/b3uSS4uPWTAbRKyHh
	B+nUwhMeVbRBVfhs94jEILPIGFocpSPfJjHv6KCCFzf2eaQft0dcOPXVAGt9rWlu1MH/GFNTYCQ/t
	WaaIBmdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadsN-000000059IZ-1Sdv;
	Tue, 30 Dec 2025 17:51:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadsK-000000059IE-07DT
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 17:51:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FCCC43BD0;
	Tue, 30 Dec 2025 17:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2796CC4CEFB;
	Tue, 30 Dec 2025 17:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767117075;
	bh=+Jm5gOiNRo3DlkTtBRRBzyfiYFIqCwnDf+QqaHtlzjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=psHGBGa5aBiCXjFvO7o2uMCWg2NzyFa4lgJxvt86I26/VLlQBB3t78dxY7xVMNe6J
	 TRAUBuKUpPsoM77UV2/tijok0lkoPKZvz9NORGbr/W22gOhGpaVL1C2e4OconegBvL
	 DAPspdRYl5Uz2nTYMkDiceJhjluRcPKoDhwlrTM90IJ6hhaZ6X3BnrodUs6yj2pcVH
	 +Ru8dy/Saem1iYvbx5nmiQmI3R7m7XOLVZ3jmGMO+jnl/LHYe2250ZutlN2v5EG9Br
	 D/ICxZBlKIrrI5aBunjW7Xt9Y+osGv0xQgjvYMs4V5LHJsXNxkodmQ6FJXb+z0V4O7
	 qGdZsKUgPovrQ==
Date: Tue, 30 Dec 2025 17:51:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: cyy@cyyself.name, kingxukai@zohomail.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] riscv: dts: Correct the formatting issues about k230
 dts
Message-ID: <20251230-married-spew-28b59d6b6dbc@spud>
References: <20251227092355.42825-1-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20251227092355.42825-1-jiayu.riscv@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_095116_107967_519A6EBB 
X-CRM114-Status: GOOD (  13.06  )
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
Content-Type: multipart/mixed; boundary="===============6214205906180950412=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6214205906180950412==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Fzs99Tn71rtjzI/i"
Content-Disposition: inline


--Fzs99Tn71rtjzI/i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 27, 2025 at 05:23:54PM +0800, Jiayu Du wrote:
> Correct the errors in the spacing format, and move the aliases from
> the SoC's dtsi to the board's dts, since it's more standard.
>=20
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>=20
> This patch is based on this initial support for Canaan Kendryte K230
> series v6[1], and it is used to fix the [PATCH v6 10/11] of that series.
> Although the latest version is v8, this problem still persists.
> And this patch hasn't been merged into Conor's branch yet.
>=20
> [1]: https://lore.kernel.org/all/tencent_DF5D7CD182AFDA188E0FB80E314A2103=
8D08@qq.com/
>=20
> Thanks for your time and review.

I put this on my k230-basic branch, thank you!

--Fzs99Tn71rtjzI/i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaVQRDwAKCRB4tDGHoIJi
0k/SAQC9z3rg63r/0gCH1jWIGTOh0S3bKuchIBV85OX9y9h65QEAv8dpF++quR7I
oodym/lgbKw60+ut+6adieLXeIlPmwM=
=u1+t
-----END PGP SIGNATURE-----

--Fzs99Tn71rtjzI/i--


--===============6214205906180950412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6214205906180950412==--

