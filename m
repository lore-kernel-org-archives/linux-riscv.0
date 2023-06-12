Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935D0C88CB6
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 18:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=0M5Tpd4bp9G7marBw7XTETsoGbj/45x6RtGPh4YE2DI=; b=i8l
	3LXuT8qrwv0yWGFwjkiCDAeaLupTQJTOYAU4c3V6qx3Xh9mCMQ6aaftXiXtmRB4BShnobEGhS2/xm
	eFYesHjogoVGn1+ZIGYWRxBIXAqxObwascS0/fWoK+D8MfTY7QM/Bl7Ks3BN/A7JU9wCyFeRmo0Bq
	nF1UDhGx8nC40mntoNOCAlSie5Cq5nSbh9RQMG6s/feHXoQuDtDk0lKfZLJ+1S9zVA5pNqRZpsY6W
	CPJEbMQWRB88hFY7AJbGBRV/IQ8GyFDGLkmSyDh5qZIwdfgpVA217hOi5KNMLN/NelWzIXFXGalxY
	/mW/ELDQ3yDhn6QBbbsACYE90sh9mrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8mCI-004vRU-1L;
	Mon, 12 Jun 2023 18:23:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8mCF-004vPm-1d
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 18:23:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 103E061510;
	Mon, 12 Jun 2023 18:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E74AC433D2;
	Mon, 12 Jun 2023 18:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686594198;
	bh=jWxLW+e9VJqjBQY+02do6tXnaUXv5x7vDrB66cETASI=;
	h=Date:From:List-Id:To:List-Id:Cc:Subject:From;
	b=FPMd+StO/QmUu2T44+rFGTJfAs/lypWwpMKfKeQE6pVmMKw1FBHZomFipTC0xFg2f
	 /pIM4VKm8Y4a0i9/SWF3kKdbOorGxFWBHR04MAI5ywTphFPZbFnGjEKcS+kntQlZuM
	 EfZzUxoGoh1Jx8ZQb1fUpNFCdz15Q0ojOGSPjCWKpdFBoLBgBzfhoNlSMITMLtWonx
	 N9xHeZ2XfWeq9kprfZyvZ1er/Y1nNpu7KVQNWTT/D5RFXNEl5Eq7UyrfNByNhAQ5pP
	 qBnzfoI5Vn3ShgHg4Gjvud/VRvemlhDjsDKJzwl//5ed7x4xWK9P3/LzKsf8jOUyNC
	 tlLIpZUVroknQ==
Date: Mon, 12 Jun 2023 19:23:14 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
	linux-riscv@lists.infradead.org, soc@kernel.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.5
Message-ID: <20230612-fasting-floss-0bc05a08bc7a@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_112319_628716_B4A9CDBD 
X-CRM114-Status: GOOD (  13.55  )
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
Content-Type: multipart/mixed; boundary="===============4180210389226876167=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4180210389226876167==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SPHo1XrUdCMqV28R"
Content-Disposition: inline


--SPHo1XrUdCMqV28R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

A wee bunch of changes this time around as a bunch of the jh7110 stuff
is still blocked on clock drivers. This'll probably be my only PR for
the window, haven't got anything SoC-driver wise & it's unlikely that
any of the other bits will be ready in the coming week.

Thanks,
Conor.

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v6.5

for you to fetch changes up to e2c510d6d630fe6593a0cf87531913b4b08ebeb1:

  riscv: dts: starfive: Add cpu scaling for JH7110 SoC (2023-06-06 12:32:06 +0100)

----------------------------------------------------------------
RISC-V Devicetrees for v6.5

StarFive:
Watchdog nodes for both the JH7110 & its forerunner, the JH7100. PMU, P
being power, support for the JH7110. PMIC and frequency scaling support
for the JH7110 equipped VisionFive 2.
Most of the DT bits for the JH7110, and the SBCs using it, are pending
support for one of the clock controllers, so it's a smaller set of
changes than I would have hoped for.

Misc:
Pick up some dt-binding cleanup that Palmer assigned to me & had no
uptake from the respective maintainers. My powers of estimation failed
me again, with part of my motivation for picking them up being the
addition of new platforms that ended up not making it. Hopefully next
window for those, as they were relatively close.
Exclude the Allwinner and Renesas subdirectories from the Misc.
MAINTAINERS entry, since I do not take care of those.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      MAINTAINERS: exclude maintained subdirs in RISC-V misc DT entry

Geert Uytterhoeven (2):
      dt-bindings: timer: sifive,clint: Clean up compatible value section
      dt-bindings: interrupt-controller: sifive,plic: Sort compatible values

Mason Huo (2):
      riscv: dts: starfive: Enable axp15060 pmic for cpufreq
      riscv: dts: starfive: Add cpu scaling for JH7110 SoC

Walker Chen (1):
      riscv: dts: starfive: Add PMU controller node

Xingyu Wu (2):
      riscv: dts: starfive: jh7100: Add watchdog node
      riscv: dts: starfive: jh7110: Add watchdog node

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |  2 +-
 .../devicetree/bindings/timer/sifive,clint.yaml    | 21 ++++-----
 MAINTAINERS                                        |  2 +
 arch/riscv/boot/dts/starfive/jh7100.dtsi           | 10 +++++
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi | 33 ++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi           | 50 ++++++++++++++++++++++
 6 files changed, 104 insertions(+), 14 deletions(-)

--SPHo1XrUdCMqV28R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIdikgAKCRB4tDGHoIJi
0kAsAP43klKSezOHEa+QjF/QQ1f1fyxvtAySDNTSsEgojKc4fwEApbFEslQl464M
jxjezMJexYghxGs/PE8sYABSIHdfmwM=
=pmTY
-----END PGP SIGNATURE-----

--SPHo1XrUdCMqV28R--


--===============4180210389226876167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4180210389226876167==--

