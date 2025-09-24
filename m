Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECCACAC5A5
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 17:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=p0fvyNDnEB/34fyNnabDKOAWtKCy28Rg6na/PbL2O0s=; b=zOH
	/N4ZIXzupV9lM1XV5G3rVQhcCkloyYfhGHlfnK7dkERCB3kc95ocYk8hSLP0Q8a4cTP9YjZigC9CD
	lAPHed6hTY/tUzFNpT7Vmv24HqkrwGEpTmZuq7xpYBZlI6GmxeJaGoOaz1EfLsDFcOqziL6SzZ/3t
	/QXVZhvZD3iYp6WnLd+p2LBvj2DHiGvK7Db8r94ZKA1x3xxbrfQN2M11AgRaf3Eo+jw7obpnONxna
	UBHXjs94xfV8mUh24O8sQO6rlYnGtv6Dwk/U060N6go2WaI3BedQE5ydMO9IVRCHn9SBDRahAE9X2
	8QS6gtk6JrJr79hF0QNoCJtASy3x7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1TdF-00000002IFZ-2zrQ;
	Wed, 24 Sep 2025 17:50:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1TdC-00000002IFB-1gYN
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 17:50:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13E0A441E0
	for <linux-riscv@lists.infradead.org>; Wed, 24 Sep 2025 17:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2139DC4CEE7;
	Wed, 24 Sep 2025 17:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758736217;
	bh=74KN9oh1byEWmXXX9aM096GB/KOeCB7XK8MCfkCFyrI=;
	h=Date:From:To:Cc:Subject:From;
	b=A/ifURfTClGY1c+oC0O1OZnLh/WyrNAJZ3byA4Ba4oy0S1gDfG9ZGUvqtIEcytymB
	 opreyiPg8eO7dXCHrpSR0CL7voY7WE+liGbw6TrUNCPhIEx0CiG3lwhjEuNQXyXBHC
	 Pqin/wN6gBNQ0R0/ynZq+vnKWuJAGntfbHyiABZrFR2sU7IpXrGfDD4l5R9yRUxNb/
	 Py19Mrm26PyMlya4XhmV4Jvrbs8TH21JLu62DItjTgRWY6Pb7eMXA8VGZyA3JLWAf9
	 0WlgE3Top6fLH+nGoSCkW1XGeQ92pxyqJtCl5on3L8PhQsaAxlt1JUI370gcrhkTRp
	 mxi05Sy0Z7OTQ==
Date: Wed, 24 Sep 2025 18:50:14 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V cache drivers for v6.18
Message-ID: <20250924-relenting-aqua-a4a93b89809e@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_105018_465096_A80692B4 
X-CRM114-Status: UNSURE (   8.01  )
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
Content-Type: multipart/mixed; boundary="===============0304601942068237993=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0304601942068237993==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HYjhK9UizMWbDT15"
Content-Disposition: inline


--HYjhK9UizMWbDT15
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Wee PR here with just two changes, for the standalone cache drivers that I
look after.

Cheers,
Conor.

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-cache-for-v6.18

for you to fetch changes up to 941327ca5ddd45cfc4dd960cbbabed9e2b5cb1b0:

  cache: sifive_ccache: Optimize cache flushes (2025-09-11 19:13:21 +0100)

----------------------------------------------------------------
RISC-V cache drivers for v6.18

sifive:
Reduce the number of fences issued while flushing. Samuel reports that
this is approximately a 15peed-up.

ax45mp:
Fix the binding so that it permits the cache-sets setting used by the
recently added QiLai SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      dt-bindings: cache: ax45mp: add 2048 as a supported cache-sets value

Samuel Holland (1):
      cache: sifive_ccache: Optimize cache flushes

 .../devicetree/bindings/cache/andestech,ax45mp-cache.yaml         | 6 +++++-
 drivers/cache/sifive_ccache.c                                     | 8 ++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

--HYjhK9UizMWbDT15
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNQvVgAKCRB4tDGHoIJi
0tFTAQDkNSfkghj3zWo4zEHYMGIvZajP2CI9t7HsHZku1aHfTgD/UQjcnHnPzOwZ
cUJgR9ea40cJtMMcB3zNiViHjX3vdQk=
=8Nuq
-----END PGP SIGNATURE-----

--HYjhK9UizMWbDT15--


--===============0304601942068237993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0304601942068237993==--

