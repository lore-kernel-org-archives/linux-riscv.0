Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9D8CD4F43
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hu4J13vmpYR83Si/4Q/qdw5ioQ1z6YMtbx9Gjh32X48=; b=tKiBJ+0hYmqko/
	qi+bc3TDArsOw7CYV6HTi9t4QCsl+d6cwO5i3i4AvoetbOrqAGnjDrQOnhARFiIuu6T4tRjE3McF/
	WnFKEm1e3q1yQ+c8cqYov6QsFI7+ZWkbi8Lv1FKb0bmrNRE9tGcUbCCGzVCNYhu1495/uNu0nHAp3
	gJgZLI5wUomsizipEh7JsT0WmAtZ/uFVTTX2Pf22s3Lr5E5kpJxBdUYAFrOG4M+JUXazFe5jymAp8
	Rx0GB2dtuZu/CT8uV7B4IjtRDYX4sXd81qbCXAjikjyYqZRUVcrUJm3LeacrSxQMLATZCgmFsFlgv
	OQfwDKkNqnhN6tWxvPbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQj-00000009jqp-1dsE;
	Thu, 13 Nov 2025 01:47:21 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQg-00000009jnS-0a6K
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 01:47:19 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso166812a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998437; x=1763603237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4yUqe5I7KDh5tDtHE97viYfWgw9C/nYwzFH0pWC45k=;
        b=miRrZTsNvqOECEw3LU17dWFNfyGO3Cqz3spU/QEemBZ871hWi/MiW7XbdCvvjGtHJe
         TG3jWz5/Yt1hJsfYhRAPXFvsmsxrjjzPsG25z4kS2JKT0dFWovdM0pF4EFtp63uPVfRD
         iNkkIWrHlWhRFsJb/EounyymrE4Xyi07sfaOu0adt63RuGYuLGvfq5HUk7pI/XVV50C5
         TBJtqP7GbsS3Z0i3hZDKKOAsHwBD8rWz+pLH22B8PH3sQEFWYU9CkFPh2cXxKjyxoL45
         L7e64Dd5DaGHiR/p0s0k8xlzGQ6E5pygStZ97zaJ/xXyNMrzWSk4AkTvsfh8aB8ZyCUa
         /CjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998437; x=1763603237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O4yUqe5I7KDh5tDtHE97viYfWgw9C/nYwzFH0pWC45k=;
        b=L2YLUgTgPeDMXZv2wrqhlpiOXvfbCtAH/0YKcOE3o0RMRVdKj0v4MdViveGIU9WHYi
         YWdMPwV3jNrrwV16J+shAeTy7+aqkGJUV/5i1XkvBpRJMB8aH76W/Vv7jFxpxX1nYepN
         hmO2scDhG6rAIZFFrQKLsQBR9f0BptEdUVIzZ0WY69hiGN8sp8eOxS/vfm4LCT4w8oRq
         JW9qL0rCegM0aC+OqqPMN4HgWevfZrFdOqKoZovxnVucCfLwmH5vcRzsgpZ1mLqmgEdC
         5C6vCCrd/ttyF0czgqjx0RIv5Dwhjh6PTZKUFi17GbhgGevTjShnjqgDUjjfsLiq1CgS
         QWFg==
X-Forwarded-Encrypted: i=1; AJvYcCWEQOwnmiNNRuW+Cjl9xC3PYTNpiw8Pnopo+wwZwqBwp8GuVJHxXQhRXJKetjnsB6NJdRwpboXz82XLgw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx+d7R/O7S9S52s+tWdwVqLNsW4aow36e1tjVLalD6nqIfvo+6
	whX8Fz51EugJxXo03JD6MBGzxI2jdQrFLKvqi0wUcpzO+ae7gP0HqgnFgb8BuACYgGM=
