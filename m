Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61A1C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 13:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LVrHrt4unS9NDy7RGQax+0/lwNd9imcyrdCm4CKdII=; b=aohIz7AfxxHuC2
	KfGccR5ONaN2nSfzFTpCa1ORoSq55z67zhHiA/+91mcZJy1jwzhOhM8yU7jOH1UpT3drN8MunbYdq
	F/fMHyTl+XlS7q8ce7eS3Baq8wuYEPTU8YAw3/HT8WnZocDOeZatjeQProUDrFGKmHyEM8YScE5Da
	V63VQJ2A3z9XTFyMbGff+JyFmj7KXqzQCP2wJ70KGdSuODIjO9ggFQj46Hm2154QQwxBj5403Oq4i
	wumnoDynzPLOpAq2SXuhNBr/+wjBs+Uh5lV4OF4NloU4WMQVuKM0JMIuVp52tEpdgnc3IEmGhjb3r
	h16fox+FOr8YPtl0TRNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwCh-003O4y-0V;
	Thu, 13 Jul 2023 13:17:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwCd-003O1t-0C
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 13:17:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1D83D6154E;
	Thu, 13 Jul 2023 13:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4463C433C7;
	Thu, 13 Jul 2023 13:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689254269;
	bh=XkuqR9+OmJB+cQyg5eR/C6W11JZP+75jrSQ8yU4aF/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hgvZgsHr+Nxo1yQxxS4Q92P6ny42qWbiuhEfimWBRzRooVNvDpCAyvCyfa+Ko0HAH
	 M2JVIp8UuG6AFvr9LGUhX3a1oEhQkHHsEHn/KKg/P7H+BrV1GOgwt12bIXFqU33Fs2
	 HELT8ZU+wG+v0LnvVrevjz7Fgpa5vsYkfemhckJDrINGHu9K+1ADXv1JUEohjLGUiv
	 gTwljY270JEMYVRNtFBqJdhKSFR0l5Q755IQrobN4EkcMOY8Mhd9Bp5O6dy+b9O1gG
	 5Crm4cTJd6xs6CJCmxUO9wX4hyqIY7J3uzGYqA2X4P6Wpcuibx8JPWO4esySDHqFFX
	 ppwt7eKZevq0w==
Message-ID: <08905362-248c-e6af-d750-9d385ad543e3@kernel.org>
Date: Thu, 13 Jul 2023 23:17:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] riscv: support the elf-fdpic binfmt loader
Content-Language: en-US
To: Stefan O'Rear <sorear@fastmail.com>, linux-riscv@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, viro@zeniv.linux.org.uk,
 ebiederm@xmission.com, keescook@chromium.org, brauner@kernel.org
References: <20230711130754.481209-1-gerg@kernel.org>
 <20230711130754.481209-3-gerg@kernel.org>
 <31c4024b-3553-4117-a22a-b39259c8fea4@app.fastmail.com>
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <31c4024b-3553-4117-a22a-b39259c8fea4@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_061751_180855_C4054654 
X-CRM114-Status: GOOD (  26.94  )
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


