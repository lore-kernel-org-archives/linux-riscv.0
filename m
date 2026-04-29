Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB094FF886F
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 02:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoTiWj4MOHjHGY95pW/q4w7T5f8BBRnYmmlWUrad/vg=; b=heLLtF2sl1D9L0MwfpflZ4mrkP
	RxiTgB3BdjnqEwa1POh8JmX5EnX+TGYHs22a5g5a4OAf5U6VNHwKiPgFNor6UMNh9siDRgvV839yk
	jy5/8U0I1A0K/wkPmCXttj3JmhyKV74KWTAwIwUcAiXoUO9G65bBBqBoMgP8gRnEKS2B12ygZg33B
	1crH2uKLcTKZJUU6KU/m/Fkv0PPeCoYzGR2FuhiaYU4+YHkvpWx8k5STpHAgM1OYdmAqBW6wmU/di
	VcvCZoMbZKygI26Z2E7tB4o6H8wUiPsMpEidAhuNDTWqt315bffPGdgzjqgCrwToRx3dyqZbwKFV4
	BSN1g5YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHujF-00000002mxb-3NhR;
	Wed, 29 Apr 2026 02:32:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHujE-00000002mxP-16Uz
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 02:32:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5FF06015B;
	Wed, 29 Apr 2026 02:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC3EC2BCB7;
	Wed, 29 Apr 2026 02:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777429963;
	bh=W81uUkEy7KPTgF2Dy6r7p6wtBRPqM/IKhBRulVRDGqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/XHH52y+VDppxvjzZBqtfA84pxQIkexvF6YIBtaWKuBGO9vu2sPwNrq28NUBuPjR
	 gDeB3+BuWF/6ce3J3rQXUtOoVAw/UfvOWg8IRalE7ApPQLb0414k89ellV2F7s1w2R
	 cTY77uzdVHo9Ffw8HpHqTPCBHRGTRoqr4UFzvHAPZLGhr0m+Gsqnms3mrVR5xmuuPq
	 Kk7r27+7agDolB4ebq0N3GcUQNrRCDMwsy+nyz0pxpb8bgx5s6mNco+/9lh5GcH5a4
	 eYtNyZK5p0efltfGz6qOzR+UxTP6jfePwGBcACd4Fvh5xGIBiZ53UekiSfcE13ersK
	 lY/JB8D4zPxhA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B480D1AC5851; Wed, 29 Apr 2026 03:32:40 +0100 (BST)
Date: Wed, 29 Apr 2026 11:32:40 +0900
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
Subject: Re: [PATCH 0/7] ASoC: spacemit: bug fixes, refactoring, and K3 SoC
 support
Message-ID: <afFtyCuA28042C3b@sirena.co.uk>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
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
Content-Type: multipart/mixed; boundary="===============2793336800563683627=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2793336800563683627==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AdB0/2Kbr7dgh/8k"
Content-Disposition: inline


--AdB0/2Kbr7dgh/8k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 09:38:45AM +0800, Troy Mitchell wrote:
> This series fixes bugs and adds K3 SoC support for the SpacemiT I2S
> controller driver (sound/soc/spacemit/).
>=20
> Patches 1-3 are bug fixes and refactoring for the existing K1 I2S driver:
>   - Fix RX DMA params not being set when TX is already running
>   - Move hw constraints from hw_params to startup where they belong
>   - Adjust FIFO trigger threshold to half FIFO size for better DMA
>     efficiency

Just as a general thing there doesn't seem to be any textual overlap
between the fixes and the new features, it makes life easier to split
things up - the individual serieses are smaller and it's easier to avoid
dependencies that cause issues getting the fixes applied.

--AdB0/2Kbr7dgh/8k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnxbccACgkQJNaLcl1U
h9A9+wf7BD/aVPdConysbSRuDNL+sUcw7BM99xirg8cM3j76wF+UIg2DcytGtqhW
oa53CpnKiqeQV2gvRBCLtNLC3ah8N6/vqDwk2Tjn8L/WfybcAU/zDUwH5mUfezQn
A+3O3GSnzYPV6xK+0neGwofZ7w9ymGCQaUHLMGea1FH4aMos7g2JbncIuEY9QIcn
U2ZmTnlHJrPRG6VWZXPnbYOBLeJrbA90KesWkzH208l4N3FetXMFAird89S3DFnl
VmW3zNR1ZcF3GA2EugFcRTVaEfgkHTC2H8WhEMX+zuxxTsaEOyZZ7MpcIEVn+2Gy
bcnhE3bQTMLU7iGu9JBHg3prOIdQ9Q==
=UUPA
-----END PGP SIGNATURE-----

--AdB0/2Kbr7dgh/8k--


--===============2793336800563683627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2793336800563683627==--

