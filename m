Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE9CCD5BD1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKV71C+pMBEHjtmcM7Rkb281Zbp3U8XDO5mdBJXJAdA=; b=HPxmdrczM9UMQy
	7n5remIHenR1MjEoMzfk1QSfjQgo4KG8FMA8Qbnop+uDUGtW1J81eYQcOfdO0uVha8bvRwLh3qZcQ
	Qqv40z9TGqq74td6JU9Jnl6yZGIWpdnZp/8a8k6po7tj5K7rgERPXA+6u4l6ensJ2grC+PPGxZdrW
	hSzsqUmVBRqeCoWRBhmPFudB4XiDGCbN1vWl8shGCtZGjCI/tSwrrVohu8523EGOa1KMSQHQ8KnJC
	PMo9E9v/TH1cKt+vZw5AIIzGp2eCi5RtQfgammiU4Mvpe0d5+LBBEzj/VUi7H5eWLSpWZru/9jLx3
	YT9dmypJn5UIGgj7lm2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKd-0000000APqI-0cyt;
	Mon, 01 Jun 2026 08:49:11 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKa-0000000APoI-2zBs
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:49:09 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-841882f8f4bso3300040b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780303748; x=1780908548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ct8LTm9E0tar8OtNDyCoaad0P31p+YAvHyjb0MDrcWY=;
        b=EnzPx4XpZ5BxLnAef+Q6fJQVux2whXm6HUBGdAKkFeDSZNk2r/BZXqILAw9FXVihTk
         RiEhgBi2rTX3vyTpTuF3pWmChCyPunUQzC3pfJvNadT6c0ChifkrSbfDIp2ocYGgD5Dv
         ozXyRslPf/+j2DRYf1ACkhBl3NGv4AQboj9GK4+6hzlEGyp1cqg/HAPUA1l9pu1gB5Ct
         T0YFVhvlRSpUuei5dUL0kkdYqhLJFlSNEcy05l+ps/XbjVR6n9E8TJ42VPDDT5Zq4UVW
         wYwPMPqj3FaTY6Rxd7a8lOvlOotxiERPKLkyoP73nqppY+BNDsIbAFeWXWmEYUewc8ZG
         ME5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303748; x=1780908548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ct8LTm9E0tar8OtNDyCoaad0P31p+YAvHyjb0MDrcWY=;
        b=np8JzBtC6jXmHSOjc3qnpitMXMx1tTd01xlwdccvfHqID1vSo5y/UA4MULYFn+ChGa
         Lc/nrS8e2Y6CNYnpKRZ4wS3BoQ5vnjO5CICPMJAcFfyBlY18ZlWq3X1344g1Dvg8MVhy
         hrV5lPRan44K6TJpZGGCjKjg2qTS8etnlpSiPc8uvCvNrfThnl9WDzMYGeM7851qs3yj
         6WEYVcOQzvtbH/8TP5pD5gD9YdUgNXc3WsiugHgK6/1eboWOPQutjX/dcrxF3E2PdCGb
         UC3t9HMr6H+kWowexj0TTJ0ElTSSDbrZwBxd1a/2tmLh7zYEE3ZdcJlJnXbzIYQAROEX
         Nf0w==
X-Forwarded-Encrypted: i=1; AFNElJ8fj2RXayUnhhgeI2O5wQM40qmtTlazzgh3aZNWVaCYC44cgx9d/HMTTw2ECWaWOM6ihbQTE3cZgDjAeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8Mjoa66Nk1Y/jecxEOLdnwvp9/ll7KUllIMJEPo6yhQZBUovz
	lxZFqJ4nSI04p8+vIKlPXShEnuNjzZIMfkTsMo8/zijj0f7fszQwxlxWS+oEj8sIqvc=
X-Gm-Gg: Acq92OFcLL3+8h+wPa4ipp31N/pan2L76Cm2RJHDJle/Doao4qIfctw6wewODa5J/vY
	OlvVxpEg5nnyo+IHnSEHbawS9NDwA6aVTDBfAq6y8unO7wsp908RBUbOpx10yvaRBVEWxFEHGDs
	zizLL2W/0a4dukDczcuhD9yemI10vZFoigIRSJ1qFtIFIjX6TcMWyvTusgox69BsV/0HY2dB629
	UF2SMLNNGHY6cHfSt+cLEQgr4gcRLaSobSSXbQ+cdimurOQXPUJiZjPKMmiQ3GAYIbb0eS08DFD
	lqfQWlI+v95Wg03fKXIc4aRsfUiFAX7nMptKHtQ8JDZXtTdbnrITn6RpWSMltTXRzfxdBCrhHq4
	gFtbG+Kz3e+UG8q7/ThCag+fDyD7wpCak9RY5p+fhTkzwyRlkfIMY9emUNMLp9SPg5DA6Enc0w6
	aDHVNipwpz0URshFBHBkrCuvRnHs5UBfa04z4WsUU2Zlq3aPF35Vd2pw==
X-Received: by 2002:a05:6a00:3903:b0:842:2382:a0ea with SMTP id d2e1a72fcca58-8422535fc9bmr8854602b3a.14.1780303747688;
        Mon, 01 Jun 2026 01:49:07 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6316230b3a.12.2026.06.01.01.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:49:07 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	WANG Xuerui <kernel@xen0n.name>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v3 2/5] arm64/mm: drop vmemmap_pmd helpers and use generic code
Date: Mon,  1 Jun 2026 16:48:41 +0800
Message-ID: <20260601084845.3792171-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084845.3792171-1-songmuchun@bytedance.com>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014908_753998_A7E28015 
X-CRM114-Status: UNSURE (   8.26  )
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

The generic implementations now suffice; remove the arm64 copies.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Will Deacon <will@kernel.org>
---
v2->v3:
- Collect Acked-by from Will Deacon
---
 arch/arm64/mm/mmu.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 24388e5c727d..ea10b0ebecd7 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1776,20 +1776,6 @@ static void free_empty_tables(unsigned long addr, unsigned long end,
 }
 #endif
 
-void __meminit vmemmap_set_pmd(pmd_t *pmdp, void *p, int node,
-			       unsigned long addr, unsigned long next)
-{
-	pmd_set_huge(pmdp, __pa(p), __pgprot(PROT_SECT_NORMAL));
-}
-
-int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
-				unsigned long addr, unsigned long next)
-{
-	vmemmap_verify((pte_t *)pmdp, node, addr, next);
-
-	return pmd_leaf(READ_ONCE(*pmdp));
-}
-
 int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 		struct vmem_altmap *altmap)
 {
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
