Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7EDCAC5AE
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 17:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=pSUxxoD4Kdr59tNtBIYb2WiyyU45/tSmsljjjgPxLTU=; b=ONY
	5k3uP/5svzaP3cflnd7qnHb44byh+e266whD8aWcvkMgsUY6QfX3kbZZJEnaWJKEk+3fGHt9G0G6M
	i8bYmwinrrNv3KD51Oz7h3sCwSl/2SJzzycm1YehT0M/7vAhcNV5EjYoBUc2VUju0tP76a9bjjJnh
	RzZGxKnjkmcEUvjGEMVj6DcuBTwg84Vocs0x6WYMdAG+4X2WUnEIsac60y3XfKgJvHex2wTh7OHng
	tXiDjzmx4+AZ9VsMRs5p+pamK1rZ28lIm2cZHrDbtNv2pIhbI1mC6hClpdQvO9+yRR1bxIwpN5lW9
	5cAtceOkQXPPAXNlKH0zuGOdNm5mGGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1TZn-00000002GUN-0DD0;
	Wed, 24 Sep 2025 17:46:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1TZl-00000002GTe-2hyb
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 17:46:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A04260139
	for <linux-riscv@lists.infradead.org>; Wed, 24 Sep 2025 17:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAE5C4CEE7;
	Wed, 24 Sep 2025 17:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758736004;
	bh=IN+QAr5tK0RV1rS3R/0YpjGQlOE9FqGg2X6T5EcrTMI=;
	h=Date:From:To:Cc:Subject:From;
	b=uZJuIas5bw2pPmUsPmIqhPhqcFbsi1TUf4DSZRqy0r7bTPxCPeQECcXGruBTe3tbK
	 W8rsmoTHas+xQkZLKcv6JOYHmvHFrsghaqD/t+brkA+B/LpGWowHhfTN0bRFaSBmRU
	 IFzdV7yvcaI55/fsuYLzjUMqFoZCmK0BxK1QE09M3Lp6xWy224uvAMzzwqMZzdsvv7
	 VTiVTzOxvZDhQJe8hY87naKozap5VMsj8MrRdewiTUx5j/g1/9r82EjkVvG4i9reOC
	 mbo/F+jrHM2xtkyX9Vjrj/ALA8yH5yPq1e27Ky6jbLbewZy2K06EsjGqmXjP4szo0R
	 LS37hem7dV/3w==
Date: Wed, 24 Sep 2025 18:46:41 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org, pjw@kernel.org
Subject: [GIT PULL] RISC-V config for v6.18
Message-ID: <20250924-unenvied-armful-5fcc80c23d19@spud>
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
Content-Type: multipart/mixed; boundary="===============7476898245145201070=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7476898245145201070==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4hQHISVyvhQW8+UH"
Content-Disposition: inline


--4hQHISVyvhQW8+UH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Arnd, Paul,

Arnd: here's the soc-related config changes I have for v6.18-rc1

Paul: I meant to come to today's call and forgot, so re-mentioning the
fact that I grabbed the savedefconfig reorder. Pull this if you need to!

Cheers,
Conor.

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-config-for-v6.18

for you to fetch changes up to 3df7ce0e43ad94afce24b6300e7836e2db6dc0ee:

  riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC (2025-09-14 16:34:42 +0100)

----------------------------------------------------------------
RISC-V config for v6.18

Enable the MMP_PDMA driver as a module in defconfig builds, where it is
needed by Spacemit K1 boards. This depends on a savedefconfig reorder
that it'd otherwise conflict with, so that's here too.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Guodong Xu (1):
      riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC

Yixun Lan (1):
      riscv: defconfig: run savedefconfig to reorder it

 arch/riscv/configs/defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--4hQHISVyvhQW8+UH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNQugQAKCRB4tDGHoIJi
0mUDAQCTjVN9vHQTzb1c6eYVg6QN3G1e9arRZtZ7q0DH88BYIwD/TbzFv763VQlb
pHORqK8dMo8mhkSzAZDc0XvVHBnfjgQ=
=UJgL
-----END PGP SIGNATURE-----

--4hQHISVyvhQW8+UH--


--===============7476898245145201070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7476898245145201070==--

