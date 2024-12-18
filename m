Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30662E77187
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 16:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=EGUBcwoaudDQBWCRYXeTyP5wTAXf0iQzi4vRhnz5bLo=; b=a1d
	Lni0vQW1wilwLYqECEDy4g4KcoCXMpDzXftPnn35VPOJE8pP7YMywy4LSrwlIrRUsf+on13Jk315I
	dINmMsGQ3uy4RdWMzJuZSbXZIzm1RvF5JHUGnO685VhtHPq1eindZ9HZlonZqURQ9hw9qr0AJ7DFh
	k6aNknf9w+FyT89DqKHe1Vs+ws8i7Y7Wykc5eysBf4UBc1kJKMGCOtq0eQ9ln4Y7f9F4THBmHZSJ2
	wIwGnNnZjp4ikPY7uEJtqsPWVZt76fQ+WZ4i77ooPD6OmNyF+GSkBbP+CZ5Yh8/7tfzbr8JnmjwiG
	NcB/dTKFdh2J3P7gmlApTujnSNYHhkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwUd-0000000H7rp-2e4Z;
	Wed, 18 Dec 2024 16:01:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwUb-0000000H7rI-0qlw
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 16:01:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 995385C61B0
	for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2024 16:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97471C4CECD;
	Wed, 18 Dec 2024 16:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734537704;
	bh=qdHW5otulf4HTDNiE0pQJd0SuyNYYOBuZ/0SONWab5E=;
	h=Date:From:To:Cc:Subject:From;
	b=lymIAex14ih5MQHuwJMiehdr06kY5uLpWZHewta62uSRYgPnbaIVSkOQY8CII+IU2
	 vjlqLx/XmFxNq3yqvHObuXWW/3pJd2y3MFVRL9lbMTpRmSc8dJNfYtqxqG6Fdvi/Sh
	 9R+kHhVC6WsZauYlEJjngSfFFLMXcQXuOl7LU6UP0kfJsjA/eRyeHSDmddffi9pb0l
	 +5sNQSIKvOJHf+Wpmb+quvsjV1RCAn7sxne6eym8v9nbPHEihk7GMGMLrqVuEoHIUZ
	 fYsywgBsUg7snItv8PJWNxRiWLUcU89O7P6Sjafhx0lq/7a5axVN4Hp1ZxLF78jZGN
	 DZehxgL4RkbIQ==
Date: Wed, 18 Dec 2024 16:01:41 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V soc driver fixes for v6.13-rc4
Message-ID: <20241218-suffrage-unfazed-fa0113072a42@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_080145_285036_3D1C6078 
X-CRM114-Status: UNSURE (   9.67  )
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
Content-Type: multipart/mixed; boundary="===============2918775243321285605=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2918775243321285605==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D+ozCC79uGWzFle7"
Content-Disposition: inline


--D+ozCC79uGWzFle7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

I know you sent a PR already this, so whenever you're sending another
here's a patch for you :)

Cheers,
Conor.

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-fixes-for-v6.13-rc4

for you to fetch changes up to 48808b55b07c3cea64805267a5547f03e6452a9f:

  firmware: microchip: fix UL_IAP lock check in mpfs_auto_update_state() (2024-12-05 15:08:51 +0000)

----------------------------------------------------------------
RISC-V soc driver fixes for v6.13-rc4

A single fix for the Auto Update driver, where a mistake in array
indexing (accessing as a u32 rather than a u8) caused the driver to read
the wrong feature disable bits.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Valentina Fernandez (1):
      firmware: microchip: fix UL_IAP lock check in mpfs_auto_update_state()

 drivers/firmware/microchip/mpfs-auto-update.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--D+ozCC79uGWzFle7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2Lx5QAKCRB4tDGHoIJi
0utfAP91310tbtmnNBMMiMB0g6+daa1t2HdSspG6/Nj0d9DTVgD/c8Uz3Dyv87nq
SkbDI9ndbUCTJTu+k332RYcFqQJa8QU=
=6CbS
-----END PGP SIGNATURE-----

--D+ozCC79uGWzFle7--


--===============2918775243321285605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2918775243321285605==--

