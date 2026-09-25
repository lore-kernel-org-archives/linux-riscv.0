Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A8CC98321
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 16:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5qxUDABgWbJw4SuAVt8crvLnDTEeL4sZ5iEAPrifSgw=; b=VLw
	pFemefQ0PH4rNO0rzm6oMyKY1qO/aKNkkNQNkEsUqV6uUqlfScEnaIuUC1RqDPfqTyrVqMuC8E8YB
	2NaF2LcxGtFvOlVTxQ1M3Vv9nS63z+7tSEhtK+yKZkgmO0jBieBvTeOfsObn0jH+5Dopbi2eAk4Xl
	gbqSZSwBH643a+xm+SnhZCwvzNmwgU3WatCk/d3Zs958HasZ0j1Q6nmV6iuqmnshXXAkSwEYBFAkP
	jp8ThM/eGDJS7NW0ErHkCCrMlV7a1A5cBk9Kx2ncz/VaUhf5WWq6JCqifbm32XJlk5GzW31TNp8Up
	fuMWkIQdLE0p9dwtMv/BbFuo6klLlFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9DU-0000000E1He-2L4S;
	Fri, 25 Sep 2026 16:56:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9DT-0000000E1HS-2b4o
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 16:56:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 185FD401E0
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 16:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0608D1F000FF;
	Fri, 25 Sep 2026 16:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790355367;
	bh=JyWMU3JvXb+q6hdn+2pHzQzTmrdk/tb2/VNmym1OxiE=;
	h=Date:From:To:Cc:Subject;
	b=MyE329IJKXECgPMCU7g59WRo4Z0HFKqQEFu1JcnSrB/pCQBVw1e+r+iE93uWZsSdZ
	 HsEf/LPxDGyS3WOPqB+eUQ6oScpK5EiZ9UIUqsj+wgylZKjU2nqwYll5iYa9T9QKHM
	 SEGzqZ9mgShJ0BNhiknIh2r6p1KYj6itYHi8wb84CbrxBPgS5xyDHaXaE4L9wf+Ilr
	 kgb8k8l9q2jLWpxa1/k9jthp4vOCx2mQue2K2P2wVmxWB2vn8xk/r+XPRsAT/ohK51
	 W5gTASa+BD1ynQfikdaBfq83OK17MzfEx2sbtEAKnOdylX+KqUxYe+4myfeKrquXtw
	 PlQx0NokznLMw==
Date: Fri, 25 Sep 2026 17:56:03 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V devicetrees fixes for v7.3-rc
Message-ID: <20260925-parlor-snowfield-6ca46312a610@spud>
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
Content-Type: multipart/mixed; boundary="===============5802669380117927201=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5802669380117927201==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LTB7MCFcjfB9m+dv"
Content-Disposition: inline

--LTB7MCFcjfB9m+dv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Wee PR, but I feel like I should send it now rather than much later in the
cycle after we all get our conference fix.

Cheers,
Conor.

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/conor/linux tags/riscv-dt-fixes-for-v7.3-rc

for you to fetch changes up to 0f70fd6f4c1d6c1f2ea298d8dd07c4a4d5dff9af:

  riscv: dts: microchip: beaglev-fire: remove double definition of gpio interrupts (2026-09-08 19:18:19 +0100)

----------------------------------------------------------------
RISC-V devicetrees fixes for v7.3-rc

Microchip:
Remove double definition of interrupts on the BeagleV-Fire, which cause
the sensor to be associated the wrong plic interrupt.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      riscv: dts: microchip: beaglev-fire: remove double definition of gpio interrupts

 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts | 18 ------------------
 1 file changed, 18 deletions(-)

--LTB7MCFcjfB9m+dv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaranowAKCRB4tDGHoIJi
0qmBAQD2DjL9gXJ3DfkQQ1F/Yzuivzla65ZZxHDJAf+GKEjD9QD/QkrFmKI9/NVR
Tx74zNF/tvKx0SN4UAQC0eDmkflBVQM=
=rnWx
-----END PGP SIGNATURE-----

--LTB7MCFcjfB9m+dv--


--===============5802669380117927201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5802669380117927201==--

