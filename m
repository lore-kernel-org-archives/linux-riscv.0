Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F0AC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 11:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4GXA+zd/f7/ztu8kznKyzdixpCQFczRTyyA61KY80Y=; b=vXsNlkIVwiilXyMIPF608zso0G
	V4gp50ntGLKEpGHhZ06uE3qKSTAghhIQYLrG0nL2AVkWMlM00iAXtRIZii7VtKSs9BKVki/a7gwEn
	f4C/dP9ovshmOxtCJWaTWZJHyOYu1Lf6DEa5Bmtj1SrskTQX6gdF4/Pbjy97WUAsAfyvrgDxozGDZ
	WVxoLA/2dvnhFVl0vTlYHNqZk6xWGTdbjxCqkkbvu5o2kiiDWVsrNfmF58t1bMsmS0d3hOAbKZin7
	7whfQ8FgmPcgqhwWtsIXZ+byjX3J/njbEu0pwwV1keWOT6o46GIT5MwzuciQZnnvZ+HTKcB6SpJNG
	sDtSq9jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXy5-00Fdjw-QO; Thu, 02 Feb 2023 11:41:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXy2-00Fdii-9E; Thu, 02 Feb 2023 11:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675338085; x=1706874085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xAPwScE8MGvSRWPknoRnPVEE/EEIeDB2nFQYmmKKuhs=;
  b=suxFV1GpgBaRU5qvIaCvSl4gaccO4jvxdTqiORYtjDtAAkkSIIgsY4F/
   26g4vXZkxPlMcW+EbzeLdZjW00oXiCbckyknqhQAgzyjdMvAdyWhk7zSv
   HMlMpB+MVlzL0ELGGuYkXWhv90JMoqO7O+hM5o3Bu9DMx511L40Ijp9t2
   y584PEPVws45xc7am3r5UGsokTyl71VyrypAj7H2mMpxCWEwOmJMASkpe
   exfKFxC1ca1Wbka6OvNfNYcBZ475MHWaiKEWCvvs30KJ5JrwBz2/n+719
   Agt2lybMMXJLSJl9Xvu0yN8LQiZoCB805Rvs6OzVYhxrQb+F41BzCLo++
   A==;
X-IronPort-AV: E=Sophos;i="5.97,267,1669100400"; 
   d="asc'?scan'208";a="210309876"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Feb 2023 04:41:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 04:41:25 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 2 Feb 2023 04:41:22 -0700
Date: Thu, 2 Feb 2023 11:40:58 +0000
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
Subject: Re: [PATCH v4 13/14] RISC-V: KVM: Support firmware events
Message-ID: <Y9uhSoOvodeQRO6G@wendy>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-14-atishp@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230201231250.3806412-14-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_034126_347117_458A1DFF 
X-CRM114-Status: GOOD (  16.18  )
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
Content-Type: multipart/mixed; boundary="===============2575205773119424745=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2575205773119424745==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tlNBWfimPX/S/xVT"
Content-Disposition: inline

--tlNBWfimPX/S/xVT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Atish,

On Wed, Feb 01, 2023 at 03:12:49PM -0800, Atish Patra wrote:
> SBI PMU extension defines a set of firmware events which can provide
> useful information to guests about the number of SBI calls. As
> hypervisor implements the SBI PMU extension, these firmware events
> correspond to ecall invocations between VS->HS mode. All other firmware
> events will always report zero if monitored as KVM doesn't implement them.
>=20
> This patch adds all the infrastructure required to support firmware
> events.
>=20
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 473ad80..dd16e60 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -202,12 +202,15 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsi=
gned long cidx,
>  	struct kvm_pmu *kvpmu =3D vcpu_to_pmu(vcpu);
>  	struct kvm_pmc *pmc;
>  	u64 enabled, running;
> +	int fevent_code;
> =20
>  	pmc =3D &kvpmu->pmc[cidx];
> -	if (!pmc->perf_event)
> -		return -EINVAL;
> =20
> -	pmc->counter_val +=3D perf_event_read_value(pmc->perf_event, &enabled, =
&running);
> +	if (pmc->cinfo.type =3D=3D SBI_PMU_CTR_TYPE_FW) {
> +		fevent_code =3D get_event_code(pmc->event_idx);
> +		pmc->counter_val =3D kvpmu->fw_event[fevent_code].value;
> +	} else if (pmc->perf_event)
> +		pmc->counter_val +=3D perf_event_read_value(pmc->perf_event, &enabled,=
 &running);

Here, and elsewhere, all branches of an if/else must use {} if one
branch needs them.
Patches 4 & 12 have similar issues, which checkpatch in the patchwork
CI stuff also complained about.

Thanks,
Conor.


--tlNBWfimPX/S/xVT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9uhSQAKCRB4tDGHoIJi
0uqpAP9x4VGfcJGp96G2q7mYM1WaLkLQmijd3P41i9ItrDKGswD/ZmRRoH9XvuNl
IoucvfrlrOXTic9oOkpunlmQVDzl6Aw=
=V4EF
-----END PGP SIGNATURE-----

--tlNBWfimPX/S/xVT--


--===============2575205773119424745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2575205773119424745==--

