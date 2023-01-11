Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4DDC46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 21:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=rWODiiRqHjsfcbI8PJO9h7nsfse3Um9BWTvp67IMiO4=; b=SwK
	njxFLtXv8zk4sj96qeJUAobiV7F96yZues67DfdeuUrAqpRsH1sR3UVMiwb48pe4Bit3ynJWmb1zE
	LMro+FbvFa6Nl1FA+k530YgTorm3A2cIoX69JFPVfsVqOawGd8Tin2h0D0O2cCIf2Ijjl6ZWX5M2E
	gX417Ix9UthC+DItDpWP1Hfy/yapb2HGeVKaW/63HvjzTT8sOoPYwrrN2kSkn9cyGynVcPYWZUoe2
	tiZ7SBfHbKNVQaEgBLctAvIr+frB0Ed76qH9ucCtT/8vphobmmRHE1TvgGxgdQ9MePlKBIsgsOSzA
	MYILkkvsMWJ2DZ3Cr9ZrlavSB1A3xTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFikz-00D0bA-G9; Wed, 11 Jan 2023 21:35:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFikw-00D0aM-8E
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 21:35:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AE59AB81D5C;
	Wed, 11 Jan 2023 21:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3114FC43392;
	Wed, 11 Jan 2023 21:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673472931;
	bh=eAfS9mB0oY9iJUqJF2QEBHXjX+n6NL9k9lwhYQQe5as=;
	h=Date:From:To:List-Id:Cc:Subject:From;
	b=ahMuds4IFDRKTq8ay1D2l6pE7Y/jdKPBtQE6bnK2WyYxIJt0wajRFZoliM9qcF24i
	 RaBXJ/iRk1BwE4qAyrnHWP5eSgVs5PjhwAvHQkjoasXGs4iGxHSBnEZro9CKWLTgpq
	 wmLNUnaTxfGTCdtLlPJ/2csbQxEqPnhoMsWsEgpHx+wGdwqn2lOt1kjq3cCYEmKa6E
	 8xNK0pAQGYCl6a9tyTqWf56JWJZ+ygPZRre9jVJBqW+2dbtnzdB5nVt1u1BZkryNCF
	 ebt68iI/WxpsHtfb0cdeECyOOWiOd1XuRh1I4lNUZnTgfw4gU/TWaphGoBLBMQU4Ng
	 rEHy5NhOmc6Cw==
Date: Wed, 11 Jan 2023 21:35:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, conor@kernel.org,
	soc@kernel.org
Subject: [GIT PULL] RISC-V DT for v6.2-rc4
Message-ID: <Y78rn+0fVNOxHLKt@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_133534_475884_E6D8C1BC 
X-CRM114-Status: GOOD (  13.62  )
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
Content-Type: multipart/mixed; boundary="===============4102564517064402940=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4102564517064402940==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WK4zaOLL3DUE7zmA"
Content-Disposition: inline


--WK4zaOLL3DUE7zmA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd!

Been a quiet period since -rc1, so I only have a single DT fix for you.
Figured I'd get it out of the way & write the script that I've been
meaning to write since I sent the first pair of PRs at the same time.
Hopefully I didn't break anything in the process!

Thanks,
Conor.

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-fixes-for-v6.2-rc4

for you to fetch changes up to 43d5f5d63699724d47f0d9e0eae516a260d232b4:

  riscv: dts: sifive: fu740: fix size of pcie 32bit memory (2023-01-07 19:31:37 +0000)

----------------------------------------------------------------
RISC-V DeviceTrees for v6.2

SiFive:
A solitary fix for the PCI memory regions on the unmatched, triggered by
an SM768. No-one must have tried one until just recently!

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Ben Dooks (1):
      riscv: dts: sifive: fu740: fix size of pcie 32bit memory

 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


--WK4zaOLL3DUE7zmA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY78rnwAKCRB4tDGHoIJi
0soeAQCLnAuzsdbNcFYcG40/VbWCdEVfeQY5EOJVHk73+ySWAQEAyUwtRDORVrxA
OT5XeeMb5RwflnVfiJ5OFbRto4z7oAw=
=KnuI
-----END PGP SIGNATURE-----

--WK4zaOLL3DUE7zmA--


--===============4102564517064402940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4102564517064402940==--

