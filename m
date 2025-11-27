Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEC5D111A8
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 16:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=7ikt3FudSkhzJdAoJXOpkhN9hTcjQBkF5PghOgBrEgQ=; b=oSz
	n3uIiGwMQhsUaWySjQwYTu7P3IyAcg4ZTP6FUfvEFWV2WdooO29TGbCCj6G5cAB8N1hFp/jbeg/0u
	TNBonytglgr3S9uDBPnJaHZiqrM8BxU7BQHacXB5hsaJqRFsTwchH3yGp2Mp2UqzYwCcxltkT0EPB
	Uf8YucUKQQdDaM4UB4yUdNG9z6VOK6siIn3EPDwh3pUDiXmwVZr2oB2azxSF+461tSURP9catfmzj
	jidvn0H/FyPYGHZCbanrQ0oNH6K7T2owKWpNXFEeNythCvHCc2RDh+3Vq4sREa0kM8hMr1mwT3XEZ
	/8+P4mjBXpYcZssPqwkG3uMzTsZREAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOezI-0000000Gw5b-1RHI;
	Thu, 27 Nov 2025 16:36:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOezH-0000000Gw5N-23Qd
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 16:36:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD78C6022B
	for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 16:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96888C4CEF8;
	Thu, 27 Nov 2025 16:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764261414;
	bh=Aa6TofsDgEtlr/eVXyb0tnk9QiuGSJrfHim0d0dEtuU=;
	h=Date:From:To:Cc:Subject:From;
	b=NvXxf7DANd4/o5pEdsxmGwFcmVANV5Hnxf2Q22nrM7BaZrreYTx4KjiXR23SNOsMI
	 secQiWLAWlau+7eXACzzOuoufutI/jlbiq9cnFnDLmts5FG68LIX3/UPqUJNcrDy1w
	 n0LgSt/JiINJD0gu0HXPsvfCyto9jLvQtSl0Ju/yJ6wokD1VpkCdS92pyAEHG/EHUy
	 nsOBJXZkdX22b7Leu8EDgLRMasWByiDtX+Auu4OjxQ5HQjW7Jpii2HFLPvx3KD4I4z
	 fHy4L+GvBnJWAAqEHearF4rc0vz2qthDQRTtaWCwKNf3jPyx2Qtygb3e7s0zoQEuFJ
	 DFFnz4ba30hfg==
Date: Thu, 27 Nov 2025 16:36:51 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V config for v6.19
Message-ID: <20251127-saturate-slam-ab92576bcca7@spud>
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
Content-Type: multipart/mixed; boundary="===============3191016551937122569=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3191016551937122569==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d0a3FAk5e90PPeWm"
Content-Disposition: inline


--d0a3FAk5e90PPeWm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

On behalf of the spacemit platform maintainers, I grabbed a config
option, so here it is. It's the only thing I have config wise this
time around.

Cheers,
Conor.

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-config-for-v6.19

for you to fetch changes up to 3187e25eb2705dec9f0509f6e42da7e018718c74:

  riscv: defconfig: enable SPI_FSL_QUADSPI as a module (2025-11-12 11:26:51 +0000)

----------------------------------------------------------------
RISC-V config for v6.19

Spacemit:
The Spacemit k1 wants the freescale qspi driver enabled as a module
as they appear to be rather similar IPs.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Alex Elder (1):
      riscv: defconfig: enable SPI_FSL_QUADSPI as a module

 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

--d0a3FAk5e90PPeWm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSh+IwAKCRB4tDGHoIJi
0iJMAP0aRCYPja92Y3M72E7oDltBp2qgEIk2bxJ2S873n8H6LgD9El+Vagf/hr1N
bAzmTjiFY6AahhQHcTavEeJ3aa4zKgk=
=T+S3
-----END PGP SIGNATURE-----

--d0a3FAk5e90PPeWm--


--===============3191016551937122569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3191016551937122569==--

