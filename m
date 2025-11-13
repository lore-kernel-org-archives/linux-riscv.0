Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA53CD4F3E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TxbXti9ZRg9MBz6hX82yvt5zSMxQEtcN4O2936hudOY=; b=ftDPvo/ioYspva
	nEPPgP3B8ZLWghiY7Wv6XYFLigSHjAuipD6UxlKsNzTaiSHvCuYrzOgRQFvNlrhxdTzMsshWaXijB
	8kjAlTxPAbWiePbjfXC1/yFphSvvlqYdLtzGDUVQfHfrk6/t7nRm739DBE8JiDWmU9cG3e4sQx1a1
	MT3S4DrJujFpdYcv44qzRobLVf7qKeP2mFEtRd5uCBxKtS7pRg1Dd7CZC0t2oAX0Y48ZbTrFu1cIq
	dAStfMx593rdnRfqgaiyeZ8dOi+YYU9DdyZHS8/pKtjGmN4gvwkggu4WtOkXAoHmEp21V7QKc+W0r
	In71s76RK+AvZjAWkOyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQc-00000009jk7-0M6u;
	Thu, 13 Nov 2025 01:47:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQa-00000009jjH-04xk
	for linux-riscv@bombadil.infradead.org;
	Thu, 13 Nov 2025 01:47:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VLUmTi++1HGkiLtqpPoIfkvNz5bT2yFaPhtAlSBbrkg=; b=Vm2+vohXYyqiQlSDkOOyo/wmQn
	lke5KNbTVd5jVL2k3sb0H5BK1m/hfN+p9XONjNjo3FSVkas2+rVwNQnfBd5GW3Jh/xD5ME+kn3y0M
	IkzhAwKxZvSvCPfiy2fZNdrS5uXN48ihDQf7cThVsEMtjGi33sQZGIi10w8m9QP1elZyeoVf3eVUm
	/XqPZqLu3pDQ3YFtYpNcF5ps3aLUYEKtei6WBld3NbqWoueSCRRzt4ANZSzirHEPsI1tsgCQkrkIh
	jkwD/exmmItDclr0el3V6yoFMVjhdBlg66GNWAd5uvFBrCzd1VbmZ3gJdguxbBS3Rw0w+PbMD+7uz
	e3vKeMDA==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJLYr-0000000Gmqk-2YKK
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 00:51:43 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-29812589890so3178175ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998427; x=1763603227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLUmTi++1HGkiLtqpPoIfkvNz5bT2yFaPhtAlSBbrkg=;
        b=VzFiEA+D0RwX4JIljqRXRHEDvhgYMtwchq96WAPh5Uk4fuVHjj5l4ezvweC6H3Q0kN
         N++tV1u6z47/eY2sVUVLb7st3eNZfHVyolV7eBO6yZCXsbt8CRMKgbFYAWprbfAjAytK
         JBcEaT9GXrDVdwB8/3od7e8UMoXhcumHWz6QKGdRdBzm/p1wPKWnl2zH6f0cBYyXVehZ
         LQoDckIKkjBXTOMVi/NcTk6HF73CYTLJ0vNOxTfF95VlgCsfFAB1YitWso/YuqRHfzEQ
         faDdVa8hoWLd1wfa5lHJStj8/OCEkJuIZO8oTNOmMgQsOsOsHV9fRb38xAE0jgwZOCGL
         h4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998427; x=1763603227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VLUmTi++1HGkiLtqpPoIfkvNz5bT2yFaPhtAlSBbrkg=;
        b=Mc5RjKTOx692UOobWQNqKWStQw/g1UhHwNdNLs4D/3IdG6LWtRbSWysICpIX3TxYCI
         JJfj10LFzq6S7oKA4beR2gVfe4Pk9k7ewh0URl03fb+kVG3kLypurSw9hFi2MBqWogDM
         3E652K9IdJhEyPeM1C1+Ntq19YbsSo9EQi8zjW2OXVnVtm1Z8GGQMSin5/6ZBbdLwamo
         ujIkWejBTwv7RhvLAAa3N4COW5C34k+bSKutH649K+V9rIc7xGTN9zbkhU98vGy46Qc7
         BkFVpZ4pYTRAzvcuVTEx5TF8ZEB38ECkRPHe4cUIRQe0SENe+01+iCfLlj0KGodohXTu
         JWpw==
X-Forwarded-Encrypted: i=1; AJvYcCXXVdJBRfojMSi6HHE31dWDH1DGWHerU+Mv3u2KA/+lMzTSZiaE3c+qZVd9A8jxeN2OLDjMUilPqjUiOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZjAOe4QkJO1n97AWFzDXlFYo1W7kWP2y6S9ZAj0VhnuGyX1/l
	Mu6lMEYT+iyTWL0pqgueqMpQtQJpo+5viOreIX4A4AacOFmr63ly44aRuXtWo48s0Tg=
