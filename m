Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13D5C79F9E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 13:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j23CdGs7hme8ocutVofAgNhn4L7xYUsLdZzBHR8fcck=; b=l+JlMn4uYphOWyCKivJ8SBCYE4
	aPsYI/9af4lpxfGRskcuLUOMvOb5ZutDiPGoZnrtkqQW7Zmr4Dc6jYe0aR7SIog2DNElOxqnZQijI
	41jc8vNu62A8UkAcu30hQlgFUAantxlvQ+zHndAoPwlbZFQnW5xRrfTFpLEXL+RJ5yhqNEGp3B28g
	TUH+8Ifcp5UzkJZTyXq4rtS5ASUcmcSv/ooyI1if9VuLw93Mt1YaZB6/ai0Q2LjQZHETtScZKFHjT
	4SUIoIM3++m70Eg88Av9msFkKc/BxErPVMWZRUKfub3nwPRggUYi0kPR5HdpKnFbgLDUK8zeF+2TF
	fY4EEqDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vrZ-0000000994Z-3XrO;
	Tue, 08 Sep 2026 13:27:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vrY-0000000994O-42Oi
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 13:27:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 57E3B41AFC;
	Tue,  8 Sep 2026 13:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D731F00A3A;
	Tue,  8 Sep 2026 13:27:45 +0000 (UTC)
Date: Tue, 8 Sep 2026 14:27:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, wangruikang@iscas.ac.cn,
	ganboing@gmail.com, alex@ghiti.fr, andrew.jones@oss.qualcomm.com,
	cleger@meta.com, geshijian@picoheart.com, niehaitao@picoheart.com,
	cuiyunhui@bytedance.com
Subject: Re: [PATCH v3 5/5] riscv: errata: picoheart: Add workaround for
 AMOCASQ errata
Message-ID: <20260908-perennial-cable-beb0967baa6e@spud>
References: <20260907072149.72031-1-yang.yicong@picoheart.com>
 <20260907072149.72031-6-yang.yicong@picoheart.com>
 <20260907-wiring-paramount-33df8fcf7c35@spud>
 <faa5620e-741e-4a95-8c22-79651a3b19bf@picoheart.com>
MIME-Version: 1.0
In-Reply-To: <faa5620e-741e-4a95-8c22-79651a3b19bf@picoheart.com>
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
Content-Type: multipart/mixed; boundary="===============3298072130348181800=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3298072130348181800==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TdvrOvHYDE/NPjMS"
Content-Disposition: inline

