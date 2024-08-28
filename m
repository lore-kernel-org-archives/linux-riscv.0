Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FFBC5472D
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 05:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0Ni9WFjhaJIgwV3udasZD1syW0L8LcjddRNeagHMMs=; b=sZOtUK7+dwzj3L
	X/bxIiL2TmOr3Q8gUis2NBBNo4JvVnsMZ34lGFBzD1G4xCcw31Gtq+nZe2sb0eMjLSlDH0YtO6VT/
	dAjcPsDG900TmV/pZF4k48GY3ghZ+dKYxP6YCJwKRFR1rqfYVWJDP0bJyhPI/CFxZWxxuBYy+aLUh
	aFZk4k4iJsUvaMRC3O1/LCMtPwCf1jbdM2F/4x04RD8A8RyCymIvRK1RsriCf8DqbSsSGZTQN5J1c
	AKF7GQj8uFnLOnP2+sWqPM+iL5TjvB/F1uM1mxexZ8xJLm0RDNqFce8QOitvBMj0+d7Y+8SAWI0tg
	6reta1RQBYW0KAIqJLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBYr-0000000DxuW-2OO8;
	Wed, 28 Aug 2024 05:49:41 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBYn-0000000DxqR-15pd
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 05:49:39 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20223b5c1c0so57717005ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 22:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824177; x=1725428977; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGbwsGUaSgh3SYkS7pHaMfmAZns1s9a6v7xPbD2XVAI=;
        b=cP+1yoIBvSHZ5pDiVhapOzMxiKRRwKnsi0Vpq9Oav6kt1lwaMmPRj7+r0wxuunwBVb
         pyOryAeSUkBD6o1tc4Xnb1No2XLDiHJJ07b46EIORXeuU2zCG//fjAcMzz+GCN7o1sNi
         dhR+CSZsX7zvETi1yDI8sfbqG2jc1Ehppz+YbPZIcPVpNrpRPLhcTDqyaip4trYVqVfg
         qDhtEKm/E8xO9zypN1nflFP6s6//FL0Qsxr5lauB2QKVgEALhaw+BC4eFlJDQJxeAciR
         gvbL2YX9LgPXBW/8MDgc5Wi0+VCljbX1NqcgQBKdIdE3o3eRLQEBZoIX+r03YRbNV96e
         YH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824177; x=1725428977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGbwsGUaSgh3SYkS7pHaMfmAZns1s9a6v7xPbD2XVAI=;
        b=C6w+VT1i5UkjJZBw6ECvItKG28wjttAf8/QmoE/eHy+V9EgV6Fh8dbxq1y4dBp5xJr
         gJMNH1hohlr1489vqAakjoaDgUxTgR47p98pG0eWzpNpkDzs3yh0jmJE58f5CAFbdjDi
         fF/h39jRTB7o8V4Z/jV48A6l4DWfoS/oS2SO06Vw4qiV1mgRx9CB4zRvBYhP8LipiCHn
         MRLj9hi3gBSTjeqgMI0awjImFY4Wfwu4jXXeGQFViHi2KzMV7S8p3+vJUKW//OaN56MI
         Ht7FIQ8lW3BgbDYNdsDRJ87qBNTqLcTW3HJWseY8m2LW2G+qjYkOAeGyQv7g1l/swquK
         F03Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuzW5EojvagE9Xp7gGXVI1Ge7aTjL/t017EISn1HAorFhC5O/wVjACAJzYLBUG649h6+1TcpJRRPC2Mw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvsg51ekQWk5SaJCe5yFFE8TgT7GbP7f+kqz+1DR8FoUgP0OP5
	t6qvh1xOSUyyqBkdLKZp/+SXDYJkqPrAJQkGBj7EApKSL5LzXzweX/Dv2AwYikA=
X-Google-Smtp-Source: AGHT+IETeUynSugovs7+A+AN20czg30Ola2aofBrInbwTCbD60I4EWjQ5oF17Pp044tfVMlW9N70GQ==
X-Received: by 2002:a17:902:f946:b0:1fb:6ea1:6a with SMTP id d9443c01a7336-204f9bf6b4fmr8673095ad.42.1724824176426;
        Tue, 27 Aug 2024 22:49:36 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:35 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:09 -0700
