Return-Path: <SRS0=jumX=K5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54531C47082
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 06:01:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C3F4613E6
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 06:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C3F4613E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbV5KuURG16e3zgP53RYd4WQY5Q+v0fDVz4SlPUOhAs=; b=03fu4eeol/dgUv3wWitzgjdeg2
	wdjdRCWRDqEBXt3r14SOx0yE8N/uGtJO8QQ4KvYzXaFXI1XAsDdzKKUtgE9vKr5R33JsIoQRZdQRg
	RcmVXeJZ+dExWFo+0nht0c0YxdVmcup7nFz11jyIoE5s5R6BJZGpH/4SJ7zb0cRuysTNSVYH34Xpo
	yswEDpgP2NaVzq9t2GJSKcMDtrtezqXANYjoN1otoApXujYEKAefJWb25ujsdJd/HVhDNPdlymuz0
	TXARdo9xbujY65T3qQ6vffCDMwnmqE73cSVyIY2qHWkSpAYv0xZ9gbZGtAl+s2kTJWHjrOKmnHYM8
	hrb4fusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1logOp-007FBM-OH; Thu, 03 Jun 2021 06:00:11 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1logOm-007F9z-Hj
 for linux-riscv@lists.infradead.org; Thu, 03 Jun 2021 06:00:10 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5E52EFF803;
 Thu,  3 Jun 2021 05:59:59 +0000 (UTC)
Subject: Re: [PATCH v2] riscv: Map the kernel with correct permissions the
 first time
To: Christoph Hellwig <hch@infradead.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210526134110.217073-1-alex@ghiti.fr>
 <YK89yVQirCLdodxG@infradead.org>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <acf00719-c41a-21de-b54a-a2be003a5698@ghiti.fr>
Date: Thu, 3 Jun 2021 07:59:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YK89yVQirCLdodxG@infradead.org>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_230008_883199_1FBB078C 
X-CRM114-Status: GOOD (  31.71  )
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

Le 27/05/2021 =E0 08:35, Christoph Hellwig a =E9crit=A0:
> On Wed, May 26, 2021 at 03:41:10PM +0200, Alexandre Ghiti wrote:
>>   #ifdef CONFIG_64BIT
>> +#define is_kernel_mapping(x)	((x) >=3D kernel_virt_addr && (x) < (kerne=
l_virt_addr + load_sz))
>> +#define is_linear_mapping(x)	((x) >=3D PAGE_OFFSET && (x) < kernel_virt=
_addr)
>> +
> =

> Overly long lines.  Independ of that complex macros are generally much
> more readable if they are written more function-like, that is the name
> and paramtes are kept on a line of their own:
> =

> #define is_kernel_mapping(x) \
> 	((x) >=3D kernel_virt_addr && (x) < (kernel_virt_addr + load_sz))
> =

> But what is the reason to not make them type-safe inline functions
> anyway?
> =

>>   #define __va_to_pa_nodebug(x)	({						\
>>   	unsigned long _x =3D x;							\
>> -	(_x < kernel_virt_addr) ?						\
>> +	is_linear_mapping(_x) ?							\
>>   		linear_mapping_va_to_pa(_x) : kernel_mapping_va_to_pa(_x);	\
>>   	})
> =

> ... especially for something complex like this.

Turning those macros into inline functions gave me a hard time because =

of the XIP fixups that use macros to redefine symbols that should be =

accessed in RAM instead of flash before the MMU is enabled, I couldn't =

manage to get rid of header circular dependencies.

But, I think I finally found a solution to eliminate the need for those =

fixups. So for the moment, I'll send a v3 that fixes all your comments =

but this one and then I will work on this solution.

Thanks again for your comments,

Alex

> =

