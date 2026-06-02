Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B98CD6E4A
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 09:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=8ZYuqti7m8t6QSkafCub5EfxX91SEsY6wBwNl6Qcjug=; b=HYF
	lP19fefVsRw7QgDbreSlveg4MmO/9xKKij7tvM4Bptl1iugQcZSrdgTJhsL+qQscl7DtdboGPdY9P
	39pBrCYsEV/OJESOT5a8Soukc9zOXLjPX/OrunHnzFKBpBvk2qKSfDJ+0AiV/lR4dKm8xbd6Ad6IA
	qT4a4zw9UQf4PO5nNEzcTNk+Jj5HHyBW+9OVKO+G/yZW71OwwplI7ncHveTnyzIX4a4zG+Hm8761O
	AnFKA1HVs6E22wa1pSkdib1fkpzwWfmOOWwNoKgxvbT3YCN5qP4pLbKWU6pLcAAUTm942k8LwIYV0
	opVlzbksBO0jab2h1FmlJXnifeXfOqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUL89-0000000Cd6C-2rbn;
	Tue, 02 Jun 2026 09:09:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUL87-0000000Cd5i-1oR9
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 09:09:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 42A9443B5C;
	Tue,  2 Jun 2026 09:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2D21F00898;
	Tue,  2 Jun 2026 09:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780391386;
	bh=6c11wr/P23B82J0faqOmEOPTqeU+AJXGBp8NKpJOrYI=;
	h=Date:From:To:Cc:Subject;
	b=cDXYC17+xBPKoqX3wvSeft4sNGdZuym12jXWMV/HJtvoJFcV0KOE5Vvqu759/6k/j
	 NEoz5LwchwgS5ejg6l+tE1Mb7PH/qEwZTOvhCrWQex45PtlfT2ofjgRTWWu91KduOR
	 sNAwecptEMNE97UH5k5gKa7V+q63zcvtAnD+hX5XnlNMM09hBl3Vyv02nzmRQ97Cus
	 cEdNZNp378avy6Rp2+51luersh/FUmLeIUiFB4TooboswSzDJlRq0/eLitOjaUMa6J
	 95nrkpXDGoOqFa+sgWJl3pTmehvD7VVgCzDZMVhl1A83Scy9dyTA+DifHcbE97AEko
	 69e/1LxSIMc9w==
Date: Tue, 2 Jun 2026 10:09:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	conor@kernel.org, Troy Mitchell <TroyMitchell988@gmail.com>,
	Xukai Wang <kingxukai@zohomail.com>,
	linux-riscv@lists.infradead.org
Subject: [GIT PULL] canaan clk changes for 7.2
Message-ID: <20260602-latitude-unroasted-d88074ae2ebc@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_020947_533655_8CE02BC3 
X-CRM114-Status: GOOD (  11.09  )
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
Content-Type: multipart/mixed; boundary="===============1844060056795014246=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1844060056795014246==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SlRgpDK8SzB1i+YF"
Content-Disposition: inline


--SlRgpDK8SzB1i+YF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Stephen,

Please pull the addition of a new driver for the Canaan k230 SoC.

It's been on the list for quite a while, with minimal feedback received
on recent versions, so I figured I'd grab it and send a PR so that I can
merge the rest of the SoC support for 7.2. It's been in linux-next for
about two weeks with no issues that I am aware of.

Thanks,
Conor.


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ clk-canaan-7.2

for you to fetch changes up to a7b7c7c6c01679efef0fd2f2ca1c5114f303e4f5:

  clk: canaan: Add clock driver for Canaan K230 (2026-05-22 17:13:10 +0100)

----------------------------------------------------------------
Canaan k230 clock support

Driver and devicetree bindings for the Canaan k230 SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Xukai Wang (2):
      dt-bindings: clock: Add Canaan K230 clock controller
      clk: canaan: Add clock driver for Canaan K230

 Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml |   59 ++++++
 drivers/clk/Kconfig                                          |    6 +
 drivers/clk/Makefile                                         |    1 +
 drivers/clk/clk-k230.c                                       | 2452 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/dt-bindings/clock/canaan,k230-clk.h                  |  220 +++++++++++++++++++
 5 files changed, 2738 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
 create mode 100644 drivers/clk/clk-k230.c
 create mode 100644 include/dt-bindings/clock/canaan,k230-clk.h

--SlRgpDK8SzB1i+YF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah6d1gAKCRB4tDGHoIJi
0tVMAP98lboKhjOQ0/6AWaMyTfo00JdTRTW2Ovh2fvMLS+HkrAD/dCz2/ARZX8vZ
9azg458HgiSZ4dK1RbTqvZTTmW1Cvg8=
=DuRN
-----END PGP SIGNATURE-----

--SlRgpDK8SzB1i+YF--


--===============1844060056795014246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1844060056795014246==--

