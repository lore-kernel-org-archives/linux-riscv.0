Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32875C021B2
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 03:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22Pq3mtayNx2OiQBGxwZDCQBPc9tQ79o8QVk2eEKhiI=; b=tFkQc2yrOCxqaa
	u/+VEiFOw7YfH4cqNEKKUHJj9rFoDKnei4m9BzI6mx+kmhjPhD6mfoLjnox+c3ylaeTiCJUdj9fm7
	LE/Hg+F9FON8omdxe1JHCaZfQZ5yDDsgc/SIhbmnUyksIzrXumf55vihxmk+HFonMf7IHiOK/Fj5Q
	PR9it9FWPNOBGoP+4/BGTbeYZsx25FHt3e2fyULNn5mIng2vewbP2tw5FHN0zZ0G+D7opCB419/1b
	UDl4V/P0xbhWYp7EnPzrqNZVW3/XUBR5uoPTZDc/8h5ZvdOKTlVrjzndlSBRmsbedNFccYukaLuo5
	NYm3fPMCmw2gfYSlp0vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmltw-0000000FtQU-3Xkj;
	Tue, 25 Feb 2025 03:46:32 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmltt-0000000FtNP-2ykI
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 03:46:30 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-220e989edb6so139802045ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 19:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455189; x=1741059989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0Ocxe5/W3x8AaSNUp1nmQA6Ns9xuyK5JD/uD9z0OJg=;
        b=Meeg67WWgsTYxId/dV0z+bFKgOuH5m59vap9//IP9UPVHXbSKkNJZMk6h2j+OsqAoQ
         sd0pezCI5LCpnHkQQ846Gq61vMwvpUX0wCxQ7CmKum6FQI/Kh/Luxy4Zm71xf9/5QeDr
         ALSIFxVt8XaFxdSrPXbxAsT03DbM5oday/XsHPm5rvJEKvZCoryuBpIg3iVGvyv7QgIW
         BKkBdce5xKXJlEj/Rliy0Gav/Hro0ISpasnQ9KOpeNzH2KhLBVfi1T+FX1J5Aly6jZ80
         tE4v53NLg0UApqNrU14DNiEu5O+blR+/hlfZhXQFjugFWLIh+viOUDqHmHPPadPJrIyG
         Z1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455189; x=1741059989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0Ocxe5/W3x8AaSNUp1nmQA6Ns9xuyK5JD/uD9z0OJg=;
        b=HS6cd9dDkNvkE4Y7Z93zlFbaup+L6tmLK8BCvw1EGTJKIrB97nFy8hOy/mrgQbfLCV
         YOVp5ftoud4HiztqD9rOLN2Y3LJHf8t3VwCWSOY3h2CNEKVGfpcj5Tl37OwLFxT4X5ZD
         Mr0Ju0gCGF2byDyZym/Nd6qiu7TQID4973I2S/wmvhw+t2Sl4wpIKwLKkv8ArZmqTtdY
         e5TJztGDSUSxFYdFul9xJEgI3Dr2R5hEBikKFPXUwKS6xktaolIer1TPK2owkZtq0msg
         tliNc4fBTeaI3+AAOPJFNhO/BF294nhsdYLTEZPHWLwL566ACi13eiypigtDfTQF+iON
         q8Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWL8kgHw7nBYN6vWVJAsu33K0zm6FSXT9b6Xj0VF7IGjcSjwH3VuLhHszsAh9bsk74/kXajnVsrpSpVXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKP44XF3flaxFCu+Nh/uI8zUPe0RfROUjcwfh1kxJBsuka6rkN
	vQDaoktrkFIpN+4HFyIntwtyNOFKSEvGvOAigTdJ4aGdtzIijRzer8m2HqZ1ol4=
X-Gm-Gg: ASbGncutk3DAXA1uXd2P3e/yILS0auOzxjOA/LdP6fQzZZzjOObGWkMvZcwg90ObAsZ
	pTbBI5/PPxxuZsfCh73i1XZyKHrWT/wotdBLa9IZH8tWeIGY6InUdzobrFzWWqvw7UQDz23UR2k
	+dgf2Drmm+FLqtdY1i+Mx+b51m+XCebHb5ozctA066LBk7IrKPfVJLiaEvTfE1n4+LHVQB37DTS
	JjxZ4KRWmCUfIKzCrLDxE3YhfDHbpOjoLcT/4D1+ZQI0u8RH+KEshoWjgBkKI0rKKnyaAA2G+ul
	Q6TII8Jc32+Ae8UZE2GS+4vsj5maX1gbvnZEUBH4JamwI/3XhjioUq4AafamUIEEQg==
X-Google-Smtp-Source: AGHT+IGBfXw23ytiI6FvQDqnu6HA+6X81xKlY5Cdi/AJkyrR2YGvsG8wye6vZ+K3tNu1qHLJYKOiEg==
X-Received: by 2002:a05:6a00:22c9:b0:731:771:38f2 with SMTP id d2e1a72fcca58-734790de607mr3427312b3a.8.1740455188892;
        Mon, 24 Feb 2025 19:46:28 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:46:28 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	kevin.brodsky@arm.com,
	riel@surriel.com,
	vishal.moola@gmail.com,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	willy@infradead.org,
	yuzhao@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 1/6] mm: pgtable: make generic tlb_remove_table() use struct ptdesc
Date: Tue, 25 Feb 2025 11:45:51 +0800
Message-Id: <5be8c3ab7bd68510bf0db4cf84010f4dfe372917.1740454179.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1740454179.git.zhengqi.arch@bytedance.com>
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_194629_761373_339BA599 
X-CRM114-Status: GOOD (  11.98  )
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

Now only arm will call tlb_remove_ptdesc()/tlb_remove_table() when
CONFIG_MMU_GATHER_TABLE_FREE is disabled. In this case, the type of the
table parameter is actually struct ptdesc * instead of struct page *.

Since struct ptdesc still overlaps with struct page and has not been
separated from it, forcing the table parameter to struct page * will not
cause any problems at this time. But this is definitely incorrect and
needs to be fixed. So just like the generic __tlb_remove_table(), let
generic tlb_remove_table() use struct ptdesc by default when
CONFIG_MMU_GATHER_TABLE_FREE is disabled.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/asm-generic/tlb.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index b35b36fa7aabf..54f579750c8e5 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -232,10 +232,10 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page);
  */
 static inline void tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
-	struct page *page = (struct page *)table;
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
 
-	pagetable_dtor(page_ptdesc(page));
-	tlb_remove_page(tlb, page);
+	pagetable_dtor(ptdesc);
+	tlb_remove_page(tlb, ptdesc_page(ptdesc));
 }
 #endif /* CONFIG_MMU_GATHER_TABLE_FREE */
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