X-Gm-Gg: ASbGncsbWNXXrxeZ8Xum9YlbiYQbSbILhizJhXWKn//T5rBBChwz+UVXKnQXf8vqspv
	jwXRoz5QxVmawPLDX0dNjczR09BjkOxP/xK4uky73ik/ZDDPAAIdnt1X74V215focUha3aceJCy
	BjAExSalrtU4cn1rR6phrIbesRF/vrzbwbRwkhzoUWZjmHrnTKry5eot9I/ztMZAr2OBYEfEz/t
	TbCsjCnmfGiJowV34cRay5jlFyZQPcsfqllZz7XN6zQWKC8NMRx0G3rIkQV3bjtlxUUh3e0NVM4
	p0UP9zLxTi9CXGqUfIQdXVGY9OyRmCjqQbcM8fpcLnz8/zZZgvyPeqOBFl9iXjcoJL75234/YDx
	rhGylgvzox5goHhU/SQlmw4htciD1bW1PMRnYHtqZpgx18q9hrjNRltVzx/cPECgyhUv2TqUuhI
	sZRjDazHKzVXKeKPizBoS0JA==
X-Google-Smtp-Source: AGHT+IEA5LZxSWMzNWQDrd0LMkvyoxWg+oEw41rcCZaseACh+qy8KkMElZZ7w0AL6ikNL4f+5tupBA==
X-Received: by 2002:a17:902:da4b:b0:297:c0f0:42b3 with SMTP id d9443c01a7336-2984ed4b960mr68446245ad.25.1762998437335;
        Wed, 12 Nov 2025 17:47:17 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:17 -0800 (PST)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 12/22] riscv: mm: Deduplicate _PAGE_CHG_MASK definition
Date: Wed, 12 Nov 2025 17:45:25 -0800
Message-ID: <20251113014656.2605447-13-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_174718_196245_409DB1A5 
X-CRM114-Status: GOOD (  10.28  )
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

The two existing definitions are equivalent because _PAGE_MTMASK is
defined as 0 on riscv32.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/include/asm/pgtable-32.h | 5 -----
 arch/riscv/include/asm/pgtable-64.h | 7 -------
 arch/riscv/include/asm/pgtable.h    | 6 ++++++
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
index 00f3369570a8..fa6c87015c48 100644
--- a/arch/riscv/include/asm/pgtable-32.h
+++ b/arch/riscv/include/asm/pgtable-32.h
@@ -28,11 +28,6 @@
 #define _PAGE_IO		0
 #define _PAGE_MTMASK		0
 
-/* Set of bits to preserve across pte_modify() */
-#define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |	\
-					  _PAGE_WRITE | _PAGE_EXEC |	\
-					  _PAGE_USER | _PAGE_GLOBAL))
-
 static const __maybe_unused int pgtable_l4_enabled;
 static const __maybe_unused int pgtable_l5_enabled;
 
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 5532f8515450..093f0f41fd23 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -66,7 +66,6 @@ typedef struct {
 
 #define pmd_val(x)      ((x).pmd)
 #define __pmd(x)        ((pmd_t) { (x) })
-
 #define PTRS_PER_PMD    (PAGE_SIZE / sizeof(pmd_t))
 
 #define MAX_POSSIBLE_PHYSMEM_BITS 56
@@ -168,12 +167,6 @@ static inline u64 riscv_page_io(void)
 #define _PAGE_IO		riscv_page_io()
 #define _PAGE_MTMASK		riscv_page_mtmask()
 
-/* Set of bits to preserve across pte_modify() */
-#define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |	\
-					  _PAGE_WRITE | _PAGE_EXEC |	\
-					  _PAGE_USER | _PAGE_GLOBAL |	\
-					  _PAGE_MTMASK))
-
 static inline int pud_present(pud_t pud)
 {
 	return (pud_val(pud) & _PAGE_PRESENT);
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index acfd48f92010..ba2fb1d475a3 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -207,6 +207,12 @@ extern struct pt_alloc_ops pt_ops __meminitdata;
 #define _PAGE_IOREMAP	((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_IO)
 #define PAGE_KERNEL_IO		__pgprot(_PAGE_IOREMAP)
 
+/* Set of bits to preserve across pte_modify() */
+#define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |	\
+					  _PAGE_WRITE | _PAGE_EXEC |	\
+					  _PAGE_USER | _PAGE_GLOBAL |	\
+					  _PAGE_MTMASK))
+
 extern pgd_t swapper_pg_dir[];
 extern pgd_t trampoline_pg_dir[];
 extern pgd_t early_pg_dir[];
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
