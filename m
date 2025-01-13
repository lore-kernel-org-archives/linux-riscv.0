Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BEFC02183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 19:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=1YCVqC+a+yIHCIRGaT3FLltQpF7sKXjjEL+GBF53sP4=; b=lrl
	0ZEKAImWm+Rgh8w7CYzh/I+KpND/kReQIYhfr3PcscS1zWP2D2ogAALfitgNjltL+/uT8QHq1Cz9J
	0rI3LOoNpIpUH7vbm1ZGxFb8LB3B0a45tPfogERoF9+9uR4E5//3nzWX+vZBzqxMi7YJzMSgmV0qO
	wLPNveHLikWW8pldmX8ZwwlqBkEgCbRQOmgUbwaawtth4PdZ6PS9gNqq6cmMJFNPO1XhKj58cTjf6
	epA678KhQHC+WpUrVELBZTMAfijnJkN/ZcCEjry3LUbD6sTFN2K5LsZrJ8i7LVGfHkyberKJoy4f8
	S7p42Lu7J+Z+eEmWWI3hauf/KnRTuVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQEq-00000006PbY-1Baq;
	Mon, 13 Jan 2025 19:36:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQDK-00000006PCw-1S7x
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 19:35:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 62DACA41344
	for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 19:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE36C4CEE1;
	Mon, 13 Jan 2025 19:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736796905;
	bh=LNPRUlUhY5X4l38jufusldSu8m0yDc9nEltVinBbZ0Q=;
	h=Date:From:To:Cc:Subject:From;
	b=NBnAEFtD8cO4/AZtZG0RFfZhstjHu8NTA9hDGwTj1LC2AE8wbgeRCfCSjNbSHKIkS
	 xVbnPW3rCWPyYPY+pVhAHnehbG4GQgxZD2IQSUnpDBQRGeYqJJq7cHgYuoUjupDYvU
	 Ffvj0+UwVJKQ6uOGCAYIO2xq9cK9sp+5KR+eWODu3xJpD9HljkHTOVI0ocYXEgbuXv
	 SFSBlkPWaPdl7YtdYxv2PUhyHAlSoFdotavnnUk7egaT9+0+HnjS/OX26auOn00EwG
	 W6/L4V14JAqWnjTP/FKtdeMMjRct/lQw/z6KOCOwFs4rpsCghzshkkF5nbYpMfJUSe
	 dn83r55j+7AMg==
Date: Mon, 13 Jan 2025 19:35:02 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] StarFive Devicetrees for v6.14
Message-ID: <20250113-kennel-outplayed-21a52a654c36@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_113506_453934_D50E3E43 
X-CRM114-Status: UNSURE (   7.59  )
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
Content-Type: multipart/mixed; boundary="===============8528519427310829858=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8528519427310829858==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GwHu556FBBtAye50"
Content-Disposition: inline


--GwHu556FBBtAye50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Arnd,

Very little here, but apologies for it being kinda late. Ended up
dislocating my jaw between Christmas and New Years, so been kinda
out of it.

Cheers,
Conor.

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v6.14

for you to fetch changes up to 708d55db3edbe2ccf88d94b5f2e2b404bc0ba37c:

  riscv: dts: starfive: jh7110-milkv-mars: enable usb0 host function (2024-12-02 19:06:40 +0000)

----------------------------------------------------------------
~RISC-V~ StarFive Devicetrees for v6.14

Not so much RISC-V, but rather StarFive, this time around as there are
only two changes: the Milk-V Mars and Pine64 Star64 boards get their usb0
interfaces moved from peripheral to host mode.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
E Shattow (2):
      riscv: dts: starfive: jh7110-pine64-star64: enable usb0 host function
      riscv: dts: starfive: jh7110-milkv-mars: enable usb0 host function

 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts    | 18 +++++++++++++++++-
 arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts | 18 +++++++++++++++++-
 2 files changed, 34 insertions(+), 2 deletions(-)

--GwHu556FBBtAye50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4Vq5gAKCRB4tDGHoIJi
0vCUAQC8+tM6xqkQ0sQamnGjc9Dv3M5Zowoj/7gl+sD3XiV+RwEA+d/gKlbdQEJi
4DyLfqr72lac3fgmxfkmWvtOpJkbfgs=
=s+QG
-----END PGP SIGNATURE-----

--GwHu556FBBtAye50--


--===============8528519427310829858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8528519427310829858==--