On 13/7/23 01:12, Stefan O'Rear wrote:
> On Tue, Jul 11, 2023, at 9:07 AM, Greg Ungerer wrote:
>> Add support for enabling and using the binfmt_elf_fdpic program loader
>> on RISC-V platforms. The most important change is to setup registers
>> during program load to pass the mapping addresses to the new process.
>>
>> One of the interesting features of the elf-fdpic loader is that it
>> also allows appropriately compiled ELF format binaries to be loaded on
>> nommu systems. Appropriate being those compiled with -pie.
>>
>> Signed-off-by: Greg Ungerer <gerg@kernel.org>
>> ---
>> v1->v2: rebase onto linux-6.5-rc1
>>          increment PTRACE_GETFDPIC value to keep it unique
>>
>>   arch/riscv/include/asm/elf.h         | 11 ++++++++++-
>>   arch/riscv/include/asm/mmu.h         |  4 ++++
>>   arch/riscv/include/uapi/asm/ptrace.h |  5 +++++
>>   fs/Kconfig.binfmt                    |  2 +-
>>   4 files changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
>> index c24280774caf..c33fe923ef6d 100644
>> --- a/arch/riscv/include/asm/elf.h
>> +++ b/arch/riscv/include/asm/elf.h
>> @@ -41,6 +41,7 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
>>   #define compat_elf_check_arch	compat_elf_check_arch
>>
>>   #define CORE_DUMP_USE_REGSET
>> +#define ELF_FDPIC_CORE_EFLAGS	0
>>   #define ELF_EXEC_PAGESIZE	(PAGE_SIZE)
>>
>>   /*
>> @@ -69,6 +70,13 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
>>   #define ELF_HWCAP	riscv_get_elf_hwcap()
>>   extern unsigned long elf_hwcap;
>>
>> +#define ELF_FDPIC_PLAT_INIT(_r, _exec_map_addr, _interp_map_addr,
>> dynamic_addr) \
>> +	do { \
>> +		(_r)->a1 = _exec_map_addr; \
>> +		(_r)->a2 = _interp_map_addr; \
>> +		(_r)->a3 = dynamic_addr; \
>> +	} while (0)
>> +
> 
> This should probably be left empty for now; it will be defined by the
> ELF FDPIC ABI when that is done, and shouldn't be used by normal ELF
> binaries. 

True, not used by the ELF binaries themselves. But used by an ELF
interpreter to do the runtime relocations.


> I'd ask if there's a reason it starts at a1 instead of a0,
> but it seems idiosyncratic on all arches that have full FDPIC support.

This comment in the crt1.S code of uClibc made me think that a0 already had
a pre-defined use in the ABI:

     /* The entry point's job is to call __uClibc_main.  Per the ABI,
        a0 contains the address of a function to be passed to atexit.

But I didn't dig any further than that.

Regards
Greg


> -s
> 
>>   /*
>>    * This yields a string that ld.so will use to load implementation
>>    * specific libraries for optimization.  This is more specific in
>> @@ -78,7 +86,6 @@ extern unsigned long elf_hwcap;
>>
>>   #define COMPAT_ELF_PLATFORM	(NULL)
>>
>> -#ifdef CONFIG_MMU
>>   #define ARCH_DLINFO						\
>>   do {								\
>>   	/*							\
>> @@ -115,6 +122,8 @@ do {								\
>>   	else							 \
>>   		NEW_AUX_ENT(AT_IGNORE, 0);			 \
>>   } while (0)
>> +
>> +#ifdef CONFIG_MMU
>>   #define ARCH_HAS_SETUP_ADDITIONAL_PAGES
>>   struct linux_binprm;
>>   extern int arch_setup_additional_pages(struct linux_binprm *bprm,
>> diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
>> index 0099dc116168..355504b37f8e 100644
>> --- a/arch/riscv/include/asm/mmu.h
>> +++ b/arch/riscv/include/asm/mmu.h
>> @@ -20,6 +20,10 @@ typedef struct {
>>   	/* A local icache flush is needed before user execution can resume. */
>>   	cpumask_t icache_stale_mask;
>>   #endif
>> +#ifdef CONFIG_BINFMT_ELF_FDPIC
>> +	unsigned long exec_fdpic_loadmap;
>> +	unsigned long interp_fdpic_loadmap;
>> +#endif
>>   } mm_context_t;
>>
>>   void __init create_pgd_mapping(pgd_t *pgdp, uintptr_t va, phys_addr_t
>> pa,
>> diff --git a/arch/riscv/include/uapi/asm/ptrace.h
>> b/arch/riscv/include/uapi/asm/ptrace.h
>> index e17c550986a6..30f6d6537adc 100644
>> --- a/arch/riscv/include/uapi/asm/ptrace.h
>> +++ b/arch/riscv/include/uapi/asm/ptrace.h
>> @@ -10,6 +10,11 @@
>>
>>   #include <linux/types.h>
>>
>> +#define PTRACE_GETFDPIC		33
>> +
>> +#define PTRACE_GETFDPIC_EXEC	0
>> +#define PTRACE_GETFDPIC_INTERP	1
>> +
>>   /*
>>    * User-mode register state for core dumps, ptrace, sigcontext
>>    *
>> diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
>> index 93539aac0e5b..f5693164ca9a 100644
>> --- a/fs/Kconfig.binfmt
>> +++ b/fs/Kconfig.binfmt
>> @@ -58,7 +58,7 @@ config ARCH_USE_GNU_PROPERTY
>>   config BINFMT_ELF_FDPIC
>>   	bool "Kernel support for FDPIC ELF binaries"
>>   	default y if !BINFMT_ELF
>> -	depends on ARM || ((M68K || SUPERH || XTENSA) && !MMU)
>> +	depends on ARM || ((M68K || RISCV || SUPERH || XTENSA) && !MMU)
>>   	select ELFCORE
>>   	help
>>   	  ELF FDPIC binaries are based on ELF, but allow the individual load
>> -- 
>> 2.25.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
