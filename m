Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89094C54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 17:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SgGJ/RwAdkeuco+ZkJvLr8dENTMuQH4OI9VJGCsFvY=; b=s+J/yekkHeTKP7
	BndiL0jrPKyOO41avqyIjkSSwjChqxrFdmYqjqvYcUa88freGRhEqvFfJE91tWbitBwMfjWiRiasn
	ZTSmxcsvyICvRpBbQzIyxVCDL4xhUJV7lWp3SFuOCWpcUk1GehqOrdNcQD03McPX/tUpblHsMsQ2u
	EIR5yusfKNGlPeoSTKb25+XQ9vOm8f9P5vRcJuPaID/9x5IDSVLLDirn6OsP2NLiy6EZm+LgQT0z4
	iGq6Xt2mlakIJv0OHemaB1kl6j4UBXEpqVs0VSpkO3AgnhMjvqFmgdJgZNQVxLicoe1SgW1y5YjWK
	bV4cvz3PChuz0Ab/SR9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvnx-002rvU-3F; Mon, 09 Jan 2023 17:19:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvni-002rns-0o; Mon, 09 Jan 2023 17:19:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DD342611CA;
	Mon,  9 Jan 2023 17:19:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167BBC433F0;
	Mon,  9 Jan 2023 17:19:02 +0000 (UTC)
Date: Mon, 9 Jan 2023 17:19:00 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Barry Song <21cnbao@gmail.com>
Cc: Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	x86@kernel.org, will@kernel.org, anshuman.khandual@arm.com,
	linux-doc@vger.kernel.org, corbet@lwn.net, peterz@infradead.org,
	arnd@arndb.de, punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org, darren@os.amperecomputing.com,
	yangyicong@hisilicon.com, huzhanyuan@oppo.com, lipeifeng@oppo.com,
	zhangshiming@oppo.com, guojian@oppo.com, realmz6@gmail.com,
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, wangkefeng.wang@huawei.com,
	xhao@linux.alibaba.com, prime.zeng@hisilicon.com,
	Barry Song <v-songbaohua@oppo.com>, Nadav Amit <namit@vmware.com>,
	Mel Gorman <mgorman@suse.de>
Subject: Re: [PATCH v7 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
Message-ID: <Y7xMhPTAwcUT4O6b@arm.com>
References: <20221117082648.47526-1-yangyicong@huawei.com>
 <20221117082648.47526-3-yangyicong@huawei.com>
 <Y7cToj5mWd1ZbMyQ@arm.com>
 <CAGsJ_4yC0i6MYwvosRSrdQ1iT7n88ypmK3aOQJkuusqNKtddtg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGsJ_4yC0i6MYwvosRSrdQ1iT7n88ypmK3aOQJkuusqNKtddtg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_091910_183892_41DEA25D 
X-CRM114-Status: GOOD (  29.82  )
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

On Sun, Jan 08, 2023 at 06:48:41PM +0800, Barry Song wrote:
> On Fri, Jan 6, 2023 at 2:15 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > On Thu, Nov 17, 2022 at 04:26:48PM +0800, Yicong Yang wrote:
> > > It is tested on 4,8,128 CPU platforms and shows to be beneficial on
> > > large systems but may not have improvement on small systems like on
> > > a 4 CPU platform. So make ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH depends
> > > on CONFIG_EXPERT for this stage and make this disabled on systems
> > > with less than 8 CPUs. User can modify this threshold according to
> > > their own platforms by CONFIG_NR_CPUS_FOR_BATCHED_TLB.
> >
> > What's the overhead of such batching on systems with 4 or fewer CPUs? If
> > it isn't noticeable, I'd rather have it always on than some number
> > chosen on whichever SoC you tested.
> 
> On the one hand, tlb flush is cheap on a small system. so batching tlb flush
> helps very minorly.

Yes, it probably won't help on small systems but I don't like config
options choosing the threshold, which may be different from system to
system even if they have the same number of CPUs. A run-time tunable
would be a better option.

> On the other hand, since we have batched the tlb flush, new PTEs might be
> invisible to others before the final broadcast is done and Ack-ed.

The new PTEs could indeed be invisible at the TLB level but not at the
memory (page table) level since this is done under the PTL IIUC.

> thus, there
> is a risk someone else might do mprotect or similar things  on those deferred
> pages which will ask for read-modify-write on those deferred PTEs.

And this should be fine, we have things like the PTL in place for the
actual memory access to the page table.

> in this
> case, mm will do an explicit flush by flush_tlb_batched_pending which is
> not required if tlb flush is not deferred.

I don't fully understand why it's needed, or at least why it would be
needed on arm64. At the end of an mprotect(), we have the final PTEs in
place and we just need to issue a TLBI for that range.
change_pte_range() for example has a tlb_flush_pte_range() if the PTE
was present and that won't be done lazily. If there are other TLBIs
pending for the same range, they'll be done later though likely
unnecessarily but still cheaper than issuing a flush_tlb_mm().

> void flush_tlb_batched_pending(struct mm_struct *mm)
> {
>        int batch = atomic_read(&mm->tlb_flush_batched);
>        int pending = batch & TLB_FLUSH_BATCH_PENDING_MASK;
>        int flushed = batch >> TLB_FLUSH_BATCH_FLUSHED_SHIFT;
> 
>        if (pending != flushed) {
>                flush_tlb_mm(mm);
>         /*
>          * If the new TLB flushing is pending during flushing, leave
>          * mm->tlb_flush_batched as is, to avoid losing flushing.
>         */
>       atomic_cmpxchg(&mm->tlb_flush_batched, batch,
>            pending | (pending << TLB_FLUSH_BATCH_FLUSHED_SHIFT));
>      }
> }

I guess this works on x86 better as it avoids the IPIs if this flush
already happened. But on arm64 we already issued the TLBI, we just
didn't wait for it to complete via a DSB.

> I believe Anshuman has contributed many points on this in those previous
> discussions.

Yeah, I should re-read the old threads.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
