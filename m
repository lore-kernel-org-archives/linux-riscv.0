Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B02E7718B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 09:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+WohJfce4Pw1L7JLtbP3Gpmp6Yy15IeLJMkiY0Pgq8=; b=qyK7FeZ1I/igUz
	rCg3f0UjAytStX+U87q7wT8fn/rTEQgBNMPk9zOD/hlFf1brIIWPxtg+MDjLthsp9wz62bJo5m5wm
	GuYqw6DssBviCyE6omrJfEGjM/EXT+d7pBMKzZGNot10V0kH7mfNcK806qJ2nlywqR/NLSW06ZIY9
	F/KxbB5lO/NgCJkHLCEa/4JBOPRWI0ii5RXm83G5+g11skbEOSFDHdqf04no6EebpxKXGDgpm93h/
	owdgIkFNX/8aa7XLdXXC9DgyxeIFNTpIwc1Tfd+6wQray3Z3MTznp4Gkq4fSeg6q+qWFLRizJkMok
	pLQ3wyCg1Dul5mP7bGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPf3t-00000009iTX-0iVI;
	Mon, 23 Dec 2024 09:49:17 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPeyt-00000009gRw-0xt6
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 09:44:08 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7fc99fc2b16so2431288a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2024 01:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947047; x=1735551847; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=;
        b=IIm/baMhWvQfvQ5iFy2R44CbxdR8F3uP791p9uNvvS/Nb3tLall8WATSIFTw/WZZpT
         zGzqAJTn/xEIDZzmFRH4237i+LtStaPSrdduWCWqzUj/TJldo/sz0Od8UPmrp8LoJmVd
         Dka3r2QWKlVrBX3JqwJSW7ou3OaXPLwPlrHTFB2E0ilgNZn8v0Gmx7en+JeNSjLvVhbl
         JlbN+AhhZXionScNsbU64PJR+RrfV1KOIz+t5vebjVinLj+JxKgVhhaQdj0ZCLbkqQCv
         PXs/kJw8sQLYHKDR5jBpRts2Hr2a7MEq33vttBJPxlyrsHlR4T7qtZnzZuSqKqNHZMkX
         JnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947047; x=1735551847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=;
        b=IwPLBbi87W2xtNxjATtfooNfP5UU2LpKL4nDTPMVuQi/pzQ3ovLukv/RmufLevsO10
         5x1yMZRN6ULT8aw8hl8FEl1ftPwZO223nqfGfx/JxPTQBy7bAd62wGDQIJLKO9YqS7oB
         Cij6HyNx/BFa4JqSXpYZ5wL2PhvO6wHDuHinbhpIKlwr2DcBsrFZ69xcAgvgKADilWTX
         /uJbxqaqAQaoiNHXkrswQavMCwCAcYKy68fPbygXLeZv9GGsFu8YEK5YrfMW0UKvL5Po
         O3HoqV7DM0Q7gfJCGn2yTwKVmo2dWzPPqLmFk80RkD8hhlZ7WsfGcuKTeHs/dra9SQwO
         j+3A==
X-Forwarded-Encrypted: i=1; AJvYcCVZA6gHjzbBH2xi2A8XtcVBMd2pok+cNWME248iiu0HmrAv4pFZDZeiLaGG70JukceA95P6a6HSpMG0Gw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjz67YRCBJnUPdPQq4S/gquIhGojs3l4ZYe5o19+SbqwxkHeBA
	rbdk7lHaxHapsVRb5bRyKAVqiuHsbuhUHrucPCBgUWNni9YLzpSyexVQFsPQA/A=
X-Gm-Gg: ASbGncuo39RaHgD1C7MEf3U21DXxYgLyqaQueHMmzC+iTOE8eLkcB0LC1XT6571RWwh
	5obxtqAH+FcPp2bRMtCnh1dfovk8hAV6yUa3bd+vcMEqvlxhzF8iUUDfUzpYN57m/kQTpq6t6E1
	0kcscudfmRltk8SguxHCy70NXhMNVPUVOUq+mswiSt3b1j3bbIZQGatECK1JwJdw+xcku2z+qF0
	3ZxiZnksJ77yKS3Sm3pCedybnD7+tTdJGiO0c74FsAa6X7N6esUM3j4iAJGI2phm6juZX4UMUbh
	SUbWRYCGPSDFDr2OJkXqVA==
X-Google-Smtp-Source: AGHT+IEE3DAo82DBKWUM6FD2Qxwd8GTGkBziQ/dfcNtaRbY+efEiB7FXaTM2aY8g2l19VVq60zkLag==
X-Received: by 2002:a05:6a20:7f82:b0:1e0:d575:8d4f with SMTP id adf61e73a8af0-1e5e081c5acmr19810935637.37.1734947046731;
        Mon, 23 Dec 2024 01:44:06 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:44:06 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 05/17] arm64: pgtable: use mmu gather to free p4d level page table
Date: Mon, 23 Dec 2024 17:40:51 +0800
Message-Id: <7c12112047ac230809aacd0379259414b9b0d3a3.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_014407_284542_690BC7FB 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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

Like other levels of page tables, also use mmu gather mechanism to free
p4d level page table.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/include/asm/pgalloc.h |  1 -
 arch/arm64/include/asm/tlb.h     | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 2965f5a7e39e3..1b4509d3382c6 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -85,7 +85,6 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
 	__pgd_populate(pgdp, __pa(p4dp), pgdval);
 }
 
-#define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
 #else
 static inline void __pgd_populate(pgd_t *pgdp, phys_addr_t p4dp, pgdval_t prot)
 {
diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index a947c6e784ed2..445282cde9afb 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -111,4 +111,18 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 }
 #endif
 
+#if CONFIG_PGTABLE_LEVELS > 4
+static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
+				  unsigned long addr)
+{
+	struct ptdesc *ptdesc = virt_to_ptdesc(p4dp);
+
+	if (!pgtable_l5_enabled())
+		return;
+
+	pagetable_p4d_dtor(ptdesc);
+	tlb_remove_ptdesc(tlb, ptdesc);
+}
+#endif
+
 #endif
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
