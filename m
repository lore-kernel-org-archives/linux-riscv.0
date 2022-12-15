Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4592C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 20:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOuokxCHI3Efw6vF3CMwn+9MwZmreoduS365qsvhgKY=; b=tydp5eI+Ds4GLt7oeoSP3t35Bd
	y7IVXPGDNPuj6SGRBSuuVyjf59pEFN9dGUuv7XGJneIfvQq3/rNU4epFL29f9jiVaPgZjcufHASos
	uMg+eHC4R88Rlhqf/9VR3t8YNhjB3qEgxUsTI1GbPQRYO/ylLSIqrLndzCUfx1225rhdE/is8nU8h
	g7rpMXnv6RUw4cddQaTPNxio7IESe3ZgyaOarsPSOJeW+k+VgSmaxsqFA+Mb8dS2Ofu4drrt15JhF
	WrHv9IrUVLzT9SJpUF+/3hyC3UJPIMayQ7IQvgEeZhMsA1gI/CU9xtHkB+NLlXl0EW6PzqoP8WkLf
	I8LDH7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5ugE-00BCzr-7P; Thu, 15 Dec 2022 20:18:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5ugA-00BCyg-UL; Thu, 15 Dec 2022 20:18:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 66704B81B1B;
	Thu, 15 Dec 2022 20:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3BBC433F2;
	Thu, 15 Dec 2022 20:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671135484;
	bh=oel0ZlOiiQOwqlbEX/I6OlGQeXzpFhRh/Jy7Mv8nTSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EdgEqLCxeDXAXzybpNlP+ffQ5ItI5gPQ7CTUCYBo8RvvtRESOQPBALRL+vW1IhqGq
	 BcZmyxEvj93MuMP9mlwbZPusjeAe/v/zLGehtYlDTIuxVTX01PGeaGOZY2+z1I85LG
	 m2h18sYLJRI/iaazBkEwL1ZsU8wM9jjwylN1zJTv9GeSurm08lFsQQroHPuzw2HUqB
	 1W+cUcwr8AwgyC4B0SmqQlB29+nAVpLTWym2WiveICJE5zAe4KNghI8cyHytPT6neX
	 9UztJTVoSwuB07T3lj+gERoqWbkO6IicFX0Ri1klvT1FE8TEbZRf/zukRFtKaaErM7
	 lZNGn8IQTaqcg==
Date: Thu, 15 Dec 2022 20:17:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Eric Lin <eric.lin@sifive.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 05/11] RISC-V: KVM: Improve privilege mode filtering
 for perf
Message-ID: <Y5uA8CEoTKzIGoSy@dizzy>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
 <20221215170046.2010255-6-atishp@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20221215170046.2010255-6-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_121807_291841_AB60BAB7 
X-CRM114-Status: GOOD (  26.33  )
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
Content-Type: multipart/mixed; boundary="===============2589724714842337810=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2589724714842337810==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Kh96vCh7mb1vJCOA"
Content-Disposition: inline


--Kh96vCh7mb1vJCOA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Atish,

On Thu, Dec 15, 2022 at 09:00:40AM -0800, Atish Patra wrote:
> RISC-V: KVM: Improve privilege mode filtering for perf

I almost marked this as "not applicable" in patchwork as I was mislead
by the $subject. I know our perf driver is a real mixed bag, but should
it not be something more like:
"perf: RISC-V: Improve privilege mode filtering for KVM"?
It was only when I noticed that the rest of the series had been marked
as "Handled Elsewhere" that I realised that this must not be a KVM patch
;)

Thanks,
Conor

> Currently, the host driver doesn't have any method to identify if the
> requested perf event is from kvm or bare metal. As KVM runs in HS
> mode, there are no separate hypervisor privilege mode to distinguish
> between the attributes for guest/host.
>=20
> Improve the privilege mode filtering by using the event specific
> config1 field.
>=20
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c   | 27 ++++++++++++++++++++++-----
>  include/linux/perf/riscv_pmu.h |  2 ++
>  2 files changed, 24 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 65d4aa4..df795b7 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -298,6 +298,27 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *n=
um_hw_ctr)
>  }
>  EXPORT_SYMBOL(riscv_pmu_get_hpm_info);
> =20
> +static unsigned long pmu_sbi_get_filter_flags(struct perf_event *event)
> +{
> +	unsigned long cflags =3D 0;
> +	bool guest_events =3D false;
> +
> +	if (event->attr.config1 & RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS)
> +		guest_events =3D true;
> +	if (event->attr.exclude_kernel)
> +		cflags |=3D guest_events ? SBI_PMU_CFG_FLAG_SET_VSINH : SBI_PMU_CFG_FL=
AG_SET_SINH;
> +	if (event->attr.exclude_user)
> +		cflags |=3D guest_events ? SBI_PMU_CFG_FLAG_SET_VUINH : SBI_PMU_CFG_FL=
AG_SET_UINH;
> +	if (guest_events && event->attr.exclude_hv)
> +		cflags |=3D SBI_PMU_CFG_FLAG_SET_SINH;
> +	if (event->attr.exclude_host)
> +		cflags |=3D SBI_PMU_CFG_FLAG_SET_UINH | SBI_PMU_CFG_FLAG_SET_SINH;
> +	if (event->attr.exclude_guest)
> +		cflags |=3D SBI_PMU_CFG_FLAG_SET_VSINH | SBI_PMU_CFG_FLAG_SET_VUINH;
> +
> +	return cflags;
> +}
> +
>  static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>  {
>  	struct hw_perf_event *hwc =3D &event->hw;
> @@ -308,11 +329,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *ev=
ent)
>  	uint64_t cbase =3D 0;
>  	unsigned long cflags =3D 0;
> =20
> -	if (event->attr.exclude_kernel)
> -		cflags |=3D SBI_PMU_CFG_FLAG_SET_SINH;
> -	if (event->attr.exclude_user)
> -		cflags |=3D SBI_PMU_CFG_FLAG_SET_UINH;
> -
> +	cflags =3D pmu_sbi_get_filter_flags(event);
>  	/* retrieve the available counter index */
>  #if defined(CONFIG_32BIT)
>  	ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase,
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pm=
u.h
> index a1c3f77..1c42146 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -26,6 +26,8 @@
> =20
>  #define RISCV_PMU_STOP_FLAG_RESET 1
> =20
> +#define RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS 0x1
> +
>  struct cpu_hw_events {
>  	/* currently enabled events */
>  	int			n_events;
> --=20
> 2.25.1
>=20
>=20

--Kh96vCh7mb1vJCOA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY5uA5wAKCRB4tDGHoIJi
0pnAAP9279BG2bKNaby4m7HVZ0iqkvu0RtJ6SIQ0JPGpdv+p1QEAtd4qbzkPg3u6
Mw7SPMVU7YEk3w/xjU2fqUVQ1eTkxQU=
=A5xN
-----END PGP SIGNATURE-----

--Kh96vCh7mb1vJCOA--


--===============2589724714842337810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2589724714842337810==--

