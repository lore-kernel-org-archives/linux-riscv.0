Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2932CF9C5B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Sep 2024 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNT47/UyMcyQQJuOCODdTHzAz87u1B6d+jZjzIWMODE=; b=L4Sf/BRaU12HdgMQEyK6v2bCSf
	QKOiVakPBz8WEvoP0Q6jAH4UcBVZiFmgrsmsFPeI60lf4JhGSrYEQ3QtUI7WTKfFA5BJkn9XF3u+9
	N+JOb6e2wvMciXjB2wMr8cxIBnUs1fCuQ52epDbEtsMfLd+alTKFFyusDysa8ilyBToEdYmwe0WY0
	VL+XuEm+9C/qXeYO07s/VCH2aWA2KH6AKyY3dmdXVsE26RlcswZ3tlWLBEeI2p8H9LJKJLafnkKlD
	zcQeJ4M+yXTYZtJLHufU7d47ekRLEYR3ARRTejbZt7HizaDgbw1SZZhCME9QUwli0PPu+97stQxax
	zJqV2YPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfNn-0000000GpbI-3ZVp;
	Mon, 23 Sep 2024 09:29:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfNl-0000000GpaZ-0j21
	for linux-riscv@lists.infradead.org;
	Mon, 23 Sep 2024 09:29:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D6C31A418CA;
	Mon, 23 Sep 2024 09:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD4CC4CEC4;
	Mon, 23 Sep 2024 09:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727083763;
	bh=iwf1nkRj/tOTwl15MaRvvnK43xbPIYpcWqkXy1mwUMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GWfz35v3AxaywbR0LxXA6c1JHSE4Uyf5NxIiXSvNfZcJ6UpUlqjoQaDYcnDsawxSR
	 Y1q9kodzPthObVi3mMkAz7G9co4vG+0QlfMfJtujo+1wyMHxcMOxnTDPpSmRA7fAg7
	 n7bzpvm4kT3EzceGJgYH3AiI0e1ULIHUe3zw7R++PI1HQEXMFwOZ1p8o2bYTwtgGst
	 rkPXTBojo/oSkc393DGQYRqnBesZNfJeE3GCEanboIlAMuEtnXHRxORO91OLEIbDrY
	 VMwU7d+krfgN61iCkq1IoTyxl9/M6Pv14f8xtnBUn5UhiD9dpQLXbNAmZSHqplACaH
	 U85P1DQB1xEZQ==
Date: Mon, 23 Sep 2024 10:29:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv:configs:starfive:add framework config
Message-ID: <20240923-bacteria-ending-8bd9dd9efcfd@spud>
References: <20240923053806.1586080-1-sandie.cao@deepcomputing.io>
MIME-Version: 1.0
In-Reply-To: <20240923053806.1586080-1-sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_022925_294397_2DCE5D65 
X-CRM114-Status: UNSURE (   8.83  )
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
Content-Type: multipart/mixed; boundary="===============1335705583383998142=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1335705583383998142==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jSqPFTddLCwzgxa7"
Content-Disposition: inline


--jSqPFTddLCwzgxa7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 01:38:06PM +0800, Sandie Cao wrote:
> Add config to support RISC-V Framework Laptop 13 Mainboard.=20
>=20
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>

This shouldn't be required, if there are some config options this board
needs to be usable, they can be added to defconfig.

--jSqPFTddLCwzgxa7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvE07wAKCRB4tDGHoIJi
0ncGAPsHek8Al7wfJS16NfYR18Bffi2ULmNJqQCTD1U3Z3PeGQEA67v2+b7qOUHk
7jCExZIEY3Oeit8hRbhXaexM09lsyAA=
=a9yk
-----END PGP SIGNATURE-----

--jSqPFTddLCwzgxa7--


--===============1335705583383998142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1335705583383998142==--

