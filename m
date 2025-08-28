Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7B0C8303F
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 10:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dx4KtOFhxyPwP65sExS6zeovjSFa2/et1XvkX/4owY=; b=K7YUONkwOkHvk6AhfVlWW4Uwem
	tjXGN0JqtGYQDQ+BqVV01EXpJ/jc/jtN+7PNjGdaHBdZhCvaXE3IP5JwIGfTFwpkQqFZCrlZVGLds
	58wffBDNjWA7OlRdV83Olx33pQmjmcsFNm1sDJ4W/5kDNrCQtKJfZwGXT032Dq4ubKg/ci2Vt0V6P
	EdPPl5khtrpBvLEJwn31Shv1N9O+dPlHL2cXLFUe7xdA6PlDQrflVlVZ1rmFECeEt1IN4j6DXuw7S
	gALKobPvLK+zcra3B/TkUMCW9VFb6+4P/OPmrpZ04vmXWubxgeZB82bPJ1JDvBl7X2SCfTrpcB84q
	x1rGxE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZZX-000000015jk-1e5H;
	Thu, 28 Aug 2025 10:09:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYYU-00000000uLW-1cch
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 09:04:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E97440679;
	Thu, 28 Aug 2025 09:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE05BC4CEEB;
	Thu, 28 Aug 2025 09:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756371865;
	bh=TPlwEAqUUfxSYMur9BAnbzqR8t4bI14b85yX+aPJjns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SsmQzwibKQi9UDmQWzJ8eBbp2x0AJfyN+C2oWEp5wiHDYVhExt0dTHMLhdATQAAzu
	 juWMJc6wqmWUZYFzR274O8Cz9y3q8kr4+X8FpRhuOIZ9hnVzlSSyBMjgAjKNwHHxdp
	 5XDH9DHXJgj5bGUvf8LJUh+ksw4U4edtUfvnMkpuAr9k1yFvhsXm0P1L8BRRSruFKA
	 gIhUX8nCSEpRjpMCs22Pa//3v+Ez03Sv9tyGoGKHeJpqkBirTMQir2DNOEiZihl8W/
	 WUAhsV8d0365iS8oRZGTDJolo1quix0mQtRc8OU87aa7Me4CSQqZhZrXjIdhQ6H87x
	 Vmt/6d2YY1GLA==
Date: Thu, 28 Aug 2025 11:04:19 +0200
From: Mark Brown <broonie@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH v2 2/2] ASoC: spacemit: add i2s support for K1 SoC
Message-ID: <aLAbk_0emidBCJBn@finisterre.sirena.org.uk>
References: <20250828-k1-i2s-v2-0-09e7b40f002c@linux.spacemit.com>
 <20250828-k1-i2s-v2-2-09e7b40f002c@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <20250828-k1-i2s-v2-2-09e7b40f002c@linux.spacemit.com>
X-Cookie: Filmed before a live audience.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_020426_509489_B7D0D15F 
X-CRM114-Status: GOOD (  11.57  )
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
Content-Type: multipart/mixed; boundary="===============6688298582519537343=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6688298582519537343==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IrVDbH9LoaPONBFP"
Content-Disposition: inline


--IrVDbH9LoaPONBFP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 28, 2025 at 11:37:33AM +0800, Troy Mitchell wrote:

> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_DSP_A:
> +	case SND_SOC_DAIFMT_DSP_B:
> +		cpu_dai->driver->playback.channels_min = 1;
> +		cpu_dai->driver->playback.channels_max = 1;

> +	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) == SND_SOC_DAIFMT_DSP_A)
> +		sspsp_val |= SSPSP_FSRT;

It's weird and confusing that this isn't part of the above switch case.

> +static void spacemit_i2s_remove(struct platform_device *pdev)
> +{
> +	/* resources auto-freed by devm_ */
> +}

If this can be empty remove it.

--IrVDbH9LoaPONBFP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiwG5IACgkQJNaLcl1U
h9DEBwf8CjgP9iYOM59KBwLN1PBvfkTbqxuShgQ2esRqY3g9E+E0u4gOerkNFSIf
iplSbs8EnqnWhR0vLEu5R21t7bGFDO+kduLEd0RUAMteul7WigeidWdcYDUw7nw1
CsTv7yQi2IohE/ZX+ONm4Ym7X/78WJ1VsOQH6w6VHQjLKkSBHsrEgOPsjbIjfXUM
tDicL8Jqpi+fhWKxLtcUxnY3XTlcBqKVFXp/aJ4knGZfziOm8Lsw4vx3sayqy+Zf
qW6eGt67WEmVwjubXse+QXmS+qLJva9q4ryigYX6FG3g1F/H15oprXtRvBkSA+SZ
4Zp2HphxLUx8ofFWI1+JaROSETbkUw==
=UqWf
-----END PGP SIGNATURE-----

--IrVDbH9LoaPONBFP--


--===============6688298582519537343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6688298582519537343==--

