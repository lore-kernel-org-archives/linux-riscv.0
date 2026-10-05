Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0F8CA5FF0
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 13:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wReBGla52VOE/3U81TCS7nq7z2xc+ImqK5HqB6pFnDM=; b=0CU+1xYunYxH/0
	vI3LeH5u4PtxvKYykn9kCk5qLltoIiIxyvADZhTAP2mhICL825i/bHJ3u/ALzK94ZqQz1OEmN5BCr
	vONqauD2jV6U1qluXKdDrmBNXVkp7ibKEBgHBei2gVetcZZDKZ2H5hqq95Oy1N/cR7LFtJ7WcN4N5
	2l8plP70nqiLhQmCFfJzKy/TfTQFiZASLgBicV/j8WG4Ae/jhZcXsOveFAW/R9AV/qTq7yRTh1S6y
	pNTTthFyegbdbZb+NOgQtfJF6TpLgzPdBBG19r4zQxbPwQ0djxZpcsnDlgse7AHVEADcYptc1R0/n
	cUfaqVgpmq+7IXT4yX3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDj1r-0000000GZkS-1QkC;
	Mon, 05 Oct 2026 13:46:55 +0000
Received: from out-192.mta0.migadu.com ([2001:41d0:1004:224b::c0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDj1o-0000000GZjT-3nAd
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 13:46:54 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=UPW5rxLXXCUQyxl4itU7Omf05ILDh+oFB7ALgw7XWYk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791208009; v=1; x=1791812809;
 b=tx0L2iTvL1t4Gc/ZauTkCdpHFTdtsUKl8VPxSamBBRMTVwXZ5qqXopDuGeJG4ImvGBpQ9j5S
 +vGxW1iw07Lnb0rcg90dbiqvRzPH+Dp/22EmpQXX0xvY4VM4aGH8mpzWGd6EZYzx/hk5JlnatTg
 yJtBUGrVEm2BY2B+LAGWpIto=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2868cb32e0b71532;
	Mon, 05 Oct 2026 13:46:48 +0000
X-Mizu-Trace-ID: 2868cb32e0b71532
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: lance.yang@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn,
	rppt@kernel.org,
	kas@kernel.org,
	andrew+kernel@donnellan.id.au,
	rmclure@linux.ibm.com,
	debug@rivosinc.com,
	baolin.wang@linux.alibaba.com,
	usama.arif@linux.dev,
	wangruikang@iscas.ac.cn,
	namcao@linutronix.de,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alexghiti@rivosinc.com,
	viro@zeniv.linux.org.uk,
	ajones@ventanamicro.com,
	arnd@arndb.de,
	axelrasmussen@google.com,
	brauner@kernel.org,
	conor.dooley@microchip.com,
	conor@kernel.org,
	jack@suse.cz,
	liam@infradead.org,
	ljs@kernel.org,
	mhocko@suse.com,
	paul.walmsley@sifive.com,
	peterx@redhat.com,
	robh@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	yuanchu@google.com,
	stable@vger.kernel.org,
	pasha.tatashin@soleen.com,
	linux-mm@kvack.org,
	me@ziyao.cc
Subject: Re: [PATCH 1/1] riscv/mm: fix soft-dirty migration PMDs being treated as present
Date: Mon,  5 Oct 2026 21:46:41 +0800
Message-ID: <20261005134641.5801-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <fabd52b6-36a7-442e-9cfb-47a39e4ae3d6@kernel.org>
References: <fabd52b6-36a7-442e-9cfb-47a39e4ae3d6@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_064653_082969_D1236C4A 
X-CRM114-Status: GOOD (  13.34  )
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


On Mon, Oct 05, 2026 at 12:37:20PM +0200, David Hildenbrand (Arm) wrote:
>On 10/4/26 05:03, Lance Yang wrote:
>> RISC-V uses _PAGE_EXEC for swap soft-dirty tracking when
>> CONFIG_MEM_SOFT_DIRTY is enabled and Svrsw60t59b is available. That's
>> a problem for PMD migration entries, since pmd_present() also checks
>> _PAGE_LEAF (R/W/X) to recognize THPs with _PAGE_PRESENT temporarily
>> cleared during splitting.
>
>I'm curious: why do we have to set leaf indications for non-present things? The
>HW sure will ignore it, right?

Yeah, that surprised me too :) Still wrapping my head around the details
...

>Is this a sw problem? Who needs that?

IIUC, it's for software during a PMD split.

__split_huge_pmd_locked() invalidates the huge PMD and flushes the TLB
before installing the PTE table. Software still needs pmd_present() and
pmd_trans_huge() to recognize the THP in between.

RISC-V clears V but keeps the R/W/X bits for that, so the entry is invalid
to hardware but still identifiable as a THP by software.

Hopefully I didn't miss something.

>> 
>> When a soft-dirty THP is migrated, set_pmd_migration_entry() preserves
>> soft-dirty with pmd_swp_mksoft_dirty(), setting the X bit in the
>> migration PMD. Even with _PAGE_PRESENT clear, we end up treating a
>> migration PMD as a present THP! The fault handler skips
>> pmd_migration_entry_wait(), and a write fault can end up in
>> do_huge_pmd_wp_page(), where pmd_page() decodes the migration entry
>> as a mapped PFN.
>
>That sounds bad.

YES, looks a bit off ...

>> 
>> Move the swap soft-dirty bit to bit 12 and start the swap offset at
>> bit 13 when CONFIG_MEM_SOFT_DIRTY is enabled. This keeps R/W/X clear
>> in migration PMDs and lets us keep the existing pmd_present() check
>> for invalidated THPs. Leave the offset at bit 12 when soft-dirty
>> tracking is disabled.
>
>That reduces the effective swap size (and PFN we can store). Could that be a
>problem?

We don't need all 52 bits of the swap offset.

RV64 PFNs only need 44 bits for migration entries, and actual swap is
already limited to about 16 TiB per area with 4 KiB pages by
last_page (__u32) and swap_info_struct.max (unsigned int).

So there's room to reserve a bit without reducing the supported swap
size or PFN range.

CONFIG_MEM_SOFT_DIRTY is only available on RV64, so RV32 keeps its 20-bit
offset.

[...]

Cheers, Lance

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
