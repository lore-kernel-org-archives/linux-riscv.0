Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FCDBC43217
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 10:58:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDD2E61053
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 10:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDD2E61053
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bth5j3xMmc+R9yqWq3w/gqf0F85evJgkZlNz0No/GcQ=; b=EZ2GKdH2pnFA/nMXk8GjxgqCoE
	xeoI1zk3HIveWtXyEVVrDOvQnTfOZld+uWKAgxdhBSke6T97b8WIqmDI6pROnu7mH9mVkTIBZHTEi
	KymsR2XI7z96wSfUzEhaHPr3/Hq7RmBIgJEijcr95i+562+h0ZRo7xLaB+/gYhNg1wwxxf7nwnMnj
	gGVgQRgjrQI8Ux8M0QYqnp+n6zQrCv4W6YPjYTw9Mo2Rlt/PEq3NdF2Bmj5bWmYhghbtVC6HWX2tv
	uRVQp7/mCx3zHdNbLv9ASu2tlmgF9AF/2pULabVd8jkrHVgcyJKNNAmydXiaCiLg9DnWN1tO5lGiL
	LX00u7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mabxS-00G8oQ-5c; Wed, 13 Oct 2021 10:58:02 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maZux-00FdWg-IQ
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 08:47:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maZtW-0006Qy-0W; Wed, 13 Oct 2021 10:45:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maZtK-0005Ho-C7; Wed, 13 Oct 2021 10:45:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maZtK-0006xh-90; Wed, 13 Oct 2021 10:45:38 +0200
Date: Wed, 13 Oct 2021 10:45:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "# 3.4.x" <stable@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Sergei Trofimovich <slyfox@gentoo.org>,
 Jens Axboe <axboe@kernel.dk>, ben.widawsky@intel.com,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-ia64@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH AUTOSEL 5.10 11/11] firmware: include
 drivers/firmware/Kconfig unconditionally
Message-ID: <20211013084538.vitv6u5ahds7arpw@pengutronix.de>
References: <20211013005532.700190-1-sashal@kernel.org>
 <20211013005532.700190-11-sashal@kernel.org>
 <YWZ1om+pLmV3atTd@kroah.com>
 <CAK8P3a2AC9-ogoxi1q+NQyBqMwrFqSZtHvZVdJ9HF+OLB3O62g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2AC9-ogoxi1q+NQyBqMwrFqSZtHvZVdJ9HF+OLB3O62g@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_014719_802690_989B40B7 
X-CRM114-Status: GOOD (  21.06  )
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
Content-Type: multipart/mixed; boundary="===============5825794700214711835=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5825794700214711835==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gkwcmkxhwgtfgtae"
Content-Disposition: inline


--gkwcmkxhwgtfgtae
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 10:38:01AM +0200, Arnd Bergmann wrote:
> On Wed, Oct 13, 2021 at 7:58 AM Greg KH <gregkh@linuxfoundation.org> wrot=
e:
> > On Tue, Oct 12, 2021 at 08:55:31PM -0400, Sasha Levin wrote:
> >
> > This isn't for stable kernels, it should be dropped from all of your
> > AUTOSEL queues.
>=20
> Agreed. The second patch that depends on this does fix a (randconfig)
> build issue in stable kernels as well, but that patch is currently broken,

Fixing randconfig issues isn't important for stable, is it? The target
audience for 5.10.74 are people running a kernel between 5.10 and
5.10.73, and those don't suffer from this type of build problem, right?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gkwcmkxhwgtfgtae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFmnK8ACgkQwfwUeK3K
7And8Af+K7OLJ/QFBmWZbDMcrq5QGKfPWOm0ntnqP00EF6M9WuzDhXwYSRnkxrUL
gB8rnQzNTAremhUgxxWWYf1b+jcy9McUcKiFrZFcFzI+Msu/lFoJs954A1A/LIwC
gv2Yr2yfkJwro0nmnPonuaG6aBdO7hhuGbPcksgfQ822GDrckbS3WluAZcC3/j0O
DzTBgBmlZEv7CdvM/DJbfxqV01oRg3C3zcn3tFY7c+3PUJs2oumNQRW6zfvUW1Bx
NrWKG1K6REFzfJ1RJO8BBaK2qT7oEDecgCOrpsXClHm+08bxJ06CbZ3pcA2Qd9Kt
40Yg+5KjHWr8vqioHLbH+w7bwi4d1w==
=e2xG
-----END PGP SIGNATURE-----

--gkwcmkxhwgtfgtae--


--===============5825794700214711835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5825794700214711835==--

