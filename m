Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F156CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 11:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KmOCmSeBBzikgXaizT5ZoEj+DDGvCZPdGhqVLSUYZ8=; b=KXXSFF6UKC9tGiRTNZUXZWO7zN
	O5EQZev7szmhHnPWwSWy4CoOt8yzZ52Rda2Lormxz3X5y9HktDQ/2YEHY2aom2FbXrmGEn4SN/C7Y
	UP6JUrfACSUMshVA94/LRwK3w5ETyTnsWaxIZJdyqmFDVu2h5bHRgNVkQT39wVoPCt6jcqqCNul2J
	4csm38NUhfT2A0VAkCDN2yc/GokDQ+o3KNqBW/i69PAhMVZezZ6CnMNNOJu5GyNM4djiINtpEoJse
	CmBNbuWFMO6ZI9H1DepwVJo/E088Aync8/QkAH28jcs55mOC8GULNywIQUePWxlSF1N5ExcRgjYFG
	lo3jSl/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4qJ-00EZmv-34;
	Wed, 18 Oct 2023 11:36:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4qG-00EZmX-31
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 11:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E90906172D;
	Wed, 18 Oct 2023 11:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5E6C433C7;
	Wed, 18 Oct 2023 11:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697628959;
	bh=auqTNLipd3mDc/YcCEnSBeelbAAfYDDTuTo0Vv6a5uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M+Wdr4Euwkm2PmwDzKVGLB7zKPMBqG+ksDsnufCKVlZ6EonsZSvD3BSiU/bWdstEp
	 UzDZ+9jBq9b8KdvbrVRIdd2UlsEA9S9jsX+okvK9KCpojusNi9AvAALCxzD3bOTI3W
	 C6VhTmhaQveG2DE4rqAKHUqsK4ms5HfOS9TSuBzlxn4nkdw1RjQYK08mDSYq0+IXBB
	 10JMFkBbldHjhABg4q0HmkYzc6oTVrcrbPFWuPHdKGubY+JB1N7k/5Ac7G/na/GxZT
	 l75r0CBVjOfG0mE503xqPVEDRvcBPVxyuwGbPWFOePw60azeQM+RwbytU7L98eOILR
	 m3m7YrOi2I3wQ==
Date: Wed, 18 Oct 2023 12:35:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v4 0/2] riscv: Add remaining module relocations and tests
Message-ID: <20231018-smite-bungee-f46b15b4ce6f@spud>
References: <20231017-module_relocations-v4-0-937f5ef316f0@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231017-module_relocations-v4-0-937f5ef316f0@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_043601_059458_DB2EDCA7 
X-CRM114-Status: GOOD (  18.66  )
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
Content-Type: multipart/mixed; boundary="===============0283058882290793242=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0283058882290793242==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1okcQQvN+RgqgcjX"
Content-Disposition: inline


--1okcQQvN+RgqgcjX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Charlie,

On Tue, Oct 17, 2023 at 10:34:15PM -0700, Charlie Jenkins wrote:
> A handful of module relocations were missing, this patch includes the
> remaining ones. I also wrote some test cases to ensure that module
> loading works properly. Some relocations cannot be supported in the
> kernel, these include the ones that rely on thread local storage and
> dynamic linking.
>=20
> ULEB128 handling is a bit special because SET and SUB relocations must
> happen together, and SET must happen before SUB. A psABI proposal [1]
> mandates that the first SET_ULEB128 that appears before a SUB_ULEB128
> is the associated SET_ULEB128.
>=20
> This can be tested by enabling KUNIT, RUNTIME_KERNEL_TESTING_MENU, and
> RISCV_MODULE_LINKING_KUNIT.
>=20
> [1] https://github.com/riscv-non-isa/riscv-elf-psabi-doc/pull/403
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
> Changes in v4:
> - Complete removal of R_RISCV_RVC_LUI
> - Fix bug in R_RISCV_SUB6 linking
> - Only build ULEB128 tests if supported by toolchain
> - Link to v3: https://lore.kernel.org/r/20231016-module_relocations-v3-0-=
a667fd6071e9@rivosinc.com

On patch 2/2:

=2E./arch/riscv/kernel/tests/module_test/test_uleb128.S:18:17: error: unkno=
wn relocation name
=2E./arch/riscv/kernel/tests/module_test/test_uleb128.S:19:17: error: unkno=
wn relocation name

Same toolchain configuration in the patchwork automation as before.

Cheers,
Conor.

>=20
> Changes in v3:
> - Add prototypes to test_module_linking_main as recommended by intel
>   zero day bot
> - Improve efficiency of ULEB128 pair matching
> - Link to v2: https://lore.kernel.org/r/20231006-module_relocations-v2-0-=
47566453fedc@rivosinc.com
>=20
> Changes in v2:
> - Added ULEB128 relocations
> - Link to v1: https://lore.kernel.org/r/20230913-module_relocations-v1-0-=
bb3d8467e793@rivosinc.com
>=20
> ---
> Charlie Jenkins (2):
>       riscv: Add remaining module relocations
>       riscv: Add tests for riscv module loading
>=20
>  arch/riscv/Kconfig.debug                           |   1 +
>  arch/riscv/include/uapi/asm/elf.h                  |   5 +-
>  arch/riscv/kernel/Makefile                         |   1 +
>  arch/riscv/kernel/module.c                         | 207 +++++++++++++++=
+++---
>  arch/riscv/kernel/tests/Kconfig.debug              |  35 ++++
>  arch/riscv/kernel/tests/Makefile                   |   1 +
>  arch/riscv/kernel/tests/module_test/Makefile       |  15 ++
>  .../tests/module_test/test_module_linking_main.c   |  85 +++++++++
>  arch/riscv/kernel/tests/module_test/test_set16.S   |  23 +++
>  arch/riscv/kernel/tests/module_test/test_set32.S   |  20 ++
>  arch/riscv/kernel/tests/module_test/test_set6.S    |  23 +++
>  arch/riscv/kernel/tests/module_test/test_set8.S    |  23 +++
>  arch/riscv/kernel/tests/module_test/test_sub16.S   |  22 +++
>  arch/riscv/kernel/tests/module_test/test_sub32.S   |  22 +++
>  arch/riscv/kernel/tests/module_test/test_sub6.S    |  22 +++
>  arch/riscv/kernel/tests/module_test/test_sub64.S   |  27 +++
>  arch/riscv/kernel/tests/module_test/test_sub8.S    |  22 +++
>  arch/riscv/kernel/tests/module_test/test_uleb128.S |  20 ++
>  18 files changed, 548 insertions(+), 26 deletions(-)
> ---
> base-commit: 4d320c2d9a2b22f53523a1b012cda17a50220965
> change-id: 20230908-module_relocations-f63ced651bd7
> --=20
> - Charlie
>=20

--1okcQQvN+RgqgcjX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS/DGwAKCRB4tDGHoIJi
0gMDAP0WbgwU87WIuhP0GqZRc4filSavgJ3pf5gzvnAAYbBAPAEAuuKUU48p/pb4
cjTzJOq1xJ30NhLxK8Npc0BLQvqxpwU=
=tuJ6
-----END PGP SIGNATURE-----

--1okcQQvN+RgqgcjX--


--===============0283058882290793242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0283058882290793242==--

