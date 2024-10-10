Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF48CFC5E4
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 16:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZJ7wUfJKJSZ41S9yUP2I9fTcRI0v6/Qw9WAOHBBCeM=; b=dmFPrruwupQK3SQFs1WPfTpyzx
	gQWCbXWHSjuJytlEJC9RRX5WUxM0R2t9m96wt3OTGXH1zYdfaixmU4wSSXMKREcY7oWhg1VXSDGVk
	T8MlobZeh3YLdgQ3X8cUgjUoljngFZJva6erZXR2JVbGoUIm8ImOY/VbLL/Nhad9iUfo1wl4AUNN4
	XWvkr1MtPCLWjA43cZHn5qI44uvweFji74MM3HN79x1ooPtCQRRtqn3SwBlmPWo5/ZZ2pkA4ow1fX
	JrF1K7VyYfBR9CzH+0ZHFQg0TOQ9z0xVhc7Cvk+NTNmTiYKXL4wRQHEdiyktO0nkUMLACeKEPviTL
	6XD1YvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syw89-0000000DY1w-3L5n;
	Thu, 10 Oct 2024 16:35:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syvrj-0000000DUly-2Hsd
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 16:18:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E9EA9A4496D;
	Thu, 10 Oct 2024 16:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3666DC4CEC5;
	Thu, 10 Oct 2024 16:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728577094;
	bh=7AvwzW/MffijGtC0LhT/DeNlVgIXdZaZHv+b0DuiaQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/afJ6UMziGG0n5c651fLNqExmF+2hxMw0UnlPgjv6l8wPNqVpWT1g+2jRynU23CB
	 CYCGxvbJKfjZyCpXEMK3ACa7DvfxGPX230erEWue/QS+8QThKSMF8HJ3p93i3yBPn9
	 XNslMxIxYUYDO/AqOa2ueuSZ8bQocUjLNf7gZEHwZGIf24lGDdEBn+6MGcirSlY0z2
	 UXDoFapD757My+tl4vSwx0ZWcYRajHy2d5xcRJs3oplXZIKbqR6Qx0TPMtYgZUZw1+
	 PmGF+PtB68vd6oyipHBJ+qCJ62ajvph8fSZguXcqv7iJ8IpPOVSnzjmqJlQrN5I8vh
	 aKWDuJBn9CdNg==
Date: Thu, 10 Oct 2024 17:18:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>, Guo Ren <guoren@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Yangyu Chen <cyy@cyyself.name>, Jinyu Tang <tangjinyu@tinylab.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: interrupt-controller: Add Sophgo
 SG2044 ACLINT SSWI
Message-ID: <20241010-eradicate-overtake-a7b09ad79a0f@spud>
References: <20241009224410.53188-1-inochiama@gmail.com>
 <20241009224410.53188-2-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241009224410.53188-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_091815_685438_D8EA4B3C 
X-CRM114-Status: UNSURE (   9.03  )
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
Content-Type: multipart/mixed; boundary="===============3416071769040158456=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3416071769040158456==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OEx6wLTBXftTPeHH"
Content-Disposition: inline


--OEx6wLTBXftTPeHH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 06:44:07AM +0800, Inochi Amaoto wrote:
> Sophgo SG2044 has a new version of T-HEAD C920, which implement
> a fully featured ACLINT device. This ACLINT has an extra SSWI
> field to support fast S-mode IPI.
>=20
> Add necessary compatible string for the T-HEAD ACLINT sswi device.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--OEx6wLTBXftTPeHH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZwf+QAAKCRB4tDGHoIJi
0lBEAQC/9BgCiFl0swGHZLcJnu+WIiWZzMnC3V4UnuR/ZVGFlAD6AvphKvcYmc/k
q+jXM+CNWCUIsWRxsrAGhdxQX5O+UQM=
=z4lx
-----END PGP SIGNATURE-----

--OEx6wLTBXftTPeHH--


--===============3416071769040158456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3416071769040158456==--

