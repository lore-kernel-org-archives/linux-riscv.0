Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947EAEE01EB
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 22:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=UYG9C+jyxc0qwURpGNKjSgGj5gZQxPOuJyeGwgv/a+0=; b=NrC
	s+cZhyBEAZlNI1Mur5rwCTbhC8yjmmgx24SzeoX5dDcUhttrqhFg6E1tbGfbAK5RdUv1m0hWEyagB
	h5cRt251FxGmHe+6XUR+zZy/YBWaOm1/4jLpW2Gy4OFFN+nzs3UGfazRVDCMmuD/oRYQ2syjf0cMU
	JM5+mB0mKeoHxKsQ/mQ1+5yItdERTo4HJdXDY/+vEC1tCPWV01wjkHDSlisGKqCG3aBgqP7YiUNqP
	i1F3DXv/R5CeVvh4m/mL3dxtl97KPj6PIsLgZJpr+4VmpYcwOnW6l1IB9m4pUYMXD40f1iFDVQ/ks
	JhDWRwKQHncu2zhUL3qUeMmED60eY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so8wK-00000007G6E-2rEN;
	Tue, 10 Sep 2024 22:02:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so8wH-00000007G5F-3sef
	for linux-riscv@lists.infradead.org;
	Tue, 10 Sep 2024 22:02:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C3B3C5C0535;
	Tue, 10 Sep 2024 22:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062EEC4CEC3;
	Tue, 10 Sep 2024 22:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726005741;
	bh=y7w4sfdixGiLqhSxoJLTOPd76eVwqCLaa3m6abWtlAg=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=uK+hucoTvT6mn0wIHUCiZ0FtZW7XoFZiopsIWf3ErpwV58udUTGtH75AedtBi6cCk
	 bzlEdYrLb14pHgxJvb15YATCd0+H8hYlmDgVPiXhWvKIZf5nCX+d534CZAffLqW4wf
	 wxr5YhMkd5qNROBCBDq4dvtyrgedUS0nqf1d3xjE+gzQPnOZ6B8pGRfooHUBKTAhpv
	 8n0tOMn1Hwhtb+NnlZBmDmNl2nbcUBuK2esMTXn7+Fx4mg8M1YrSlGHe10iyWnJRRJ
	 GO9CHWBdJy9rNA+9uLeyCnmKZjTTLJn1ydOpGOKlOz7Wm+ArQiy+/QDTwAY6cUQr4n
	 hy1jteLKfc5rA==
Date: Tue, 10 Sep 2024 23:02:17 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V config for v6.12
Message-ID: <20240910-annex-ravage-07d63041a7c5@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_150222_034312_9FA6BE3E 
X-CRM114-Status: UNSURE (   7.12  )
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
Content-Type: multipart/mixed; boundary="===============2535931206423146765=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2535931206423146765==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yP0QS5j1N9BokM1p"
Content-Disposition: inline


--yP0QS5j1N9BokM1p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Practically nothing for you this cycle, so this will be my only PR.
There's both Microchip and Spacemit stuff on the lists, but none of it
ready for this cycle.

Cheers,
Conor.

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-config-for-v6.12

for you to fetch changes up to 72160ec6cb12613663f26d89049b95f8dc9fa000:

  riscv: defconfig: Enable pinctrl support for CV18XX Series SoC (2024-09-09 12:55:53 +0100)

----------------------------------------------------------------
RISC-V config for v6.12

Two patches, enabling clock and pinctrl support in defconfig for Sopghgo
devices.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Chen Wang (1):
      riscv: defconfig: sophgo: enable clks for sg2042

Inochi Amaoto (1):
      riscv: defconfig: Enable pinctrl support for CV18XX Series SoC

 arch/riscv/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

--yP0QS5j1N9BokM1p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuDB6QAKCRB4tDGHoIJi
0hNXAP0YwgjXERXateyyMSzrmh3Ax84qnZUGVW/ofoKk2cVTLAEAx6V6QwqDSvuW
ELWvPRfyrTazD2XyC/ukrX05gjbSsQw=
=0yyF
-----END PGP SIGNATURE-----

--yP0QS5j1N9BokM1p--


--===============2535931206423146765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2535931206423146765==--

