Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDFFCD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 15:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7T6QWaGSy86sj/2wcpfhBmXf5SDRmh4+n2mtcZEoRE=; b=4rlx1ZLzoVVMPmY/dVqBl+sTsL
	BMbc9219FD3z8ZYcdunhobg6vHuz3clHC9pVPhXzoE7s5w5Dqz0mK0q3mZJsyBs8cufa42zKRGob6
	lPtbBe2h/wsiw74hKbknd6sVLP1FMlRqVcNtztp0Nv2/Gy8Pm2KMfySAD7oXN7uES9ZsIDg959urw
	Zqz82jo6dFhVPm9fKY+8meHrpV4tofR0WEXAijqsgAxBORZYS17tBnYt9JeIBuGJjYwJks6YnttQT
	gnqcVA5YcznGMtfeXg0S5qrEZBpvOmolBaF9hzpnNL3vaBh+W8IxUNgAWzRR73RxkTFGPlsOCVMQh
	ruWN+Pjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMVV-000000025Da-2gS1;
	Tue, 19 May 2026 15:37:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMVU-000000025D6-3fMq
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 15:37:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF84D60129;
	Tue, 19 May 2026 15:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C3FC2BCB3;
	Tue, 19 May 2026 15:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779205039;
	bh=+KMiV4EYjm6aVvpEElUQOWS3HQxj1ScdtJ7IB3KVohE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A761h8yD5P9mzBEwA3zhvN0hB4PmLFw0I9393IlUFV7sjNWrOIOYathWdlVBGTc0P
	 Vu9hhJIPiNB9ItZYxRHEHrubRjfbgBUiG8Zmkrnf+V1s3m+IIYTBYQvUCH+ZOBV9gA
	 oBZzb32GEjt+zZ33Jta2ZYVoPqLQDfUA5PG1PRBx48NZtAsj2XOP3a+2nhO+70wBOt
	 BTmg3j5NdluG/q3y71te/iH7BDZPU5MCorFL9kqXtk0Sid0I8k8ej7i2Sz6vPE9jAr
	 IAwEWSxhnTwlW8/s3vO7+lCirc5c6zlEigOHUOdfZYH4cApk37CJNH8F7dWiWvSCuu
	 R+BO9nQvqKnog==
Date: Tue, 19 May 2026 16:37:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Michael Ellerman <mpe@kernel.org>
Cc: Yunhui Cui <cuiyunhui@bytedance.com>, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	akpm@linux-foundation.org, pasha.tatashin@soleen.com,
	andrew+kernel@donnellan.id.au, rmclure@linux.ibm.com,
	debug@rivosinc.com, baolin.wang@linux.alibaba.com,
	zhangchunyan@iscas.ac.cn, apopple@nvidia.com, namcao@linutronix.de,
	wangruikang@iscas.ac.cn, apatel@ventanamicro.com,
	liu.xuemei1@zte.com.cn, ajones@ventanamicro.com,
	cleger@rivosinc.com, charlie@rivosinc.com, hui.wang@canonical.com,
	guodong@riscstar.com, pincheng.plct@isrc.iscas.ac.cn,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Qingwei Hu <qingwei.hu@bytedance.com>
Subject: Re: [PATCH 1/2] riscv: track effective hardware PTE A/D updates
Message-ID: <20260519-justly-fragile-f0e298526b08@spud>
References: <20260519031927.70683-1-cuiyunhui@bytedance.com>
 <78e7f039-74a4-4499-a896-a20912ebc6fb@kernel.org>
MIME-Version: 1.0
In-Reply-To: <78e7f039-74a4-4499-a896-a20912ebc6fb@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============6063386320825411338=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6063386320825411338==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5zDb7wz6gxgtHl3H"
Content-Disposition: inline


