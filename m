Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB2DC36017
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 02:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqtCRReezh388NcL5ytCc61xHsXXJZZ4CN7QKPJRHj4=; b=BEwz+MFrDY4MYH
	PPzW6O5R4DzpQ5U8MDpQNxRhDIAUBI0ppv9SQEg9mlCypW5pKjnGRkpw28eCcIQqel695X8rJJhqQ
	pSYHT0wC7y350I22x9vcxZDqyum1HE00z3buvZTdd8bn4fR0HnlJGOHsg86EKFJwKEeGMJNaD2imY
	S96vC7NpbLC3MqHMqFxvkvl1c77Huz09wZ88x7qPmIeMEJrFUrI7v2P4cVua2XKZfRJkmQmlZCjPC
	9iQBqr42RLxUZyykiEUJ9JWJRp21Tk7b/s1PrVU2CCiKSdGerIQToCzcWkgFzExopNktWCVlHQQAJ
	JLbufkKtarMsUZKkFRwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzRkx-00000001opp-1vYL;
	Tue, 01 Apr 2025 02:53:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzRjB-00000001ofn-44ZF;
	Tue, 01 Apr 2025 02:51:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F36714BF;
	Mon, 31 Mar 2025 19:51:49 -0700 (PDT)
Received: from [10.162.16.153] (unknown [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 018F23F59E;
	Mon, 31 Mar 2025 19:51:39 -0700 (PDT)
Message-ID: <86a276d6-afe3-4c70-aa85-7cafe33b8e5c@arm.com>
Date: Tue, 1 Apr 2025 08:21:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/ptdump: Split note_page() into level specific
 callbacks
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20250317061818.16244-1-anshuman.khandual@arm.com>
 <20250317061818.16244-2-anshuman.khandual@arm.com>
 <Z+pZX2QmFnNnnjZ5@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <Z+pZX2QmFnNnnjZ5@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_195150_056876_15F656CD 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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



On 3/31/25 14:29, Alexander Gordeev wrote:
> On Mon, Mar 17, 2025 at 11:48:17AM +0530, Anshuman Khandual wrote:
> 
> Hi Anshuman,
> 
> ...
>> --- a/include/linux/ptdump.h
>> +++ b/include/linux/ptdump.h
>> @@ -11,9 +11,12 @@ struct ptdump_range {
>>  };
>>  
>>  struct ptdump_state {
>> -	/* level is 0:PGD to 4:PTE, or -1 if unknown */
>> -	void (*note_page)(struct ptdump_state *st, unsigned long addr,
>> -			  int level, u64 val);
>> +	void (*note_page_pte)(struct ptdump_state *st, unsigned long addr, pte_t pte);
>> +	void (*note_page_pmd)(struct ptdump_state *st, unsigned long addr, pmd_t pmd);
>> +	void (*note_page_pud)(struct ptdump_state *st, unsigned long addr, pud_t pud);
>> +	void (*note_page_p4d)(struct ptdump_state *st, unsigned long addr, p4d_t p4d);
>> +	void (*note_page_pgd)(struct ptdump_state *st, unsigned long addr, pgd_t pgd);
>> +	void (*note_page_flush)(struct ptdump_state *st);
>>  	void (*effective_prot)(struct ptdump_state *st, int level, u64 val);
> 
> Should you treat effective_prot() similarly?

Agreed. effective_prot() also uses pxd_val() derived data type in generic MM and
might cause the same problem later going ahead. Will split the helper into level
specific callbacks as well.

> 
>>  	const struct ptdump_range *range;
>>  };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
