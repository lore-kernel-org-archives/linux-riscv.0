Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B3FFF886D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 18:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3eGLABut2KDXWwUOc4pe9M5g28RReByM322UpMJQJk=; b=jAkYEhQMA5bSvJ4dpjjdZQc2LM
	JwmexGsut4Op+3hl1ZL1Q1XLUvaPQUAXLOqIAdzAfsHjT8EKUVpgtMNxHvhCxen0AeY8xNnLAtxR4
	tszlqmfKWqgj6io4/OxEQlinh6q1frHNORVah3s1mzVeVGsrq1BDMUPFj17LxKItTNgHsh4bMCpOt
	nBXRYrILj6EWgNzEdp8PNUd7A1117SWidF15/xlaM0/ru03zG2xMZsKulIp8zEwI03pv5ReK5P528
	uN4GrzEJENYNiGEUOPswAAAP3usyrPmypXTSBKz8nQMXqzcQU5LCDYQrQWFB+jfYn9H77dnpYSNr3
	b7sO9heQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmvi-000000024Dx-0x6w;
	Tue, 28 Apr 2026 18:13:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmvg-000000024DQ-2Li4
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 18:13:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 49C0640297;
	Tue, 28 Apr 2026 18:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A84AC2BCAF;
	Tue, 28 Apr 2026 18:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777399984;
	bh=adKxGlnFh2v7arFvCaA/DguA8JQxujgHW5DfTnIH2J4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AvXobuaISYzinZhJRSeIkCZzTjMI4MAbx+KCxmIVkw/nChIU2xDLsKnIbFVVcKiHi
	 6/jqaGsY+BInAZEWc0ij2gzmuEZKlhnmkd2+8ghnLtcb+ErmIaj5ZVTwrpMobTI/fM
	 gZ4hmZVdW7etub9+XioSiYGS6GAh4LnoH04v4OPYsE536zaXMSDafmPLcJsTsgSBYz
	 bEwWQWfD5TShe3oEjYrIqeTHQ7EbCS5bdAVAFEUO1O+MXBKnQ6wl7S8iHzohp8CMyL
	 nw5oV5wZOp4RVQH0imqGnsYVLVspGihuMcmZsXYWK9mEjBVXb7WkYKkDQezhYET4bI
	 rnWzPAdfpDIqA==
Date: Tue, 28 Apr 2026 19:12:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT
 K3 PWM support
Message-ID: <20260428-operate-satin-367dd5a42ff5@spud>
References: <20260428-03-k3-pwm-drv-v2-0-a532bbe45556@kernel.org>
 <20260428-03-k3-pwm-drv-v2-1-a532bbe45556@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260428-03-k3-pwm-drv-v2-1-a532bbe45556@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_111304_615484_CAE0659D 
X-CRM114-Status: UNSURE (   9.38  )
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
Content-Type: multipart/mixed; boundary="===============5438155527124300556=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5438155527124300556==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hbZz409LMBfc1SqO"
Content-Disposition: inline


--hbZz409LMBfc1SqO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 10:46:50AM +0000, Yixun Lan wrote:
> The PWM controller in SpacemiT K3 SoC reuse the same IP as previous K1
> generation, while the difference is that one additional bus clock is
> added.
>=20
> Signed-off-by: Yixun Lan <dlan@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--hbZz409LMBfc1SqO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafD4qwAKCRB4tDGHoIJi
0mGaAQDq6P9TZl3HphQpeRKzTA/sPmsbvxle6zYX9nGyqTyAAQD/b2AVulWdGL2k
O2A8UPpyX7n62Inet7X+4JjZD9TyBA0=
=bCnk
-----END PGP SIGNATURE-----

--hbZz409LMBfc1SqO--


--===============5438155527124300556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5438155527124300556==--

