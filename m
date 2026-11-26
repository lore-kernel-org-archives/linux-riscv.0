Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CCD606A32A
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sHkEYjev;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gOIJf884
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mhqr5EDwhT/R5CJ8MS78MjDgFD++98lq1gx7/92KM2M=; b=sHkEYjevYLFcddWllK9OggxwyF
	elo3HBaNstG4i5GhLR5Im5yUyms16k/9b4PWtdqRM4rgLsr3EVoWfSOXzAe0diFapeIQuAIVFaT9M
	rJ59zddDWXvg12+hogpk4dCpRPoDae4EQvxEWE6Q9dxXrG/+dHHfqWdZhE+1PzTKwTFBfo9Oq7ub3
	viMKLbYCE+YuBf4kJEDJiLY9LUYQ3mZtVYAhRrup6HdhOjPWkNPn2qS0PSXIRqzx9rdEL8q9iW+g4
	lQRYIM2TnHyrm8xCqN686INkJhKbWFCcxeYLGrKOq0Tr0c+SCQjpKM9Qb/Lqj0ugB2aoSD/Zu4hLn
	7TWqX6LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXXz-0000000Cx3g-1YgW;
	Thu, 26 Nov 2026 11:21:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXX5-0000000Cw6g-2QT9;
	Thu, 26 Nov 2026 11:20:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45FFE4374A;
	Thu, 26 Nov 2026 11:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3423A1F000D1;
	Thu, 26 Nov 2026 11:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795692054;
	bh=MMesdoqS6IgWWnyy/lMZV01AhuTBPRWjqbmXz3+vHNk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gOIJf884KufaBaPzwIhw/JQosylTm2ObEX+n+dIBRN8n85W6YpVjq7ssAotO+XCJb
	 yTL4B6gPdRjtDz/3xSHiK4N+B00/PqKVy9Hbs/TF+niNS12CriahUizn4VQ3BD5VOn
	 J+iM14A0TRzeQTvx7rtgl+cn2ckJiTBVgqj/qwdF8EcqYQeaDsqOUX7rJElVd2Yi6P
	 XJO9F4VkscYC7PgN2GgWM1Wn7Nv9FQtkWqo+6V521w3Cq3S43n28pusd6yjsD3qGNb
	 o3gldwMIRC0NRUz2anmwEwh+hOlXpqGWtL2SOFGmc4CrKefHoz4Ifigh1EQqRG+fnW
	 xnlqBATFEXtXQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:14:53 +0200
Subject: [PATCH RFC v2 40/54] riscv: replace set_memory_rw_nx() with
 set_memory_nx() and set_memory_rw()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-generic-set-memory-v0-1-v2-40-723f1e33c3d8@kernel.org>
References: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
In-Reply-To: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
To: linux-mm@kvack.org
Cc: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Borislav Petkov <bp@alien8.de>, Brendan Jackman <brendan.jackman@linux.dev>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16.1-dev
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

free_initmem() is the only user of set_memory_rw_nx(). Keeping it would
require the generic set_memory() to provide an operation for riscv alone.

Make free_initmem() clear the executable bit with set_memory_nx() and then
make the range writable with set_memory_rw(), like x86 does in
free_init_pages(). In this order the init text never becomes writable and
executable.

Remove set_memory_rw_nx().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/riscv/include/asm/set_memory.h | 2 --
 arch/riscv/kernel/setup.c           | 6 +++++-
 arch/riscv/mm/pageattr.c            | 6 ------
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index e9f9960c1947..b9a8c7033c7a 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -15,7 +15,6 @@ int set_memory_ro(unsigned long addr, int numpages);
 int set_memory_rw(unsigned long addr, int numpages);
 int set_memory_x(unsigned long addr, int numpages);
 int set_memory_nx(unsigned long addr, int numpages);
-int set_memory_rw_nx(unsigned long addr, int numpages);
 static __always_inline int set_kernel_memory(char *startp, char *endp,
 					     int (*set_memory)(unsigned long start,
 							       int num_pages))
@@ -31,7 +30,6 @@ static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
-static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
 static inline int set_kernel_memory(char *startp, char *endp,
 				    int (*set_memory)(unsigned long start,
 						      int num_pages))
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index d79f99b86033..948f0e27aebd 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -378,7 +378,11 @@ bool arch_cpu_is_hotpluggable(int cpu)
 void free_initmem(void)
 {
 	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
-		set_kernel_memory(lm_alias(__init_begin), lm_alias(__init_end), set_memory_rw_nx);
+		/* Clear X before setting W, so that the range is never W+X */
+		set_kernel_memory(lm_alias(__init_begin), lm_alias(__init_end),
+				  set_memory_nx);
+		set_kernel_memory(lm_alias(__init_begin), lm_alias(__init_end),
+				  set_memory_rw);
 		if (IS_ENABLED(CONFIG_64BIT))
 			set_kernel_memory(__init_begin, __init_end, set_memory_nx);
 	}
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 5a1a3b4473c9..433ac98234ed 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -351,12 +351,6 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 	return ret;
 }
 
-int set_memory_rw_nx(unsigned long addr, int numpages)
-{
-	return __set_memory(addr, numpages, __pgprot(_PAGE_READ | _PAGE_WRITE),
-			    __pgprot(_PAGE_EXEC));
-}
-
 int set_memory_ro(unsigned long addr, int numpages)
 {
 	return __set_memory(addr, numpages, __pgprot(_PAGE_READ),

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
