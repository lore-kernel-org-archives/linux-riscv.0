Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB42DC71141
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Jun 2025 11:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V++ox8wennn+RTX62fSMTdLTkapZT3c7QNLo4FOLmPw=; b=A8QmHL40/oaK17CVzLIPsxtBHR
	kbluuzlRvgFfYgCYeK4BFnW/zx+MTqDQ3xuAhdiryNoSs7mqgWMSgPVIP9FW3hov1i2GAP6TTXDRB
	vrdiNfP5YRoU+fQptbN6ZZ0mU8DHy0E7ApkuN3/b7WoR9fFf8V230TavEUzddjAKnWYSfibzTm3Qb
	aT4A2+md2tL37PvH+scMdR9zR0TExjXuSsPG8qTiB8GYvUx/IUoEQUjEdxTiQNmWI8s9sZ9eZemKK
	+4YlwKoOgvJdbrGzbie/H08genKTGIVzlSPcmyi9eO9KxggOc6uRJKArCbh/LCLuxgnX5y5BRP8w4
	nkR0VFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQOfb-00000001A5U-1p6C;
	Sat, 14 Jun 2025 11:03:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQOfZ-00000001A4t-1MqF
	for linux-riscv@lists.infradead.org;
	Sat, 14 Jun 2025 11:03:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E1932A5011F;
	Sat, 14 Jun 2025 11:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB71C4CEEB;
	Sat, 14 Jun 2025 11:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749899007;
	bh=18IwSRhnqZmKBa7nklK7g3Eh68Nn59c5ZTIG5pz9m1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hVsgEuDqGyeGk7BOFi4un22Jvhx4ccDdH2sf7JvodleM3pjLgauFvrYWWmQklm/Ql
	 vOwQTm6VcIxqYA+R+uwsu3VKdOfpr3I65WUvdcvqHpOC2sy7McJVNEmDatsVSTXeiT
	 SZwxBrbzt3y/BbdSSSbWsu0gT7yPIfxlBhWI7Ti+alZU+PKKdpPDRYJBrKrEDYX7pG
	 /gtFZieo+uEX/I3o0Ianggap9LYITmm4BHRXIEbgWt4gMpm++gJ2WRLWVNkBBgtEA5
	 q5pLzR5IGg3gyhUspRpuXY+j3QVmj4ikluqXlXP95oOKjTFhNakT/6b84ByVzrnavV
	 jIFRp7xLl+5XA==
Date: Sat, 14 Jun 2025 12:03:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] regulator: spacemit: support SpacemiT P1 regulators
Message-ID: <5f5fa2ae-71fc-47ba-92df-55527a205852@sirena.org.uk>
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-4-elder@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20250613210150.1468845-4-elder@riscstar.com>
X-Cookie: No shirt, no shoes, no service.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_040329_431920_346668B5 
X-CRM114-Status: UNSURE (   7.71  )
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
Content-Type: multipart/mixed; boundary="===============2741342174711239624=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2741342174711239624==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FPu5nkAwTEiJx2uI"
Content-Disposition: inline


--FPu5nkAwTEiJx2uI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 13, 2025 at 04:01:46PM -0500, Alex Elder wrote:
> Add support for the regulators found in the SpacemiT P1 PMIC.  This
> PMIC provides six buck converters and 12 LDO regulators.

Reviewed-by: Mark Brown <broonie@kernel.org>

--FPu5nkAwTEiJx2uI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhNVvcACgkQJNaLcl1U
h9D9tAf/Q/qleDrKAxcEMJ4rfXBXkcMfaDK+fhlhkjlAxajFjSo701EEi9YR7oas
x9Js/LoTN5IvcDRfiEw9OYRVTTOlvT2EA0pg7i5LGc3CsWRNL0lJYaUu6Z7pXxDd
youdV7deDCb2ljz3D/tHtRNqGTqKvMQ7Nuu5s175LFoKcaRn/ATl34Py1Go7yxay
+CR+e3eXVeVePEuTJGk0kiTUiBJXUVpxKDucNrEK1QHSjO+aUvrQpbZPPm3NBb5M
huwMAGNqIYXljQ5T52V0NmWK9CatoW2JuO/F5kyK2n609qpN6Mauh/quV/l3uUNj
hd79yHgaelMLgAmraTLa3gGwUwQVdA==
=QoFc
-----END PGP SIGNATURE-----

--FPu5nkAwTEiJx2uI--


--===============2741342174711239624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2741342174711239624==--

