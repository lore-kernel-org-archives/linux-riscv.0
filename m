Return-Path: <SRS0=jumX=K5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6E7C47096
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 12:58:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2058F613E7
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 12:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2058F613E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2jVdRJNWNjCtKMHA6Mrbk4Xez8JTCmQ7T5xun/6AVg=; b=BOa4j7Y6zXIU4bX/gQL69ezdNm
	RtddIpNriR75IeMxyTN/SgHGLRa7ilVF94+BUES/HjlhfM7RjrcjEQPDpu8vxWCagWhbh+j0Jjj9f
	wUp7ihjl4EXtq+FM8ZO5hPVLkuhjh3otBSgCUcm4l26trC4QDHP1VN5btlD5Dj4jv1EJXdkp1kTeB
	HPY3tdT7wDHv4AxjksTCkQBjVw+d9GpTLuHIouh9UlhD906Fwf4d5vZtWekien4BPd6vNx4VCpgrw
	3k7B6CLxwC8zXCqv7dVMdbUWGcqAhORmi6gls224pCYD7h9+zbqu6nMUjjHnAqG3d1Nd8k3KuY6ua
	n4YuPHNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lomuo-008nZB-WA; Thu, 03 Jun 2021 12:57:39 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lomuj-008nVP-8U
 for linux-riscv@lists.infradead.org; Thu, 03 Jun 2021 12:57:36 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 5A3AD1BF205;
 Thu,  3 Jun 2021 12:57:26 +0000 (UTC)
Subject: Re: [PATCH v3 1/3] riscv: Factorize xip and !xip kernel address
 conversion macros
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210603082749.1256129-1-alex@ghiti.fr>
 <20210603082749.1256129-2-alex@ghiti.fr> <20210603202748.2775f739@xhacker>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <64cdb4f9-06f0-59b9-acf9-6fc298db37d7@ghiti.fr>
Date: Thu, 3 Jun 2021 14:57:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210603202748.2775f739@xhacker>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_055733_668325_9FC49342 
X-CRM114-Status: GOOD (  23.02  )
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

Hi Jisheng,

Le 3/06/2021 =E0 14:27, Jisheng Zhang a =E9crit=A0:
> On Thu,  3 Jun 2021 10:27:47 +0200
> Alexandre Ghiti <alex@ghiti.fr> wrote:
> =

>> To simplify the kernel address conversion code, make the same definition=
 of
>> kernel_mapping_pa_to_va and kernel_mapping_va_to_pa compatible for both =
xip
>> and !xip kernel by defining XIP_OFFSET to 0 in !xip kernel.
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>> ---
>>   arch/riscv/include/asm/page.h    | 14 +++-----------
>>   arch/riscv/include/asm/pgtable.h |  2 ++
>>   2 files changed, 5 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page=
.h
>> index 6a7761c86ec2..6e004d8fda4d 100644
>> --- a/arch/riscv/include/asm/page.h
>> +++ b/arch/riscv/include/asm/page.h
>> @@ -93,9 +93,7 @@ extern unsigned long va_pa_offset;
>>   #ifdef CONFIG_64BIT
>>   extern unsigned long va_kernel_pa_offset;
>>   #endif
>> -#ifdef CONFIG_XIP_KERNEL
>>   extern unsigned long va_kernel_xip_pa_offset;
>> -#endif
>>   extern unsigned long pfn_base;
>>   #define ARCH_PFN_OFFSET		(pfn_base)
>>   #else
>> @@ -103,6 +101,7 @@ extern unsigned long pfn_base;
>>   #ifdef CONFIG_64BIT
>>   #define va_kernel_pa_offset	0
>>   #endif
>> +#define va_kernel_xip_pa_offset 0
>>   #define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
>>   #endif /* CONFIG_MMU */
>>   =

>> @@ -110,29 +109,22 @@ extern unsigned long kernel_virt_addr;
>>   =

>>   #ifdef CONFIG_64BIT
>>   #define linear_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + va_p=
a_offset))
>> -#ifdef CONFIG_XIP_KERNEL
>>   #define kernel_mapping_pa_to_va(y)	({						\
>>   	unsigned long _y =3D y;								\
>>   	(_y >=3D CONFIG_PHYS_RAM_BASE) ?	=

> =

> This CONFIG_PHYS_RAM_BASE is only available for XIP, could result in a
> compiler error for !XIP?

You're right, I have this patch in my branch and forgot to squash it.

> =

> I'm also concerned with the unecessary overhead of kernel_mapping_pa_to_v=
a()
> for !XIP case, there's a "if" condition branch, and extra symbol: va_kern=
el_xip_pa_offset

I understand your concerns even if I don't find that the overhead is =

that important here, I prefer the readability improvement. I can always =

add unlikely/likely builtin to improve things or completely remove this =

patch if others agree with you.

Thanks,

Alex

> =

>>   		(void *)((unsigned long)(_y) + va_kernel_pa_offset + XIP_OFFSET) :	\
>>   		(void *)((unsigned long)(_y) + va_kernel_xip_pa_offset);		\
>>   	})
>> -#else
>> -#define kernel_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + va_ke=
rnel_pa_offset))
>> -#endif
>>   #define __pa_to_va_nodebug(x)		linear_mapping_pa_to_va(x)
>>   =

>>   #define linear_mapping_va_to_pa(x)	((unsigned long)(x) - va_pa_offset)
>> -#ifdef CONFIG_XIP_KERNEL
>>   #define kernel_mapping_va_to_pa(y) ({						\
>>   	unsigned long _y =3D y;							\
>>   	(_y < kernel_virt_addr + XIP_OFFSET) ?					\
>>   		((unsigned long)(_y) - va_kernel_xip_pa_offset) :		\
>>   		((unsigned long)(_y) - va_kernel_pa_offset - XIP_OFFSET);	\
>>   	})
> =

> Similar as kernel_mapping_pa_to_va(), an overhead of "if" condition branch
> for !XIP and extra va_kernel_xip_pa_offset symbol.
> =

>> -#else
>> -#define kernel_mapping_va_to_pa(x)	((unsigned long)(x) - va_kernel_pa_o=
ffset)
>> -#endif
>> +
>>   #define __va_to_pa_nodebug(x)	({						\
>>   	unsigned long _x =3D x;							\
>>   	(_x < kernel_virt_addr) ?						\
>> @@ -141,7 +133,7 @@ extern unsigned long kernel_virt_addr;
>>   #else
>>   #define __pa_to_va_nodebug(x)  ((void *)((unsigned long) (x) + va_pa_o=
ffset))
>>   #define __va_to_pa_nodebug(x)  ((unsigned long)(x) - va_pa_offset)
>> -#endif
>> +#endif /* CONFIG_64BIT */
>>   =

>>   #ifdef CONFIG_DEBUG_VIRTUAL
>>   extern phys_addr_t __virt_to_phys(unsigned long x);
>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/p=
gtable.h
>> index bde8ce3bfe7c..d98e931a31e5 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -77,6 +77,8 @@
>>   =

>>   #ifdef CONFIG_XIP_KERNEL
>>   #define XIP_OFFSET		SZ_8M
>> +#else
>> +#define XIP_OFFSET		0
>>   #endif
>>   =

>>   #ifndef __ASSEMBLY__
> =

> =

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
