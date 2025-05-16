Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623E0C3ABD8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 10:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=SZI8EPWDqpwrVoalakYW03XRmZcRFtMumo6bxuVGAtw=; b=n+m
	DJGzDvjgoMEfOQQ1Bx2RJBVpFOgWK1j7HRxC3hjCh3pUAuyQrz31hNTIIMkgW23ncNcRMsYTGYJFL
	+w5OV+tkgsL4JTwcq7ilB6lk2rgc89novUytUYkEHwAEe+2XADYkRkH0NoFInCfnVpQm8wChq8/58
	7Ym3onchDtIHE2IuxHh/mR4OlIfqogQ3ahGfnmeYhPiuHtbuzSST67UrXYn1w44TlpAcl0NpkC/VB
	ctpxdP8YAHpfn7th2lLL+CN2ABX2BkWIgYegWmWwTtdGh3mv10p7Ft+4ZuKBmxB146gqpNw7nVVsa
	deJFkw6//YYccWoji7kOPANnh6qXrjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsU1-000000039lY-2OiS;
	Fri, 16 May 2025 10:40:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsQz-000000039QE-1VOi
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 10:36:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 16F7443652
	for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 10:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2952FC4CEE4;
	Fri, 16 May 2025 10:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747391817;
	bh=HltEfTftL2xmSQf6cEPZGKcTWSbGLTtasoaj6OzZffg=;
	h=Date:From:To:Cc:Subject:From;
	b=C+wmBdf3O3vZIZ6A7mng9r2updPeR/PtZZPf7Lnb/Xud1AMFGi6bliStPnZOeeNwb
	 c2TibglEbqn3cjxlzwbv+708sCJ9NjvtKv58RZunyb/k6SVAOUkVfuUCBdssnsi5o3
	 q2XU+V3dmnMubyOGcbJ8sFqKSv20Vbn/dNC44xRZKwiFg9wAi01NlrFSotz3pf8kEG
	 74kwoyMI5i/3gMgR/LvAfoRn78G8l0z1GzA62vaTJ844HxzKOaTEAJNgVm+oLjiK0A
	 inZg0ECQ+JsFXnpzymz8DuTuse6TMY18U84Q7muDBYGA0R/CKq4bcs2afVP94y4BU6
	 g79IHNJMRcimA==
Date: Fri, 16 May 2025 11:36:53 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL 1/3] RISC-V config for v6.16
Message-ID: <20250516-joystick-mortified-385820b1ad0b@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_033657_419182_0AC7FBC5 
X-CRM114-Status: UNSURE (   8.91  )
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
Content-Type: multipart/mixed; boundary="===============1513925757871838233=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1513925757871838233==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9NQ8v+7/FrZL5T5K"
Content-Disposition: inline


--9NQ8v+7/FrZL5T5K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

These are a bit late, but I was waiting for some acks on patches that
were outstanding for a while dts wise.

Cheers,
Conor.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-config-for-v6.16

for you to fetch changes up to 60c6d3797239d087cc6eb82971988893a8ba2a88:

  riscv: defconfig: spacemit: enable clock controller driver for SpacemiT K1 (2025-04-26 00:41:03 +0100)

----------------------------------------------------------------
RISC-V config for v6.16

PM_GENERIC_DOMAINS is enabled because T-Head SoCs need to use it and
spacemit's gpio and clock controller are enabled for more obvious
reasons.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Haylen Chu (1):
      riscv: defconfig: spacemit: enable clock controller driver for SpacemiT K1

Michal Wilczynski (1):
      riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs

Yixun Lan (1):
      riscv: defconfig: spacemit: enable gpio support for K1 SoC

 arch/riscv/Kconfig.socs      | 1 +
 arch/riscv/configs/defconfig | 3 +++
 2 files changed, 4 insertions(+)

--9NQ8v+7/FrZL5T5K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCcVRQAKCRB4tDGHoIJi
0oeyAQD6njgKhyDmYcYhP328COpY96L/pYEzbB2hXkcQVzrb4gEA9OKsdhoFP863
tv+idNspjDD1fsjvcHzbzwNUkyzT3gY=
=ZMm9
-----END PGP SIGNATURE-----

--9NQ8v+7/FrZL5T5K--


--===============1513925757871838233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1513925757871838233==--

