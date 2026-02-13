Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A3BEDF157
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 12:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=9dawGy9INKz9p77Dprwf2KmUFf7wnW59ipuUTRT8IqM=; b=qUZ
	AFPYf/mua5stnVBssS9T5CRb570t7Bon5eeBbrV/vTp3aUnrFOUkOyJli27F/IqbZWA/nBOlL3zk2
	tkpOvhmkqyYbCxtAIQpLCjM2E7Ecth4a3TYkKJ3sbBhybUYt71htVkZ/aVPPRvaxK0qAfUCL/RoMO
	Wfll/IzQ7AM1K5tlrJAWOzBs8NdCMS9ri8TS5m4eJXolWcpWjWGqxHLaMJ+0VpkrQ052VsC2bCyq7
	ipjDYuHCPs1xyHyMhuCLI8p12CM0FjRsfTn5Z7BkWKw3ezeX7mTWxqA+1B9B+yfhRAEyU7D9bA3LE
	PImatPpjaPb151/Hywzp1oro7ARCa4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqs9n-00000003RRh-3ZPR;
	Fri, 13 Feb 2026 12:20:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqs9l-00000003RRM-1Tqs
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 12:20:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90E924363A;
	Fri, 13 Feb 2026 12:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B2DC116C6;
	Fri, 13 Feb 2026 12:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770985220;
	bh=mRj5YS/dbQQfv6rmffWCjJcONP8Aig83NSsn4JexlVA=;
	h=Date:From:To:Cc:Subject:From;
	b=m37q9ytrj7hRF7yZqySYYxgA7Nnsk+Tg1N4OY6jYBbUcRVIpnjr3Awih6iGQLkY0r
	 yf8ZPDs4x/r/ysMwkvc3euJr6sepFJRTpK7I4uMElqomSc3Cr5HIAMPl+yb8GLFBxb
	 RA4tF2ke9mNQDbohTKPcwnPje5mMPQ28CsnX85MluwzMz1sSz+MXvXBXic4X26Mlhe
	 hU2oYAAqpFMzfPUdcl+oEFg9rQD7QvXE7Wr08tvz0FyurDazx1hSW7WvnMqXTrEjey
	 PvFarKGdV/2pCho4pZd0haQO9KsmOQoLKmcp5AOqVrd0LA+dXeP4cUbKUQLItN95u3
	 s1KbahlkU0U8g==
Date: Fri, 13 Feb 2026 12:20:16 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, jonathan.cameron@huawei.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V soc fixes for v7.0-rc1
Message-ID: <20260213-stole-economist-d5b0ac711d42@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_042021_444029_11EDBAC0 
X-CRM114-Status: UNSURE (   9.55  )
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
Content-Type: multipart/mixed; boundary="===============4875588275468673381=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4875588275468673381==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1bHQZNbPCAIvSPgV"
Content-Disposition: inline


--1bHQZNbPCAIvSPgV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Nothing super urgent here, but figured I'd send before -rc1 in case
there's a second new content PR this window and you can squeeze them
in. Otherwise, of course this can just go into whatever regular fixes
PR occurs later in the cycle.

Cheers,
Conor.

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-fixes-for-v7.0-rc1

for you to fetch changes up to 0528a348b04b327a4611e29589beb4c9ae81304a:

  cache: ax45mp: Fix device node reference leak in ax45mp_cache_init() (2026-02-06 19:54:40 +0000)

----------------------------------------------------------------
RISC-V soc fixes for v7.0-rc1

drivers:
Fix leaks in probe/init function teardown code in three drivers.

microchip:
Fix a warning introduced by a recent binding change, that made resets
required on Polarfire SoC's CAN IP.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      riscv: dts: microchip: add can resets to mpfs

Felix Gu (2):
      cache: starfive: fix device node leak in starlink_cache_init()
      cache: ax45mp: Fix device node reference leak in ax45mp_cache_init()

Zilin Guan (1):
      soc: microchip: mpfs: Fix memory leak in mpfs_sys_controller_probe()

 arch/riscv/boot/dts/microchip/mpfs.dtsi     |  2 ++
 drivers/cache/ax45mp_cache.c                |  4 ++--
 drivers/cache/starfive_starlink_cache.c     |  4 ++--
 drivers/soc/microchip/mpfs-sys-controller.c | 13 +++++++++----
 4 files changed, 15 insertions(+), 8 deletions(-)

--1bHQZNbPCAIvSPgV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaY8XAAAKCRB4tDGHoIJi
0ukwAP9U3k8dWwMY8LV6dorfZ+gwYjZ3OeZNfxsaz2YoLhGpTwD/Q0v3VCZ2EbNu
Crx4v2DxOQw4BBRKUu8BC+DgwTuz2Aw=
=MF+S
-----END PGP SIGNATURE-----

--1bHQZNbPCAIvSPgV--


--===============4875588275468673381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4875588275468673381==--

