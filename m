Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F7BCCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1eoEZ61VkTn6JWcASA9QX3X1ebB0us5/u6HDHpKmsUc=; b=M6h4InVFIDbua/
	NSii32DgExx9PclGUbrIf6hJ71cvk1zieJP9nZlY32Hu2lt/Jy1iTt4mUfybnARzEWo/Mt8BSbisu
	NP8EUWY/g0Jl4f7gjZ6IlWapLZFkjbCjwx3wmghcPWxmz+9Qpiu9x1esSQZX1Lz3IlmS+FlDjv89R
	dWxLmZy7AWslwRA+JAoXpPgFmJNQCXHfBt+HRJ9HhSosmVvin3AwGljYRlZYhRMatfOggs6+G9ea3
	k1RZsCsD83QhwLfAwYPqcYjJpkDlh1jFvUlGearrpXmjtt96SyN3OGi4JNqDVDdcIMEhRJX4vgM47
	+U7CO7mx8E4/EZPtZVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvZ-00000004z64-36zR;
	Thu, 09 Oct 2025 01:58:45 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvY-00000004z4O-065w
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:58:45 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-27c369f898fso5654255ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 18:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759975123; x=1760579923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdiVfcIiYEtPdSKu0CqenqZ/5C3LyfHi/KY36+7mBoA=;
        b=IRZKPophz4FjQhlEmx73xfiylnnQ0Vq+0foHpNpd7P2nBp5QgoOhOM5KHOBnVuaeXx
         kYEiBQCDMLt6R6YcVKKi6IMf0C6IF/LOGY5irDN4Fg2RW244dN/WLMETdQTKjO2iTAPx
         GCY0Ut0Mhcbmrvizi38TTbOFBSiDHrflei0mC8jHqwpS0Pzm6jb+5fCzu8UmntMf8MOD
         rUdbgPBcXpBqnsiriEWt4U5GyMLsB+uPcKtIRSIwePG3c7d2qBmLx8HJX9WHgvzK2Ivd
         1nnCqmml7LpEFHvb3Gs+bJQCMRk9MMsRV719fMe4pcvJyeE5DpLApJXezBt81XdPDgsU
         Y3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975123; x=1760579923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdiVfcIiYEtPdSKu0CqenqZ/5C3LyfHi/KY36+7mBoA=;
        b=DGp+S9lNyCqebVt1P7+Z0Jjd3pxm94A96Pr89/GBihzqYwNj8/iUtLJjvx10V2ryqx
         GKhl7+g1CJyBUUAuAui3CElzL/VFSNPERMpJnOn53gFxhZsD2qaEDwwG6RJL6NnvBwIT
         otOTCW2psoUdbU8LyaB/cg82m/LT7ViQHYlSN4Y2nUFMSev+O7SwPmkg0Cx7Gx0xClf+
         KuDlPI6/Im93xQ0DNjXwgQwVI8sNPlHKrln4t0XxsAka0W3xFfyl2nTYb8IB+T+qbede
         t5iNQH4X5twLEme1mnIeHcrgaupLPrZqACwLpfF7gp3aQGnOhYdzxTMLLEHGp2RjbATy
         UkQg==
X-Forwarded-Encrypted: i=1; AJvYcCUGlWMlAjzdpCDZn53Sl7EcQi0WHBFx+HipXBx6ebBJrKIR8+SsbkF+UuNnpjtlJEBJv5XcoB2RldHYpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzpSqpYrGbpQ+7kh9FL/6NFRXRNHVKBbfy3Q9cglVkUx9PpQy9
	FUg3hKqmRU/Dg7Iogc48gRA+ZvVmyHgnD/kj5K0ACEtuOQbVLs79tWwUKKfJXxMsmVE=
X-Gm-Gg: ASbGncuxfZIb7nACRN8K21lldrZQkRUQizaKFuhWRnAi9JUzpmQifNm5jpabx7OYZJd
	oGegmDnUeacK4YqPuzkqXgkUkduNt3Ll/KeocEV3AeuSadqMzhh6vj63LkIeRRU4nd8pSJw4BEj
	22Zxv2WSUFXx1v14Zo6ZLsp0sWxLoFKgecVDvf+q7vESZRg71QIMLubkXm0mx3bhVUVrxWY+1CU
	mM0TD839/vls15M3yH2Pqb/uXhsyRX2A8L2yC1CFYdq6ArmXoczEZ/TCWRtRoRbxWqbYXr6wnt/
	qp3D8GRT1cfnD9cxeD/0h9OBxaJaAQxDZ9wFRPTlimQg85SJm8TJUkupglVug1V4hEIZhbjqHcb
	8iDUOHhNWGyA+jgZyPSr0jy43ecXEbC+3JGGTvcZ0VAq4wgbHzpH3qlh1jHmxUYKL2NCHlhdyJZ
	7iB4c=
X-Google-Smtp-Source: AGHT+IEAHeuoGA0XLStPTncgvhvYEundXEr0shvSlmxf+pcjXId4G/S6mKP+GMbaTviYedqoip+3mg==
X-Received: by 2002:a17:903:b4f:b0:288:e2ec:edfd with SMTP id d9443c01a7336-290272154a4mr64152045ad.10.1759975123319;
        Wed, 08 Oct 2025 18:58:43 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de53f9sm11033585ad.14.2025.10.08.18.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 18:58:43 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 02/18] perf/core: Replace READ_ONCE() with standard page table accessors
Date: Wed,  8 Oct 2025 18:57:38 -0700
Message-ID: <20251009015839.3460231-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009015839.3460231-1-samuel.holland@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_185844_087835_F3807659 
X-CRM114-Status: GOOD (  11.66  )
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

Replace READ_ONCE() with standard page table accessors, i.e. pXXp_get(),
which have a default implementation of READ_ONCE() if the architecture
does not override them.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 kernel/events/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 820127536e62b..952ba4e3d8815 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -8110,7 +8110,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
 	pte_t *ptep, pte;
 
 	pgdp = pgd_offset(mm, addr);
-	pgd = READ_ONCE(*pgdp);
+	pgd = pgdp_get(pgdp);
 	if (pgd_none(pgd))
 		return 0;
 
@@ -8118,7 +8118,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
 		return pgd_leaf_size(pgd);
 
 	p4dp = p4d_offset_lockless(pgdp, pgd, addr);
-	p4d = READ_ONCE(*p4dp);
+	p4d = p4dp_get(p4dp);
 	if (!p4d_present(p4d))
 		return 0;
 
@@ -8126,7 +8126,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
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
