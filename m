Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA4DC3DA41
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jul 2024 17:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=V1TXKn/4/Ej1H+IOFSlx8RoYCc78oc9cfMvTCRXtU/k=; b=E+t
	g/3DZ8dUK1uCPRUBe/QrgBh4KDRg93EGr21PRCzdRoCL+BdpEGJl6T4W9FEL+TDVHryNsMAVXfdv5
	vBjPi7qzbr9g6bmx8mbQwHxKuTDLahMumNGxWjnfEp8F9y+6POlaXEjMInj1nWgVaJk3LwsAuhXzX
	unYQo9XcUn/shP5CSZdKHO6MjnHtnPGc6ztCo0On2eAVXAzaKclN6Hcahhn6j1llstAoeCDrs2sNj
	HA337xhtE927DGR+t8gbjhOQIi4PIhQ3dXaBTAyFg4KQi5RlWlwsMf42li1pHoJDHoq0E+ZUBqme+
	aOY8tROhhKJU0mnJ8GAIAwhb9k8JXsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQVPv-0000000237S-2rtu;
	Sun, 07 Jul 2024 17:11:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQVPr-0000000236r-474P
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jul 2024 17:11:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D7360CE09AB;
	Sun,  7 Jul 2024 17:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BDDBC3277B;
	Sun,  7 Jul 2024 17:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720372268;
	bh=gpTwWmvknrcSzqHHR4kTECWm3tNiLqZgFbWoTnP+b84=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=uMVGdK3ICV+VFpr5VOLY2wKGjC1rw5pmYy7BJwZUhBIqZp6poucepMyjVLBM9Pj1v
	 5OzSezuVO84HT3ZmzgfYb8JTw+0/FjPbgrD1Sysa1jJGaznDyMjKNRVxwEYUpzWgT6
	 aDX4u3CA27FO4HGaCY1pxualt8aajOsAFBRimefJZ0g/Sx8jCsJAm4k8jnbtldC094
	 hqMPeWmbYLK7k63dgm3vZgNGKC61slef5lgbOSmWPmg/OoBC6XsZPAABKhx+XEZhB+
	 n5HdOd/F37D0IZ6SmXQHjusrqC+lZDlIe0O9o7iY4NJYdrxlhzevOz01WI6WK5ey6R
	 nv4bPJJFQGBWg==
Date: Sun, 7 Jul 2024 18:11:05 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V SoC drivers for v6.11
Message-ID: <20240707-getting-unhealthy-bbb3c67346bb@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_101112_220865_7C8557FA 
X-CRM114-Status: UNSURE (   6.86  )
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
Content-Type: multipart/mixed; boundary="===============7776583627235315919=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7776583627235315919==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ri8/7/7BqJ3GSS4x"
Content-Disposition: inline


--Ri8/7/7BqJ3GSS4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Single commit here, I discussed with Palmer about taking these defconfig
patches for board support etc via the soc tree, so we're gonna try that.
For now, only one commit here.

Cheers,
Conor.

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-config-for-v6.11

for you to fetch changes up to d8a7d89abb091fe4c1744241c7a40dbad570fd9e:

  riscv: defconfig: Enable StarFive JH7110 drivers (2024-06-12 23:16:55 +0100)

----------------------------------------------------------------
RISC-V config update for v6.11

StarFive:
Enable most of the options needed for the jh7100 based boards to be
properly testable with defconfig.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Hal Feng (1):
      riscv: defconfig: Enable StarFive JH7110 drivers

 arch/riscv/configs/defconfig | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

--Ri8/7/7BqJ3GSS4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZorMKQAKCRB4tDGHoIJi
0m9rAQDSRDFBr9wyNQGIbFthyjF08NwDYmzot4/4UrCfkz2nQgEAhEV9ToaAWJCy
25375xQXWfJhGM3xwwqVd4m61HBUfg4=
=nYmR
-----END PGP SIGNATURE-----

--Ri8/7/7BqJ3GSS4x--


--===============7776583627235315919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7776583627235315919==--

