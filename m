Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA553C44501
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 17:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xxBK0rblBdyYoR2uDTfD9WdnZfJ8grPp+LDOON8xCE=; b=0eDfNwcsG7LvqQ
	flO0wOWz3dxxW3BpOV4cGo+X1wilbibhDZwBI20kyaBQgAZFKNBxDA3UUwSXzN0oGLIah4GRQsMme
	ypMwi9HBy1oN+E1azQMkm6D6Ob7eBm+NZofc4TrzS4TAn8ETRIQLUxb7EXfF8Z97TJyE5qHGyZOEW
	H+p537aIU4qteB4cfumYB+RJc8t7nfbEZLYcxUq8+4gfiBRHAbkCTvFUt1iU8Nn/DThxfgls+PA3Z
	ZRNxkB0MKjpX42qXb6BSCu6A5TO3Op/unEvBCfcTVD8LLwV2Sjls2BR8OvOq1jCAHi8CUkmMxKBYL
	f8aSF4uqpLXmVPthtg+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVju-000000003Fw-3z58;
	Wed, 08 Jul 2026 17:07:14 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVjs-000000003EN-1Eqx
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 17:07:13 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-846970f0acaso30348b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jul 2026 10:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783530431; x=1784135231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pruJ/v9XfkTpXQ3qHhlgzQ4uIIagbs0g6+xY02Tr79E=;
        b=GyxwAknfM+n4zxLc3vhCEu2BETwhHLEfmLvcyhNqM8e3y4/CYZmNZHKPdWLLNHUNMo
         0u5YBiJGyR/jk21P/R0ONXJOdqFzDuePzl8cORNi5nHTFveTjrlCkA8txcYFXf+c8msQ
         BpBtlJcxWl2GhB6HnXCBXSpMPO2TEtVdBYDDC7vsMCN7pRNtHrhwq/UZ6jibPRJRyleu
         Y5JmUpWtDEW+FbfrXNn9F3aGKmpz5cJ5hZLtUY8NxZZy3phwkL40qEMdTmeJ14HlfSz0
         VY0XMmfFNbu+kfTzqcwK/SIk+HOJpaHpPIcBrweMkphh0+g2TWjCx74+QaKNIgS8vYXc
         lSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783530431; x=1784135231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pruJ/v9XfkTpXQ3qHhlgzQ4uIIagbs0g6+xY02Tr79E=;
        b=hrnqeETr1thxgYzkg0q4xBagJg5wUykahf0k9aACls7v6FMuUwAIGB0tKAWRHjYcu2
         95c8mvc+KR66nghJgCSUaWB9WdiX1un2q5uf8A9Wh1zSEIThaQ+x9ojVyJOGXsM6mDYv
         Q94h+w8AxVOHMzaFL5WSaFToY0repmwG/Bbznvt1rqx/3987Td8Y3fkhGTWJwzgL9OAE
         K32yQ+/No+8aiUB0I6We7j3X/zduOM2qe4xUMkU86vuybniM7Xkc/5BEpfPTQEyn7/7G
         /cpftoacvIkUFIJ8hm/TMKG/YYqEjDdGnilP+rm8W+GnR2QKN0aXkdIRtNOHj0KxR4is
         cfcw==
X-Forwarded-Encrypted: i=1; AHgh+Rqf0PBcOU4LdqnJ2QniyTtcQuoQuScOAYgw9wpuEcaIxXCqxi/1JdvspWjzunHOA4vbx6ycIOgavV9roQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpeI6+RF6gcfdihRC32FqOdXBHhx5c0XICmfCBm5gvEMboohTG
	FMa+pPYTlbFkZvaiKVU7zQjXRMhBzCN1I4VzHnXJ9W6BxzBiGMn24gQa
X-Gm-Gg: AfdE7cnm4AttTo8AEjQQmhYwnHJSOB2vTRI2kIbTeh8HgFU0guD3Bx3p9Jthb49R4fy
	U/SeukLQgmK0M0St73jjsUMjcGASgaJykazToXZstGbzqMBrOOGLffY8ITPqfDRTOmQeqT74MBx
	2mMzahEXBm28TOTW5odEd2+kQ5dZOXS8hNqsiR4CwwHJOw5l+/qVigaLC59i+0p+zu+JXk9PZqx
	K5manPjlsfpLrg0HJ23ROSQ9/RJ/C7tjmylE6yStRBbd7GPOOlvTSssE9z59T5yz9tGeNHboeGY
	YUUWV/+XImIor/RkQTfXKVN8Eoc2l855koYwXOjL2gwdoGmMnzn+cnKrs9DeAOi6r9v2IKajUIb
	9cr9JCbcNXYuHjGOMnMW1Xu10BkvLZw7jWDmtMykDpQK+Vz1m3Zb1rqVxELlL2o+Bj6AAqAsT1Z
	mVJk82TJk=
X-Received: by 2002:a05:6a00:4109:b0:848:30c7:6ddd with SMTP id d2e1a72fcca58-84843008427mr3499573b3a.56.1783530431370;
        Wed, 08 Jul 2026 10:07:11 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm1119528b3a.22.2026.07.08.10.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:07:11 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: akpm@linux-foundation.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Will Deacon <will@kernel.org>
Subject: [PATCH 2/3] riscv: remove unused __late_set_fixmap() and __late_clear_fixmap()
Date: Thu,  9 Jul 2026 02:06:46 +0900
Message-ID: <20260708170647.362562-3-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708170647.362562-1-ekffu200098@gmail.com>
References: <20260708170647.362562-1-ekffu200098@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_100712_338658_8912B48F 
X-CRM114-Status: UNSURE (   8.54  )
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

__late_set_fixmap() and __late_clear_fixmap() are only used after
early_ioremap_reset() has been called. riscv never calls it because
__set_fixmap() works before and after paging_init(). So remove them.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/riscv/include/asm/fixmap.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 0a55099bb734..a81823c5ee4a 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -55,9 +55,6 @@ enum fixed_addresses {
 
 #define __early_set_fixmap	__set_fixmap
 
-#define __late_set_fixmap	__set_fixmap
-#define __late_clear_fixmap(idx) __set_fixmap((idx), 0, FIXMAP_PAGE_CLEAR)
-
 extern void __set_fixmap(enum fixed_addresses idx,
 			 phys_addr_t phys, pgprot_t prot);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
