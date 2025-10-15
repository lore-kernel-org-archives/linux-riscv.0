Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83144CCD185
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 23:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DhQSewf5gkWV4ragf9w5L97OcdGJfZfFybkahcm94Bk=; b=ipZE58uU03k9G/
	K7CvkP9UH7CCRb1R0VQPLH+6sF9AL1RNMdtCTNNOxGjkDsoveJBRukTqZfqN6jIkaGWL/5jQtL3xa
	mNDS8rrO+NvN+7JZ0y4sh+D9SWXDP9tnsxDXNo1Zv4miI/VWDjksacwYj2ubVcjYaqbXij/EHj4TP
	6zpUgqPO0LFO7Ods0MyQStHZ4aMNbkbdiYtIoWdywaEvf4w4co2cYNr6hKnOcU/LY/oF4XbOFTD+9
	DOWucgMCIptwLNGQzqBkxhAiMkB2p0pXc2Wj6aeMLVmy4ic+Kz3clQd4VaQvUr4st23c10TCY5b2Q
	V+yovyRoSmDH/FbO+hSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Azs-000000035Ey-42hh;
	Wed, 15 Oct 2025 23:33:33 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Azp-000000035EL-1FyM
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 23:33:30 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2907ba47f71so1512285ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 16:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760571208; x=1761176008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M/xwbeQ5bIQIWErosPRtwfCXJoRyKfX0d/gFTO3gag4=;
        b=eQdjSWUA3wdkKttZ7S0UgGQyPn01GELv07HBHlbJpgteLbVkIaOETacw3t6Mpx/AQO
         3X4X3O513rF3nsL7dmF/cR8ebmLh4JOH570c0tY82fp29bMH9ay/Zz1O9OCnRSJDYfoP
         RtBKaUCaOPLZV3lTGPM4yDdqfmaTEFg2f9s6kj1ZtssOvLcroYba8TaS70Ozc34s3TIU
         ZQSnJ7blrws3Lqr5AO1swowxtSpWVhkI0CaEMhZ34Dov3PjQWF+O0aEZ1ILKffY8J1K8
         THWCxTtxp7c3kufCOWCWb1hbHaVsl0VvTlYf/wx9mAI2gHiCuq99Nm33A8lxzaRNCxAW
         UX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760571208; x=1761176008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/xwbeQ5bIQIWErosPRtwfCXJoRyKfX0d/gFTO3gag4=;
        b=oGcj4aqPMLhrkI0oOk+jS/Pr3Fhx2gVBcT6QtcWCGCvitPoylqKLI5L4hGMl2ybEoa
         njzYD9M3Jdh52DLHP7pF2pXpGl3DkTeydpqWE6dWyNMHD57wCwL63+LJbj4xxCIHUxV3
         NKTYeAqCmEpGx88Oyr3BkcvZinpujwzqZPJwT6OPy3cw3TrQv+2JjVCJWOcxCQ2Rs3Av
         nhxD282a0iSzvxx4m/AnhFKQuT8awnj2RHD+swDiAiLgZhpoEJzfKAZ9KXwcC/jI/KKV
         dB2XG7NfVMnEYztWJDoTz4lE3VjUu+xoQOaLrS5F5j1VcyV0CdwS6e5Ds7kAX87NMBe4
         Ys5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX66Ahl3gcDbPGwdnWSDh78ANb5ANnYAcy0b1YuV9f20rvjPfmGRVWzbp6rdqwgoV0DoFBk7yonECG8/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpFMLi3WO7EJ+vBnM9Cb982ZpDGEd/gvsLsXGX8UKdnMlbjDH6
	k1Bi5G3uFShdd07HXfiQDUE1s4qJWfHAatZD/DRY40JUn6yiKDi9apaQe8ojrHoVDMcP8NWesmQ
	NTAQU
X-Gm-Gg: ASbGncu2TkcSffnn0M17n8eDQ0AXg15cxTz9gS3+W3gxKjtnp6ajGg7u0wj/0KZk4z2
	sNVZLf9ESpP+Ppp/Lxs0+o4cPJu1dGFSgDdJBWCu+dqYJyjP3Fry4os7Ab4Km19Cglk+p1uen6w
	znGPGCLQskp/z38eB3mGD4EUxrUD5tp8K6YKmJxkEWgsUnT6oa7wFho5SwYGzhwLE0nm4QafR8E
	Nj98UI81sX8SlN4KUgCleEVDyZEv+OqQ5JzkVp3Lj46GVrJp+86fx2pMZUcMhh1X3JdMIeD7slL
	FtwACLLBBpnXWonW007FziGXQP+5239w1vC5e0SYleXsBZuuBjM9ijRwSJ0HpbCm0aJudGj3cJ/
	86qNUzGPFqxdLH8+yDdPJjAJAJ0HL7yan2zlbhQPZcn7BUyuRRuc0qlNw7Vlem/z8Kn9IFQTT+Y
	yqdq1vSNLZbBuDTwTBpeU40Q==
X-Google-Smtp-Source: AGHT+IFJxhyIFn8lZdohbXgnHWWU2Rr0cc/uefUtzRQp/cd9WZ75fBWDZIoRbdvSXfYnLLtM0vr2tQ==
X-Received: by 2002:a17:903:2342:b0:266:7871:37dc with SMTP id d9443c01a7336-290272c0229mr367720335ad.36.1760571208378;
        Wed, 15 Oct 2025 16:33:28 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61acc413sm21216568a91.20.2025.10.15.16.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 16:33:28 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alistair Popple <apopple@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: mm: Define MAX_POSSIBLE_PHYSMEM_BITS for zsmalloc
Date: Wed, 15 Oct 2025 16:33:24 -0700
Message-ID: <20251015233327.3885003-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_163329_477992_3108ECF8 
X-CRM114-Status: GOOD (  11.31  )
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

This definition is used by zsmalloc to optimize memory allocation. On
riscv64, it is the same as MAX_PHYSMEM_BITS from asm/sparsemem.h, but
that definition depends on CONFIG_SPARSEMEM. The correct definition is
already provided for riscv32.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/pgtable-64.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 1018d2216901..6e789fa58514 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -69,6 +69,8 @@ typedef struct {
 
 #define PTRS_PER_PMD    (PAGE_SIZE / sizeof(pmd_t))
 
+#define MAX_POSSIBLE_PHYSMEM_BITS 56
+
 /*
  * rv64 PTE format:
  * | 63 | 62 61 | 60 54 | 53  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
-- 
2.47.2

base-commit: 5a6f65d1502551f84c158789e5d89299c78907c7
branch: up/max-physmem-bits

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
