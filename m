Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2522ECE579
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 14:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ouVBVf17odXVx+i07UmT65aAP3qUrH6kZIzn2k4LrIA=; b=wvo
	pyIE8YDO/GywrhfOrD7liAg6yEAtGoa60VNfpFz10FLo4tVpSLqzLBO36z0jPqWejF0m9rTdomlFc
	5yEbOAX6j0+rm42NJ1YmLienkI5Vt/IDrEjUPRcDOs4vhPtN2AkFHgpWT485Wli14HwecUtEU/R7l
	+QqeW1oJfDE27x+olADiaFL45xyp+hnRQ/Z4qDCaYHO5tWGlhnKpIkX6Ga/Fz3kDb0DjfVEFsCDeG
	/njP2f3TgCQb+RT/X86lHrl7/fXN+cSp8/FivWkikHjrfZ9u5njn3TPzWWdVy2RLzsRg90dId4tND
	mEav8ZUz5eRiLUmrPQo1BnOV7A6gqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snfSZ-00000002Ijk-3sMm;
	Mon, 09 Sep 2024 14:33:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snfSW-00000002Iiz-3GHJ
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 14:33:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C755AA43CD2
	for <linux-riscv@lists.infradead.org>; Mon,  9 Sep 2024 14:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB7FC4CEC6;
	Mon,  9 Sep 2024 14:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725892418;
	bh=HoCKrL7+5o82WW7cJRSMroomYm7G44fMgjAi70lKcwg=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=uUtot74PDbTTEDHNCVDjPS8xw9VwYCby15yy1/mFNXku5ivfgfBdCVM0zlY2p5D3F
	 MHkYA2Dhk22bSkT9+eXACNrIChwYzX3SjLFBjn//Adr2ki6GlBjQPK6fdyDoVC/aGS
	 lA4QFBBEj7wBN9kNTFOWps3qsYw9ud3dhptjMeA5JK2eINIWS2R3+8gMOrlIMi0ifY
	 lF3bsZMS3N0EjcRaL5v8sp4iFbpWxMsvL1OeJACJ8eFb5oua+kes1OhBvHOAczmmHV
	 yNEGUjVYkAPINjBflwZdMyb8OMKHp9fOvUJ+i6q5S1WJvZ+GmjPLig57sAuSL85TmV
	 zbh6CONEFTzGw==
Date: Mon, 9 Sep 2024 15:33:36 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V soc fixes for v6.11-final
Message-ID: <20240909-hybrid-groovy-601a33b5b309@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_073340_902753_E8D6B2C7 
X-CRM114-Status: UNSURE (   7.96  )
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
Content-Type: multipart/mixed; boundary="===============2423356840127917147=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2423356840127917147==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X44/jGdhTNky87+X"
Content-Disposition: inline


--X44/jGdhTNky87+X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Here's the fix that was being discussed on IRC over the weekend.

Cheers,
conor.

The following changes since commit 591940e22e287fb64ac07be275e343d860cb72d6:

  firmware: microchip: fix incorrect error report of programming:timeout on success (2024-08-22 20:47:16 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-fixes-for-v6.11-final

for you to fetch changes up to 61f2e8a3a94175dbbaad6a54f381b2a505324610:

  riscv: dts: starfive: jh7110-common: Fix lower rate of CPUfreq by setting PLL0 rate to 1.5GHz (2024-09-08 23:20:19 +0100)

----------------------------------------------------------------
RISC-V soc fixes for v6.11-final

StarFive:
A fix to return one of the clocks on the JH7110 from 1 GHz to 1.5 GHz

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Xingyu Wu (1):
      riscv: dts: starfive: jh7110-common: Fix lower rate of CPUfreq by setting PLL0 rate to 1.5GHz

 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

--X44/jGdhTNky87+X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZt8HPwAKCRB4tDGHoIJi
0mq3AP9LdV4YzjeqnoHO1l4BBy42JMwqs9F3y6OSFv25I6GKwwD/ThjaBiaAPDIY
M2Eqznog6Y5SphlJ4JiMzLyeGpx+YQA=
=aYLb
-----END PGP SIGNATURE-----

--X44/jGdhTNky87+X--


--===============2423356840127917147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2423356840127917147==--

