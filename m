Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D013FC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 13:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3l9ocyeQsV362Y+AwbgYUKHLQtO0G0kEhYCUpRNRP4=; b=iwwU/Z5s3a2dTiQdOUH9z/iNwW
	e2sEIfSUPMAilU6zC/9HkK5OYLCb7TUQCTRdGqgG8rKxk4WNqX2urK1kWMPi1iEX5d7EM/M4mXPx9
	aJ/tgo4lRiuOemPIoINGX1/YZ8vBLlYZyqi3+1+WD6u7p5bSBwq7h80UYItuerd2kDXQjrXsCeuo9
	qtgzhRIG9Cen20HmLCZGlwAwZ0bfEeAQu+j/nASNiMgMb9srYgtZhKQyk3Yr+7uO4hV1dxMZR6CHB
	Egfe4VhQTsPpvRaKDRzbZ+rlopS0anXXlE+zo1XPllW11nyqP6XkrhJLlA+zyYSrkeaFQmAINh3Nd
	/iNg5dag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBE5I-00Cs6C-2U;
	Thu, 07 Dec 2023 13:06:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBE5D-00Cs57-2Z;
	Thu, 07 Dec 2023 13:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701954388; x=1733490388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2WEjfcI2m+oq1ciSqCuc34s2aUTsgkGBvyLJkB6HBO0=;
  b=aqImeZ1NfMfesPfNpL7EHhxFbDXPnLkaOYizT4iE/8957JSW7P68zZ+7
   GCiYB4GQGW8bGwVRHWkESH1gKejGCZqgCjeqega6YfBF9sQDBG4PfHDNE
   ClrQGetCSdJSMDLxOSSZMwTm0UdnIXG6r/Pkst1JbIYtpOFUludxreolj
   jIB/3KvL7pvbSEFadV4zNLJxD6aGnd19NrpjlETBu8lFoSuZB1ePbiZ3p
   E7dxbU0X0jkcz/ENrqOgnDkoTsWdGAjRbMJw+8xTb9x9TgAFhkjQjKWz1
   12MtXNFH3VtOptBH+DfnrIHRIKpMuwGU/1SvQAx1T/Lzcpkk58J8lvoPM
   w==;
X-CSE-ConnectionGUID: P/ypik10Sp+WkZ/8sFmEdA==
X-CSE-MsgGUID: qUAya2P+REiDwwvEHGBUhw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="asc'?scan'208";a="12931036"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Dec 2023 06:06:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 06:06:15 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Dec 2023 06:06:12 -0700
Date: Thu, 7 Dec 2023 13:05:42 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: Re: [RFC 6/9] drivers/perf: riscv: Implement SBI PMU snapshot
 function
Message-ID: <20231207-daycare-manager-2f4817171422@wendy>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
 <20231205024310.1593100-7-atishp@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231205024310.1593100-7-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_050627_969710_DDB24838 
