Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44F7C3ABC9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=64qBR08x9HYjb05y38Ig6BvitSop8u5l093GImnIK8w=; b=MwW
	6riNM6ngD24PtSbcF1X9fknMilFDsR1KvPdkxtSbG1DLyNF6H+PJoqYpkbCU5U9Evwa7G9xrQL4MB
	9RD0QHgJ77pIM/StaBQGjgtpzqQxD+KfCZgwDMGP8cqxMMbXozSrooEtKv221X3SpE/DEEFDMycVK
	nLuSTmAWJ9nGy1gFavf7esCEnqokm4VVC3DDTX8R6bIpRd43M50XDEFM0alJuq40gGTcHRyaBoLDy
	pqh5taui0pXvtzA/74qrA1fMqL9DezW3Nx7H//hjdUbQYCoBTYc4VFpU4EGKFeN/5gX3If+ZDnOY2
	RIPzyUHyli2wSQZXuJG226J95C1OJIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsUA-000000039oS-0dtE;
	Fri, 16 May 2025 10:40:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsU7-000000039nL-2cg4
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 10:40:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 355C7440F7
	for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 10:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA43C4CEE4;
	Fri, 16 May 2025 10:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747392011;
	bh=AN9xNiEnuC0FAC3J8l6YjMN0qAtQk2YK6ewah96dz2g=;
	h=Date:From:To:Cc:Subject:From;
	b=L8bUiSyG6GvRKqWhDELVSFXljMFjk8Au70t4Rr9WfOzDwFEfjj6kYNlIVnm3xb2q6
	 CiY3aVPXwQAHuB2397ZFevuL2TTQusER2gaNieYuWg4XBLNne5Ap1KwEUM+QOjQRTr
	 T+FHsiRDM9eBbKC+OUKuZRIXrOMWIZUUIYX+QMjL+HE4sd8LRsWqqYvYSER4VOX2Jk
	 qc+MP2ZDHJlBCkyCdf6Ecrary7V2b6ZW2qDe4ibUEEAiNd0C6iWXO9DEaH0NmQQjJr
	 vMsQ2i3E75rUcfHUayAnGWzqKteNtyP/9OkWNwgdEGZy13KMJzYPzfbCRkVREvZLil
	 yAtHfsAkzjUsQ==
Date: Fri, 16 May 2025 11:40:07 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL 2/3] RISC-V cache drivers for v6.16
Message-ID: <20250516-liability-facility-667fc14a2a85@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_034011_707269_560E897C 
X-CRM114-Status: GOOD (  11.32  )
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
Content-Type: multipart/mixed; boundary="===============8608763302927092443=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8608763302927092443==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yQbHU6bp1wkj9V7M"
Content-Disposition: inline


--yQbHU6bp1wkj9V7M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull some cache driver/binding updates for 6.16.

Thanks,
Conor.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-cache-for-v6.16

for you to fetch changes up to 51b081cdb92377d7f923912d589cab414db600c4:

  dt-bindings: cache: add QiLai compatible to ax45mp (2025-05-14 16:53:02 +0100)

----------------------------------------------------------------
RISC-V cache drivers for v6.16

SiFive:
Add support for the Eswin EIC7700 SoC, which needs to make sure of the
non-standard cache-ops provided by the ccache driver.

Bindings:
Conversions for two Marvell bindings to yaml, and additions of two
soc-specific compatibles to the axm45mp bindings.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Ben Zong-You Xie (1):
      dt-bindings: cache: add QiLai compatible to ax45mp

Conor Dooley (1):
      dt-bindings: cache: add specific RZ/Five compatible to ax45mp

Pinkesh Vaghela (1):
      cache: sifive_ccache: Add ESWIN EIC7700 support

Pritesh Patel (1):
      dt-bindings: cache: sifive,ccache0: Add ESWIN EIC7700 SoC compatibility

Rob Herring (Arm) (2):
      dt-bindings: cache: Convert marvell,{feroceon,kirkwood}-cache to DT schema
      dt-bindings: cache: Convert marvell,tauros2-cache to DT schema

 .../bindings/cache/andestech,ax45mp-cache.yaml     | 20 +++++++++-
 .../bindings/cache/marvell,feroceon-cache.txt      | 16 --------
 .../bindings/cache/marvell,kirkwood-cache.yaml     | 45 ++++++++++++++++++++++
 .../bindings/cache/marvell,tauros2-cache.txt       | 17 --------
 .../bindings/cache/marvell,tauros2-cache.yaml      | 39 +++++++++++++++++++
 .../devicetree/bindings/cache/sifive,ccache0.yaml  | 44 +++++++++++++++++++--
 drivers/cache/sifive_ccache.c                      |  2 +
 7 files changed, 146 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/cache/marvell,feroceon-cache.txt
 create mode 100644 Documentation/devicetree/bindings/cache/marvell,kirkwood-cache.yaml
 delete mode 100644 Documentation/devicetree/bindings/cache/marvell,tauros2-cache.txt
 create mode 100644 Documentation/devicetree/bindings/cache/marvell,tauros2-cache.yaml

--yQbHU6bp1wkj9V7M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCcWBwAKCRB4tDGHoIJi
0l9ZAPoCtIGmy+PQcgeGHkS482NPxx4bcFU7korBJhPd9yQwfgD/Ydim5vnMnlf3
To/tMf8xPASZv5bue+dWWDzUAaQiEwE=
=sdE2
-----END PGP SIGNATURE-----

--yQbHU6bp1wkj9V7M--


--===============8608763302927092443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8608763302927092443==--

