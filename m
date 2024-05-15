Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF78C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 16:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/gQdc5qiuR3h9whsnciw1/z7s8Xsg0ByRn5KdyR2tXI=; b=FFGMHyEDSpcMYXjHDRaQHtLQfo
	P8y2u0k5l5q5bN3YyWXwSuSXHhwmyPyHiOFlcIAYaXGPmtu675qCNeGK6TRbfROUV+OKBqfsN9HYd
	zYZB26b9NXM/lHabiuBOUNHkg6pLhbSl2dCyyPxGJttYaj9RdLNNtdm66ZUFrT07p2a3LyWZ5Wd6x
	r/Ym3VmwGSsf9Aanop8Sda8SMHyrvmC1M2Z/EzOYZOqyCBzBSvw7mH65sb9ZJjxKMy/8DZUoqhu5U
	7djM38yYX/sp/2aa8+1aTKjbAFy11oyRsuRXsyFyURa9sUBeY64fPMXenS6mjtEZK0rpudadzZnC8
	26Z/Cd6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Hvh-00000002Byh-3QDi;
	Wed, 15 May 2024 16:56:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Hvf-00000002ByE-0jj1
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 16:56:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FF4360A77;
	Wed, 15 May 2024 16:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4041C116B1;
	Wed, 15 May 2024 16:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715792194;
	bh=Vc3UgsyCKJ4NlKCBb8Zg9oPYMZOJ5N00h4qjUnYkSiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z85sj6ioU31bj8SUZwrJbHqazoJD2vBx5+ch1dJKqKBm0Z6cvXxmEASXGCJr8I6Jr
	 7JSsovXepWMtpi+SPtNSjFjSJH8jQQ9J8nYiahl/Yjqah4QW4XoUbQH3+2wAz0ZM28
	 oCBbYA0j0onTffnFOZEQpfKHqVSwOES3Rq6X4UWNtn2trcG4gRkCRq7QqJ4waTooSZ
	 qNPV85rpN/PLTfQ53xaQinGar22x8CaB0u8WGtQbQmReZGbm3I1B4Y3wG+aHlAiGhZ
	 UgR4awLb/g0Q4Jf71QS8gueK4RQpzJgPH4N1p5IVClFzCQcx2hqayHoWky60cG5Anx
	 z/K5wbbcgmvkA==
Date: Wed, 15 May 2024 17:56:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: fix Andes errata build issues
Message-ID: <20240515-slander-stranger-683758537aee@spud>
References: <20240515-comic-sketch-3b40e6676f55@spud>
 <ZkTnlEnoFFrQdXi2@ghost>
MIME-Version: 1.0
In-Reply-To: <ZkTnlEnoFFrQdXi2@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_095635_301738_521B0F61 
X-CRM114-Status: GOOD (  19.02  )
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
Content-Type: multipart/mixed; boundary="===============4973450064750514121=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4973450064750514121==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UK+D9MXCwBQBpFDQ"
Content-Disposition: inline


--UK+D9MXCwBQBpFDQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 09:49:24AM -0700, Charlie Jenkins wrote:
> On Wed, May 15, 2024 at 05:09:34PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Commit e47c37c24024 ("riscv: Introduce vendor variants of extension
> > helpers") added includes for the new vendor_extensions.h header in
> > the T-Head and SiFive errata handling code but didn't do so for Andes,
> > resulting in allmodconfig build issues when commit 589e2fc85850
> > ("riscv: Convert xandespmu to use the vendor extension framework")
> > added a user of a macro defined there.
> >=20
> > Fixes: 589e2fc85850 ("riscv: Convert xandespmu to use the vendor extens=
ion framework")
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> I was going to fix this in my next version but was waiting for the
> reviews on the thead stuff. I wasn't anticipating these patches to be
> able to jump the queue :)

Yah, the reason for that is I asked him to take the non-vector parts of
the series as 6.10 material so that we'd have less stuff movin' around
in cpufeatures.c so that Clement's Zc* + validation changes wouldn't run
into a bunch of conflicts etc. Same reason that I pushed for getting
Andy's vector subset stuff merged today, but that mighta been before you
hopped in.

Cheers,
Conor.

--UK+D9MXCwBQBpFDQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkTpPgAKCRB4tDGHoIJi
0sSJAQCfVevJgU8rQ4m6T39juTOULgq+RetJE+zsp3P2MQd4BgEA/T2OiRexNN3w
g0d2C05XlOyLLThFSyWR5vfKNZ2+WQI=
=MIIp
-----END PGP SIGNATURE-----

--UK+D9MXCwBQBpFDQ--


--===============4973450064750514121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4973450064750514121==--

