Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D478C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Nov 2022 11:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ocwrm7Pu3/m9m47/CKOh8vUrWoM6R1jjPtDVrfleuEE=; b=DXSDPrgNocxLBB
	+X43ZIbmQKvsYDvfJ3jGq2CnkM6thuvnjZ7acghwWyvYQXTeNPDg8acgGWG2DAALh+SXuR2DNea9T
	+FHOqrBJAO4kgewKydGpZco0oqUR6r98X2Y8t3Adky57HNUxBKK/hn0CN2wP71OIb7XywGHQ6YzZE
	3taqtA9Yig5FCfNEDwUK7jEEX5w4Xyr7GnKUYbaQX4Ekafo14g5aKtLDAo2/lbRjoIi0BODySAy3c
	3mObwXtjxMB8uiWZgBuM/KNq/xcLnuFJHBMaW1qkrpgLLp9jKxDApt969hSkKqAPp16zuMnX0a/tF
	ELLn6rPN3fqNJvivqBVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owMIR-00DGTM-97; Sat, 19 Nov 2022 11:46:07 +0000
Received: from smtp23.cstnet.cn ([159.226.251.23] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owMIE-00DGSR-RE
	for linux-riscv@lists.infradead.org; Sat, 19 Nov 2022 11:46:06 +0000
Received: from [198.18.0.1] (unknown [124.16.97.152])
	by APP-03 (Coremail) with SMTP id rQCowACXn5ftwXhjPlUWAA--.19813S3;
	Sat, 19 Nov 2022 19:45:51 +0800 (CST)
Message-ID: <914b3827-1308-5baa-55a6-c1ab1365d0a9@iscas.ac.cn>
Date: Sat, 19 Nov 2022 19:45:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/1] riscv: mm: call best_map_size many times during
 linear-mapping
To: palmer@dabbelt.com
Cc: linux-riscv@lists.infradead.org
References: <20221006021223.3091711-1-panqinglin2020@iscas.ac.cn>
 <20221006122719.tu5zhozl65ttwccc@kamzik>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <20221006122719.tu5zhozl65ttwccc@kamzik>
X-CM-TRANSID: rQCowACXn5ftwXhjPlUWAA--.19813S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1fKFykJFW7Zry5ur47twb_yoW8AryDpr
	4SkF1kur4FvF4UWFWaq3WUXF1Y93Z3K3WxK3yjka4DAF9rJrnI9r4UGrWrCry8ZrZ2gw4r
	AF4vy3yruw1ayaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15Mc
	Ij6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2
	V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_Gw4l42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUcuWlUUUUU
X-Originating-IP: [124.16.97.152]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiAwwPDGN4LxL1RAAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_034604_622390_78C54DB1 
X-CRM114-Status: GOOD (  13.69  )
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

Is there anything I need to change about this patch? :)

Thanks,
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