X-CRM114-Status: GOOD (  44.94  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============0991003134012996202=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0991003134012996202==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cJ3G311iH0naEK6r"
Content-Disposition: inline

--cJ3G311iH0naEK6r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Atish,

On Mon, Dec 04, 2023 at 06:43:07PM -0800, Atish Patra wrote:
> SBI v2.0 SBI introduced PMU snapshot feature which adds the following
> features.
>=20
> 1. Read counter values directly from the shared memory instead of
> csr read.
> 2. Start multiple counters with initial values with one SBI call.
>=20
> These functionalities optimizes the number of traps to the higher
> privilege mode. If the kernel is in VS mode while the hypervisor
> deploy trap & emulate method, this would minimize all the hpmcounter
> CSR read traps. If the kernel is running in S-mode, the benfits
> reduced to CSR latency vs DRAM/cache latency as there is no trap
> involved while accessing the hpmcounter CSRs.
>=20
> In both modes, it does saves the number of ecalls while starting
> multiple counter together with an initial values. This is a likely
> scenario if multiple counters overflow at the same time.
>=20
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu.c       |   1 +
>  drivers/perf/riscv_pmu_sbi.c   | 203 ++++++++++++++++++++++++++++++---
>  include/linux/perf/riscv_pmu.h |   6 +
>  3 files changed, 197 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> index 0dda70e1ef90..5b57acb770d3 100644
> --- a/drivers/perf/riscv_pmu.c
> +++ b/drivers/perf/riscv_pmu.c
> @@ -412,6 +412,7 @@ struct riscv_pmu *riscv_pmu_alloc(void)
>  		cpuc->n_events =3D 0;
>  		for (i =3D 0; i < RISCV_MAX_COUNTERS; i++)
>  			cpuc->events[i] =3D NULL;
> +		cpuc->snapshot_addr =3D NULL;
>  	}
>  	pmu->pmu =3D (struct pmu) {
>  		.event_init	=3D riscv_pmu_event_init,
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 1c9049e6b574..1b8b6de63b69 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -36,6 +36,9 @@ PMU_FORMAT_ATTR(event, "config:0-47");
>  PMU_FORMAT_ATTR(firmware, "config:63");
> =20
>  static bool sbi_v2_available;
> +static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
> +#define sbi_pmu_snapshot_available() \
> +	static_branch_unlikely(&sbi_pmu_snapshot_available)
> =20
>  static struct attribute *riscv_arch_formats_attr[] =3D {
>  	&format_attr_event.attr,
> @@ -485,14 +488,101 @@ static int pmu_sbi_event_map(struct perf_event *ev=
ent, u64 *econfig)
>  	return ret;
>  }
> =20
> +static void pmu_sbi_snapshot_free(struct riscv_pmu *pmu)
> +{
> +	int cpu;

> +	struct cpu_hw_events *cpu_hw_evt;

This is only used inside the scope of the for loop.

> +
> +	for_each_possible_cpu(cpu) {
> +		cpu_hw_evt =3D per_cpu_ptr(pmu->hw_events, cpu);
> +		if (!cpu_hw_evt->snapshot_addr)
> +			continue;

Could you add a blank line here please?

> +		free_page((unsigned long)cpu_hw_evt->snapshot_addr);
> +		cpu_hw_evt->snapshot_addr =3D NULL;
> +		cpu_hw_evt->snapshot_addr_phys =3D 0;

Why do these need to be explicitly zeroed?

> +	}
> +}
> +
> +static int pmu_sbi_snapshot_alloc(struct riscv_pmu *pmu)
> +{
> +	int cpu;

> +	struct page *snapshot_page;
> +	struct cpu_hw_events *cpu_hw_evt;

Same here re scope

> +
> +	for_each_possible_cpu(cpu) {
> +		cpu_hw_evt =3D per_cpu_ptr(pmu->hw_events, cpu);
> +		if (cpu_hw_evt->snapshot_addr)
> +			continue;

Same here re blank line

> +		snapshot_page =3D alloc_page(GFP_ATOMIC | __GFP_ZERO);
> +		if (!snapshot_page) {
> +			pmu_sbi_snapshot_free(pmu);
> +			return -ENOMEM;
> +		}
> +		cpu_hw_evt->snapshot_addr =3D page_to_virt(snapshot_page);
> +		cpu_hw_evt->snapshot_addr_phys =3D page_to_phys(snapshot_page);
> +	}
> +
> +	return 0;
> +}
> +
> +static void pmu_sbi_snapshot_disable(void)
> +{
> +	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM, -1,
> +		  -1, 0, 0, 0, 0);
> +}
> +
> +static int pmu_sbi_snapshot_setup(struct riscv_pmu *pmu, int cpu)
> +{
> +	struct cpu_hw_events *cpu_hw_evt;
> +	struct sbiret ret =3D {0};
> +	int rc;
> +
> +	cpu_hw_evt =3D per_cpu_ptr(pmu->hw_events, cpu);
> +	if (!cpu_hw_evt->snapshot_addr_phys)
> +		return -EINVAL;
> +
> +	if (cpu_hw_evt->snapshot_set_done)
> +		return 0;
> +
> +#if defined(CONFIG_32BIT)

Why does this need to be an `#if defined()`? Does the code not compile
if you use IS_ENABLED()?

> +	ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM, cpu_hw_e=
vt->snapshot_addr_phys,
> +		       (u64)(cpu_hw_evt->snapshot_addr_phys) >> 32, 0, 0, 0, 0);
> +#else
> +	ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM, cpu_hw_e=
vt->snapshot_addr_phys,
> +			0, 0, 0, 0, 0);
> +#endif

> +	/* Free up the snapshot area memory and fall back to default SBI */

