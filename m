Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790C2C87FCA
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 17:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbSVOkSQ89ulA1fmJ0RhhlZVCz8YZzglIHQf+SgAuI4=; b=qo+rq7lY5MLem7/batjjLmO9AU
	7suf5vtDyZSD2M0Qft7TE9qdGIJnJvh7L0QjWyslQYwJGz3Qjoi2M5jioI6IEP3nF8YCmnUg4WPQT
	d12l+QzDIHUU76IifJMnAypJOjBhvNKwfVzGyc0TGPd0KxAWM4WQUGXWEjShLSHGTzih3VRZMArUB
	EuZxPToyYgYep2Br5dllwoTlaJ/gxZXU7O2OkFgc/oILWp/9wz26kgb4daFETaBT6kJUubX3kozkF
	sbRPQoPUaBjznYXYz70yzMUPB8eFh/r4RyyAbfBNeuMIH1Tjog5aQk4yf8fpGNjPZEdfTt9l9XiEL
	prr5Szzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufMYC-0000000AMME-2XEH;
	Fri, 25 Jul 2025 17:49:44 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLZh-0000000AFrX-1vpO
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 16:47:14 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-75ce8f8a3cdso1645869b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 09:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753462033; x=1754066833; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vHLTqitS8m73sB1NoWWs/yPMz8aTSpmBU53QgGw/vVs=;
        b=035ErZO8bjNAOsi1KozH233pc9HWtiYftmU8aO6MB72s4zPqM2SdfPpXFUUbK//vOk
         H481LU+3sqMWIF2jYB0qry4iMqcFS5ocKgATIKgylA18jDaDHG7ZS2DNY4BiboObX+B9
         vHy2HG+vZR/z6hoTbt7imV7ViCfC+Ro9VtPMCUaEZZXso0odWOSp5gsygB7KI+hyNkyx
         T0DuSGUBG2EEB0rJ64RxVqLM6oLqGzEgQbk5DZvWRlErx5KSlwCo+93IGHr1M22sGARr
         j/p3QQaQ++Apu4tIJ4a7vhx02mLPGH77YAr0CGk3L1iJcB7I4fe2b3L6REzO/8MPCiQp
         xrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753462033; x=1754066833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHLTqitS8m73sB1NoWWs/yPMz8aTSpmBU53QgGw/vVs=;
        b=I3C/cr7mKRLO9dar5h3XIbSZ+F2rGKIHwltIlGskMtZhGCesBwY0QK5du354DdV3WA
         Oam9HDbOJonISVSdumLsMWp+ZbNRzXkrHJsKPwC0FOhKO1rnZdmMDRK3l7u6VQPFpAwF
         eazLnLbtvBt/TjVYsqDiZWumMiFb9LPA7wRQtauimrk5iuEvUdjU2R+zwXS1ikP7/2mQ
         /jzgr1jISVQg5nOKBjm54BXHZsMed+JCLzKpPpc2FD+RNzJ4nMkb7rk7dqQHTgRjxaw1
         pyILL2UR4Mjd7CnOqUJot5qxReX4NqR3vG7G9KUyzx9nkNHMIh2bhTz3qIewXsfJAckf
         B/eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnzl7J5ruTQNV3w+0gzBWxWhJznGu+Ci7+bXifpmTiNpUcJDd6y7qxWe0KHiEiFqdlXmmyAJoak7b+sA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxevhUFFz8jGX+i5C+Alf41BRILd13nL6NvWIVAFXXqDKc7rym
	v4MfSiO0fCZNSuxV34YnvmSFXQcawXBsQX8ppCgg/d0JJ5cYqWJQt8qP2RXnVNmdbSg=
X-Gm-Gg: ASbGncvUdk4nC0XLEVhESm+Atg0+orNYiLR0pEaiyN2Cm5dQVjZwk94hSJv7CpelwI+
	HzjPxRJpihFshQfhnwQQd+Yz54rJTA+oEfeZWWuqkgoZbQKu09EIWrpV/tgjDwqrSE6gLCNytgo
	8hz661XEjCdZ7gmFutwjAx2QwOd5wBBijRBbU52a5WtX5fZe9ORbEa6OZH/EabYelaUpelyn/28
	jU9gM0s75Jy3D/3ZTtPZH5Vg37MU1ylIbg8jF734pkCiSKxOj98Do3jdmIs/EyzjekFBG0y3XS+
	7KFTWj+WJ2dOiS2BkIpOYHJMTo8wv2sRWQGmgesbQQ1ApohpNg9Kj7cD3FMw4ItYPvJuZ7ZKUCZ
	ZXJaZx35Ln/ESED6kfuqGRWmbqzSxEIe9
