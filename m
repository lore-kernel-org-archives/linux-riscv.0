Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD32CC6B12
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 15:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=dMdRxRQfyvyJoKVIMCWKAvPSLMUBye83lVs4w3QJBsY=; b=ljt
	ggO5GFWNP8OO86YBCb69OXiWT1X1E2fM8FZUwp/v8drhVGu34zRe/y/9uVTsE3+bGclhp1hbnv7KJ
	u0psrEjnyJMq+cUbJoV5sspFDXs2XFNo0TnH+6PnjAmF10pRMyY+M6bf7n1ueTmsO0K5cSS/oA3EV
	ayqgGNup7emr3fmm1aiobsTQLg3n3xtv6Q6C0uGWx+ZQf1q6eLuiLXRrIkXSAee7YMcTM/c+IXGoG
	epXI6sd3u/6GDLax1bN3jplQS3k3KR3fkV1HEgWBaJgnrQcwNJ0aXPTMAPJTe601T0akdco1EyR0h
	IkmIExaYBSmlahyaJ13CEPR1zEN6TxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeTX-0000000DLlc-0BD4;
	Tue, 13 Oct 2026 15:31:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeTT-0000000DLkV-05mA
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 15:31:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 662144184A
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 15:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5111E1F00893;
	Tue, 13 Oct 2026 15:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905490;
	bh=2Z+wy+HJU5krqdxCh4MNGqLRoB1+mk+v8/zUlqrh22g=;
	h=Date:From:To:Cc:Subject;
	b=W0hazhnTnW3hhi4sanfiSqAdRpV6jfBRnjttjUxgx73EEKBTm4DMvONWgZRBdTDd3
	 O1vK57fDRcoS5rHIKv5PnpYdMNrzpGzVrqCBijE8P+brD7x6qVlIUmu/rQFyljdNa/
	 kOpZC+H+OZ0sPmWyq6/hmh1x+jwvSSlJ6atzLYVe2GTqoAVXZdGN8nf7Q5QkX6myjx
	 POR/Zh8YFH3GVJu+S7Fwk9G0jNXJbWrrIR0gNLTKTjvNtoTJVKsMm+fWWPAD9SqALf
	 WN91wJ2/VXMCb6fWLYG/yeT+XePn2WDckSEZOOJWFGxGw6/GOtpsvI6W2lHKz7A8tQ
	 VCTL2TjSpMfow==
Date: Tue, 13 Oct 2026 16:31:27 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL][2/4] RISC-V misc. devicetrees for v7.4
Message-ID: <20261013-easily-lint-c427bdee2754@spud>
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
Content-Type: multipart/mixed; boundary="===============1639595455560429990=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1639595455560429990==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BotAtISf3NwQU4DG"
Content-Disposition: inline

--BotAtISf3NwQU4DG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Small enough PR here, I was hoping to get the StarFive jhb100 SoC in, but
that'll have to wait for 7.5, along with the deprecation of the Canaan K210
that Arnd and I discussed last week.

Cheers,
Conor.

The following changes since commit 82ab962ef6c2a3571e3d590b30c023118c92b776:

  Merge branch 'k230-basic' into riscv-dt-for-next (2026-06-14 17:14:51 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v7.4

for you to fetch changes up to 2186ec5f59c23fcf0bf896ca0543b6a1135d7bb5:

  riscv: dts: starfive: Correct pwm nodes (2026-10-02 18:35:12 +0100)

----------------------------------------------------------------
RISC-V misc. devicetrees for v7.4

Microchip:
Add Valentina as a second maintainer because Daire is largely inactive.

Starfive:
Fix the PWM nodes, because a opencores,pwm-v1 instance only ever provides
one PWM channel.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      MAINTAINERS: update RISC-V Microchip maintainers

Hal Feng (1):
      riscv: dts: starfive: Correct pwm nodes

 MAINTAINERS                                        |  3 +-
 arch/riscv/boot/dts/starfive/jh7100-common.dtsi    | 28 +++++++--
 arch/riscv/boot/dts/starfive/jh7100.dtsi           | 67 +++++++++++++++++++++-
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    | 27 +++++++--
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts |  6 +-
 .../boot/dts/starfive/jh7110-milkv-marscm.dtsi     |  6 +-
 .../boot/dts/starfive/jh7110-pine64-star64.dts     |  6 +-
 .../jh7110-starfive-visionfive-2-lite.dtsi         |  6 +-
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi |  6 +-
 arch/riscv/boot/dts/starfive/jh7110.dtsi           | 67 +++++++++++++++++++++-
 10 files changed, 200 insertions(+), 22 deletions(-)

--BotAtISf3NwQU4DG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas5OzwAKCRB4tDGHoIJi
0n7jAP0ZtoAQTFjlb0T6hm8d7m4Df2HMXwWGTS/jd1xsoqOtCAEA8Y5C14AWIoay
z7URj7kOzL6Us6y2I3I/7k44cd3xoww=
=8T9u
-----END PGP SIGNATURE-----

--BotAtISf3NwQU4DG--


--===============1639595455560429990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1639595455560429990==--

