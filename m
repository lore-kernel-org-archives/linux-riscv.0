Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B106C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 11:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=QEVdlxyDQ0c7fK8s3YNBdNr9pT5taxVQv6PgONV0xak=; b=Pzb
	8YE+NR9qH+mm6d1CYnUp6a0jeEJ+znMEPensTQlLULocpXcmVVT0BK23nG5gvxYTfXPZzgUNmKzGx
	zzvJ1pwqwhBIwXUbDWBVZSDnBRmlu5iRqEWUKqIliXNyjpqGNW6hr9HJ0WFFJhRMPDT3mB5WA4S37
	A4B65ZZiHzk+/jGT/SM/8QH69kLTSqqD9v6/uZvJYH3eNHQx7kgKmuxTmmkqD8sbbxjC2GrHm13As
	mWnr5hdgbkV/TxcmW/zgk0x+awKqGyfY3nHI9k0c62tDbOHjAlb75j/tXbqpa2bM9iG+OAUbJKTW3
	CaQ5qc32kmwxGgZ6MmS/V+ABBuqXumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBwuk-00DhVF-IO; Thu, 14 Jul 2022 11:21:50 +0000
Received: from maynard.decadent.org.uk ([95.217.213.242])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBwui-00DhTD-2z
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 11:21:49 +0000
Received: from [91.187.115.177] (helo=deadeye)
	by maynard with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ben@decadent.org.uk>)
	id 1oBwuf-0000DK-8w; Thu, 14 Jul 2022 13:21:45 +0200
Received: from ben by deadeye with local (Exim 4.96)
	(envelope-from <ben@decadent.org.uk>)
	id 1oBwue-004vOq-1w;
	Thu, 14 Jul 2022 13:21:44 +0200
Date: Thu, 14 Jul 2022 13:21:44 +0200
From: Ben Hutchings <ben@decadent.org.uk>
To: linux-riscv@lists.infradead.org
Cc: Guo Ren <guoren@kernel.org>
Subject: [PATCH] riscv: Fix vdso_install target with CONFIG_COMPAT=y
Message-ID: <Ys/8SFo/oC1TFZYk@decadent.org.uk>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 91.187.115.177
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_042148_148343_43AD13F6 
X-CRM114-Status: GOOD (  11.34  )
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
Content-Type: multipart/mixed; boundary="===============1287031369667609733=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1287031369667609733==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zSyKW5pUQfKFCzoD"
Content-Disposition: inline


--zSyKW5pUQfKFCzoD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The recipe for vdso_install in arch/riscv/Makefile invokes targets of
the same name in arch/riscv/kernel/vdso and .../compat_vdso, but the
target in the latter is called compat_vdso_install.  Change the
recipe to use the right target name.

Fixes: 0715372a06ce ("riscv: compat: vdso: Add COMPAT_VDSO base code ...")
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 arch/riscv/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 34cf8a598617..ee763562895c 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -110,7 +110,7 @@ PHONY +=3D vdso_install
 vdso_install:
 	$(Q)$(MAKE) $(build)=3Darch/riscv/kernel/vdso $@
 	$(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
-		$(build)=3Darch/riscv/kernel/compat_vdso $@)
+		$(build)=3Darch/riscv/kernel/compat_vdso compat_vdso_install)
=20
 ifeq ($(KBUILD_EXTMOD),)
 ifeq ($(CONFIG_MMU),y)

--zSyKW5pUQfKFCzoD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmLP/EMACgkQ57/I7JWG
EQmSGg/9Gqn86/Zj8LD3pFijFH4zJRiJZLp5KZIk9acadPU8cktZ5uY2BoQ6FKyJ
HJ4sLcXjiNtvi+Q0bOW2ASDrF1k80SNGCsuTd+r0PTG1pc6wecUdtps53fWhRx3k
IYs/jksn5sjDtD9r8jGdsN5i5V3GQ5wjVTGvjR+afejq9rA8xXkzH57WDWsHCtbU
6zLXtbL5uEV9cKcom5bepxagAynUY4HFAJHEpiiSEggHWJjOaXd3xUtXkE1H11s8
nhwNSaXViP5BzcAMkhYaVMn+vCZRfwr894eQ0N8Lp5FymamK0IJEiPWH3NP9JWAm
BKtnn417DGPt74VpRTjlr5aEO76QLg8W2cPXfzGIqX9Tni2Otf3Nf80kG4DOGnL/
ruA+xIniNQX6nuiQBEe7muhPjozxlUDdTVCrHF3IJk+8ybEjU7Q9Hg6MtO7ImYU1
R1GNUCOL6RPQrYXSrU7+DKWFm12as8CIvt54HcC1rSa5NAAHMgXEf/CWm6IB0+xE
AuJM2o1wANNo9mAHYGXNE/ZnE7HFQuxsqk3fb531O1l/PHuMMwVQpp4dUclINai/
NGdmDJjWJ1fYyroDE5dhHJ/AA18IXxdlAlWnRtSbDzPGNcFfLfIR9nh2m4kkODZ+
9ZM096U+BQE6bsqSV5IQ4dUEtTf3vTp/rlzV8YLfUq1JWneDs40=
=STCW
-----END PGP SIGNATURE-----

--zSyKW5pUQfKFCzoD--


--===============1287031369667609733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1287031369667609733==--

