Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EB6C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 10:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pWG5rrMwqKfUOrOYMY8Sb7fXXc1V5McVYyUoE79akvA=; b=FDXtftAKsAJ5ac
	w8iZKvnK5xL78zkavkJ0/vk5U6Q0Cke3Kk7W/RHuf09vQhrKadrL3HNBz4R9TbBaUi/kJ+wfm0HMa
	5WptQNnAWIKIq4P4pNuj9w44xCBtc1DqQZMFz0y84lGuGveqQz1BukH6W/Na8hOPzEqbvcfv6rVru
	tq1uHhsFhzeruJUOzZ1coqpgL9IGdwjlhVERJ65P3M82LDEfKpRciSXru5VzjE2j2rzaGbNXr/vKi
	Pxc1Fzg9Y6Ph14iNMcI8KZ8ujDrf42Ln5eU/9KXRUCPLS7ueVKbH6hDHI7PIAdh1VUo1i29tSq87i
	oFCzrTsChFop+lZzqfyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muBbC-003Qax-MV; Mon, 06 Dec 2021 10:51:58 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muBao-003QQU-6c
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 10:51:38 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 010443F1F3
 for <linux-riscv@lists.infradead.org>; Mon,  6 Dec 2021 10:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638787893;
 bh=RhDgG2MxbU+/Y0zOamju9twdysjbp89/nSRpYLjOzDo=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=O4Lw4dVSzplN73FF2gW5MxSQz+1yUfpgmfQ30ZLKLFINoTJ0rsBLKruffuPL5w82K
 sj+VoNtMOWXEoQ8ZzRqZpqj4y3TTOHSgVzZZFsrEqhKkYUIMbVOW6ovw454fiqPQ3O
 IYvJ09Gx+v36WnUXjXzUhOnFK0ascamu5qllKsp00NtIaj9J3DKrI4AM3UjBu7GiAY
 mu/2boGpYEDZU0vvNzDWdHkcCWA13Cc4rvKe/Bf7VZS6n8zriPJacUv5nTvG09PrL8
 IneuLM4f/58hnBFNvRCSY50Yc32eY1YBvUTW5mTFTit10c7DDcVeGPwi/8mQH+x7U/
 uNfQeCmxZeYfQ==
Received: by mail-wm1-f71.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso7664322wme.8
 for <linux-riscv@lists.infradead.org>; Mon, 06 Dec 2021 02:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RhDgG2MxbU+/Y0zOamju9twdysjbp89/nSRpYLjOzDo=;
 b=bCuwj23Aeq+5UNwjiM/YPGmHkfgDQI9f6PXvnLzQTPpF+OqMpLyhJWAjCtEQE7SvvV
 2qB7P6yCN9NNiF7rlJnRujNuhdCNs3s4JtierxjtDUZnZ5v6/InMYmnFjkUQuxaq7Bzr
 5OjVS1E2+RAFf7Hj1xiI1wE9mpqzKRnr7ML4l8WYttrgBumnRAzCevwYMx6qQT0y7y94
 YSgkP1kIOlqZXf9ALJ9cmZ/qPUnSgfMRkzmQwXmW/JtA0VJOFrlFvp9jbj0R8bPup70E
 +IYbdYoVnITeLdHpwjdNy3CpPM6kuZBWSMkQNna23o70wPK6SJbpv68kWfqHBjmWhGY8
 ZOzQ==
X-Gm-Message-State: AOAM5322tEvs9DJmSkJZkK8c174kxnyp7QLxpu8f6SbRm+l3qquSOITG
 IZzPi2CaXbUnWu42jMbQw2isyog6NeOHebPOk8QcHvzL5VYc12HCxsiGO5xB6pSEm7BHeRoh78A
 3r+O3EoTU9J/xCRuOwNlqeTPghWnJiDBx/FOLHC4mj5J8jw==
X-Received: by 2002:a1c:a503:: with SMTP id o3mr38875038wme.98.1638787881605; 
 Mon, 06 Dec 2021 02:51:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPNUdS2gHzFpdP33u94EGT3zHNk81HnKWbQmnp6Sv+KE5A/wBLYQgSvy6gAW+sq9ArPIrD7Q==
