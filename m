Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCBBCA6004
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 11:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BOZzxBv/Jso0vtepTzmCw/ZaP/evoiHCWbVWnB65QPs=; b=wOsKfU/qWlp30N
	2/goYJyHzPQ9waR+5xhgfb4JmxSiExCVyRrL7trgQCRfKIsjejzaqfIYvGf6pMfqySQAWDMCdlFjj
	ybFJda4voqN96buwK4Luoml7pFjjGZw6iHbqNQBTvaUmOGcwrpmQ+8g3ul1UJhl6By1crXHOYznSp
	5HsC11oXtQY1U5fDnwq7Jbs7mKZn29NB2ZpoAD/eQU/QKcXK3vLrgl9z4AGKufOMESLBKior7QHGW
	nTm1uEHPvqXAHwxwqxbc9LJpFxsjMNqfkT908m2WIV7UVEzqBrp1KPSjqBkVPFOB7RncdAJITDFxG
	GyNVWTfa9hf8IpKz2EdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVDZ-00000007upa-1yn5;
	Sat, 10 Oct 2026 11:26:21 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVDU-00000007ulg-2hQS
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 11:26:17 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso289989a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 10 Oct 2026 04:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791631576; x=1792236376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKSY00uXgysUXVkY7SlpnwG5DQxZo+OZZK+2IbfOVaE=;
        b=N5guzU/jZRXgGcMkP/zd0kT9mhWm6Y8icLuZ60ZOFvsi7luT6o+ewDWKW8Zh5vr5kz
         R6SvS9AHrDuOEQiJ8xHJlMwyNR67P+XmgJW2BrZ/FJDXyVLug9DY5y58AaBCpFPMvPLW
         SiIBUeMEYJ5wmkqqfUnbcafB2f8ZS2oKdnJga/FcJ2OOVspPNW4SAWJBlPzye0t7DXqc
         19uLUXxs9MnGKkxqG4TDbB+pa5fV/p0Rwg91+cwzlskzpY+0B7jQQGR/V27UXiVHv7vK
         pZAVuE7cpcJaPyQUA0NKH8+FVqk339mlmLU7zKvPLrjwn+eAt8L8K/ySWWNC/AJvoN44
         niYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631576; x=1792236376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DKSY00uXgysUXVkY7SlpnwG5DQxZo+OZZK+2IbfOVaE=;
        b=Y7iVwS/sUYPg5InHGsdXaQuxqzwmdp+/3Te3sIWZ/MfO9FRZ6CHo9ZJ0qwqwBkUSBC
         r3yWMajx2f2J6qEjWIprgeuOINkB0EVlUf6yfrHhzhRy0Fk87fPxpWoDb86uvg92qBzE
         /s/Nkae8ILqX4/Jn+qYF5V+ee2qTGx9woMjhB302kqQNm1vmTGeo6O7JjQsCDLx1jYWE
         l6XMuMZaET30Wj2S9vFhoSNVZd6lHqsf0MAeNKxRChIcbQl+1MQ5fqlp6minXiju48SI
         xvUKbaVex/awjoHC5THQnUoJiPmQrCGB3X/254+cpU/zjHur5j0BneG4/5P4dBvePvfS
         pkrA==
X-Forwarded-Encrypted: i=1; AKwUvBy0NdxA7CYyPCXKwb0orzpT2dD/rHc9mUhIIoiymazdiN6eE3UWzzmLEGz0BlxFZ1MIB7n9kb3H3/scJw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLij3OG9qoQac9D6aaHstNN+OevDkcRFmxJjnh/blH7wIpTqk37
	QeuxYAGJgHNUjnti7zXm2TC8mUfV0M8ORctVdv5Cn534Zlt+I1/BpvkLjp106VYM7L0=
X-Gm-Gg: AYBFou0PRfL4X5coz/ngdz4oqNc3/YgFzEH1gUhZsFX27grySQ47eA0T7DflqfuqTNJ
	geLDcM3/UgbhHCUG423wVD2KnuEVx/ZS3ZHYOnyBZoqzgRVfbNmKY1Oh9XyDJK6m87X1DLdKfyP
	Y0nnNkB5CwLaGp6zYfJgw4ufnfgl/1MXfIGEmNBLU0WqLtLox2KSqs9D1aABD6f5V6U4L7iC1iO
	TVSiufccmo9wEN3V4P0uHFSfiv3CrAQwhQoxl7Ai0VBcnoGniRIuGp/cPEtDd6pdH4vhghNTjQ5
	+aXThdQwEWRMk+u3rnhjorw0GztRsVt/iNznm6enQDhIeHhFhTLfwjLk4t4a9hBdtGQrzn+53T5
	/ka/c16GMPywZZjo8Fl+6UTyfpNAlGquCR3qU8aAbeJeEQCemEVm17g7enOLG5JxRgY5vUYAWdT
	CPAq8FZSwcD3sGc9RMeKf1geGJkHGxYZPewUKiBOQFc2dW0FkgDu2uiu2Hhae4mbCW2rlv3hTFj
	b7uXlxGrlRfsLZwuBISlCcCExdNakxqDjc88g==
X-Received: by 2002:a17:90b:1dc1:b0:3a8:96cb:fe8 with SMTP id 98e67ed59e1d1-3ab3a2fe583mr3989437a91.9.1791631575680;
        Sat, 10 Oct 2026 04:26:15 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm7900233a91.0.2026.10.10.04.26.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 04:26:15 -0700 (PDT)
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
Subject: [PATCH v2 3/4] riscv/mm: fix missing destructor for hotplug PUD tables
Date: Sat, 10 Oct 2026 19:24:56 +0800
Message-ID: <20261010112457.49485-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010112457.49485-1-songmuchun@bytedance.com>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_042616_685452_3BED8216 
X-CRM114-Status: GOOD (  10.36  )
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

Commit 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special kernel
pgtable alloc") made alloc_pud_late() run the PUD page-table constructor.
However, free_pud_table() still frees non-reserved PUD tables directly
without decrementing NR_PAGETABLE.

Free PUD tables through the common free_pgtable_page() helper so that
constructor-backed tables run the matching destructor before being
freed.

Fixes: 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special kernel pgtable alloc")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v2:
- Collect Acked-by from David Hildenbrand
---
 arch/riscv/mm/init.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 151eb197cb09..4914864cb350 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1538,10 +1538,7 @@ static void __meminit free_pud_table(pud_t *pud_start, p4d_t *p4d)
 			return;
 	}
 
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		__free_pages(page, 0);
+	free_pgtable_page(page);
 	p4d_clear(p4d);
 }
 
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
