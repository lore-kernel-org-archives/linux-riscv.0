Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C438C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 18:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=XZ96Kp7adNA9DF0gBSfyj+Az+38z17rveuVxm+To/VQ=; b=dEG
	2ptYr9ULT2vYJG32cMr02nFj0aKh2GCxzlXzxyMgKa217hEmeNSaFqzJGGlZgCOf6H2V/dOLXaPk4
	hHiD/irnxM3/SRCOo6rQOM9BfcCzfQoEmiRvROrs5uyQIWkhVUPGPezJS9vw2eZITYhNJsbCWriDg
	3WR6ynuSdv0/KGaStoL2iqE1C/nO6qJFGXBhceJYX/AWSzCvnY3pWi4XzpMzZ2qc7ymJnSj/eUw3t
	cYiBrEsCd0qZNQPtbk54Tq/SJz3nE8ftsBVmMloxCkxHawuxG5r9fcB4YX7SJhdemoX97ysTVtD4f
	o6823S15uulvJ4YWG7rf58uONI6GF+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAbbF-007NP8-RX; Wed, 28 Dec 2022 18:56:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAbbC-007NLo-Ex
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 18:56:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A862CB8162F;
	Wed, 28 Dec 2022 18:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8AEC433D2;
	Wed, 28 Dec 2022 18:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672253779;
	bh=VC1vP1EXnqaFD9hXB9IG9HaW3s2Kl92Jnopz0Y9C2HY=;
	h=Date:From:To:Subject:From;
	b=Qj2wLMC8YcSy9yXHGcR6tHhxZgXcb3nPvz0O4elTIFRiz8BzNwPv/3X0cjQn6jIQF
	 9kyeTj5pCEovK7o5uy+FJ77TiwRyZfzT4I2Mnk7Q7Ys0TtMhKzrScNYAsyu0R8ouRM
	 Kb5SECI97UNlZtGAzJ50pZJbMJzUfL3e1Fcxyv1TehbnCJqF/It6Z+U8UYA6ghYmuu
	 A+xp5G4Fpy+fb96qdMfzwZGE/onH4bsjF2JeVS868WxQtuhAPkpbbcc27TZ9KJ2t9E
	 83WzN944v0Va4o/J/H4sH9si1uIdcMoEgY3dQ3uW1jyIa+LSmYvCBqu7Er8X95iaqd
	 rK/jh5QDW8uHQ==
Date: Wed, 28 Dec 2022 18:56:16 +0000
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com, linux-riscv@lists.infradead.org
Subject: [GIT PULL] kconfig.socs symbol conversion
Message-ID: <Y6yRULqZa+NtkcjP@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_105622_864500_BA04DE52 
X-CRM114-Status: GOOD (  15.09  )
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
Content-Type: multipart/mixed; boundary="===============7728534401801400295=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7728534401801400295==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3x3z+Q1wAsImrJnV"
Content-Disposition: inline


--3x3z+Q1wAsImrJnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Palmer,

Please pull part 1 of the Kconfig.socs cleanup work.

This PR adds ARCH_FOO copies of SOC_FOO symbols, so that from v6.3
onwards I can convert the users of the old symbols to the new ones.
I've also gone and converted the various bits of Kbuild infra over to
the new symbols which I will merge into my dt-for-next branch, hence the
PR.

Part N will probably arrive this time next year, once an LTS has been
released with the ARCH_FOO symbols in it. That seems like a fair way to
make sure the ARCH_FOO symbols propagate to whatever out of tree
defconfigs that exist.

I've included the rest of my "RISC-V: kconfig.socs cleanup, part 1",
series in this tag/PR as it depends on the earlier patches. I won't be
merging those bits into my dt tree though as they're not needed there.

Thanks,
Conor.

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/soc2arch-immutable

for you to fetch changes up to 3af577f9826fdddefac42b35fc5eb3912c5b7d85:

  RISC-V: stop directly selecting drivers for SOC_CANAAN (2022-12-27 18:01:40 +0000)

----------------------------------------------------------------
SOC_FOO to ARCH_FOO conversion for RISC-V

RISC-V is an outlier in using SOC_FOO rather than ARCH_FOO for
vendors/micro-archs. SOC_FOO may make more sense (I personally prefer
it), but the rest of the "world" uses ARCH_FOO. That'd be fine, with
with an increasing number of existing SoC vendors moving to RISC-V,
unifying our symbol names with the expectations of the rest of the world
makes sense.
Folks did not seem keen on changing the world (and they can't really be
blamed for that) so convert RISC-V over to match.

Add some ARCH_FOO stubs alongside the existing SOC_FOO ones, which will
be removed once all users of SOC_FOO have been converted*, and convert
the DT bits of RISC-V kbuild over to the new symbols.

* It may be best to wait until after the next LTS to remove the SOC_FOO
  ones, for the sake of external users.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (6):
      RISC-V: introduce ARCH_FOO kconfig aliases for SOC_FOO symbols
      RISC-V: kconfig.socs: convert usage of SOC_CANAAN to ARCH_CANAAN
      RISC-V: kbuild: convert all use of SOC_FOO to ARCH_FOO
      RISC-V: stop selecting the PolarFire SoC clock driver
      RISC-V: stop selecting SiFive clock and serial drivers directly
      RISC-V: stop directly selecting drivers for SOC_CANAAN

 arch/riscv/Kconfig.socs                | 39 ++++++++++++++++++++++++++-------------
 arch/riscv/Makefile                    |  2 +-
 arch/riscv/boot/dts/Makefile           |  2 +-
 arch/riscv/boot/dts/canaan/Makefile    | 14 +++++++-------
 arch/riscv/boot/dts/microchip/Makefile |  8 ++++----
 arch/riscv/boot/dts/sifive/Makefile    |  4 ++--
 arch/riscv/boot/dts/starfive/Makefile  |  2 +-
 7 files changed, 42 insertions(+), 29 deletions(-)

--3x3z+Q1wAsImrJnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6yRUAAKCRB4tDGHoIJi
0vFHAQC4NsE3f34JArygPgMGGaoh/+IqTnrMrCsvwZkMXDZdTQEA0x+Ys9WWy7rM
DfJ+EusKadtcZ00d82Ka7xKjUQCVkwY=
=Cw9W
-----END PGP SIGNATURE-----

--3x3z+Q1wAsImrJnV--


--===============7728534401801400295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7728534401801400295==--

