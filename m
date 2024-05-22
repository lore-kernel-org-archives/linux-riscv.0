Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871FEC25B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 11:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/IdFznYkYJhX2wef08nJcJgC4iJahQuIxwLw5XBI9M=; b=Hj2TL+6X4BxToy
	KcRUd//+N1FYZ481oEBANdHlUApy+Z1dRTw9PQeSODyso01gR8T1snexUaw9/V+ecgspdAChMqXA9
	t6Rw9pgKEFo0X4LE90I5gFXMRXYSfXJ7dltYdAnReSWGhIItLrOx4QJNeByfhnL/SSLNUqZmz089f
	SrsMkui0FYNvhTrwVj+Q98c6wDiIrXD62lKHy6klu2JPjzAVPFglBqTZNaZM5kHW3eF2fyb7FPGD9
	5TIZmslLegYI7ykCSFspAkIxMPMXZ8EyTA8hkzOq0/JMkIyJzEwRfoXbz5rO5uL84X/AUcZqHJKAD
	3ZfoobGFuxJl5epMsF3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9k3X-00000002lue-2kml;
	Wed, 22 May 2024 11:22:51 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9k3Q-00000002lrc-0Ln1
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 11:22:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E86A61BF207;
	Wed, 22 May 2024 11:22:32 +0000 (UTC)
Message-ID: <fd2100a8-a17c-460c-a8e8-b5cede3d51c1@ghiti.fr>
Date: Wed, 22 May 2024 13:22:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: rewrite __kernel_map_pages() to fix sleeping
 in invalid context
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <cover.1715750938.git.namcao@linutronix.de>
 <1289ecba9606a19917bc12b6c27da8aa23e1e5ae.1715750938.git.namcao@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <1289ecba9606a19917bc12b6c27da8aa23e1e5ae.1715750938.git.namcao@linutronix.de>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_042244_446162_6E8ADCB5 
X-CRM114-Status: GOOD (  19.51  )
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

On 15/05/2024 07:50, Nam Cao wrote:
> __kernel_map_pages() is a debug function which clears the valid bit in page
> table entry for deallocated pages to detect illegal memory accesses to
> freed pages.
>
> This function set/clear the valid bit using __set_memory(). __set_memory()
> acquires init_mm's semaphore, and this operation may sleep. This is
> problematic, because  __kernel_map_pages() can be called in atomic context,
> and thus is illegal to sleep. An example warning that this causes:
>
> BUG: sleeping function called from invalid context at kernel/locking/rwsem.c:1578
> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 2, name: kthreadd
> preempt_count: 2, expected: 0
> CPU: 0 PID: 2 Comm: kthreadd Not tainted 6.9.0-g1d4c6d784ef6 #37
> Hardware name: riscv-virtio,qemu (DT)
> Call Trace:
> [<ffffffff800060dc>] dump_backtrace+0x1c/0x24
> [<ffffffff8091ef6e>] show_stack+0x2c/0x38
> [<ffffffff8092baf8>] dump_stack_lvl+0x5a/0x72
> [<ffffffff8092bb24>] dump_stack+0x14/0x1c
> [<ffffffff8003b7ac>] __might_resched+0x104/0x10e
> [<ffffffff8003b7f4>] __might_sleep+0x3e/0x62
> [<ffffffff8093276a>] down_write+0x20/0x72
> [<ffffffff8000cf00>] __set_memory+0x82/0x2fa
> [<ffffffff8000d324>] __kernel_map_pages+0x5a/0xd4
> [<ffffffff80196cca>] __alloc_pages_bulk+0x3b2/0x43a
> [<ffffffff8018ee82>] __vmalloc_node_range+0x196/0x6ba
> [<ffffffff80011904>] copy_process+0x72c/0x17ec
> [<ffffffff80012ab4>] kernel_clone+0x60/0x2fe
> [<ffffffff80012f62>] kernel_thread+0x82/0xa0
> [<ffffffff8003552c>] kthreadd+0x14a/0x1be
> [<ffffffff809357de>] ret_from_fork+0xe/0x1c
>
> Rewrite this function with apply_to_existing_page_range(). It is fine to
> not have any locking, because __kernel_map_pages() works with pages being
> allocated/deallocated and those pages are not changed by anyone else in the
> meantime.
>
> Fixes: 5fde3db5eb02 ("riscv: add ARCH_SUPPORTS_DEBUG_PAGEALLOC support")
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: stable@vger.kernel.org
> ---
>   arch/riscv/mm/pageattr.c | 28 ++++++++++++++++++++++------
>   1 file changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index 410056a50aa9..271d01a5ba4d 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -387,17 +387,33 @@ int set_direct_map_default_noflush(struct page *page)
>   }
>   
>   #ifdef CONFIG_DEBUG_PAGEALLOC
> +static int debug_pagealloc_set_page(pte_t *pte, unsigned long addr, void *data)
> +{
> +	int enable = *(int *)data;
> +
> +	unsigned long val = pte_val(ptep_get(pte));
> +
> +	if (enable)
> +		val |= _PAGE_PRESENT;
> +	else
> +		val &= ~_PAGE_PRESENT;
> +
> +	set_pte(pte, __pte(val));
> +
> +	return 0;
> +}
> +
>   void __kernel_map_pages(struct page *page, int numpages, int enable)
>   {
>   	if (!debug_pagealloc_enabled())
>   		return;
>   
> -	if (enable)
> -		__set_memory((unsigned long)page_address(page), numpages,
> -			     __pgprot(_PAGE_PRESENT), __pgprot(0));
> -	else
> -		__set_memory((unsigned long)page_address(page), numpages,
> -			     __pgprot(0), __pgprot(_PAGE_PRESENT));
> +	unsigned long start = (unsigned long)page_address(page);
> +	unsigned long size = PAGE_SIZE * numpages;
> +
> +	apply_to_existing_page_range(&init_mm, start, size, debug_pagealloc_set_page, &enable);
> +
> +	flush_tlb_kernel_range(start, start + size);
>   }
>   #endif
>   


And you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks!

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
