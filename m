Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73736CC6B12
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=bayjTb6wl4zjULl0V1xJHHb32Jj2SCRUpg7AU9NZuCM=; b=4oZ
	5itsXqITEtU1fXxjodrmBGsRSbq8qsyHARm57McHLr4YGmZBOfTNV4Qr3nYE9uIOGKsRlUYhEmQ5S
	9c0+VgOv8N72bsCDtLq54Nfu6kLvJmakZKgpXSYN6nI0PD4+1hDbonbwPeoaVtmlXTLt7YO0Tl95z
	XNYyst3enFXjn7PHl35wGDSWJJCW3xJyA/FdK33eT/ARDTAy4xbM05G6XnEHR7bH/5Jrx6fTHq/EX
	e+QBv/jRqu0nneXjF1i4dQDqI4KOptP4TQZTayAl+m1DyhgDNe8dS3a/QT1PYsqMcKxuduhIFgmQC
	d33F6vNwDfKVlW74wf9oeGmJZw4LicA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGefj-0000000DOtS-0MAq;
	Tue, 13 Oct 2026 15:44:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGefh-0000000DOtB-2rxY
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 15:44:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FFA04125C
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 15:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E436E1F000FF;
	Tue, 13 Oct 2026 15:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791906249;
	bh=W78kZ1CgDdZuzUUrohZw5Ufe8Bw47xYePQvZ2XNrxog=;
	h=Date:From:To:Cc:Subject;
	b=mmIcc1Kp+Y0fZD6dh1Yl8y75+thxzWmWBDMiPRf5EsZxXFcfm8kDG/W9FQNfTleTf
	 xXZaGp8M34aRDQ7b/XMTGEPkNeHJbbygsx0A85D07bvYhg3dCRoKd89lZoiZObuZm6
	 KmIGHmtGPLppUHGaLjuPxGtZIGudKFBwcaUxRJKPz0sODpZoSJYL+AU1iphLck/rME
	 Lmbe918vElF5r2cF23lSr1/B1dI/5SwkKldXlXBQmKbs7ssPy0zJI7mP2hfla1xG/V
	 7j2Z3FdooccB/b7SzBteLBDMd5kaEKLbxTyYoWHVsSUp1HsdTAcj1tPrXTvKIoQ4mK
	 Lk7msLV3dqlPg==
Date: Tue, 13 Oct 2026 16:44:05 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, jic23@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL][4/4] standalone cache drivers for v7.4
Message-ID: <20261013-crewless-glade-be3d2efb5be7@spud>
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
Content-Type: multipart/mixed; boundary="===============6422625575848325568=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6422625575848325568==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s93d3e/JLXkayGaG"
Content-Disposition: inline

--s93d3e/JLXkayGaG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Please pull 3 bugfixes targeted for v7.4 due to their low priority.

I think one of these may have fallen on the floor due to being late for v7.3
and deferred in patchwork [1], so my branch is still based on v7.2-rc1.

There may be another driver appearing here, via the arm64 tree, but I
don't expect any conflicts at all if it does, since nothing here touches
makefiles/kconfig etc.

Thanks,
Conor.

1 https://patchwork.kernel.org/project/linux-soc/patch/20260813-cope-smugness-dd4de191bdda@spud/

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ cache-for-v7.4

for you to fetch changes up to b2f3a170ae968fac6270e89ce5738685bd2e530c:

  cache: Make cpu_cache_invalidate_memregion() error out if there are no handlers (2026-10-13 15:43:48 +0100)

----------------------------------------------------------------
standalone cache drivers for v7.4

Three low-priority bugfixes for issues in the hisi hha and sifive ccache
drivers as well as the core code.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Bence Csokas (1):
      cache: Make cpu_cache_invalidate_memregion() error out if there are no handlers

Pan Chuang (1):
      cache: sifive_ccache: Remove redundant dev_err_probe()

Pawel Zalewski (The Capable Hub) (1):
      cache: hisi_soc_hha: use named initializers for acpi_device_id

 drivers/cache/hisi_soc_hha.c  | 2 +-
 drivers/cache/sifive_ccache.c | 2 +-
 lib/cache_maint.c             | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

--s93d3e/JLXkayGaG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas5RxQAKCRB4tDGHoIJi
0g1RAQCmFfHxNZAvKNULY1uTIe9+JHRW8p8jnPgbW81o5PbcxgD7BW4RVP+hbFAX
gDe7VeWsqRIPAb35g1xCqRKPrcbb4gI=
=DyBl
-----END PGP SIGNATURE-----

--s93d3e/JLXkayGaG--


--===============6422625575848325568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6422625575848325568==--

