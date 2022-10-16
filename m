Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96826C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Oct 2022 14:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDj/3+Ugi+mmEo1yJU3PPhrkSIYEQJ+U4a1dDag6XjE=; b=MNMcikLyo2TUgf
	Ky24+yOQz0sqA77npE8GQtykttPHKH2iVDdEcMN4sN/wR5xPP/vlhqCKalJ90IWTKa86oU+U4Ont/
	90qqW95jX75mskrEUxUyEHwdqfj+ileoNM3Ynb9v0jO46rMBj0VsNlY8wjXA/IDh91G6bt9PFnUAg
	LX3WKZE6b5F4za7Wrqx2RiJ7W+DaVQe1FVV9K/khVvmJnEb4D1v1lHNDek2PcwM1VZKkbF0qDm/CQ
	JK3rG/4NZtu2IgB5Bl1Sb1T3uXqJkvKVX6apVaCll+YHdqUNZBhkTPHYBxg9Ll4njVYDUzTIDiXjH
	zV4PZgFd2GK/ocFHQXvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ok4pN-001o9H-WE; Sun, 16 Oct 2022 14:41:22 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ok4pK-001o6b-31
	for linux-riscv@lists.infradead.org; Sun, 16 Oct 2022 14:41:20 +0000
Received: from [192.168.30.126] (unknown [124.16.141.241])
	by APP-05 (Coremail) with SMTP id zQCowAAnLbH9F0xj5uJ3BQ--.36578S3;
	Sun, 16 Oct 2022 22:41:02 +0800 (CST)
Message-ID: <f093d2fe-68a5-1dc6-cb6b-477248d94f55@iscas.ac.cn>
Date: Sun, 16 Oct 2022 22:41:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v1 1/1] riscv: mm: call best_map_size many times during
 linear-mapping
To: palmer@dabbelt.com
Cc: linux-riscv@lists.infradead.org, jeff@riscv.org, xuyinan@ict.ac.cn,
 Andrew Jones <ajones@ventanamicro.com>
References: <20221006021223.3091711-1-panqinglin2020@iscas.ac.cn>
 <20221006122719.tu5zhozl65ttwccc@kamzik>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <20221006122719.tu5zhozl65ttwccc@kamzik>
X-CM-TRANSID: zQCowAAnLbH9F0xj5uJ3BQ--.36578S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1fKFykJFW7Zry5ur47twb_yoW8Ww1fpr
	1SyF1Uur4FvF4DuFWaq3WUXF1Y93Z3K3W2g3yjka4DAF97JrnI9r4UKrWFkry8XrZ7Ww4r
	AF4vy3yru34YyaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r
	18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l
	c7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU0UrcDUUUUU==
X-Originating-IP: [124.16.141.241]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiAwEBDGNLvKpQIAABsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221016_074118_550372_B65440EE 
X-CRM114-Status: GOOD (  12.37  )
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

Hi Palmer,

ping?

Thanks
Qinglin

On 10/6/22 8:28 PM, Andrew Jones wrote:
> On Thu, Oct 06, 2022 at 10:12:23AM +0800, panqinglin2020@iscas.ac.cn wrote:
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> Modify the best_map_size function to give map_size many times instead
>> of only once, so a memory region can be mapped by both PMD_SIZE and
>> PAGE_SIZE.
>>
>> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>> ---
>>   arch/riscv/mm/init.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index b56a0a75533f..1b76d3fe4e26 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -673,10 +673,11 @@ void __init create_pgd_mapping(pgd_t *pgdp,
>>   static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
>>   {
>>   	/* Upgrade to PMD_SIZE mappings whenever possible */
>> -	if ((base & (PMD_SIZE - 1)) || (size & (PMD_SIZE - 1)))
>> -		return PAGE_SIZE;
>> +	base &= PMD_SIZE - 1;
>> +	if (!base && size >= PMD_SIZE)
>> +		return PMD_SIZE;
>>   
>> -	return PMD_SIZE;
>> +	return PAGE_SIZE;
>>   }
>>   
>>   #ifdef CONFIG_XIP_KERNEL
>> @@ -1111,9 +1112,9 @@ static void __init setup_vm_final(void)
>>   		if (end >= __pa(PAGE_OFFSET) + memory_limit)
>>   			end = __pa(PAGE_OFFSET) + memory_limit;
>>   
>> -		map_size = best_map_size(start, end - start);
>>   		for (pa = start; pa < end; pa += map_size) {
>>   			va = (uintptr_t)__va(pa);
>> +			map_size = best_map_size(pa, end - pa);
>>   
>>   			create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
>>   					   pgprot_from_va(va));
>> -- 
>> 2.35.1
>>
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