X-Gm-Gg: ASbGncswZqZECaktt8BCAJvrC9nA2zmZxZ610hmi6NttBf6inXhMLCeUlbSKYUdyKPj
	2hMEmv4AlNMdS05B/m6hH+3izZcEKrExC1tZBlJzllS4QvBRVW81oCFhZvVZFurTzf6jOSfU8iK
	2lZd5p0mzZLSShA+P22CYT7zb8O5568mZe9DqAKxPB7A9Z9Ski8pHOwMjYUm6wNsGGPRtZZRsxl
	iJs1Cwj+w7chCdZXXdX/KfNGdifUUqmtlPS619RNykH3ZzoKrTWHHUSmeJEhWV7g36OmYHLoxsN
	Zqdq2k6tfvlD7q/W26eixoXw3m1gIaeWmxRCtdsTPRY7w+XW7RzBDNadK3Y7y2CjKPH5ur62n0g
	feN0hVorc89p1hxzkx6lewiwaveTp1LSNHrMAvUoB/qZPKqFU5+71IvQgJfa+GolXKVgWVzHazw
	G3zQ3baAhmtKEwSwesdyo7HA==
X-Google-Smtp-Source: AGHT+IGHyS+mDyrQaZDGXxDAQVdZw9gnQRb0FUGE5S/L7D9yFzt8E/UzPtcwSd6KHOBX5fl5Cq42AQ==
X-Received: by 2002:a17:902:e5c3:b0:298:3545:81e2 with SMTP id d9443c01a7336-2984ed359e1mr63898395ad.22.1762998426605;
        Wed, 12 Nov 2025 17:47:06 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:06 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Cc: devicetree@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Conor Dooley <conor@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 05/22] mm: Move the fallback definitions of pXXp_get()
Date: Wed, 12 Nov 2025 17:45:18 -0800
Message-ID: <20251113014656.2605447-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_005141_905109_E12217B3 
X-CRM114-Status: GOOD (  10.69  )
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

Some platforms need to fix up the values when reading or writing page
tables. Because of this, the accessors must always be used; it is not
valid to simply dereference a pXX_t pointer.

Move these definitions up by a few lines, so they will be in scope
everywhere that currently dereferences a pXX_t pointer.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - New patch for v2

 include/linux/pgtable.h | 70 ++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 32e8457ad535..ca8c99cdc1cc 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -90,6 +90,41 @@ static inline unsigned long pud_index(unsigned long address)
 #define pgd_index(a)  (((a) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
 #endif
 
+#ifndef ptep_get
+static inline pte_t ptep_get(pte_t *ptep)
+{
+	return READ_ONCE(*ptep);
+}
+#endif
+
+#ifndef pmdp_get
+static inline pmd_t pmdp_get(pmd_t *pmdp)
+{
+	return READ_ONCE(*pmdp);
+}
+#endif
+
+#ifndef pudp_get
+static inline pud_t pudp_get(pud_t *pudp)
+{
+	return READ_ONCE(*pudp);
+}
+#endif
+
+#ifndef p4dp_get
+static inline p4d_t p4dp_get(p4d_t *p4dp)
+{
+	return READ_ONCE(*p4dp);
+}
+#endif
+
+#ifndef pgdp_get
+static inline pgd_t pgdp_get(pgd_t *pgdp)
+{
+	return READ_ONCE(*pgdp);
+}
+#endif
+
 #ifndef kernel_pte_init
 static inline void kernel_pte_init(void *addr)
 {
@@ -334,41 +369,6 @@ static inline int pudp_set_access_flags(struct vm_area_struct *vma,
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 #endif
 
-#ifndef ptep_get
-static inline pte_t ptep_get(pte_t *ptep)
-{
-	return READ_ONCE(*ptep);
-}
-#endif
-
-#ifndef pmdp_get
-static inline pmd_t pmdp_get(pmd_t *pmdp)
-{
-	return READ_ONCE(*pmdp);
-}
-#endif
-
-#ifndef pudp_get
-static inline pud_t pudp_get(pud_t *pudp)
-{
-	return READ_ONCE(*pudp);
-}
-#endif
-
-#ifndef p4dp_get
-static inline p4d_t p4dp_get(p4d_t *p4dp)
-{
-	return READ_ONCE(*p4dp);
-}
-#endif
-
-#ifndef pgdp_get
-static inline pgd_t pgdp_get(pgd_t *pgdp)
-{
-	return READ_ONCE(*pgdp);
-}
-#endif
-
 #ifndef __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
 					    unsigned long address,
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
