Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F19C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 18:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=tpyh8O7EfKXT9ct8nThcAFAvCF6eYmj2289enEStxPQ=; b=qGj
	Cf9+7hAGpUvahHlIKBdPA62bNKI/odr/FIQhvcaf3ZzMhiKMEAmA65KE4A58BmI1yWWGOxEwCWC2X
	IRJVcNgKjTFXbovmyBQ1n1DHbNt1mqYJXbPbdCYk6cq+x+wtpSkzcUSFLG8Ml0/oo/mWLfKfNyJ30
	EH6pXl78Kd6FQNTehldLo60Zp9DZI0Du31HJvDUeHnWRZVjO/GlXxsdnlbaMszF244gydycuwyaTH
	cA2agXAPFH0kGntYh4zPw+ftmOamzuO26rjOIhJf3mwZxYZaMTND/TBYiv6mhsFDijo53vqTKRcqg
	qo5lLeVRXuPM4K23Mfoq2nWgcmr4tog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiFuL-00000005V8j-1i01;
	Fri, 10 Jul 2026 18:25:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiFuK-00000005V8W-1aEd
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 18:25:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C429E42E18
	for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 18:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B456E1F00A3A;
	Fri, 10 Jul 2026 18:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783707903;
	bh=gZusL2/EHwaYzxmMXbEmVolYj5pbhw/3CRD5UkCkElU=;
	h=Date:From:To:Cc:Subject;
	b=fIX3xVHrcwtrIHqwuSGJHMrFLng4+Bsef7GYnit06z7jWRWeAz71Fp2mpPeFMXrDd
	 4KEemM8PcYawFyRHmEI4/lh6VhrIhZqYPQZDYfTvdT+xooR/vyjuF3AKJcGVDfeENb
	 hYVC7QP7p5pWf7rNkbN3blSwRBYqlij3QjedZ66yXwYmd39MSo6EAR2XbiQwcxnagw
	 tGcPS/91GCY65+se/W8wwh4DRqjEoraMEphM0+biOwVg9saj3MBkPirQqJbfRW5qxg
	 jP0V/+bEJN/C67y3UiJNGqeD9jNnJP4IkPdRX7aGtjtJ/x1uEyNLn4zSMOe3GLDCS8
	 wHYx793qeUV8w==
Date: Fri, 10 Jul 2026 19:25:00 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V devicetrees for v7.3 - Early Canaan k230 material
Message-ID: <20260710-purge-scarcity-942f27750ce1@spud>
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
Content-Type: multipart/mixed; boundary="===============7350407902667175045=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7350407902667175045==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SA2dHVesSzvws6Sl"
Content-Disposition: inline

--SA2dHVesSzvws6Sl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Please pull an early tag with the Canaan k230 support that I was too late
with for the 7.2 merge window. Some of these patches date from 2024, so I
have elected not to squash or have the submitters of the clock changes etc
resubmit the original k230 series with their stuff squashed in so that
the history of the initial bring-up is retained, particularly given
Yangyu's detailed commit message in "riscv: dts: add initial canmv-k230
and k230-evb dts" that covers the testing done and decisions made about
supporting the standard Svpbmt extension or T-Head custom MAEE stuff etc.

Thanks,
Conor.

The following changes since commit 3869417f8996fb076998342d0db560fdd795a3a6:

  riscv: dts: microchip: remove redudant enabling of syscontroller (2026-05-15 17:51:09 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v7.3-early-k230

for you to fetch changes up to 82ab962ef6c2a3571e3d590b30c023118c92b776:

  Merge branch 'k230-basic' into riscv-dt-for-next (2026-06-14 17:14:51 +0100)

----------------------------------------------------------------
RISC-V devicetrees for v7.3 - early k230 material

Canaan:
Support for the k230 SoC that was too late for the 7.2 window.
Consists of some bindings not taken by the various subsystem
maintainers, the original dts patches from Yangyu back in 2024
and the more recent clock, reset and pinctrl additions from various
contributors.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      Merge branch 'k230-basic' into riscv-dt-for-next

Jiayu Du (1):
      riscv: dts: canaan: Correct the formatting issues about k230 dts

Junhui Liu (2):
      riscv: dts: canaan: k230: Add "b" ISA extension
      riscv: dts: canaan: add reset controller for K230

Xukai Wang (2):
      dt-bindings: clock: Add Canaan K230 clock controller
      riscv: dts: canaan: Add clock definition for K230

Yangyu Chen (4):
      dt-bindings: add Canaan K230 boards compatible strings
      dt-bindings: timer: Add Canaan K230 CLINT
      dt-bindings: interrupt-controller: Add Canaan K230 PLIC
      riscv: dts: add initial canmv-k230 and k230-evb dts

Ze Huang (1):
      riscv: dts: canaan: Add k230's pinctrl node

 .../devicetree/bindings/clock/canaan,k230-clk.yaml |  59 ++++
 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 .../devicetree/bindings/riscv/canaan.yaml          |   8 +-
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 arch/riscv/boot/dts/canaan/Makefile                |   2 +
 arch/riscv/boot/dts/canaan/k230-canmv.dts          | 343 +++++++++++++++++++++
 arch/riscv/boot/dts/canaan/k230-evb.dts            |  39 +++
 arch/riscv/boot/dts/canaan/k230-pinctrl.h          |  18 ++
 arch/riscv/boot/dts/canaan/k230.dtsi               | 167 ++++++++++
 include/dt-bindings/clock/canaan,k230-clk.h        | 220 +++++++++++++
 10 files changed, 857 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
 create mode 100644 arch/riscv/boot/dts/canaan/k230-canmv.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k230-evb.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.h
 create mode 100644 arch/riscv/boot/dts/canaan/k230.dtsi
 create mode 100644 include/dt-bindings/clock/canaan,k230-clk.h

--SA2dHVesSzvws6Sl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalE4/AAKCRB4tDGHoIJi
0swaAP96JNAEQq+OpFSvSKl+pHRYwSZKfEmGVKthPswUINvQpwD/eGlgH/yI5Kof
M38s14HanYE9GrpFRMvk+iTwuSR0Qg8=
=zLbq
-----END PGP SIGNATURE-----

--SA2dHVesSzvws6Sl--


--===============7350407902667175045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7350407902667175045==--