X-Google-Smtp-Source: AGHT+IHxx3Jq+s72rQKTRVQE8Bq7kbAijuZ/ZVTSRX63AJDAbUraG/5Y8poHwWgKyEfuOloxC+qeAg==
X-Received: by 2002:a05:6a00:1790:b0:74c:3547:7f0c with SMTP id d2e1a72fcca58-7633626d5afmr4307957b3a.3.1753462032636;
        Fri, 25 Jul 2025 09:47:12 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b4d15cfsm119033b3a.119.2025.07.25.09.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 09:47:12 -0700 (PDT)
Date: Fri, 25 Jul 2025 09:47:08 -0700
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
Message-ID: <aIO1DOrhUTolFWO6@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
 <20250725161327.GC1724026@google.com>
 <aIOz_wxxCr8tPgXz@debug.ba.rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aIOz_wxxCr8tPgXz@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_094713_502394_7C0964A3 
X-CRM114-Status: GOOD (  20.21  )
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

Sorry forgot to respond to rest of the comments.

On Fri, Jul 25, 2025 at 09:42:39AM -0700, Deepak Gupta wrote:
>On Fri, Jul 25, 2025 at 04:13:27PM +0000, Sami Tolvanen wrote:
>>On Thu, Jul 24, 2025 at 04:37:03PM -0700, Deepak Gupta wrote:
>>>If shadow stack have memory protections from underlying cpu, use those
>>>protections. arches can define PAGE_KERNEL_SHADOWSTACK to vmalloc such shadow
>>>stack pages. Hw assisted shadow stack pages grow downwards like regular
>>>stack. Clang based software shadow call stack grows low to high address.
>>
>>Is this the case for all the current hardware shadow stack
>>implementations? If not, we might want a separate config for the
>>shadow stack direction instead.
>
>Is there something like this for regular stack as well?
>I could copy same mechanism.
>
>>
>>>Thus this patch addresses some of those needs due to opposite direction
>>>of shadow stack. Furthermore, hw shadow stack can't be memset because memset
>>>uses normal stores. Lastly to store magic word at base of shadow stack, arch
>>>specific shadow stack store has to be performed.
>>>
>>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>>---
>>> include/linux/scs.h | 26 +++++++++++++++++++++++++-
>>> kernel/scs.c        | 38 +++++++++++++++++++++++++++++++++++---
>>> 2 files changed, 60 insertions(+), 4 deletions(-)
>>>
>>>diff --git a/include/linux/scs.h b/include/linux/scs.h
>>>index 4ab5bdc898cf..6ceee07c2d1a 100644
>>>--- a/include/linux/scs.h
>>>+++ b/include/linux/scs.h
>>>@@ -12,6 +12,7 @@
>>> #include <linux/poison.h>
>>> #include <linux/sched.h>
>>> #include <linux/sizes.h>
>>>+#include <asm/scs.h>
>>>
>>> #ifdef CONFIG_SHADOW_CALL_STACK
>>>
>>>@@ -37,22 +38,45 @@ static inline void scs_task_reset(struct task_struct *tsk)
>>> 	 * Reset the shadow stack to the base address in case the task
>>> 	 * is reused.
>>> 	 */
>>>+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>>>+	task_scs_sp(tsk) = task_scs(tsk) + SCS_SIZE;
>>>+#else
>>> 	task_scs_sp(tsk) = task_scs(tsk);
>>>+#endif
>>> }
>>>
>>> static inline unsigned long *__scs_magic(void *s)
>>> {
>>>+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>>>+	return (unsigned long *)(s);
>>>+#else
>>> 	return (unsigned long *)(s + SCS_SIZE) - 1;
>>>+#endif
>>> }
>>>
>>> static inline bool task_scs_end_corrupted(struct task_struct *tsk)
>>> {
>>> 	unsigned long *magic = __scs_magic(task_scs(tsk));
>>>-	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
>>>+	unsigned long sz;
>>>+
>>>+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>>>+	sz = (task_scs(tsk) + SCS_SIZE) - task_scs_sp(tsk);
>>>+#else
>>>+	sz = task_scs_sp(tsk) - task_scs(tsk);
>>>+#endif
>>>
>>> 	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
>>> }
>>>
>>>+static inline void __scs_store_magic(unsigned long *s, unsigned long magic_val)
>>>+{
>>>+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>>>+	arch_scs_store(s, magic_val);
>>>+#else
>>>+	*__scs_magic(s) = magic_val;
>>>+#endif
>>>+}
>>>+
>>
>>I'm not a huge fan of all the ifdefs. We could clean this up by
>>allowing architectures to simply override some these functions, or at
>>least use if (IS_ENABLED(CONFIG...)) instead. Will, any thoughts about
>>this?

