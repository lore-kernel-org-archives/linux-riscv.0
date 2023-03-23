Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7329C76195
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 20:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mr/QTG+NRIbYsMcVO8bvuShpNw2tzy4tYFf5n336IuI=; b=Tcv7yjbIbkEUDWZfg+WZKFWAqY
	hlnpHplf8hzrzxXcLPGS8dqhSSbhWZabZJkZ17s6i8kSQIywNF2L5QHm2FCb1dR+ew4s2LDouuLkV
	JJd/5XDiogDagkBMFnV9YTk2uV5brI2RNsjNVjwWi3ciretQas8b3w3z/yg0VxAYi9rklOnCfNJpi
	TErnCUZKyQm/y8SfJGTT3AtSH9bIBnlo9fxXcypiHwMl0e41uubYA7r4N5qxRGMY8/rwdoZTcmlsx
	DCC9loeoNdD15TlimsAD6RmU5KxH1bmd7yOJs9ctQoJ6AU+Nbmk6oJH3InPO0wNEgcNa3dGltzSnh
	MnRH+ytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfRyS-002xhm-1Y;
	Thu, 23 Mar 2023 20:55:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfRyP-002xh7-2R
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 20:55:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B627B628B1;
	Thu, 23 Mar 2023 20:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CC3C433D2;
	Thu, 23 Mar 2023 20:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679604948;
	bh=Se9iqlkm2NlxhGRw5dLuisre2BWhBSGH+XXtTwkAW3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9av95IdebW97uXMjuuWaSOU9+6s38liLw9eop0O6YtYu5U7+ayny1NdQmV2hpXjK
	 cxqgRn3/eYQ+BHORHBGICPS+AEhYRpItj4NwWQxXNiFP2beFmUBxNBFvYhL6LMaAmg
	 w+5naHUi3Nzm1jfibt4mYXrfvUCsFmRZxOtbqVjBD62M5GQPGLWt/MXW3d1OzHM2Es
	 GaPfGO7/7Efp4SIl/X8b82fbjuzb4SmoE2Xm/aTHuDZaJVB8OdVY5W5k7cttiw1m/e
	 qRHejOOSGc+h8wqWf68TXgzrpaO+izAWhcf44cEV+em6vK/JIo/z2B3240WyNbbHI9
	 CJFQ95Mij9GKA==
Date: Thu, 23 Mar 2023 20:55:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: nathan@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, Conor Dooley <conor.dooley@microchip.com>,
	ndesaulniers@google.com, trix@redhat.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: b4 send (was Re: [PATCH] riscv: Handle zicsr/zifencei issues between
 clang and binutils)
Message-ID: <754a6cf4-cb89-4adb-a5f6-ea5b143af921@spud>
References: <20230313-riscv-zicsr-zifencei-fiasco-v1-1-dd1b7840a551@kernel.org>
 <mhng-8af569d4-c3a7-4f33-8900-e458f75abf18@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-8af569d4-c3a7-4f33-8900-e458f75abf18@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_135549_851749_0EE2A4FE 
X-CRM114-Status: GOOD (  12.89  )
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
Content-Type: multipart/mixed; boundary="===============6978855221545159844=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6978855221545159844==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wsQ8tM8/Zn6mTV2x"
Content-Disposition: inline


--wsQ8tM8/Zn6mTV2x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 01:49:57PM -0700, Palmer Dabbelt wrote:
> On Mon, 13 Mar 2023 16:00:23 PDT (-0700), nathan@kernel.org wrote:

> > base-commit: eeac8ede17557680855031c6f305ece2378af326
> > change-id: 20230313-riscv-zicsr-zifencei-fiasco-2941caebe7dc
>=20
> Is that a b4 thing?  Having change IDs with names is nice, it's way easier
> to remember what's what when sorting through backports.

It's `b4 send`, for anyone that's lurking on the list and hasn't seen it
before: https://b4.docs.kernel.org/en/latest/contributor/send.html

b4 is now a tool for contributing, not just maintaining, although I'm not
sure that the distro copies of it are recent enough to make use of those
features.


--wsQ8tM8/Zn6mTV2x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBy8zwAKCRB4tDGHoIJi
0oA8AP488Y3vQ6GOyC43ij6dHOgg5qC/tN1d/004eaPVnXcchwD9HD8j4YSanqCw
hajorAxTSD0FUynICmBd3ZaUANbX7Ak=
=t9Wz
-----END PGP SIGNATURE-----

--wsQ8tM8/Zn6mTV2x--


--===============6978855221545159844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6978855221545159844==--

