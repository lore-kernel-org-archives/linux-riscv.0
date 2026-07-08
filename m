Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE8EC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 17:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+fhR9bVp5Vn93mNOmDfE/W6P134EjUacm96AMA3AYUE=; b=AaRUMYTWJCNsif
	w/IxaQWAWiIeN56/JGlTt97z6Tj19MXldwZzoSDfIER/U3QjF/VeX7fMwUUl78/U3+ofRFQ9JRw1+
	x+S+yVfHKcTz623Km+scsqschLy4bCc4xgm4oCen9h9djkWnvLiGPbwjm6c0sCciN+libMBPHGn5v
	NtCOlNXfWNLCXYOSssJiksvli37crFjIXTnSsS5aPOBov8HvhX8/UA83FOCySeOIhHMQJy9Z0snni
	N0mTJTaVGbM4YJHoV44wvNt9cHRPlcUEoxfNq0rQamoqpZ7MnfiJySVJkPJCd1Ug+ujuTNoR3xbva
	XNok2AkPOBCuQdjnoxsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVjq-000000003Da-3aCv;
	Wed, 08 Jul 2026 17:07:10 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVjo-000000003CB-284z
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 17:07:09 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-848479c9bd5so682441b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jul 2026 10:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783530428; x=1784135228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdJQxJx8F3XrC1s03ROFypct+e/tcjWcDJ9Fqkn2hFc=;
        b=WGQ+ZHtN0XQLpHB+IOzxDxc5onLR0+rrE/luVGUzM/urh18wK+/7/DsIa+NDdNT+Fq
         wQqTb6wUCR8eX3yVT2PTmzu0WxwoUbVFKcQtTzCUhY3E/+AekIGGqpqlV4GVRktTATjs
         MIf6BM6tCFrRqLiBRKFtYyF05AAKw8TBq+uf+60Uxx6zF4khWjfrw8lvWLljRBEsBQuG
         HTO9CJudmqebizH5LOiSRnJWVmbHaNsOz5WXj35UTd74UHDUNEjXS4KCaLZTbmNyb1dM
         yoCS6kgPwXqaj5aN77GIvBeGq4asRJA4SiIzj2Iefs+3b5W/mswfTB0ssyY7ZswM9tMW
         aKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783530428; x=1784135228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kdJQxJx8F3XrC1s03ROFypct+e/tcjWcDJ9Fqkn2hFc=;
        b=I28aKgwXn/Jd9OyZ+ZSsyoKMMIhu8j7fHwgw+uA/tGFCfpafRAF9ZClWSgykHubOJ+
         gzkS7wIQ4BM0qjdDoeLLTm6AaBYjWWEiaP2hD+82ocb5x0E2mqtSo/lF3yS8LOjBnjvn
         4xsq4qZ2CoNPZC/Nb3X7R4uI031jPAv7mGzw6Xkdm7t2CpofEa6ZiCB0JV8W775L1QWF
         +jYq9Lry/ywnncIyaXllpJwYr0dQproIG2UXU31KAnrX/WcHcEn3e1LQDaBVzNRkpz0G
         GiUJEmDHYwFLHdq0iPiM7UVEKa9nbisChfD8TMi4QyxRMkC5qJVpWl/pUCogey9jP3HX
         GC2g==
X-Forwarded-Encrypted: i=1; AHgh+Ro6PRCMXKN9GrMoNAmqh8Be2xF6lTOcO24MC+twxP+OF8ohS0p+uE/Rr/pATs5xFsa2VmadKBASAmKD4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxccrKQDZtP5bloLnjD9KuSXop8WkC00JHNU8wQYGzHqbKJLtP/
	FXZDX9mZbfJGVWh0HLxqB6ynzRPrygrEkfhyQIoKYVOMJV07QMn79kQ1
X-Gm-Gg: AfdE7cn1Nxz4+O3Vkq37FL8uPLiz+aHcCpqc78Vl374JlUCs374XpJTV9J43htIWdwp
	xx90Lnuym1uBICfqftaDNTWmHTQs/uxuH58gvo2bKFouZCIFmzNstMf/xsE37vcTZqAa0SJxzCT
	rPo7jiycg+ot7vfbM33hUhuXTBbtEs/PXF1BIJq+CqIKeCQ+oPz+7GNLF9YnOt5BdwxkE7CI2/r
	2sCpzvY28B8DCe1UehuJv0pSoo/ODzJa3PeQKWm+uvC2New4Z2mpzUMCascyrzZLQKA84walfR4
	X2oINbhvXWTx3QJmTULRmfde85Wb1dXF2+afdc/pigkomSLH89Fp8L+gDXAEvgJBRhwTkjmJnGq
	nVElT0+bu3rgqr7oe1UGctTlLt8ShTqOktsYSG/A5h+vIXdOPG56LVnhOiWm623Om/hl6U8Pi9O
	2etmgvp4Y=
X-Received: by 2002:a05:6a00:6f08:b0:848:2f74:d8d7 with SMTP id d2e1a72fcca58-84843003eafmr2839561b3a.72.1783530427525;
        Wed, 08 Jul 2026 10:07:07 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm1119528b3a.22.2026.07.08.10.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:07:07 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: akpm@linux-foundation.org,
	David Hildenbrand <david@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 1/3] mm/early_ioremap: clarify early_ioremap_reset() semantics
Date: Thu,  9 Jul 2026 02:06:45 +0900
Message-ID: <20260708170647.362562-2-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708170647.362562-1-ekffu200098@gmail.com>
References: <20260708170647.362562-1-ekffu200098@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_100708_548354_C8A9506E 
X-CRM114-Status: GOOD (  13.28  )
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

__late_set_fixmap() and __late_clear_fixmap() are only used after
early_ioremap_reset() has been called.

arm64, riscv and powerpc all have a __set_fixmap() that works before
and after paging_init(), so they do not need to call
early_ioremap_reset() or define the macros, but they describe the same
situation in three different ways:

                 calls reset    defines the macros
        arm64    yes            yes
        riscv    no             yes
        powerpc  no             no

The existing comment is vague and allows all three. Replace it with
comments that make it clear when the reset and the macros are needed.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 mm/early_ioremap.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/mm/early_ioremap.c b/mm/early_ioremap.c
index 96c29b9dc85d..6215b90dfef3 100644
--- a/mm/early_ioremap.c
+++ b/mm/early_ioremap.c
@@ -47,15 +47,19 @@ pgprot_t __init __weak early_memremap_pgprot_adjust(resource_size_t phys_addr,
 	return prot;
 }
 
+/*
+ * Only architectures whose early_ioremap() must stop using __early_set_fixmap()
+ * after paging_init() need to call this.
+ */
 void __init early_ioremap_reset(void)
 {
 	after_paging_init = 1;
 }
 
 /*
- * Generally, ioremap() is available after paging_init() has been called.
- * Architectures wanting to allow early_ioremap after paging_init() can
- * define __late_set_fixmap and __late_clear_fixmap to do the right thing.
+ * Only architectures that call early_ioremap_reset() need to define
+ * __late_set_fixmap() and __late_clear_fixmap(), which early_ioremap() uses
+ * instead of __early_set_fixmap() after the reset.
  */
 #ifndef __late_set_fixmap
 static inline void __init __late_set_fixmap(enum fixed_addresses idx,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
