Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A202EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 07:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=12zyQh2oYYz6wTlJpyMJQJoXkHJmZ4q1GhdzAl15nkg=; b=SW+V0rhn6SfjG8
	wFUXJCl6NR+lbjYmHgXIDg3Lcl/cqDOZCYKbCWObSspdJAyvOFu/oMkeppYDuo75xE1gH7wLVYvY+
	tLFyIEirRbWb3ts0QkKPQdv8cOg9K9RZ2xT+vCIwpPOkmnHRRwN/OZuV96lR5aPN3KunISq2OyPrT
	noFuqu3emewXprSoJ0HPZ+WuTlzPt8LUMNxBdTEphQGbkhYPpJ+aA7FTUnXae5QJiuQ2HU+Qjk3KQ
	5Yex8Nz+kwPXQrkXd5jcNgpxLCn7lHqotyU5qp8dZdSTAcuH3KJCi5cVGvNEMC1uGjRAjssxdYWoC
	S2SiHWWsM8p6tCavBmsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ8Cs-00E2aP-0J;
	Tue, 11 Jul 2023 07:54:46 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ8Cp-00E2YY-0v
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 07:54:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbab0d0b88so47920025e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 00:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689062077; x=1691654077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lkPK/GMPSBp/4g2qtcrJmujy1568nlXOGlV287FaDRc=;
        b=K19Nrzp1xAN9FNNb8XRkpzz0wzk3pqohF7q8+RkvdexxFbKKM7d+ucdX6H3xvRoCoo
         IAvl+ydAs/IUYirGbQwvOuyp4A0dkj0s/nO7Wc0g1z2W/DpIfxDUlqKRDsMZPbh+6SZG
         UCe4MHkpZvEjCz72zHCdheewAIwOwYPwkVsqdEE4tkrDZGuGTwCnzvidF2fVjDqYCvIA
         qBjO2GW0gO8pham8mPm4K1v0bW74ZtjwGzEIJCFFnbFQdOXWS+dnNjbtCeWOne6Ej7AW
         hqxv8/DVt4rvAqBoBN53nUXsUuqopDb/uAEA2da0pu6momATMv5C5drS+dFGgJdqinm7
         l2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689062077; x=1691654077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkPK/GMPSBp/4g2qtcrJmujy1568nlXOGlV287FaDRc=;
        b=FlwwCFGUREX4ch+CxAmxC7XBCnxS3fF5az81aVra5AZ5x85JvPCzGv/hRadfcSgPA6
         RmxzV7jcOx1SK7HpsTT0b3dnMagDQ/PhqWSrtaAsyM6ZdFZSDp8cUBk3sDe1k7nX3Q1q
         NbvUS0TO9lq/eCMgTHRQUJ7B+xyv3Au+eV8w9RYm+IpsWWnXDi6w5Z4GqMhoyJsXbaGy
         I/dQnckmOrYsyfBPLn691XWExyXcqDaE+kjdyxb1sxm6MEwF5ao1D4lgTYlem6w3mW2W
         KPkONsYNPt1sDLlOXE1pt4DpNfomRbw4L2MiOM8tMPgfdAh3L3+E75ViZ6WnFHMwmEVx
         p+0w==
X-Gm-Message-State: ABy/qLbjhD6wOsOKQptqWmYMh45xa8aztvg9XbCvPOb8widMOcCWI4ff
	0/6+qWMmomehcSHg0uExNlKnuA==
X-Google-Smtp-Source: APBJJlH0eknonRxAkA8j5z+QdOB01QLG+MwLKDfRYjX56LEKFmW17Z4Edj1lXAEKj0Nz8QWKQj+7hA==
X-Received: by 2002:a5d:6947:0:b0:314:2736:ba3e with SMTP id r7-20020a5d6947000000b003142736ba3emr17296610wrw.3.1689062076885;
        Tue, 11 Jul 2023 00:54:36 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id i6-20020a5d55c6000000b003145521f4e5sm1481156wrw.116.2023.07.11.00.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 00:54:36 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 0/4] riscv: tlb flush improvements
Date: Tue, 11 Jul 2023 09:54:30 +0200
Message-Id: <20230711075434.10936-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_005443_323945_E30EF237 
X-CRM114-Status: UNSURE (   8.88  )
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

This series optimizes the tlb flushes on riscv which used to simply
flush the whole tlb whatever the size of the range to flush or the size
of the stride.

Patch 3 introduces a threshold that is microarchitecture specific and
will very likely be modified by vendors, not sure though which mechanism
we'll use to do that (dt? alternatives? vendor initialization code?).

Next steps would be to implement:
- svinval extension as Mayuresh did here [1]
- BATCHED_UNMAP_TLB_FLUSH (I'll wait for arm64 patchset to land)
- MMU_GATHER_RCU_TABLE_FREE
- MMU_GATHER_MERGE_VMAS

Any other idea welcome.

[1] https://lore.kernel.org/linux-riscv/20230623123849.1425805-1-mchitale@ventanamicro.com/

Alexandre Ghiti (4):
  riscv: Improve flush_tlb()
  riscv: Improve flush_tlb_range() for hugetlb pages
  riscv: Make __flush_tlb_range() loop over pte instead of flushing the
    whole tlb
  riscv: Improve flush_tlb_kernel_range()

 arch/riscv/include/asm/tlb.h      |  6 +-
 arch/riscv/include/asm/tlbflush.h | 12 ++--
 arch/riscv/mm/tlbflush.c          | 93 +++++++++++++++++++++++++++----
 3 files changed, 94 insertions(+), 17 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
