Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90283EE4993
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 13:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Crk7m+4PVu4lOcJ91XSWTyEywLhAc6h3UnkkLf47FEI=; b=ZPgwaIJz8minbusk4by2lf8Ahh
	dNpFzP2WKHMAq2lSXqero6TWu3AJQf8ffBqd+/fl3Qp7E018fUugMmGk0rjtFdgyAndM6uXmg0yaC
	6s0t0SjEHQgIsrUf0YEcdV8RCp6Wnojg9P9Xet3tPY8c/cAOJj7wdtmezKcvf7tM0/OxFQ/j8/kSO
	uCC5pOLb8+o+MRoJ97NRUl8DuPKHu93O+8eQG6xmBzc4r/BEBIwOOGrwOG240mDkt6/p9SYneRe7p
	cG6zhqWsIKxMpvnTGQp6z37T445jzfFIUM08PweYnXKWn3qzM0J/NBq4031PRKe8bvnO8cENCmI5g
	VwSYAAbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYnxw-000gkT-39;
	Wed, 23 Aug 2023 13:32:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYnxu-000gjG-0q
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 13:32:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8CB3F61F76;
	Wed, 23 Aug 2023 13:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5126C433C7;
	Wed, 23 Aug 2023 13:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692797522;
	bh=wTn3isAqqk+t81XyNdYbxia/Ad1Si3J428HEivbrf2I=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=IR6qlqzQg6igQ/9syCO/6OvdectOVNbsoNpiIiR/cEMXUlhS69uiwCYR3aXvyK/qn
	 pr9r7l7d0Hidy1PcOjwUqgOwpLdISqwCYDLhfQEfY1AIMn5i9CtqwX+1/PJyvs4YBg
	 21dZXBv4IokYl0gQYiHsCgxM9/DactqacHmjnLcIyBPMkiDpcMEy26uTlJVyc5cmNO
	 hAGdvPR7qPXr88aRuaNVHZHVhgh1S2hHMZBU/fWcg34gy0um1j4APcDgVTC73mI4XA
	 p/bO4oCwS8Rljjr0cmC68xe7S3kNsYigL4RthcphADyP+qI0D8D0cRpCsJf/93WgcW
	 kh4jV74KUmkow==
Date: Wed, 23 Aug 2023 14:31:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: patchwork-bot+linux-riscv@kernel.org,
	Mingzheng Xing <xingmingzheng@iscas.ac.cn>,
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com, bmeng@tinylab.org,
	guoren@kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v5] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
Message-ID: <20230823-facelift-ovary-41f2eb4d9eac@spud>
References: <20230809165648.21071-1-xingmingzheng@iscas.ac.cn>
 <169228562484.20811.14246462375671910714.git-patchwork-notify@kernel.org>
 <20230823-captive-abdomen-befd942a4a73@wendy>
MIME-Version: 1.0
In-Reply-To: <20230823-captive-abdomen-befd942a4a73@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_063206_393096_0B107AD3 
X-CRM114-Status: GOOD (  22.06  )
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
Content-Type: multipart/mixed; boundary="===============6526783906481350094=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6526783906481350094==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t4zP4cEKxycq2r5X"
Content-Disposition: inline


--t4zP4cEKxycq2r5X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 12:51:13PM +0100, Conor Dooley wrote:
> On Thu, Aug 17, 2023 at 03:20:24PM +0000, patchwork-bot+linux-riscv@kerne=
l.org wrote:
> > Hello:
> >=20
> > This patch was applied to riscv/linux.git (fixes)
> > by Palmer Dabbelt <palmer@rivosinc.com>:
> >=20
> > On Thu, 10 Aug 2023 00:56:48 +0800 you wrote:
> > > Binutils-2.38 and GCC-12.1.0 bumped[0][1] the default ISA spec to the=
 newer
> > > 20191213 version which moves some instructions from the I extension t=
o the
> > > Zicsr and Zifencei extensions. So if one of the binutils and GCC exce=
eds
> > > that version, we should explicitly specifying Zicsr and Zifencei via =
-march
> > > to cope with the new changes. but this only occurs when binutils >=3D=
 2.36
> > > and GCC >=3D 11.1.0. It's a different story when binutils < 2.36.
> > >=20
> > > [...]
> >=20
> > Here is the summary with links:
> >   - [v5] riscv: Handle zicsr/zifencei issue between gcc and binutils
> >     https://git.kernel.org/riscv/c/ca09f772ccca
>=20
> *sigh* so this breaks the build for gcc-11 & binutils 2.37 w/
> 	Assembler messages:
> 	Error: cannot find default versions of the ISA extension `zicsr'
> 	Error: cannot find default versions of the ISA extension `zifencei'
>=20
> I'll have a poke later.

So uh, are we sure that this should not be:
-       depends on (CC_IS_CLANG && CLANG_VERSION < 170000) || (CC_IS_GCC &&=
 GCC_VERSION < 110100)
+       depends on (CC_IS_CLANG && CLANG_VERSION < 170000) || (CC_IS_GCC &&=
 GCC_VERSION <=3D 110100)

My gcc-11.1 + binutils 2.37 toolchain built from riscv-gnu-toolchain
doesn't have the default versions & the above diff fixes the build.

Thanks,
Conor.

--t4zP4cEKxycq2r5X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOYKTQAKCRB4tDGHoIJi
0j0mAQC/dAakOtKVIdAXlSLgJ4/8vCec4WO3cCO3pmTQ3qMdrAD7BY2ORdI1A3Sm
bhyeikCboYot3QNuYvvFBtqt30XnCQg=
=Ia53
-----END PGP SIGNATURE-----

--t4zP4cEKxycq2r5X--


--===============6526783906481350094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6526783906481350094==--

