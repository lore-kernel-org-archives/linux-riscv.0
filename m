Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF2AC05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 18:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=lInYzSQfKnGqD8xQGz63H0hopvzxJzxTssBXwrafYtM=; b=OVX
	6d8B2QSwRtVgYEgbQHESd7vvPyAzioR7RBQUAXh89jjjBWhi1jKNvhuGX0zB+kydyOyeiBrff7mFk
	IPj8auQVlagIGZTWIkBWGVXo4k3sa+EucKXQn0eiZg3x/4euR8Px6sUx+EGvPhko+GhFhEcKn6xKv
	dRIYyb3THQtRdnL8n9jib+hz8o4Db8J4JQ/1sXu16XKUBHPAVbiYiE4Tk4LmV3YoYChMlM8h7kxTW
	misdnAXlj4zkgPyw8VOJXlINyP8L2Km6R+iaW46wyPZnLuGkuXzfzeRlltzUs6O88hYVw+pgbO0VX
	XXMjJiZ+8976Ts3CHfGX03LiXEfInVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL7RS-00CEUk-H4; Thu, 26 Jan 2023 18:57:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL7RP-00CEU2-1O
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 18:57:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8A73A60B55;
	Thu, 26 Jan 2023 18:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8A3FC433EF;
	Thu, 26 Jan 2023 18:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674759462;
	bh=FsfywmuK2LVxddGyzMHFXY2WoZZ93Q6IPu/tq1Mbouc=;
	h=Date:From:To:List-Id:Cc:Subject:From;
	b=X9+r9UepBwuOa+H277TAJCZkO3v0JCfbgKQrZGvJTMkdm6mFJJOj1NBOhXMaqaR4X
	 yP3bl5tsrVLz4yp3G7T4En8u6aPo2V45Z76SXxWbqfaFyzGHxDkFHzt2gTjIr7NO1s
	 PFD+8UzfHi0aHKLROG3ez7ko5KrYzOQSYBJOHD/M6eO71IdCBvd06LPy+Z8o6JdS+f
	 8fLblJ7c9sJqfy3q/uCwzOYeg9VyVTYRrCLDaAGTX/RshnT1BvN1WpSdghM2yiIwWL
	 VhsR6f2mzL/xhNQQrDgX0SXB+aAUFS8arPMM5Yn/RtyFw9/anUyc26T/OeqWecXevK
	 yOvadTE8753aw==
Date: Thu, 26 Jan 2023 18:57:38 +0000
From: Conor Dooley <conor@kernel.org>
To: arnd@arndb.de
Cc: conor@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
	soc@kernel.org
Subject: [GIT PULL] RISC-V SoC drivers for v6.3
Message-ID: <Y9LNIm9pkr+Owv/e@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_105743_185101_F95AB171 
X-CRM114-Status: GOOD (  16.65  )
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
Content-Type: multipart/mixed; boundary="===============3948905251306659732=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3948905251306659732==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="61U62h1lCjSSIDqi"
Content-Disposition: inline


--61U62h1lCjSSIDqi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

I'm sending this one perhaps earlier than needed given there's going
to be -rc8 this time around, just in case something about the PMU
driver isn't to your liking. It'd be nice if there was a subsystem for
these power management units as I wasn't sure if the API usage was
correct. Heiko, who has experience from the rockchip driver, reviewed
it, so I am happy with that.

Thanks,
Conor.

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-for-v6.3-mw0

for you to fetch changes up to f3460326e38d6a084fb5b3348125a802567a3690:

  Merge patch series "JH7110 PMU Support" (2023-01-20 21:57:00 +0000)

----------------------------------------------------------------
RISC-V SoC drivers for v6.3-mw0

It's all StarFive stuff this time:
Their new JH7110 SoC uses a SiFive core complex, and therefore a
SiFive cache controller too. That needed a compatible added to both the
binding and driver.
The JH7110 also has power domains, which are supported by a new driver
and a corresponding dt-binding.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      Merge patch series "JH7110 PMU Support"

Emil Renner Berthing (2):
      dt-bindings: sifive,ccache0: Support StarFive JH7110 SoC
      soc: sifive: ccache: Add StarFive JH7110 support

Walker Chen (2):
      dt-bindings: power: Add starfive,jh7110-pmu
      soc: starfive: Add StarFive JH71XX pmu driver

 .../bindings/power/starfive,jh7110-pmu.yaml        |  45 +++
 .../devicetree/bindings/riscv/sifive,ccache0.yaml  |   9 +-
 MAINTAINERS                                        |  13 +
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   3 +-
 drivers/soc/sifive/Kconfig                         |   2 +-
 drivers/soc/starfive/Kconfig                       |  12 +
 drivers/soc/starfive/Makefile                      |   3 +
 drivers/soc/starfive/jh71xx_pmu.c                  | 383 +++++++++++++++++++++
 include/dt-bindings/power/starfive,jh7110-pmu.h    |  17 +
 10 files changed, 485 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
 create mode 100644 drivers/soc/starfive/Kconfig
 create mode 100644 drivers/soc/starfive/Makefile
 create mode 100644 drivers/soc/starfive/jh71xx_pmu.c
 create mode 100644 include/dt-bindings/power/starfive,jh7110-pmu.h

--61U62h1lCjSSIDqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9LNIgAKCRB4tDGHoIJi
0oslAQDxpGfx6nGC6ll0OUrQ9NLZGo7e4AmoC34yaT+TZR5RhAD/VFycEClanwse
mch60kBPEIgnQ8DM9OCXPVhc+GERpg4=
=pwcV
-----END PGP SIGNATURE-----

--61U62h1lCjSSIDqi--


--===============3948905251306659732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3948905251306659732==--

