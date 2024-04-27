Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC5EC4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Apr 2024 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=gwXaPCZiLEtfnq9s6ygPwgjerX3MKRMDW7JNBCgBEXE=; b=bqW
	JvRjiLNaH73Ws3Ygxj71CG+H4kixCiFQf9eSLdpDyGmydGKKa4E6HpVXioSgyR47oKGf5TSBIsPFE
	z0NSQAqUoD5MXk0L/dVzatJPIs7JRsZq1OCtn7F0f8sJ8yOQKG+Heds76PAr9yN9Bjbef0xPCnH/l
	Hba6xF0sK3u6J2Ej0llp2sUyJqkqX3UKxxnON4JOwa33qICEySuDlspRvAzouxvuJDY+MMWnaD9MY
	oRUvDWakLxwTCfU/aK345t/Ygh785xGk142ffi/4DeW1t9S9qDrqGSQGqPnD9G7AzOP8TGd9+0nOL
	ah9oM4OQYKxZ7GB+3D9TFOAfqZV+06A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0fqL-0000000FMpc-2W52;
	Sat, 27 Apr 2024 11:03:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0fqI-0000000FMoh-0lli
	for linux-riscv@lists.infradead.org;
	Sat, 27 Apr 2024 11:03:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 25054CE0B39
	for <linux-riscv@lists.infradead.org>; Sat, 27 Apr 2024 11:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E0AC113CE;
	Sat, 27 Apr 2024 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714215816;
	bh=t7WJCJ2IOLzIiafVQuwBdJHvmvR0DL9iSenJjWaZspA=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=TaoOq6q/dg23xROmntFTGgmZ/6dArvuHP5LD/CrKEcKDy/97PYNSgupNYLXpYNPAq
	 ehwFVPw1BynbZhC74hJFB8Hch10DqJuYfJBvYnUQMAZIY1yS5+TpD3ofWXBXdb15kH
	 cMfA9TixuEcxUkQpmoOR9FoHM8gSFxa+YkplBgtgTCvCifbwz2zlorXv0RE4QUskis
	 w/d/ZuXTHFO/DofTnLL6bjHbPuGHXC92OXUqE0bGdWHMnBI4++AccVCjceSY6gl65M
	 FlNL1K8aaNWwJVOsZYLg2PGXmgaWvxD+/N189c0wwcr5amidAoEfQPUKWG4zPGYWWr
	 EcuOthGYF0/Sg==
Date: Sat, 27 Apr 2024 12:03:33 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V SoC driver fixes for v6.9-rc6
Message-ID: <20240427-unflawed-humorless-690472f9c5a0@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_040342_441622_1731CC04 
X-CRM114-Status: GOOD (  10.06  )
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
Content-Type: multipart/mixed; boundary="===============8978221662082413476=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8978221662082413476==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6+0j8s9u3CcYEjQq"
Content-Disposition: inline


--6+0j8s9u3CcYEjQq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull some minor fixes for some of the drivers under my remit.

Thanks,
Conor.

The following changes since commit c90847bcbfb65d0f1c48fcc73a2b3a2d4ceac6a1:

  cache: sifive_ccache: Partially convert to a platform driver (2024-03-28 22:40:56 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-fixes-for-v6.9-rc6

for you to fetch changes up to 3aa20d1f7bcb19a79b8062e49153eb3b16a88adb:

  firmware: microchip: clarify that sizes and addresses are in hex (2024-04-24 22:02:20 +0100)

----------------------------------------------------------------
RISC-V SoC driver fixes for v6.9-rc6

firmware:
Two changes for misleading printouts from the auto update driver, one
for an erroneous success message and the other to make it clear
addresses are in hex.

cache:
Samuel's fix for the ccache driver left an unused variable, so he
sent a follow up patch to silence that complaint.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (2):
      firmware: microchip: don't unconditionally print validation success
      firmware: microchip: clarify that sizes and addresses are in hex

Samuel Holland (1):
      cache: sifive_ccache: Silence unused variable warning

 drivers/cache/sifive_ccache.c                 | 2 +-
 drivers/firmware/microchip/mpfs-auto-update.c | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

--6+0j8s9u3CcYEjQq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZizbhQAKCRB4tDGHoIJi
0rSqAQD9Oxni1oYISoNG3eDcofmwhzGaogsC0pvlTD2vT+MIIwD/R2S7OwcbiRa6
t/ETcobl0yefgtfZhkneIzPa+w1D9Qo=
=YNaL
-----END PGP SIGNATURE-----

--6+0j8s9u3CcYEjQq--


--===============8978221662082413476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8978221662082413476==--

