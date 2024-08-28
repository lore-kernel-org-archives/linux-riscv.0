Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB016C5474F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 05:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XI8daLBs7JEVkRXCcb9vAmNthNQZ3YMdXlYbydjPEuo=; b=HseagyuNqJAbmF
	bMXoUbBT/h7/OtUF07oem64/KpELqMaOqHrG/cTsJv9/v6Wtz+Ng508mHTxs0/6dRQENHFP0/wrsJ
	0Vv49bwzPleEKMd3/C408vrRQMG3bxFVgDRIXl+TPgkFQlptWVDH8dY9Ngk6//XhFqO4ewu8jcVTv
	gc3xvEiKP5O69ZIOb4oWJMdgwK1Gv4dVfAk9THPDZ2D8pRmKZO+ZRAOg1eY26O9sRHZ0BK2dYRwLZ
	B/n9glofHDwRpFSAA0kw5u+Y8FZlX4kKfUr5uAzURmmz7KOrVxa0Y55yHbKv1ym/O6fY4RhKsE2Hg
	d3ZRM2075BbAFpmbgCKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBYu-0000000DxxG-21HI;
	Wed, 28 Aug 2024 05:49:44 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBYq-0000000DxtO-3e2M
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 05:49:42 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-714263cb074so4433457b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 22:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824180; x=1725428980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+f5iieqZfHqFwlVhHOpYZvOeyZcJe//7AT/XT4juc0=;
        b=fmQ0abtavFMnGvynjdQB4JcNJj9zrDq8FQkwn8zU2/+DJjb1mFZEzjsgDRHLidTnDH
         cd9cilJNaelXb8kUzu+VLJuFLhsKJcLMCHvsKMcC1C4dHfz8Ev0l0SkAHseKvlgQmHkp
         5mv8DfOFjJWDYf4U9rnr/jpococaGS1GfpvPgX1th9N52oyePpHHV6SsX2JzFfcEJw+V
         Bo9mFyUtjn+UO/twqcJcXZtsEe2nY00P0MtVq70bYiH39BaodGwdsBQtBjF84ES4zaZp
         9D5ZbMh+hMrvk0xGOp9Blu9yfjCBMzdKPDl0zBibOESWGQLA3Vgzz1fYHJlD9K1UfOQe
         w40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824180; x=1725428980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+f5iieqZfHqFwlVhHOpYZvOeyZcJe//7AT/XT4juc0=;
        b=iUp0uNbDAjnTJlGQnFq2ZTqnvoxVfZNQwwkeSKOiOTDghQBAlVYF3SBugFwLX2PxNs
         QpHEanBwVNFVuHn5MBl5aF+FWA3Tvt1vviFwiBBBQGNxCkvD5retS2+lykML3H5hCgI0
         kzeU2aB3FWWsCQnf1Y3evNhiIh59kUaZpdUTQsTIBj3qBpKDfyWWaZHP9Gm1gYGJIDmt
         AmME0tXAavUGMxvyV1ju6k7TiKk8Co6BWaqgZtK91/WJ+W4mOsmlEHAx4lPM7Od9VSpC
         wKxO9sUjSbmM+aTlHRfvwol5CUimArUKzK37i08ddr4UmZtoY+QOqg+TCANBhRLKcXu3
         S7Cg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Z1a8aJxWWAgFEy/ZAscHKcnRVHC/gl2gdloKHErYvwGEJTqdByulvMVQtRu7YifR2v1HWGhktucxJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3+ahEG4YW1rCf3hNgTOrZX0eGgXo8bNAkQ2IxvY7096EcVQ3j
	cJu7NDhLr/UIqzWS08TPO78b8akEhNZHCXofxjIj8pSxem5Bmemje25Bn6MOzC0=
X-Google-Smtp-Source: AGHT+IGKYEbmAbccdwLglj8Rtz7Ncms8BNc+Vjhrih2XUvI/cV2bfefpghFryVXCiPvCQUUiKdRNjQ==
X-Received: by 2002:a05:6a21:3401:b0:1c6:a777:4cfa with SMTP id adf61e73a8af0-1cc8b475035mr13030363637.13.1724824179851;
        Tue, 27 Aug 2024 22:49:39 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:39 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:10 -0700
Subject: [PATCH 04/16] mm: Add generic MAP_BELOW_HINT
MIME-Version: 1.0
Message-Id: <20240827-patches-below_hint_mmap-v1-4-46ff2eb9022d@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2165; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=+G9/grHdHxL6H0Lnh65S6ISh5epJb2mrAov/AP0hs9c=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XXGZXkeVtgeold2b3dqjkt+vEXMu6H6oc1bJNYtbJ
 3aetlzTUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwERWFTEyNKap9S5rOHHkFBPT
 SkUp8yq1Cd/4ljyftDBFnmW663I5b4Z/RluSpK/6drw7JD8vOuPN75znwc73OQp/v/2R9GK2Tfl
 mPgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_224940_962216_37F28B5F 
X-CRM114-Status: GOOD (  13.52  )
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

Make the generic implementation of arch_get_mmap_base() and
arch_get_mmap_end() support MAP_BELOW_HINT.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 include/linux/sched/mm.h | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 265b43855d0b..c350bb5ac0a2 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -9,6 +9,7 @@
 #include <linux/gfp.h>
 #include <linux/sync_core.h>
 #include <linux/sched/coredump.h>
+#include <uapi/asm/mman.h>
 
 /*
  * Routines for handling mm_structs
@@ -170,11 +171,40 @@ static inline void mm_update_next_owner(struct mm_struct *mm)
 
 #ifdef CONFIG_MMU
 #ifndef arch_get_mmap_end
-#define arch_get_mmap_end(addr, len, flags)	(TASK_SIZE)
+#define arch_get_mmap_end(addr, len, flags)							\
+({												\
+	unsigned long mmap_end;									\
+	typeof(flags) _flags = (flags);								\
+	typeof(addr) _addr = (addr);								\
+	typeof(len) _len = (len);								\
+	mmap_end = TASK_SIZE;									\
+	if (_flags & MAP_BELOW_HINT && _addr != 0)						\
+		mmap_end = MIN(mmap_end, _addr + _len);						\
+	mmap_end;										\
+})
 #endif
 
 #ifndef arch_get_mmap_base
-#define arch_get_mmap_base(addr, len, base, flags) (base)
+/*
+ * rnd_gap is defined to be (STACK_TOP - _base) due to the definition of
+ * mmap_base in mm/util.c
+ *
+ * Assumes ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT, which all architectures that
+ * implement generic mmap use
+ */
+#define arch_get_mmap_base(addr, len, base, flags)						\
+({												\
+	unsigned long mmap_base;								\
+	typeof(flags) _flags = (flags);								\
+	typeof(addr) _addr = (addr);								\
+	typeof(base) _base = (base);								\
+	typeof(len) _len = (len);								\
+	unsigned long rnd_gap = STACK_TOP - _base;						\
+	mmap_base = _base;									\
+	if (_flags & MAP_BELOW_HINT && _addr != 0)						\
+		mmap_base = MIN(mmap_base, (_addr + _len) - rnd_gap);				\
+	mmap_base;										\
+})
 #endif
 
 extern void arch_pick_mmap_layout(struct mm_struct *mm,

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
