Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBFBEE14DE
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 11:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hoX+PzaT1yzLtI0EE6eFg0TOvWfMfUN1q+nU/1MQTQ=; b=tBYzcih1sktRgAdUZreQDKVY6i
	kDuUOWUp0o+fYtZQkgMg/oCYhj/pAXvkSNmjWfh+BJ0EzOrYr/h4ej1wJ1WGgDaoUG7QVMSTz3TeN
	MBK6hHQPFhwJaS4WY/1VKNcrxogh0vxhixDePfaqXC5PiOhYFbArA7WQtGeNEhcHGf/qo4Hxth1mv
	zTTvp5Xpwm/a37oHwNaXSK+i7/ZPsfYv55enyuT5Fy0Gm8f0bS3Iiq1Imecf4lDa7t2mUmdOCxCVf
	4Gt1NKIBxsR1DQcxhT44AuUddvKjXeaJ3/LFMDBYc5kUo5E2xH+AGuXmaYd5qlaLWb1wt0f29CIYp
	iA3dlFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeCmr-00ByBc-2r;
	Thu, 07 Sep 2023 11:03:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeCmn-00ByAJ-2O;
	Thu, 07 Sep 2023 11:03:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B63F3B81977;
	Thu,  7 Sep 2023 11:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76C1C116B5;
	Thu,  7 Sep 2023 11:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694084574;
	bh=LFYt9qnt8xqi5g2t1HQMqT+oIQ06UUExrIO1wp0wvAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CJ2jHttMQEtN179DSrfjvJ3XyTu+VHvUYRjDKHfCFE/wcxUXBizv7vTlqbN9mcRQb
	 DaepAv0lXzMy35uAhow7Xn/fx38972qe5rAyqcNfmI3QZO5EhIqe5TArEtU2K7/X1y
	 EXbgpJBzNHbmC9o7JHPfHBuszX8WbkT4GFnojnaM551HNpFsmVyt6a+qAUAF5BistI
	 g2JVjci3yom67oJC9Gv2hMUGMtWqGy71jpcwQvHrk9h2CjNVA7JqCBr+hkYrwsQ8LF
	 8T9mmSSXF5HcGpL0AnG6G9BLqreLsQAxRjLU0XrbJM3dfSegrnbEeFYoVrNV7/G7Y2
	 FQyOBUUtaOFdg==
Date: Thu, 7 Sep 2023 12:02:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, atishp@atishpatra.org,
	anup@brainfault.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	ajones@ventanamicro.com, heiko@sntech.de, samuel@sholland.org,
	geert+renesas@glider.be, n.shubin@yadro.com, dminus@andestech.com,
	ycliang@andestech.com, tim609@andestech.com, locus84@andestech.com,
	dylan@andestech.com
Subject: Re: [PATCH 3/4] riscv: errata: Add Andes PMU errata
Message-ID: <20230907-7bc08398d2f95c14e1c0bc76@fedora>
References: <20230907021635.1002738-1-peterlin@andestech.com>
 <20230907021635.1002738-4-peterlin@andestech.com>
 <20230907-158e1f7e1e866d8c02726c9c@fedora>
MIME-Version: 1.0
In-Reply-To: <20230907-158e1f7e1e866d8c02726c9c@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_040258_078951_41B8FCEA 
X-CRM114-Status: GOOD (  47.29  )
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
Content-Type: multipart/mixed; boundary="===============7411481263858471995=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7411481263858471995==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iI3hr/Zt+A85czXE"
Content-Disposition: inline


--iI3hr/Zt+A85czXE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 07, 2023 at 10:27:03AM +0100, Conor Dooley wrote:
> Hey,
>=20
> On Thu, Sep 07, 2023 at 10:16:34AM +0800, Yu Chien Peter Lin wrote:
> > Before the ratification of Sscofpmf, the Andes PMU extension
> > implements the same mechanism and is compatible with existing
> > SBI PMU driver of perf to support event sampling and mode
> > filtering with programmable hardware performance counters.
>=20
> If it actually was, you'd not need to modify the driver ;)
>=20
> > This patch adds PMU support for Andes 45-series CPUs by
> > introducing a CPU errata.
>=20
> I don't really understand this in all honesty. You don't have Sscofpmf
> support with a bug, you have something that is Sscofpmf-adjactent that
> predates it. Why claim to support an extension that you do not, only to
> have to come along and try to clean things up afterwards, instead of
> accurately declaring what you do support from the outset?

