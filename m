Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0B5C2BB85
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 18:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kafGAnkLl1EmacbdZfIx6Of2A4ANJibCBtuPt9hMsA=; b=nWExGgntdTyWdTTNSn0AlnkOej
	ccmhgYiRE3WovGqpgED6Cj4pdU7009zyUJhyriPKTiCD5JSRjgqtPIjPCQS3JVAJb6M5WHl6Uop9v
	d9wJHXL3K4LFkHU1toJfzsxWOfzD5C3cUVSHuRnfbU0lqlcie447Pfsd2yxzj7Lo0396++WjdOZC5
	A7+syyQU/D36kMjgWoaNlE+zK8NgQ5k9KOS97a6Lit97IVosOmTqmHrx6qzLRbpdYWiPSk5c1Yfpl
	lZYkW+skL01jp/TNgwIodBG7IVLwlD3J/gUx8WOm8NsCWh4C+ocEEIcuB6vAvxsECAVlPhwnuQL7J
	mL1sn5FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKibJ-0000000AAhf-3UN2;
	Fri, 21 Jun 2024 18:03:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKibG-0000000AAew-0KzI
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 18:03:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C29E627A1;
	Fri, 21 Jun 2024 18:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2043EC2BBFC;
	Fri, 21 Jun 2024 18:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718992981;
	bh=lV5vpxY7i91ZTamCgJMl2uj4acUyubWy3CFf0VMVG58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jroCIC3Z2WvoRFEriUHXkuuZiOnhATzwUaeitybywKGEOtGWi3TrxPVYQashY+HpH
	 Psp8daSARTb24/5VrEeGgy4oZBfX2R6DkkPtHYdwTiAeyAry7N32fM0n7KcVKec5iy
	 HA6TRMTcZTm+bMIzraUk487nhSjm8BNKLv82o6jUTwevsba0HmmJB7QmCtAEvgvl53
	 nACu7FM6wA7p3GrLdRIJsCZgFAqtFF2qnpwq/XeIMbqPdP6+eh8tygzU5iKaLRuvr0
	 /ol1aIMpCwX1Z7ogxg2kCs/IPxY7YPy2FXCUtVSCrnBsiLTbjgC+9940AwW+kpyfpd
	 VoHJoGJvhMOyw==
Date: Fri, 21 Jun 2024 19:02:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Charlie Jenkins <charlie@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/6] RISC-V: Detect unaligned vector accesses
 supported.
Message-ID: <20240621-cone-departed-c445e3bcee90@spud>
References: <20240613191616.2101821-1-jesse@rivosinc.com>
 <20240613191616.2101821-5-jesse@rivosinc.com>
 <ZnDmRK0ZtKzmWN5S@ghost>
 <ZnDsdzv4o/Xz9kWm@ghost>
 <e6f7a061-50f0-4a6a-a09b-468502703c20@rivosinc.com>
 <ZnSptpobfqjik3RM@ghost>
 <20240621-reveler-underfed-37600a9f16d5@wendy>
 <ZnW130PqW56CnZT8@ghost>
 <20240621175816.GD2081@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20240621175816.GD2081@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_110302_237171_E0002C16 
X-CRM114-Status: GOOD (  29.03  )
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
Content-Type: multipart/mixed; boundary="===============3013733345664886932=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3013733345664886932==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LTVlyJ3znXw1uEhF"
Content-Disposition: inline


--LTVlyJ3znXw1uEhF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 10:58:16AM -0700, Eric Biggers wrote:
> On Fri, Jun 21, 2024 at 10:18:23AM -0700, Charlie Jenkins wrote:
> > > Additionally, what are we doing in the kernel if we detect that
> > > misaligned stuff isn't supported? Are we going to mandate that kernel
> > > code is aligned only, disable in-kernel vector or some other mechanism
> > > to make sure that things like crypto code don't have/introduce code
> > > that'll not run on these systems?
> >=20
> > UNSUPPORTED will still be set by the quick probe so it would be possible
> > for the kernel/userspace to avoid running misaligned vector when it's
> > unsupported. Any kernel methods would probably want to always run
> > aligned vector unless misaligned support was determined to be FAST
> > anyway, I am doubtful that code will have different optimizations for
> > FAST, SLOW, and UNSUPPORTED but it is possible.=20
> >=20
> > I would prefer consistency between scalar and vector misaligned support,
> > but this is not a deal breaker for this patch. I am not convinced it is
> > the best choice, but I am okay with leaving this option in the kernel.
> >=20
>=20
> Note that most of the vector crypto code (in arch/riscv/crypto/) assumes =
that
> vector misaligned accesses are supported.  Many of the RISC-V vector cryp=
to
> instructions require using SEW=3D32 or SEW=3D64, and as a result, loads a=
nd stores
> of data can be misaligned unless the code changes the SEW to 8 and back a=
gain,
> which would be inefficient and add extra complexity.  I don't anticipate
> workarounds for CPUs that couldn't be bothered to support misaligned acce=
sses
> being added.

> So what we'll probably have to do is just disable the vector
> crypto algorithms if the CPU doesn't support misaligned accesses...

Right. I was thinking similarly, and that we should just disable all
in-kernel vector code if the platform doesn't support misaligned vector.

--LTVlyJ3znXw1uEhF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnXATAAKCRB4tDGHoIJi
0p46AP9QHMf429CTroVDTIUETnYFoY4fH5v/C7x5Ac7RQKwtPwD/fY56J3WkdGCV
3biOKsj+RG9Hj6D8f8JtBbIs2/g33w0=
=59Qv
-----END PGP SIGNATURE-----

--LTVlyJ3znXw1uEhF--


--===============3013733345664886932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3013733345664886932==--