What does "fall back to the default SBI mean"? SBI is an interface so I
don't understand what it means in this context. Secondly,=20
> +	if (ret.error) {
> +		if (ret.error !=3D SBI_ERR_NOT_SUPPORTED)
> +			pr_warn("%s: pmu snapshot setup failed with error %ld\n", __func__,
> +				ret.error);

Why is the function relevant here? Is the error message in-and-of-itself
not sufficient here? Where else would one be setting up the snapshots
other than the setup function?

> +		rc =3D sbi_err_map_linux_errno(ret.error);

> +		if (rc)
> +			return rc;

Is it even possible for !rc at this point? You've already checked that
ret.error is non zero, so this just becomes
`return sbi_err_map_linux_errno(ret.error);`?

> +	}
> +
> +	cpu_hw_evt->snapshot_set_done =3D true;
> +
> +	return 0;
> +}
> +
>  static u64 pmu_sbi_ctr_read(struct perf_event *event)
>  {
>  	struct hw_perf_event *hwc =3D &event->hw;
>  	int idx =3D hwc->idx;
>  	struct sbiret ret;
>  	u64 val =3D 0;
> +	struct riscv_pmu *pmu =3D to_riscv_pmu(event->pmu);
> +	struct cpu_hw_events *cpu_hw_evt =3D this_cpu_ptr(pmu->hw_events);
> +	struct riscv_pmu_snapshot_data *sdata =3D cpu_hw_evt->snapshot_addr;
>  	union sbi_pmu_ctr_info info =3D pmu_ctr_list[idx];
> =20
> +	/* Read the value from the shared memory directly */

Statement of the obvious, no?

> +	if (sbi_pmu_snapshot_available()) {
> +		val =3D sdata->ctr_values[idx];
> +		goto done;

s/goto done/return val/
There's no cleanup to be done here, what purpose does the goto serve?

> +	}
> +
>  	if (pmu_sbi_is_fw_event(event)) {
>  		ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
>  				hwc->idx, 0, 0, 0, 0, 0);
> @@ -512,6 +602,7 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
>  			val =3D ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 31 | val;
>  	}
> =20
> +done:
>  	return val;
>  }
> =20
> @@ -539,6 +630,7 @@ static void pmu_sbi_ctr_start(struct perf_event *even=
t, u64 ival)
>  	struct hw_perf_event *hwc =3D &event->hw;
>  	unsigned long flag =3D SBI_PMU_START_FLAG_SET_INIT_VALUE;
> =20
> +	/* There is no benefit setting SNAPSHOT FLAG for a single counter */
>  #if defined(CONFIG_32BIT)
>  	ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, hwc->idx,
>  			1, flag, ival, ival >> 32, 0);
> @@ -559,16 +651,29 @@ static void pmu_sbi_ctr_stop(struct perf_event *eve=
nt, unsigned long flag)
>  {
>  	struct sbiret ret;
>  	struct hw_perf_event *hwc =3D &event->hw;
> +	struct riscv_pmu *pmu =3D to_riscv_pmu(event->pmu);
> +	struct cpu_hw_events *cpu_hw_evt =3D this_cpu_ptr(pmu->hw_events);
> +	struct riscv_pmu_snapshot_data *sdata =3D cpu_hw_evt->snapshot_addr;
> =20
>  	if ((hwc->flags & PERF_EVENT_FLAG_USER_ACCESS) &&
>  	    (hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT))
>  		pmu_sbi_reset_scounteren((void *)event);
> =20
> +	if (sbi_pmu_snapshot_available())
> +		flag |=3D SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT;
> +
>  	ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, hwc->idx, 1, f=
lag, 0, 0, 0);
> -	if (ret.error && (ret.error !=3D SBI_ERR_ALREADY_STOPPED) &&
> -		flag !=3D SBI_PMU_STOP_FLAG_RESET)
> +	if (!ret.error && sbi_pmu_snapshot_available()) {

> +		/* Snapshot is taken relative to the counter idx base. Apply a fixup. =
*/
> +		if (hwc->idx > 0) {
> +			sdata->ctr_values[hwc->idx] =3D sdata->ctr_values[0];
> +			sdata->ctr_values[0] =3D 0;

Why is this being zeroed in this manner? Why is zeroing it not required
if hwc->idx =3D=3D 0? You've got a comment there that could probably do with
elaboration.

> +		}
> +	} else if (ret.error && (ret.error !=3D SBI_ERR_ALREADY_STOPPED) &&
> +		flag !=3D SBI_PMU_STOP_FLAG_RESET) {
>  		pr_err("Stopping counter idx %d failed with error %d\n",
>  			hwc->idx, sbi_err_map_linux_errno(ret.error));
> +	}
>  }
> =20
>  static int pmu_sbi_find_num_ctrs(void)
> @@ -626,10 +731,14 @@ static inline void pmu_sbi_stop_all(struct riscv_pm=
u *pmu)
>  static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
>  {
>  	struct cpu_hw_events *cpu_hw_evt =3D this_cpu_ptr(pmu->hw_events);
> +	unsigned long flag =3D 0;
> +
> +	if (sbi_pmu_snapshot_available())
> +		flag =3D SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT;
> =20
>  	/* No need to check the error here as we can't do anything about the er=
ror */
>  	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, 0,
> -		  cpu_hw_evt->used_hw_ctrs[0], 0, 0, 0, 0);
> +		  cpu_hw_evt->used_hw_ctrs[0], flag, 0, 0, 0);
>  }
> =20
>  /*
> @@ -638,11 +747,10 @@ static inline void pmu_sbi_stop_hw_ctrs(struct risc=
v_pmu *pmu)
>   * while the overflowed counters need to be started with updated initial=
ization
>   * value.
>   */
> -static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
> -					       unsigned long ctr_ovf_mask)
> +static noinline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cp=
u_hw_evt,
> +						   unsigned long ctr_ovf_mask)
>  {
>  	int idx =3D 0;
> -	struct cpu_hw_events *cpu_hw_evt =3D this_cpu_ptr(pmu->hw_events);
>  	struct perf_event *event;
>  	unsigned long flag =3D SBI_PMU_START_FLAG_SET_INIT_VALUE;
>  	unsigned long ctr_start_mask =3D 0;
> @@ -677,6 +785,49 @@ static inline void pmu_sbi_start_overflow_mask(struc=
t riscv_pmu *pmu,
>  	}
>  }
> =20
> +static noinline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_event=
s *cpu_hw_evt,
> +						   unsigned long ctr_ovf_mask)
> +{
> +	int idx =3D 0;
> +	struct perf_event *event;
> +	unsigned long flag =3D SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT;
> +	uint64_t max_period;
> +	struct hw_perf_event *hwc;
> +	u64 init_val =3D 0;
> +	unsigned long ctr_start_mask =3D 0;
> +	struct riscv_pmu_snapshot_data *sdata =3D cpu_hw_evt->snapshot_addr;
> +
> +	for_each_set_bit(idx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS) {
> +		if (ctr_ovf_mask & (1 << idx)) {
> +			event =3D cpu_hw_evt->events[idx];
> +			hwc =3D &event->hw;
> +			max_period =3D riscv_pmu_ctr_get_width_mask(event);
> +			init_val =3D local64_read(&hwc->prev_count) & max_period;
> +			sdata->ctr_values[idx] =3D init_val;
> +		}
> +		/* We donot need to update the non-overflow counters the previous

		/*
		 * We don't need to update the non-overflow counters as the previous


> +		 * value should have been there already.
> +		 */
> +	}
> +
> +	ctr_start_mask =3D cpu_hw_evt->used_hw_ctrs[0];
> +
> +	/* Start all the counters in a single shot */
> +	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, 0, ctr_start_mask,
> +		  flag, 0, 0, 0);
> +}
> +
> +static void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
> +					unsigned long ctr_ovf_mask)
> +{
> +	struct cpu_hw_events *cpu_hw_evt =3D this_cpu_ptr(pmu->hw_events);
> +
> +	if (sbi_pmu_snapshot_available())
> +		pmu_sbi_start_ovf_ctrs_snapshot(cpu_hw_evt, ctr_ovf_mask);
> +	else
> +		pmu_sbi_start_ovf_ctrs_sbi(cpu_hw_evt, ctr_ovf_mask);
> +}
> +
>  static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
>  {
>  	struct perf_sample_data data;
> @@ -690,6 +841,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void =
*dev)
>  	unsigned long overflowed_ctrs =3D 0;
>  	struct cpu_hw_events *cpu_hw_evt =3D dev;
>  	u64 start_clock =3D sched_clock();
> +	struct riscv_pmu_snapshot_data *sdata =3D cpu_hw_evt->snapshot_addr;
> =20
>  	if (WARN_ON_ONCE(!cpu_hw_evt))
>  		return IRQ_NONE;
> @@ -711,8 +863,10 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void=
 *dev)
