Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9766C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 07:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmF4K75vNMN083PrqI1COO7Nv9j/69PkiMBz83axWBw=; b=rJEqXU3zE+8zmFwPsMABb7aFHz
	EuMjbONuVUU4UQMxxHhb8gyFUyUJeLyMc3tGC57KmEVpE1jPKFQ4VAKUS7ioouWdLI7gwbjG9WNEq
	+QjTG/Z0RXfvWtGIf+q/TZ7K3gy4Npz8w8F/NnKQc73Zt49LV8ApyEbrkMYsl1oEgqoWIGjDvw1ST
	Wz/piohLZRIzvAIXSvujSc+JvO2z1A0qTYmPT8W62kcck0fNQIYdwBRerKUqTTCBsbr5GsgaBisEI
	AYMnClNiQNLuyJJGctKg37BV62RpGUBJsbnE78w8EnBnHmyfapf8HMbvaFr7YChc9VVwnUtCX5hcB
	q9GNQ2nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNUPJ-00EmOa-Pe; Thu, 02 Feb 2023 07:53:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNUPA-00EmHo-WC; Thu, 02 Feb 2023 07:53:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675324392; x=1706860392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p/zYRQXtmX1Ll4pA6xfxwM9O0U6tjnwz5o+IJ7OH76E=;
  b=aWhbbUU5IVl2XlIJSy8IXx/FTs+nXqdw6B8ByUHkb3YmpAmllXlIw2/7
   Zk37QSO1MILP4wFSR0sxacDPGjdTD2/jAABAFbSZkvY0ieweA8bbPyJv8
   etS29Nf5dsdrFKFYQ8N2PmTp183D05voGbCOnAx4P8mRADlYFUhtl0y3x
   bY29HfZSoELZzeL+x0y5ZA84rji85GvQwX8oAxfkr1aDNHfXIvekZV7/B
   wYnzvMi36J2OA/DuGmjmlb3zaR537l2d1zB508ag26asG+tnl5WikH8sD
   cnwXDyOOpggiQ+i/ypm1/psa3/2Jemmv0oWZ64j+FsnEzl1AlZNaWjDiv
   A==;
X-IronPort-AV: E=Sophos;i="5.97,266,1669100400"; 
   d="asc'?scan'208";a="198575674"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Feb 2023 00:53:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 00:53:04 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 2 Feb 2023 00:53:02 -0700
Date: Thu, 2 Feb 2023 07:52:37 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Atish Patra <atishp@rivosinc.com>
CC: <linux-kernel@vger.kernel.org>, Anup Patel <anup@brainfault.org>, Albert
 Ou <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>, Atish
 Patra <atishp@atishpatra.org>, Eric Lin <eric.lin@sifive.com>, Guo Ren
	<guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 08/14] RISC-V: KVM: Add SBI PMU extension support
Message-ID: <Y9trxX9hj6/pi1b1@wendy>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-9-atishp@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230201231250.3806412-9-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_235313_166178_78DF58AA 
X-CRM114-Status: GOOD (  26.69  )
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
Content-Type: multipart/mixed; boundary="===============0487329883351004393=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0487329883351004393==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O/gnr0SEjao1pV0b"
Content-Disposition: inline

--O/gnr0SEjao1pV0b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Atish,

On Wed, Feb 01, 2023 at 03:12:44PM -0800, Atish Patra wrote:
> SBI PMU extension allows KVM guests to configure/start/stop/query about
> the PMU counters in virtualized enviornment as well.
>=20
> In order to allow that, KVM implements the entire SBI PMU extension.
>=20
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Could complaints from CI for you:

+      1 ../arch/riscv/kvm/vcpu_sbi_pmu.c:73:15: warning: no previous proto=
type for 'kvm_sbi_ext_pmu_probe' [-Wmissing-prototypes]
+      1 ../arch/riscv/kvm/vcpu_sbi_pmu.c:73:15: warning: symbol 'kvm_sbi_e=
xt_pmu_probe' was not declared. Should it be static?
+      1 ../arch/riscv/kvm/vcpu_sbi_pmu.c:80:37: warning: symbol 'vcpu_sbi_=
ext_pmu' was not declared. Should it be static?

Thanks,
Conor.

