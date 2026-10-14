Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F618CC6B27
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 07:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=puNpiSxJFpus8VmshFKHNpL/C+i9dqiT0+vxGV1omgo=; b=tQp0D8pMhhjV3q
	RiugfK2LmV9aUf/sC0B/JsfiaOAJx8Hs5VutDzlskpx/YQaPAPZi0CakPzHKn7YAdKQyFHvgpP/Pr
	DRRLGzFEA4JD8c5ZMxp4kLSZ6FokVniLP3GcZVKDEx+8vqXgueLrIQr+8e4tJUfxBppECGU6GhMPV
	yx0p/mSJldQ5EVHWUIxv1OqE9kzzxUsQAuqPeIcNIBrG5ZX851je2+hE+esZzheBOCdlQl4VvnUV/
	fSyGSvrEJuaK3wrRXbsJvUHwMDHdJwJrTylT3Br1ythdpFVmqXJvOoeYgGUP1anx357opkuVeUor8
	JrIjoBODBZOYfQwvBHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtqf-0000000EpXY-1Gu7;
	Wed, 14 Oct 2026 07:56:29 +0000
Received: from out-137.mta0.migadu.com ([2001:41d0:1004:224b::89] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtqb-0000000EpWp-0iGb
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 07:56:28 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=3NakkYm+exfqHeo87l+Jy3RJZBZS8mbhTiQS6F5ENvk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791964582; v=1; x=1792569382;
 b=KgfDKtGlnya+w0y+13eDfqGYwadeUvStcnSjdRAXRZPy/w4ajj0Yu1rBDQ1hqaulwiQkV10G
 TBiORH9tEtm52K4jwFva0QEuVVFkuvUSmTzHiLNz9qiE/zk15Gsg+ZFlKVkSI9pJdKeHfueUC/x
 68XbzPnENWRiOxSmlLisNpgE=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 38737ea13a66a289;
	Wed, 14 Oct 2026 07:56:22 +0000
X-Mizu-Trace-ID: 38737ea13a66a289
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: pjw@kernel.org,
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
Date: Wed, 14 Oct 2026 15:56:16 +0800
Message-ID: <20261014075616.76429-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261007113345.32755-1-lance.yang@linux.dev>
References: <20261007113345.32755-1-lance.yang@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_005625_951403_FD0B222F 
X-CRM114-Status: GOOD (  14.73  )
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


On Wed, Oct 07, 2026 at 07:33:45PM +0800, Lance Yang wrote:
>
>On Wed, Oct 07, 2026 at 01:01:14PM +0200, David Hildenbrand (Arm) wrote:
>>On 10/5/26 15:46, Lance Yang wrote:
>>> 
>>> On Mon, Oct 05, 2026 at 12:37:20PM +0200, David Hildenbrand (Arm) wrote:
>>>> On 10/4/26 05:03, Lance Yang wrote:
>>>>> RISC-V uses _PAGE_EXEC for swap soft-dirty tracking when
>>>>> CONFIG_MEM_SOFT_DIRTY is enabled and Svrsw60t59b is available. That's
>>>>> a problem for PMD migration entries, since pmd_present() also checks
>>>>> _PAGE_LEAF (R/W/X) to recognize THPs with _PAGE_PRESENT temporarily
>>>>> cleared during splitting.
>>>>
>>>> I'm curious: why do we have to set leaf indications for non-present things? The
>>>> HW sure will ignore it, right?
>>> 
>>> Yeah, that surprised me too :) Still wrapping my head around the details
>>> ...
>>> 
>>>> Is this a sw problem? Who needs that?
>>> 
>>> IIUC, it's for software during a PMD split.
>>> 
>>> __split_huge_pmd_locked() invalidates the huge PMD and flushes the TLB
>>> before installing the PTE table. Software still needs pmd_present() and
>>> pmd_trans_huge() to recognize the THP in between.
>>> 
>>> RISC-V clears V but keeps the R/W/X bits for that, so the entry is invalid
>>> to hardware but still identifiable as a THP by software.
>>> 
>>> Hopefully I didn't miss something.
>>
>>I thought some change we performed to GUP-fast wouldn't require that anymore.
>>But my memory is a bit vague ... :)
>
>Yeah, I'll have another look at that :)

Emm ... I'm back. Do you mean 4b471e8898c3, which removed the GUP-fast
pmd_trans_splitting() check after the THP refcounting rework? That check
made GUP-fast bail out during the old THP split. The refcounting rework
made extra GUP references prevent the physical split :)

RISC-V gained THP support in 2021 (e88b333142e4), after
pmd_trans_splitting() had been removed. It never implemented that helper.

Keeping R/W/X in an invalidated RISC-V PMD preserves its leaf identity for
software page-table walks. That requirement is separate from the old
GUP-fast splitting check.

For RISC-V, pmd_mkinvalid() clears V and PROT_NONE but keeps R/W/X, so
pmd_present() and pmd_trans_huge() still return true:

#define _PAGE_LEAF (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC)

static inline pmd_t pmd_mkinvalid(pmd_t pmd)
{
	return __pmd(pmd_val(pmd) & ~(_PAGE_PRESENT|_PAGE_PROT_NONE));
}

static inline int pmd_present(pmd_t pmd)
{
	/*
	 * Checking for _PAGE_LEAF is needed too because:
	 * When splitting a THP, split_huge_page() will temporarily clear
	 * the present bit, in this situation, pmd_present() and
	 * pmd_trans_huge() still needs to return true.
	 */
	return (pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROT_NONE | _PAGE_LEAF));
}

static inline bool pmd_leaf(pmd_t pmd)
{
	return pmd_present(pmd) && (pmd_val(pmd) & _PAGE_LEAF);
}

static inline int pmd_trans_huge(pmd_t pmd)
{
	return pmd_leaf(pmd);
}

And the rmap walk also needs that leaf indication. page_vma_mapped_walk()
checks pmd_trans_huge() before taking the PMD lock, then rereads the entry
under the lock. Keeping R/W/X lets it recognize the invalidated THP and
wait for the split to finish :)

Anyway, R/W/X still have a job there (RISC-V doesn't have a separate leaf
bit), and I don't think we can just drop them yet :D

Cheers, Lance

[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