Reading this again, I don't think that I have been particularly clear,
sorry. My point is that this is not a fix for a bug in your
implementation of Sscofpmf, but rather adding probing for what is
effectively a custom ISA extension that happens to be very similar to
the standard one. As it is not an implementation bug, errata should
not be abused to support vendor extensions, and either DT or ACPI should
be used to inform the operating system about its presence.

Cheers,
Conor.

>=20
> (and just because someone already got away with it, doesn't mean that
> you get a free pass on it, sorry)
>=20
> Thanks,
> Conor.
>=20
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > Signed-off-by: Locus Wei-Han Chen <locus84@andestech.com>
>=20
> btw, what did Locus Wei-Han Chen do here? Are you missing
> a Co-developed-by: tag?
>=20
> > Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
> > Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> > ---
> >  arch/riscv/Kconfig.errata            | 13 ++++++++
> >  arch/riscv/errata/andes/errata.c     | 45 +++++++++++++++++++++++++++-
> >  arch/riscv/include/asm/errata_list.h | 43 ++++++++++++++++++++++++--
> >  drivers/perf/riscv_pmu_sbi.c         | 20 +++++++++----
> >  4 files changed, 111 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> > index 92c779764b27..a342b209c169 100644
> > --- a/arch/riscv/Kconfig.errata
> > +++ b/arch/riscv/Kconfig.errata
> > @@ -21,6 +21,19 @@ config ERRATA_ANDES_CMO
> > =20
> >  	  If you don't know what to do here, say "Y".
> > =20
> > +config ERRATA_ANDES_PMU
> > +	bool "Apply Andes PMU errata"
> > +	depends on ERRATA_ANDES && RISCV_PMU_SBI
> > +	default y
> > +	help
> > +	  The Andes 45-series cores implement a PMU overflow extension
> > +	  very similar to the core SSCOFPMF extension.
> > +
> > +	  This will apply the overflow errata to handle the non-standard
> > +	  behaviour via the regular SBI PMU driver and interface.
> > +
> > +	  If you don't know what to do here, say "Y".
> > +
> >  config ERRATA_SIFIVE
> >  	bool "SiFive errata"
> >  	depends on RISCV_ALTERNATIVE
> > diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes=
/errata.c
> > index d2e1abcac967..19256691f1ba 100644
> > --- a/arch/riscv/errata/andes/errata.c
> > +++ b/arch/riscv/errata/andes/errata.c
> > @@ -56,11 +56,54 @@ static bool errata_probe_iocp(unsigned int stage, u=
nsigned long arch_id, unsigne
> >  	return true;
> >  }
> > =20
> > +static bool errata_probe_pmu(unsigned int stage,
> > +			     unsigned long arch_id, unsigned long impid)
> > +{
> > +	if (!IS_ENABLED(CONFIG_ERRATA_ANDES_PMU))
> > +		return false;
> > +
> > +	if ((arch_id & 0xff) !=3D 0x45)
> > +		return false;
> > +
> > +	if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +static u32 andes_errata_probe(unsigned int stage,
> > +			      unsigned long archid, unsigned long impid)
> > +{
> > +	u32 cpu_req_errata =3D 0;
> > +
> > +	if (errata_probe_pmu(stage, archid, impid))
> > +		cpu_req_errata |=3D BIT(ERRATA_ANDES_PMU);
> > +
> > +	return cpu_req_errata;
> > +}
> > +
> >  void __init_or_module andes_errata_patch_func(struct alt_entry *begin,=
 struct alt_entry *end,
> >  					      unsigned long archid, unsigned long impid,
> >  					      unsigned int stage)
> >  {
> > +	struct alt_entry *alt;
> > +	u32 cpu_req_errata =3D andes_errata_probe(stage, archid, impid);
> > +	u32 tmp;
> > +
> >  	errata_probe_iocp(stage, archid, impid);
> > =20
> > -	/* we have nothing to patch here ATM so just return back */
> > +	for (alt =3D begin; alt < end; alt++) {
> > +		if (alt->vendor_id !=3D ANDES_VENDOR_ID)
> > +			continue;
> > +		if (alt->patch_id >=3D ERRATA_ANDES_NUMBER)
> > +			continue;
> > +
> > +		tmp =3D (1U << alt->patch_id);
> > +		if (cpu_req_errata & tmp) {
> > +			mutex_lock(&text_mutex);
> > +			patch_text_nosync(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt),
> > +					  alt->alt_len);
> > +			mutex_unlock(&text_mutex);
> > +		}
> > +	}
> >  }
> > diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/=
asm/errata_list.h
> > index 56ab40e64092..bb4c276e2c7f 100644
> > --- a/arch/riscv/include/asm/errata_list.h
> > +++ b/arch/riscv/include/asm/errata_list.h
> > @@ -13,7 +13,8 @@
> > =20
> >  #ifdef CONFIG_ERRATA_ANDES
> >  #define ERRATA_ANDES_NO_IOCP 0
> > -#define ERRATA_ANDES_NUMBER 1
> > +#define ERRATA_ANDES_PMU 1
> > +#define ERRATA_ANDES_NUMBER 2
> >  #endif
> > =20
> >  #ifdef CONFIG_ERRATA_SIFIVE
> > @@ -150,15 +151,51 @@ asm volatile(ALTERNATIVE_2(						\
> >  #define THEAD_C9XX_RV_IRQ_PMU			17
> >  #define THEAD_C9XX_CSR_SCOUNTEROF		0x5c5
> > =20
> > +#define ANDES_RV_IRQ_PMU			18
> > +#define ANDES_SLI_CAUSE_BASE			256
> > +#define ANDES_CSR_SCOUNTEROF			0x9d4
> > +#define ANDES_CSR_SLIE				0x9c4
> > +#define ANDES_CSR_SLIP				0x9c5
> > +
> >  #define ALT_SBI_PMU_OVERFLOW(__ovl)					\
> > -asm volatile(ALTERNATIVE(						\
> > +asm volatile(ALTERNATIVE_2(						\
> >  	"csrr %0, " __stringify(CSR_SSCOUNTOVF),			\
> >  	"csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),		\
> >  		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
> > -		CONFIG_ERRATA_THEAD_PMU)				\
> > +		CONFIG_ERRATA_THEAD_PMU,				\
> > +	"csrr %0, " __stringify(ANDES_CSR_SCOUNTEROF),			\
> > +		ANDES_VENDOR_ID, ERRATA_ANDES_PMU,			\
> > +		CONFIG_ERRATA_ANDES_PMU)				\
> >  	: "=3Dr" (__ovl) :						\
> >  	: "memory")
> > =20
> > +#define ALT_SBI_PMU_OVF_CLEAR_PENDING(__irq_num)			\
> > +asm volatile(ALTERNATIVE(						\
> > +	"csrc " __stringify(CSR_IP) ", %0\n\t",				\
> > +	"csrc " __stringify(ANDES_CSR_SLIP) ", %0\n\t",			\
> > +		ANDES_VENDOR_ID, ERRATA_ANDES_PMU,			\
> > +		CONFIG_ERRATA_ANDES_PMU)				\
> > +	: : "r"(BIT(__irq_num))						\
> > +	: "memory")
> > +
> > +#define ALT_SBI_PMU_OVF_DISABLE(__irq_num)				\
> > +asm volatile(ALTERNATIVE(						\
> > +	"csrc " __stringify(CSR_IE) ", %0\n\t",				\
> > +	"csrc " __stringify(ANDES_CSR_SLIE) ", %0\n\t",			\
> > +		ANDES_VENDOR_ID, ERRATA_ANDES_PMU,			\
> > +		CONFIG_ERRATA_ANDES_PMU)				\
> > +	: : "r"(BIT(__irq_num))						\
> > +	: "memory")
> > +
> > +#define ALT_SBI_PMU_OVF_ENABLE(__irq_num)				\
> > +asm volatile(ALTERNATIVE(						\
> > +	"csrs " __stringify(CSR_IE) ", %0\n\t",				\
> > +	"csrs " __stringify(ANDES_CSR_SLIE) ", %0\n\t",			\
> > +		ANDES_VENDOR_ID, ERRATA_ANDES_PMU,			\
> > +		CONFIG_ERRATA_ANDES_PMU)				\
> > +	: : "r"(BIT(__irq_num))						\
> > +	: "memory")
> > +
> >  #endif /* __ASSEMBLY__ */
> > =20
> >  #endif
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > index 9a51053b1f99..8b67f202d2ae 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -687,7 +687,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, voi=
d *dev)
> >  	fidx =3D find_first_bit(cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS);
> >  	event =3D cpu_hw_evt->events[fidx];
> >  	if (!event) {
> > -		csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
> > +		ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_num);
> >  		return IRQ_NONE;
> >  	}
> > =20
> > @@ -701,7 +701,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, voi=
d *dev)
> >  	 * Overflow interrupt pending bit should only be cleared after stoppi=
ng
> >  	 * all the counters to avoid any race condition.
> >  	 */
> > -	csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
> > +	ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_num);
> > =20
> >  	/* No overflow bit is set */
> >  	if (!overflow)
> > @@ -773,8 +773,8 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, s=
truct hlist_node *node)
> > =20
> >  	if (riscv_pmu_use_irq) {
> >  		cpu_hw_evt->irq =3D riscv_pmu_irq;
> > -		csr_clear(CSR_IP, BIT(riscv_pmu_irq_num));
> > -		csr_set(CSR_IE, BIT(riscv_pmu_irq_num));
> > +		ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_num);
> > +		ALT_SBI_PMU_OVF_ENABLE(riscv_pmu_irq_num);
> >  		enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
> >  	}
> > =20
> > @@ -785,7 +785,7 @@ static int pmu_sbi_dying_cpu(unsigned int cpu, stru=
ct hlist_node *node)
> >  {
> >  	if (riscv_pmu_use_irq) {
> >  		disable_percpu_irq(riscv_pmu_irq);
> > -		csr_clear(CSR_IE, BIT(riscv_pmu_irq_num));
> > +		ALT_SBI_PMU_OVF_DISABLE(riscv_pmu_irq_num);
> >  	}
> > =20
> >  	/* Disable all counters access for user mode now */
> > @@ -809,6 +809,10 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pm=
u, struct platform_device *pde
> >  		   riscv_cached_mimpid(0) =3D=3D 0) {
> >  		riscv_pmu_irq_num =3D THEAD_C9XX_RV_IRQ_PMU;
> >  		riscv_pmu_use_irq =3D true;
> > +	} else if (IS_ENABLED(CONFIG_ERRATA_ANDES_PMU) &&
> > +		   riscv_cached_mvendorid(0) =3D=3D ANDES_VENDOR_ID) {
> > +		riscv_pmu_irq_num =3D ANDES_RV_IRQ_PMU;
> > +		riscv_pmu_use_irq =3D true;
> >  	}
> > =20
> >  	if (!riscv_pmu_use_irq)
> > @@ -821,7 +825,11 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pm=
u, struct platform_device *pde
> >  		return -ENODEV;
> >  	}
> > =20
> > -	riscv_pmu_irq =3D irq_create_mapping(domain, riscv_pmu_irq_num);
> > +	if (IS_ENABLED(CONFIG_ERRATA_ANDES_PMU))
> > +		riscv_pmu_irq =3D irq_create_mapping(
> > +			domain, ANDES_SLI_CAUSE_BASE + riscv_pmu_irq_num);
> > +	else
> > +		riscv_pmu_irq =3D irq_create_mapping(domain, riscv_pmu_irq_num);
> >  	if (!riscv_pmu_irq) {
> >  		pr_err("Failed to map PMU interrupt for node\n");
> >  		return -ENODEV;
> > --=20
> > 2.34.1
> >=20
> >=20
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv



> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


--iI3hr/Zt+A85czXE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPmt1gAKCRB4tDGHoIJi
0sT4AP9Wjv6Bs1Q5jvqgwPsVaXGObXsya6g9MIYUsZuldCsZ4gD/bwP83pmAgKhs
cWs2FM/F7hoEZDM3C5T2E1bwqJNAcgA=
=Jtx1
-----END PGP SIGNATURE-----

--iI3hr/Zt+A85czXE--


--===============7411481263858471995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7411481263858471995==--

