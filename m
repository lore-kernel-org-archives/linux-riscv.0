Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196D7D6B6A7
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 12:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=8tM0QATJCeES2ZioA/m9AheW1vwVURHYa9Y1fHIEJQA=; b=uVc
	4WlyeD6gqL9Xl7lr82C4AoUB+jO+TlDP6xrBx1MU0gtJBoI9hqMsRnrUA1Uf7SlNn1NyHYKlc8LtS
	GjupECCAUiOjLfvhQrQ73ZwiDViLF8kbuMVX0oUOOolXpQo8Dwk+ncLp+a8WU6b0xJMAiXjt6rKtK
	t9pD9cJ0k6s8JSHVjfEMKvwp3HeRgnpe8ipDYd48FGFvu4kofwyyoWxhw4guEJSzHLs2gW31xEJyY
	owWjsuAEhbdNOKfKS6fIVA1+KZAZ1Ndzn2j6ra0Ebd9KTgx027zj31KRc04QD452IJ3+IksnKih7S
	WYALsuqgm0DnJI+K09fOnXGulUmuxSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UCJ-00000003Vqn-3ycA;
	Thu, 31 Oct 2024 12:22:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UBz-00000003Vpd-0dqG
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 12:22:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 29B2AA4417E
	for <linux-riscv@lists.infradead.org>; Thu, 31 Oct 2024 12:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6850C4E671;
	Thu, 31 Oct 2024 12:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730377341;
	bh=1CwaCKaAMFiIdn0h6+nFasiEDWSxxpKstil5b0DbBG0=;
	h=Date:From:To:Cc:Subject:From;
	b=SbYWQ5ijCpOBDSwCVkiITvxKkQy9BPXK/4/Ok2DFQKEtTrY4RIMQ+VnX77Eu7Ool+
	 Q8pjDfNwr5hfUzyNqXuXn5zqGgGwy/acP2OBXwSN+JT1SRlLZZq/bV8jLDFyModLN/
	 WFN5ZZhT1QsKpIBLmqHBzFh8oY7ycKWzfDNtLqqzDqBCUqWRCrstb+PpXY4VnR+rKO
	 yGhzRAD5HrodvlLonzWN2rzlgDiRu5ygoU5uAN20A2lEhAy3cZGQl7UGb5ZDUrK8ba
	 nL1QnugES9xpusokSTxjqtXRIct4lME5nevSxRLLK/PewucVtvwa8oXAAOqSINK9Nz
	 5SIxF25CttgPQ==
Date: Thu, 31 Oct 2024 12:22:18 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V soc fixes for v6.12-rc6
Message-ID: <20241031-colossal-cassette-617817c9bec3@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_052223_370058_014D7CC1 
X-CRM114-Status: GOOD (  10.07  )
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
Content-Type: multipart/mixed; boundary="===============2362360974524316130=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2362360974524316130==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kTm0+sFzuK+Ucblh"
Content-Disposition: inline


--kTm0+sFzuK+Ucblh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull some fixes that I have accumulated for this cycle.

Cheers,
Conor.

The following changes since commit 8e929cb546ee42c9a61d24fae60605e9e3192354:

  Linux 6.12-rc3 (2024-10-13 14:33:32 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-fixes-for-v6.12-rc6

for you to fetch changes up to 384f2024e1a100b9b977a697f5e7cb151b00550d:

  MAINTAINERS: invert Misc RISC-V SoC Support's pattern (2024-10-24 16:27:10 +0100)

----------------------------------------------------------------
RISC-V soc fixes for v6.12-rc6

StarFive:
Two minor dts fixes, one setting the correct eth phy delay parameters
and one disabling unused nodes that caused warnings at probe time.

Firmware:
Fix the poll_complete() implementation in the auto-update driver so that
it behaves as the framework expects.

Misc:
Update the maintainer pattern for my dts entry, so that it covers
the specific platforms listed , rather than including all riscv
platforms with the list platforms excluded.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (3):
      firmware: microchip: auto-update: fix poll_complete() to not report spurious timeout errors
      riscv: dts: starfive: disable unused csi/camss nodes
      MAINTAINERS: invert Misc RISC-V SoC Support's pattern

E Shattow (1):
      riscv: dts: starfive: Update ethernet phy0 delay parameter values for Star64

 MAINTAINERS                                        | 10 +++---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    |  2 --
 .../boot/dts/starfive/jh7110-pine64-star64.dts     |  3 +-
 drivers/firmware/microchip/mpfs-auto-update.c      | 42 ++++------------------
 4 files changed, 12 insertions(+), 45 deletions(-)

--kTm0+sFzuK+Ucblh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyN2egAKCRB4tDGHoIJi
0l8BAPwM5TGTM2+fHKZL9/2adoAeE49F75k6RB4gH04AoCG9PgD/V/QzcxcfGFkI
KjoZYDFLg8MVrgoyz/hxMELOmbij4w8=
=65OL
-----END PGP SIGNATURE-----

--kTm0+sFzuK+Ucblh--


--===============2362360974524316130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2362360974524316130==--

