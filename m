Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B71F9EDFC
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 15:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CKIKDSClaFdZ26TwuSjR50h0b9I2//LDI64mZP9VRk=; b=1wJnTTrvbKzyB0Xvda3YY85e4Q
	irWDD4etynHtYAA4/u7vvd6KoK8hKof5VTRGt6at/KKHdqrKqorrkRt87CwWLaZzXk9w29mSPf3H/
	8b4xvylVXaymZzh+iMCEQBz2v8HdF6Q6nqv1BkQXS0ipgMWgHGQTjCm0+CgO/1Ithsuit7L6TtD5M
	hUDegWYO0BSO/QhWmDk0jNNbXVIowEdrpgcVF2UqK/jny89Mii8AFCVqkXIZjFd3/xlf84t/vPI6Y
	HlnjRLkjUOnDRaE8ZXG7qUmM8Xhgt7XySEjjwbf20QVyeHHRH0WlPtFXJ6gZ4tkNOduiCL2my0dhh
	jUZPyXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZSY-0000000ARDs-1MMX;
	Wed, 22 Apr 2026 15:25:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZSW-0000000ARDl-41zx
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 15:25:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D766F6012A;
	Wed, 22 Apr 2026 15:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC580C19425;
	Wed, 22 Apr 2026 15:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776871547;
	bh=aMlrrUyOX0cvuGWjVkklmW7RDBv8g+60XkATJKTZ6Ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NNfmcNy/FDFpxfymrcrND0xXYR9gtNJ/9j9fb50DzWC5/6WuqjSeu9z6WX4ZsLPrS
	 9lCXsBSXowSNXq9GEY0mPVh7tT3Di+OJ1r9ZZz/rCJpMbmqVgCCLqCCWazAb1hJLG+
	 YurNPTy7KyxkD+kSahAe8FcXwVjystMTEpnUDWGASt5Xb4Fk8a971zWOCOjC8/bVwL
	 pGcTJJIsX28xKHDFyelqNzvU12WtmhrpKdGPixb/nfAvEYAFIAk9+ostx06Cy0v4N3
	 0HMP7QTYd7WjlNtWFy1iBzjRTdjXYmfN5oULVPh0FbVkw3yLDf3zc0vQzBbEbOa/ZF
	 Fkem21I3OL7MQ==
Date: Wed, 22 Apr 2026 16:25:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/5] microchip core-qspi gpio-cs fixes + cleanup
Message-ID: <8cb49ccb-5a12-4770-9c91-982d78b5f962@sirena.org.uk>
References: <20260422-foe-strength-a5d8ad650ef4@spud>
MIME-Version: 1.0
In-Reply-To: <20260422-foe-strength-a5d8ad650ef4@spud>
X-Cookie: I'm definitely not in Omaha!
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
Content-Type: multipart/mixed; boundary="===============8120982268951832179=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8120982268951832179==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="awxln/TzuFuxsLHe"
Content-Disposition: inline


--awxln/TzuFuxsLHe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 22, 2026 at 04:15:41PM +0100, Conor Dooley wrote:

> Got a couple of patches here, the first two deal with an issue that a
> customer reported where using a mixed configuration of the built-in chip
> select and a gpio lead to data corruption. Turned out, the built-in chip
> select always gets activated at the moment even if a gpio-cs is being
> used. With that fixed, I noticed that any read with multiple data lines
> was not working properly, so patch two changes how the driver deals with
> emulating mem-ops. The remaining patches are things I consider fixes but
> not meaningful enough to get a Fixes tag. LMK if you want em split out
> to be put on for-next rather than for-current.

I don't know what for-current is but they certainly don't apply against
for-7.1 which is the only active branch given that v7.0 released (and he
same content as for-linus and for-next as a result).  It would be
convenient to split the fixes and cleanups, unless there's actul
dependencies.

--awxln/TzuFuxsLHe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmno6HYACgkQJNaLcl1U
h9B86Qf/V9GcW6oanTDK17DKwmwH+tLOxf0nGVwAAVGO9jCTJmYyo6m8c7/S+btu
WXdafAl6ZQ1UOJ8MzDxH1t9JRlLX4RnvTOmQrO2FaIGLPbiRx7Kdw5zX7B4ryTbg
4181Bk0uQhb9KzqLM3SbVNfEtfxzsRNon9bDGjE61oD6cD9AZMsXwrXMIUitom8s
PiYM/CDRBzNQtC04X/aZAopDFXVTrDZypMfKKP7S1egHc+kh882XRr3q7iqVoc7Z
y2OpxW2qsztgQA3IT0++6RXZFeESx8GsetUWYZhjNGna8JiY6wYsx0ZskMRlhpxn
w2de4FtpDWoJW0OMyG9Fc3OsM+CdYQ==
=7M4C
-----END PGP SIGNATURE-----

--awxln/TzuFuxsLHe--


--===============8120982268951832179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8120982268951832179==--

