Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D59CA9EBE
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 11:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UEZVY9AagnXVgyggB+nwusXY27qbZGuZNJ8YjksAp3w=; b=UzVHn5oUALiQrg
	ehCTrUWyFMvc0ukbBBGR6r58j9mibHl3MVDQzrREzqgAKjo9GpOa0LqpRzCzr3DbqmKkFbM45IDt0
	f8oMhWzV2L1eK68uQs9qnsgMkdClYktQNUrYDwmJDWyvUgm3EyLMfYtmtbXo59PWlX/29P+76N1He
	TbbkB3NAYEFqI4Be08nR/0+V3Y6QssgtngF5UfXL7onMZFLQMOPbc7pIwhMZOvbCewDQL5Oa9FHXr
	kaVzTKOnIszI5c6DwCSSC5rMosiFCwTLRH1rw133f6LPdyvY3BlYfmwihq34heRIPNUVnaw09z28Y
	wyNeohz3ETH3h9KV7/RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVDS-00000007ujm-1615;
	Sat, 10 Oct 2026 11:26:14 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVDL-00000007ufL-30rw
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 11:26:10 +0000
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso289940a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 10 Oct 2026 04:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791631567; x=1792236367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPrbN6fNnAjfl8a6kAKqWueJEJ1qRXmGBrgomj1Gs8U=;
        b=Hb+bdxL7pgjkI8hVX7CWQYtQMii+BoELyqRjt1rF0ntTgsJuu04oIPgkKuncfzlGZ6
         QgxGhfaM8JuGY15M+ZoadVte6iQ13O4UlJhRGDwQwJGgxgWKsQfQqEOzHPkLCjiK5YWE
         FCZ+DW/PuCMLuv4uHfSNZiqyZe21uoMNUV0mwgr/2FPd5rZ4zQ5nO9tQXLaLcgdVRTFV
         4b1NM5AV/5q76O/FLcTkrv1PJA93fuagUGxVFQVZURICPgWcB17oB+WEUY9uB0Avo/jr
         KcR/1JL+x0cIS8LripysJEBtVPXIUmdFB7eJya83tqgB8EqzOFzBT1eOR1AtOqnqY/Pp
         1f6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631567; x=1792236367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cPrbN6fNnAjfl8a6kAKqWueJEJ1qRXmGBrgomj1Gs8U=;
        b=kSQmN5GainHjLW74mLmZVZmwYk/lMdFoyxRfm49e8xjtFN4K9A6Ytw4YsEPtU1fb7I
         rGCDrb7GcS02Mk9tqPPtkVGgsY1vVHnnBbIOV5zDUmfOzzSWPNXJZwrvJmuXzW4WlSkW
         8tO66WEySQKwTBZvyy8BZszhPFNZWOWRvb8N6tm7ifY+qsfaDglf3o6MyTP4m7y7hyS9
         OqjfrPX+1n6g9VRvvTX1/MkUxzZD4tXP0697/7cXaGqzN+rovRVbxK/dDa2+QausGksG
         2NiABrB7mg74Xqk5U5KG5SgoDUiKGeSS8uv6QOPYrPCFUQSmaQ/OtojTBIZvuQW73zNg
         cQ7w==
X-Forwarded-Encrypted: i=1; AKwUvByMYSDxES82Exq3uaxZ9ADZP4WvLfB+ZqClwNPtPLkg6fWxOC3JQy00sDyr9jZBI/TahiQkVniFcAPsxw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKHm+IipBeHpBPK6Cl2PbCdrG+2vvOTS4Vb5vqRl8xrlCkwHqOz
	6epVmWg5nE1KZHiTCkJBU4jW4UxM6bwJYnOuCekIZcRfhRYs5lMZ7fglIoAGOcc2zFQ=
