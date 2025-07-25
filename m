Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D4BC87FCF
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 16:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAfq/VQqYt0qQ33gLHfCM9nNniGYTDb+G/Suwn4HJsk=; b=BOoxtpyKCPiIVZ4LOizR/oqpvh
	L5K/+6CIqmnG21d1XJo/jurhnvKsgruBITXNKfM0YCGksmG2JZ2ChJ6wxMwL9zeFhhP/gr1ogyKub
	o698LZOqx4s+yL1ruIkqhyET+NcCv3dG7g+H/Jx83Dtkqy0IK1eKvLYyePXhKSqCeDwuZP34fJ2kE
	3KV78cE2dle0vGBHqkFer7OU0T0GiIXI97NC+Xdu7RsYVVI0o4/J8rnlTDUHiqV9wxSF/ZPqWl3SS
	pgEa/oIWhGRuzFc9oKdvRSttlFOiByZI0g20oq5ZCsLmr27dcxTBAgfarWyJgllhes7W/rRIZSpFI
	Puuacm8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLVO-0000000AFP7-0ZZM;
	Fri, 25 Jul 2025 16:42:46 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLVL-0000000AFOi-2WSD
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 16:42:45 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-23f8d27eeeaso22698065ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 09:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753461763; x=1754066563; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8y2TNoIk2wdBhLwSEjjylt9WbC1a8YKSz5ABVX4y0Uk=;
        b=HyKjvMbmOLEboQNJGv/P3RyLUH7jRqRRaBQonPbZ+vhFjLAYJURAdsHqNIvX8Ulpoh
         4F1CdMFAA1p2ecOQNObefrBbzLuBkOrNCEhHiM6M5et3NzIypEtUzXcBySytS2zSBHKq
         Lr0sSa9hhcPCl8yLEe2FXH71tdrFM8EO83pooMprEBv9kqLVLUgxFWk7H2fpS+66i2GU
         OSNdI18A519zT0Q6OqECgNWM+jLML288j3TmxSdGT69K3b+fb7Ghds6Qj7sOL7xBGugP
         In32vkfBnTxQqnD7s69MTiunDKLL0W48jab6KBsz75Yxky6MGIXP9k9zmuHWDX7xtV8t
         lrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753461763; x=1754066563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8y2TNoIk2wdBhLwSEjjylt9WbC1a8YKSz5ABVX4y0Uk=;
        b=CTU/g4hlTOzYPbglK/yCB59KFgIa99wIOrZd/Z1pYHpQeon45VtsGYW+bpfcxXti3L
         9DdvpAwEo+gjSp3K22AGdV3A0G/0u204WqUuAuVKCTYFGpdvjuSPwXbVJc/PTmGBD6wQ
         Rg4/3hSv/5A0nkrdOaSAM4O/GpBxANsHN0kCzsTssbpslk4z/wpIxIImwp6QCka9dt2Q
         WShfc/Q6RguuKmLy8kmdxQcNsxthQR4tZmJondzAowyy82l4HfOrC7AZ45DDXBbrtq1q
         AvkhYU5h4mOzUElwv6ym0qCWhcbXwJHumPXHTZTvNniKQ+BvN4X1Go3QeXgU/ELJii8W
         Mkew==
X-Forwarded-Encrypted: i=1; AJvYcCWQl5VAPz9KjJojSkoA7QIR2ZnasEl88xV5nNHvnNXhvXS7uY+JPly/NE6a+YlWZ1icgzJj3NI2XvpMDg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8RDQ+NdjaZ0boXR8jgVBM7G0sscChtFntLtdN+LavJ58Tz2S1
	IpZoWDaqHf0HWM8v5jWfjEnmtnGXJQZjmTwQLXcoDSd20VdmWoYpPDVPJ2qU0SpDxTA=
X-Gm-Gg: ASbGncuIszk+3QmZwWMG/lWwo4KPyid92ugUaKi9BoUa5f3+VynTvEJAtwgUs7LR/qw
	RtD3Dm03uunXb2onqjkA68BXGXnWoSDQg0ccYoQD+yaq462xrC6PXJC0Po4f/exvaCORa/Mis/a
	eOBbNI4zYGIF9h+FTVStL34XqxXTDZ+wtCWrnTR62eZOC5xCHvpZf4FNLHRoV0A8NDgrBBnwi+e
	lwa+JPKmPRNt3Mk/FHa9Tzp0ufFAnDePvA/5IrkZ0r4/EQyhDXag3WrhZfZNCYBreCPEQqwD/LU
	AVVD2DrrXupWEC35PI4KC6BtKuFAxc4na3C0CpiX2k2yHCpnzKl+bLKUA6w8xW8UIf4Mx1bBtDw
	4rJHKCUop44OXPvnyh1FjbPsdDoH9fckm
X-Google-Smtp-Source: AGHT+IESsSEPy/ac8F6mWdBj6vdPwp9s3VzEdxE6SjFz3Dg1QtfJX8WaXR44J4QcA36ULd9Dz05/pg==
X-Received: by 2002:a17:902:e891:b0:236:94ac:cc1a with SMTP id d9443c01a7336-23fb3179530mr40948875ad.27.1753461762804;
        Fri, 25 Jul 2025 09:42:42 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe30bbc4sm1244165ad.29.2025.07.25.09.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 09:42:42 -0700 (PDT)
Date: Fri, 25 Jul 2025 09:42:39 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	charlie@rivosinc.com, samuel.holland@sifive.com, bjorn@rivosinc.com,
	fweimer@redhat.com, jeffreyalaw@gmail.com,
	heinrich.schuchardt@canonical.com, andrew@sifive.com,
	ved@rivosinc.com
Subject: Re: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Message-ID: <aIOz_wxxCr8tPgXz@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
 <20250725161327.GC1724026@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250725161327.GC1724026@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_094243_874611_770E6F3F 
X-CRM114-Status: GOOD (  27.37  )
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

On Fri, Jul 25, 2025 at 04:13:27PM +0000, Sami Tolvanen wrote:
>On Thu, Jul 24, 2025 at 04:37:03PM -0700, Deepak Gupta wrote:
>> If shadow stack have memory protections from underlying cpu, use those
>> protections. arches can define PAGE_KERNEL_SHADOWSTACK to vmalloc such shadow
>> stack pages. Hw assisted shadow stack pages grow downwards like regular
>> stack. Clang based software shadow call stack grows low to high address.
>
>Is this the case for all the current hardware shadow stack
>implementations? If not, we might want a separate config for the
>shadow stack direction instead.

Is there something like this for regular stack as well?
I could copy same mechanism.

>
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
>
>I'm not a huge fan of all the ifdefs. We could clean this up by
>allowing architectures to simply override some these functions, or at
>least use if (IS_ENABLED(CONFIG...)) instead. Will, any thoughts about
>this?
>
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
>
>I would rather define the shadow stack protection flags in the header
>file and allow them to be overridden in asm/scs.h.
>
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
>
>This could also be moved to a static inline function that
>architectures can override if they have hardware shadow stacks that
>cannot be cleared at this point.
>
>>  			goto out;
>>  		}
>>  	}
>>
>>  	s = __vmalloc_node_range(SCS_SIZE, 1, VMALLOC_START, VMALLOC_END,
>> -				    GFP_SCS, PAGE_KERNEL, 0, node,
>> +				    GFP_SCS, prot, 0, node,
>>  				    __builtin_return_address(0));
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
>> +#endif
>
>Another candidate for an arch-specific function to reduce the number
>of ifdefs in the generic code.
>
>Sami

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
