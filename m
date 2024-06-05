Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BF0C25B76
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 15:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VkJpM5NYnPHkwljodpqBj/MaE+/xqDHpAoSB6JXaFA=; b=KFg/5sFzGgcF0uVCHieB/iLa6+
	UBWFopzNO18MbbdMQpVJoZdCkYyONk4jmkhTg3Qskpr8BM7KQ0cK3x5kJraFSe5Oa8PBR4c5teK8V
	zF6XRlZjiPnFtHJDQc/Uxx5e6vCyoVLyrU/d5paXusC4ad2iKLPbUEQwd0p2ztL4727IShJmjA1cc
	3l2/F3K5x+ZG4oLPSp3c/P3wBU6L6K390QEvT7yHjpMX1SowGTONbu6k5R6SvKCX2e6y0JNVhdX1G
	BO5SGa1nJHDtSq4IDrxZMMyjWXuKsiDJ9hzhtJ2f2e4Fsc6vYqDJ8dINotUlxqGXMuiIvy/XVzV6X
	1On8GQJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEsp7-00000006gr9-2ABM;
	Wed, 05 Jun 2024 15:45:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEsp5-00000006gpb-1qbP
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 15:45:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A2FFE617D0;
	Wed,  5 Jun 2024 15:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0941BC2BD11;
	Wed,  5 Jun 2024 15:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717602310;
	bh=j0rMndXLq1rio0UdMWk+Pzy9T/J6NqtZCqpB/roM3rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HkcFclWHz1QL9rIC3mApEB7RDOsAgvw3yccqB0UO8WGi56FP0DQKJi8c4RjOYbYuG
	 7XojgoBqScWJV3khwJMgmmZhFEZuadYXtWSlPh+u5qJM1sIvLEMLVgU2Kqz9ltvmmF
	 JTJ83iK0LnBmip8qHlgyB/z6kayd1JZmAKqKuaX+PYY0Sd1Lc19bzmNQNZFsuQU78p
	 8M5LvlPfFfkNtDar6BUQyfSFFmLXaNIIUBL4Uk4jbeeJXe5L1xxTY5DvOasGJtp4kR
	 6YFDotTR36BCFIh0dXnrZNJ3JgvzwKnHHr7lebNLGHwy+9KnWWnD2+NONqctCo+wqV
	 jcAlJN42BWO8Q==
Date: Wed, 5 Jun 2024 16:45:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Erick Archer <erick.archer@gmx.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v0] RISCV: Report vector unaligned accesses hwprobe
Message-ID: <20240605-chowtime-mannish-d0f428acd173@spud>
References: <20240604162457.3757417-1-jesse@rivosinc.com>
 <8e2556d2-8021-4e4c-9380-7568ff74a84f@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <8e2556d2-8021-4e4c-9380-7568ff74a84f@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_084511_628005_C57BC474 
X-CRM114-Status: GOOD (  14.97  )
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
Content-Type: multipart/mixed; boundary="===============2767627187420417044=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2767627187420417044==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="03IvgSR7vpRDfuV8"
Content-Disposition: inline


--03IvgSR7vpRDfuV8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2024 at 12:42:10PM -0400, Jesse Taube wrote:
> On 6/4/24 12:24, Jesse Taube wrote:
> > diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/ke=
rnel/unaligned_access_speed.c
> > index a9a6bcb02acf..92a84239beaa 100644
> > --- a/arch/riscv/kernel/unaligned_access_speed.c
> > +++ b/arch/riscv/kernel/unaligned_access_speed.c
> > @@ -20,6 +20,7 @@
> >   #define MISALIGNED_COPY_SIZE ((MISALIGNED_BUFFER_SIZE / 2) - 0x80)
> >   DEFINE_PER_CPU(long, misaligned_access_speed);
> > +DEFINE_PER_CPU(long, vector_misaligned_access) =3D RISCV_HWPROBE_VEC_M=
ISALIGNED_UNKNOWN;
> >   #ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
> >   static cpumask_t fast_misaligned_access;
> > @@ -264,6 +265,8 @@ static int check_unaligned_access_all_cpus(void)
> >   {
> >   	bool all_cpus_emulated =3D check_unaligned_access_emulated_all_cpus(=
);
>=20
> There was talks about Zicclsm, but spike doesnt have support for Zicclsm
> afaik,

Support for Zicclsm just means that it can perform misaligned loads and
stores to cache coherent memory. I guess support in Spike would involve
setting that in its devicetree iff/when that's the case.

> but I was wondering if i should add Zicclsm to cpufeature and aswell.

Ye, please do add detection for Zicclsm. I think that should be fairly
straightforward to do, nothing too special to document.

Cheers,
Conor.

--03IvgSR7vpRDfuV8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmCH/wAKCRB4tDGHoIJi
0r7xAP9jbFQzTrog7i5n5EAYAE+bJz/oSCWgrT9GztBbC6wUjgD9GX0VhFIUjIEh
r5T/gvSXy7WZaTg4asdowbl5nicgfAQ=
=oWHY
-----END PGP SIGNATURE-----

--03IvgSR7vpRDfuV8--


--===============2767627187420417044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2767627187420417044==--