Subject: [PATCH 03/16] mm: Add flag and len param to arch_get_mmap_base()
MIME-Version: 1.0
Message-Id: <20240827-patches-below_hint_mmap-v1-3-46ff2eb9022d@rivosinc.com>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
In-Reply-To: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Shuah Khan <shuah@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3681; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=deEFSUhsRdIX0bdzxWoQYKSiKJBAsZhcTOjbVXT5+ls=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XbEKPQVKN+QOfCnd/vQAx7Mm0aicnIfvMk/aT/p2R
 eLJrUMHOkpZGMQ4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZiI/GeGP5ySTrLnNmwQmXLz
 8w+bnE++e2VFjGTvdAadNPbzvHntw1tGhs53DbPX/utm9fCf+JHzi+Xvmwkm0w5eV/OMyrFcaSf
 ykBcA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_224937_472699_9E6C0AFB 
X-CRM114-Status: GOOD (  13.42  )
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

The flag and len param is required in arch_get_mmap_base() to implement
MAP_BELOW_HINT.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/arm64/include/asm/processor.h      | 2 +-
 arch/powerpc/include/asm/task_size_64.h | 2 +-
 arch/riscv/include/asm/processor.h      | 2 +-
 fs/hugetlbfs/inode.c                    | 2 +-
 include/linux/sched/mm.h                | 2 +-
 mm/mmap.c                               | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index f77371232d8c..a67ca119bb91 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -95,7 +95,7 @@
 #define arch_get_mmap_end(addr, len, flags) \
 		(((addr) > DEFAULT_MAP_WINDOW) ? TASK_SIZE : DEFAULT_MAP_WINDOW)
 
-#define arch_get_mmap_base(addr, base) ((addr > DEFAULT_MAP_WINDOW) ? \
+#define arch_get_mmap_base(addr, len, base, flags) ((addr > DEFAULT_MAP_WINDOW) ? \
 					base + TASK_SIZE - DEFAULT_MAP_WINDOW :\
 					base)
 #endif /* CONFIG_ARM64_FORCE_52BIT */
diff --git a/arch/powerpc/include/asm/task_size_64.h b/arch/powerpc/include/asm/task_size_64.h
index 5a709951c901..239b363841aa 100644
--- a/arch/powerpc/include/asm/task_size_64.h
+++ b/arch/powerpc/include/asm/task_size_64.h
@@ -72,7 +72,7 @@
 #define STACK_TOP_MAX TASK_SIZE_USER64
 #define STACK_TOP (is_32bit_task() ? STACK_TOP_USER32 : STACK_TOP_USER64)
 
-#define arch_get_mmap_base(addr, base) \
+#define arch_get_mmap_base(addr, len, base, flags) \
 	(((addr) > DEFAULT_MAP_WINDOW) ? (base) + TASK_SIZE - DEFAULT_MAP_WINDOW : (base))
 
 #define arch_get_mmap_end(addr, len, flags) \
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 1015f2a49917..7ff559bf46f2 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -19,7 +19,7 @@
 	STACK_TOP_MAX;						\
 })
 
-#define arch_get_mmap_base(addr, base, flags)			\
+#define arch_get_mmap_base(addr, len, base, flags)		\
 ({								\
 	base;							\
 })
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 9f6cff356796..05a52f85dba9 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -195,7 +195,7 @@ hugetlb_get_unmapped_area_topdown(struct file *file, unsigned long addr,
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
-	info.high_limit = arch_get_mmap_base(addr, current->mm->mmap_base);
+	info.high_limit = arch_get_mmap_base(addr, len, current->mm->mmap_base, flags);
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
 	addr = vm_unmapped_area(&info);
 
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 91546493c43d..265b43855d0b 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -174,7 +174,7 @@ static inline void mm_update_next_owner(struct mm_struct *mm)
 #endif
 
 #ifndef arch_get_mmap_base
-#define arch_get_mmap_base(addr, base) (base)
+#define arch_get_mmap_base(addr, len, base, flags) (base)
 #endif
 
 extern void arch_pick_mmap_layout(struct mm_struct *mm,
diff --git a/mm/mmap.c b/mm/mmap.c
index d0dfc85b209b..27a7f2be3f68 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1861,7 +1861,7 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
-	info.high_limit = arch_get_mmap_base(addr, mm->mmap_base);
+	info.high_limit = arch_get_mmap_base(addr, len, mm->mmap_base, flags);
 	addr = vm_unmapped_area(&info);
 
 	/*

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
