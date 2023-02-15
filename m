Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3C0C6379F
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 00:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGGjufdzgDyXqIz83xeXRuqGm6MQ8QP/f8l0fJOpZiA=; b=b+6FMo5+Rr614aLFSP0nlcVe5K
	UKYixfMta1oos6/tiERb2RI5pheq4VzJVHRe1BuzeBq1tuXhhpktke9MJ0cv0y6NAf+Huk6oqFtHd
	G7D4sySjM0PCXRuQnhz+FNWen+q+TPvpxmUlZSROO4u/VwdOqRT3KFSHqwK493SRqE03vfM83uPvz
	41aeIAHB5ksngQQr2fB1VF28zGwF/twyHlXmqJRGbKzI8q7ncKmm5qcWo9uvfUCc4NW7Yl4FnXc7w
	H5rd6gh7f631C2XUQWJd1uDv5gqoIS0T/cmrHy8eJqEK3ETbSvlibv4T8ZouqNgHs+hxCPCcIqlLG
	Wu+4h3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS5Ll-00413c-4M; Wed, 15 Feb 2023 00:08:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS5Li-00412Y-7v
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 00:08:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AACF0B81F45;
	Wed, 15 Feb 2023 00:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DCBC433D2;
	Wed, 15 Feb 2023 00:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676419713;
	bh=Zb9Xrs/7YhzwQmBYtp2UMiBwRPfgPAxM/ZwWswHiEVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dmzvAa560VV1OQk4+mgHj6xd1yinTpUAHxb1L4GLVUor6f17IUq4I0qC+9UH8SvDo
	 aVor8mahhX8Ynv46GXerRkXapsI09aRNl6Es4U2BcMfzDn9W816aK5Fwkj/s3/DOE1
	 VRIwguVJF2JPmdBdgSk7BJPa+sRTe93R38YqnDRjzgVj3xzSRl/5kf1NHi+s0VsP3e
	 5NAXYqfbgFbYvVlq+fUYIHKrNX//D/9lL/ZUgwyIm7QBQiBzfmLJEiHOqOIIYyAS7X
	 MypHqV2NQS2a+y0X+hSd+N2CZBoFMgtr22k3C4IfnnnzyM86rqRe90h2Bh9ustA7OK
	 f5dHXF+MvbXww==
Date: Wed, 15 Feb 2023 00:08:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Guard alternative asm macros with !LINKER_SCRIPT
Message-ID: <Y+wifgqEj4q3KlAo@spud>
References: <20230214201358.10647-1-palmer@rivosinc.com>
 <mhng-858f0ba6-5ea1-4f41-b0b1-42f33c09dfe2@palmer-ri-x1c9>
MIME-Version: 1.0
In-Reply-To: <mhng-858f0ba6-5ea1-4f41-b0b1-42f33c09dfe2@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_160838_445303_E81BC06A 
X-CRM114-Status: GOOD (  14.56  )
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
Content-Type: multipart/mixed; boundary="===============1568444718163056596=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1568444718163056596==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3EKfytgZiBZB/jY4"
Content-Disposition: inline


--3EKfytgZiBZB/jY4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2023 at 04:02:48PM -0800, Palmer Dabbelt wrote:
> On Tue, 14 Feb 2023 12:13:58 PST (-0800), Palmer Dabbelt wrote:
> > Without this I get a handful of .macro related directives that trip up
> > LD.
> >=20
> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > ---
> > I'm not sure when this started failing, but I recently tried a build on
> > my local machine (with crossdev-based toolchains) and it failed.
>=20
> It's actually just because I had https://lore.kernel.org/all/202212160621=
09.865573-3-panqinglin2020@iscas.ac.cn/
> applied, I'll squash this in if that's OK with folks over there.

Since I had left on ack on that series, it's fine by me...


--3EKfytgZiBZB/jY4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+wifgAKCRB4tDGHoIJi
0gcrAP9bOlYPMPGUnz6VJJIkS/jHfaCkSLkRA6JuG8dVwBRm9wD+P6Q8rvVgfqys
V7eHAktoYNPaz/oIzE/XCP9cHZzPsg0=
=QUvN
-----END PGP SIGNATURE-----

--3EKfytgZiBZB/jY4--


--===============1568444718163056596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1568444718163056596==--

