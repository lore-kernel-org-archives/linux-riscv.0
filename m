Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 115F9C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 13:38:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEA3F206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 13:38:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mlpa+qL8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="I71HNaXK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEA3F206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rsFDwp9QPKIpNYcCYe/gleP1nJ36nCHjuGA5d4Jz2DE=; b=Mlpa+qL8pzEP/u
	YrC1zqsDLsoA808C1PTqUKj1lQaN88vv76kB1jdxnfVLi220S+14WP3M7AFdHv+uGmoP9/Lw1xDd7
	f5gWH2VlYXaXG9WlsvPuPnzvDilp5oQE6E2cbtBuqB04E0uT/yT5O53MOsU5hQcCc8AlIKF3II+3M
	ZML3yn6yRZAaaVZ3Cr4D2fmX3WShPfDtFT4IoNqms+u5tWWd55WFy+8f/9hjNtHufIbfZME23gozp
	/cPWubvLYOXk4o5EDh56jR1ClKJENf5LHmNw4Q3GgEy4XIHqslo0D74dXgjFUxV+BFT9vzzm0Up/x
	r3/23f6nN1x4hA1dEVVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9VEk-0003N0-5B; Thu, 28 Mar 2019 13:38:30 +0000
Received: from mail-eopbgr110117.outbound.protection.outlook.com
 ([40.107.11.117] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9VDd-0001uc-7T
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 13:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7qlUqRiywDE6RVGWOfx0UfR91vGOeIr4hwZctX2G3g=;
 b=I71HNaXKkZcG6ss84jeLxhrb4yMVEx81PFXd0f+1QUEYYJlSJrnPy+8yyTu4itNGJOhvS20Tz0WdJrklT6eNbTt4WnrxFFhazT+04hVPU8idKXXeX1my363t6VKv1dBdtvnkq1QESlS2p2bCrB/3aglqGpww38pK9I1Cv2AMz/0=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0990.GBRP265.PROD.OUTLOOK.COM (20.176.140.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Thu, 28 Mar 2019 13:37:15 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1750.017; Thu, 28 Mar 2019
 13:37:15 +0000
From: Gary Guo <gary@garyguo.net>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH v2] RISC-V: Implement ASID allocator
Thread-Topic: [PATCH v2] RISC-V: Implement ASID allocator
Thread-Index: AQHU5TAIKaRDCttA7UazIjpcDaomMKYhDFQA
Date: Thu, 28 Mar 2019 13:37:15 +0000
Message-ID: <b6872ed0-4b8c-ca1d-4ee0-b01324e40da5@garyguo.net>
References: <20190328063211.13052-1-anup.patel@wdc.com>
In-Reply-To: <20190328063211.13052-1-anup.patel@wdc.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::25) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d25f576f-fd08-49cc-ec98-08d6b3827d76
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0990; 
x-ms-traffictypediagnostic: LO2P265MB0990:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <LO2P265MB09901F83DED3044E226F6744D6590@LO2P265MB0990.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0990C54589
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(366004)(136003)(39830400003)(376002)(55674003)(199004)(189003)(30864003)(476003)(71190400001)(2616005)(6512007)(316002)(71200400001)(76176011)(31686004)(6116002)(31696002)(53946003)(386003)(6916009)(46003)(54906003)(86362001)(53546011)(6506007)(14444005)(8936002)(6246003)(446003)(53936002)(256004)(486006)(11346002)(68736007)(102836004)(229853002)(6436002)(5660300002)(99286004)(2906002)(6486002)(97736004)(52116002)(966005)(508600001)(106356001)(81156014)(7736002)(8676002)(81166006)(186003)(25786009)(105586002)(36756003)(6306002)(305945005)(4326008)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0990;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ADdFbD/bSOLZJz5GOxvFIk9atBvjzs6uh2PZR3niAi1u3yLazovHUUV6zfTVSqlvphhEjdBNQntqeeWV1Cbu92yxeWOgWEHgdwp+Im/E9C6FehXQGz+ATfCUOKcTFrXAC49FXAZSWBsKU0YRobLR8++PrbrF3WRtS19bI+QGSxhgcMkOPu6aZ5csuLova6MZIFSRsh8xLuGG0u0bDH8X9lEw1t5bPrhQfFxGHkxygUtZZEn8/whz91CfKnosfYDvbCO7Kw6VOcT4/JW//SvOXrTGfpPPEGXTdTWNwJ9Vs7rmjTmSxQF7xIUFmcQ72RdxWKPRg+rmy5IqJ9IRS72tZhfBwKZ9GlAyTYrIVFiTHqVIQPTrwyvrUFp9PaGDRXCTeB4DauuuV0l+RRw/lHYfI+zBUXOkgVIrCUXOe2yAOtU=
Content-ID: <EE0669051511D94F96831FB11B579302@GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d25f576f-fd08-49cc-ec98-08d6b3827d76
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2019 13:37:15.3381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0990
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_063721_609500_09F64CB4 
X-CRM114-Status: GOOD (  31.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Anup,

The code still does not use ASID in TLB flush routines. Without this 
added the code does not boot on systems with true ASID support.

We also need to consider the case of CONTEXTID overflow on 32-bit 
systems. 32-bit CONTEXTID may overflow in a month time.

Please all see my inline comments.

Best,
Gary

On 28/03/2019 06:32, Anup Patel wrote:
> Currently, we do local TLB flush on every MM switch. This is very harsh
> on performance because we are forcing page table walks after every MM
> switch.
> 
> This patch implements ASID allocator for assigning an ASID to every MM
> context. The number of ASIDs are limited in HW so we create a logical
> entity named CONTEXTID for assigning to MM context. The lower bits of
> CONTEXTID are ASID and upper bits are VERSION number. The number of
> usable ASID bits supported by HW are detected at boot-time by writing
> 1s to ASID bits in SATP CSR. This means last ASID is always reserved
> because it is used for initial MM context.
> 
> We allocate new CONTEXTID on first MM switch for a MM context where
> the ASID is allocated from an ASID bitmap and VERSION is provide by
> an atomic counter. At time of allocating new CONTEXTID, if we run out
> of available ASIDs then:
> 1. We flush the ASID bitmap
> 2. Increment current VERSION atomic counter
> 3. Re-allocate ASID from ASID bitmap
> 4. Flush TLB on all CPUs
> 5. Try CONTEXTID re-assignment on all CPUs
> 
> Using above approach, we have virtually infinite CONTEXTIDs on-top-of
> limited number of HW ASIDs. This approach is inspired from ASID allocator
> used for Linux ARM/ARM64 but we have adapted it for RISC-V. Overall,
> this ASID allocator helps us reduce rate of local TLB flushes on every
> CPU thereby increasing performance.
> 
> This patch is tested on QEMU/virt machine and SiFive Unleashed board.
> On QEMU/virt machine, we see 10% (approx) performance improvement with
> SW emulated TLBs provided by QEMU. Unfortunately, ASID bits of SATP CSR
> are not implemented on SiFive Unleashed board so we don't see any change
> in performance.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
Could you add a Co-developed-by line in addition to Signed-off-by as 
well? Thanks.
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
> Changes since v1:
> - We adapt good aspects from Gary Guo's ASID allocator implementation
>    and provide due credit to him by adding his SoB.
> - Track ASIDs active during context flush and mark them as reserved
> - Set ASID bits to all 1s to simplify number of ASID bit detection
> - Use atomic_long_t instead of atomic64_t for being 32bit friendly
> - Use unsigned long instead of u64 for being 32bit friendly
> - Use flush_tlb_all() instead of lazy local_tlb_flush_all() at time
>    of context flush
> 
> This patch is based on Linux-5.1-rc2 and TLB flush cleanup patches v4
> from Gary Guo. It can be also found in riscv_asid_allocator_v2 branch
> of https://github.com/avpatel/linux.git
> ---
>   arch/riscv/include/asm/csr.h         |   6 +
>   arch/riscv/include/asm/mmu.h         |   1 +
>   arch/riscv/include/asm/mmu_context.h |   1 +
>   arch/riscv/kernel/head.S             |   2 +
>   arch/riscv/mm/context.c              | 249 +++++++++++++++++++++++++--
>   5 files changed, 247 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 28a0d1cb374c..ce18ab8f53ed 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -45,10 +45,16 @@
>   #define SATP_PPN     _AC(0x003FFFFF, UL)
>   #define SATP_MODE_32 _AC(0x80000000, UL)
>   #define SATP_MODE    SATP_MODE_32
> +#define SATP_ASID_BITS	9
> +#define SATP_ASID_SHIFT	22
> +#define SATP_ASID_MASK	_AC(0x1FF, UL)
>   #else
>   #define SATP_PPN     _AC(0x00000FFFFFFFFFFF, UL)
>   #define SATP_MODE_39 _AC(0x8000000000000000, UL)
>   #define SATP_MODE    SATP_MODE_39
> +#define SATP_ASID_BITS	16
> +#define SATP_ASID_SHIFT	44
> +#define SATP_ASID_MASK	_AC(0xFFFF, UL)
>   #endif
>   
>   /* Interrupt Enable and Interrupt Pending flags */
> diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
> index 5df2dccdba12..42a9ca0fe1fb 100644
> --- a/arch/riscv/include/asm/mmu.h
> +++ b/arch/riscv/include/asm/mmu.h
> @@ -18,6 +18,7 @@
>   #ifndef __ASSEMBLY__
>   
>   typedef struct {
> +	atomic_long_t id;
>   	void *vdso;
>   #ifdef CONFIG_SMP
>   	/* A local icache flush is needed before user execution can resume. */
> diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
> index bf4f097a9051..ba6ab35c18dc 100644
> --- a/arch/riscv/include/asm/mmu_context.h
> +++ b/arch/riscv/include/asm/mmu_context.h
> @@ -30,6 +30,7 @@ static inline void enter_lazy_tlb(struct mm_struct *mm,
>   static inline int init_new_context(struct task_struct *task,
>   	struct mm_struct *mm)
>   {
> +	atomic_long_set(&(mm)->context.id, 0);
Parenthesis around mm isn't necessary
>   	return 0;
>   }
>   
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index fe884cd69abd..c3f9adc0d054 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -95,6 +95,8 @@ relocate:
>   	la a2, swapper_pg_dir
>   	srl a2, a2, PAGE_SHIFT
>   	li a1, SATP_MODE
> +	li a0, (SATP_ASID_MASK << SATP_ASID_SHIFT)
> +	or a1, a1, a0
>   	or a2, a2, a1
>   
>   	/*
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 0f787bcd3a7a..1205d33d1b1b 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -2,13 +2,209 @@
>   /*
>    * Copyright (C) 2012 Regents of the University of California
>    * Copyright (C) 2017 SiFive
> + * Copyright (C) 2019 Western Digital Corporation or its affiliates.
>    */
>   
> +#include <linux/bitops.h>
>   #include <linux/mm.h>
> +#include <linux/slab.h>
>   
>   #include <asm/tlbflush.h>
>   #include <asm/cacheflush.h>
>   
> +static bool use_asid_allocator;
> +static unsigned long asid_bits;
> +static unsigned long num_asids;
> +static unsigned long asid_mask;
> +static unsigned long first_version;
> +
> +static atomic_long_t current_version;
> +
> +static DEFINE_RAW_SPINLOCK(context_lock);
> +static unsigned long *context_asid_map;
> +
> +static DEFINE_PER_CPU(atomic_long_t, active_context);
> +static DEFINE_PER_CPU(unsigned long, reserved_context);
> +
> +static bool check_update_reserved_context(unsigned long cntx,
> +					  unsigned long newcntx)
> +{
> +	int cpu;
> +	bool hit = false;
> +
> +	/*
> +	 * Iterate over the set of reserved CONTEXT looking for a match.
> +	 * If we find one, then we can update our mm to use new CONTEXT
> +	 * (i.e. the same CONTEXT in the current_version) but we can't
> +	 * exit the loop early, since we need to ensure that all copies
> +	 * of the old CONTEXT are updated to reflect the mm. Failure to do
> +	 * so could result in us missing the reserved CONTEXT in a future
> +	 * version.
> +	 */
> +	for_each_possible_cpu(cpu) {
> +		if (per_cpu(reserved_context, cpu) == cntx) {
> +			hit = true;
> +			per_cpu(reserved_context, cpu) = newcntx;
> +		}
> +	}
> +
> +	return hit;
> +}
> +
> +/* Note: must be called with context_lock held */
> +static void __flush_context(void)
> +{
> +	int i;
> +	unsigned long cntx;
> +
> +	/* Update the list of reserved ASIDs and the ASID bitmap. */
> +	bitmap_clear(context_asid_map, 0, num_asids);
> +
> +	/* Mark already acitve ASIDs as used */
> +	for_each_possible_cpu(i) {
> +		cntx = atomic_long_xchg_relaxed(&per_cpu(active_context, i), 0);
> +		/*
> +		 * If this CPU has already been through a rollover, but
> +		 * hasn't run another task in the meantime, we must preserve
> +		 * its reserved CONTEXT, as this is the only trace we have of
> +		 * the process it is still running.
> +		 */
> +		if (cntx == 0)
> +			cntx = per_cpu(reserved_context, i);
> +
> +		__set_bit(cntx & asid_mask, context_asid_map);
> +		per_cpu(reserved_context, i) = cntx;
> +	}
> +
> +	/* Mark last ASID as used because it is used at boot-time */
> +	__set_bit(asid_mask, context_asid_map);
Looks unnecessary as we always start find_next_zero_bit from idx 1.
> +}
> +
> +/* Note: must be called with context_lock held */
> +static unsigned long __new_context(struct mm_struct *mm,
> +				   bool *need_tlb_flush)
> +{
> +	static u32 cur_idx = 1;
> +	unsigned long cntx = atomic_long_read(&mm->context.id);
> +	unsigned long asid, ver = atomic_long_read(&current_version);
> +
> +	if (cntx != 0) {
> +		unsigned long newcntx = ver | (cntx & ~asid_mask);
Shouldn't this be cntx & asid_mask ?
> +
> +		/*
> +		 * If our current CONTEXT was active during a rollover, we
> +		 * can continue to use it and this was just a false alarm.
> +		 */
> +		if (check_update_reserved_context(cntx, newcntx))
> +			return newcntx;
> +
> +		/*
> +		 * We had a valid CONTEXT in a previous life, so try to
> +		 * re-use it if possible.
> +		 */
> +		if (!__test_and_set_bit(cntx & asid_mask, context_asid_map))
> +			return newcntx;
> +	}
> +
> +	/*
> +	 * Allocate a free ASID. If we can't find one then increment
> +	 * current_version and flush all ASIDs.
> +	 */
> +	asid = find_next_zero_bit(context_asid_map, num_asids, cur_idx);
> +	if (asid != num_asids)
> +		goto set_asid;
> +
> +	/* We're out of ASIDs, so increment current_version */
> +	ver = atomic_long_add_return_relaxed(first_version, &current_version);
> +
> +	/* Flush everything  */
> +	__flush_context();
> +	*need_tlb_flush = true;
> +
> +	/* We have more ASIDs than CPUs, so this will always succeed */
> +	asid = find_next_zero_bit(context_asid_map, num_asids, 1);
> +
> +set_asid:
> +	__set_bit(asid, context_asid_map);
> +	cur_idx = asid;
> +	return asid | ver;
> +}
> +
> +static void set_mm_asid(struct mm_struct *mm, unsigned int cpu)
> +{
> +	unsigned long flags;
> +	bool need_tlb_flush = false;
> +	unsigned long cntx, old_active_cntx;
> +
> +	cntx = atomic_long_read(&mm->context.id);
> +
> +	/*
> +	 * If our active_context is non-zero and the context matches the
> +	 * current_version, then we update the active_context entry with a
> +	 * relaxed cmpxchg.
> +	 *
> +	 * Following is how we handle racing with a concurrent rollover:
> +	 *
> +	 * - We get a zero back from the cmpxchg and end up waiting on the
> +	 *   lock. Taking the lock synchronises with the rollover and so
> +	 *   we are forced to see the updated verion.
> +	 *
> +	 * - We get a valid context back from the cmpxchg then we continue
> +	 *   using old ASID because __flush_context() would have marked ASID
> +	 *   of active_context as used and next context switch we will allocate
> +	 *   new context.
> +	 */
> +	old_active_cntx = atomic_long_read(&per_cpu(active_context, cpu));
> +	if (old_active_cntx &&
> +	    !((cntx ^ atomic_long_read(&current_version)) >> asid_bits) &&
This looks hard to read. Probably
(cntx &~ asid_mask) == atomic_long_read(&current_version)
is clearer.
> +	    atomic_long_cmpxchg_relaxed(&per_cpu(active_context, cpu),
> +					old_active_cntx, cntx))
> +		goto switch_mm_fast;
> +
> +	raw_spin_lock_irqsave(&context_lock, flags);
Any reason that we prefer raw_ here?
> +
> +	/* Check that our ASID belongs to the current_version. */
> +	cntx = atomic_long_read(&mm->context.id);
> +	if ((cntx ^ atomic_long_read(&current_version)) >> asid_bits) {
Same as above, probably
(cntx &~ asid_mask) != atomic_long_read(&current_version)
makes more sense.
> +		cntx = __new_context(mm, &need_tlb_flush);
> +		atomic_long_set(&mm->context.id, cntx);
> +	}
> +
> +	atomic_long_set(&per_cpu(active_context, cpu), cntx);
> +
> +	raw_spin_unlock_irqrestore(&context_lock, flags);
> +
> +switch_mm_fast:
> +	/*
> +	 * Use the old spbtr name instead of using the current satp
> +	 * name to support binutils 2.29 which doesn't know about the
> +	 * privileged ISA 1.10 yet.
> +	 */
> +	csr_write(sptbr, virt_to_pfn(mm->pgd) |
> +		  ((cntx & asid_mask) << SATP_ASID_SHIFT) |
> +		  SATP_MODE);
> +
> +	if (need_tlb_flush)
> +		flush_tlb_all();
I think your intention here is to avoid calling flush_tlb_all when IRQs 
are off in the critical region. However, switch_mm will be called from 
scheduler as well which also turn irqs off, so this still cause issue. I 
think a better way is to force flush_tlb_all to use SBI when IRQs are 
off. What do you think?
> +}
> +
> +static void set_mm_noasid(struct mm_struct *mm)
> +{
> +	/*
> +	 * Use the old spbtr name instead of using the current satp
> +	 * name to support binutils 2.29 which doesn't know about the
> +	 * privileged ISA 1.10 yet.
> +	 */
> +	csr_write(sptbr, virt_to_pfn(mm->pgd) | SATP_MODE);
> +
> +	/*
> +	 * sfence.vma after SATP write. We call it on MM context instead of
> +	 * calling local_flush_tlb_all to prevent global mappings from being
> +	 * affected.
> +	 */
> +	local_flush_tlb_mm(mm);
> +}
> +
>   /*
>    * When necessary, performs a deferred icache flush for the given MM context,
>    * on the local CPU.  RISC-V has no direct mechanism for instruction cache
> @@ -58,20 +254,49 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>   	cpumask_clear_cpu(cpu, mm_cpumask(prev));
>   	cpumask_set_cpu(cpu, mm_cpumask(next));
>   
> -	/*
> -	 * Use the old spbtr name instead of using the current satp
> -	 * name to support binutils 2.29 which doesn't know about the
> -	 * privileged ISA 1.10 yet.
> -	 */
> -	csr_write(sptbr, virt_to_pfn(next->pgd) | SATP_MODE);
> +	if (use_asid_allocator)
> +		set_mm_asid(next, cpu);
> +	else
> +		set_mm_noasid(next);
> +
> +	flush_icache_deferred(next);
> +}
> +
> +static int asids_init(void)
> +{
> +	/* Figure-out number of ASID bits in HW */
> +	asid_bits = (csr_read(sptbr) >> SATP_ASID_SHIFT) & SATP_ASID_MASK;
> +	asid_bits = fls_long(asid_bits);
> +
> +	/* Pre-compute ASID details */
> +	num_asids = 1 << asid_bits;
> +	asid_mask = num_asids - 1;
> +	first_version = num_asids;
Is there any reason we want to have two set-once variables with same value?
>   
>   	/*
> -	 * sfence.vma after SATP write. We call it on MM context instead of
> -	 * calling local_flush_tlb_all to prevent global mappings from being
> -	 * affected.
> +	 * Use ASID allocator only if number of HW ASIDs are
> +	 * at-least twice more than CPUs
>   	 */
> -	local_flush_tlb_mm(next);
> +	use_asid_allocator =
> +		(num_asids <= (2 * num_possible_cpus())) ? false : true;
>   
> -	flush_icache_deferred(next);
> -}
> +	/* Setup ASID allocator if available */
> +	if (use_asid_allocator) {
> +		atomic_long_set(&current_version, first_version);
>   
> +		context_asid_map = kcalloc(BITS_TO_LONGS(num_asids),
> +				   sizeof(*context_asid_map), GFP_KERNEL);
> +		if (!context_asid_map)
> +			panic("Failed to allocate bitmap for %lu ASIDs\n",
> +			      num_asids);
> +
> +		__set_bit(asid_mask, context_asid_map);
> +
> +		pr_info("ASID allocator using %lu entries\n", num_asids);
> +	} else {
If we decide not to use ASID allocator, we will need to set ASID field 
to zero on *all harts* before we do our first switch_mm. Otherwise we 
will end up a hart running non-zero ASID and another running zero ASID 
with different page table.
> +		pr_info("ASID allocator disabled\n");
> +	}
> +
> +	return 0;
> +}
> +early_initcall(asids_init);
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
