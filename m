Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889ABCDB482
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Oct 2023 12:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=jFIBUy5vUvDwKJh8sc2E0UR1QUSTaDqIdrUlKaWHQ9g=; b=x0/
	LsbCbZ/E81KlNINPhVv0FZISYsigKMYrWsSssvPQ5lBNgUhHTQRAq91Uuvjd8msJXJNw//plhOPmF
	Re+32vjKIqPzSry2j8zzGE76haqs6pYJK4P8+XDo7Qnu/lNwirxVKfFJ/IimKa39sCii2Zwa3Jr13
	dLyPHGX5YRg62klLjs7cBZtqvV3w9BNX8us91f7ztu+hseTEPLkwTcEclr0P0PNEAbmDKaYzQY6oq
	7KUK1lGAoFkuw6yFWdiR3lweQDWSWQW4Rfr+SIv0PcLnk2HCPfvzaESYcOWjDX/f09N2pTrmQPDQU
	sjTbLq9sIXi4C3adaq0lx8SN6dazzWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qs0Cu-007A0N-12;
	Sun, 15 Oct 2023 12:26:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qs0Cr-0079zP-1C
	for linux-riscv@lists.infradead.org;
	Sun, 15 Oct 2023 12:26:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DCC9B60B76
	for <linux-riscv@lists.infradead.org>; Sun, 15 Oct 2023 12:26:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81BAC433C8;
	Sun, 15 Oct 2023 12:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697372810;
	bh=zBwZ22WhA8Pm7lbRFNqudT/MXBkLzektixBt5qpzImA=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=didLG8HHLROsbpRWbIbViWWz0dYGhc8QliEqOZTHjz1qQufOYPFmOkFDgMUu6QaS7
	 Rt3i8WLVyBMYowBKeNJv1PYX7rmk59n6x8bTYdVF53LG0DEMdOZlJde4AwHx4ywEsX
	 VfGQ3w/bQSQdxFGXj2fvi0LyGp66g+HPWcQ83CgDM6/cm60vCP6zHmal9Re9evqQrV
	 66ZGuD+FVVUh4I6a7Ooeu4jupA4Q+7/WdLsJ5/6S50ktqvfMtWKOUNWLnCMOB/UZBu
	 gimpE55OHMzXC+DhMcIRiAttZ9hgGDct50mkavham9wbChW/4Mt5sncK5L0+5Rej2Y
	 /v6+odLfJMWCA==
Date: Sun, 15 Oct 2023 13:26:47 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.6-final
Message-ID: <20231015-outmatch-tragedy-228f91d396b5@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231015_052653_459082_E4F64AC5 
X-CRM114-Status: UNSURE (   8.76  )
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
Content-Type: multipart/mixed; boundary="===============1442334446967725168=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1442334446967725168==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QNViNBABpYrMGRfy"
Content-Disposition: inline


--QNViNBABpYrMGRfy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Just a single patch for you here, been quiet on the fixes front :)

Thanks,
Conor.

The following changes since commit 1558209533f140624a00408bdab796ab3f309450:

  riscv: dts: starfive: visionfive 2: Fix uart0 pins sort order (2023-09-13 14:24:56 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-for-v6.6-final

for you to fetch changes up to cf98fe6b579e55aa71b6197e34c112b51f0c2a66:

  riscv: dts: starfive: visionfive 2: correct spi's ss pin (2023-10-12 10:23:23 +0100)

----------------------------------------------------------------
RISC-V Devicetrees for v6.6-final

A single fix for the Starfive VisionFive 2 platform so that chip select
for SPI matches the vendor documentation.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Nam Cao (1):
      riscv: dts: starfive: visionfive 2: correct spi's ss pin

 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--QNViNBABpYrMGRfy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSvahwAKCRB4tDGHoIJi
0mQWAQDSV4anPpArYsHAbzU4wWhilKmEzpKHclJrUEemKce6ZwEAucIWM6b5NxTu
lLbA2Pz7P5YwJ4lViHDoIsZ3hH3JOwU=
=KhTv
-----END PGP SIGNATURE-----

--QNViNBABpYrMGRfy--


--===============1442334446967725168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1442334446967725168==--

