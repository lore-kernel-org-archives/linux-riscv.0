Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DE9C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 16:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLgEe3ULJofobMGooc1qmzY/QU5fbHx7LUnieikyenI=; b=xrg1W/WB/0GAOGpucp6EUHoPxy
	H3IAF8yDxIYDOZFBDL/lWkDp2I9OaxNmMyX8V5dclJaox74SRNBM3EJRe/3p2fBE0E2ZLhZPucqK+
	TOdl+advUXDXsi9W5zt7FvESdF+2CoI+Sv9yP5FzLW7zpm8rDtrHH5u0QvrChO+nJtpXKOijbTgbf
	eAN2ahnIOesyfvzimexlIsvENE8TJXRcF9GVJPRjZgfjnR9qeqXH8GHQdbYdY3vs5pfaIinSWuGLk
	ym4ky56XYy44w+37B+JZxdOKl2Fr9PVaEPz8j2AssPpz73imzwo25uParnJ8CC7cmNGgxrUDAryDb
	FLpP2JNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7HW8-000000027Aa-0vUN;
	Wed, 15 May 2024 16:30:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7HW5-0000000279o-0gzC
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 16:30:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75FD7614D9;
	Wed, 15 May 2024 16:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E881C116B1;
	Wed, 15 May 2024 16:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715790608;
	bh=b6uOhLr5+sNikINkdW52UqVYtu5Q8MJRE/rYI96Vk7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XtaHsBhMDyJYm5SKHP6Fjz/B2vn3eXKF0hqyN8fTzRq3m+CH0ez+mlCv+xMz6NQCg
	 Eg3YOAcg7GFEFRorZCOrAfO/fCU6aijvikwMRDWP9g43jMcqO9k51imp+BJWfvLZNt
	 vFt8ZDojVHRS4+FrN4tCQCE/ocjf2zq0Q7d3hXVC2I5tXLen9RyCTRGwnWD/Ye/Lc3
	 nQm6mTN2mClmV263HTxrs3qoKvs/cG/KSSid7qprGQdpGRt8+4HevwH/IgUspQq2+q
	 i/8t2Jp8ZN9CtAn75sbrQuDbu65qVMOnIgqhB6Ar1dQ46d6CPrCSmUt2yatplQPvER
	 TUtpxKRQpRAdA==
Date: Wed, 15 May 2024 17:30:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 0/2] Add notifier for PLL0 clock and set it 1.5GHz on
Message-ID: <20240515-reorder-even-8b9eebd91b45@spud>
References: <20240507065319.274976-1-xingyu.wu@starfivetech.com>
 <20240510-unfounded-syrup-d1263d57d05a@spud>
 <NTZPR01MB0956D48361098E8AA4B3930A9FE02@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <20240511-unbiased-dainty-ccb5ece9b1b9@spud>
 <NTZPR01MB0956A7393097129D3CD048EB9FE32@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <20240514-congenial-smother-1e4b0fc6a5df@spud>
 <NTZPR01MB0956CF1AA9EA5A20A174FD8A9FEC2@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <NTZPR01MB0956CF1AA9EA5A20A174FD8A9FEC2@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_093009_264242_5BC9F997 
X-CRM114-Status: GOOD (  17.71  )
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
Content-Type: multipart/mixed; boundary="===============5838520821113651686=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5838520821113651686==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0esYplcxwawkbSl6"
Content-Disposition: inline


--0esYplcxwawkbSl6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 15, 2024 at 02:23:47AM +0000, Xingyu Wu wrote:
> On 15/05/2024 02:08, Conor Dooley wrote:

> > There's a push in U-Boot to move devicestrees to use "OF_UPSTREAM", which
> > means importing devicetrees directly from Linux and using them in U-Boot. I
> > don't really want to merge a patch that would present U-Boot with a problem if
> > the VisionFive 2 moved to that model there.

> Would it be better  if I  change the rates of PLL0 and CPU core in the driver not dts,
> and avoid the dts of Linux and U-Boot being different?

I'd definitely prefer if we don't include stuff in the kernel tree that
would cause problems for U-Boot if imported there, yeah.


--0esYplcxwawkbSl6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkTjCwAKCRB4tDGHoIJi
0mXdAP45Fq2HjIOOGuw/DNTX8COHl/M4Og4CCDPl9ZvpBSrKhAEAnXj3M2a41LKv
r68Iay0nVDI4wfm5b+vYD81nKcHouwo=
=t5CG
-----END PGP SIGNATURE-----

--0esYplcxwawkbSl6--


--===============5838520821113651686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5838520821113651686==--

