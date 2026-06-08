Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CE3CD8C9D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 11:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=32ow2guhJZl+WrxUBECjrnoJQN+FT1kyIwo6kzd9Qjs=; b=fL2
	fSTOh1S2wYst7mrHiuBC0lXzgtLDf7W67P40JqgTnGaq6VRDLhnh/CZxjWAxjb/5T4F+DnRLEpJpD
	ci2dmFh2euDFdSaL0pU5TYp9lW7C7xEUCkfrFTFUx5sm9Rmh/kzJgmSTiuRQCstqRirnuFOE+vofC
	kpJrYso9rt6pvIXUg2o7/ROyOD6bY7LK9w6PTaFS1Bq74J2dFP9+gmhK8aqIqXnW8fgLZ/F5sbsi3
	1XvIioRnBZ7Tn+gCgcxiC8CgRzFWFHEbn90PWKg4VdMCLIU9lyNTyl4DftDL0GcnHmSX7nl/QMdoe
	E1GDT8EjXx7uyeo3Cq8n18mADasZvyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXxw-00000003P9j-3AuR;
	Mon, 08 Jun 2026 11:16:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXxv-00000003P9D-310C
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 11:16:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2007842D7C
	for <linux-riscv@lists.infradead.org>; Mon,  8 Jun 2026 11:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37CD21F00893;
	Mon,  8 Jun 2026 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780917383;
	bh=SWeNawLNhjULISRTxxyiDbsmHwEMxRPRgtI7FlyYxgg=;
	h=Date:From:To:Cc:Subject;
	b=IU6Ph3/wOHLQkTZo5izOY5o7O28nPZD9bznAMBRPPuPaPQASjs0wSiz+fZ/J3qA0o
	 Jqqq91JDDzEFpDzwjgiMGTvhJYZnWj3iuqubW9UpmA3BubNW1V682GgEFbaGtdTHie
	 YQrKh8FPf8ssd3B6h/R/i7iUt63uEnpTElDj1UrzlfD4u+HbsTpya7/8NLalw9bAoC
	 K3wEkQOGQxX3rxOGefDs0k2XPrh8A6ICfGfvZg8ZICvk8dEfSNNdxURUR8Pei6Fqke
	 7P24dL0+E9vwZF7rzdvZCagnRDr5QWa6VL6LE29Bq2JuU+nxMWitB7KBoTKdDH/dkg
	 sjQdk74n2MOaA==
Date: Mon, 8 Jun 2026 12:16:19 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] Microchip RISC-V soc drivers for v7.2
Message-ID: <20260608-vacant-slit-9499ba5eb8f2@spud>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============5465909717040316876=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5465909717040316876==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/r+1Y7YsIXScGctB"
Content-Disposition: inline


--/r+1Y7YsIXScGctB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Another single patch PR here, this time with a binding change.

Cheers,
Conor.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-soc-drivers-for-v7.2

for you to fetch changes up to 17d9064987ca4e0b05b670da48ca93edb0796810:

  dt-bindings: soc: microchip: document irqmux on pic64gx (2026-05-21 11:00:05 +0100)

----------------------------------------------------------------
Microchip RISC-V soc drivers for v7.2

A single dt-binding compatible addition for the irqmux on pic64gx.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      dt-bindings: soc: microchip: document irqmux on pic64gx

 .../devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml    | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

--/r+1Y7YsIXScGctB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiakgwAKCRB4tDGHoIJi
0kcrAP9cpEQRIO74ZkX+A/x/04CoXO+GBWKwUdefvC+Ua09nfAEA6hBz7rT9hqoo
LVcmf1tBYT8JUivr1+Hwq00c3bRIqgE=
=gA5l
-----END PGP SIGNATURE-----

--/r+1Y7YsIXScGctB--


--===============5465909717040316876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5465909717040316876==--

