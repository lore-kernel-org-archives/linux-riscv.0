Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9F2C87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 18:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgL1+skeYmcAivfwDz79UTopILoSkxXfcy0vt7TVrRA=; b=uoaoejm19RYO6rFdbNjjkrf7mo
	e5DxhqqcwvSnqR8FEASEnw6sieyKt1ewm79rR09TQx62U1XNA04VJAkTwR2LydgxCAbIR5QmzlRzf
	mymjtgV4F6YWue8zR2SJspjefjcwQ2hjo/usoylwy5/r/8gmD1R0Y96DQLTrNvI8fo4Pyw7ynpZLv
	zmTzgjcq8ljbiw8dDE18QIsblK3+80/+APTRgOsQzENoyPzJ8gbo5SSXdOEHcKu5IvcxG7r19cls8
	TQ5xptEuGzB0u0HkGu/EC9+5W1QF10i2uNOMZ6h4B2qWj6pUHHOJctQ81gUalFuep0NLV7kboik3D
	60/21FFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufNFl-0000000ASMC-3TPU;
	Fri, 25 Jul 2025 18:34:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufM5S-0000000AJpQ-1oSD
	for linux-riscv@bombadil.infradead.org;
	Fri, 25 Jul 2025 17:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GB3HN9rENNt5w+QmMp5DXorsMPRr7NrQ810NGI8rf3c=; b=mpEUuTgjGAvIjAADyPghgfwuIE
	CNWUqUpon2mYb825PAvwuf76pEDyl53ERI8HB2s1lxbk1WHG67LVAuR9nXXw53lo9KA6iqwm4Y2CW
	h3cDlW9ObyT5qBIvqLF0Z9+/EICB8um2ZIvInNUKARloLomZpPtxBp8VAao4xveALvi2RmZh44IO8
	nJrGF5iRKrtWP64Zrtz9+5A1o6SyMep21MWm2cuhj3k0zGtulhTMjAsuODWzbFoK9nEHQ96wNpYcz
	GYEv1UFx4IeppNoi3K7VrMANvT/ss+8k5CuKhCn6W35TWLOOFSEixqZC2iP/7KpBfWEgCXtXT6xxJ
	ClEz4cQg==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufM5P-0000000Btq8-27Zk
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 17:20:01 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2353a2bc210so23372035ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 10:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753463997; x=1754068797; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GB3HN9rENNt5w+QmMp5DXorsMPRr7NrQ810NGI8rf3c=;
        b=dCmc9LW8C5CIOq1Qgf3sH9SfcWBeUTJEUGSdfem6noVOU4uvgUKX0rOtgLRTxdR66B
         VGPFXREJhNqAroxvGPXJsai5mM6WKff0TZ/LjLqdEUaYtRXT1I5YEnLPCS2No9ZZRZ39
         x9jTebpRqnWMlqUJ47rwEJAnRsDRJ3StAnP8CsizffQuN7wt07KbudjIUKj5kgvvY9FC
         04sAdUTzU2WUEbfsvbfeb0VzzjJ5RSDU3yY25wcmTViiaDSG5X/cQs2Ogmc6gczrvqKu
         ofj60YRM3L77gxmxbAIsg0BHV3g8ud9ozIOP/DQVK3B0VC1mY6IihwVEN7xfuj98YAf2
         MMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753463997; x=1754068797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GB3HN9rENNt5w+QmMp5DXorsMPRr7NrQ810NGI8rf3c=;
        b=vRzfunUY6lEgyMUwOPHbgyE+s/PgR8qjgyDXW3/7d7FVgu3eEPvV1sD3HDrKJe77LX
         OP3z7o6R5/y4DjIOWoji7Ved75gRzYtABu3xOieVPY9FhhdXOG9FtPLymamIRJGguIpB
         nnh+kiPkGBvkTCw7qT9ZsMNRnBUKh1Lut6OlIFx2GBMwj4hYVHtzbPyD1rIglq05cecy
         DIcq5W16KZHQwpvrr6Ds+PbNfnQR0p9/3jHg704qWf0Rk2Q8gtSvSMVJewPCRpoyjyLb
         0ivSMKsO6FZH/G8caE4IJSC+UX8Ej5r0AFUMuwxTx4hWaZ98KTtT7Q64XrBs/9mRaB9N
         jQCg==
