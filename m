Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0556210A1E68
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 11:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Snm8dHvC9K2gK9ijSatArHvTSAJLAHnTEqsLJFNF+FI=; b=UJC
	xDe/7kpTjTpbh0/jeL1q9Nnqgqm7Sx1JwR89i/BqJYeV3WYp7qcBzdX0E8OTT9BHg5MoVr30rVbHX
	BhSs8c+JNj+0b0e2flPpLyBE5Eyjoke776ySipKNzWH8kVsHRZGqWASBSztPPdKeZD4KFpPkd6iVB
	cjUWE+MIJj7Z8RwKWqvdZ0P6FdSy2ebfV2C35PGadfBR3xaTlBlMXjF/PEmsvti/1JsKJ2gyPKVdg
	xPZe1BfUow0rmYL3jBnZJFpabrMhlKBIDGAnmC+2XMSwoZwoxBzVLVvf38RIWTVCopj4Q6LujmYv2
	BRvjU9XDyxdbr37+INoAEqD8P0mLMEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5imY-00000005MHW-3Wbu;
	Thu, 26 Mar 2026 11:21:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5imV-00000005MGm-49ge
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 11:21:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DEF26419F0
	for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 11:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C1DC116C6;
	Thu, 26 Mar 2026 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774524102;
	bh=fI3zTkRfJyu9iUjRRxGqt4eJvukvwwoupPnLtdRJbn0=;
	h=Date:From:To:Cc:Subject:From;
	b=tNR7wnCLjznjormCld4fxdNzMAvGF//DekN/ubCk4baLlKjAyOxPUR5euqWXowkD3
	 Kfh/7+LG+oxpPe9dpnkQg1jtMZv4c7X/TWC5PeH39SaRKk6l5iHt4n/FN/St2No3GB
	 0jW9COhCrC/LU1zxhhyshxb1VhpQLhe6w9FcEAc6MMiOyc7hYWnhLNi43kndu+RDzd
	 PEF+kVTBoXvn8B22YP1Bk+kk8d9y2a88P8Fr4YGHDtnRRZy5Fb3dOhrcg2E5cCLj+i
	 8G5gPzWUwB/JexrnQfwU0ZNb2DieOyJ2JyR5HQrYTy0HySwQY3WA3fJ8LgNwXSEJGX
	 ltUyPdXDtw04g==
Date: Thu, 26 Mar 2026 11:21:39 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] ~RISC-V~Microchip soc fixes for v7.0-rc6
Message-ID: <20260326-vertebrae-relatable-adfa3baabfd6@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_042144_682767_CC84F358 
X-CRM114-Status: UNSURE (   9.16  )
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
Content-Type: multipart/mixed; boundary="===============1468165646723771519=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1468165646723771519==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zbUJx0RWubwazLAx"
Content-Disposition: inline


--zbUJx0RWubwazLAx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Another small PR here, worth pointing out that the exact contents has
been in linux-next but not as these commit hashes yet, I squashed a
fixup patch just now that I hadn't realised got pushed without being
squashed. Might be worth letting it marinate for a few days if that's
a concern.

Cheers,
Conor.

The following changes since commit 0528a348b04b327a4611e29589beb4c9ae81304a:

  cache: ax45mp: Fix device node reference leak in ax45mp_cache_init() (2026-02-06 19:54:40 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-fixes-for-v7.0-rc6

for you to fetch changes up to c7596f9001e2b83293e3658e4e1addde69bb335d:

  firmware: microchip: fail auto-update probe if no flash found (2026-03-26 11:14:11 +0000)

----------------------------------------------------------------
RISC-V soc fixes for v7.0-rc6

Microchip:
More resource leak fixes for unlikely scenarios, and a change to the
auto-update "firmware" driver to prevent it probing on systems with
engineering silicon where it cannot be used.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      firmware: microchip: fail auto-update probe if no flash found

Felix Gu (2):
      soc: microchip: mpfs-control-scb: Fix resource leak on driver unbind
      soc: microchip: mpfs-mss-top-sysreg: Fix resource leak on driver unbind

 drivers/firmware/microchip/mpfs-auto-update.c | 10 ++++++----
 drivers/soc/microchip/mpfs-control-scb.c      |  6 ++++--
 drivers/soc/microchip/mpfs-mss-top-sysreg.c   |  6 ++++--
 3 files changed, 14 insertions(+), 8 deletions(-)

--zbUJx0RWubwazLAx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacUWwwAKCRB4tDGHoIJi
0kcNAP0bX0T7NpKnIi48ujNlv4IW/mPjopUf2sRIkqzeS/qoDwD8DlqUFU+ctFHF
ih8iC06d93AvfnqUHIQC3lztuXiTwQM=
=l9Xw
-----END PGP SIGNATURE-----

--zbUJx0RWubwazLAx--


--===============1468165646723771519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1468165646723771519==--

