Return-Path: <SRS0=9B1f=64=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4F1C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 May 2020 11:43:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD977206DA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 May 2020 11:43:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ap8wrfqg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD977206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CBibW22JKkDJXOWgVaZftgqGi2ljMCVjMmAYhaBRKU=; b=ap8wrfqgXkDckm
	AnRv5btrt/OfUZVLyIXsHwTfcdG7wBowVYyJDVj2nUM9mcqwc4ylzV4bx9aU8VlS5Q8i/vbuAmNoH
	o5psX8ouvuZBqeTndi+STGiGrX69dbCVPlthynsg3fZJtyxI8wumtBkZfqRDqW0HlldCyHeYIsHOz
	xDqBzPpJKlfznAvB6cFGy5Ffc7Q6xMaHDhRXGiTpnjRDol60K1xyjvfFytJ7rXOsHXwUiR9qd0pXT
	J08+8ZFsqiiT83hHrYrjVLqhsguq5DNWwzbd6BLogds1YfoYhLK8oGL3omHGMKVz8nvAy4vLIjbYV
	96c+Cdcm9HDrFRck3tRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZCGd-0007U7-Hg; Thu, 14 May 2020 11:43:11 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZCGa-0007TO-6C
 for linux-riscv@lists.infradead.org; Thu, 14 May 2020 11:43:10 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 393189755B08008A272F;
 Thu, 14 May 2020 19:42:59 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.93) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 14 May 2020
 19:42:48 +0800
Subject: Re: [PATCH 04/10] riscv: Fix print_vm_layout build error if NOMMU
To: Alex Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20200511022001.179767-1-wangkefeng.wang@huawei.com>
 <20200511022001.179767-5-wangkefeng.wang@huawei.com>
 <1daca195-f63c-2693-068f-6d624aa1b899@ghiti.fr>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <669a4a33-42cc-1f5d-a0f5-37ab18a8a371@huawei.com>
Date: Thu, 14 May 2020 19:42:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1daca195-f63c-2693-068f-6d624aa1b899@ghiti.fr>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.166.215.93]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_044308_397798_6E5E50CE 
X-CRM114-Status: GOOD (  10.87  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Hulk Robot <hulkci@huawei.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


On 2020/5/14 18:10, Alex Ghiti wrote:
> Hi,
>
> On 5/10/20 10:19 PM, Kefeng Wang wrote:
>> arch/riscv/mm/init.c: In function ‘print_vm_layout’:
>> arch/riscv/mm/init.c:68:37: error: ‘FIXADDR_START’ undeclared (first 
>> use in this function);
>> arch/riscv/mm/init.c:69:20: error: ‘FIXADDR_TOP’ undeclared
>> arch/riscv/mm/init.c:70:37: error: ‘PCI_IO_START’ undeclared
>> arch/riscv/mm/init.c:71:20: error: ‘PCI_IO_END’ undeclared
>> arch/riscv/mm/init.c:72:38: error: ‘VMEMMAP_START’ undeclared
>> arch/riscv/mm/init.c:73:20: error: ‘VMEMMAP_END’ undeclared (first 
>> use in this function);
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>   arch/riscv/mm/init.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index dfcaebc3928f..58c39c44b9c9 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -49,7 +49,7 @@ static void setup_zero_page(void)
>>       memset((void *)empty_zero_page, 0, PAGE_SIZE);
>>   }
>>   -#ifdef CONFIG_DEBUG_VM
>> +#if defined(CONFIG_MMU) && defined(DEBUG_VM)
>
>
> Shouldn't it be CONFIG_DEBUG_VM ?
oops, should be CONFIG_DEBUG_VM, will send v2, thanks.
>
>
>>   static inline void print_mlk(char *name, unsigned long b, unsigned 
>> long t)
>>   {
>>       pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld kB)\n", name, b, t,
>
>
> Alex
>
>
> .
>