--TdvrOvHYDE/NPjMS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 07:41:24PM +0800, Yicong Yang wrote:
> Hi Conor,
>=20
> On 9/7/26 11:44 PM, Conor Dooley wrote:
> > On Mon, Sep 07, 2026 at 03:21:49PM +0800, Yicong Yang wrote:
> >> Some Picoheart CPUs implement Zacas extension but lack support
> >> for AMOCASQ PMA attribute. Thus makes the CASQ instruction de
> >> facto unavailable. Since currently no ways to retrieve the PMA
> >> information and the riscv kernel will declare cmpxchg128 support
> >> if platform declare support of Zacas, the use of cmpxchg128 will
> >> lead to PMA violation and crash the kernel. Add the errata
> >> workaround to disable the use of cmpxchg128 on the affected CPUs.
> >>
> >> Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
> >> ---
> >>  arch/riscv/Kconfig.errata            | 12 ++++++++++++
> >>  arch/riscv/errata/picoheart/errata.c | 22 ++++++++++++++++++++++
> >>  arch/riscv/include/asm/cmpxchg.h     |  2 +-
> >>  arch/riscv/include/asm/cpufeature.h  |  8 ++++++++
> >>  arch/riscv/kernel/cpufeature.c       | 13 ++++++++++++-
> >>  5 files changed, 55 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> >> index 8ce5c0314321..16e37391d596 100644
> >> --- a/arch/riscv/Kconfig.errata
> >> +++ b/arch/riscv/Kconfig.errata
> >> @@ -176,4 +176,16 @@ config ERRATA_PICOHEART_CBO_CLEAN
> >> =20
> >>  	   If you don't know what to do here, say "Y".
> >> =20
> >> +config ERRATA_PICOHEART_AMOCASQ
> >> +	bool "Apply Picoheart AMOCASQ errata"
> >> +	depends on ERRATA_PICOHEART && RISCV_ISA_ZACAS
> >> +	default y
> >> +	help
> >> +	  Some Picoheart CPUs implement the Zacas extension but lack support
> >> +	  for AMOCASQ PMA attribute. Thus makes the CASQ instruction de facto
> >> +	  unavailable. Enable this errata workaround to disable the use of
> >> +	  CASQ in the kernel (cmpxchg128).
> >> +
> >> +	  If you don't know what to do here, say "Y".
> >> +
> >>  endmenu # "CPU errata selection"
> >> diff --git a/arch/riscv/errata/picoheart/errata.c b/arch/riscv/errata/=
picoheart/errata.c
> >> index 21480d19c084..0fb4cb41ab03 100644
> >> --- a/arch/riscv/errata/picoheart/errata.c
> >> +++ b/arch/riscv/errata/picoheart/errata.c
> >> @@ -174,10 +174,32 @@ static void picoheart_errata_probe_cbo_clean(uns=
igned int stage,
> >>  	static_branch_enable(&has_picoheart_cbo_clean_errata);
> >>  }
> >> =20
> >> +static void picoheart_errata_probe_amocasq(unsigned int stage,
> >> +					   unsigned long archid,
> >> +					   unsigned long impid)
> >> +{
> >> +	if (!IS_ENABLED(CONFIG_ERRATA_PICOHEART_AMOCASQ))
> >> +		return;
> >> +
> >> +	if (stage !=3D RISCV_ALTERNATIVES_BOOT)
> >> +		return;
> >> +
> >> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) ||
> >> +	    !riscv_isa_extension_available(NULL, ZACAS))
> >> +		return;
> >> +
> >> +	if (archid !=3D 0x804a555049544552 || impid !=3D 0x100)
> >> +		return;
> >> +
> >> +	static_branch_disable(&cpus_support_cmpxchg128);
> >> +}
> >> +
> >>  static u32 picoheart_errata_probe(unsigned int stage, unsigned long a=
rchid,
> >>  				  unsigned long impid)
> >>  {
> >>  	picoheart_errata_probe_cbo_clean(stage, archid, impid);
> >> +	picoheart_errata_probe_amocasq(stage, archid, impid);
> >> +
> >>  	return 0;
> >>  }
> >> =20
> >> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm=
/cmpxchg.h
> >> index 662e160b0522..e231e9619eee 100644
> >> --- a/arch/riscv/include/asm/cmpxchg.h
> >> +++ b/arch/riscv/include/asm/cmpxchg.h
> >> @@ -329,7 +329,7 @@
> >> =20
> >>  #if defined(CONFIG_64BIT) && defined(CONFIG_RISCV_ISA_ZACAS) && defin=
ed(CONFIG_TOOLCHAIN_HAS_ZACAS)
> >> =20
> >> -#define system_has_cmpxchg128()        riscv_has_extension_unlikely(R=
ISCV_ISA_EXT_ZACAS)
> >> +#define system_has_cmpxchg128	system_has_cmpxchg128
> >> =20
> >>  union __u128_halves {
> >>  	u128 full;
> >> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/=
asm/cpufeature.h
> >> index 739fcc84bf7b..f9d95cbf5abd 100644
> >> --- a/arch/riscv/include/asm/cpufeature.h
> >> +++ b/arch/riscv/include/asm/cpufeature.h
> >> @@ -164,4 +164,12 @@ static inline bool cpu_supports_indirect_br_lp_in=
str(void)
> >>  		riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFILP));
> >>  }
> >> =20
> >> +DECLARE_STATIC_KEY_FALSE(cpus_support_cmpxchg128);
> >> +
> >> +static inline bool system_has_cmpxchg128(void)
> >> +{
> >> +	return riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS) &&
> >> +	       static_branch_likely(&cpus_support_cmpxchg128);
> >> +}
> >> +
> >>  #endif
> >> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufea=
ture.c
> >> index b56d149cf4ed..f73ce43df626 100644
> >> --- a/arch/riscv/kernel/cpufeature.c
> >> +++ b/arch/riscv/kernel/cpufeature.c
> >> @@ -46,6 +46,9 @@ struct riscv_isainfo hart_isa[NR_CPUS];
> >> =20
> >>  u32 thead_vlenb_of;
> >> =20
> >> +/* All the CPUs supports cmpxchg128 (CASQ*). */
> >> +DEFINE_STATIC_KEY_FALSE(cpus_support_cmpxchg128);
> >> +
> >>  /**
> >>   * riscv_isa_extension_base() - Get base extension word
> >>   *
> >> @@ -317,6 +320,14 @@ static int riscv_cfiss_validate(const struct risc=
v_isa_ext_data *data,
> >>  	return 0;
> >>  }
> >> =20
> >> +static int riscv_ext_zacas_validate(const struct riscv_isa_ext_data *=
data,
> >> +				    const unsigned long *isa_bitmap)
> >> +{
> >> +	static_branch_enable(&cpus_support_cmpxchg128);
> >=20
> > A validate callback is meant to determine whether or not the extension
> > can be used, it's not there for people to add arbitrary code, partially
> > because each validate callback runs multiple times and may change state
> > depending on what happens with other extensions. E.g. a validate
> > callback may pass on the first iteration but fail on the second because
> > a dependant extension later in the list fails. In practice, this might
> > not ever affect Zacas, and doesn't at the moment, but this sort of code
> > should not be added to validate callbacks.
>=20
> agree that this doesn't match the validate callback function perfectly.

It doesn't match it at all, it's not a slight mismatch, it's doing
something that cannot be done in one.

> the motivation here is to split a separate control for cmpxchg128
> then the suffered platform can disable it in the errata code. though all
> the AMOCAS.{W,D,Q} are included by Zacas, the PMA attribute is separated
> as AMOCASW, AMOCASD, AMOCASQ. so I suppose the right validation here
> is to check whether the AMOCASQ is supported, similar to how the Zicbom
> is enabled according to a valid riscv_cbom_block_size. But unfortunately
> there's no starndard way to retrieve the PMA attributes currently.
>=20
> >=20
> > To be honest, I'd rather just turn the extension off entirely on this
> > platform rather than make everyone suffer.
>=20
> it's too brutal to disable the entire Zacas. we'll lose the performance
> benefit from the users of cmpxchg and if clear it in the isa bitmap, it'll
> be unavailable to the userspace. considering the kernel already provides
> the system_has_cmpxchg128() for checking, we can limit it to cmpxchg128 o=
nly.

I don't understand the details of this particular extension, but should we
be telling userspace that the extension is supported? Is the same problem
of not being able to use AMOCAS.Q present there?

>=20
> > The errata probe functions run after extension detection but before
> > patching, so could we just clear the Zacas bit in the isa bitmap?
> >=20
>=20
> maybe not, as from _apply_alternatives() the errata probe/patch is perfor=
med
> after the patching. so it's too late to clear the isa bitmap as the patch=
ing
> is already done...

Ah right, I did actually go and look at this but I forgot that
riscv_fill_cpu_mfr_info() only sets the manufacturer and patch function,
and doesn't actually run it.

>=20
> what about something like below to add an errata alternative to disable
> the cmpxchg128 only on the suffered platforms? this will limit the
> change only to system_has_cmpxchg128() and won't bother others:
>=20
> #define system_has_cmpxchg128 system_has_cmpxchg128
> static __always_inline bool system_has_cmpxchg128(void)
> {
> 	if (!IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
> 		return riscv_isa_extension_available(NULL, ZACAS);
>=20
> 	/* The vendor erratum overrides the standard Zacas alternative. */
> 	asm goto(ALTERNATIVE_2(
> 			"nop",
> 			"j %l[l_yes]",
> 			STANDARD_EXT, RISCV_ISA_EXT_ZACAS, 1,
> 			"nop",
> 			PICOHEART_VENDOR_ID, ERRATA_PICOHEART_AMOCASQ,
> 			CONFIG_ERRATA_PICOHEART_AMOCASQ)
> 		: : : : l_yes);

