Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064F8C02182
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOcMoxUPgT+PyQr0oupZVI1f4bVBFFhGaj8btW7P2g4=; b=3ZFhKtPLLyxN/GoCMKv/Qw6l35
	07Vqx6F5ku0yNMCsRYqQKxjNpM3TSK1WRcSmDocYfe2ggNGT1Nu+gnClFgTR17I3LexZXrN5lqHlY
	jBHgmULCyyIMaJz8n7z/j5SCp54gSCYMSXgFLXLiDckpiDiTHurup9dnjDqlQoNSd+/4AwsgMNKgz
	anKqYpuQUCrUNSnAuCQGkXcPCRmKWfvAx5LhQvWyM80YinMMjHqC3Lj7xyF9cBvCqjxlkxp4FwMrt
	Lp5U4OKw+JXkmyXjGKfpx52+rTn37C8TfeFDmfynxk+r2CBAp+LgUKjFr6oYI0Vd0OcE7FCuS1UmF
	Kx3SGGig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tayw8-0000000Cgsy-4Aps;
	Thu, 23 Jan 2025 15:16:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tayw6-0000000Cgsd-0Vk4
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 15:16:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B2AA7A40BB7;
	Thu, 23 Jan 2025 15:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39CC1C4CED3;
	Thu, 23 Jan 2025 15:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737645360;
	bh=hO/M+SZqqgKYIoTGLg+jgxAyd+xAFmjSZk4ZQKtWISQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U4IYR7U/zgYenZLCTxVYUZ3IMKNHciTZEPhw4L/gNt+aTAUX04QIojTIda7KH1+hY
	 Sp+56BCI5LQ8bi6nBG1hveC3p5Jl5DvuOneHLPIgcsfE/ql3NzBYapPNnU/44uJNdC
	 FOCkijyLN2WihEL62h5H+3aX3C3EUZhEe9vIePY7MGVW1Uc2jid3faEOiGioGHvP8V
	 Bn1oj6iI/v+Telmp7f5Ib0jPR82NQDDwmw9WIpq5IFNCWKGd/URhKSiMhmEKkoKTLP
	 DKB0KsxrRiHreHUhz+fsF/p1T6EGJc3TYbondNiqH6PSho4Gg5jShjIBbR8RYZWil1
	 22msgHVBZXyOw==
Date: Thu, 23 Jan 2025 16:15:57 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-pwm@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	stable@vger.kernel.org, Daire McNamara <daire.mcnamara@microchip.com>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] pwm: microchip-core: fix incorrect comparison with
 max period
Message-ID: <r3dybh3ef4lbneruiae4s5co6mkgsowwucba6niqv23tfycyza@qnklz4w5rnnr>
References: <20250122-pastor-fancied-0b993da2d2d2@spud>
MIME-Version: 1.0
In-Reply-To: <20250122-pastor-fancied-0b993da2d2d2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_071602_224559_59A8B4AF 
X-CRM114-Status: GOOD (  13.20  )
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
Content-Type: multipart/mixed; boundary="===============5934115806428233080=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5934115806428233080==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a56xps3gn2qlgwig"
Content-Disposition: inline


--a56xps3gn2qlgwig
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] pwm: microchip-core: fix incorrect comparison with
 max period
MIME-Version: 1.0

Hello Conor,

On Wed, Jan 22, 2025 at 02:42:56PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> In mchp_core_pwm_apply_locked(), if hw_period_steps is equal to its max,
> an error is reported and .apply fails. The max value is actually a
> permitted value however, and so this check can fail where multiple
> channels are enabled.
>=20
> For example, the first channel to be configured requests a period that
> sets hw_period_steps to the maximum value, and when a second channel
> is enabled the driver reads hw_period_steps back from the hardware and
> finds it to be the maximum possible value, triggering the warning on a
> permitted value. The value to be avoided is 255 (PERIOD_STEPS_MAX + 1),
> as that will produce undesired behaviour, so test for greater than,
> rather than equal to.
>=20
> Fixes: 2bf7ecf7b4ff ("pwm: add microchip soft ip corePWM driver")
> CC: stable@vger.kernel.org
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Applied to

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fix=
es

which I intend to send to Linus next week.

Best regards
Uwe

--a56xps3gn2qlgwig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmeSXSsACgkQj4D7WH0S
/k7MxAf9H63osdnsvlMLvftXzklq8mHrUZ0AzQydxMcDuwrFSkDpOV0V4fgOM2Op
tQHZ7fLR74Hj2XUZpFgMTeZ8ZgsEI6ri9EcDzMQFGZTDV2qbkic2+6B9EOIwaWaX
E5Vyri0ZoI89mm1hfPIO3Qwe+ApftvMnsAJtgsImP0JX/r0ZxAmFk+5wuBqcakR4
bJ/kzTmuBdAdypT+yNzf8KpMtmRzdSQKKJd2qM0yE05/HMlgsjqzSmWJkwPI6H5V
CmxmkAs1y82xZ8jaOSBwFxDNiHj5glGOb0xY/gKf3CWAEr3s6YiA3kdlDV0q6o2P
Iv0/ROtuw/PVnWvoyweffxJYh22Cdw==
=fEw6
-----END PGP SIGNATURE-----

--a56xps3gn2qlgwig--


--===============5934115806428233080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5934115806428233080==--