> ---
>  arch/riscv/kvm/Makefile       |  2 +-
>  arch/riscv/kvm/vcpu_sbi.c     | 11 +++++
>  arch/riscv/kvm/vcpu_sbi_pmu.c | 85 +++++++++++++++++++++++++++++++++++
>  3 files changed, 97 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c
>=20
> diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> index 5de1053..278e97c 100644
> --- a/arch/riscv/kvm/Makefile
> +++ b/arch/riscv/kvm/Makefile
> @@ -25,4 +25,4 @@ kvm-y +=3D vcpu_sbi_base.o
>  kvm-y +=3D vcpu_sbi_replace.o
>  kvm-y +=3D vcpu_sbi_hsm.o
>  kvm-y +=3D vcpu_timer.o
> -kvm-$(CONFIG_RISCV_PMU_SBI) +=3D vcpu_pmu.o
> +kvm-$(CONFIG_RISCV_PMU_SBI) +=3D vcpu_pmu.o vcpu_sbi_pmu.o
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index fe2897e..15fde15 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -20,6 +20,16 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ex=
t_v01 =3D {
>  };
>  #endif
> =20
> +#ifdef CONFIG_RISCV_PMU_SBI
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
> +#else
> +static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu =3D {
> +	.extid_start =3D -1UL,
> +	.extid_end =3D -1UL,
> +	.handler =3D NULL,
> +};
> +#endif
> +
>  static const struct kvm_vcpu_sbi_extension *sbi_ext[] =3D {
>  	&vcpu_sbi_ext_v01,
>  	&vcpu_sbi_ext_base,
> @@ -28,6 +38,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] =
=3D {
>  	&vcpu_sbi_ext_rfence,
>  	&vcpu_sbi_ext_srst,
>  	&vcpu_sbi_ext_hsm,
> +	&vcpu_sbi_ext_pmu,
>  	&vcpu_sbi_ext_experimental,
>  	&vcpu_sbi_ext_vendor,
>  };
> diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> new file mode 100644
> index 0000000..e028b0a
> --- /dev/null
> +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 Rivos Inc
> + *
> + * Authors:
> + *     Atish Patra <atishp@rivosinc.com>
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/kvm_host.h>
> +#include <asm/csr.h>
> +#include <asm/sbi.h>
> +#include <asm/kvm_vcpu_sbi.h>
> +
> +static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run=
 *run,
> +				   struct kvm_vcpu_sbi_return *retdata)
> +{
> +	int ret =3D 0;
> +	struct kvm_cpu_context *cp =3D &vcpu->arch.guest_context;
> +	struct kvm_pmu *kvpmu =3D vcpu_to_pmu(vcpu);
> +	unsigned long funcid =3D cp->a6;
> +	uint64_t temp;
> +
> +	/* Return not supported if PMU is not initialized */
> +	if (!kvpmu->init_done)
> +		return -EINVAL;
> +
> +	switch (funcid) {
> +	case SBI_EXT_PMU_NUM_COUNTERS:
> +		ret =3D kvm_riscv_vcpu_pmu_num_ctrs(vcpu, retdata);
> +		break;
> +	case SBI_EXT_PMU_COUNTER_GET_INFO:
> +		ret =3D kvm_riscv_vcpu_pmu_ctr_info(vcpu, cp->a0, retdata);
> +		break;
> +	case SBI_EXT_PMU_COUNTER_CFG_MATCH:
> +#if defined(CONFIG_32BIT)
> +		temp =3D ((uint64_t)cp->a5 << 32) | cp->a4;
> +#else
> +		temp =3D cp->a4;
> +#endif
> +		/*
> +		 * This can fail if perf core framework fails to create an event.
> +		 * Forward the error to the user space because its an error happened
> +		 * within host kernel. The other option would be convert this to
> +		 * an SBI error and forward to the guest.
> +		 */
> +		ret =3D kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1,
> +						       cp->a2, cp->a3, temp, retdata);
> +		break;
> +	case SBI_EXT_PMU_COUNTER_START:
> +#if defined(CONFIG_32BIT)
> +		temp =3D ((uint64_t)cp->a4 << 32) | cp->a3;
> +#else
> +		temp =3D cp->a3;
> +#endif
> +		ret =3D kvm_riscv_vcpu_pmu_ctr_start(vcpu, cp->a0, cp->a1, cp->a2,
> +						   temp, retdata);
> +		break;
> +	case SBI_EXT_PMU_COUNTER_STOP:
> +		ret =3D kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2, retd=
ata);
> +		break;
> +	case SBI_EXT_PMU_COUNTER_FW_READ:
> +		ret =3D kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
> +		break;
> +	default:
> +		retdata->err_val =3D SBI_ERR_NOT_SUPPORTED;
> +	}
> +
> +	return ret;
> +}
> +
> +unsigned long kvm_sbi_ext_pmu_probe(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_pmu *kvpmu =3D vcpu_to_pmu(vcpu);
> +
> +	return kvpmu->init_done;
> +}
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu =3D {
> +	.extid_start =3D SBI_EXT_PMU,
> +	.extid_end =3D SBI_EXT_PMU,
> +	.handler =3D kvm_sbi_ext_pmu_handler,
> +	.probe =3D kvm_sbi_ext_pmu_probe,
> +};
> --=20
> 2.25.1
>=20
>=20

--O/gnr0SEjao1pV0b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9trtwAKCRB4tDGHoIJi
0r9wAQCU2XfX8lMA7q7V3L+bs2Eqe7Zxk1taHg1wI55aDI6a+gD7BHNfxb8G8yn3
DDFv78dpbG9wXOitf7rHFPZJD8mq0wo=
=cGWs
-----END PGP SIGNATURE-----

--O/gnr0SEjao1pV0b--


--===============0487329883351004393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0487329883351004393==--

