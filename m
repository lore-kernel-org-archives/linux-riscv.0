Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878FDCEDDA3
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 00:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7vxyzhNDeqbTyhr5ME76C678/wbdBCiw5i+pKr1cQs=; b=ZnHxuWTz6P0xQp+k222ZXrQOb8
	B4seGaU72hl1D1BMrbZbh69pxpdUiv6RNIoYcc6+ElDVvxHkdaf6TGgjLrseL/xSwh11OpjudgD8M
	46Z9IE9iIzgaVRaueMiD3M5uHYOTV235rxNn5Wh1UR0BNIY/9NmBuf98DOb1Kt/86DqyCB5A5N2eA
	srXKcDgMD3/j3Gb0cFrO94UySt0001Iqz1Mw4vTr5zZxloaI5XYQqZN5tGzstHgUdk3tauOptqKpZ
	++RgqvMfqz/hKBxzoFQXLNQKkqF1pbOk1HoREbXQzTroNmMXDXfbpq5B78YzK4WL0eh8C3vKMf8bM
	8cSyfAsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sygdG-0000000B5bZ-0yrL;
	Thu, 10 Oct 2024 00:02:18 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sygdC-0000000B5ak-2z86
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 00:02:16 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2e221a7e7baso292663a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 17:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728518533; x=1729123333; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z81onnv7XmpsFKJJEJouk5fW7lC/eJB47z6sozvRnOU=;
        b=EQQK085ma4ZlZuxVEqey5bGEdfjPFFbbAPHJrl+rshW3c0vm9+y09L9msP+9mQCJqB
         n0throZZrkWkbckrsAQMB3rlWPsEDkecBZO/k+Zbvzx2zXswua+67wyBZpN4Ax47qmzj
         gOevKHym+TX9JZAJ3bi3trojbkS8e2vW9j23jkY6BfbEFhCEpf077PxUNnkhEQHXVJSP
         +usBFx7WYXBzIf1L88/wJv+NlaNSJiz3QlPklJRXLVMvioIOFDmiKNwkLiq7wh5C7zFj
         rtAL98nKFt7FWgIs06phGNyBzR9PdbjLAJdo+KNcnLJy4e9+qDm4d4AfjgSKJ+Kyb30E
         TpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728518533; x=1729123333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z81onnv7XmpsFKJJEJouk5fW7lC/eJB47z6sozvRnOU=;
        b=pEp8/tdfLLA+c3wYeO5rZF8g+vtjQv4SEKxEzWCxNyNfCo7+k5266nf2IBXXYuE54A
         oSuhISSUOvCioBdK4f+uevEm59CTcOlxlqszv6B2JYRzYtZuqbdLRWpnt/D9aa/TggTn
         hZGGiLy9d1Durrl2nyJRmjFaSUqe33iJJTtqu9bEoJoT74Rb8WI7XSMd0O75fxKKtW6A
         xUp8A5oJStr49DGCdoKUMolP/PVZuaN7Q5LPYPYamj6YAHDa9AUM1ZsLQqWD5ivTXhGw
         toiQ6ERjviVSaL84EzBFEw+pFqqMEuzLiB/r930N5PSB6CmHwCCN+Ww98dRORvZ60o33
         4f/g==
X-Forwarded-Encrypted: i=1; AJvYcCWoQt8gDHstFUKxRkfp0ctsAjr1mCR4CMMtkn38wZ+DIh9gpv/6M8NruFeE06i4WmJlISD7IGMT4Ldnow==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDWdfvhmSpwtXukRbLJHng+rIn7s5Z+nsB/K3pd8tzxEnXxKOK
	P+gWDxjnRZ/8/wTUE6vzU3sdVSuf+T3kUzlBv/Z5g40vZ+74BA5ngs47xqpJ3cI=
X-Google-Smtp-Source: AGHT+IFZmP54aZT+PGhT0sMeks15kfczHLhKUFL1tfOl/r4KWZKd9Mj0XsQpQ7yVRv3lx6isgmniRg==
X-Received: by 2002:a17:90b:4a42:b0:2e2:bad2:69ba with SMTP id 98e67ed59e1d1-2e2bad26afcmr3003723a91.14.1728518533102;
        Wed, 09 Oct 2024 17:02:13 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2d5f0b03bsm22252a91.34.2024.10.09.17.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 17:02:12 -0700 (PDT)
Date: Wed, 9 Oct 2024 17:02:08 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: Re: [PATCH v6 11/33] riscv/mm : ensure PROT_WRITE leads to VM_READ |
 VM_WRITE
Message-ID: <ZwcZgKuOK5MpldDX@debug.ba.rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
 <20241008-v5_user_cfi_series-v6-11-60d9fe073f37@rivosinc.com>
 <22972e7b-0844-4ebc-8d82-a0838b83c3a0@lucifer.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22972e7b-0844-4ebc-8d82-a0838b83c3a0@lucifer.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_170214_777888_420F74BC 
X-CRM114-Status: GOOD (  22.56  )
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

