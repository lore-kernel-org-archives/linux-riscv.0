Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0D7C3DA41
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jul 2024 17:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=veyf/8Fje4/+P7GQbcBmmppplncsPL85UY6cTKmig4E=; b=iOd
	dTMoKhhStO2plS9w+o8vtTTmHlye8ChtWWqTp9Y2fpxwwIvgZVtBPfhkIq49a7doUBuiajaPByPbv
	u2JDyZFhD/ZM8DmmDslEuIF+wXlmbPB+j0KJoJPyvvcenIFwXtyMR8nGNeUFjLR67XLaaH+tFIXsN
	3HqlJV+r5Em0Pe+FR6SdB+TqRIYomLpN95F/aXGp1BbOWsaP2beWu9XIdMkKjImuIU48168pU3r5i
	q3w12B68FYKSlU9I9G3lXjfQsehAPfhhTDLnEd0bRMDMhyceussYxRg15YtpiPG1roXjZYZ5A8HeS
	ERnq+4uMAqe/mwH3LaDY/r1uLipudhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQVgs-000000024Ry-3P9D;
	Sun, 07 Jul 2024 17:28:46 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQVgq-000000024RP-0Ut5
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jul 2024 17:28:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 41C61CE09CF;
	Sun,  7 Jul 2024 17:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0C2C3277B;
	Sun,  7 Jul 2024 17:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720373321;
	bh=dec1lMOTT+MCuRCKzG2P+w3SGTySw92Kkt3knjpum+g=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=DWs9Ps9bxmvsAWPEh4l4pMiv+4azWznAGl7lv3ysVo8dzIXVbSrNVy4thXeXtfAgu
	 r+hLX/ex8YdE+m3PblD0yJpHVKbDjrcUoO7pjbOpFFRVjGQN62BS9XQhi0w6nBN8OT
	 0Ly//sW+2zVz2uIDojiMaz5KfXqJCAVetirBss7AYgo/6F9Ls23RP8loYq1xFhmwVa
	 JTcMnRcEfs0dVudaRK7G36L46VaKHUXcw789gcxkwvKm+myDcWnnxQeD7Ohtwc3d8m
	 7kT1qn7aHc93CMZs1LTRHwapxTV12FOur9SxoRJE3WXxXa/aQjz2IY/CJabeXpEHOB
	 TVb5UVVKIHDLw==
Date: Sun, 7 Jul 2024 18:28:38 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com
Subject: [GIT PULL] RISC-V defconfig for v6.11
Message-ID: <20240707-unused-outflank-aa127ccb2cfe@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_102844_364754_6A0E71A0 
X-CRM114-Status: UNSURE (   6.84  )
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
Content-Type: multipart/mixed; boundary="===============1361212987095751414=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1361212987095751414==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8e9vZ7cZueqeuYTs"
Content-Disposition: inline


--8e9vZ7cZueqeuYTs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

The 3rd attempt 2 with a fixed $subject.

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

--8e9vZ7cZueqeuYTs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZorQRgAKCRB4tDGHoIJi
0q2mAQCIlXjes04MsCW7Tk1ZKu26x6dn7lrn2YLHs7cy1Kt0ngD/Yca8ptVoIVNT
I+DwPcZgC1lvwW/zu4C/q7gdgR4rTgw=
=uqw1
-----END PGP SIGNATURE-----

--8e9vZ7cZueqeuYTs--


--===============1361212987095751414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1361212987095751414==--

