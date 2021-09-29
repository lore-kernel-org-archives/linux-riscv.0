Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D8CC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 14:52:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C15DF61440
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 14:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C15DF61440
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHHw7MQSXE0PxV93e768g1dP9wcItO981ewkvJk+uv8=; b=B1sdNFgyYnWthZ
	A2cV9SfqcFl/LDABCjwos446pXhGKVgpgkNmFkYIEIgdfJkmKnQrOcYkgzk79VDhzmrnHrCIo1hJe
	W5eoRxqTh9EBEEl6yXOuj4M8sbdmdmZ2Gb9vsSPXxUxvSK74/I73dS58Bkzl8E22odumOjd2yeTrM
	mjt+IOLfc6mSdduUt0+kRug3LKMD0g09U05dpZ3rGxJasSPylHrpFAN6G/m8Bl/13cFW06zP5SJ+w
	tf+3sONukrxozN+sYb9svhjlPwu8leGG9HfnMID+vXmbf/brDoHVASfPvUCFIcUo6qhvVtejhWqh2
	QWs2+FF2TFIdbvb6p2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVawq-00BP0w-QK; Wed, 29 Sep 2021 14:52:40 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVawn-00BOya-Tc
 for linux-riscv@lists.infradead.org; Wed, 29 Sep 2021 14:52:39 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D761240601
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 14:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632927155;
 bh=w+ItQrTCaMVUbpdrDeVWHNI7WQYLMpa9OWlT3PsgkZk=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=jLgiigb2Vwqoeg/f6t/hPp3LnBahYrX+h9T7RAVmMAUP4uavoezOXeZj/pmr0TrG4
 s/Mo19GDJUlWXBgDSFo3HkslBe5R32uqzNEPr4pc6eJMzAmpa9XGrqTA/JMfu4mYEi
 BVVGkU7IrDCkAg5qsx+fCtLRMVy9RVV1Rwh98fkVFnrxFnDgzwFqXUCMyEAdy7aREG
 Sl8MUDuj/U6+kM6MDk0OtyEk8KLdvc/Fd8R9YIbK0C4w98As8C1sdfXyOUMiTPGQiQ
 vegu0TNFNhi8Tj4qg78CNpu7WBbQzKfUrmDG3VETqdHivt8VjVoL8PG8HYF1gC7u64
 PRgOiz1B4O0uQ==
Received: by mail-wm1-f70.google.com with SMTP id
 b139-20020a1c8091000000b002fb33c467c8so1335733wmd.5
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 07:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w+ItQrTCaMVUbpdrDeVWHNI7WQYLMpa9OWlT3PsgkZk=;
 b=6tbtgV7TL7pyfsM1ocJ9mU3YizJxbELNfZlVHkBVJBFIdDVqbMmU5XuYyCvpM8+sFk
 JkloYFp13XxocyupKZIPiPLoZYkSuBjw1VzBDerEnwBCoYKua5Z9Kgb2vVa7ovlzAYpu
 b53zvE8edTu3DeEB7rMUjvXax9vpe0HmiamaAU5Je1p/LCMzT7OoSuvnrvzFkX6FHnlG
 11CZzglV1Jn+tnqUQ62lWwwYlDMmiElXHumUdflFZ7NBcSKcE/m6LVx3LFq3hJskFE+T
 t2nkSoWWpcp5j3F9NSS7nXEaBUPYM0QLXhsPjUG7hmWHOES4hEZ9gNqbSPIrkvWviOED
 lH+g==
X-Gm-Message-State: AOAM533bopgzntiWqSBCveTdVqCOUNHKcEe/eF9FSRjR0NVLQrjVjMBJ
 wBqyDx298e5FJfqxfVQ6NW2uanpY6i1VwfUKtNMN+H6ki5Bd2oK/VM2l6Qj689trMSPy0Kr9wQG
 8g8bzrAVmkClcZRkV+5Xyq3BVne3CfB5hhDNnAqvFQkeZiw==
X-Received: by 2002:adf:de86:: with SMTP id w6mr253954wrl.287.1632927155214;
 Wed, 29 Sep 2021 07:52:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtHf+BUoKNP9WjhKmbVbOYrY4zs5f5NWeWpOsBJLJB1JCsonTpkjp5Ui+UI2TvrZXfYZZpmg==
X-Received: by 2002:adf:de86:: with SMTP id w6mr253923wrl.287.1632927155024;
 Wed, 29 Sep 2021 07:52:35 -0700 (PDT)
Received: from alex.home (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id k11sm104889wrn.84.2021.09.29.07.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 07:52:34 -0700 (PDT)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@wdc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
 linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v2 01/10] riscv: Allow to dynamically define VA_BITS
Date: Wed, 29 Sep 2021 16:51:04 +0200
Message-Id: <20210929145113.1935778-2-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
References: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_075238_129646_FF63ECC9 
X-CRM114-Status: GOOD (  15.95  )
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
 arch/riscv/include/asm/pgtable.h   | 10 ++++++++--
 arch/riscv/include/asm/sparsemem.h |  6 +++++-
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c1abbc876e5b..ee61ecae3ae0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -145,16 +145,6 @@ config MMU
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
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 39b550310ec6..e3e03226a50a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -48,8 +48,14 @@
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
@@ -651,7 +657,7 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
