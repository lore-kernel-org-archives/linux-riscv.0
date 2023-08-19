Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D53EE49A8
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Aug 2023 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=jEJPkuhOXHRGduUVYsfrvKWJYlIwDEyGqJRiOzvYRRg=; b=Q0y
	5cf0zCLBU5JZ0cO95v47xahR7YM0jWoPTL1jfgEITgEOUQ2c+EZMfXzUzkuZPAfZw3OOFzaSAU1QF
	+TWY6w6CnbJbeN6npxNN45OG4iv9ROSa/c3TvWbJGFplHeYzxIbfxeX+hdZNuqkcYl0z2gMJ/5id5
	4dt2mLP5awTwa22tVmXB6eMQ9pqjxrS3D5PnoGkO5s/SZTKrNBGQeEeNWil6RiVVAkvXFo9+rdDPC
	qd6FCnCkau3wylM9CvgeKx/a/50hTadZGuu/z/rwdMBFfPtvsMKA17nVWGgQr3TwghT3kOwiSi8dy
	MQ7DtsICkKZpBmb6UxeeNzRh6r8gR8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXHp5-00Abc8-0f;
	Sat, 19 Aug 2023 09:00:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXHp2-00Abbp-1U
	for linux-riscv@lists.infradead.org;
	Sat, 19 Aug 2023 09:00:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 68E8160C76;
	Sat, 19 Aug 2023 09:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28A9C433C7;
	Sat, 19 Aug 2023 09:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692435637;
	bh=BvLLtPHmuVn5jXoaUEc5QwpHH/VMreVnaclIg/9H7VI=;
	h=Date:From:List-Id:To:List-Id:Cc:Subject:From;
	b=POIAZ7rYBOL08BxML3S0bWrzDqZeA8eR+usM0Lxc3W1wtByMTCXkam5hJZ+G2OjpV
	 hwoSPHGdx5k/r+4AlCcyaFs1C8TH0DIfWOqUAe+LJ84OYFJv71KmzaLPK9eNG7/WpJ
	 3bjyppQ1lSFJyekQ7x/k8nOYxLjXvy3g98AhyXhCrghP14HBu8MGUt5LeW5uoEeNjY
	 KG9t7vapjivhu60KXsh0PoL+WYQynWFp394udTlHGsMsNL+JhWjjHKB8HF5egXOusi
	 shfhm1+MBcf/6xo3MXBiefIFZ06TsqGoVbWMn1895ruEtMJ0WoZA/Yzq2sBvkII0eO
	 43xB/9HLSn9+Q==
Date: Sat, 19 Aug 2023 10:00:34 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
	soc@kernel.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.6-pt2
Message-ID: <20230819-unwieldy-railing-9bba2b176aa7@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230819_020040_609722_FEC7C592 
X-CRM114-Status: GOOD (  13.43  )
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
Content-Type: multipart/mixed; boundary="===============1105694063204005956=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1105694063204005956==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YbUXnae9IuboxlbM"
Content-Disposition: inline


--YbUXnae9IuboxlbM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

If it's not too late, could you please take this part 2? There's not too
much in here, mainly another minimal th1520-based devicetree for the
BeagleV Ahead.

Thanks,
Conor.

The following changes since commit f331eb1f5454123f3cec51c18a3d86c2a53bddb9:

  riscv: dts: starfive: jh7110: Fix GMAC configuration (2023-08-13 11:12:20 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-for-v6.6-pt2

for you to fetch changes up to a3ce3ff28385c7c0f8503e83f5d42d2083e16390:

  riscv: dts: change TH1520 files to dual license (2023-08-16 18:59:30 +0100)

----------------------------------------------------------------
RISC-V Devicetrees for v6.6 Part 2

T-Head:
Add a second minimal devicetree for the second board using the th1520
SoC, the BeagleV Ahead. As with the Lichee Pi 4a, this is sufficient
only for booting to a console, with work on the mmc, clocks and ethernet
sides of things under way. A relicense to a dual licence for the
existing devicetree files is also done, for good measure.
RISC-V Devicetrees for v6.6-pt2

StarFive:
Fix the sort order of some nodes that I resolved incorrectly during a
merge conflict.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      riscv: dts: starfive: fix jh7110 qspi sort order

Drew Fustini (3):
      dt-bindings: riscv: Add BeagleV Ahead board compatibles
      riscv: dts: thead: add BeagleV Ahead board device tree
      riscv: dts: change TH1520 files to dual license

 Documentation/devicetree/bindings/riscv/thead.yaml |  4 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi           | 38 +++++++-------
 arch/riscv/boot/dts/thead/Makefile                 |  2 +-
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 61 ++++++++++++++++++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  2 +-
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  |  2 +-
 arch/riscv/boot/dts/thead/th1520.dtsi              |  2 +-
 7 files changed, 88 insertions(+), 23 deletions(-)
 create mode 100644 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts

--YbUXnae9IuboxlbM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOCEsgAKCRB4tDGHoIJi
0nwpAP97ZJZHIF7AkudTpUPS3lAKv0jhD/WkAb3okaY9O8A7CAEA1jcwLI64e+NO
NxOLJ9HqChVyq2BWbJeF9Uh/IXbupQo=
=BjEr
-----END PGP SIGNATURE-----

--YbUXnae9IuboxlbM--


--===============1105694063204005956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1105694063204005956==--

