Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D97ECC6B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 15:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=cllt5qRTFrY7+SxmrhcCGU2ZcdlnSbXGx/kPw6Hd1wI=; b=r9X
	GSOErJKF5HvsVCcnZFWzZgbzK6gUaOVVoyf42mYn0HKFYkp0Xi1rU1428F9BIQxfrWCsjrzQ89d3Y
	VjdUYJ292RgIbNZ1M5MnmuZmoqhklmcHvBBoXiHn2kmUfROj1D1MCqwdBEoSFWuvCNNWoxVsnJPwV
	pctjvGASYMDh7TyrNHroN8XPvvYQvs5mK7z0K297duVMAN0rhdkABad9KOjr6hBdwR3fZCNqzSruH
	1kIBaks1dCzHLSXrnYGYpCOj00wJc4rvDbqLPx2++cKzpQ+uX2h9QFXZpfvAfYZzos81fzyg6KWSc
	LWASCmNpxrVnqb+Ag8rG8wVDVkSf0aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeCu-0000000DErc-1gXh;
	Tue, 13 Oct 2026 15:14:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeCt-0000000DErP-0IiZ
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 15:14:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 548B460A5E
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 15:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C031F00893;
	Tue, 13 Oct 2026 15:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791904462;
	bh=D0utRe0E62LZUgbcNlAyaZfvr0Rzwu57gIO+FlQ0APE=;
	h=Date:From:To:Cc:Subject;
	b=dbZvV5w+FUVkh/Huf85LYfrrPlgLJyVq/lba1pWxPhJEAE47KeXzmAL0riF1p4gVk
	 yPOkJ3sSCaAxcH+SiHbvFZHw+59cC83QhL+8WA8kPpDRGSbcjNFFzv46E42H7ZUprs
	 MtXUgoMBE+WhOWD43V7bESvX0BuIjKcXXnSUdnGEjudLBWrrP3g9lrbAICONbOUO6G
	 n7GGbBjMKUuRoXo8GMBFXN+D7EsDIr1k/tF682YweXWRYYCqe9ku8u6+U+/c8twRZ/
	 1WuDFEmzws5mKpvpg1NOuVzE6dxRZeCVoignc18watgAZ+aI0R5nQIQ+YEj3xan3eV
	 IM8wL1m7PupTg==
Date: Tue, 13 Oct 2026 16:14:18 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL][1/4] RISC-V firmware drivers for v7.4
Message-ID: <20261013-defame-busload-7eeb111f35ce@spud>
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
Content-Type: multipart/mixed; boundary="===============8096146646426862031=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8096146646426862031==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jNpu6dllGuEb8pJn"
Content-Disposition: inline

--jNpu6dllGuEb8pJn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Might be my last mini PR here, since the RISC-V SSE driver is coming via
the actual RISC-V tree, so there'll almost certainly be a much increased
activity here going forwards.

I'm a bit late PR wise (sorry) but I blame conferences and a busy week
beforehand for that...

Thanks,
Conor.

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-firmware-for-v7.4

for you to fetch changes up to 525e00a1bbced112f5431448842b27fa7621725f:

  firmware: microchip: use kzalloc_objs() instead of kzalloc() with multiply (2026-09-08 20:36:04 +0100)

----------------------------------------------------------------
RISC-V firmware drivers for v7.4

A single fix/cleanup for the auto update driver.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Hrushiraj Gandhi (1):
      firmware: microchip: use kzalloc_objs() instead of kzalloc() with multiply

 drivers/firmware/microchip/mpfs-auto-update.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--jNpu6dllGuEb8pJn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas5KygAKCRB4tDGHoIJi
0qSOAP49wPHAf2y8sSffTwYr4llUvrZHFI+39OFIeBEQRrhdJAD/QenHTS3mxVus
wzxg9AR4DsaKzhXIwf+qrGDJd4kdOA4=
=3OOu
-----END PGP SIGNATURE-----

--jNpu6dllGuEb8pJn--


--===============8096146646426862031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8096146646426862031==--

