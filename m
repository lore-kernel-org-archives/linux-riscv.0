Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA28C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 02:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSfVWtemNef8IAYm4mZdZcR36P0OKa3J50fjt3FOkDo=; b=tqe9EmPEPG/Khe
	55P3xVf4H94xcdI7IfeK3wjae6RKB0jQW77YFd1LQnItJ4WbeW326z4LI0wVMe7xACplqFEFLfZVo
	pwc00riLxKwDAHjpdXAnjCOCNM+kjx6Q+gsAfwFKc0Cd2l0DaKR3KIK09A2ukC31SU/m+E7bf8/HC
	kcghddVdA3T6vmvZ48SJBzlCMnBVYun9KjIN8jWrnx9Fl2yScnPADeUR0v5Gwm0xASvpR4AkuPtuk
	tcY3nU2DR6TF1RD+1H05RgoaLeUess7mPMXIoXDf9EXqhrH6mwn0ARndElJEfXI0R11wf5KyqmP9O
	HdMzzepTGInUKKhWIkfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofuNs-00C3K4-Pv; Wed, 05 Oct 2022 02:43:44 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofuNq-00C3Jj-0G
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 02:43:44 +0000
Received: from [198.18.0.1] (unknown [124.16.96.231])
	by APP-05 (Coremail) with SMTP id zQCowACHnndb7zxjz+cTAw--.40462S2;
	Wed, 05 Oct 2022 10:43:39 +0800 (CST)
Message-ID: <c05c2844-4279-c5fd-b4ec-44fb2129fc62@iscas.ac.cn>
Date: Wed, 5 Oct 2022 10:43:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v5 2/4] mm: support Svnapot in physical page
 linear-mapping
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
 xuyinan@ict.ac.cn
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
 <20221003134721.1772455-3-panqinglin2020@iscas.ac.cn> <Yzx+IbMifJ5xJpuq@spud>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <Yzx+IbMifJ5xJpuq@spud>
X-CM-TRANSID: zQCowACHnndb7zxjz+cTAw--.40462S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCFW3KrykZFy7Kr48Cw4xCrg_yoW5Xw15pr
	WSkFsrKa1UJF1jk39a9r18ZF4aqa9xt345Gw1UK3s5Cw1UWF1Ikr4Sk3y5ua4UAw4kWa10
	vF4UZFy5Ww4YyaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU92b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15Mc
	Ij6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2
	V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYx
	BIdaVFxhVjvjDU0xZFpf9x07b5T5JUUUUU=
X-Originating-IP: [124.16.96.231]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiAwEKDGM8QMy51QAAs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_194342_462768_A9A4B577 
X-CRM114-Status: GOOD (  22.66  )
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

Hi Conor,

On 10/5/22 2:40 AM, Conor Dooley wrote:
> 
> Hey Qinglin Pan,
> 
> Other comments aside, it'd be good to add previous reviewers to the CC
> list on follow-up versions.
> 

Will do it in the next version:)

> On Mon, Oct 03, 2022 at 09:47:19PM +0800, panqinglin2020@iscas.ac.cn wrote:
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>> mm: modify pte format for Svnapot
> 
> "riscv: mm: foo" please.
> 
>>
>> Svnapot is powerful when a physical region is going to mapped to a
>> virtual region. Kernel will do like this when mapping all allocable
>> physical pages to kernel vm space. This commit modifies the
> 
> s/This commit modifies/Modify
> 
>> create_pte_mapping function used in linear-mapping procedure, so the
>> kernel can be able to use Svnapot when both address and length of
>> physical region are 64KB align. Code here will be executed only when
>> other size huge page is not suitable, so it can be an addition of
>> PMD_SIZE and PUD_SIZE mapping.
>>
>> This commit also modifies the best_map_size function to give map_size
> 
> s/This commit also modifies/Modify/
> 
> Although, with the "also" should this be two patches or is there a
> compile time dependency?
> 

The above typo will be repaired in the next version.

>> many times instead of only once, so a memory region can be mapped by
>> both PMD_SIZE and 64KB napot size.
>>
>> It is tested by setting qemu's memory to a 262272k region, and the
>> kernel can boot successfully.
>>
>> Currently, the modified create_pte_mapping will never take use of SVNAPOT,
>> because this extension is detected in riscv_fill_hwcap and enabled in
>> apply_boot_alternatives(called from setup_arch) which is called
>> after setup_vm_final. We will need to support function like
> 
> Out of curiousity, why doesn't this series add the support?

Because I am not familiar with parsing fdt without memory alloction:(
It may delay this merging of this patchset. I will try to do this in
a follow up series:)

> Do you intend sending a follow up series?
> 
>> riscv_fill_hwcap_early to fill hardware capabilities more earlier, and
>> try to enable SVNAPOT more earlier in apply_early_boot_alternatives,
>> so that we can determine SVNAPOT's presence during setup_vm_final.
>>
>> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index b56a0a75533f..76317bb28f29 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -373,9 +373,21 @@ static void __init create_pte_mapping(pte_t *ptep,
>>   				      phys_addr_t sz, pgprot_t prot)
>>   {
>>   	uintptr_t pte_idx = pte_index(va);
>> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> 
> Would using IS_ENBLED() cause problems here?

Yes, will do it in next version.

Qinglin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
