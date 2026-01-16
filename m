Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F5DC982C3
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 21:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ER2LoIxmvaVSuwdKh004YW8eM4eIHBJPA+XfJ5jnZo=; b=CMBFvMrKL5If2W6jjT92tmC7QG
	/q5KtKCY4uQ1+T8/59kPZfv7G02GHCiCirfNZTN/Goa/c4nsr6tc28j/FnLlzCiOHG0F2sVbef//W
	lIf+P4fJjhC1HvntftNDK2OGJfjMIGUj//YkOLvRvXjrKXpntRc+SJ2Hr45BTb2GJ6NOpvr8G+Psn
	Jo9dmM/1HRM88wMcRlAAdP209SUQu+xoKc091371rGlmIWFvJg9zIoZroyMha9ownEzfsOi6dDr56
	SrqeB4v3euw+F/VcQeZIaO7B2cjO+m2XA9Bx23gi0xeU63jdAmcW5M/tvf5oLjEpuGPZ9pxR053Aa
	DPsL3UYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgr08-0000000EqHd-2QG1;
	Fri, 16 Jan 2026 21:05:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgr07-0000000EqHK-2fru
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 21:04:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9722160169;
	Fri, 16 Jan 2026 21:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4898C116C6;
	Fri, 16 Jan 2026 21:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768597498;
	bh=GVOzANANPnt1tlfagNsbqufCLp5zEPRZ971Q9RQonBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K7whhVxx9KViIGvzIaKc7hJE2WAy3a4kH6I07JykHrUPb6Y5j5QVrQ6AoH3cwylMs
	 4of16LSCKNSu44OlCz22ug3v3Zq4AexQtg8aeGkaNmZIEwqrce3MQvS2G6Dx7/uxQc
	 fcyFjEKxYGZGXn61KY8LwGNXRoFuc9Vf7LDt1QNFr/2cu7XjuwyB7gcjmavs4g6Fnk
	 4Qoogpx9yDIwnTjGALqYHg2sK++VNPrGfZwC76qpM9LVtnEo3Q3vh/v++me10ZFp83
	 bJP5v587yBHew8dN8z9gu2EFqcAlFE269ZPcYmaopSzqYvOg8WNIi8FWb7gKmwQkVq
	 AFRVzYGUj5CVg==
Date: Fri, 16 Jan 2026 21:04:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: robh@kernel.org, krzk+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, cyy@cyyself.name,
	dlemoal@kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn
Subject: Re: [PATCH v3 0/2] Initial support for 100ask CanMV-K230 DshanPi
Message-ID: <20260116-radiated-floral-98fb8244ff7e@spud>
References: <20260115060801.16819-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260115-proud-radish-c835a76d0446@spud>
 <aWmr/xEuUhcH0gKk@duge-virtual-machine>
MIME-Version: 1.0
In-Reply-To: <aWmr/xEuUhcH0gKk@duge-virtual-machine>
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
Content-Type: multipart/mixed; boundary="===============7611190757128775133=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7611190757128775133==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mwYl45uuJZwgEr0C"
Content-Disposition: inline


--mwYl45uuJZwgEr0C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 11:09:51AM +0800, Jiayu Du wrote:
> On Thu, Jan 15, 2026 at 07:23:17PM +0000, Conor Dooley wrote:
> > On Thu, Jan 15, 2026 at 02:07:59PM +0800, Jiayu Du wrote:
> > > This series adds initial support for the 100ask CanMV-K230 DshanPi
> > > board based on Canaan K230 RISC-V SoC. There is a module on this
> > > development board.
> > >=20
> > > The board and module are documented, the basic board/module devicetre=
es
> > > are added.
> > >=20
> > > This series is based on the K230 clock series[1] and the patch 3 of t=
he
> > > k230 pinctrl series[2].
> > >=20
> > > Link:  https://lore.kernel.org/all/20251127-b4-k230-clk-v9-0-3aa09e17=
faf5@zohomail.com/ [1]
> > > Link:  https://lore.kernel.org/all/20240926-k230-pinctrl-v2-3-a9a36fb=
a4b34@163.com/ [2]
> >=20
> > Right, I've grabbed patch 3 from [2] and put it on my k230-basic branch.
> > Do you intend sending a new clock driver series soon? Last time I looked
> > (about a month ago) you had some changes proposed about critical clocks.
> > I'd like to try get this stuff merged but obviously it depends on that
> > clock set. I'll happy send Stephen a PR to smooth things along if the
> > drivers are ready, but it looks like you need to send another version?
> >=20
> > Cheers,
> > Conor.
>=20
> I'm not working with Xukai Wang, the developer of the clock series.
> I merely discovered the critical clocks during the test and raised
> this issue. Regarding the new version of the clock series, you need
> to contact Xukai Wang.
>=20
> I am currently only working on the USB and sd/mmc series of k230.

Ah, my apologies. I clicked the link and when to look at the most recent
activity and your name was on the patch with the fixes to critical clocks,
I guess I never checked to see if you were also the series author. Sorry
about that! Looks like a v10 went out today anyway, so worked out in the
end anyway ;)

--mwYl45uuJZwgEr0C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWqn9QAKCRB4tDGHoIJi
0juYAP9tU0kPFQqjpPzJhks9LY3SqdA6+m8IgEA97LBdao1MQQD/TEYdp49VSkb2
YkuQGzjF5KmZ4iquxkU++/LJrmQTHAM=
=hXSE
-----END PGP SIGNATURE-----

--mwYl45uuJZwgEr0C--


--===============7611190757128775133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7611190757128775133==--

