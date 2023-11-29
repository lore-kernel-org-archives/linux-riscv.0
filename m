Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B2FC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 14:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3XUoFGPsX95kZjO6d0OxRMjA1LEOjUXZ5J0pHvcSj0=; b=cnkw39KxHWVbBUvdoOAJH2ovYS
	o6SdwmaQTw0ImFqzBQ9YRhXswUqyajbIM13OUC+SAAKqtyAwqFnl/Z0UYT4BHEqy2zX1IqOcjIXn9
	A5OM23bY7bciybYF629++mPRW4tGmxKV/b7aAh0SCGryyqiEFOLSh0VssM9L2WLrpthQdYM864MfO
	oMhyXzebUzLLHQrfZjDLoUWZnYUyJKONC44xQk1LHtIWX6MfEsDMNuzIUg9GbZNb57LI1VWt5Decn
	+29ylOIAkhGllJwmNBQ0SuLGQw4l8Dy1z498TtL3j4VXdvZD6Tn5MamfOTcR3UdDw5y9ia5511y8H
	58WCNLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Lpl-008g6L-1f;
	Wed, 29 Nov 2023 14:46:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Lpi-008g5T-2s
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 14:46:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6D416B83D50;
	Wed, 29 Nov 2023 14:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C45C433C8;
	Wed, 29 Nov 2023 14:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701269192;
	bh=9GQN7/hdcUEnNmQ493lxzKNysjRFZYQgbQLVbB0NNY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AxJ4H6GH8+xeJG2+XoamWN0mDamr/sM05A315NvSSf1ymw1jRa8ZCdNR9pqMwNgkq
	 qIM4tFsZF9JRaPEM+i4HCzRjYICUDhNtU2/13si1TwKGqwIM0pG0OIWcMoMSxMulJe
	 cpnCo5WCPx0+4gq4/akUPV9jjcBGsN1UC+MQqA9n1btENC2kuGPdbA/9uGLBlnmeKc
	 PpoE0AknaGzWPdQePVe3GRsvGYvODK+QuY/AEN1JSPaw4+9/Lq/Iibjtz54xgaPvXa
	 ZCXionHWL5eofhyBe2zRsnCkLj6mR3YKbYYu2fEBf+Kfre56CbwO4FvsGyp7Apb3Kr
	 6gONbu+1c5xRw==
Date: Wed, 29 Nov 2023 14:46:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: kernel@esmil.dk, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	krzk@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	daniel.lezcano@linaro.org, tglx@linutronix.de, anup@brainfault.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	michal.simek@amd.com, michael.zhu@starfivetech.com,
	drew@beagleboard.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Add StarFive JH8100 SoC
Message-ID: <20231129-thrower-umbilical-f11ee0749800@spud>
References: <20231129060043.368874-1-jeeheng.sia@starfivetech.com>
 <20231129060043.368874-3-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231129060043.368874-3-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_064635_080455_728441C0 
X-CRM114-Status: UNSURE (   7.63  )
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
Content-Type: multipart/mixed; boundary="===============9041750934983278756=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9041750934983278756==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iOelv6T+mj3cWbE0"
Content-Disposition: inline


--iOelv6T+mj3cWbE0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 02:00:39PM +0800, Sia Jee Heng wrote:
> Add device tree bindings for the StarFive JH8100 RISC-V SoC.
>=20
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--iOelv6T+mj3cWbE0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWdOwgAKCRB4tDGHoIJi
0kUIAPwM427aA3mlP+6PzIu9owQq54/yLBLKInM1yuRBzap2PwEA5w++iYrLinPx
NltepIkT2aOJNelqv2QZ9nPf/t8MpAw=
=jdE6
-----END PGP SIGNATURE-----

--iOelv6T+mj3cWbE0--


--===============9041750934983278756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9041750934983278756==--