>> +static inline bool is_va_kernel_lm_alias_text(uintptr_t va)
>> +{
>> +	return (va >=3D (uintptr_t)lm_alias(_start) && va < (uintptr_t)lm_alia=
s(__init_text_begin));
> =

> Overly long line as well.  And useless braces.
> =

>> +static inline bool is_va_kernel_init_text(uintptr_t va)
>> +{
>> +	return (va >=3D (uintptr_t)__init_text_begin && va < (uintptr_t)__init=
_data_begin);
>> +}
> =

> Same here.
> =

>> +#ifdef CONFIG_STRICT_KERNEL_RWX
>> +static __init pgprot_t pgprot_from_va(uintptr_t va)
>> +{
>> +#ifdef CONFIG_64BIT
>> +	if (is_va_kernel_text(va) || is_va_kernel_init_text(va))
>> +		return PAGE_KERNEL_READ_EXEC;
>> +
>> +	/*
>> +	 * We must mark only text as read-only as init text will get freed lat=
er
>> +	 * and rodata section is marked readonly in mark_rodata_ro.
>> +	 */
>> +	if (is_va_kernel_lm_alias_text(va))
>> +		return PAGE_KERNEL_READ;
>> +
>> +	return PAGE_KERNEL;
>> +#else
>> +	if (is_va_kernel_text(va))
>> +		return PAGE_KERNEL_READ_EXEC;
>> +
>> +	if (is_va_kernel_init_text(va))
>> +		return PAGE_KERNEL_EXEC;
>> +
>> +	return PAGE_KERNEL;
>> +#endif /* CONFIG_64BIT */
>> +}
> =

> If the entire function is different for config symbols please just
> split it into two separate functions.  But to make the difference more
> clear IS_ENABLED might fit better here:
> =

> static __init pgprot_t pgprot_from_va(uintptr_t va)
> {
> 	if (is_va_kernel_text(va))
> 		return PAGE_KERNEL_READ_EXEC;
> 	if (is_va_kernel_init_text(va))
> 		return IS_ENABLED(CONFIG_64BIT) ?
> 			PAGE_KERNEL_READ_EXEC : PAGE_KERNEL_EXEC;
> 	if (IS_ENABLED(CONFIG_64BIT) && is_va_kernel_lm_alias_text(va))
> 		return PAGE_KERNEL_READ;
> 	return PAGE_KERNEL;
> }
> =

> Preferable with comments explaining the 32-bit vs 64-bit difference.
> =

>> +void mark_rodata_ro(void)
>> +{
>> +	unsigned long rodata_start =3D (unsigned long)__start_rodata;
>> +	unsigned long data_start =3D (unsigned long)_data;
>> +	unsigned long __maybe_unused lm_rodata_start =3D (unsigned long)lm_ali=
as(__start_rodata);
>> +	unsigned long __maybe_unused lm_data_start =3D (unsigned long)lm_alias=
(_data);
>> +
>> +	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
>> +#ifdef CONFIG_64BIT
>> +	set_memory_ro(lm_rodata_start, (lm_data_start - lm_rodata_start) >> PA=
GE_SHIFT);
>> +#endif
> =

> Lots of unreadable overly lone lines.  Why not add a helper and do
> something like:
> =

> static void set_kernel_memory_ro(char *startp, char *endp)
> {
>          unsigned long start =3D (unsigned long)startp;
> 	unsigned long end =3D (unsigned long)endp;
> =

> 	set_memory_ro(start, (start - end) >> PAGE_SHIFT);
> }
> =

>          set_kernel_memory_ro(_start_rodata, _data);
> 	if (IS_ENABLED(CONFIG_64BIT))
> 		set_kernel_memory_ro(lm_alias(__start_rodata), lm_alias(_data));
> =

> =

>> +static __init pgprot_t pgprot_from_va(uintptr_t va)
>> +{
>> +#ifdef CONFIG_64BIT
>> +	if (is_kernel_mapping(va))
>> +		return PAGE_KERNEL_EXEC;
>> +
>> +	if (is_linear_mapping(va))
>> +		return PAGE_KERNEL;
>> +
>> +	return PAGE_KERNEL;
>> +#else
>> +	return PAGE_KERNEL_EXEC;
>> +#endif /* CONFIG_64BIT */
>> +}
>> +#endif /* CONFIG_STRICT_KERNEL_RWX */
>> +
> =

> Same comment as for the other version.  This could become:
> =

> static __init pgprot_t pgprot_from_va(uintptr_t va)
> {
> 	if (IS_ENABLED(CONFIG_64BIT) && !is_kernel_mapping(va))
> 		return PAGE_KERNEL;
> 	return PAGE_KERNEL_EXEC;
> }
> =

>> -static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map=
_size)
>> +static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map=
_size, bool early)
> =

> Overly long line.
> =

>>   	for (va =3D kernel_virt_addr; va < end_va; va +=3D map_size)
>>   		create_pgd_mapping(pgdir, va,
>>   				   load_pa + (va - kernel_virt_addr),
>> -				   map_size, PAGE_KERNEL_EXEC);
>> +				   map_size, early ? PAGE_KERNEL_EXEC : pgprot_from_va(va));
> =

> Same here.  But why not pass in a "pgprot_t ram_pgprot" instead of the
> bool, which would be self-documenting.
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
