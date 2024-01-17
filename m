Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8F8C47077
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 00:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fI4tAIPot80I6fgciHp9UBBJiadGM2oYIXlE2Zh6OXI=; b=owLZZiFC4srRMwaxp2cXZqqIgr
	CSMhAZzCsVm3EJK0BH4hxCczieEHKS3NCalZa95SH+3TLb5Q0428nubxk11zohb/c9IChYSFZ4Z5k
	sUOoECCzlKZJd7DO5++Xw5XqdV9YQAzHhiuXsRfG8sxToQmHmCA+wDa/05X3fNdA+pPlXWiJU4L+b
	8I6G5qWXQSjLrzcXjluvQ1+NiMc+7IZ9jhc635KD9MiC1OQHDKdiH8r1gZqK8ROodC60uNI8BJAZK
	Ttf7uVUtQ1ppZI/gdNSn+/hS2d5p2Tc6OsasJIxFkAOMF44ucy66HRTXNAUmnCXS+dbqFUVNv7BmW
	hVJkivWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPtbS-00E3vf-1t;
	Wed, 17 Jan 2024 00:16:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPtbO-00E3vA-0x;
	Wed, 17 Jan 2024 00:16:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3F8C2CE1B8A;
	Wed, 17 Jan 2024 00:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4B0C433F1;
	Wed, 17 Jan 2024 00:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705450575;
	bh=kJ+3QD+8rJuaqWPfNZqBAEGz53Een08dtx5nqhngH34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B3hv6iL7rThGsk1Tg6o4AfzxvjZ/XqJTNKv6YT/d/sGsmEmmAjKoHppJuPK+SRjPH
	 gSgG4wFra8+DT4Un4e0PH3dJ1taY08GjkG62acK6iWHPFOXSj8WGVvTGuXUir1xe4u
	 Tpxv6qy7TvDYCdnV19cmHNAfIeH65xBY/8CGKZAeeTXdEm109SDek9cb7fRb3KXfcn
	 dsMkqGDX1shZvDBHKNhjTb3oxHsworI3LTVrGn+C/dVrpowg16J7wSuRfpPzykQCj2
	 sW049hlhYKNPNpdh9hauJfNWrush+FWxZpM3u/nxoE8uTpMxv8qJUAu5BI/BvEAdOl
	 bolDbDBX9Onfg==
Date: Wed, 17 Jan 2024 00:16:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v7 07/16] RISC-V: Move T-Head PMU to CPU feature
 alternative framework
Message-ID: <20240116-cherub-revival-5d32cc5f1fd0@spud>
References: <20240110073917.2398826-1-peterlin@andestech.com>
 <20240110073917.2398826-8-peterlin@andestech.com>
 <CAOnJCUKY8H+pvgTWW5zkfm8O4WR-OWOKmyPTcMjUZBCC5RaLWQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOnJCUKY8H+pvgTWW5zkfm8O4WR-OWOKmyPTcMjUZBCC5RaLWQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_161618_716833_6294C9B7 