X-Received: by 2002:a1c:a503:: with SMTP id o3mr38874988wme.98.1638787881428; 
 Mon, 06 Dec 2021 02:51:21 -0800 (PST)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr.
 [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id d2sm13816061wmb.24.2021.12.06.02.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 02:51:21 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@rivosinc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, panqinglin2020@iscas.ac.cn,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v3 04/13] riscv: Allow to dynamically define VA_BITS
Date: Mon,  6 Dec 2021 11:46:48 +0100
Message-Id: <20211206104657.433304-5-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_025134_427019_8E209184 
X-CRM114-Status: GOOD (  15.77  )
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

With 4-level page table folding at runtime, we don't know at compile time
the size of the virtual address space so we must set VA_BITS dynamically
so that sparsemem reserves the right amount of memory for struct pages.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/Kconfig                 | 10 ----------
 arch/riscv/include/asm/kasan.h     |  2 +-
 arch/riscv/include/asm/pgtable.h   | 10 ++++++++--
 arch/riscv/include/asm/sparsemem.h |  6 +++++-
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6cd98ade5ebc..c3a167eea011 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -146,16 +146,6 @@ config MMU
 	  Select if you want MMU-based virtualised addressing space
 	  support by paged memory management. If unsure, say 'Y'.
 
-config VA_BITS
-	int
-	default 32 if 32BIT
-	default 39 if 64BIT
-
-config PA_BITS
-	int
-	default 34 if 32BIT
-	default 56 if 64BIT
-
 config PAGE_OFFSET
 	hex
 	default 0xC0000000 if 32BIT && MAXPHYSMEM_1GB
diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
index 2788e2c46609..743e6ff57996 100644
--- a/arch/riscv/include/asm/kasan.h
+++ b/arch/riscv/include/asm/kasan.h
@@ -27,7 +27,7 @@
  */
 #define KASAN_SHADOW_SCALE_SHIFT	3
 
-#define KASAN_SHADOW_SIZE	(UL(1) << ((CONFIG_VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
+#define KASAN_SHADOW_SIZE	(UL(1) << ((VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
 #define KASAN_SHADOW_START	(KASAN_SHADOW_END - KASAN_SHADOW_SIZE)
 #define KASAN_SHADOW_END	MODULES_LOWEST_VADDR
 #define KASAN_SHADOW_OFFSET	_AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index d34f3a7a9701..e1a52e22ad7e 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -50,8 +50,14 @@
  * struct pages to map half the virtual address space. Then
  * position vmemmap directly below the VMALLOC region.
  */
+#ifdef CONFIG_64BIT
+#define VA_BITS		39
+#else
+#define VA_BITS		32
+#endif
+
 #define VMEMMAP_SHIFT \
-	(CONFIG_VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
+	(VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
 #define VMEMMAP_SIZE	BIT(VMEMMAP_SHIFT)
 #define VMEMMAP_END	(VMALLOC_START - 1)
 #define VMEMMAP_START	(VMALLOC_START - VMEMMAP_SIZE)
@@ -653,7 +659,7 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
  * and give the kernel the other (upper) half.
  */
 #ifdef CONFIG_64BIT
-#define KERN_VIRT_START	(-(BIT(CONFIG_VA_BITS)) + TASK_SIZE)
+#define KERN_VIRT_START	(-(BIT(VA_BITS)) + TASK_SIZE)
 #else
 #define KERN_VIRT_START	FIXADDR_START
 #endif
diff --git a/arch/riscv/include/asm/sparsemem.h b/arch/riscv/include/asm/sparsemem.h
index 45a7018a8118..63acaecc3374 100644
--- a/arch/riscv/include/asm/sparsemem.h
+++ b/arch/riscv/include/asm/sparsemem.h
@@ -4,7 +4,11 @@
 #define _ASM_RISCV_SPARSEMEM_H
 
 #ifdef CONFIG_SPARSEMEM
-#define MAX_PHYSMEM_BITS	CONFIG_PA_BITS
+#ifdef CONFIG_64BIT
+#define MAX_PHYSMEM_BITS	56
+#else
+#define MAX_PHYSMEM_BITS	34
+#endif /* CONFIG_64BIT */
 #define SECTION_SIZE_BITS	27
 #endif /* CONFIG_SPARSEMEM */
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
