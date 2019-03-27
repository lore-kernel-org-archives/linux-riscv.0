Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685A0C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 11:27:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3798B20700
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 11:27:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qWaqPuXg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ePDr9PIc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3798B20700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vphTnUnCCg7jtLiD6VIvAmvmOHwYnMLeShz1Qoc2FkE=; b=qWaqPuXg7yzpQN
	W+rIxkoWHMfjUSVTdcNXIPMZKDfJz1FLds1A+mWom1Mv+Oxf/4SWgFsXowQGKWkVjwCKd1VXCwsrm
	ZEWdA4N9eQiJNswN7v6MDSJIn60AJD23Mf3k3N641qG9iX9GVLP3QtjFchZRjLPSC1wBlwaYp88Wf
	ZNfvfuandezciRgQy85oGe/O5Npq8ca9cQDdLMLTptL3NQGk/gdC7bZwCT0cGxAbkjXQRZebSt89n
	U5OOIfhxSywuH8dJvp9ce6viRNlVSAIIq1ZptemNcmbN7+A9eDb5Mkm9oSu0dm5XlUkAg3HSNJQ3O
	IEKkSVEP3CY9/IGWScpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h96ic-0007Qt-SN; Wed, 27 Mar 2019 11:27:42 +0000
Received: from mail-eopbgr100124.outbound.protection.outlook.com
 ([40.107.10.124] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h96iW-0007Pi-ED
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 11:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1AjVaG5PCdDn42Rm9juN3OUtU/UjEkdqEUmJQhGUAo=;
 b=ePDr9PIca9d9AwteWkI6b7Rk+FI9HPX6+dZCUN7P/UlrqKMG+KHcbTj3qHyWOC+c0TzCI/4YHGZshaxkg4eNH+qoVAXW0trcfV9V+ruuuVpTZojmPEK7ytirNc8nioGGtrmy00GNSbQ67yoogVPuWNM2/M0dDzbCdgttocoycgs=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0079.GBRP265.PROD.OUTLOOK.COM (10.166.99.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.15; Wed, 27 Mar 2019 11:27:32 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1730.019; Wed, 27 Mar 2019
 11:27:32 +0000
From: Gary Guo <gary@garyguo.net>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH] RISC-V: Implement ASID allocator
Thread-Topic: [PATCH] RISC-V: Implement ASID allocator
Thread-Index: AQHU5IQth95RRmVyw0y1O3lxWJG/36YfVxgA
Date: Wed, 27 Mar 2019 11:27:32 +0000
Message-ID: <7edf91f1-1df5-5513-d372-d84edd12edf3@garyguo.net>
References: <20190327100201.32220-1-anup.patel@wdc.com>
In-Reply-To: <20190327100201.32220-1-anup.patel@wdc.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0058.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::22) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00db8a23-76b6-4b0b-832b-08d6b2a733e9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600127)(711020)(4605104)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0079; 
x-ms-traffictypediagnostic: LO2P265MB0079:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <LO2P265MB007946B2986330B59974DD5CD6580@LO2P265MB0079.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0989A7979C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(136003)(366004)(39830400003)(396003)(189003)(199004)(97736004)(105586002)(4326008)(25786009)(966005)(508600001)(14454004)(6916009)(31686004)(52116002)(76176011)(53546011)(386003)(30864003)(5660300002)(6506007)(106356001)(186003)(54906003)(316002)(102836004)(6512007)(6116002)(8676002)(99286004)(11346002)(2616005)(53936002)(6486002)(476003)(486006)(6246003)(36756003)(256004)(6306002)(14444005)(446003)(31696002)(8936002)(7736002)(305945005)(81166006)(81156014)(86362001)(68736007)(71190400001)(71200400001)(46003)(6436002)(2906002)(229853002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0079;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XF6qdKtcT7kCqTgJulpcix5FAHk3ehp/9vTc/+O20pjUsl9n/1PdwQreyq0n5OzWkCjGLDJYfXZQDJecRHVz7bueVukADvPdRuYao46zewFlBL8li71ijyia0Nlxfx/XXXaaRcn8w3yGBdvzYV/V/kiPIdE++VdUt8Jff6QMT48EkwPM2pULH0AoLT7eDIQQcpw+i8FVnloXgc5d38eoZcYbO6JPraJP0zw0OkQdpiHz7dzkCH8mR3cxi5ZdbpzUr5QC0Me3eV8pR1GP0IBe5Qr1GK3SWQhNw9Xq5NB4m6zPsqLjrzSHCf/v+D8O5MsKSjwsKLuAOk8MdRAY8zqPPe7tjaLzD3MGoD89PbQoN7SiI0F68z3AOAUJXOFe4Mlq6ocUqEt2OX2oJ4cJCO8Tv1egt9T7rkZ8FbnxY/etM/4=
Content-ID: <DEADDFCEDDA2EB4F9F89C89F4775B008@GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 00db8a23-76b6-4b0b-832b-08d6b2a733e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2019 11:27:32.1739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_042736_676028_DEF21BC3 
X-CRM114-Status: GOOD (  31.90  )
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

This won't work in an actual hardware with ASID support. There're more 
interactions with TLB flushes that need to be considered. You won't see 
this on both QEMU and SiFive board, as QEMU does not have ASID, so it 
pretends that ASID is supported by just flushing its TLB everytime you 
change sptbr. I suspect the performance gain you see is just due to 
saved TLB flush as TLB flush is super expensive in QEMU (all translation 
block jumps need to be cleared).

I have my version here https://github.com/nbdd0121/linux/tree/asid. I 
haven't done code cleanups yet, but this version has correctness of its 
ASID code tested on our TLB simulator tool (which unfortunately I can't 
share right now as it involves with unpublished works).

In fact my submit my previous patch series exactly as the basis of this 
patch.

Best,
Gary Guo

On 27/03/2019 10:02, Anup Patel wrote:
> Currently, we do local TLB flush on every MM switch. This is very harsh
> on performance because we are forcing page table walks after every MM
> switch.
> 
> This patch implements ASID allocator for assigning an ASID to every MM
> context. The number of ASIDs are limited in HW so we create a logical
> entity named CONTEXTID for assigning to MM context. The lower bits of
> CONTEXTID are ASID and upper bits are VERSION number. We allocate new
> CONTEXTID on first MM switch of a MM context where the ASID is allocated
> from an ASID bitmap and VERSION is provide by an atomic counter.
> 
> At time of allocating new CONTEXTID, if we run out of ASIDs then:
> 1. We flush the ASID bitmap
> 2. Increment VERSION atomic counter
> 3. Force local tlb flush on all CPUs
> 4. Re-allocate ASID from ASID bitmap
> 5. Force CONTEXTID re-assignment on all CPUs
> 
> Using above approach, we have virtually infinite CONTEXTIDs on-top-of
> limited number of HW ASIDs. This approach is inspired from ASID allocator
> used for Linux ARM/ARM64 but we have simplified it as much as possible.
> 
> Overall, this ASID allocator helps us reduce rate of local TLB flushes
> on every CPU thereby increasing performance. The number of available
> ASIDs are detected at boot-time by writing 1s to ASID bits in SATP CSR.
> The ASID #0 is always reserved because it is used at boot-time for
> initial MM context.
> 
> This patch is tested on QEMU/virt machine and SiFive Unleashed board.
> On QEMU/virt machine, we see 10% (approx) performance improvement with
> SW emulated TLBs and ASIDs provided by QEMU. Unfortunately, ASID bits
> of SATP CSR are not implemented on SiFive Unleashed board so we don't
> see any change in performance.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
> This patch is based on Linux-5.1-rc2 and TLB flush cleanup patches v4
> from Gary Guo. It can be also found in riscv_asid_allocator_v1 branch
> of https://github.com/avpatel/linux.git
> ---
>   arch/riscv/include/asm/csr.h         |   6 +
>   arch/riscv/include/asm/mmu.h         |   1 +
>   arch/riscv/include/asm/mmu_context.h |   1 +
>   arch/riscv/mm/context.c              | 204 +++++++++++++++++++++++++--
>   4 files changed, 200 insertions(+), 12 deletions(-)
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
> index 5df2dccdba12..dcbbefb89ebc 100644
> --- a/arch/riscv/include/asm/mmu.h
> +++ b/arch/riscv/include/asm/mmu.h
> @@ -18,6 +18,7 @@
>   #ifndef __ASSEMBLY__
> 
>   typedef struct {
> +	atomic64_t id;
>   	void *vdso;
>   #ifdef CONFIG_SMP
>   	/* A local icache flush is needed before user execution can resume. */
> diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
> index bf4f097a9051..785dd65aa904 100644
> --- a/arch/riscv/include/asm/mmu_context.h
> +++ b/arch/riscv/include/asm/mmu_context.h
> @@ -30,6 +30,7 @@ static inline void enter_lazy_tlb(struct mm_struct *mm,
>   static inline int init_new_context(struct task_struct *task,
>   	struct mm_struct *mm)
>   {
> +	atomic64_set(&(mm)->context.id, 0);
>   	return 0;
>   }
> 
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 0f787bcd3a7a..aa43f6aa727e 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -2,13 +2,158 @@
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
> +static u64 first_version;
> +
> +static DEFINE_RAW_SPINLOCK(context_lock);
> +static atomic64_t context_version;
> +static unsigned long *context_asid_map;
> +static cpumask_t context_tlb_flush_pending;
> +
> +static DEFINE_PER_CPU(atomic64_t, active_context);
> +
> +/* Note: must be called with context_lock held */
> +static void __flush_context(void)
> +{
> +	int i;
> +	u64 cntx, cntx_asid, cntx_ver;
> +
> +	/* Update the list of reserved ASIDs and the ASID bitmap. */
> +	bitmap_clear(context_asid_map, 0, num_asids);
> +
> +	/* Mark already acitve ASIDs as used */
> +	for_each_possible_cpu(i) {
> +		cntx = atomic64_xchg_relaxed(&per_cpu(active_context, i), 0);
> +
> +		cntx_asid = cntx & asid_mask;
> +		cntx_ver = cntx >> asid_bits;
> +
> +		if (cntx_ver)
> +			__set_bit(cntx_asid, context_asid_map);
> +	}
> +
> +	/* Mark ASID #0 as used because it is used at boot-time */
> +	__set_bit(0, context_asid_map);
> +
> +	/* Queue a TLB invalidation for each CPU on next context-switch */
> +	cpumask_setall(&context_tlb_flush_pending);
> +}
> +
> +/* Note: must be called with context_lock held */
> +static u64 __new_context(struct mm_struct *mm)
> +{
> +	static u32 cur_idx = 1;
> +	u64 asid, ver = atomic64_read(&context_version);
> +
> +	/*
> +	 * Allocate a free ASID. If we can't find one then increment
> +	 * context_version and flush all ASIDs.
> +	 */
> +	asid = find_next_zero_bit(context_asid_map, num_asids, cur_idx);
> +	if (asid != num_asids)
> +		goto set_asid;
> +
> +	/* We're out of ASIDs, so increment the global version count */
> +	ver = atomic64_add_return_relaxed(first_version,
> +					  &context_version);
> +
> +	__flush_context();
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
> +	u64 cntx, old_active_cntx;
> +
> +	cntx = atomic64_read(&mm->context.id);
> +
> +	/*
> +	 * If our active_context is non-zero and the context matches the
> +	 * current version, then we update the active_context entry with a
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
> +	old_active_cntx = atomic64_read(&per_cpu(active_context, cpu));
> +	if (old_active_cntx &&
> +	    !((cntx ^ atomic64_read(&context_version)) >> asid_bits) &&
> +	    atomic64_cmpxchg_relaxed(&per_cpu(active_context, cpu),
> +				     old_active_cntx, cntx))
> +		goto switch_mm_fast;
> +
> +	raw_spin_lock_irqsave(&context_lock, flags);
> +
> +	/* Check that our ASID belongs to the current version. */
> +	cntx = atomic64_read(&mm->context.id);
> +	if ((cntx ^ atomic64_read(&context_version)) >> asid_bits) {
> +		cntx = __new_context(mm);
> +		atomic64_set(&mm->context.id, cntx);
> +	}
> +
> +	if (cpumask_test_and_clear_cpu(cpu, &context_tlb_flush_pending))
> +		local_flush_tlb_all();
> +
> +	atomic64_set(&per_cpu(active_context, cpu), cntx);
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
> +		  ((cntx & asid_mask) << SATP_ASID_SHIFT) | SATP_MODE);
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
> @@ -58,20 +203,55 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
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
> +	unsigned long old, new;
> +
> +	/* Figure-out number of ASID bits in HW */
> +	old = csr_read(sptbr);
> +	new = old | (SATP_ASID_MASK << SATP_ASID_SHIFT);
> +	csr_write(sptbr, new);
> +	new = (csr_read(sptbr) >> SATP_ASID_SHIFT)  & SATP_ASID_MASK;
> +	asid_bits = fls_long(new);
> +	csr_write(sptbr, old);
> +
> +	/* Pre-compute ASID details */
> +	num_asids = 1UL << asid_bits;
> +	asid_mask = num_asids - 1;
> +	first_version = num_asids;
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
> +		atomic64_set(&context_version, first_version);
> +
> +		context_asid_map = kcalloc(BITS_TO_LONGS(num_asids),
> +				   sizeof(*context_asid_map), GFP_KERNEL);
> +		if (!context_asid_map)
> +			panic("Failed to allocate bitmap for %lu ASIDs\n",
> +			      num_asids);
> 
> +		__set_bit(0, context_asid_map);
> +
> +		pr_info("ASID allocator using %lu entries\n", num_asids);
> +	} else {
> +		pr_info("ASID allocator disabled\n");
> +	}
> +
> +	return 0;
> +}
> +early_initcall(asids_init);
> --
> 2.17.1
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
