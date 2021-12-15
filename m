Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9B7C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Dec 2021 08:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u18ky6dQWbnzL76goJld9EjIyErgOMuf49z9IPDDRhI=; b=LY7lcO9247CEO2
	/4vgO0q5oCrpGB3NluCniV5ccJ1S1P+waQd0jyVS5NFJFwE9XBh2KkjVRYHDqUi4rWi++n+d2NxFs
	EU/5w6Sz4h4jq9pVVrM9hLIU1ovLoPHR/x7C4ECqKoFB4b7FQsA5BH2ckMS4LaWw1SDaQK+6I1m0g
	yvlM0YWLE1UEeapRHmBCwxphiVqHzyHe5loFBh8Bf5E9Qb67MbtnFHeuoJtD81UOBhr+BWNTZ7xxc
	F+detpHX1t7UHre0PxMesPq/PGkXDTPHI0OJGHDubzQch6CGhFPCw2TuRjS839WcFa4zOi4F2LXqg
	DiCyqud/0LyUA3rYvpwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxPMA-00HJkv-Kl; Wed, 15 Dec 2021 08:09:46 +0000
Received: from forward501o.mail.yandex.net ([37.140.190.203])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxPM7-00HJk6-3N
 for linux-riscv@lists.infradead.org; Wed, 15 Dec 2021 08:09:45 +0000
Received: from sas1-369099ba34c4.qloud-c.yandex.net
 (sas1-369099ba34c4.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:3d96:0:640:3690:99ba])
 by forward501o.mail.yandex.net (Yandex) with ESMTP id 646B845C3FB6;
 Wed, 15 Dec 2021 11:02:18 +0300 (MSK)
Received: from sas1-7a2c1d25dbfc.qloud-c.yandex.net
 (sas1-7a2c1d25dbfc.qloud-c.yandex.net [2a02:6b8:c08:c9f:0:640:7a2c:1d25])
 by sas1-369099ba34c4.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 PtHqElSo2Z-2HfuGowU; Wed, 15 Dec 2021 11:02:18 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1639555338; bh=bcZSGKL367ori0UFRkqTy8+oGoWm2KH6xaqkLIRJDZg=;
 h=In-Reply-To:Subject:To:From:References:Date:Message-ID:Cc;
 b=hcqh8T87JyccZqYMJrd+7jEZo5+qpM4qpRnVZFUGrDCHq/ZA/Agr0vq3N0c2NwR5L
 /pj5GAS53e5sapd9LSMTFVt2wA0HYAGJx+tNESH7z7KIgWb0yrZH0U3802B4Fk+R08
 mz7sjIDtFfSiE3CXDmVCFioR6N9Bo46XUuVefhwo=
Authentication-Results: sas1-369099ba34c4.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by sas1-7a2c1d25dbfc.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id 3cfgOP4KNN-2FPqUg6l; Wed, 15 Dec 2021 11:02:15 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Date: Wed, 15 Dec 2021 11:02:14 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup.patel@wdc.com>, David
 Abdurachmanov <david.abdurachmanov@sifive.com>, devicetree@vger.kernel.org,
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, Nick Kossifidis <mick@ics.forth.gr>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Vincent Chen
 <vincent.chen@sifive.com>
Subject: Re: [v4 05/11] RISC-V: Add RISC-V SBI PMU extension definitions
Message-ID: <20211215110214.62ca2474@redslave.neermore.group>
In-Reply-To: <20211025195350.242914-6-atish.patra@wdc.com>
References: <20211025195350.242914-1-atish.patra@wdc.com>
 <20211025195350.242914-6-atish.patra@wdc.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_000943_518853_85B60557 