>  	pmu_sbi_stop_hw_ctrs(pmu);
> =20
>  	/* Overflow status register should only be read after counter are stopp=
ed */
> -	ALT_SBI_PMU_OVERFLOW(overflow);
> -
> +	if (sbi_pmu_snapshot_available())
> +		overflow =3D sdata->ctr_overflow_mask;
> +	else
> +		ALT_SBI_PMU_OVERFLOW(overflow);
>  	/*
>  	 * Overflow interrupt pending bit should only be cleared after stopping
>  	 * all the counters to avoid any race condition.
> @@ -774,6 +928,7 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, str=
uct hlist_node *node)
>  {
>  	struct riscv_pmu *pmu =3D hlist_entry_safe(node, struct riscv_pmu, node=
);
>  	struct cpu_hw_events *cpu_hw_evt =3D this_cpu_ptr(pmu->hw_events);
> +	int ret =3D 0;
> =20
>  	/*
>  	 * We keep enabling userspace access to CYCLE, TIME and INSTRET via the
> @@ -794,7 +949,10 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, st=
ruct hlist_node *node)
>  		enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
>  	}
> =20
> -	return 0;
> +	if (sbi_pmu_snapshot_available())
> +		ret =3D pmu_sbi_snapshot_setup(pmu, cpu);
> +
> +	return ret;

I'd just write this as

	if (sbi_pmu_snapshot_available())
		return pmu_sbi_snapshot_setup(pmu, cpu);

	return 0;

and drop the newly added variable I think.

>  }
> =20
>  static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
> @@ -807,6 +965,9 @@ static int pmu_sbi_dying_cpu(unsigned int cpu, struct=
 hlist_node *node)
>  	/* Disable all counters access for user mode now */
>  	csr_write(CSR_SCOUNTEREN, 0x0);
> =20
> +	if (sbi_pmu_snapshot_available())
> +		pmu_sbi_snapshot_disable();
> +
>  	return 0;
>  }
> =20
> @@ -1076,10 +1237,6 @@ static int pmu_sbi_device_probe(struct platform_de=
vice *pdev)
>  	pmu->event_unmapped =3D pmu_sbi_event_unmapped;
>  	pmu->csr_index =3D pmu_sbi_csr_index;
> =20
> -	ret =3D cpuhp_state_add_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->no=
de);
> -	if (ret)
> -		return ret;
> -
>  	ret =3D riscv_pm_pmu_register(pmu);
>  	if (ret)
>  		goto out_unregister;
> @@ -1088,8 +1245,28 @@ static int pmu_sbi_device_probe(struct platform_de=
vice *pdev)
>  	if (ret)
>  		goto out_unregister;
> =20
> +	/* SBI PMU Snasphot is only available in SBI v2.0 */

