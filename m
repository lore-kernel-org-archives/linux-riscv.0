Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2743EFF886F
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 02:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eu6FPlkrHUoAlJWIsi756BGQHwz3lEtujbfDOov9xu4=; b=sENhTKRsshzDClryEC2vkW+kdP
	UxtYf6LCD2F5hvF5DKL3vrlTi1/Vp7uaV3c41n3b68/tBWZeYcks1Hk5pfTeoDqOu1eVpUryreGzJ
	EbJbaxVDldPxIUkiUCQS4lgjoxBPzvrQBuC84qOgHheZvg1+/b8kB7+vHhZbpbOa/Df8YpxrMxGyF
	w+knksbkHDPM3+S49qOkMTkIXtm/xZcrST3Lj3H2h/T2Y2PSowX29sV2nDPm/TQx9MEw0ggnLQ+pc
	z8xNw9F3f3780dY0tWk8vYVBoM0qe8MYavpJWMqIzErd11n7QlEm0kHQ1Uujvi8a5rdxQ7CT6or8E
	X+s6BnOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHuVj-00000002mKG-0ZQl;
	Wed, 29 Apr 2026 02:18:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHuVh-00000002mK8-0yzf
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 02:18:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64CE76015B;
	Wed, 29 Apr 2026 02:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7D2C2BCB7;
	Wed, 29 Apr 2026 02:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777429124;
	bh=vGSVbfAVTOpSVg1fm2QT59qVSHoz0uJHSJXD4xG06mM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E5IHIhKtVgkAVtcj1ExEsmkatJgBLFWB7W9wBJlC1v175fncWjLK0FcaT/THfDB8Q
	 VceqdeqaWKsSf351p1f9iwXkteowC68OHYcfw86IEP8dw2NXwHl6kYNJbT3i3wI28T
	 3ibahPTbSiE8K3qbPhNizRiCkkHM8cDSXUuH35Wb+FrWk4m4ewt5ZYdp3B0BiFP22k
	 1TWQQ1SVddrFv1p6JF8bNLO3+o74cQgqM3SqXqHFUczuwnDHyPMADEoJxurpSu6I5E
	 YUIv/EubEx0sZSIXd4lUgeUiJTso+ndSSKU2ve1p6UwW+eO/f8w3hjZlHsrJ4KTJj/
	 VceEGxELdw9Qw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BA2491AC584E; Wed, 29 Apr 2026 03:18:40 +0100 (BST)
Date: Wed, 29 Apr 2026 11:18:40 +0900
From: Mark Brown <broonie@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 5/7] ASoC: dt-bindings: add fixed-sample-rate property
 for SpacemiT K1/K3
Message-ID: <afFqgF6ZRwYdfUmL@sirena.co.uk>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
 <20260429-k3-i2s-v1-5-2fe99db11ecb@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <20260429-k3-i2s-v1-5-2fe99db11ecb@linux.spacemit.com>
X-Cookie: 667:
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
Content-Type: multipart/mixed; boundary="===============3770816002115935362=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3770816002115935362==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IS1KD8op5z8FDjax"
Content-Disposition: inline


--IS1KD8op5z8FDjax
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2026 at 09:38:50AM +0800, Troy Mitchell wrote:
> Add the optional spacemit,fixed-sample-rate property. When multiple I2S
> controllers share a common bclk, this property constrains all
> controllers to the same sample rate. This applies to both K1 and K3
> SoCs and is only needed when two or more I2S controllers are active
> simultaneously.

This doesn't seem controller specific, it should be factored out into
the core - the same issue will apply with any system sharing a BCLK.

--IS1KD8op5z8FDjax
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnxan8ACgkQJNaLcl1U
h9Ctsgf7BigM6trDym58z1FxPiU6RC6NIViof8JRu2+HoU5tOUI3IEfmeCu5RPjz
kNaDvDYvJRCpUnWNySV2bzDhChyCYHDeN4aReVbA4sqcgV8abNBd4evnVJ7gIbLX
YmZuymQocJ1SHzmJebkzMw+eJhTTGnMGKutZi6Mb+wHsfeqjZAJJUpsYE81dLG3Q
sHhkHg1pccPmLig8OiiCBsy0tpkwhOnTyM8Z4WQKi8qgvkiGKR0/fwbefUqRyETf
lNO4qPKH9aXZJ4BpyvM+sXdiKGxLTny65mqBGCpyLwhKivhwzFHlXf8Lsy8kvJZa
hJsLtDneM5uQH6jSfZU/w5hUU0Y5lA==
=d0Ef
-----END PGP SIGNATURE-----

--IS1KD8op5z8FDjax--


--===============3770816002115935362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3770816002115935362==--

