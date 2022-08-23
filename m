Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E29EC28D13
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Aug 2022 03:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FH5Er2Z5Ed0vAkMCl7yS73GN8pUSlff8CsbqbKdR8Ws=; b=iPJJPvIDQDVoj7
	Mwtb9kwS19+Ge4VOzp2ME1vz9apAO0XqaBzMBXbSX26vINcqkb8LpGJARyA35OfPChwNRITS+IjKY
	t5h0zeM9kyMK7N7KouO/uHkBYktmycwlDfAOrYX4TG+0h53MpTEKYKklWEDIaCbPb7QCJPhWF7Fsq
	UikSbgZiGLMSlIraB/e6gV8Qi85gRjk1CDOUo12VWwhtOxaWKwVEVMSru6gkZtnBtdtnYU6SYuqhz
	MKFV5CpynkBkr+mMfI6Wg8dcC6YcGydUoy/QHEbiCvA+46bIMtVk9E81SH2w67J9eWg6yfB7rrro9
	QIndlKGYczflAc3rYmGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQKHt-001AgT-DR; Tue, 23 Aug 2022 03:09:09 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQKGG-00195d-3Q
	for linux-riscv@lists.infradead.org; Tue, 23 Aug 2022 03:07:31 +0000
Received: from [124.16.96.111] (unknown [124.16.96.111])
	by APP-05 (Coremail) with SMTP id zQCowABnbbFlRARjUTYLHA--.15443S2;
	Tue, 23 Aug 2022 11:07:18 +0800 (CST)
Message-ID: <44d9f65f-52d1-fb0b-b523-7a930a368c46@iscas.ac.cn>
Date: Tue, 23 Aug 2022 11:07:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: Re: [PATCH v4 0/4] riscv, mm: detect svnapot cpu support at
 runtime
To: Conor.Dooley@microchip.com, linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn
References: <20220822153413.4038052-1-panqinglin2020@iscas.ac.cn>
 <58a097b2-ffbc-508a-d98e-9bb567da0f90@microchip.com>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <58a097b2-ffbc-508a-d98e-9bb567da0f90@microchip.com>
X-CM-TRANSID: zQCowABnbbFlRARjUTYLHA--.15443S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZFW8JrWUKFWUJr47uw17Jrb_yoW7Gr17pa
	1DCrnI9FWrGryfCwsa93WDZryjyw45u34avr93CryUJrZrtay8Xw4qkrnakw1kJFWSyF40
	kF47uFy5C34UA37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x0
	82IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGw
	Av7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0
	xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU8HGQDUUUUU==
X-Originating-IP: [124.16.96.111]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiAwgHDGKY1rBaOAAAs+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_200728_615287_679990C7 
X-CRM114-Status: GOOD (  22.51  )
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

Hey Conor,
I think something maybe wrong with my patchset, and I will fix them and 
all hints you have mentioned in other mails in the next version patchset.

Thank you so much for your review.

Yours,
Qinglin

