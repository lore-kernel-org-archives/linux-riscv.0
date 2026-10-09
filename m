Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057C4CA6019
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 09:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=r6vPkbvOAr3w18dWNs9lgiqhYQcWj2c7KiZH89lkBNQ=; b=pzN
	5/jc473RS3pjm50g/N/UMS45o93yyuTgqhB3XF1WZs5YjEkZ7YTazijMSc2Nw7HofzWGbH6jpyQmw
	sXA/+AqAFpRboXlS36vkj7kboaxYSWLDO2K9DowLSCtTCDzY97di1XxPxc94rockRo9thhgatp9BI
	tSZiJpDCmPD5Xw37REYooaD6MH93mG0u4M1BBPNtApGGTOd6PUHFUtyn8iMh2v27n3yPDWIg/yBGh
	OfuPK2ypBM38mtvR+fBnz+Eedh7XJRaZxbWhCfoyh1TPK1oEvfMRNOvTHuFd6k0/th46hS5OXSqkB
	4heQExgNHdw4GXb3rWFKJlIRiInU3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6vQ-00000005vGU-1RMj;
	Fri, 09 Oct 2026 09:30:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6vO-00000005vGC-2qpR
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 09:29:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15C77406F4;
	Fri,  9 Oct 2026 09:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1851E1F000FF;
	Fri,  9 Oct 2026 09:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791538198;
	bh=VfqAS3xVtdPGaSLM4cdLGjFENInOxmgNDUluYvb/JrE=;
	h=Date:From:To:Cc:Subject;
	b=dcrVp6SVksawPXTF0QrIhj3mC6m4vitrqttSkM/b5tSj7ZIWeNML7Xlj7zTUZVF0N
	 eunRP0D9kaDbyFj+8iWpR9jd09q5ZWU8HH3P9xZ73Bbbvr2AWR6JFnwcaWVWXs5NuH
	 Hd2yCskSRP6ARpgE29bRaFKw2sRD0lPwlfN3RbBOdw+axF/TPyKGS6XH1gNOU+KaM1
	 sZZqDdojFt5LkizVsNQS7PFNXnxeRFnfNOB1Ao/wad6SxzGC7ub1ciIW0WVKkZ5bZM
	 beevAIcqdz6IzwOMeqK/oo9zdB0QG788wqUMVXPHuDPOcZbfBr30ZvnWdNo54B6byR
	 p35414Dr9pwog==
Date: Fri, 9 Oct 2026 10:29:53 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org, dlemoal@kernel.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RISCV: canaan: Deprecated (oficially) the K210
Message-ID: <20261009-ee797bb64a30cf907f583aca@squawk>
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
Content-Type: multipart/mixed; boundary="===============5247833269032626353=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5247833269032626353==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kbpjpruCjiPUyCYz"
Content-Disposition: inline

--kbpjpruCjiPUyCYz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Conor Dooley <conor.dooley@microchip.com>

Two years ago, at LPC, the only known user of the k210, Damien, gave his
okay to delete the platform from the kernel but this never actually took
place. Deprecate the platform now, marking it as broken so that users
will have to explicitly re-enable it on updating their kernels.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

Another patch written during a talk, but it's simple so suuuuurely it'll
not be broken, right?

---
 arch/riscv/Kconfig.socs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index c174ac0ec46b..56eeddd94972 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -105,6 +105,7 @@ config ARCH_CANAAN
 config SOC_CANAAN_K210
 	bool "Canaan Kendryte K210 SoC"
 	depends on !MMU && ARCH_CANAAN
+	depends on BROKEN
 	select ARCH_HAS_RESET_CONTROLLER
 	select PINCTRL
 	select COMMON_CLK
--=20
2.56.0


--kbpjpruCjiPUyCYz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasi0CQAKCRB4tDGHoIJi
0nBNAP9WUvB1AG2MV6qlC1dSRVmmYzxBAbfVoIRXWQJq7xguwgEA6ZuBNEglwKS8
7suA1k6W5ooSci751bG5jSw9eE061Qg=
=D0eX
-----END PGP SIGNATURE-----

--kbpjpruCjiPUyCYz--


--===============5247833269032626353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5247833269032626353==--

