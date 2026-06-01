Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20806CD5BD1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2pDtQu706bYCuggrZ8y0fo6L+ud8Ald8KrNXwPRcPY=; b=TveJ8ujO/00xze
	QQt2bpgliPGZbD4bopL0GKpII4PilCeRJDkKAqhUUYCQr+4MSQAN1SaegcFg6fNvLyIhn4t6qMrwL
	UQptVb6T4HVt3hH7bcQpDA09II77UB08Qgi12vLb7RdlEn0IyBhphSgRtqoZKNMoN3f/JXq984Si0
	xrK+xJYFAZOVp/g5kMvLuTa47hH2dOtSubqtUx72in/c30PJRlUhY7vfN7KqoPgB/zqKhaMe81NHn
	8+B3HGzFOVc+pYPe9PKbYAoF3uu2KZxDV/aBCPWhWWTJoJYMWx5UHuzBZcQd1kHSWwQd+8sE8ZoSF
	SZ6Tnp4SwMbsXV6LsHxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyL0-0000000AQAZ-43pB;
	Mon, 01 Jun 2026 08:49:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKz-0000000AQ8r-1UNj
	for linux-riscv@bombadil.infradead.org;
	Mon, 01 Jun 2026 08:49:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zs9Ftk//Eli+AipH1EmAF2SPdnVVPcjuiC9Ml1N6W44=; b=ddTPq3/EVuoyVM/+GTNJR+s+nv
	B/R50sVNt2SdZf6Qt81+d9k2xWqD+hsxkXn8NkIm0xMArH6CRweFqo5FAmQi/Y3nuIYuR6RmcJ7Uv
	zSpiHXpzUrcU0ZsGiW3NUst/UeQvH8a8pg9cBfCUxaDk/Nd3ojBu59VcBl1fUvLEpgwXHiZN3qjyU
	N7VIBRCkKwCV96W1+93rWvJxje6c6RBBrBNTCC2m4N0l9LGGFaVz28UL1Lc/X9rRpKJiiYoBNR1TR
	M1V+h8AUMURfXC4XG6XHj8HGJQKPtzj1FZLuTdRF961zYDf9pqzc/ye1dSIhfUk//MpgIu8w4grcu
	Wqdgf8lg==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKv-000000067n3-165h
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:49:31 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84230ab8857so579485b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780303768; x=1780908568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs9Ftk//Eli+AipH1EmAF2SPdnVVPcjuiC9Ml1N6W44=;
        b=lK2D7vQpGaZVME7t3tQ3bvny416SR8vrOkN55PS6TLxF5WKs8cMQU2FsTLGNmqWOuN
         CThluGzvSus6IrioaMgJ4KpMMPIB42X6sfHvX2F4N1Wr27hOGYakZBLufnfUWmUmV0RB
         RVTDiMScgPi5RTh2ox4SrdQwmYnX/nhNcfXyDu3ZGxleE8MiSioP34BUE2veAdvKjaZ2
         CXCkyRICQVPGRqwwQwNsw+GSgiDYO259AEBGebfHQBHDN6ZqBrIIKMJkOLzcG1DyKyEO
         kn1ZmJ8mDUoWzhc9awNoJxhy0uYoDGHc67gwevHeYYFjKGjAErkRh9IPgdjtlYVdPip9
         IgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303768; x=1780908568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zs9Ftk//Eli+AipH1EmAF2SPdnVVPcjuiC9Ml1N6W44=;
        b=Pt0hVAx0hdframIj44UoybJeKxFEIWHaOp+8TsHv4OSm1dah+CWiWuCE/TaIKOVVk1
         InyoX6XwpEzb8Mp3yb8bNlrX4TI1Q9kXowLQymbNYRs2GBLZaQwbaGjayE5XlijMlFIV
         TLG6zvUKBl2Z97zr6s+pdtnqE1cimWsAZowtkvIsBE2y6DiwJbGQeMbts/8AdxxQUPIo
         +9LpKylcULDPqdHpLlUUZ0UINDFrAgynqCRk8lJbmzOHVUq+yAzj3PoZ9G4jUw0eG7/1
         O40GiG4qBQvCYl51iYK7Mu43PWZBfjF8evlOVFukildP00GGtfRDfxkYBnZlVvHaHNHL
         lmMg==
X-Forwarded-Encrypted: i=1; AFNElJ9xm/yaPjmfiQQ7AqIN21sKamBwmvZZeqCe6OTP0a1K6+JnVRDZiWjj79lOQnZ6Br8A0RRfvMU1cLib+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJFE3oLSQzWOISdJBOCaVMh+AOpz2MymocOYy9ftE/Pxgsdxjf
	eGus82ue0zSIfPjQdFdWHNS7tp/iMQEInKRohzwz8sxAM7v6zOUJKEZSGU5HQQlml04=
X-Gm-Gg: Acq92OGM7JEnpcgwX2ZhZagXYq2saKADz+V9iYITBlOtAXbpbyFFZ1ggOrTOlXJCoJ3
	R4uG+26iNcWrL0tfok/ugyA/gdiRo29m9HCJhI/Z89h6fkzyxhaS6r1Rmf21fQSi0gkqxPVODWY
	2AGtaS9T2KzSMpI3p7fd/9OVPBekbDINLnIfRPEgdvXY8m6h6rx5QQ7SVfzwBfVNDc5zYlK4lpN
	Kp6NlX17F/3ZJyaVQC6gZpmKtjBN45gDCQ73MXmuK6IC2e5PS1GmuK85aRyxtwY/9kN6JbkZigz
	1G5ldRXLSAyCdRqhkV6GNFB7U1c1qVfOWWuwyv8YkH2mp2rY1Dygkxt3eY+Vi9BOgQobdHm6iRJ
	ntBCWeWzAVHQCWliqbR0OJFpM/Qjh0sTx+ejWiiwETy/U439J54h3mcYKjD2WbHMinHIWCbE0cv
	Urntj6i0N2/wWhqrfgPiLABgdRZ/8IGwHR/JE9N7XclBEjaDMV//JnPw==
X-Received: by 2002:a05:6a00:4c8b:b0:842:43d1:4b41 with SMTP id d2e1a72fcca58-84243d15007mr4884011b3a.47.1780303767463;
        Mon, 01 Jun 2026 01:49:27 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6316230b3a.12.2026.06.01.01.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:49:26 -0700 (PDT)
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
Subject: [PATCH v3 5/5] sparc/mm: drop vmemmap_check_pmd helper and use generic code
Date: Mon,  1 Jun 2026 16:48:44 +0800
Message-ID: <20260601084845.3792171-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084845.3792171-1-songmuchun@bytedance.com>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_094929_692733_1B99F31B 
X-CRM114-Status: UNSURE (   8.67  )
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

The generic implementations now suffice; remove the sparc copies.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/sparc/mm/init_64.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 3b679b1d1d72..103db4683b16 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2559,17 +2559,6 @@ void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 	pmd_val(*pmd) = pte_base | __pa(p);
 }
 
-int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
-				unsigned long addr, unsigned long next)
-{
-	int large = pmd_leaf(*pmdp);
-
-	if (large)
-		vmemmap_verify((pte_t *)pmdp, node, addr, next);
-
-	return large;
-}
-
 int __meminit vmemmap_populate(unsigned long vstart, unsigned long vend,
 			       int node, struct vmem_altmap *altmap)
 {
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
