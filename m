Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C065FCAC5A2
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 21:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jL9xXh+bGQQAwQ35CFRSlFnym8yk4NAe6EQ1JDIvZuQ=; b=f8d6lCTqaK1J3l38ofWm4sv+VR
	H8eoNe0xAdLyBuehjVe2flLw6iaeS2YzTMJBmKsfD4rWdAjFujfr1A+Boph0cYoIkaZx4qUZ5agUq
	GdCO9BUJfcQCZyYkbizep1MB+w1KlRdUgPXh5Sx6ImtCHihH8MaI4LHq1u15B/W5oHXSzurcfCzmM
	YQEG0b9CQsajlAxqe/zrcTabSHAPJtjQ7dKl8Nfqyty3broAomsxhLyz9DwbQ7zrKSAifW0dL9nh2
	SQCJhGcrxL/0bIlfN2xd9Z4LI8QSCFtbfigTYHQuK/dMVw/H5/Fyf0IPMtsQWWbwL43Pd+SnnoKtN
	vXeXw2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqfQe-00000006v9T-0vmq;
	Tue, 17 Sep 2024 21:08:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqfQa-00000006v8u-1lhs
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 21:08:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 63EB35C38FC;
	Tue, 17 Sep 2024 21:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7AFC4CEC5;
	Tue, 17 Sep 2024 21:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726607282;
	bh=Xw3qFVde4mW/vVW5R3FHyrkUkN6HRIPohqAfP8ki1cI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CsbDwsQMzYP89sJ1xwuAWKIoRn8xBwDKXeZc2aPQxof68aoPY2YRumZdSdWdEc+Ho
	 bENcFwj9e2++zZDEjW5+MefLdrq9A7siRX0dYBhKXcollwOX8h6rvTqCIXASx6zlsT
	 eCQ3DnxsA7D4JgP+zlUg/XWpEUZE5HuM3eHqwTIE18TbkNf/zdkqH0lyNQ8JS7MGIV
	 EgDUjZhWlOBVSDbinAUrSP8yB/jDA1sZsLgrJiZ9hgOf0Uzueilgi8rybxwdvawVL1
	 3wNiEVxcHWM7tZ2bhrPRO9GHpav6z2H5S8wcRzE9aDScHsr16Jy/xFTrrl3bulziAm
	 K4nxuAfu/2ZlQ==
Date: Tue, 17 Sep 2024 22:08:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v5 00/10] riscv: add initial support for SpacemiT K1
Message-ID: <20240917-spoilage-nimble-a8303fd04482@squawk>
References: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
 <mhng-5bc45db9-5deb-4db6-8733-561768b2968c@palmer-ri-x1c9>
MIME-Version: 1.0
In-Reply-To: <mhng-5bc45db9-5deb-4db6-8733-561768b2968c@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_140804_617255_A88315F3 
X-CRM114-Status: GOOD (  26.47  )
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
Cc: cyy@cyyself.name, Conor Dooley <conor.dooley@microchip.com>, jszhang@kernel.org, linux-riscv@lists.infradead.org, jirislaby@kernel.org, robh@kernel.org, anup@brainfault.org, daniel.lezcano@linaro.org, kevin.z.m@hotmail.com, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, lkundrak@v3.sk, Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de, zhangmeng.kevin@spacemit.com, dlan@gentoo.org, Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, jesse@rivosinc.com, samuel.holland@sifive.com, inochiama@outlook.com, matthias.bgg@kernel.org, krzk+dt@kernel.org
Content-Type: multipart/mixed; boundary="===============1333388682629162090=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1333388682629162090==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v4bulkuQot7/4uA1"
Content-Disposition: inline


--v4bulkuQot7/4uA1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 06:04:29AM -0700, Palmer Dabbelt wrote:
> On Mon, 29 Jul 2024 17:28:03 PDT (-0700), dlan@gentoo.org wrote:
> > SpacemiT K1 is an ideal chip for some new extension such as RISC-V Vect=
or
> > 1.0 and Zicond evaluation now. Add initial support for it to allow more
> > people to participate in building drivers to mainline for it.
> >=20
> > This kernel has been tested upon Banana Pi BPI-F3 board on vendor U-Boot
> > bootflow generated by Armbian SDK[1] and patched OpenSBI[2] to enable
> > Zicboz, which does not in the vendor dts on its U-Boot. Then successful=
ly
> > booted to busybox on initrd with this log[3].
> >=20
> > As previous discussion in patch v1[4], maintainer expect more basic dri=
vers
> > ready before really merging it, which would be fine. For other follow-u=
p patches,
> > that are clk, pinctrl/gpio, reset.. My current goal would target at a h=
eadless
> > system including SD card, emmc, and ethernet.
>=20
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> if you guys want to take this through some SOC tree.  I'm not really sure
> what the bar is for SOC support to get merged, but I'd be happy to just s=
ee
> this booting at all -- we've got a bunch of them floating around and the
> vendor kernels are pretty crusty, so anything's an improvement on my end.

I've asked for clock and ideally pinctrl support before merging it. We
had a conversation about the usefulness etc of some of the initial
devicetrees merged for some platforms a few months back, that lead to me
not merging the k230 support I had queued up. I know this isn't exactly
a "fair" barrier to entry, as it is likely that platforms supported by
hobbyists are going to be more affected than companies that usually come
with that basic level, but have to draw a line somewhere.
Both clock and pinctrl are currently in progress for the k1, hopefully
wont take too much longer before this is mergeable.

In other news, nobody has really made an "official" statement about who
is going to maintain this particular platform. People have expressed
interest (including the submitter of the series, IIRC) but there's no
MAINTAINERS entry added here AFAICT. I used to have an entry that
covered arch/riscv/boot/dts/*, with exclusions for sunxi and renesas,
but with Drew taking on thead and sophgo being the res=E3=81=BDonsibility of
Chen Wang and Inochi, I no longer have that wildcard.

I'm happy to apply patches for the platform if noone else is interested
in that side of things, provided there are willing reviewers, but I
would much rather that someone else took up the responsibility of
applying patches and sending PRs - and of course I am happy to help
whoever that is with the process.

Cheers,
Conor.

--v4bulkuQot7/4uA1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZunvrwAKCRB4tDGHoIJi
0vJfAQCKzg29et4gyyvvDvcq+H0Lr+9pUp0MuhQz0BQ1+12qRAD/ZabDnCrlmXdm
mcstHKWqUcb70WAc/TNCUbS+pCiwsgo=
=JYI3
-----END PGP SIGNATURE-----

--v4bulkuQot7/4uA1--


--===============1333388682629162090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1333388682629162090==--

