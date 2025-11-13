Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E81CD4F3A
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPs12+vRGGkMTJVzTT7jyiFgVZ2Ilxbd8aAX7vbdrUg=; b=4A6YzNNP2ht4bR
	7eHpkfj0H+BU+0aC+PbL0OZ7SBcdEfSexOWiLQFxdWga/qS/6GYWE5QQRHD6k4xYi8nbuDScLaTdU
	yLy3RhmrTciEPtVOqVtlMlx33XnbogsZki9z/hGPZjrfwxBRnYadcUDaAZqt54cF+MsWgTRFFFIzn
	20cOVXKnXTAh0B4S90RXkW05tjpuT0PDonFiPtLYeA844sUh0L0yfeiibX8t8sSZ5815C7vea1YjN
	a3Joooc0WOR1WMIJaS/zL+KPdLayLAizIqAn9Slgzs72/0riF8uTb7gUu1WqZ/BhCSCCxaVpQq7YS
	HI0eU8juWZfTKoFS/meQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQX-00000009jiD-3ILR;
	Thu, 13 Nov 2025 01:47:09 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQT-00000009jg1-42HR
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 01:47:07 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-298144fb9bcso2808195ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998425; x=1763603225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sKtwP//OgsTzC5xxNl/Xd6UYX/1wT9VConzzoLFoks=;
        b=bNzmvSwOpiwB51nqOZbR6Hd6UGVxJXIyitjJcO7+Nj3dvsZwqcUvpEYCJoFyS6AzeQ
         i3l5Um+7GxpzP4T7gGV67SYbTnDJoU4KtCmR1KT89DJT1EP4jqgFijeOO/Nw2203oH6J
         +FoseZ9NUDJlXmvJ35FqrGopkvwryqbOimupJtd2DPKfNlonlyUTv0U8y8j+55tx0Ft4
         QO8riiyxgHa+kvy3AR03KC7nBQrG0kmuV4l/4fcPQV3jL5X7zyQdVa7EHiXaDOOAhyF1
         TP3DR3hi4pul2swcawZRWKBpjEhTrA2BcZGDAj03exYxpgJJD6/n/B1DeboS82qZAQ1H
         kC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998425; x=1763603225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7sKtwP//OgsTzC5xxNl/Xd6UYX/1wT9VConzzoLFoks=;
        b=VMs46mugvc75aRzb7/emULCSJSD8Gi03JFYrGG7KUHC/UYipcB2HUB/R5/c9X/8OzW
         UCkJcsqbJyMYgJZ1gt9hGcECynrrRiWQe19c4KeFXPzrKFYpjJAMpBZJDLEKXkcI4R6F
         Q5jUYHnj0ZOg9bK+DRhcFjW/VhGw9FZgvZkBLbrpQO8JV+H7pv55n2SDKKjjFX1WMGEL
         rzEwkcK5r/FaQsjGyf4yV2rM1p9goEJYWS2dp6CksqVT0BeVZEsCRcZz4grAXZv6UU9B
         x3y+orTM9NZeT56QiNigs6q+lFj5G0uLmQhRb1eG98QJEIfZDtodbTH+2O4ROEMC+ZX9
         20Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXuomWcftnwbf8rMGvbpBkY7JiDxs4PtQHcMjC3/UOjt2FoQpzayA4tTrMtbuMacwUJ8gqSkNHy4q4hNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1i+xjVabfmWOfs6CEKodFJLuOobOwTmL4yVPRMEtf2RJjgfGk
	4NdqyIBzEb3/UB8ojE+q/vlFlUw9SkyppKgkWhWefLTJ+jjRJzxDffprD3XSCRren4E=
X-Gm-Gg: ASbGncsbJjK2olPbgBIMeIX1fCbF203OiK4+iu7fxIzBFhGc6awVZCCLKKXTADkiLuG
	W+SjFCTx+AESO5GEtzaN0WYv3i4tPLQS0ZQbgHX1PgX/zQ+JW9/Erz4pvBXJoWqf34+uOLcv6Uz
	bsnKh7WEQL4qwd2YPRQZT3xQZEbOLRmw640PaOsM/c+vLSA2OBBfUO4OuWwAH8W1kYffz9q3/TG
	wNAjKFCCvAgX+EngNJh7urCcRjs21PFBMErpupLhTrX+JDU2SVjrZhF5MSlJkGKDpmtXDgtny4H
	JDr8DLFxMEhfdoWgKICz7zwUbxeGPBbwrtQpOgWxe/Jz8Y7+KltpVFH38Z2MmiNXqKzJIyehB/C
	yxiamJWMT7YAw1hQbTAA+Ytlm13B5expsSsEspdyuqZyTQ4IjuNfxbGwbSOpB9DLVK15a+aAkWv
	fj9IRYYzGUZ42grbUO+x/9aw==
X-Google-Smtp-Source: AGHT+IFyAjw4zT369i2V/HQmfngUMRA4j/oLD3IR8XNvQ6Htb0EplxsCGv5RKISA4ePCqfHnQtITTg==
X-Received: by 2002:a17:902:e788:b0:297:d4c4:4d99 with SMTP id d9443c01a7336-2984ed30d02mr63149505ad.6.1762998425114;
        Wed, 12 Nov 2025 17:47:05 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:04 -0800 (PST)
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
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-perf-users@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 04/22] perf/events: replace READ_ONCE() with standard page table accessors
Date: Wed, 12 Nov 2025 17:45:17 -0800
Message-ID: <20251113014656.2605447-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_174706_015466_E82E1758 
X-CRM114-Status: GOOD (  13.11  )
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

From: Anshuman Khandual <anshuman.khandual@arm.com>

Replace READ_ONCE() with standard page table accessors i.e pxdp_get() which
anyways default into READ_ONCE() in cases where platform does not override.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Link: https://lore.kernel.org/r/20251006042622.1743675-1-anshuman.khandual@arm.com/
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Replace my patch with Anshuman Khandual's patch from LKML

Changes in v2:
 - New patch for v2

 kernel/events/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 1fd347da9026..fa4f9165bd94 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -8122,7 +8122,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
 	pte_t *ptep, pte;
 
 	pgdp = pgd_offset(mm, addr);
-	pgd = READ_ONCE(*pgdp);
+	pgd = pgdp_get(pgdp);
 	if (pgd_none(pgd))
 		return 0;
 
@@ -8130,7 +8130,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
 		return pgd_leaf_size(pgd);
 
 	p4dp = p4d_offset_lockless(pgdp, pgd, addr);
-	p4d = READ_ONCE(*p4dp);
+	p4d = p4dp_get(p4dp);
 	if (!p4d_present(p4d))
 		return 0;
 
@@ -8138,7 +8138,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
 		return p4d_leaf_size(p4d);
 
 	pudp = pud_offset_lockless(p4dp, p4d, addr);
-	pud = READ_ONCE(*pudp);
+	pud = pudp_get(pudp);
 	if (!pud_present(pud))
 		return 0;
 
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
