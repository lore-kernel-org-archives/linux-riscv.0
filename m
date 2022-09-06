Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C762FECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 11:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxV66zoRXmhhzFbmlshSud+leG5A1mbucpKZT99kQvI=; b=1EbLn5a0RDHrrt
	jU0oVwfqw4stSh/Scnt5OlBO6NQpKp9mm7CtXmtkQG58G6bJ02T+qz9qtNFQ5n8Sr7x3WWkhr1IUl
	DBVvulebgoLSf90gNOPgrT0xmDwuC7w6ABeN3Esey8+pilSVXXcKnrna9jMXRqHylFunOrTQs6TvC
	t5X81vaxNEjA8woEYBmGCSINbyhfzjDKPaNCsB33NIlP8x8uaZv46EfSVCBFVVrtXj4cu+dpKfNGu
	Sn/sd8BPqJ52fWLyy+wP3VSJnKXvszZQy6NdhkkfL/TCbwJyLtcqNLcL4rye8NA5iTDA7dBHq9Kek
	8nX5Vduce0eNklKLRnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVWYJ-00Cnw6-Kx; Tue, 06 Sep 2022 11:15:35 +0000
Received: from m12-15.163.com ([220.181.12.15])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVWYG-00Cnud-Cj
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 11:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=2O36e
	ECB5BuZ0d6JGjlpKqyVLf4hom/1qxnJ/phFFe0=; b=ZB6xj1t0TxGh5nWoee937
	+fav66yp0tyaoIrGTHB9CKScYrTssJdZDzLnApzGZcXQtwQ5y+mQ30l1CSckvV+E
	X9QuGtvIy9Juw486axkOZqU+ZRIDR0lLvZMcxRTJdNputQxvgyqe+2YdBnqPMDZD
	c2Ti2wRf07qvzTQPP0b3Y8=
Received: from whoami-VirtualBox.. (unknown [223.72.91.155])
	by smtp11 (Coremail) with SMTP id D8CowAAngYjFJxdjoZMDAQ--.5323S2;
	Tue, 06 Sep 2022 18:58:13 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: conor.dooley@microchip.com
Cc: akpm@linux-foundation.org,
	alexandre.ghiti@canonical.com,
	anshuman.khandual@arm.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atishp@rivosinc.com,
	falcon@tinylab.org,
	guoren@kernel.org,
	heiko@sntech.de,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	panqinglin2020@iscas.ac.cn,
	paul.walmsley@sifive.com,
	sunnanyong@huawei.com,
	tjytimi@163.com,
	tongtiangen@huawei.com
Subject: Re:Re: [PATCH v2] riscv: make update_mmu_cache to support asid
Date: Tue,  6 Sep 2022 18:57:56 +0800
Message-Id: <20220906105756.6082-1-tjytimi@163.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <7e17ceaf-6648-e099-d526-8b698eaa5a04@microchip.com>
References: <7e17ceaf-6648-e099-d526-8b698eaa5a04@microchip.com>
MIME-Version: 1.0
X-CM-TRANSID: D8CowAAngYjFJxdjoZMDAQ--.5323S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF48Gr4fXrWUKFyUXrWUArb_yoWrJrW7pF
	srGan5KayfGr97Gry2qrnI9r17Xw4kK3WayrWSvrW5twsIgF1UKF9xKry09r1rJFy8WrWI
	kayjyr13u3yYywUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRRwZrUUUUU=
X-Originating-IP: [223.72.91.155]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/1tbiTgV0eFUDRgewlQAAs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_041532_777478_412E646F 
X-CRM114-Status: GOOD (  12.64  )
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

Thanks for your guidance.^ ^

Sincerely yours,
Jinyu

At 2022-09-04 21:49:31, Conor.Dooley@microchip.com wrote:
>On 04/09/2022 14:37, Jinyu Tang wrote:
>> The `update_mmu_cache` function in riscv flush tlb cache without asid
>
>FWIW, when referring to functions please put the () at the end.
>Makes the changelog more natural to read. You do not need to make
>a v3 for that though.
>
>Thanks,
>Conor.
>
>> information now, which will flush tlbs in other tasks' address space
>> even if processor supports asid. So add a new function
>> `flush_tlb_local_one_page` to flush local one page whether processor
>> supports asid or not,for cases that need to flush local one page like
>> function `update_mmu_cache`.
>> 
>> Signed-off-by: Jinyu Tang <tjytimi@163.com>
>> ---
>> RFC V1 -> V2 : 
>> 1.Rebased on PATCH9 of IPI imporvement series as Anup Patel
>> suggestion. 
>> 2.Make commit log more clear.
>> 
>>  arch/riscv/include/asm/pgtable.h  |  2 +-
>>  arch/riscv/include/asm/tlbflush.h |  2 ++
>>  arch/riscv/mm/tlbflush.c          | 11 +++++++++++
>>  3 files changed, 14 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> index 7ec936910a96..09ccefa6b6c7 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -415,7 +415,7 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
>>  	 * Relying on flush_tlb_fix_spurious_fault would suffice, but
>>  	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
>>  	 */
>> -	local_flush_tlb_page(address);
>> +	flush_tlb_local_one_page(vma, address);
>>  }
>>  
>>  static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
>> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
>> index 801019381dea..120aeb1c6ecf 100644
>> --- a/arch/riscv/include/asm/tlbflush.h
>> +++ b/arch/riscv/include/asm/tlbflush.h
>> @@ -30,6 +30,7 @@ static inline void local_flush_tlb_page(unsigned long addr)
>>  #if defined(CONFIG_SMP) && defined(CONFIG_MMU)
>>  void flush_tlb_all(void);
>>  void flush_tlb_mm(struct mm_struct *mm);
>> +void flush_tlb_local_one_page(struct vm_area_struct *vma, unsigned long addr);
>>  void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
>>  void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>>  		     unsigned long end);
>> @@ -42,6 +43,7 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>>  
>>  #define flush_tlb_all() local_flush_tlb_all()
>>  #define flush_tlb_page(vma, addr) local_flush_tlb_page(addr)
>> +#define flush_tlb_local_one_page(vma, addr) local_flush_tlb_page(addr)
>>  
>>  static inline void flush_tlb_range(struct vm_area_struct *vma,
>>  		unsigned long start, unsigned long end)
>> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
>> index 27a7db8eb2c4..0843e1baaf34 100644
>> --- a/arch/riscv/mm/tlbflush.c
>> +++ b/arch/riscv/mm/tlbflush.c
>> @@ -41,6 +41,17 @@ static inline void local_flush_tlb_range_asid(unsigned long start,
>>  		local_flush_tlb_all_asid(asid);
>>  }
>>  
>> +void flush_tlb_local_one_page(struct vm_area_struct *vma, unsigned long addr)
>> +{
>> +	if (static_branch_unlikely(&use_asid_allocator)) {
>> +		unsigned long asid = atomic_long_read(&vma->vm_mm->context.id);
>> +
>> +		local_flush_tlb_page_asid(addr, asid);
>> +	} else {
>> +		local_flush_tlb_page(addr);
>> +	}
>> +}
>> +
>>  static void __ipi_flush_tlb_all(void *info)
>>  {
>>  	local_flush_tlb_all();


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
