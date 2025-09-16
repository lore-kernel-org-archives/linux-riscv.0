Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922EFCAC592
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 19:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3w1yRc1tS2ZfRmO8lnVEHsB146Xx/8UZrRyK63byre4=; b=WvmTOoZiFm+scBENhEPAmIDJLS
	++NJ373+AqLeMAJOONlO9AwKhVnHGodO37ByIfLTxdbeu1mbFQSoCgk1IZefLbehIjf7Mlh879kgd
	IiZT14AXVzjeXgDc/cc/PkmLAR16uy2795GNN76n6O3gEK67MwMlW86dGlYOOtILdaCPSqLbvH76G
	HnuzBQWpd8+cK56i/1r2QDaNUc671D2zkbdJ1U7YoY/L+nsY7J3O00gfrN9DUzMi8wvY18tMBsdpW
	cTsUZid1gzjuqYZWS/tCWP28LcFocon3mZrjichee0s47T/dJItuU5Sr+rA+798C8VUGEvE+k0hQh
	kf2lDIww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybRT-00000008sQd-1Xo2;
	Tue, 16 Sep 2025 19:34:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybRS-00000008sQT-45YL
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 19:34:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 196F9601E4;
	Tue, 16 Sep 2025 19:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED8FC4CEEB;
	Tue, 16 Sep 2025 19:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758051257;
	bh=QgN0tp5+BnqROHw9FXVqQqC/BdaT6YsmUWPyx8F9M30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d2hr0L+H3wxrcQZIUsuKqZsZWLrrHlmNQ1AAvyCZTvqcbG5G349TozInbMZk+K2cA
	 tQsNximPD64tdqmQFTjVg0ONSCSbIGFiBcHxS9BxL+KHsm1KMArXtHWAr6hbEPZhKC
	 RhTXUHnhxhEOx9DaYGTMmCB67HjP2IQQlGZxzMaS1Tlo1880FAVtQngbHydIRgR8Wu
	 6pkZx1YaAFQd5Hx8Qxf26Sw/IdSNHCupAYhLpjFq9vGvNqS86VzhXHE0HAYrhBiE1o
	 ADOrSwwOjqHx+zLF3lk8ar1axaBU/alChU7qPUgSYwlp8usKHldPTv6UL8PQYZ5usH
	 kYtaP4FvBdKGA==
Date: Tue, 16 Sep 2025 20:34:13 +0100
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v3 0/5] riscv: dts: starfive: Add Milk-V Mars CM (Lite)
 SoM
Message-ID: <20250916-retired-unloaded-fd141b2a12a0@spud>
References: <20250905144011.928332-1-e@freeshell.de>
 <20250911-smoked-aviation-b514261e547e@spud>
MIME-Version: 1.0
In-Reply-To: <20250911-smoked-aviation-b514261e547e@spud>
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
Content-Type: multipart/mixed; boundary="===============8195057806558889664=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8195057806558889664==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ruQ4PJfRzjetgeGw"
Content-Disposition: inline


--ruQ4PJfRzjetgeGw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 11, 2025 at 07:07:10PM +0100, Conor Dooley wrote:
> Emil, This look okay to take?

I'm just going to take it so it can make 6.18. Please yell Emil if you
don't want me to.

--ruQ4PJfRzjetgeGw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMm7tQAKCRB4tDGHoIJi
0nMMAPsGxNydWe0mP+15KraqnLZrrZxrsZJlFeeqeonAZ3VLTgEAnIwLs7kafDth
bWJ3osir+X20IMY6ZeJLkAmDemJotQ4=
=d0iP
-----END PGP SIGNATURE-----

--ruQ4PJfRzjetgeGw--


--===============8195057806558889664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8195057806558889664==--

