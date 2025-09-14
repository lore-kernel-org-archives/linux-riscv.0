Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DE2CAC587
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Sep 2025 15:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RX0r4zcnQVek7LUBnVaQaNRsDJBdCGjn6lCaJNp83pE=; b=nXi5Bcy1EpxLLiPLRc/WEsdP2h
	dw3fbkonfVaZye08PdnjWN8AOtkcfp/Naqb9fXVgikbUNJUWyuiGB3u1gpEl97oHSVDH/+hdDr6i6
	Mdum9FPdbYmR4N3QZJhIaPLlX5t6CKHO3Ia+LgHxAjwqg4FF/zawjKxNaxkSmw3gmjY57ZUWYZyhF
	8Kvum/RlffPFp2EYoAbCxga5oA1y9ClkQl0qx7VA9pUjiNuB/c8iPki8zcHwGIb9LmBsQaufEkTc9
	82I5/DdmHwlrIR8veMXgQe8V9Q6e9HmDyaWVZYV8/nUovv/eUSRqX6DCtJSOQN79NzsWGMe4Ru0+A
	udhlCMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxoty-00000001jiX-2N5U;
	Sun, 14 Sep 2025 15:44:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxotv-00000001jhE-1gsA
	for linux-riscv@lists.infradead.org;
	Sun, 14 Sep 2025 15:44:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 905264064F;
	Sun, 14 Sep 2025 15:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD65C4CEF0;
	Sun, 14 Sep 2025 15:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757864665;
	bh=go4fbgG+AD8O+A1V17pC3IWuPz61hjCCsjI7QEuyln4=;
	h=Date:From:List-Id:To:Cc:Subject:References:In-Reply-To:From;
	b=P3QdzTyScG1lAhJeL+vFnLF5trdO/dfD/V8wu3ABJe8RIkt5zs9Y6mT8asP3B6hqL
	 zyEOPGBtd2TUkRRzLjjGr/jHqQvVIcVdBrXnQtZZ0C4N6d9sV9cpbtPOG+jyQYdr8g
	 3nX0NDo0zcGLt0Frg8yp6jpB7vAroKpMzf4XmgshC1rcYhouChYjRX3zOyLVfMwzVg
	 q6BldCdEdW9XkMfb5kRt2pMNIxqZn7UbNiGPpBxioHDaWBYj8k0lH4AJnyzrXrL4th
	 1ZlrssRfDHu/MiiFNcnvzI9pPKf5/jHp1k++z/GvrPkv6HXOULDxasu2/yH31qMmav
	 G4cMfE9L3bEAA==
Date: Sun, 14 Sep 2025 16:44:21 +0100
From: Conor Dooley <conor@kernel.org>
To: patchwork-bot+linux-riscv@kernel.org
Cc: Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, guodong@riscstar.com, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: defconfig: run savedefconfig to reorder it
Message-ID: <20250914-rendering-afar-dd97b3a2505f@spud>
References: <20250611-01-riscv-defconfig-v1-1-b48fc3517498@gentoo.org>
 <174976442875.118664.14858626447477465303.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
In-Reply-To: <174976442875.118664.14858626447477465303.git-patchwork-notify@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_084427_463610_7D998C6A 
X-CRM114-Status: GOOD (  17.34  )
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
Content-Type: multipart/mixed; boundary="===============6159087427332747160=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6159087427332747160==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="piIculNeLXDMcyrI"
Content-Disposition: inline


--piIculNeLXDMcyrI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Paul,

On Thu, Jun 12, 2025 at 09:40:28PM +0000, patchwork-bot+linux-riscv@kernel.=
org wrote:
> Hello:
>=20
> This patch was applied to riscv/linux.git (for-next)
> by Palmer Dabbelt <palmer@dabbelt.com>:
>=20
> On Wed, 11 Jun 2025 22:56:04 +0800 you wrote:
> > Changes to defconfig should be always updated via 'make
> > savedefconfig', run this command to make it aligned again.
> >=20
> > This will ease the effort of reviewing changes of defconfig
> > in the future.
> >=20
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> >=20
> > [...]
>=20
> Here is the summary with links:
>   - riscv: defconfig: run savedefconfig to reorder it
>     https://git.kernel.org/riscv/c/d958097bdf88

This got lost in the 6.17 "incident". I applied it to my branch that I
collect defconfig stuff for SoCs on as it is a prereq for some spacemit
stuff that I was grabbing. It's up on my korg repo as a tag if you need
or want to pull it in:

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/ris=
cv-savedefconfig-6.18

for you to fetch changes up to 125c62df09a3fa4143298658340f093d2bd364a6:

  riscv: defconfig: run savedefconfig to reorder it (2025-09-14 16:34:42 +0=
100)

----------------------------------------------------------------
riscv-savedefconfig-6.18

----------------------------------------------------------------
Yixun Lan (1):
      riscv: defconfig: run savedefconfig to reorder it

 arch/riscv/configs/defconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--piIculNeLXDMcyrI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMbi1QAKCRB4tDGHoIJi
0vquAP0U+9G5MAqk077lLuT4dfODkjR97SP5TFmveINFUmnT7AEAm8Wp/y80V3xq
l/2Bq/TK5plRQs+u3MwLDoB1EMqvHg4=
=QwpP
-----END PGP SIGNATURE-----

--piIculNeLXDMcyrI--


--===============6159087427332747160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6159087427332747160==--