Yes I don't like it either.
I'll do something about it in next iteration.

>>
>>> DECLARE_STATIC_KEY_FALSE(dynamic_scs_enabled);
>>>
>>> static inline bool scs_is_dynamic(void)
>>>diff --git a/kernel/scs.c b/kernel/scs.c
>>>index d7809affe740..5910c0a8eabd 100644
>>>--- a/kernel/scs.c
>>>+++ b/kernel/scs.c
>>>@@ -11,6 +11,7 @@
>>> #include <linux/scs.h>
>>> #include <linux/vmalloc.h>
>>> #include <linux/vmstat.h>
>>>+#include <asm-generic/set_memory.h>
>>>
>>> #ifdef CONFIG_DYNAMIC_SCS
>>> DEFINE_STATIC_KEY_FALSE(dynamic_scs_enabled);
>>>@@ -32,19 +33,31 @@ static void *__scs_alloc(int node)
>>> {
>>> 	int i;
>>> 	void *s;
>>>+	pgprot_t prot = PAGE_KERNEL;
>>>+
>>>+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>>>+	prot = PAGE_KERNEL_SHADOWSTACK;
>>>+#endif
>>
>>I would rather define the shadow stack protection flags in the header
>>file and allow them to be overridden in asm/scs.h.

Yes that's good idea. I'll do that.

>>
>>> 	for (i = 0; i < NR_CACHED_SCS; i++) {
>>> 		s = this_cpu_xchg(scs_cache[i], NULL);
>>> 		if (s) {
>>> 			s = kasan_unpoison_vmalloc(s, SCS_SIZE,
>>> 						   KASAN_VMALLOC_PROT_NORMAL);
>>>+/*
>>>+ * If software shadow stack, its safe to memset. Else memset is not
>>>+ * possible on hw protected shadow stack. memset constitutes stores and
>>>+ * stores to shadow stack memory are disallowed and will fault.
>>>+ */
>>>+#ifndef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>>> 			memset(s, 0, SCS_SIZE);
>>>+#endif
>>
>>This could also be moved to a static inline function that
>>architectures can override if they have hardware shadow stacks that
>>cannot be cleared at this point.

Make sense.

>>
>>> 			goto out;
>>> 		}
>>> 	}
>>>
>>> 	s = __vmalloc_node_range(SCS_SIZE, 1, VMALLOC_START, VMALLOC_END,
>>>-				    GFP_SCS, PAGE_KERNEL, 0, node,
>>>+				    GFP_SCS, prot, 0, node,
>>> 				    __builtin_return_address(0));
>>>
>>> out:
>>>@@ -59,7 +72,7 @@ void *scs_alloc(int node)
>>> 	if (!s)
>>> 		return NULL;
>>>
>>>-	*__scs_magic(s) = SCS_END_MAGIC;
>>>+	__scs_store_magic(__scs_magic(s), SCS_END_MAGIC);
>>>
>>> 	/*
>>> 	 * Poison the allocation to catch unintentional accesses to
>>>@@ -87,6 +100,16 @@ void scs_free(void *s)
>>> 			return;
>>>
>>> 	kasan_unpoison_vmalloc(s, SCS_SIZE, KASAN_VMALLOC_PROT_NORMAL);
>>>+	/*
>>>+	 * Hardware protected shadow stack is not writeable by regular stores
>>>+	 * Thus adding this back to free list will raise faults by vmalloc
>>>+	 * It needs to be writeable again. It's good sanity as well because
>>>+	 * then it can't be inadvertently accesses and if done, it will fault.
>>>+	 */
>>>+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>>>+	set_memory_rw((unsigned long)s, (SCS_SIZE/PAGE_SIZE));
>>>+#endif
>>
>>Another candidate for an arch-specific function to reduce the number
>>of ifdefs in the generic code.

Yes I'll do these changes in next iteration.
>>
>>Sami

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
