Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24601C79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 20:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+JmME0ElKXRJ87UxjGg6st0PRGp4/hVSV4nAXi6wv4=; b=gvyQTGsP8amV3BcOtj384VwtmK
	i+MRX8eKvWKJ52NJvXctAN8cAr7bmsyZt1bvcy/sQ52KbH81ZALciIx/omK8ENuu6QhU52A048OFY
	XUuNUBtxR379UsLLDY2OK9LDMTPlDpPznV/PKca+CouTk6QyIjBMGRwQkUcXJxlGyCob0p0RSULfV
	NXBLPAltADotupHs37oZ+QhL67iGSdTssMHmfY+Uyv5JjwmX7kvww71SVbFbAIu9bCodKE5lHCEMP
	TnZAPuM8Kw3pWsSU6kWLauviREovj2BVdsYTE/uGipfeLUnS5pIccBrJfODpXDCNtEJnh4ekp6FOO
	SHUowGDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x425P-0000000A8gT-1ZRn;
	Tue, 08 Sep 2026 20:06:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x425N-0000000A8gG-1eUI
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 20:06:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 28CBD4012A;
	Tue,  8 Sep 2026 20:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAE61F00A3D;
	Tue,  8 Sep 2026 20:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788897989;
	bh=7lK58BGvbT+0KFsfL00ur7tIOSKYjNnYpM36ZLoBwxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=duPYE1XmufUDIvM963zEHdnWYrnlHMl5CNEYCKBx5IX5+RbuTsWEd7rhrP0WMbqNq
	 WSZsT5ANJf0+Srhu3FLjfA4vSjn0cSm89fRj5f/9/HOD7R3DoGsRjswAdbtkWzuPIk
	 GHBChwMesKv4Qs+U/woQKb6nIJzMpCU7OB/m8LRSScdanIRsFsSB0Pcm74hlBHs5/8
	 3NCICDrZCR1Ka4q8qT+/yBg0B/br0i3pgBw5lWPUr8hgHl81Q4DrBzOlKeckUykNj6
	 dFbYbJ8P48q5O81Hkgnv99PSBR55ytmR1RiXhNy9sDeDvoAaT3H4akABOHS8Ns8ZVS
	 Kw/BcrSUmisyw==
Date: Tue, 8 Sep 2026 21:06:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 0/8] Add StarFive JHB100 syscon modules
Message-ID: <20260908-plaything-clutter-a72865edd110@spud>
References: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============8066619318384781713=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8066619318384781713==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XrPUIry8dt0NQeQF"
Content-Disposition: inline

--XrPUIry8dt0NQeQF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 02:56:00AM -0700, Changhuang Liang wrote:
> StarFive JHB100 has many syscon modules, as listed below:
> - pcieep0_ecsr_syscon	(PCIe endpoint 0 externel syscon)
> - pcieep1_ecsr_syscon
> - host0_syscon		(Host0 syscon)
> - host1_syscon
> - husb0_syscon		(Host USB 0 syscon)
> - husb1_syscon
> - husbd0_syscon		(Host USB device 0 syscon)
> - husbd1_syscon
> - husbcmn_syscon	(Host USB common syscon)
> - gpu0_syscon		(GPU0 syscon)
> - gpu1_syscon
> - b2h_syscon		(BMC to Host syscon)
> - h2b_syscon		(Host to BMC syscon)
> - vout_syscon		(Video output syscon)
> - pcierp_ecsr_syscon	(PCIe root port externel syscon)
> - pcierp_syscon		(PCIe root port syscon)
> - usb_syscon
> - npu_syscon
> - per0_syscon		(Peripheral 0 syscon)
> - per1_syscon
> - per2_syscon
> - per3_syscon
> - sys0_syscon		(System 0 syscon)
> - sys1_syscon
> - sys2_syscon
> - strap_syscon
> - sfc0_filter_syscon	(SFC0 filter syscon)
> - sfc1_filter_syscon
> - sfc2_filter_syscon
>=20
> Some syscon modules contain PLL, reset, and socinfo nodes
>=20
> This series depends on the series:
> https://lore.kernel.org/all/20260807112923.191627-1-changhuang.liang@star=
fivetech.com/

I tried to apply the soc patches, but they depend on this so I can't.
Can you get someone from Starfive, ideally one of the listed clock
maintainers, to review that series?

If you look here, about half the patches are missing a review:
https://patchwork.kernel.org/project/lei-conor/list/?series=3D1142160

If you do that, I'll try to sort out getting a PR sent to the clock
folks for it and figuring out how these bits can go on top.

Thanks,
Conor.

--XrPUIry8dt0NQeQF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBqvgAKCRB4tDGHoIJi
0pcXAP9wGUx5B0ugAlKrI+SAFNcGs2S5MjPe4f3L4H5VI0pZPAEAs3hu83T9jjU1
QBx5LgX5pS+DNjwx5P2Effhh0mKzIgQ=
=h5Z6
-----END PGP SIGNATURE-----

--XrPUIry8dt0NQeQF--


--===============8066619318384781713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8066619318384781713==--

