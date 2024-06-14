Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16079C27C6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 14:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQ6BgUf5Q+xg8RCPYxmoGp0WIYsttZ6W+ZJ/aedSQuI=; b=YiHSIt34jUYMx/aZSOPsVbNCJq
	w5iCjaPmbbaGJXU/PGL0ccLWTF1tEC7z42ulviJAjQaNQsBaEoamebc101LL1AHcVIPqr/I5lTS0C
	MpOwv7KU4UR/HQefKKTTAaoYfohTAidpH8qZT4WBHbjGjNUR+roCrxwd67/Zhfd5pWN/lGkxH5Ujl
	63EU4Ne8VCUoD22gySf8v6BVwp7On5fXlotBZ0M56DKQwQsJAoVT1ddh6Y1ELvoOwO/srRBBtzk15
	heOuKu603kQMZoGKtrcj+ideM2L0RHLR9NiHW8IF9CEUOq6KXnDkb7zzWfAyk7GSVhEmeSRm9tEj8
	I6uWczlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7yb-000000032LP-1dCg;
	Fri, 14 Jun 2024 14:32:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7yY-000000032Jp-3EkG
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 14:32:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 77B12CE2B62;
	Fri, 14 Jun 2024 14:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DAFC4AF1A;
	Fri, 14 Jun 2024 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718375539;
	bh=iqgP90dDsEQCkjx7UcrzAwPtRtQlcKUNmNJS3dtkUmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gS6HM00wZQ4biXH608dOWYvzfZ3sWln2jUaXUAfkpi0zf29YW+rb9ky9d0u3dcQig
	 U9pYfH9wdgmCVEgmpKg7LLZ/oSYBNJrRpmBY8dNLhfLIp5YOgC/6zH/ciz/hlRJe3F
	 KRmKyWfP3Oihordds7tM59CB67SY3Xf/ArB+8kWx/KSjQJt7htjvIP5rKvjRWbqucJ
	 hk92NH35caak4pX1yEamaAEx0vstdnlCutBny4Le3u248lfzSNCIPkkcsBgmCfH8fG
	 tdRkv5yQlOVM5xVKZHgKIyMHOncB3aOxQltX4kdwFPy8yk9273nBiurZSXqTsb1vcs
	 4Hqd7kw7qTv9g==
Date: Fri, 14 Jun 2024 15:32:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <jesse@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
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
Message-ID: <20240614-broadly-lucrative-d2c1e746ee32@spud>
References: <20240613191616.2101821-1-jesse@rivosinc.com>
 <20240613191616.2101821-5-jesse@rivosinc.com>
 <20240614-viral-dinghy-71d5f6585a55@wendy>
 <20240614-distaste-negligee-ba9216a8684e@wendy>
 <acb7a467-fc0e-4f32-8410-cd7aafce8bae@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <acb7a467-fc0e-4f32-8410-cd7aafce8bae@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_073223_199256_FEC9008C 
X-CRM114-Status: GOOD (  19.63  )
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
Content-Type: multipart/mixed; boundary="===============0872564311553180467=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0872564311553180467==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bHd5NbqcRQWbEnk6"
Content-Disposition: inline


--bHd5NbqcRQWbEnk6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 10:28:17AM -0400, Jesse Taube wrote:
>=20
>=20
> On 6/14/24 04:40, Conor Dooley wrote:
> > On Fri, Jun 14, 2024 at 09:36:55AM +0100, Conor Dooley wrote:
> > > On Thu, Jun 13, 2024 at 03:16:13PM -0400, Jesse Taube wrote:
> > > > --- a/arch/riscv/kernel/unaligned_access_speed.c
> > > > +++ b/arch/riscv/kernel/unaligned_access_speed.c
> > > > @@ -19,7 +19,8 @@
> > > >   #define MISALIGNED_BUFFER_ORDER get_order(MISALIGNED_BUFFER_SIZE)
> > > >   #define MISALIGNED_COPY_SIZE ((MISALIGNED_BUFFER_SIZE / 2) - 0x80)
> > > > -DEFINE_PER_CPU(long, misaligned_access_speed);
> > > > +DEFINE_PER_CPU(long, misaligned_access_speed) =3D RISCV_HWPROBE_MI=
SALIGNED_UNKNOWN;
> > > > +DEFINE_PER_CPU(long, vector_misaligned_access) =3D RISCV_HWPROBE_V=
EC_MISALIGNED_UNSUPPORTED;
> > > >   #ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
> > > >   static cpumask_t fast_misaligned_access;
> > > > @@ -268,12 +269,18 @@ static int check_unaligned_access_all_cpus(vo=
id)
> > > >   	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICCLSM)) {
> > > >   		for_each_online_cpu(cpu) {
> > > > +#ifdef CONFIG_RISCV_VECTOR_MISALIGNED
> > > > +			per_cpu(vector_misaligned_access, cpu) =3D RISCV_HWPROBE_VEC_MI=
SALIGNED_FAST;
> > > > +#endif
> > > > +#ifdef CONFIG_RISCV_MISALIGNED
> > > >   			per_cpu(misaligned_access_speed, cpu) =3D RISCV_HWPROBE_MISALI=
GNED_FAST;
> > > > +#endif
> > >=20
> > > Can you IS_ENABLED()-ify these two as well please?
> >=20
> > Ah, you can't cos the variable doesn't exist in the other case.
>=20
> Yeah kinda just dealing with how it was originally written ideally we wou=
ld
> use IS_ENABLED. I don't really want to have a 500+ diff patch
> IS_ENABLED()-ifying the original code as well. I can do that if necessary
> though.

No, dw about it. I made a mistake.

--bHd5NbqcRQWbEnk6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmxUagAKCRB4tDGHoIJi
0o1sAP0TjaWh4s+Jwxjvs/uZ5QEX2QJNGQYVE//gvXVXIHZMNQEA3q14c179bYze
sMPmEmacDngXPwLaxzE2H5mG8E6jtwc=
=POGL
-----END PGP SIGNATURE-----

--bHd5NbqcRQWbEnk6--


--===============0872564311553180467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0872564311553180467==--

