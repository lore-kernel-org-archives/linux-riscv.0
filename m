Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81638C87FCC
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 23:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++i3hUo2p/9zwsxl+ZYvzzrx3GMQFp+GA13zZInoVXQ=; b=feDzFafgpJuy1g
	t0MJZjSccU0+HDmE+6GX0e3orqRj/qMXTzTRnhO9Ic5EGS6vRsp+j77ijknIBl0mEEeDI/I5o1jnk
	za6AmetP0FPxAge+/kugR+rv0ef3h00jeFOOx8RewZGH0nEmm7/orszTCl24XCda9fYIoHpjo4UHt
	Z0HOXgpXZm1U/ttXHxv9M1AL4ex74bjo+sizqFq7z0h2HqDkyPJ4vIY9Y/8uIZukltirTyafd5pPZ
	zxmZ2jEc7b89dtIhRhBi6ZqcaKENUYRd25X43OilgoM+AYm2EJYUAN5+skVQz7qxoZAY/hTmSmkPZ
	BFQLwe+IaECdzW2ahvKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5f8-00000008iEP-0NbV;
	Thu, 24 Jul 2025 23:47:46 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5VB-00000008h5L-0Kha
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 23:37:30 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234fcadde3eso20913185ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 16:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400248; x=1754005048; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnGfibRKNEJZsKsgrkgY/LkGeimQVZTGPU49pFGQkew=;
        b=fi5pQFTzezGt3aRZqDpz435AIn7k5KxvyLbmt3OdAjGRQ3rwUmyzIgJjAH1ixPzFp2
         45GsKgwZRPnNXwV6LIug9mLQ5TQW44dFxjbO1fB4wGdhwUPArP2SU79nrnR/5Dh0Vn5L
         qAWBduatX/a9ptTLVY2ijoTIMFbQiImVr2XN/wmhJt81qRv+JfvZgnyv9ya90yaA99dJ
         nSVz7L6mBk2HNTbnzN/z/FhUpoyjHi10Ucwnz+JntK70WmMay7lbfoQjyAzrcp5xpXQd
         L4f2iFQhAOhPscj3+M8s8mcTj1LlRy7300FZWXsTjkOx9jnZQnDWq2z6dxygzFI3brVq
         XvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400248; x=1754005048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnGfibRKNEJZsKsgrkgY/LkGeimQVZTGPU49pFGQkew=;
        b=SDO3FS/8G5NvQ9I6YUU5WIwr5+5C2lFIAukxSdaiUXyxtzKDEHRzzQdH57tZjsagWC
         yPRMqzRiBAulNeDKzjfbHluptUyudLciRn1vZLaVxoanMm9f/yMUXdL62vfP9+BKZ0fv
         ZGwrdPHoHAbWd8xQkFDPYHNMMVzpuHXofJjmh85zf9gQuz2cieaGhMM+DYn8qj7SOoM4
         at7WQBofD7FKZSpe0Mju3zrObK/WOWXjkqHGK06qw4q1+dvyk8N+fwhW/wx9wJi2NuHY
         OdUcHVjNGXhBgv0s1TkACUnK4n6iDwi+5WqUufTYN112KtQknr3r2ZBpbqF9CWctirDJ
         RSOw==
X-Gm-Message-State: AOJu0Yz0hRI3WzSPLkiMN5Eb8OpdC5CcnnmJg8t+61w27KwnwIwfik0K
	u80xNmU81nxDznlgjph6RSQtKHl+8njbwAXLeKKV3Cvjh/u4fVGzkbTcDa/T/WzKn0o=
X-Gm-Gg: ASbGnctWy7/OEidbR0/KHF1J9RO+68InEIaDDDh4h3IsqhisiHfCtGFUqe6o+aRPtQL
	1OJqvDAKWo2MYEXgvDsXYNVPsR6M/eN2adc9t4ZhR9VhDP8eDLD+S+QA2b90knyoD15eSO7Uo6m
	YRp8O3oinuaV+5T8y2l7tVHMYMYVoqCWnSHtXMmWooB6Mbq9Gv9L1SmdVSjL1w2MA0we4z2uOj5
	KRNrkdXTuKcGpRCGrskhR/todOrQyS2r9RU6KzaB46gMWHv8mYocInKF+yU/rFv95YfILrDoz95
	iPfSVp86LdNI23SEw57S6lIjICa5MWLoRIZ3+f++5hTPRgUcU+CkaYrnNUkJSQ858YL9tE54FL+
	mEAqi2WUg88kwht+fidSgZj0qDa6mAxEA
X-Google-Smtp-Source: AGHT+IGkF9wRjCt3t8wgcEzoS0u0I/CZsVHEJO+NVtX/XmjUgLckj9jfIg2rldjVpQc+NplTKJU2kw==
X-Received: by 2002:a17:902:f707:b0:235:c781:c305 with SMTP id d9443c01a7336-23f981932f0mr136844375ad.24.1753400248250;
        Thu, 24 Jul 2025 16:37:28 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:27 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:37:03 -0700
