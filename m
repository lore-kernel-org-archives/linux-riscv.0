Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A47ECF8853
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 17:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJMO5VMU346JBnlaQxTgv7HuGGvJGsYF1M/VkMiAIH8=; b=1FdlNCGtDZA0PIp1+I6T08SgFe
	QuSfIfXHB3jeL24ib33e7nVh9WS62UgVyF/J5YrOvn/m+jjaj8J4i6IcRWSAAMAcyq/xwWSBg9TIK
	yoHa/5y7eG/GTBjSkA1bvRKQaOh8eRH28ho7UuyfD+/5mSPNjIbkI9uCKwS3UTDiYGxY2hiYMOYBt
	q8Wf+b/Z4QwnB0qMhTMEeuojMdDr+zesLbUts/RQSP1L0QGh1Jixs32ZEh7g3I3UGaIAu8hABoBKM
	zF4nFSujLXmvLaLPNWiOsQiexUyf/KLJsGr4DT+xEXkh28q2KzusUQQqItB87Q8wwf8C8fPCTlST2
	tMeQShzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swlpB-0000000DQtK-3Tye;
	Fri, 04 Oct 2024 17:10:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swkTl-0000000D4Ze-2Lq4
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 15:44:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B8D665C5EF5;
	Fri,  4 Oct 2024 15:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1052C4CEC6;
	Fri,  4 Oct 2024 15:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728056668;
	bh=g6L2Bd0g3xO/JW7h06BpQ1vhxFqlkDGXgOvZlFB2GyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nLQGg7Vh/tn2IRTrAxIRn5V40dXDv/GMXOCygwdLW5/hW6DtL+FS5wfMJdHCbwPes
	 nKxn5p+kX8zYVVkYo9WQyoxISewuFRoNMlqNW4fvEfUD9ExEci9F/ee2tldOKxijZc
	 2rojaZkJNDEnm28gLd9yZWlG9aFBiau9vfboG/9y8Hvq1NpJ1zXt9d3SMaKYEGHwW0
	 7yY5tX3omTBSxHnFhLSOWG6Mbf5TcS7Ikj0ZzjCP3GkFEG1ecxRi8ebpD5dwHFcZfM
	 LxldqVTk36BxwGVn3sCo6v0bakIUVo395jOte76YwrajrY4GD2s/Q4kMtPioe0rSxS
	 QUf9yaldb85/g==
Date: Fri, 4 Oct 2024 16:44:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Inochi Amaoto <inochiama@outlook.com>, Guo Ren <guoren@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: interrupt-controller: Add Sophgo SG2044
 ACLINT SSWI
Message-ID: <20241004-patronize-doily-8406fa214347@spud>
References: <20241004080557.2262872-1-inochiama@gmail.com>
 <20241004080557.2262872-2-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241004080557.2262872-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_084429_727402_E9022832 
X-CRM114-Status: GOOD (  18.36  )
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
Content-Type: multipart/mixed; boundary="===============8963465264400404446=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8963465264400404446==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wpxj4kbF4P50H8T+"
Content-Disposition: inline


--wpxj4kbF4P50H8T+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2024 at 04:05:55PM +0800, Inochi Amaoto wrote:
> Sophgo SG2044 has a new version of T-HEAD C920, which implement
> a fully featured ACLINT device. This ACLINT has an extra SSWI
> field to support fast S-mode IPI.
>=20
> Add necessary compatible string for the T-HEAD ACLINT sswi device.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../thead,c900-aclint-sswi.yaml               | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/thead,c900-aclint-sswi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead=
,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-contro=
ller/thead,c900-aclint-sswi.yaml
> new file mode 100644
> index 000000000000..0106fbf3ea1f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-a=
clint-sswi.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/thead,c900-aclin=
t-sswi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo sg2044 ACLINT Supervisor-level Software Interrupt Device
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +description:
> +  The SSWI device is a part of the riscv ACLINT device. It provides
> +  supervisor-level IPI functionality for a set of HARTs on a RISC-V
> +  platform. It provides a register to set an IPI (SETSSIP) for each
> +  HART connected to the SSWI device.

If it is part of the aclint, why should it have a separate node, rather
than be part of the existing aclint node as a third reg property?

--wpxj4kbF4P50H8T+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZwANVgAKCRB4tDGHoIJi
0l7VAQCcJwp5mlLQUBYVUFyXHgPf8BzF8Or/9vxp2k5AEk6RwQEA3f2kGou1G/QT
TF05IWT4y9eslPEerl0gzCYGAYvw5Ao=
=55Uy
-----END PGP SIGNATURE-----

--wpxj4kbF4P50H8T+--


--===============8963465264400404446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8963465264400404446==--

