Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199DECF58D5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2024 06:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UlMPLruCPoEKbPGBQtVD2j+B54cF7lAiVU940mKQPZs=; b=2itRx/8N20oROj
	/IiECnN3i9TbE07R4FuZrwnVEtxf9RpF9SoCUu1XobJePXqe+HBP/flqEwbeoPg2IQSapvh/bb5Je
	MM5WvKbNLVX9lIemVjLUAT84WF86KQhpbinAbCWNrgO8YX7UAVHAqljfry8M0Tox/EbCpC3atZMkb
	LrmPMxmJYQuszPdPNTKs7o+btRRF3irEZwp7Nfl+gzezNinzOswR8XCBq+nqcaPRW3y6x/wlvjX3z
	1VEuU3+yXKTS0biMhbY3YzxTY7fuWYan7JQuuJCL+0G6crLkNyA6SjH+uroLsjIkAoniuF0zRlnHO
	OHJlzMMQh0svYu2JNxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srXM1-0000000BYuT-3PGT;
	Fri, 20 Sep 2024 06:42:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srXLx-0000000BYt2-1tAc
	for linux-riscv@lists.infradead.org;
	Fri, 20 Sep 2024 06:42:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9D0CFEC;
	Thu, 19 Sep 2024 23:43:21 -0700 (PDT)
Received: from [10.163.35.184] (unknown [10.163.35.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5B7E3F66E;
	Thu, 19 Sep 2024 23:42:48 -0700 (PDT)
Message-ID: <925a26e2-bd53-4bf4-b22d-7a0e11581376@arm.com>
Date: Fri, 20 Sep 2024 12:12:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Move set_pxd_safe() helpers from generic to platform
To: Dave Hansen <dave.hansen@intel.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 x86@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240920053017.2514920-1-anshuman.khandual@arm.com>
 <3309e9ca-458b-4b10-8409-9fe315b60ae2@intel.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <3309e9ca-458b-4b10-8409-9fe315b60ae2@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_234253_571668_38A23145 
X-CRM114-Status: GOOD (  10.82  )
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



On 9/20/24 11:19, Dave Hansen wrote:
> On 9/19/24 22:30, Anshuman Khandual wrote:
>> set_pxd_safe() helpers that serve a specific purpose for both x86 and riscv
>> platforms, do not need to be in the common memory code. Otherwise they just
>> unnecessarily make the common API more complicated. This moves the helpers
>> from common code to platform instead.
> 
> I just did a quick grep and don't see any difference between the _safe
> and normal variants.  A quick grep didn't turn up any actual users.
> 
> Did anyone actually double check that these are still needed on x86 in
> the first place?

arch/x86/mm/init_64.c

#define DEFINE_ENTRY(type1, type2, init)                        \
static inline void set_##type1##_init(type1##_t *arg1,          \
                        type2##_t arg2, bool init)              \
{                                                               \
        if (init)                                               \
                set_##type1##_safe(arg1, arg2);                 \
        else                                                    \
                set_##type1(arg1, arg2);                        \
}

DEFINE_ENTRY(p4d, p4d, init)
DEFINE_ENTRY(pud, pud, init)
DEFINE_ENTRY(pmd, pmd, init)
DEFINE_ENTRY(pte, pte, init)

We had triggered a build problem after dropping off set_pte_safe()
which seemed not to be used after normal grep.

https://lore.kernel.org/linux-mm/202409131220.CJ5MlGCG-lkp@intel.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