Subject: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
MIME-Version: 1.0
Message-Id: <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_163729_123503_EFC5CAA7 
X-CRM114-Status: GOOD (  16.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

If shadow stack have memory protections from underlying cpu, use those
protections. arches can define PAGE_KERNEL_SHADOWSTACK to vmalloc such shadow
stack pages. Hw assisted shadow stack pages grow downwards like regular
stack. Clang based software shadow call stack grows low to high address.
Thus this patch addresses some of those needs due to opposite direction
of shadow stack. Furthermore, hw shadow stack can't be memset because memset
uses normal stores. Lastly to store magic word at base of shadow stack, arch
specific shadow stack store has to be performed.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/scs.h | 26 +++++++++++++++++++++++++-
 kernel/scs.c        | 38 +++++++++++++++++++++++++++++++++++---
 2 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/include/linux/scs.h b/include/linux/scs.h
index 4ab5bdc898cf..6ceee07c2d1a 100644
--- a/include/linux/scs.h
+++ b/include/linux/scs.h
@@ -12,6 +12,7 @@
 #include <linux/poison.h>
 #include <linux/sched.h>
 #include <linux/sizes.h>
+#include <asm/scs.h>
 
 #ifdef CONFIG_SHADOW_CALL_STACK
 
@@ -37,22 +38,45 @@ static inline void scs_task_reset(struct task_struct *tsk)
 	 * Reset the shadow stack to the base address in case the task
 	 * is reused.
 	 */
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	task_scs_sp(tsk) = task_scs(tsk) + SCS_SIZE;
+#else
 	task_scs_sp(tsk) = task_scs(tsk);
+#endif
 }
 
 static inline unsigned long *__scs_magic(void *s)
 {
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	return (unsigned long *)(s);
+#else
 	return (unsigned long *)(s + SCS_SIZE) - 1;
+#endif
 }
 
 static inline bool task_scs_end_corrupted(struct task_struct *tsk)
 {
 	unsigned long *magic = __scs_magic(task_scs(tsk));
-	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
+	unsigned long sz;
+
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	sz = (task_scs(tsk) + SCS_SIZE) - task_scs_sp(tsk);
+#else
+	sz = task_scs_sp(tsk) - task_scs(tsk);
+#endif
 
 	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
 }
 
+static inline void __scs_store_magic(unsigned long *s, unsigned long magic_val)
+{
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	arch_scs_store(s, magic_val);
+#else
+	*__scs_magic(s) = magic_val;
+#endif
+}
+
 DECLARE_STATIC_KEY_FALSE(dynamic_scs_enabled);
 
 static inline bool scs_is_dynamic(void)
diff --git a/kernel/scs.c b/kernel/scs.c
index d7809affe740..5910c0a8eabd 100644
--- a/kernel/scs.c
+++ b/kernel/scs.c
@@ -11,6 +11,7 @@
 #include <linux/scs.h>
 #include <linux/vmalloc.h>
 #include <linux/vmstat.h>
+#include <asm-generic/set_memory.h>
 
 #ifdef CONFIG_DYNAMIC_SCS
 DEFINE_STATIC_KEY_FALSE(dynamic_scs_enabled);
@@ -32,19 +33,31 @@ static void *__scs_alloc(int node)
 {
 	int i;
 	void *s;
+	pgprot_t prot = PAGE_KERNEL;
+
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	prot = PAGE_KERNEL_SHADOWSTACK;
+#endif
 
 	for (i = 0; i < NR_CACHED_SCS; i++) {
 		s = this_cpu_xchg(scs_cache[i], NULL);
 		if (s) {
 			s = kasan_unpoison_vmalloc(s, SCS_SIZE,
 						   KASAN_VMALLOC_PROT_NORMAL);
+/*
+ * If software shadow stack, its safe to memset. Else memset is not
+ * possible on hw protected shadow stack. memset constitutes stores and
+ * stores to shadow stack memory are disallowed and will fault.
+ */
+#ifndef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
 			memset(s, 0, SCS_SIZE);
+#endif
 			goto out;
 		}
 	}
 
 	s = __vmalloc_node_range(SCS_SIZE, 1, VMALLOC_START, VMALLOC_END,
-				    GFP_SCS, PAGE_KERNEL, 0, node,
+				    GFP_SCS, prot, 0, node,
 				    __builtin_return_address(0));
 
 out:
@@ -59,7 +72,7 @@ void *scs_alloc(int node)
 	if (!s)
 		return NULL;
 
-	*__scs_magic(s) = SCS_END_MAGIC;
+	__scs_store_magic(__scs_magic(s), SCS_END_MAGIC);
 
 	/*
 	 * Poison the allocation to catch unintentional accesses to
@@ -87,6 +100,16 @@ void scs_free(void *s)
 			return;
 
 	kasan_unpoison_vmalloc(s, SCS_SIZE, KASAN_VMALLOC_PROT_NORMAL);
+	/*
+	 * Hardware protected shadow stack is not writeable by regular stores
+	 * Thus adding this back to free list will raise faults by vmalloc
+	 * It needs to be writeable again. It's good sanity as well because
+	 * then it can't be inadvertently accesses and if done, it will fault.
+	 */
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	set_memory_rw((unsigned long)s, (SCS_SIZE/PAGE_SIZE));
+#endif
+
 	vfree_atomic(s);
 }
 
@@ -96,6 +119,9 @@ static int scs_cleanup(unsigned int cpu)
 	void **cache = per_cpu_ptr(scs_cache, cpu);
 
 	for (i = 0; i < NR_CACHED_SCS; i++) {
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+		set_memory_rw((unsigned long)cache[i], (SCS_SIZE/PAGE_SIZE));
+#endif
 		vfree(cache[i]);
 		cache[i] = NULL;
 	}
@@ -122,7 +148,13 @@ int scs_prepare(struct task_struct *tsk, int node)
 	if (!s)
 		return -ENOMEM;
 
-	task_scs(tsk) = task_scs_sp(tsk) = s;
+	task_scs(tsk) = s;
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	task_scs_sp(tsk) = s + SCS_SIZE;
+#else
+	task_scs_sp(tsk) = s;
+#endif
+
 	return 0;
 }
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