X-CRM114-Status: GOOD (  47.86  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, Yu Chien Peter Lin <peterlin@andestech.com>, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, paul.walmsley@sifive.com, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, chao.wei@sophgo.com, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org, unicorn_wang@outlook.com, wefu@redhat.com
Content-Type: multipart/mixed; boundary="===============5464972558899100522=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5464972558899100522==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ja0AtvSzsJhuxWGO"
Content-Disposition: inline


--Ja0AtvSzsJhuxWGO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 12:55:41PM -0800, Atish Patra wrote:
> On Tue, Jan 9, 2024 at 11:40=E2=80=AFPM Yu Chien Peter Lin
> <peterlin@andestech.com> wrote:
> >
> > The custom PMU extension aims to support perf event sampling prior
> > to the ratification of Sscofpmf. Instead of diverting the bits and
> > register reserved for future standard, a set of custom registers is
> > added.  Hence, we may consider it as a CPU feature rather than an
> > erratum.
> >
>=20
> I don't think we should do that. Any custom implementation that
> violates the standard RISC-V spec should
> be an errata not a feature.
> As per my understanding, a vendor can call an extension custom ISA
> extension if the same feature is not available
> in the standard ISA extensions or the mechanism is completely
> different. It must also not violate any standard spec as well.
>=20
> In this case, a standard sscofpmf is already available. Moreover, both
> Andes and T-head extensions violate the standard
> spec by reusing local interrupt numbers (17(Thead) & 18(Andes)) which
> are clearly specified as reserved for standard local interrupts
> in the AIA specification.

I disagree with you here. The Andes implementation predated (IIRC that
is what was said in replies to an earlier revision) the Sscofpmf
extension and certainly predates the AIA specification. I would be on
board with this line of thinking if someone comes along in 2030 with
"Zbb but with this one tweak" or where something flies entirely in the
face of the standard (like the IOCP cache stuff). The relevant section
in the AIA spec seems to say:
| Interrupt causes that are standardized by the Privileged Architecture
| have major identities in the range 0=E2=80=9315, while numbers 16 and hig=
her are
| officially available for platform standards or for custom use.
| The Advanced Interrupt Architecture claims further authority over
| identity numbers in the ranges 16=E2=80=9323 and 32=E2=80=9347, leaving n=
umbers in the
| range 24=E2=80=9331 and all major identities 48 and higher still free for=
 custom
| use.
I don't see how that can be problematic given the Andes implemtation
dates from before AIA was a thing. It would be silly to say that because
an optional extension later came along and took over something previously
allowed for indiscriminate custom use, that support for that custom
extension is not permitted.

I may well be missing something here though, you clearly know these
specs better than I do, but from what I have read I disagree.

> Please implementation Andes PMU support as an errata as well similar to T=
-head

I certainly _do not_ want to see things like this detected via lookup
tables of marchid and co in the kernel unless it is absolutely required.
We have standard probing mechanisms for feature detection (because to me
this _is_ a feature) and they should be used. Additionally, we define what
entries in the DT properties mean, and if it is convenient to put
"psuedo" extensions into the DT, then we should do so. Getting away from
being tied to what RVI decrees was one of the goals of the new
properties after all, so that we could use a standard mechanism of DT
probing for things like this.

Thanks,
Conor.

> > T-Head cores need to append "xtheadpmu" to the riscv,isa-extensions
> > for each cpu node in device tree, and enable CONFIG_THEAD_CUSTOM_PMU
> > for proper functioning as of this commit.
> >
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > Reviewed-by: Guo Ren <guoren@kernel.org>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > Changes v1 -> v2:
> >   - New patch
> > Changes v2 -> v3:
> >   - Removed m{vendor/arch/imp}id checks in pmu_sbi_setup_irqs()
> > Changes v3 -> v4:
> >   - No change
> > Changes v4 -> v5:
> >   - Include Guo's Reviewed-by
> >   - Let THEAD_CUSTOM_PMU depend on ARCH_THEAD
> > Changes v5 -> v6:
> >   - Include Conor's Reviewed-by
> > Changes v6 -> v7:
> >   - No change
> > ---
> >  arch/riscv/Kconfig.errata            | 13 -------------
> >  arch/riscv/errata/thead/errata.c     | 19 -------------------
> >  arch/riscv/include/asm/errata_list.h | 15 +--------------
> >  arch/riscv/include/asm/hwcap.h       |  1 +
> >  arch/riscv/kernel/cpufeature.c       |  1 +
> >  drivers/perf/Kconfig                 | 13 +++++++++++++
> >  drivers/perf/riscv_pmu_sbi.c         | 19 ++++++++++++++-----
> >  7 files changed, 30 insertions(+), 51 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> > index e2c731cfed8c..0d19f47d1018 100644
> > --- a/arch/riscv/Kconfig.errata
> > +++ b/arch/riscv/Kconfig.errata
> > @@ -86,17 +86,4 @@ config ERRATA_THEAD_CMO
> >
> >           If you don't know what to do here, say "Y".
> >
> > -config ERRATA_THEAD_PMU
> > -       bool "Apply T-Head PMU errata"
> > -       depends on ERRATA_THEAD && RISCV_PMU_SBI
> > -       default y
> > -       help
> > -         The T-Head C9xx cores implement a PMU overflow extension very
> > -         similar to the core SSCOFPMF extension.
> > -
> > -         This will apply the overflow errata to handle the non-standard
> > -         behaviour via the regular SBI PMU driver and interface.
> > -
> > -         If you don't know what to do here, say "Y".
> > -
> >  endmenu # "CPU errata selection"
> > diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead=
/errata.c
> > index 0554ed4bf087..5de5f7209132 100644
> > --- a/arch/riscv/errata/thead/errata.c
> > +++ b/arch/riscv/errata/thead/errata.c
> > @@ -53,22 +53,6 @@ static bool errata_probe_cmo(unsigned int stage,
> >         return true;
> >  }
> >
> > -static bool errata_probe_pmu(unsigned int stage,
> > -                            unsigned long arch_id, unsigned long impid)
> > -{
> > -       if (!IS_ENABLED(CONFIG_ERRATA_THEAD_PMU))
> > -               return false;
> > -
> > -       /* target-c9xx cores report arch_id and impid as 0 */
> > -       if (arch_id !=3D 0 || impid !=3D 0)
> > -               return false;
> > -
> > -       if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
> > -               return false;
> > -
> > -       return true;
> > -}
> > -
> >  static u32 thead_errata_probe(unsigned int stage,
> >                               unsigned long archid, unsigned long impid)
> >  {
> > @@ -80,9 +64,6 @@ static u32 thead_errata_probe(unsigned int stage,
> >         if (errata_probe_cmo(stage, archid, impid))
> >                 cpu_req_errata |=3D BIT(ERRATA_THEAD_CMO);
> >
> > -       if (errata_probe_pmu(stage, archid, impid))
> > -               cpu_req_errata |=3D BIT(ERRATA_THEAD_PMU);
> > -
> >         return cpu_req_errata;
> >  }
> >
> > diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/=
asm/errata_list.h
> > index 4ed21a62158c..9bccc2ba0eb5 100644
> > --- a/arch/riscv/include/asm/errata_list.h
> > +++ b/arch/riscv/include/asm/errata_list.h
> > @@ -25,8 +25,7 @@
> >  #ifdef CONFIG_ERRATA_THEAD
> >  #define        ERRATA_THEAD_PBMT 0
> >  #define        ERRATA_THEAD_CMO 1
> > -#define        ERRATA_THEAD_PMU 2
> > -#define        ERRATA_THEAD_NUMBER 3
> > +#define        ERRATA_THEAD_NUMBER 2
> >  #endif
> >
> >  #ifdef __ASSEMBLY__
> > @@ -147,18 +146,6 @@ asm volatile(ALTERNATIVE_2(                       =
                         \
> >             "r"((unsigned long)(_start) + (_size))                     =
 \
> >         : "a0")
> >
> > -#define THEAD_C9XX_RV_IRQ_PMU                  17
> > -#define THEAD_C9XX_CSR_SCOUNTEROF              0x5c5
> > -
> > -#define ALT_SBI_PMU_OVERFLOW(__ovl)                                   =
 \
> > -asm volatile(ALTERNATIVE(                                             =
 \
> > -       "csrr %0, " __stringify(CSR_SSCOUNTOVF),                       =
 \
> > -       "csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),            =
 \
> > -               THEAD_VENDOR_ID, ERRATA_THEAD_PMU,                     =
 \
> > -               CONFIG_ERRATA_THEAD_PMU)                               =
 \
> > -       : "=3Dr" (__ovl) :                                             =
   \
> > -       : "memory")
> > -
> >  #endif /* __ASSEMBLY__ */
> >
> >  #endif
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hw=
cap.h
> > index 5340f818746b..480f9da7fba7 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -80,6 +80,7 @@
> >  #define RISCV_ISA_EXT_ZFA              71
> >  #define RISCV_ISA_EXT_ZTSO             72
> >  #define RISCV_ISA_EXT_ZACAS            73
> > +#define RISCV_ISA_EXT_XTHEADPMU                74
> >
> >  #define RISCV_ISA_EXT_MAX              128
> >  #define RISCV_ISA_EXT_INVALID          U32_MAX
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index e32591e9da90..4aded5bf8fc3 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -303,6 +303,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D=
 {
> >         __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> >         __RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> >         __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> > +       __RISCV_ISA_EXT_DATA(xtheadpmu, RISCV_ISA_EXT_XTHEADPMU),
> >  };
> >
> >  const size_t riscv_isa_ext_count =3D ARRAY_SIZE(riscv_isa_ext);
> > diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> > index 273d67ecf6d2..6cef15ec7c25 100644
> > --- a/drivers/perf/Kconfig
> > +++ b/drivers/perf/Kconfig
> > @@ -86,6 +86,19 @@ config RISCV_PMU_SBI
> >           full perf feature support i.e. counter overflow, privilege mo=
de
> >           filtering, counter configuration.
> >
> > +config THEAD_CUSTOM_PMU
> > +       bool "T-Head custom PMU support"
> > +       depends on ARCH_THEAD && RISCV_ALTERNATIVE && RISCV_PMU_SBI
> > +       default y
> > +       help
> > +         The T-Head C9xx cores implement a PMU overflow extension very
> > +         similar to the core SSCOFPMF extension.
> > +
> > +         This will patch the overflow CSR and handle the non-standard
> > +         behaviour via the regular SBI PMU driver and interface.
> > +
> > +         If you don't know what to do here, say "Y".
> > +
> >  config ARM_PMU_ACPI
> >         depends on ARM_PMU && ACPI
> >         def_bool y
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > index 2edbc37abadf..31ca79846399 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -20,10 +20,21 @@
> >  #include <linux/cpu_pm.h>
> >  #include <linux/sched/clock.h>
> >
> > -#include <asm/errata_list.h>
> >  #include <asm/sbi.h>
> >  #include <asm/cpufeature.h>
> >
> > +#define THEAD_C9XX_RV_IRQ_PMU          17
> > +#define THEAD_C9XX_CSR_SCOUNTEROF      0x5c5
> > +
> > +#define ALT_SBI_PMU_OVERFLOW(__ovl)                                   =
 \
> > +asm volatile(ALTERNATIVE(                                             =
 \
> > +       "csrr %0, " __stringify(CSR_SSCOUNTOVF),                       =
 \
> > +       "csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),            =
 \
> > +               0, RISCV_ISA_EXT_XTHEADPMU,                            =
 \
> > +               CONFIG_THEAD_CUSTOM_PMU)                               =
 \
> > +       : "=3Dr" (__ovl) :                                             =
   \
> > +       : "memory")
> > +
> >  #define SYSCTL_NO_USER_ACCESS  0
> >  #define SYSCTL_USER_ACCESS     1
> >  #define SYSCTL_LEGACY          2
> > @@ -808,10 +819,8 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pm=
u, struct platform_device *pde
> >         if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
> >                 riscv_pmu_irq_num =3D RV_IRQ_PMU;
> >                 riscv_pmu_use_irq =3D true;
> > -       } else if (IS_ENABLED(CONFIG_ERRATA_THEAD_PMU) &&
> > -                  riscv_cached_mvendorid(0) =3D=3D THEAD_VENDOR_ID &&
> > -                  riscv_cached_marchid(0) =3D=3D 0 &&
> > -                  riscv_cached_mimpid(0) =3D=3D 0) {
> > +       } else if (riscv_isa_extension_available(NULL, XTHEADPMU) &&
> > +                  IS_ENABLED(CONFIG_THEAD_CUSTOM_PMU)) {
> >                 riscv_pmu_irq_num =3D THEAD_C9XX_RV_IRQ_PMU;
> >                 riscv_pmu_use_irq =3D true;
> >         }
> > --
> > 2.34.1
> >
>=20
>=20
> --
> Regards,
> Atish

--Ja0AtvSzsJhuxWGO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaccQwAKCRB4tDGHoIJi
0p9LAP4lKt2fPkjiqgNc9uaPp+mBmBRmTvk2mZYXXudRmZ9KLQEA76er2vGFoSCY
Pk+BW+aC3iayHMkG/y+YBALKLHJc3g8=
=aiVi
-----END PGP SIGNATURE-----

--Ja0AtvSzsJhuxWGO--


--===============5464972558899100522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5464972558899100522==--

