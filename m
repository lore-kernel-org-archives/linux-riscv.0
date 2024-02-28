Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5B7C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 09:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TmXY8kLU2OxnNW+a7UGO2HmQPDRRsueqF5S38TZ+ZI0=; b=RkHkMd5k8qBbT4
	ZNKN9EO5TVzh5OVaWkksl+xyEin/IShmRTaQ5h05YXQoF2HUQ/NtPSRevlb99fvvCup9EyLC0kF2+
	teFeWmcWwR1Dd++Uk9dnJnx+4x4p5THLnmfOWaAqvTJTMjLgxc2IZmiKY2IseL8IoVUgRlQ9f6vmb
	nHi3EVb7kH/IXRvyH7KUWjOWIjddHynMjjPixFjnpRID0V851Q+8+3NUs9FueL8ceLbyigtWKPorg
	2GgVqK/CLB0b9e+I2jEm0dn2iSwDl+Npykt9EQ3rMtTxM0HBxD/mVPt4HH8f9R7X/CR7gJwAG4FwJ
	QgkYyEVYwNHh664nfX0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfFxW-00000008cUr-1y1o;
	Wed, 28 Feb 2024 09:10:38 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfFxT-00000008cTD-0Slk
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 09:10:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 681B72000F;
	Wed, 28 Feb 2024 09:10:29 +0000 (UTC)
Message-ID: <108c8828-5a64-4bfd-8183-f75261ed10d7@ghiti.fr>
Date: Wed, 28 Feb 2024 10:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] perf: RISCV: Fix panic on pmu overflow handler
Content-Language: en-US
To: Fei Wu <fei2.wu@intel.com>, atishp@atishpatra.org, anup@brainfault.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>
References: <20240228082752.2612302-1-fei2.wu@intel.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240228082752.2612302-1-fei2.wu@intel.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_011035_453655_DEF2D138 
X-CRM114-Status: GOOD (  17.42  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Fei,

On 28/02/2024 09:27, Fei Wu wrote:
> (1 << idx) of int is not desired when setting bits in unsigned long
> overflowed_ctrs, use BIT() instead. This panic happens when running
> 'perf record -e branches' on sophgo sg2042.
>
> [  273.311852] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000098
> [  273.320851] Oops [#1]
> [  273.323179] Modules linked in:
> [  273.326303] CPU: 0 PID: 1475 Comm: perf Not tainted 6.6.0-rc3+ #9
> [  273.332521] Hardware name: Sophgo Mango (DT)
> [  273.336878] epc : riscv_pmu_ctr_get_width_mask+0x8/0x62
> [  273.342291]  ra : pmu_sbi_ovf_handler+0x2e0/0x34e
> [  273.347091] epc : ffffffff80aecd98 ra : ffffffff80aee056 sp : fffffff6e36928b0
> [  273.354454]  gp : ffffffff821f82d0 tp : ffffffd90c353200 t0 : 0000002ade4f9978
> [  273.361815]  t1 : 0000000000504d55 t2 : ffffffff8016cd8c s0 : fffffff6e3692a70
> [  273.369180]  s1 : 0000000000000020 a0 : 0000000000000000 a1 : 00001a8e81800000
> [  273.376540]  a2 : 0000003c00070198 a3 : 0000003c00db75a4 a4 : 0000000000000015
> [  273.383901]  a5 : ffffffd7ff8804b0 a6 : 0000000000000015 a7 : 000000000000002a
> [  273.391327]  s2 : 000000000000ffff s3 : 0000000000000000 s4 : ffffffd7ff8803b0
> [  273.398773]  s5 : 0000000000504d55 s6 : ffffffd905069800 s7 : ffffffff821fe210
> [  273.406139]  s8 : 000000007fffffff s9 : ffffffd7ff8803b0 s10: ffffffd903f29098
> [  273.413660]  s11: 0000000080000000 t3 : 0000000000000003 t4 : ffffffff8017a0ca
> [  273.421022]  t5 : ffffffff8023cfc2 t6 : ffffffd9040780e8
> [  273.426437] status: 0000000200000100 badaddr: 0000000000000098 cause: 000000000000000d
> [  273.434512] [<ffffffff80aecd98>] riscv_pmu_ctr_get_width_mask+0x8/0x62
> [  273.441169] [<ffffffff80076bd8>] handle_percpu_devid_irq+0x98/0x1ee
> [  273.447562] [<ffffffff80071158>] generic_handle_domain_irq+0x28/0x36
> [  273.454151] [<ffffffff8047a99a>] riscv_intc_irq+0x36/0x4e
> [  273.459659] [<ffffffff80c944de>] handle_riscv_irq+0x4a/0x74
> [  273.465442] [<ffffffff80c94c48>] do_irq+0x62/0x92
> [  273.470360] Code: 0420 60a2 6402 5529 0141 8082 0013 0000 0013 0000 (6d5c) b783
> [  273.477921] ---[ end trace 0000000000000000 ]---
> [  273.482630] Kernel panic - not syncing: Fatal exception in interrupt
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Fei Wu <fei2.wu@intel.com>
> ---
>   drivers/perf/riscv_pmu_sbi.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 16acd4dcdb96..452aab49db1e 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -512,7 +512,7 @@ static void pmu_sbi_set_scounteren(void *arg)
>   
>   	if (event->hw.idx != -1)
>   		csr_write(CSR_SCOUNTEREN,
> -			  csr_read(CSR_SCOUNTEREN) | (1 << pmu_sbi_csr_index(event)));
> +			  csr_read(CSR_SCOUNTEREN) | BIT(pmu_sbi_csr_index(event)));
>   }
>   
>   static void pmu_sbi_reset_scounteren(void *arg)
> @@ -521,7 +521,7 @@ static void pmu_sbi_reset_scounteren(void *arg)
>   
>   	if (event->hw.idx != -1)
>   		csr_write(CSR_SCOUNTEREN,
> -			  csr_read(CSR_SCOUNTEREN) & ~(1 << pmu_sbi_csr_index(event)));
> +			  csr_read(CSR_SCOUNTEREN) & ~BIT(pmu_sbi_csr_index(event)));
>   }
>   
>   static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
> @@ -731,14 +731,14 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
>   		/* compute hardware counter index */
>   		hidx = info->csr - CSR_CYCLE;
>   		/* check if the corresponding bit is set in sscountovf */
> -		if (!(overflow & (1 << hidx)))
> +		if (!(overflow & BIT(hidx)))
>   			continue;
>   
>   		/*
>   		 * Keep a track of overflowed counters so that they can be started
>   		 * with updated initial value.
>   		 */
> -		overflowed_ctrs |= 1 << lidx;
> +		overflowed_ctrs |= BIT(lidx);
>   		hw_evt = &event->hw;
>   		riscv_pmu_event_update(event);
>   		perf_sample_data_init(&data, 0, hw_evt->last_period);


You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
