Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7CFC54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 19:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=SS/bWXSLeZl36LedcHeSD8etYKSar/gNjSuPYtS5rPw=; b=UUz
	74b5RY6Pg1F7oKG8noZ1+1a4zG/XigKAMZKH1OJCpos+rVrsuAfp6tfmZUVEYOZV4lgykp0sBgCu/
	/mOqy6HL06pmDgeVfRNeyXY4lkFNTg6BwWCEfokUAiMfiyH9M8xxk65pXniKrjcEWXdnGe2q6sfEG
	G9BL6mRXwnOqHrJJETp+5jyOPyTivzmUgm8N9Wmwx4UKVgp4BSStr0SR2henL2lhbkHEJF+iXagWi
	B7y3ouHl4HIx+0GqV81r+TRjeJ/sxIdyyBiYo5+O378+HuDuk7JmBgCzgJdwC7wIce8ezmmHXPF2r
	94quAPmurjh3syUgNsuPZAyBFxguODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhasx-0000000F5V8-49cc;
	Tue, 05 Mar 2024 19:55:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhasu-0000000F5Tx-1vc4
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 19:55:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1F7E61571;
	Tue,  5 Mar 2024 19:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6529AC433F1;
	Tue,  5 Mar 2024 19:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709668530;
	bh=MsIuvb6B6a0xancTYfzjAF1o8tDdk8OkqjwIyj63cqI=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=kH0N4NHBh9YPXajcS3WjNTsmcMyG9QswcjMY84xv6AmQPIXBJilDRfRlg0A3QAr1/
	 2CuJMQdii8fMBVKnMFDnYNqAubpY7g41ml6aqNB5XOL73CqsLa36f3rvfWo2oHbLDQ
	 8J2N+9uvLE25HCvuOIrFRND1P51spif2dZbvMgv1CKSVYu24Wh3ufNtgi98/f5wFVy
	 5Hxp2EhrpgDjI8kN6O/urlRMwfu6GbzdMAjaQUzSSTQhKjiQPwGtYNHcNSfxMwMscf
	 pD0q6bfL9otIg8IA0wcSkCaEz03lU5u1ME1wXig0glUC1YXeoDyju2ZC2ymSEieFVe
	 Oht5+Z+45UrMA==
Date: Tue, 5 Mar 2024 19:55:27 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.9
Message-ID: <20240305-iodine-moneywise-53797ae9bf6e@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_115532_613215_421FDB4A 
X-CRM114-Status: GOOD (  16.91  )
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
Content-Type: multipart/mixed; boundary="===============0620615128693991546=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0620615128693991546==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SBUcMGjypV+7GXFj"
Content-Disposition: inline


--SBUcMGjypV+7GXFj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

I'm a little late this time around, meant to send this before -rc8,
but I ended up crashing my bike in the surprise bad weather we had
here on Friday and didn't do anything for the weekend at all.

There's some binding stuff here that Uwe didn't want to take in PWM
and then a follow-up patch that ended up in my tree because the original
was not in his... I'm gonna try to avoid something like that happening
again, I' prob just send that sort of thing via Rob in the future.

Thanks,
Conor.

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-for-v6.9

for you to fetch changes up to 28ecaaa5af192fa8a3f406e5a3e5416324c4d0a5:

  riscv: dts: starfive: jh7110: Add camera subsystem nodes (2024-03-01 16:12:26 +0000)

----------------------------------------------------------------
RISC-V Devicetrees for v6.9

Microchip:
Missing bus clocks for the CAN controllers spotted during the creation
of a driver for the controllers and a specific compatible for the SiFive
PDMA block on PolarFire SoC.

Starfive:
PWM nodes for the jh7100 and jh7110. Camera subsystem support for the
latter. Most notably however is the addition of ethernet support for the
jh7110 which finally allows people to use the network on the OG VisionFive
and on the Beagle-V Starlight board. This was made possible by the
non-standard cache management operations support added for the RZ/Five
which could be extended to the ccache present on the jh7100.

bindings:
Additional clarification for what the reg property represents for cpus
and two opencores PWM binding changes - the original addition and an
added compatible. The latter is here as the driver patch was not ready
but the PWM maintainer told me to go ahead and merge it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Changhuang Liang (1):
      riscv: dts: starfive: jh7110: Add camera subsystem nodes

Conor Dooley (1):
      riscv: dts: microchip: add missing CAN bus clocks

Cristian Ciocaltea (4):
      riscv: dts: starfive: jh7100: Add sysmain and gmac DT nodes
      riscv: dts: starfive: jh7100-common: Setup pinmux and enable gmac
      riscv: dts: starfive: visionfive-v1: Setup ethernet phy
      riscv: dts: starfive: beaglev-starlight: Setup phy reset gpio

Heinrich Schuchardt (1):
      dt-bindings: riscv: cpus: reg matches hart ID

Ji Sheng Teoh (1):
      dt-bindings: pwm: opencores: Add compatible for StarFive JH8100

Shravan Chippa (1):
      riscv: dts: microchip: add specific compatible for mpfs pdma

William Qiu (3):
      dt-bindings: pwm: Add bindings for OpenCores PWM Controller
      riscv: dts: starfive: jh7100: Add PWM node and pins configuration
      riscv: dts: starfive: jh7110: Add PWM node and pins configuration

 .../devicetree/bindings/pwm/opencores,pwm.yaml     |  56 +++++++++++
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   4 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi            |   6 +-
 .../boot/dts/starfive/jh7100-beaglev-starlight.dts |  11 +++
 arch/riscv/boot/dts/starfive/jh7100-common.dtsi    | 108 +++++++++++++++++++++
 .../dts/starfive/jh7100-starfive-visionfive-v1.dts |  22 ++++-
 arch/riscv/boot/dts/starfive/jh7100.dtsi           |  45 +++++++++
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi |  71 ++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi           |  76 +++++++++++++++
 9 files changed, 395 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/opencores,pwm.yaml

--SBUcMGjypV+7GXFj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZed4rgAKCRB4tDGHoIJi
0tBaAQDl/hRShjw3Ogh0Inq9g2GSxpMwlRnlTrpjDehip8EJEgEA8bOJW2LNvYDZ
lnpvp4AEEgjpDWpcJpGHGQ0HXd8Uowc=
=oK3y
-----END PGP SIGNATURE-----

--SBUcMGjypV+7GXFj--


--===============0620615128693991546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0620615128693991546==--