s/Snasphot/Snapshot/

> +	if (sbi_v2_available) {
> +		ret =3D pmu_sbi_snapshot_alloc(pmu);
> +		if (ret)
> +			goto out_unregister;

A blank line here aids readability by breaking up the reuse of ret.

> +		ret =3D pmu_sbi_snapshot_setup(pmu, smp_processor_id());
> +		if (!ret) {
> +			pr_info("SBI PMU snapshot is available to optimize the PMU traps\n");

Why the verbose message? Could we standardise on one wording for the SBI
function probing stuff? Most users seem to be "SBI FOO extension detected".
Only IPI has additional wording and PMU differs slightly.

> +			/* We enable it once here for the boot cpu. If snapshot shmem fails d=
uring

Again, comment style here. What does "snapshot shmem" mean? I think
there's a missing action here. Registration? Allocation?

> +			 * cpu hotplug on, it should bail out.

Should or will? What action does "bail out" correspond to?

Thanks,
Conor.

> +			 */
> +			static_branch_enable(&sbi_pmu_snapshot_available);
> +		}
> +		/* Snapshot is an optional feature. Continue if not available */
> +	}
> +
>  	register_sysctl("kernel", sbi_pmu_sysctl_table);
> =20
> +	ret =3D cpuhp_state_add_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->no=
de);
> +	if (ret)
> +		return ret;
> +
>  	return 0;
> =20
>  out_unregister:
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pm=
u.h
> index 43282e22ebe1..c3fa90970042 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -39,6 +39,12 @@ struct cpu_hw_events {
>  	DECLARE_BITMAP(used_hw_ctrs, RISCV_MAX_COUNTERS);
>  	/* currently enabled firmware counters */
>  	DECLARE_BITMAP(used_fw_ctrs, RISCV_MAX_COUNTERS);
> +	/* The virtual address of the shared memory where counter snapshot will=
 be taken */
> +	void *snapshot_addr;
> +	/* The physical address of the shared memory where counter snapshot wil=
l be taken */
> +	phys_addr_t snapshot_addr_phys;
> +	/* Boolean flag to indicate setup is already done */
> +	bool snapshot_set_done;
>  };
> =20
>  struct riscv_pmu {
> --=20
> 2.34.1
>=20

--cJ3G311iH0naEK6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXHDJgAKCRB4tDGHoIJi
0rkgAP9s2tO7dLNrds98Vj2FNb9jim6cWml00RYcOuqpMOVnrwD+Mcr7P2fNoKQq
jDNf4s2i4U+mBgmAKLMJ/23Lb2vk9ww=
=hPnG
-----END PGP SIGNATURE-----

--cJ3G311iH0naEK6r--


--===============0991003134012996202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0991003134012996202==--