X-Gm-Gg: AYBFou3r+Ap94f/Liwbgw8/zskHCRsdPyCOnmyvziTFbHO8mRysC4AEfOzArCksuJXt
	Kt2zocLmcyXTE1ydsm1QIVqolW19/zMEEAf9dYfOE3JbX0ZSffhg2ctEspGL72FTiiLIBe7ynEm
	s39DnM1lLNBUKoMYsc7/GKmgNhd126vFTfA1F0kOE7J59fxzjMfDp1TSHw1LBbVkZ0eB1+/ng8z
	n+Jd7kIJn7WH3PWMNPOSinjjQeEGVwRYpEXta8Y91ulBIbNrInjruvrZPUZWNOfCnp/plwPuzij
	WNuv5q7y8rnpXV9RnHPZCqLoBp+3q7Je6o13PGxodE7Wkoqyn+QPF1IPibeTQmTXjulxG7liofX
	n+Zdfb8WmDGoTE3vR9EaGZPKeWl9dkLixuQKxmFefj3dsD88fdyYcUjd1TH6m0R2QrBI9NBMXS1
	GDI7xplxzqqUv7rD0A9HFTr2nLkW+0/cUwZHwEiQLsATeHdpK6zaGpN40iagSfQvQNsiDDAUJSC
	fKxKJqhZ5aP+RlmkdtIUKTCsOLMaISWhje30Q==
X-Received: by 2002:a17:90b:384a:b0:3a8:c0cd:57f7 with SMTP id 98e67ed59e1d1-3ab3a735f76mr3813182a91.23.1791631566480;
        Sat, 10 Oct 2026 04:26:06 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm7900233a91.0.2026.10.10.04.25.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 04:26:05 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Hansen <dave.hansen@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 2/4] riscv/mm: fix hotplug page-table destructor handling
Date: Sat, 10 Oct 2026 19:24:55 +0800
Message-ID: <20261010112457.49485-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010112457.49485-1-songmuchun@bytedance.com>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_042609_647020_7D8E8FD0 
X-CRM114-Status: GOOD (  13.35  )
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

RISC-V uses the same memory-hotplug teardown code for linear-map and
vmemmap page tables. Late linear-map allocations run page-table
constructors, while vmemmap and early allocations may not.

free_pte_table() unconditionally calls pagetable_dtor(), corrupting
NR_PAGETABLE accounting for constructor-free tables. free_pmd_table()
avoids that for vmemmap using is_vmemmap, but mapping type is not a
reliable proxy for constructor state. In particular, it becomes invalid
once runtime vmemmap tables use the normal pgalloc helpers.

Introduce free_pgtable_page() to select free_reserved_page() for reserved
pages and pagetable_free() otherwise. The latter runs the destructor only
when PageTable() is set, handling both constructor-backed and
constructor-free tables.

Fixes: c75a74f4ba19 ("riscv: mm: Add memory hotplugging support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Use pagetable_free() for non-reserved tables (suggested by David
  Hildenbrand)
- Simplify reserved-page handling
---
 arch/riscv/mm/init.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 857f9a55039c..151eb197cb09 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1486,10 +1486,17 @@ struct execmem_info __init *execmem_arch_setup(void)
 #endif /* CONFIG_EXECMEM */
 
 #ifdef CONFIG_MEMORY_HOTPLUG
+static void __meminit free_pgtable_page(struct page *page)
+{
+	if (PageReserved(page))
+		free_reserved_page(page);
+	else
+		pagetable_free(page_ptdesc(page));
+}
+
 static void __meminit free_pte_table(pte_t *pte_start, pmd_t *pmd)
 {
 	struct page *page = pmd_page(*pmd);
-	struct ptdesc *ptdesc = page_ptdesc(page);
 	pte_t *pte;
 	int i;
 
@@ -1499,18 +1506,13 @@ static void __meminit free_pte_table(pte_t *pte_start, pmd_t *pmd)
 			return;
 	}
 
-	pagetable_dtor(ptdesc);
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		pagetable_free(ptdesc);
+	free_pgtable_page(page);
 	pmd_clear(pmd);
 }
 
-static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud, bool is_vmemmap)
+static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud)
 {
 	struct page *page = pud_page(*pud);
-	struct ptdesc *ptdesc = page_ptdesc(page);
 	pmd_t *pmd;
 	int i;
 
@@ -1520,12 +1522,7 @@ static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud, bool is_vmemm
 			return;
 	}
 
-	if (!is_vmemmap)
-		pagetable_dtor(ptdesc);
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		pagetable_free(ptdesc);
+	free_pgtable_page(page);
 	pud_clear(pud);
 }
 
@@ -1645,7 +1642,7 @@ static void __meminit remove_pud_mapping(pud_t *pud_base, unsigned long addr, un
 		remove_pmd_mapping(pmd_base, addr, next, is_vmemmap, altmap);
 
 		if (pgtable_l4_enabled)
-			free_pmd_table(pmd_base, pudp, is_vmemmap);
+			free_pmd_table(pmd_base, pudp);
 	}
 }
 
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
