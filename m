Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6846BE88D70
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 07:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crIHbJxcSZW2VUQDhjUIwBBehLaYFagsb+zA2wzaQQ8=; b=T2RL2ych3RtjwF
	2RFqKJSpdP175x6VRWcqH1YrTAiVTTF8kv68fbV6uZLQ41Ij51IUZ8IH+MJpm3W4cNvM6MTbEvvYr
	PBg7jymYLSDKJeC06DvO0ISNUAMx3D/dyVzC8m/gryunonOmbCZiGME7b3kkeBXFg71Agu05tYghC
	m1WL74RTo+m0tJOCTd7G3t3zXsVCJ0pKS1Z4s1O9EgOWcPygClLPGlPiKRA6JJC72w6ahnOktUoMd
	XT+UM7EhbWcP+aKptEw+U6l6LW3OHlxrIEgHm+Yo8X9ATNQ3k72Qmbr6H6DlXsDNBHCr+cDDA/OMm
	kj8otaUvaSstpituAJng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8vGc-00000003EeK-1Pfs;
	Sat, 04 Apr 2026 07:18:02 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8vGZ-00000003EdA-3p8y
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 07:18:00 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2aae146b604so15421425ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 04 Apr 2026 00:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1775287079; x=1775891879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxbGgf4+lSuSxIXzDbxhYHMBptayAf1Wj0PvoCJF+ME=;
        b=JeBNLf1RHTC1icQL8I8gm1jUKmYPGURNHq8D/FWkx5fQDgwLoyXNCui1qpVH7XEcsj
         8nDCIPQ/kKOhsxoYYGkKtBgyXqDEWcCkqy/xCcRfm0iL8ExtPecw0DJwzjEmHC3W5Ip2
         InVJjFxtAKqTICQqVeu7Tu30TS98wy6je/JzIJToB1GPlszf9tSpIfzWDUBOjTfGpymI
         iHvvbbd5YDYn7TSY8mJOmL5IWf/8Qk8uem45t+I1Sv49wIRI+eSjr/+1MxwpPZEAqsG4
         4vFvDad++hoGj6GsLMEqWo+lrQdLUbCvDvlAQ+HdSl3xemHAc1oxEteYlNwR4/YAwFwr
         wmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775287079; x=1775891879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qxbGgf4+lSuSxIXzDbxhYHMBptayAf1Wj0PvoCJF+ME=;
        b=Snj32xLnEJ67R67l8WudJqYIQvS5pGmA8IdjU3JcWczeGg8gYEbX+26CCeqLIaIcyt
         btypmVgdMyLNrfuO24g3Mhtffq2DXeiwwptg7mp9q7crIfkSKz/7oChi3Mn8hsVfWVDq
         k+tzpNaAqnMv6Cat9eQyZJBpQtghprvOWyU2f1VCO8CYlnS3EhxKCaxIl5bTUtstFogZ
         QCbqFlTyOkIam9eXx32obZZ6s6JEJ0AwSNAXlb66IrWszMz2DXVZsARN0pbEQTVPXiSA
         Yugke9GzTVUIt2hOZRRxKsnmd4SiJyTC/OMvVhdbncVUSI/9W2c+Tw4xvhH5BuGx3xxc
         2Ybw==
X-Forwarded-Encrypted: i=1; AJvYcCUcm09uOi0ifA49RLxcwRerjdlQptS3rcmLIgzuVY2e+alhuswp5BJ/1uPSitQo2QJ72DsawNrAnuRUoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YysjQkglguRhr9gnPTWivD5gmlFqhOhH+2UrcnRe6oaK+yQaI2S
	j2WLMAnTngT/TGOrCWX0Smm72K58xoCtvLaslAZ2+Rm58UbWc9AombshegoB9l9pcTE=
X-Gm-Gg: AeBDieuZNzQUuJoPWUq364e67QC5WK/va/bvBAyhOf7noEr/zXI3hge17a/1pGYJgis
	A2FngX7d0L24OU6YMYtAGMYgBEbkg92BBobeYyZ35WODbn4qEojJ0GiCqDJLmwe4JO110tMYs+l
	TIHICE1Alvh8P2olZb/VMYVVa4yz3Nq31iMoMCGbPinFhA/Wj32qgDC07NMAwtXkgQyAce9Z9f3
	RAW6GONI904Q9ACMC8FWcdLvr5QwWwbOx4myOl5GXWmhxvkbRAXZbXcjIh2o70bb5tXd5TW1AkJ
	Dqrp2e4qDtNWZpp+qgU9LNR/WZx08npp0Ct9WdBQF0KfCLejbXOlzU5XLD9Yst9LSqr3aD2IM4z
	5uzVPbYmJe4CCwU8tsdvOGRIYr82pfLrfW/N2gZoPdwP7o6Vauz1/xnRx/X3ud8FH03pMoeWp+U
	ZXoRFZXScyu+s7Nz5SoB3mW2JxZXLZb0bwxeqP5islCtE=
X-Received: by 2002:a17:903:9ce:b0:2b0:54dc:63e with SMTP id d9443c01a7336-2b28193257amr60394315ad.33.1775287078939;
        Sat, 04 Apr 2026 00:17:58 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274979525sm94675115ad.45.2026.04.04.00.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 00:17:58 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Austin Kim <austin.kim@lge.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] riscv/mm: drop vmemmap_pmd helpers and use generic code
Date: Sat,  4 Apr 2026 15:17:08 +0800
Message-Id: <20260404071720.3577290-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260404071720.3577290-1-songmuchun@bytedance.com>
References: <20260404071720.3577290-1-songmuchun@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_001759_954508_2E69DDCD 
X-CRM114-Status: UNSURE (   7.43  )
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

The generic implementations now suffice; remove the riscv copies.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/riscv/mm/init.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5142ca80be6f..f7e7d7c2e97f 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1429,19 +1429,6 @@ void __init misc_mem_init(void)
 }
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
-			       unsigned long addr, unsigned long next)
-{
-	pmd_set_huge(pmd, virt_to_phys(p), PAGE_KERNEL);
-}
-
-int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
-				unsigned long addr, unsigned long next)
-{
-	vmemmap_verify((pte_t *)pmdp, node, addr, next);
-	return 1;
-}
-
 int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 			       struct vmem_altmap *altmap)
 {
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
