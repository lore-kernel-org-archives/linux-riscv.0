Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F25BCCFA04
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 17:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoJBKd+Gu262OFviqJmZndBXGZ6C2T8+V1OyMlYNLgc=; b=dXR4gotqJkTxNaPxYGircv2TrU
	vJc9VXnyqoaTM4XRRgnIKxwhFAs8FT8T3p07j9JACIQDPdpaP1guoL722uvViW8fKCyZ0tQ8EdNYU
	hfjeJsgY0BY6kh2EA+o92MpR6y6DAJt4qxELY9zss+vDHMAio2HIGquqio9I3gdiKXgxrO1vGn+3o
	A5TT3NOBeEJS8MTkiKk1h8B64AAOw86RzMDtSaMin0aYmlk/my/ndXY1Vlo6VCM31Xlxmo6+y4IvO
	ETIME7kQnAku4sp9iDbvAhqH2GP/XTWF80FweW0T0jU/yCAWv+tVCWfCTsOOBN2k7At9CViqAHA9L
	RdA/EyGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKvF-0000000CHc9-041R;
	Tue, 04 Nov 2025 17:34:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKvD-0000000CHbd-2YPz
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 17:34:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BBCE2447EF;
	Tue,  4 Nov 2025 17:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1E3C4CEF7;
	Tue,  4 Nov 2025 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762277658;
	bh=VZP4zd1NqOxxRJ4gQ1MkLDJmFVtrGm7/6INqxLsACeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JoqmPNu8intzOPqud57ssx4DDfOS5yhueWy7EAVdZDgLbhZ1g/HsEQO8MjxpNv6Ik
	 fZxvf0jZcywhPhM30yhpmvaQeQDobuMT7IBZmJobFpVv9aP/D/dPo6KhK2+fB4ptka
	 0xXd/1xoVZ9zbI66GrqtuzlNiIUOSXTYXrsWyBssFEMFiPbxGCnS5A+MgHldavGxCm
	 jVlOKncPPK2PouQ/qeh9U9N0/RDssR4qf7pPIS0r4EvmSI26lDMoQFW5dv6xnfwLjE
	 iRR27o8LAKxvq1vepSl+aYKdAkayg21Ko0mIylE25tVkyv7Loy4eaz1o38F7OOazyV
	 f/1deH2/3zmNw==
Date: Tue, 4 Nov 2025 17:34:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Longbin Li <looong.bin@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <20251104-dandruff-handed-0ebaced9ffc6@spud>
References: <20251101014329.18439-1-looong.bin@gmail.com>
 <20251101014329.18439-2-looong.bin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20251101014329.18439-2-looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_093419_669998_8F503E77 
X-CRM114-Status: UNSURE (   8.91  )
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
Content-Type: multipart/mixed; boundary="===============6053501265542025040=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6053501265542025040==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c4nufWis6uU2YIVM"
Content-Disposition: inline


--c4nufWis6uU2YIVM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 01, 2025 at 09:43:21AM +0800, Longbin Li wrote:
> The Sophgo CV18XX/SG200X SoC top misc system controller provides register
> access to configure related modules. It includes a usb2 phy and a dma
> multiplexer.
>=20
> Co-developed-by: Inochi Amaoto <inochiama@gmail.com>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Signed-off-by: Longbin Li <looong.bin@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--c4nufWis6uU2YIVM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQo5FQAKCRB4tDGHoIJi
0lstAP9lVrXNxIptvJ/6DAvNyO717UosSVDKjRMXSocxnyyJMAD+PgfXNqFJ/7T2
x1q8qupFxYP/7lvhFaJGBAoFK+N6Bgc=
=VOqT
-----END PGP SIGNATURE-----

--c4nufWis6uU2YIVM--


--===============6053501265542025040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6053501265542025040==--