X-Forwarded-Encrypted: i=1; AJvYcCUokdLwybsQe5OT9BLc0zKDsvR6/EJR7qkozW7lLzQiEaHQcLmvPoDqj5OEHQF6Qp6jj2e2E0MrJ7sdTw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8knf4iQ69cEsNxDJS+4wIqGi8R9+J/D749FD1vCXH0e5PYTXK
	TTdcBxMefPOAH2SUGcxsEamPGZZYYbKM4rQNm0rbx9Py2zo1+UfHFKYd2fOlx7H1xxo=
X-Gm-Gg: ASbGnctudmEVKkm7g4O41w8/4zGY9xLr/vF5pHSGCiJ9TOs2VvKdGnj9TGRUVoVRIYt
	N+25K2t+DwxfryiV3oUWr6SxZmQ2G5CbDgAh6U1SpYMLtpAzsQ7FyyB3Zz8wNBJGtF/CilUsCYf
	kt1LRjf6CfERWX6I+LfDMN+n4cBoEBsNuPLhEo1ySyqWKYXsV66iuzAuSoZaWCt7RVtyKHVFI2b
	chd6tZsWhsSAQ7fg/0P3likTxraNtqKV/M6zBaDQw77bQVmYmOCf1LSJ5g8pg53CHIT5VS5lwnK
	sUF7dWruuOcxlN0hNp/lzAmoCqN7Chmnh6pzgNPjwrmrnbx9QePUMX38U2+EZVEGTqR/eJO6r3S
	llG+LndCreE+RyLn3UuIlR1ssBJYCCfLp
X-Google-Smtp-Source: AGHT+IFjom9VggtiV3miU2IzukS6s/Aukl0lHveBGocFoUm1oY8gb1MVFBAvHIxhtqVqK5CFl4GXiw==
X-Received: by 2002:a17:903:2f8c:b0:234:986c:66e0 with SMTP id d9443c01a7336-23fb2ff97cemr42397075ad.4.1753463997175;
        Fri, 25 Jul 2025 10:19:57 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe536c19sm1459325ad.162.2025.07.25.10.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 10:19:56 -0700 (PDT)
Date: Fri, 25 Jul 2025 10:19:53 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "masahiroy@kernel.org" <masahiroy@kernel.org>,
	"rppt@kernel.org" <rppt@kernel.org>,
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
	"justinstitt@google.com" <justinstitt@google.com>,
	"nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>,
	"david@redhat.com" <david@redhat.com>,
	"vbabka@suse.cz" <vbabka@suse.cz>,
	"morbo@google.com" <morbo@google.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"nicolas.schier@linux.dev" <nicolas.schier@linux.dev>,
	"surenb@google.com" <surenb@google.com>,
	"monk.chiang@sifive.com" <monk.chiang@sifive.com>,
	"nathan@kernel.org" <nathan@kernel.org>,
	"kito.cheng@sifive.com" <kito.cheng@sifive.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"mhocko@suse.com" <mhocko@suse.com>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"andrew@sifive.com" <andrew@sifive.com>,
	"samitolvanen@google.com" <samitolvanen@google.com>,
	"cleger@rivosinc.com" <cleger@rivosinc.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bjorn@rivosinc.com" <bjorn@rivosinc.com>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"heinrich.schuchardt@canonical.com" <heinrich.schuchardt@canonical.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"ved@rivosinc.com" <ved@rivosinc.com>,
	"samuel.holland@sifive.com" <samuel.holland@sifive.com>,
	"charlie@rivosinc.com" <charlie@rivosinc.com>,
	"jeffreyalaw@gmail.com" <jeffreyalaw@gmail.com>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	"apatel@ventanamicro.com" <apatel@ventanamicro.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Message-ID: <aIO8uSqiplnyyNOd@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
 <3d579a8c2558391ff6e33e7b45527a83aa67c7f5.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d579a8c2558391ff6e33e7b45527a83aa67c7f5.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_181959_731182_B2E8961B 