On Wed, Oct 09, 2024 at 02:36:12PM +0100, Lorenzo Stoakes wrote:
>On Tue, Oct 08, 2024 at 03:36:53PM -0700, Deepak Gupta wrote:
>> `arch_calc_vm_prot_bits` is implemented on risc-v to return VM_READ |
>> VM_WRITE if PROT_WRITE is specified. Similarly `riscv_sys_mmap` is
>> updated to convert all incoming PROT_WRITE to (PROT_WRITE | PROT_READ).
>> This is to make sure that any existing apps using PROT_WRITE still work.
>>
>> Earlier `protection_map[VM_WRITE]` used to pick read-write PTE encodings.
>> Now `protection_map[VM_WRITE]` will always pick PAGE_SHADOWSTACK PTE
>> encodings for shadow stack. Above changes ensure that existing apps
>> continue to work because underneath kernel will be picking
>> `protection_map[VM_WRITE|VM_READ]` PTE encodings.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/include/asm/mman.h    | 24 ++++++++++++++++++++++++
>>  arch/riscv/include/asm/pgtable.h |  1 +
>>  arch/riscv/kernel/sys_riscv.c    | 10 ++++++++++
>>  arch/riscv/mm/init.c             |  2 +-
>>  mm/mmap.c                        |  1 +
>>  5 files changed, 37 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/include/asm/mman.h b/arch/riscv/include/asm/mman.h
>> new file mode 100644
>> index 000000000000..ef9fedf32546
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/mman.h
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef __ASM_MMAN_H__
>> +#define __ASM_MMAN_H__
>> +
>> +#include <linux/compiler.h>
>> +#include <linux/types.h>
>> +#include <uapi/asm/mman.h>
>> +
>> +static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
>> +	unsigned long pkey __always_unused)
>> +{
>> +	unsigned long ret = 0;
>> +
>> +	/*
>> +	 * If PROT_WRITE was specified, force it to VM_READ | VM_WRITE.
>> +	 * Only VM_WRITE means shadow stack.
>> +	 */
>> +	if (prot & PROT_WRITE)
>> +		ret = (VM_READ | VM_WRITE);
>> +	return ret;
>> +}
>> +#define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
>> +
>> +#endif /* ! __ASM_MMAN_H__ */
>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> index e79f15293492..4948a1f18ae8 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -177,6 +177,7 @@ extern struct pt_alloc_ops pt_ops __meminitdata;
>>  #define PAGE_READ_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
>>  #define PAGE_WRITE_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ |	\
>>  					 _PAGE_EXEC | _PAGE_WRITE)
>> +#define PAGE_SHADOWSTACK       __pgprot(_PAGE_BASE | _PAGE_WRITE)
>>
>>  #define PAGE_COPY		PAGE_READ
>>  #define PAGE_COPY_EXEC		PAGE_READ_EXEC
>> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
>> index d77afe05578f..43a448bf254b 100644
>> --- a/arch/riscv/kernel/sys_riscv.c
>> +++ b/arch/riscv/kernel/sys_riscv.c
>> @@ -7,6 +7,7 @@
>>
>>  #include <linux/syscalls.h>
>>  #include <asm/cacheflush.h>
>> +#include <asm-generic/mman-common.h>
>>
>>  static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>>  			   unsigned long prot, unsigned long flags,
>> @@ -16,6 +17,15 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>>  	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
>>  		return -EINVAL;
>>
>> +	/*
>> +	 * If PROT_WRITE is specified then extend that to PROT_READ
>> +	 * protection_map[VM_WRITE] is now going to select shadow stack encodings.
>> +	 * So specifying PROT_WRITE actually should select protection_map [VM_WRITE | VM_READ]
>> +	 * If user wants to create shadow stack then they should use `map_shadow_stack` syscall.
>> +	 */
>> +	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
>> +		prot |= PROT_READ;
>> +
>>  	return ksys_mmap_pgoff(addr, len, prot, flags, fd,
>>  			       offset >> (PAGE_SHIFT - page_shift_offset));
>>  }
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index 0e8c20adcd98..964810aeb405 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -326,7 +326,7 @@ pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>>  static const pgprot_t protection_map[16] = {
>>  	[VM_NONE]					= PAGE_NONE,
>>  	[VM_READ]					= PAGE_READ,
>> -	[VM_WRITE]					= PAGE_COPY,
>> +	[VM_WRITE]					= PAGE_SHADOWSTACK,
>>  	[VM_WRITE | VM_READ]				= PAGE_COPY,
>>  	[VM_EXEC]					= PAGE_EXEC,
>>  	[VM_EXEC | VM_READ]				= PAGE_READ_EXEC,
>> diff --git a/mm/mmap.c b/mm/mmap.c
>> index dd4b35a25aeb..b56f1e8cbfc6 100644
>> --- a/mm/mmap.c
>> +++ b/mm/mmap.c
>> @@ -47,6 +47,7 @@
>>  #include <linux/oom.h>
>>  #include <linux/sched/mm.h>
>>  #include <linux/ksm.h>
>> +#include <linux/processor.h>
>
>This seems benign enough, just wonder why you need it?

I think leftover from previous versions. Will remove it.
Don't think its needed here anymore.

>
>>
>>  #include <linux/uaccess.h>
>>  #include <asm/cacheflush.h>
>>
>> --
>> 2.45.0
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
