Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3F6C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Feb 2022 13:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fe02P35DbdCPUn9REHwiAthHOefUmjz9ur3EW1RZq/Q=; b=RFZFzjs3h0iZe/
	Keia5SWo3zV7Qnm6rLRnrZmY+l+xf3bPsR3g51YnDrBE58ds9ytr+4AZ0fixbdHLsO3moe7GlXmH1
	jxuD8hCZGdlEQgaCbTwY/ruX58Kcy8GY8TLYgtrkC6y4mDOd+ffPF8Hvh3qEzcjh0nqKV/P9dX/yj
	GG8FU4zZ35zDV6psP/9zsl2eaXwSdUviX0cA6Dk/N+b/2M0FA3lPJZh/mb7W+WF8SnWPBOK1J+qrz
	jcZkcsDdmqVtMex+a2g/S6efaw8NIGDgmxW4O+K98ukEF2B9AYPh1TGGS29Q4XIJJxaVqEppOgJ1a
	er3ODXQ7p83jT6bteWHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3aT-00EgyN-0O; Fri, 18 Feb 2022 13:46:17 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL3SD-00EdPR-2B
 for linux-riscv@lists.infradead.org; Fri, 18 Feb 2022 13:37:47 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9C7E64001E
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 13:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645191463;
 bh=5wR2inrb50SGryPV3ql5qm7RIRt9i7gNq/sby+Clcps=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=qZuo+9Csuk+9lm4KjCfI9sOW1y/+M6zZS6c2K7eLmCTFmq7gOMj4jzO1lD+pclrtQ
 7RF8NbzT9DWNJbOzZI1lFfv3hfRWMheQyQXkuXXBrnblME10x1269GVi5H8N5Xx6BY
 cHR31WadHXSYtlqZZBKcQQsStuOO+aqTk/dOERY48V5RNU5U2DvaNKkYu0b5R/tHYD
 xhZ63bm9Kxz8uGlrq26o33GPw30N0oNRmJ12BegPlzmOqCTWveCGeb+b9iPTbs3d6r
 v/oSTcD9BYTSWccymiWo8KPHqeUo+5SIo4EMBHR6lwpDCzvoAG79RnT+gRBNKVV8HC
 y8PJPCvADzAwQ==
Received: by mail-wm1-f70.google.com with SMTP id
 i188-20020a1c3bc5000000b0037bb9f6feeeso5941106wma.5
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 05:37:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5wR2inrb50SGryPV3ql5qm7RIRt9i7gNq/sby+Clcps=;
 b=SmBkBXXG0VqxNVZgPeO79pTwByaiLO1qslHMAw4B8UKQQO0SdJRJJ84FzO1cFwZOe4
 //tzKZ4llktdC/d3Js3iBCiszXvuwOVWjewA8obMUix6BhOUQymzYa2gLB12P3aSUwFQ
 cLXVP1YWQ9b/HPZgfmZeXGYKgRVL1CpMSMISawgIyNXtp2IL9rPQ6whud+dnX3Pq42xQ
 oC/m9ghK7P9VJtuVOggAUkxGOuyZxrVFR1WxdvwBKW1ro906/s/nF54liwfqqlDE3Plo
 RtE3T2uhjnkNzf4TIeA5JW3L4hXR+e8Dvk6q9kbtXqrYP7Zhu0f0hOmYKbkmoy9G/yTl
 Tbyg==
X-Gm-Message-State: AOAM532oLHOIzMb8/fGPOP2FU4NEhkuLlB2dZyuGeskgXRYTL0yxDXs5
 CqEpqU00mVRDTkVfyvVctAUO0nowAgYGEP8vy6oSOafOemul5jk29LgY/ujQhUsO05gvS6S5Iv3
 aWyt7WOUrvoxGvwxZKTGmrn/ABRQWApEA58z+HC1nntcbIA==
X-Received: by 2002:a1c:7715:0:b0:37b:dc94:9eb4 with SMTP id
 t21-20020a1c7715000000b0037bdc949eb4mr7292829wmi.61.1645191463168; 
 Fri, 18 Feb 2022 05:37:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1rOcJLLe1sMpbmzJaKzZ9MrfRNf1PgF+TEXDfRIfQBwQQMxq9mXwaThHJyZuyQwyiE6VwOg==
X-Received: by 2002:a1c:7715:0:b0:37b:dc94:9eb4 with SMTP id
 t21-20020a1c7715000000b0037bdc949eb4mr7292811wmi.61.1645191463026; 
 Fri, 18 Feb 2022 05:37:43 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1])
 by smtp.gmail.com with ESMTPSA id h21sm4886378wmq.26.2022.02.18.05.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 05:37:42 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Aleksandr Nogikh <nogikh@google.com>, Nick Hu <nickhu@andestech.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: [PATCH -fixes 2/4] riscv: Fix config KASAN && SPARSEMEM &&
 !SPARSE_VMEMMAP
Date: Fri, 18 Feb 2022 14:35:11 +0100
Message-Id: <20220218133513.1762929-3-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220218133513.1762929-1-alexandre.ghiti@canonical.com>
References: <20220218133513.1762929-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_053745_280043_291D788E 
X-CRM114-Status: GOOD (  12.21  )
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

In order to get the pfn of a struct page* when sparsemem is enabled
without vmemmap, the mem_section structures need to be initialized which
happens in sparse_init.

But kasan_early_init calls pfn_to_page way before sparse_init is called,
which then tries to dereference a null mem_section pointer.

Fix this by removing the usage of this function in kasan_early_init.

Fixes: 8ad8b72721d0 ("riscv: Add KASAN support")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/mm/kasan_init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index f61f7ca6fe0f..85e849318389 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -202,8 +202,7 @@ asmlinkage void __init kasan_early_init(void)
 
 	for (i = 0; i < PTRS_PER_PTE; ++i)
 		set_pte(kasan_early_shadow_pte + i,
-			mk_pte(virt_to_page(kasan_early_shadow_page),
-			       PAGE_KERNEL));
+			pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL));
 
 	for (i = 0; i < PTRS_PER_PMD; ++i)
 		set_pmd(kasan_early_shadow_pmd + i,
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
