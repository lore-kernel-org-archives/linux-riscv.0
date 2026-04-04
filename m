Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1304E88D87
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 07:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crIHbJxcSZW2VUQDhjUIwBBehLaYFagsb+zA2wzaQQ8=; b=tU2juMuE+BRKO6
	M7rKrRzn19slHlgoc62H7Sy/d+emb3mLQWp0UyEbHktjFksX1CRIuk29/YCTDhCdEywMds59xNCUK
	jsYa2/8TevLLmZRahw4Mgtfbr1NnARHqP040c2b1N8ZaxGsDQKYE+Ufs3/gs+qRCcuDVNxBL5vnKT
	hSZH9oV+f907jDBOAGxPENV3KJee6Xs8Awpp3jzplBtCt1/IsMeVM1gChJO4PtH9ljifM4O334tP9
	NPbgcdr5EZX40sB/iMAHTsKrZRCHd+5N96EplT+z7aAK0jhYQyxZggYTVi8ipJwoqQ0VNH0tjyNWo
	bvJ5HUG7XtGwmmwvmAQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8vGo-00000003EjD-2fkb;
	Sat, 04 Apr 2026 07:18:14 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8vGm-00000003Ei3-1oyY
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 07:18:13 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so15262475ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 04 Apr 2026 00:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1775287092; x=1775891892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxbGgf4+lSuSxIXzDbxhYHMBptayAf1Wj0PvoCJF+ME=;
        b=YXcy7DXxQLZOFqSRDODGYtNcww4xm4J+0eq3jp9OgKPrZP02uVd/AKgDsrNv6sYpHe
         IsuUPu/XyqodFW8F/RFzgTukUxVU+XGSSZ+Hypcil6RrUiRyNRvvR26iEq/aTbDnxY9N
         nJc8FN8iTXZ2B0ym3bm4FdaRxiJcYolsJTk4i8nm5pCaBnZI3FnqweZbTxu2KXrvfppg
         xBcwdoIMGqUVdGibXGiOPPJ8M19f+v6P6ql0G3uHKMjCBJQY2E4kbD4vQ2zEXAPZ9zgn
         V8yNB21cDhfwz78fNua7sqL6jFi/TmuG6cfYgfm0ey1dITlEFzAYKLP5+lHLrdSHDMk3
         Id3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775287092; x=1775891892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qxbGgf4+lSuSxIXzDbxhYHMBptayAf1Wj0PvoCJF+ME=;
        b=M0jpseJX9/NTUb1WQXq6xEsWptIN0sQoMEMQIC8ZooNNQVrnyNHfV4ynQ3EpZnKkuL
         WRi65f+wrB+qH5ko9EyeNdRtyEmbNcN/zXhVGre6gXQzJUDS8d4/fd97TJloq2gLCyjg
         mxl8cAsK4mKFG/fHM05DqVtUSXf7ocaHV4i2vEFkZm7i9qDxz5IvDEux+D+1MTSeSpc0
         zSKyC3X/5EiTc7UCiGH7Leu21bNUmq9DQYrouW6GftfQ2D+c3tF3ijzTyOvpv/29KxNn
         DDCZCf/XP9+UlNgEueXgSdJlBYqvdi+hXXvgspP7V3Ll9Fi3eoVSE8eZ9m7IHkFGY7RG
         o0+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmF0ZBT3ffxfKNyAn3fUnJggL2mDSU2zvlnK15bo3DtCgS1ffFR6KcmOpI6AYDzpH1XinVhdPS/MC6Dw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDYUq/YVORSC0PcBJhc/x4dZOBniEzkXpBmA5isW7L/bu8IIiD
	SWg5Jyp+qR3IpUpJPnNavkjXWELj9NCxxjKxDvLDiG5hYduIA776D9bb4X9watAghE8=
X-Gm-Gg: AeBDiet/qmyh2WWMAMewB43UZ4+RugXuCQooXYZs3fbrXlS4P+HA9NTjQq3x6FS7Kg3
	PV17SlSjJSVWOldwFvXGXQaT5UguALuICpyAajnpsgdFlFKs1pFoFW2KMZa9cc6JIrZ1D3KplTq
	xjkFg4n7JPYw7cYmK+ziC+zDLoaZ/aZzgdlszOn9FHY9L9iEbOgnXnEHCwZLOPQEeYIUz9K5BsG
	6zkDUO+f8SQi9Zq6sZo0MlvXu436Lg78G1DarV8252psmLng5CsMg4uq/Qq4pPP4ch5dl1gs+UI
	xyufjH1DS8mGJILw/lFRShRvAnCpmhWs9Y5YUH5l52bHYGUE5Vt9LbUV6dPYEkUqBVjpFN8mS+P
	wX74Ve93XsXXFBCtgQKotahWpBJVs9U7/xpl964hcNUyen91ItWCNKbSUsuqJkfJ/IhQLjCbcMA
	kJ5EmcH/kwVruTw+MOPp9qwxxcNw5Kz7L9p9mgzhppHuY=
X-Received: by 2002:a17:903:1904:b0:2b0:5795:9ead with SMTP id d9443c01a7336-2b2815325ffmr52669865ad.0.1775287091675;
        Sat, 04 Apr 2026 00:18:11 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274979525sm94675115ad.45.2026.04.04.00.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 00:18:11 -0700 (PDT)
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
	Junhui Liu <junhui.liu@pigmoral.tech>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Austin Kim <austin.kim@lge.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] riscv/mm: drop vmemmap_pmd helpers and use generic code
Date: Sat,  4 Apr 2026 15:17:10 +0800
Message-Id: <20260404071720.3577290-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260404071720.3577290-1-songmuchun@bytedance.com>
References: <20260404071720.3577290-1-songmuchun@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_001812_468668_684650EC 
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