I would prefer this because it doesn't abuse a validate callback.

Thanks,
Conor.

> =09
> 	return false;
> l_yes:
> 	return true;
> }
>=20
> Thanks.
>=20
>=20
> > Cheers,
> > Conor.
> >=20
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static const unsigned int riscv_a_exts[] =3D {
> >>  	RISCV_ISA_EXT_ZAAMO,
> >>  	RISCV_ISA_EXT_ZALRSC,
> >> @@ -544,7 +555,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =
=3D {
> >>  	__RISCV_ISA_EXT_DATA(za64rs, RISCV_ISA_EXT_ZA64RS),
> >>  	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
> >>  	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
> >> -	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
> >> +	__RISCV_ISA_EXT_DATA_VALIDATE(zacas, RISCV_ISA_EXT_ZACAS, riscv_ext_=
zacas_validate),
> >>  	__RISCV_ISA_EXT_DATA(zalasr, RISCV_ISA_EXT_ZALASR),
> >>  	__RISCV_ISA_EXT_DATA(zalrsc, RISCV_ISA_EXT_ZALRSC),
> >>  	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
> >> --=20
> >> 2.50.1 (Apple Git-155)
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--TdvrOvHYDE/NPjMS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqANTAAKCRB4tDGHoIJi
0iNZAP9mCYlzKaT9f56ur6A8C2BhrehIsq4BogHIgBif9wZaPgD+MIQMozf+ec7G
neSQWNFZaBunjJ7oKxbZhLGuUdpLPgg=
=Pp2o
-----END PGP SIGNATURE-----

--TdvrOvHYDE/NPjMS--


--===============3298072130348181800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3298072130348181800==--