On 8/23/22 5:22 AM, Conor.Dooley@microchip.com wrote:
> On 22/08/2022 16:34, panqinglin2020@iscas.ac.cn wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> Hey Qingling,
> Apologies for yet another mail - but I built allmodconfig
> with CONFIG_SVNAPOT=y and got a build error:
> 
>    CC      arch/riscv/kernel/asm-offsets.s
> In file included from /stuff/linux/arch/riscv/include/asm/tlbflush.h:12,
>                   from /stuff/linux/arch/riscv/include/asm/pgtable.h:108,
>                   from /stuff/linux/include/linux/pgtable.h:6,
>                   from /stuff/linux/include/linux/mm.h:29,
>                   from /stuff/linux/arch/riscv/kernel/asm-offsets.c:10:
> /stuff/linux/arch/riscv/include/asm/pgtable.h: In function 'pte_pfn':
> /stuff/linux/arch/riscv/include/asm/pgtable.h:299:35: error: '_PAGE_NAPOT_SHIFT' undeclared (first use in this function)
>    299 |         ALT_SVNAPOT_PTE_PFN(_val, _PAGE_NAPOT_SHIFT,
>        |                                   ^~~~~~~~~~~~~~~~~
> /stuff/linux/arch/riscv/include/asm/errata_list.h:165:23: note: in definition of macro 'ALT_SVNAPOT_PTE_PFN'
>    165 |                   "i"(_napot_shift))
>        |                       ^~~~~~~~~~~~
> /stuff/linux/arch/riscv/include/asm/pgtable.h:299:35: note: each undeclared identifier is reported only once for each function it appears in
>    299 |         ALT_SVNAPOT_PTE_PFN(_val, _PAGE_NAPOT_SHIFT,
>        |                                   ^~~~~~~~~~~~~~~~~
> /stuff/linux/arch/riscv/include/asm/errata_list.h:165:23: note: in definition of macro 'ALT_SVNAPOT_PTE_PFN'
>    165 |                   "i"(_napot_shift))
>        |                       ^~~~~~~~~~~~
> In file included from /stuff/linux/include/linux/mm.h:29,
>                   from /stuff/linux/arch/riscv/kernel/asm-offsets.c:10:
> /stuff/linux/include/linux/pgtable.h: At top level:
> /stuff/linux/include/linux/pgtable.h:1457:20: error: redefinition of 'p4d_clear_huge'
>   1457 | static inline void p4d_clear_huge(p4d_t *p4d) { }
>        |                    ^~~~~~~~~~~~~~
> In file included from /stuff/linux/include/linux/pgtable.h:6,
>                   from /stuff/linux/include/linux/mm.h:29,
>                   from /stuff/linux/arch/riscv/kernel/asm-offsets.c:10:
> /stuff/linux/arch/riscv/include/asm/pgtable.h:763:20: note: previous definition of 'p4d_clear_huge' with type 'void(p4d_t *)'
>    763 | static inline void p4d_clear_huge(p4d_t *p4d) { }
>        |                    ^~~~~~~~~~~~~~
> make[3]: *** [/stuff/linux/scripts/Makefile.build:117: arch/riscv/kernel/asm-offsets.s] Error 1
> make[2]: *** [/stuff/linux/Makefile:1205: prepare0] Error 2
> make[2]: Leaving directory '/stuff/brsdk/work/linux'
> make[1]: *** [Makefile:222: __sub-make] Error 2
> make[1]: Leaving directory '/stuff/linux'
> make: *** [Makefile:179: allmodconfig] Error 2
> 
>>
>> Svnapot is a RISC-V extension for marking contiguous 4K pages as a non-4K
>> page. This patch set is for using Svnapot in Linux Kernel's boot process
>> and hugetlb fs.
>>
>> This patchset adds a Kconfig item for using Svnapot in
>> "Platform type"->"Svnapot support". Its default value is off, and people can set
>> it on if they allow kernel to detect Svnapot hardware support and leverage it.
>>
>> Tested on:
>>    - qemu rv64 with "Svnapot support" off and svnapot=true.
>>    - qemu rv64 with "Svnapot support" on and svnapot=true.
>>    - qemu rv64 with "Svnapot support" off and svnapot=false.
>>    - qemu rv64 with "Svnapot support" on and svnapot=false.
>>
>> Changes in v2:
>>    - detect Svnapot hardware support at boot time.
>> Changes in v3:
>>    - do linear mapping again if has_svnapot
>> Changes in v4:
>>    - fix some errors/warns reported by checkpatch.pl, thanks @Conor
>>
>> Qinglin Pan (4):
>>    mm: modify pte format for Svnapot
>>    mm: support Svnapot in physical page linear-mapping
>>    mm: support Svnapot in hugetlb page
>>    mm: support Svnapot in huge vmap
>>
>>   arch/riscv/Kconfig                   |  10 +-
>>   arch/riscv/include/asm/errata_list.h |  24 ++-
>>   arch/riscv/include/asm/hugetlb.h     |  30 +++-
>>   arch/riscv/include/asm/hwcap.h       |   1 +
>>   arch/riscv/include/asm/mmu.h         |   1 +
>>   arch/riscv/include/asm/page.h        |   2 +-
>>   arch/riscv/include/asm/pgtable-64.h  |  14 ++
>>   arch/riscv/include/asm/pgtable.h     |  70 +++++++-
>>   arch/riscv/include/asm/vmalloc.h     |  22 +++
>>   arch/riscv/kernel/cpu.c              |   1 +
>>   arch/riscv/kernel/cpufeature.c       |  18 ++
>>   arch/riscv/kernel/setup.c            |  11 +-
>>   arch/riscv/mm/hugetlbpage.c          | 250 ++++++++++++++++++++++++++-
>>   arch/riscv/mm/init.c                 |  47 +++--
>>   14 files changed, 477 insertions(+), 24 deletions(-)
>>
>> --
>> 2.35.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
