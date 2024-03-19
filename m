Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88B8CD11BF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 16:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEM2GcIORR0vEtLDLqOCHmXuUCuPViiI+gf+PIf9oxk=; b=4PZcaS7SmzbJpHhy3ClrfXZPnX
	M5nakd/Z2Lf8JNyPAs/zzf4+4D40DYgOQ8Cg2iiFXyNu2/gRWXBeVIl+qpm7/LRjGVr3X2DS46BQt
	NqMsbQMXAJdGiS2Os+pHNeEiaq2o7qFReQE9x/MQPJfsoxSYMzhhO3zrssnttQ/jSPmRtOFyxmUPd
	wlO2qsOFwkv41QbHMtCs6AgER4xqRH8xFazqWwHRxxM+98CN01SNvLkSRFUSQ07DUL/UySsUufiZJ
	EUeSq1ElBrA9l2SBa0vXr4fxEus+kzepc59xMFilH/8sqh6nj6nXdkMioVpCEUpV6lXODVsWNiHgW
	KqDAiiMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmc5D-0000000DJ3m-0KSz;
	Tue, 19 Mar 2024 16:12:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmc59-0000000DJ2J-22Jx;
	Tue, 19 Mar 2024 16:12:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 94684CE0B7C;
	Tue, 19 Mar 2024 16:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2E3C433C7;
	Tue, 19 Mar 2024 16:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710864772;
	bh=n2qXWMoeCkOJS/BwlGKgJwulo1yKia2nXcB26Tco4Eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fS/iI66xLgbkeNAN5pXT/MHavsUZHlJWJrxM9/Cz6PO8qthxQK3DE50CaUC8rEy8b
	 G6Qyus/GMX0C1tuzVPxKCjgUuryMQBv9r2f0Dx3VhYjyvZ2pIrSYPGaf/88ETAeYF5
	 1Q6rGFCc7JeLNJFyJCYlgEJDuS9iGDrCnGLtgYu1o+g0trpLEfhtU+K3hXPJuSi/Dt
	 Ds/pt6YJDqHQEEd3QZNLsaKFcoHqzGpaIe+Ul8XDKeuQuJmuf4d0WhEPiN+TfbmPXb
	 3LRhadErX06Kg+LTHrfBSaYoJkZPwIiI4xyY0FF/zaZEpWy78sL0HSjgxjqoPQg+Qu
	 STIotzrm9iL3g==
Date: Tue, 19 Mar 2024 16:12:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] perf: starfive: fix 64-bit only COMPILE_TEST condition
Message-ID: <20240319-epiphany-septic-03748fb30053@spud>
References: <20240318-emphatic-rally-f177a4fe1bdc@spud>
 <20240319155616.GC2901@willie-the-truck>
MIME-Version: 1.0
In-Reply-To: <20240319155616.GC2901@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_091255_721252_E22C9EFB 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7277122254276895358=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7277122254276895358==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VFAH5IhLrRb5l3FF"
Content-Disposition: inline


--VFAH5IhLrRb5l3FF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 19, 2024 at 03:56:16PM +0000, Will Deacon wrote:

> Thanks guys, I don't know what a starfive is so sorry for not spotting
> this when I noticed the build failure on arm64.

It's a bit like a starfish, I guess you've seen them in sealife? Or
maybe some David Attenborough show?


--VFAH5IhLrRb5l3FF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfm5gAAKCRB4tDGHoIJi
0ioAAQCCulfVe9n5+VRjncvGVg9s9dox2FwgXGGQB0L38SBNVAD/czFRewZa5BRz
4pOHsrnsPQE5Ml9Juci3eca+Zi12sAM=
=rflW
-----END PGP SIGNATURE-----

--VFAH5IhLrRb5l3FF--


--===============7277122254276895358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7277122254276895358==--

