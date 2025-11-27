Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF87D111A8
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 16:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=hEMRMLNrN6F270SZss4SkTtbk3WuAmMNFrUoGFScLJo=; b=efb
	N413fFc2DsQe8f4MWMkak6dyLbIbpHIjWOy+eLyg4wA1VXko2DkK0lMvmxgngAjfLbnTvzM9HYLld
	f3IoXG51Lpxakj4Amqe49mFWQ+O21ScErZsreWfo8Cx7A/j7PVHsWA0Gplev1ezWaP2JWLlkDsKqL
	Qe4D0so3De7tfJkwMImmWVidU5QvHBRcZrbcJ9+G1WE47CzqMZIOZLF74FxZ/ywN4jb5FX+nyBqmd
	smUfLSMOu3Z3F8VBe8k+/k22hap6XL1g5c2G/DCEoFhIcJOUqTNoAXsUNTHKWumyhPfeg0cqoC41t
	eqiIFv/gYlpdHTz33w29wPKwo9VhnsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOeWY-0000000GuM2-19nZ;
	Thu, 27 Nov 2025 16:07:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOeWV-0000000GuLX-3ye9
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 16:07:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98BD142B04
	for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 16:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5E8C4CEF8;
	Thu, 27 Nov 2025 16:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764259630;
	bh=wPDhpQkNJJQk7R1CNhHFSFjejlF8GTL99mJgXlWw0mE=;
	h=Date:From:To:Cc:Subject:From;
	b=dxJ178IsFIufTUkjOHktklvTY08b+K5oFjXew0fRFJqP5wMDyYBUBoLeNY1NOBcfq
	 X94RLDhdbBTq7/MQ4rM3oELG5RxTAdrO0PL22H1IboKRAFmv4EAfcJekQT259BnUQZ
	 XufwEvGvyVBUTLxS5VVrL6mUApgUKBBok2WFmSGX7NUFOXVx9KN2sZjnA0PaSmeMpX
	 +Isqf2aHRKfcMWx9ZNFLemgoFW1AM7phoLizE2BLVOH3s3ULLHc8c+CYs+TjUNdikL
	 13RNk/yelQpgT0TbihXZ0tRcReT4v6rFmaqhKQM+hyTa0IFI+2qjYIzOSBMWFDe2mU
	 zh9w56Qz+Pfyw==
Date: Thu, 27 Nov 2025 16:07:07 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V soc-drivers for v6.19
Message-ID: <20251127-wish-shining-300e8fb80599@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_080712_004405_60D170EC 
X-CRM114-Status: UNSURE (   9.59  )
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
Content-Type: multipart/mixed; boundary="===============7852167657125386652=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7852167657125386652==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5Lj1ZaEMcGf5EH9/"
Content-Disposition: inline


--5Lj1ZaEMcGf5EH9/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Please pull my 6.19 soc driver changes.

Cheers,
Conor.

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ soc-drivers-for-v6.19

for you to fetch changes up to 66c6ceb41ed375773491c5d024167a2cbe6fe944:

  MAINTAINERS: rename Microchip RISC-V entry (2025-11-11 16:52:30 +0000)

----------------------------------------------------------------
RISC-V soc-drivers for v6.19

Microchip:
Add bindings and mfd drivers for two syscon regions on PolarFire SoC,
needed as part of a rework of the devicetree to permit supporting,
among other things, pinctrl sanely and avoiding the "new" pic64gx SoC
ever using the original incorrect clock nodes. Fiddle with the Microchip
RISC-V MAINTAINERS entry to add these drivers and avoid branding it FPGA
only.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (4):
      dt-bindings: soc: microchip: document the simple-mfd syscon on PolarFire SoC
      soc: microchip: add mfd drivers for two syscon regions on PolarFire SoC
      MAINTAINERS: add new soc drivers to Microchip RISC-V entry
      MAINTAINERS: rename Microchip RISC-V entry

 .../microchip/microchip,mpfs-mss-top-sysreg.yaml   | 47 ++++++++++++++++++++++
 MAINTAINERS                                        |  4 +-
 drivers/soc/microchip/Kconfig                      | 12 ++++++
 drivers/soc/microchip/Makefile                     |  1 +
 drivers/soc/microchip/mpfs-control-scb.c           | 38 +++++++++++++++++
 drivers/soc/microchip/mpfs-mss-top-sysreg.c        | 44 ++++++++++++++++++++
 6 files changed, 145 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
 create mode 100644 drivers/soc/microchip/mpfs-control-scb.c
 create mode 100644 drivers/soc/microchip/mpfs-mss-top-sysreg.c

--5Lj1ZaEMcGf5EH9/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSh3KwAKCRB4tDGHoIJi
0pt+AP9DympcOswdVPZPrJm+aekvGfrjMkCi5M34N5LnusAWmgEA3Xz5bGLoSqNv
zg4Kn55STYoEiK1Xd73sI+DcLlo0/g4=
=m0FT
-----END PGP SIGNATURE-----

--5Lj1ZaEMcGf5EH9/--


--===============7852167657125386652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7852167657125386652==--