--5zDb7wz6gxgtHl3H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 10:05:21PM +1000, Michael Ellerman wrote:
> On 19/5/2026 13:19, Yunhui Cui wrote:
> > Separate Svadu capability discovery from the host's effective ADUE
> > state. Enable SBI FWFT PTE A/D hardware updating on each online CPU
> > through CPUHP when both Svade and Svadu are present, use the resulting
> > runtime state for arch_has_hw_pte_young(), and fall back to
> > software-managed A/D updates when enabling the feature fails.
> >=20
> > Platforms with Svadu but without Svade are treated as always using
> > hardware PTE A/D updates. Expose the runtime state through an inline
> > getter so hot MM paths avoid an out-of-line function call.
>=20
> I'm not sure what you mean here. The current code doesn't use an out-of-l=
ine
> function call AFAICS? More comments below ...
>=20
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
> > ---
> >   arch/riscv/include/asm/cpufeature.h |  6 +++
> >   arch/riscv/include/asm/pgtable.h    |  8 ++--
> >   arch/riscv/kernel/cpufeature.c      | 73 ++++++++++++++++++++++++++---
> >   3 files changed, 77 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/a=
sm/cpufeature.h
> > index 739fcc84bf7b2..877d71a1ea755 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -128,6 +128,12 @@ struct riscv_isa_ext_data {
> >   extern const struct riscv_isa_ext_data riscv_isa_ext[];
> >   extern const size_t riscv_isa_ext_count;
> >   extern bool riscv_isa_fallback;
> > +extern bool riscv_hw_pte_ad_updating_enabled;
> > +
> > +static __always_inline bool riscv_has_hw_pte_ad_updating(void)
> > +{
> > +	return READ_ONCE(riscv_hw_pte_ad_updating_enabled);
> > +}
> >   unsigned long riscv_isa_extension_base(const unsigned long *isa_bitma=
p);
> >   static __always_inline bool riscv_cpu_has_extension_likely(int cpu, c=
onst unsigned long ext)
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/=
pgtable.h
> > index a1a7c6520a095..20663a466cf6c 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -732,14 +732,14 @@ static inline pgprot_t pgprot_writecombine(pgprot=
_t _prot)
> >   #define pgprot_dmacoherent pgprot_writecombine
> >   /*
> > - * Both Svade and Svadu control the hardware behavior when the PTE A/D=
 bits need to be set. By
> > - * default the M-mode firmware enables the hardware updating scheme wh=
en only Svadu is present in
> > - * DT.
> > + * Both Svade and Svadu control the hardware behavior when the PTE A/D=
 bits
> > + * need to be set. The core MM code only cares whether hardware updati=
ng of
> > + * the accessed/dirty state is currently active.
> >    */
> >   #define arch_has_hw_pte_young arch_has_hw_pte_young
> >   static inline bool arch_has_hw_pte_young(void)
> >   {
> > -	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
> > +	return riscv_has_hw_pte_ad_updating();
> >   }
>=20
> riscv_has_extension_unlikely() uses an asm alternative, ie. it's patched =
at
> boot so there's no runtime cost. But now you've changed it to just test a
> bool.
>=20
> I'm not sure arch_has_hw_pte_young() is a particularly hot path, but seems
> like you could use a static key, so that the code is patched to avoid the
> runtime test?
>=20
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index f46aa5602d74d..e46b2d2b49eed 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -35,6 +35,8 @@
> >   static bool any_cpu_has_zicboz;
> >   static bool any_cpu_has_zicbop;
> >   static bool any_cpu_has_zicbom;
> > +bool riscv_hw_pte_ad_updating_enabled __read_mostly;
> > +EXPORT_SYMBOL_GPL(riscv_hw_pte_ad_updating_enabled);
> >   unsigned long elf_hwcap __read_mostly;
> > @@ -287,15 +289,74 @@ static int riscv_ext_zvfbfwma_validate(const stru=
ct riscv_isa_ext_data *data,
> ...
> > +static int __init riscv_hw_pte_ad_updating_init(void)
> > +{
> > +	bool has_svade, has_svadu;
> > +	int state;
> > +
> > +	has_svade =3D riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADE);
> > +	has_svadu =3D riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
> > +
> > +	if (!has_svadu)
> > +		return 0;
> > +
> > +	if (!has_svade) {
> > +		riscv_set_hw_pte_ad_updating(true);
> > +		pr_info("riscv: hardware PTE A/D updating enabled\n");
> > +		return 0;
>=20
> This block is identical to the tail of the function. I'd probably use "go=
to
> enable", with an "enable" label below.

Is this code correct though? On DT systems, !svade && !svadu means we
don't actually know if it is hardware or software managed, so printing
that it's hardware managed may not be correct.

I don't understand the mm code enough to know if arch_has_hw_pte_young()
returning true is problematic too, but it probably is?

--5zDb7wz6gxgtHl3H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagyDcwAKCRB4tDGHoIJi
0gX8AQDrlE7ymqEl+6LectZT3XOYzoNlNmBNrVggkjrCbaD0IAD9FoHZluBbgKIC
qzKKOJscbDX9zNlHgG9no5sZUiTHCww=
=l7x3
-----END PGP SIGNATURE-----

--5zDb7wz6gxgtHl3H--


--===============6063386320825411338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6063386320825411338==--

