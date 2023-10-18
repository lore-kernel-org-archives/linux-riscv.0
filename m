Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82492CDB485
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAXi0dEPtbrmh/83BcbloQGy0xQQTXFnvh47zvpbmoQ=; b=1nBs4hLVfEBNK74nNLTO4h4GJM
	lWQCanCe41BQF7Vc3Dx0nQtIulKhNsPevWbrp3uU0JYyYS/I0tAHry0f32VKUvoeewa41sOiI73pr
	7S0MU0RBIrqkzBOyc9EbCFLKjDbb7R2IqxJ3t/xgxozRaKIboKYzogpL/ZOKrTzijdXs3xlJNmBuI
	HtxKhIkaUmv4fqh+mzNZSEMMfDDZ3dPxi43Km+LYiI1KA6AiaKJypyW/JZWzOKljghsctkBWFQP/Y
	+IbUjx0HCF/IyGlXNgjGceafmqjE1WFC+W55ibVboV95cuGb7FFXfZEG3fsEl54h+gtcgC/kFFd0u
	lbKr3erg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAYL-00FM9z-2w;
	Wed, 18 Oct 2023 17:41:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAYG-00FM3d-1j
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 17:41:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E62D4B82437;
	Wed, 18 Oct 2023 17:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C39DC433C7;
	Wed, 18 Oct 2023 17:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697650906;
	bh=aj+p4AGcRGnsdjRD0n/a3mq6+ABBqlyLJtvKg+WBq9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gu69o4ZC/L70fyBCHx8E9zpnBf4EUeY6LgV7eJALpSrQ2oQFNAckllrykdGJj4N9C
	 HcyTS/T2PjJzQcv/tBBqAa7sGA5dDWU95AIrHslSAUNkNFZggIL2yoMA6AbB+DHMUd
	 aLdhh6N6li4HM0VCC07U1fv4VlkAl0LsXyug5qe4kFF2Aa2g5u+FZVF6xJBVJ3/MLn
	 x5rMBYHGgKpZPM2e1gyFuZvZphT3ZXDSIJ753Vk3G3SDrxOoLGdAJODU3i2sSkZgYa
	 UoMTou1ROspEvhyyEI9pMXgfsSg3aF1EVqirvWUL8TyNxX5xQBb6EaTqoutVO9qcL/
	 umzdnfxhBTA4A==
Date: Wed, 18 Oct 2023 18:41:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, bjorn@kernel.org
Subject: Re: [PATCH v4 0/2] riscv: Add remaining module relocations and tests
Message-ID: <20231018-confidant-frostily-e8f4dbdcd478@spud>
References: <20231017-module_relocations-v4-0-937f5ef316f0@rivosinc.com>
 <20231018-smite-bungee-f46b15b4ce6f@spud>
 <ZTAWcX1qVhkC71BJ@ghost>
MIME-Version: 1.0
In-Reply-To: <ZTAWcX1qVhkC71BJ@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_104148_892619_E2BD8876 
X-CRM114-Status: GOOD (  25.74  )
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
Content-Type: multipart/mixed; boundary="===============8004390237492209031=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8004390237492209031==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5mLW7xijzAMttePh"
Content-Disposition: inline


--5mLW7xijzAMttePh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 10:31:29AM -0700, Charlie Jenkins wrote:
> On Wed, Oct 18, 2023 at 12:35:55PM +0100, Conor Dooley wrote:
> > Hey Charlie,
> >=20
> > On Tue, Oct 17, 2023 at 10:34:15PM -0700, Charlie Jenkins wrote:
> > > A handful of module relocations were missing, this patch includes the
> > > remaining ones. I also wrote some test cases to ensure that module
> > > loading works properly. Some relocations cannot be supported in the
> > > kernel, these include the ones that rely on thread local storage and
> > > dynamic linking.
> > >=20
> > > ULEB128 handling is a bit special because SET and SUB relocations must
> > > happen together, and SET must happen before SUB. A psABI proposal [1]
> > > mandates that the first SET_ULEB128 that appears before a SUB_ULEB128
> > > is the associated SET_ULEB128.
> > >=20
> > > This can be tested by enabling KUNIT, RUNTIME_KERNEL_TESTING_MENU, and
> > > RISCV_MODULE_LINKING_KUNIT.
> > >=20
> > > [1] https://github.com/riscv-non-isa/riscv-elf-psabi-doc/pull/403
> > >=20
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > > Changes in v4:
> > > - Complete removal of R_RISCV_RVC_LUI
> > > - Fix bug in R_RISCV_SUB6 linking
> > > - Only build ULEB128 tests if supported by toolchain
> > > - Link to v3: https://lore.kernel.org/r/20231016-module_relocations-v=
3-0-a667fd6071e9@rivosinc.com
> >=20
> > On patch 2/2:
> >=20
> > ../arch/riscv/kernel/tests/module_test/test_uleb128.S:18:17: error: unk=
nown relocation name
> > ../arch/riscv/kernel/tests/module_test/test_uleb128.S:19:17: error: unk=
nown relocation name
> >=20
> > Same toolchain configuration in the patchwork automation as before.
> >=20
> > Cheers,
> > Conor.
>=20
> Where do you see this error? On Patchwork I see a success [1].
>=20
> [1] https://patchwork.kernel.org/project/linux-riscv/patch/20231017-modul=
e_relocations-v4-2-937f5ef316f0@rivosinc.com/

It was a failure this morning!
See
<https://github.com/linux-riscv/linux-riscv/actions/runs/6549280771/job/177=
85844013>

I wonder if there is something wrong with the CI code, where it
erroneously reports the state from previous patches and then runs the
tests again with the new patches and re-pushes the results.

Bjorn, any idea?


--5mLW7xijzAMttePh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTAY1QAKCRB4tDGHoIJi
0pOTAQDCCiKYNA+6gFVQD5Eo6wg279/gtXLnlGuiK55RNr9/egD9GNwwnGI1yzfP
25wEREfFQDaiH0oG02EbQpF+P8UDpgU=
=3a8X
-----END PGP SIGNATURE-----

--5mLW7xijzAMttePh--


--===============8004390237492209031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8004390237492209031==--