X-CRM114-Status: GOOD (  19.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Atish!

On Mon, 25 Oct 2021 12:53:44 -0700
Atish Patra <atish.patra@wdc.com> wrote:

> This patch adds all the definitions defined by the SBI PMU extension.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 97
> ++++++++++++++++++++++++++++++++++++ 1 file changed, 97 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h
> b/arch/riscv/include/asm/sbi.h index 0d42693cb65e..7a14ca06ba8f 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -27,6 +27,7 @@ enum sbi_ext_id {
>  	SBI_EXT_IPI = 0x735049,
>  	SBI_EXT_RFENCE = 0x52464E43,
>  	SBI_EXT_HSM = 0x48534D,
> +	SBI_EXT_PMU = 0x504D55,
>  };
>  
>  enum sbi_ext_base_fid {
> @@ -70,6 +71,99 @@ enum sbi_hsm_hart_status {
>  	SBI_HSM_HART_STATUS_STOP_PENDING,
>  };
>  
> +
> +enum sbi_ext_pmu_fid {
> +	SBI_EXT_PMU_NUM_COUNTERS = 0,
> +	SBI_EXT_PMU_COUNTER_GET_INFO,
> +	SBI_EXT_PMU_COUNTER_CFG_MATCH,
> +	SBI_EXT_PMU_COUNTER_START,
> +	SBI_EXT_PMU_COUNTER_STOP,
> +	SBI_EXT_PMU_COUNTER_FW_READ,
> +};
> +
> +#define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(55, 0)
> +#define RISCV_PMU_RAW_EVENT_IDX 0x20000
> +
> +/** General pmu event codes specified in SBI PMU extension */
> +enum sbi_pmu_hw_generic_events_t {
> +	SBI_PMU_HW_NO_EVENT			= 0,
> +	SBI_PMU_HW_CPU_CYCLES			= 1,
> +	SBI_PMU_HW_INSTRUCTIONS			= 2,
> +	SBI_PMU_HW_CACHE_REFERENCES		= 3,
> +	SBI_PMU_HW_CACHE_MISSES			= 4,
> +	SBI_PMU_HW_BRANCH_INSTRUCTIONS		= 5,
> +	SBI_PMU_HW_BRANCH_MISSES		= 6,
> +	SBI_PMU_HW_BUS_CYCLES			= 7,
> +	SBI_PMU_HW_STALLED_CYCLES_FRONTEND	= 8,
> +	SBI_PMU_HW_STALLED_CYCLES_BACKEND	= 9,
> +	SBI_PMU_HW_REF_CPU_CYCLES		= 10,
> +
> +	SBI_PMU_HW_GENERAL_MAX,
> +};
> +
> +/**
> + * Special "firmware" events provided by the firmware, even if the
> hardware
> + * does not support performance events. These events are encoded as
> a raw
> + * event type in Linux kernel perf framework.
> + */
> +enum sbi_pmu_fw_generic_events_t {
> +	SBI_PMU_FW_MISALIGNED_LOAD	= 0,
> +	SBI_PMU_FW_MISALIGNED_STORE	= 1,
> +	SBI_PMU_FW_ACCESS_LOAD		= 2,
> +	SBI_PMU_FW_ACCESS_STORE		= 3,
> +	SBI_PMU_FW_ILLEGAL_INSN		= 4,
> +	SBI_PMU_FW_SET_TIMER		= 5,
> +	SBI_PMU_FW_IPI_SENT		= 6,
> +	SBI_PMU_FW_IPI_RECVD		= 7,
> +	SBI_PMU_FW_FENCE_I_SENT		= 8,
> +	SBI_PMU_FW_FENCE_I_RECVD	= 9,
> +	SBI_PMU_FW_SFENCE_VMA_SENT	= 10,
> +	SBI_PMU_FW_SFENCE_VMA_RCVD	= 11,
> +	SBI_PMU_FW_SFENCE_VMA_ASID_SENT	= 12,
> +	SBI_PMU_FW_SFENCE_VMA_ASID_RCVD	= 13,
> +
> +	SBI_PMU_FW_HFENCE_GVMA_SENT	= 14,
> +	SBI_PMU_FW_HFENCE_GVMA_RCVD	= 15,
> +	SBI_PMU_FW_HFENCE_GVMA_VMID_SENT = 16,
> +	SBI_PMU_FW_HFENCE_GVMA_VMID_RCVD = 17,
> +
> +	SBI_PMU_FW_HFENCE_VVMA_SENT	= 18,
> +	SBI_PMU_FW_HFENCE_VVMA_RCVD	= 19,
> +	SBI_PMU_FW_HFENCE_VVMA_ASID_SENT = 20,
> +	SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD = 21,
> +	SBI_PMU_FW_MAX,
> +};
> +
> +/* SBI PMU event types */
> +enum sbi_pmu_event_type {
> +	SBI_PMU_EVENT_TYPE_HW = 0x0,
> +	SBI_PMU_EVENT_TYPE_CACHE = 0x1,
> +	SBI_PMU_EVENT_TYPE_RAW = 0x2,
> +	SBI_PMU_EVENT_TYPE_FW = 0xf,
> +};
> +
> +/* SBI PMU event types */
> +enum sbi_pmu_ctr_type {
> +	SBI_PMU_CTR_TYPE_HW = 0x0,
> +	SBI_PMU_CTR_TYPE_FW,
> +};
> +
> +/* Flags defined for config matching function */
> +#define SBI_PMU_CFG_FLAG_SKIP_MATCH	(1 << 0)
> +#define SBI_PMU_CFG_FLAG_CLEAR_VALUE	(1 << 1)
> +#define SBI_PMU_CFG_FLAG_AUTO_START	(1 << 2)
> +#define SBI_PMU_CFG_FLAG_SET_MINH	(1 << 3)
> +#define SBI_PMU_CFG_FLAG_SET_SINH	(1 << 4)
> +#define SBI_PMU_CFG_FLAG_SET_UINH	(1 << 5)
> +#define SBI_PMU_CFG_FLAG_SET_VSINH	(1 << 6)
> +#define SBI_PMU_CFG_FLAG_SET_VUINH	(1 << 7)

It looks like you have a typo here, the defines in OpenSBI are
different:

#define SBI_PMU_CFG_FLAG_SET_VUINH	(1 << 3)
#define SBI_PMU_CFG_FLAG_SET_VSINH	(1 << 4)
#define SBI_PMU_CFG_FLAG_SET_UINH	(1 << 5)
#define SBI_PMU_CFG_FLAG_SET_SINH	(1 << 6)
#define SBI_PMU_CFG_FLAG_SET_MINH	(1 << 7)


> +
> +/* Flags defined for counter start function */
> +#define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
> +
> +/* Flags defined for counter stop function */
> +#define SBI_PMU_STOP_FLAG_RESET (1 << 0)
> +
>  #define SBI_SPEC_VERSION_DEFAULT	0x1
>  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
>  #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
> @@ -82,6 +176,9 @@ enum sbi_hsm_hart_status {
>  #define SBI_ERR_INVALID_PARAM	-3
>  #define SBI_ERR_DENIED		-4
>  #define SBI_ERR_INVALID_ADDRESS	-5
> +#define SBI_ERR_ALREADY_AVAILABLE -6
> +#define SBI_ERR_ALREADY_STARTED -7
> +#define SBI_ERR_ALREADY_STOPPED -8
>  
>  extern unsigned long sbi_spec_version;
>  struct sbiret {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
