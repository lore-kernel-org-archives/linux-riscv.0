Return-Path: <SRS0=Cgvv=JL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26CCCC433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 07:03:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75D6E613CC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 07:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75D6E613CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nuAZFiftmUAi85Z7taTmz/JCozmC0LrCbjyd/l3ryq0=; b=j+rUIlrEfIs9pW5xvWJrZYkYj
	7nZknSqdvtp8sYExhnygrkSjUsfq3uFh+6IPITlQGuwrlEM2UNFnQwqOS9cxHr/FTDLj9G4er2zYb
	o1hKgp3rkm4sH2KjmEq09v5evRq0rsDuduHLhPbh1yimXAKkVkoTSg11ZmtneVPtHrNA3r6i17REg
	oT/7VIOsZD4J1ktEaxQIH+KFTqG0Xq+wBLs16YHHGa9kPQ+baTq6ruzbSbmeuc+wQBCzIpm0Yq4Y4
	2rXrFFzbyicRH8cIL6Xd3xQp7hY2LNyRZZ3JbEQxhMBPmuda1mZnbYCdVY0QDVbNC35NWSX5nG4hJ
	AgKDlAMUQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWZYe-00Bm7R-G3; Wed, 14 Apr 2021 07:03:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWZYb-00Bm78-MI
 for linux-riscv@desiato.infradead.org; Wed, 14 Apr 2021 07:03:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=QS/+Anhaog1jut7G2LhEz3ZTJ179dZ2t9guwL7RRIH4=; b=lPHF9IoWMCW0/KdPIiDM8f/gB5
 lZukLnwRLSMFl/z6QBq09RIIjOJVBFAQh29sCdbGY9xUIlxCJzDP0dEvbiiavcSwXXe8PuSJh5fPl
 37K8DWMPYS38XVpTIiPXZl2S4Fso2msBW06Zl2oGtEz5EJBJJSr4OAglVadVSNmQwT04/uthgENAp
 qYkBmA/TbSkQiD+Lh4QhQyUIN3NmPzUeIE2UHgoLoG7ox7gwS50MYFuOLQ93+K1osZWHdjr7DpFMa
 9llj5wiw2/L+XkmpWetknAnGeH1mN8VCmdXUmzygoNvM9iR/kN2xxDoLexpOVBx9VUY8RiczV9aGB
 4J8klKeA==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWZYY-007YXZ-P9
 for linux-riscv@lists.infradead.org; Wed, 14 Apr 2021 07:03:24 +0000
Received: from [172.16.5.113] (82-65-183-113.subs.proxad.net [82.65.183.113])
 (Authenticated sender: alex@ghiti.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4E84B100006;
 Wed, 14 Apr 2021 07:03:14 +0000 (UTC)
Subject: Re: [PATCH] implement flush_cache_vmap for RISC-V
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Jiuyang Liu <liu@jiuyang.me>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Waterman <waterman@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210412000531.12249-1-liu@jiuyang.me>
 <20210412150817.33f49be8@xhacker.debian>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <18d198ac-7bc0-934d-e1e9-eca01b790d61@ghiti.fr>
Date: Wed, 14 Apr 2021 03:03:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210412150817.33f49be8@xhacker.debian>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_000322_969520_96F372A8 
X-CRM114-Status: GOOD (  21.70  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

Le 4/12/21 =E0 3:08 AM, Jisheng Zhang a =E9crit=A0:
> Hi Jiuyang,
> =

> On Mon, 12 Apr 2021 00:05:30 +0000 Jiuyang Liu <liu@jiuyang.me> wrote:
> =

> =

>>
>> This patch implements flush_cache_vmap for RISC-V, since it modifies PTE.
>> Without this patch, SFENCE.VMA won't be added to related codes, which
>> might introduce a bug in the out-of-order micro-architecture
>> implementations.
>>
>> Signed-off-by: Jiuyang Liu <liu@jiuyang.me>
>> Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
>> Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
> =

> IIRC, Palmer hasn't given this Reviewed-by tag.
> =

>> ---
> =

> Could you plz add version and changes? IIRC, this is the v3.
> =

>>   arch/riscv/include/asm/cacheflush.h | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/as=
m/cacheflush.h
>> index 23ff70350992..3fd528badc35 100644
>> --- a/arch/riscv/include/asm/cacheflush.h
>> +++ b/arch/riscv/include/asm/cacheflush.h
>> @@ -30,6 +30,12 @@ static inline void flush_dcache_page(struct page *pag=
e)
>>   #define flush_icache_user_page(vma, pg, addr, len) \
>>          flush_icache_mm(vma->vm_mm, 0)
>>
>> +/*
>> + * flush_cache_vmap is invoked after map_kernel_range() has installed t=
he page
>> + * table entries, which modifies PTE, SFENCE.VMA should be inserted.
> =

> Just my humble opinion, flush_cache_vmap() may not be necessary. vmalloc_=
fault
> can take care of this, and finally sfence.vma is inserted in related path.
> =



I believe Palmer and Jisheng are right, my initial proposal to implement =

flush_cache_vmap is wrong.

But then, Jiuyang should not have noticed any problem here, so what's =

wrong? @Jiuyang: Does implementing flush_cache_vmap fix your issue?

And regarding flush_cache_vunmap, from Jisheng call stack, it seems also =

not necessary.

@Jiuyang: Can you tell us more about what you noticed?


> Regards
> =

>> + */
>> +#define flush_cache_vmap(start, end) flush_tlb_all()
>> +
>>   #ifndef CONFIG_SMP
>>
>>   #define flush_icache_all() local_flush_icache_all()
>> --
>> 2.31.1
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