X-CRM114-Status: GOOD (  28.48  )
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

On Fri, Jul 25, 2025 at 05:06:17PM +0000, Edgecombe, Rick P wrote:
>On Thu, 2025-07-24 at 16:37 -0700, Deepak Gupta wrote:
>> If shadow stack have memory protections from underlying cpu, use those
>> protections. arches can define PAGE_KERNEL_SHADOWSTACK to vmalloc such shadow
>> stack pages. Hw assisted shadow stack pages grow downwards like regular
>> stack. Clang based software shadow call stack grows low to high address.
>> Thus this patch addresses some of those needs due to opposite direction
>> of shadow stack. Furthermore, hw shadow stack can't be memset because memset
>> uses normal stores. Lastly to store magic word at base of shadow stack, arch
>> specific shadow stack store has to be performed.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  include/linux/scs.h | 26 +++++++++++++++++++++++++-
>>  kernel/scs.c        | 38 +++++++++++++++++++++++++++++++++++---
>>  2 files changed, 60 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/linux/scs.h b/include/linux/scs.h
>> index 4ab5bdc898cf..6ceee07c2d1a 100644
>> --- a/include/linux/scs.h
>> +++ b/include/linux/scs.h
>> @@ -12,6 +12,7 @@
>>  #include <linux/poison.h>
>>  #include <linux/sched.h>
>>  #include <linux/sizes.h>
>> +#include <asm/scs.h>
>>
>>  #ifdef CONFIG_SHADOW_CALL_STACK
>>
>> @@ -37,22 +38,45 @@ static inline void scs_task_reset(struct task_struct *tsk)
>>  	 * Reset the shadow stack to the base address in case the task
>>  	 * is reused.
>>  	 */
>> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> +	task_scs_sp(tsk) = task_scs(tsk) + SCS_SIZE;
>> +#else
>>  	task_scs_sp(tsk) = task_scs(tsk);
>> +#endif
>>  }
>>
>>  static inline unsigned long *__scs_magic(void *s)
>>  {
>> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> +	return (unsigned long *)(s);
>> +#else
>>  	return (unsigned long *)(s + SCS_SIZE) - 1;
>> +#endif
>>  }
>>
>>  static inline bool task_scs_end_corrupted(struct task_struct *tsk)
>>  {
>>  	unsigned long *magic = __scs_magic(task_scs(tsk));
>> -	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
>> +	unsigned long sz;
>> +
>> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> +	sz = (task_scs(tsk) + SCS_SIZE) - task_scs_sp(tsk);
>> +#else
>> +	sz = task_scs_sp(tsk) - task_scs(tsk);
>> +#endif
>>
>>  	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
>>  }
>>
>> +static inline void __scs_store_magic(unsigned long *s, unsigned long magic_val)
>> +{
>> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> +	arch_scs_store(s, magic_val);
>> +#else
>> +	*__scs_magic(s) = magic_val;
>> +#endif
>> +}
>> +
>>  DECLARE_STATIC_KEY_FALSE(dynamic_scs_enabled);
>>
>>  static inline bool scs_is_dynamic(void)
>> diff --git a/kernel/scs.c b/kernel/scs.c
>> index d7809affe740..5910c0a8eabd 100644
>> --- a/kernel/scs.c
>> +++ b/kernel/scs.c
>> @@ -11,6 +11,7 @@
>>  #include <linux/scs.h>
>>  #include <linux/vmalloc.h>
>>  #include <linux/vmstat.h>
>> +#include <asm-generic/set_memory.h>
>>
>>  #ifdef CONFIG_DYNAMIC_SCS
>>  DEFINE_STATIC_KEY_FALSE(dynamic_scs_enabled);
>> @@ -32,19 +33,31 @@ static void *__scs_alloc(int node)
>>  {
>>  	int i;
>>  	void *s;
>> +	pgprot_t prot = PAGE_KERNEL;
>> +
>> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> +	prot = PAGE_KERNEL_SHADOWSTACK;
>> +#endif
>>
>>  	for (i = 0; i < NR_CACHED_SCS; i++) {
>>  		s = this_cpu_xchg(scs_cache[i], NULL);
>>  		if (s) {
>>  			s = kasan_unpoison_vmalloc(s, SCS_SIZE,
>>  						   KASAN_VMALLOC_PROT_NORMAL);
>> +/*
>> + * If software shadow stack, its safe to memset. Else memset is not
>> + * possible on hw protected shadow stack. memset constitutes stores and
>> + * stores to shadow stack memory are disallowed and will fault.
>> + */
>> +#ifndef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>>  			memset(s, 0, SCS_SIZE);
>> +#endif
>>  			goto out;
>>  		}
>>  	}
>>
>>  	s = __vmalloc_node_range(SCS_SIZE, 1, VMALLOC_START, VMALLOC_END,
>> -				    GFP_SCS, PAGE_KERNEL, 0, node,
>> +				    GFP_SCS, prot, 0, node,
>>  				    __builtin_return_address(0));
>
>This doesn't update the direct map alias I think. Do you want to protect it?

Yes any alternate address mapping which is writeable is a problem and dilutes
the mechanism. How do I go about updating direct map ? (I pretty new to linux
kernel and have limited understanding on which kernel api's to use here to unmap
direct map)

>
>>
>>  out:
>> @@ -59,7 +72,7 @@ void *scs_alloc(int node)
>>  	if (!s)
>>  		return NULL;
>>
>> -	*__scs_magic(s) = SCS_END_MAGIC;
>> +	__scs_store_magic(__scs_magic(s), SCS_END_MAGIC);
>>
>>  	/*
>>  	 * Poison the allocation to catch unintentional accesses to
>> @@ -87,6 +100,16 @@ void scs_free(void *s)
>>  			return;
>>
>>  	kasan_unpoison_vmalloc(s, SCS_SIZE, KASAN_VMALLOC_PROT_NORMAL);
>> +	/*
>> +	 * Hardware protected shadow stack is not writeable by regular stores
>> +	 * Thus adding this back to free list will raise faults by vmalloc
>> +	 * It needs to be writeable again. It's good sanity as well because
>> +	 * then it can't be inadvertently accesses and if done, it will fault.
>> +	 */
>> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> +	set_memory_rw((unsigned long)s, (SCS_SIZE/PAGE_SIZE));
>
>Above you don't update the direct map permissions. So I don't think you need
>this. vmalloc should flush the permissioned mapping before re-using it with the
>lazy cleanup scheme.

If I didn't do this, I was getting a page fault on this vmalloc address. It directly
uses first 8 bytes to add it into some list and that was the location of fault.

>
>> +#endif
>> +
>
>I was thinking someday when we get to this for CET we would protect the direct
>map, and so would need some pool of shadow stacks because flushing the TLB for
>every thread alloc/free would likely be too impactful.

Yes pool would be useful per-cpu.

>
>
>>  	vfree_atomic(s);
>>  }
>>
>> @@ -96,6 +119,9 @@ static int scs_cleanup(unsigned int cpu)
>>  	void **cache = per_cpu_ptr(scs_cache, cpu);
>>
>>  	for (i = 0; i < NR_CACHED_SCS; i++) {
>
>Oh! There is a cache, but the size is only 2.

Yes.
In next iteration, I would likely increase the size of the cache if
CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK=y.

>
>> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> +		set_memory_rw((unsigned long)cache[i], (SCS_SIZE/PAGE_SIZE));
>> +#endif
>>  		vfree(cache[i]);
>>  		cache[i] = NULL;
>>  	}
>> @@ -122,7 +148,13 @@ int scs_prepare(struct task_struct *tsk, int node)
>>  	if (!s)
>>  		return -ENOMEM;
>>
>> -	task_scs(tsk) = task_scs_sp(tsk) = s;
>> +	task_scs(tsk) = s;
>> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> +	task_scs_sp(tsk) = s + SCS_SIZE;
>> +#else
>> +	task_scs_sp(tsk) = s;
>> +#endif
>> +
>>  	return 0;
>>  }
>>
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
