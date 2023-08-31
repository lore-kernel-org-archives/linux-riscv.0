Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5BBC83F2E
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 16:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30mgGgo9v4aH3cAhu6BvLF4lbasLnNNxe0qjfOk+aK4=; b=RtJavashynA+9ZG7MNFfvoZidu
	V0qpchmPiO+RxIS7ZoaWCllGNJ6T6GFPTesWTJZqRaDlM9uTH1MHPe/23gVis/ZEsNMJAUZHclgwT
	9jHc4C89XPddwYHAOhJvbmHOFjwUBy6XiLtshQa4ayYxrnA/ECfHOXUdLusPJZDJ6lgy5Fk5M7elO
	i3B45XJZaEf7kmgNZpv2v4+BRJ5k4sxpzMYG3Qd90QdvSv++QVqkSJRYjEfektNb7m6Ed2TXr+0Gs
	4lAyZU5xzDTzPHWr7FsQGautRWjwvMGcRgULlUBl5Ch5ufaeA2L1AeAqohTCoDkHCPQEhcgzu05+D
	eGHcDDhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbkaO-00FZxc-1Z;
	Thu, 31 Aug 2023 16:32:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbkaL-00FZx9-32
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 16:31:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7484BB8229D;
	Thu, 31 Aug 2023 16:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243E1C433C8;
	Thu, 31 Aug 2023 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693499515;
	bh=c6bwVq38tu4XGHk2+06VjMxyjgqk3TQHdfoTO2nlQ0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NaPmYtvsph+EQDXRzQTzsUdBCQOjDKv1a2oU4c75PepO/mTrTQpwQWMvwaiA93Dp4
	 W+WnoDbQLZCF+x9xLbSrkMAShfHQy4VxhaYdXmYliFYl140XFjAsamPDYwIV0m9VaB
	 kxWiO3EARLg0eBTEQiItSLubgjJZ2BABG99HFckB05u3RM6ZJApi56vtA3+CHuFP4N
	 dNlQtk9hzfAtCfPStDypyRnhxaM+z3/hmhvPxEBsMh9wZT1ZQDz0ozio6JO5V07xZT
	 y8gjiQjE5nCwpNRadPHo5/LcjnWWBwGK6Ad9Y77Dh6ZDMa7KQiT5UgSL14vn4TGOM3
	 LdSYqh3N1QAxQ==
Date: Thu, 31 Aug 2023 17:31:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: andy.chiu@sifive.com, linux-riscv@lists.infradead.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] RISC-V: Remove unused "size" in ptrace
Message-ID: <20230831-pushup-race-b5820aa4bb7a@spud>
References: <20230830203754.24940-1-palmer@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230830203754.24940-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_093158_130993_3974A946 
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
Content-Type: multipart/mixed; boundary="===============6742642449698959835=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6742642449698959835==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GfD0i/UrwE4gRiHo"
Content-Disposition: inline


--GfD0i/UrwE4gRiHo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 01:37:54PM -0700, Palmer Dabbelt wrote:
> Looks like this just got lost somewhere in the respins.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308310306.tOrkoBmI-lkp@i=
ntel.com/
> Fixes: dbe46b094026 ("RISC-V: Add ptrace support for vectors")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Huh, wonder how the patchwork automation missed that. Probably as good a
reminder as any to update the toolchains in use there.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--GfD0i/UrwE4gRiHo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPDAdwAKCRB4tDGHoIJi
0p6EAP4uVwzwVfBFE+Jf27WVMdDmB7nXIjyE/eXPuXWz1mvLcQD/UNl/24WwpR1R
0n8Z611KYCs6KXrzXKxIJ5mMm0jwHA8=
=dy+e
-----END PGP SIGNATURE-----

--GfD0i/UrwE4gRiHo--


--===============6742642449698959835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6742642449698959835==--

