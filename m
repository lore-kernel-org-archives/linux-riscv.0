Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FC2C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 12:39:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E95D360EBB
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 12:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E95D360EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ITBwsgedIxLf+RR8j8cN+/qgCd8aBCE8hzTwCsnNMQ=; b=rvlJQILDQUZRIzRg96R8tAuVz0
	h5fQfgGHzg1WZUSyKiLWCdyHwZ9fdlLWEap3PxJc7egV3UZFE07Yip2hilS/OUibrvzB81E0aF43T
	+zAg5KWD07EQJJ+Jm0rVZcm6kjy/A+2vcbJ905xRida2TWyEw11VS3l789H7xcTlmt2e81pvz/YXi
	QaODNyLNVSdTxGqTR+nHqHTv48Oe/hGEnwaFNE4lBGPMGf7b8OTRa9imGZxkEbR3Mgd0QMh0IY0Wj
	axCaexELlNCWadvFryrbGOmVD9yYNmN7ez2jBfPxD/xi0LxGBoTbnr5L9HKOTVPCuGRG4sVGuwEsW
	hKdZ1qPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1madXc-00GcP8-OU; Wed, 13 Oct 2021 12:39:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1macFc-00GFjN-9l; Wed, 13 Oct 2021 11:16:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7452F61027;
 Wed, 13 Oct 2021 11:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634123807;
 bh=DVdgBtdPRXpir9rR8KgPam2ARjHEMD012OTknqLNbjw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rnXG8Z9k/uF0L6NF73nRzeQsFcHjBgaZOzOdJneY7E0pQbUpG5/pnT1PjUOeK4Xqe
 yfl+INzevN80njuoRYY13XKkX807gQwP6dEhYtOB2a85bAmR9Eiab3pZJ++4GQokL2
 +OaiITlSFd+p/mVgYV+BlzcXaJ9uMM6wrd63aBe+FD8tTzrfwt0DpzNiTnBnP/tUZN
 T1ON3PoIJUX+aNA5WG7qSbER2LOllGHlaTUuIqXGk3Sv94IR9eKKM5JDO82rq3NAVz
 L0PHWRf2/bnDp5h022hCMvk6DzRrbswTMPbSrIRkSBhBY7xgrh9+REuFqGRTUTExBS
 Vk/0EWOQe4pmQ==
Date: Wed, 13 Oct 2021 12:16:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Will Deacon <will@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, tsbogend@alpha.franken.de,
 James.Bottomley@hansenpartnership.com, deller@gmx.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 geert+renesas@glider.be, linus.walleij@linaro.org,
 rmk+kernel@armlinux.org.uk, akpm@linux-foundation.org,
 anshuman.khandual@arm.com, rppt@kernel.org, ardb@kernel.org,
 u.kleine-koenig@pengutronix.de, lukas.bulwahn@gmail.com,
 mark.rutland@arm.com, wangkefeng.wang@huawei.com, slyfox@gentoo.org,
 axboe@kernel.dk, rientjes@google.com, dan.j.williams@intel.com,
 gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 5.14 17/17] firmware: include
 drivers/firmware/Kconfig unconditionally
Message-ID: <YWbAHCYS/IsGyeEw@sirena.org.uk>
References: <20211013005441.699846-1-sashal@kernel.org>
 <20211013005441.699846-17-sashal@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211013005441.699846-17-sashal@kernel.org>
X-Cookie: Where do you think you're going today?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_041648_397130_590670CB 
X-CRM114-Status: UNSURE (   8.78  )
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
Content-Type: multipart/mixed; boundary="===============1493741132623352301=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1493741132623352301==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hzj7Ij7mixgewbmh"
Content-Disposition: inline


--Hzj7Ij7mixgewbmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 12, 2021 at 08:54:41PM -0400, Sasha Levin wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> [ Upstream commit 951cd3a0866d29cb9c01ebc1d9c17590e598226e ]
>=20
> Compile-testing drivers that require access to a firmware layer
> fails when that firmware symbol is unavailable. This happened
> twice this week:

This seems *way* too invasive a change for stable.  It exposes code to
building on entire new architectures.

--Hzj7Ij7mixgewbmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFmwBsACgkQJNaLcl1U
h9AFjgf9HNz1iDlvraGZuINQkg4b76glybMJpIJI9Q9/fCTbm75p34EctvP3YnrO
TCUYnuynKAfFn6bLAoHN4AO5JLYPELiK1jd3olKo4QbWgHL449nF7NwkBR/bjHNZ
jwefNQMINnMo7bhrsdhmvYjoC9GuSHPSrHkHLKZRBsiCdc1SopabE67oBmTQ06+4
6JOnbKmjExje2UT0JyJwgp59/YVbDOd06QLxA6gLuCPRmCTgYGqXS3/V1e89VwH1
tK4vtT5ICEUVeBinsBUb2MMEAY41vB410JxWhNL9HFVg30fvQw/YDW7mQSdvCL0G
Gf+lxOl5vhEl0xrMPE8gIqtfQ4Kyyw==
=dgIM
-----END PGP SIGNATURE-----

--Hzj7Ij7mixgewbmh--


--===============1493741132623352301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1493741132623352301==--

