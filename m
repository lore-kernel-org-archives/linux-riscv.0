Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03A0C0015E
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 08:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UtEaHFUEHsSiE2Hg1kVg9CDkttiddObO8VKkYz5h4E0=; b=1R2NeIHX924bgs
	1FPJxQw8Tav14rE+Zo6V9j5Lb/7jaB0sJxUSJbJWDVJXc+aY41kwlbmhplo/uTCGYY/feFlwRFBAV
	tZhju3UBcjYwhJQqhbfjotbNMuJLI/DVaKYJN5T9Opv1lfHjBnbbo1OdnO1VRuRfPhpo3z1ipznwy
	Q2GkhBEVq9G2Iaf2zLC/3sUq0TzSXy2dDMAxMbwsZ0sxKdHDYxFLYBcSry7jWmrbuiNE2zqeBeyg0
	QutfAAOzf7iR4hZNs6G+9ShLtTO1AqT3cpo4Pq/sjfs3NA5ycsVyEtPT+asXRVp+1TdCD4HJY+yJf
	afQWlUlo5i91rnodHWUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQl8u-000gzQ-39;
	Tue, 01 Aug 2023 08:54:12 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQl8r-000gxp-0O
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 08:54:11 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b9ab1725bbso81494411fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 01:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690880046; x=1691484846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FuFY+PU6PxR5OxRRJWZPtIcTMAd1Hge6WKSDMNvcYEM=;
        b=TGom4Wp+0Jnfkmkgk7rmKJspecEM9eWKO0+p+TFJ5nr6xqU7LBDQ/rZzpgdTd8/n4G
         FGDmh+XTHh9ALXh5fsOpY0bKm5fLn4AExNOwOt/0z2eBJN7Vx4XFBvLOzfe708H7c8Kw
         tUqu7FExHnJLdQALNl/A9cDb+g4wGYflPZSTwD50mcCGFiN2ZGwFrBT9iJAblX/uLc6S
         5lxRW9dFyOtjn0lCjIiBBPmwkd+hnXnThI+Z/VtDP0Zi+Qefnt9kuoGv9CMIpPsfE9KU
         W6mOuGjME8hAqZ4gmxEwlCviZqNHRpr5/uLTWHe9+04HmjRMjUsy4jAbU4J8BA/987EF
         DreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690880046; x=1691484846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FuFY+PU6PxR5OxRRJWZPtIcTMAd1Hge6WKSDMNvcYEM=;
        b=anHXTwmWlo1wd/px1whM3lUQXxAoHliB1yMqnEp0RYAqZnV1PEB/J5Ct5t/oBZ5bjR
         /4AyfdBkGsIhPrGwrvATEcvMwZtx/y44yD+4cPjMo+hdd9h/mSs0il0fg5MhNRrJAd4s
         Cb6ZG6J7eQCuV2scDT6ZlJBJdymK/PqIPD45BbTnj9qJMvFOx+Q+232tO0+QfkuL2ua4
         aPIqeJkh032rdQ+z63TnSJvqRoDvITkhwzuJ8gcjUm6Frrlh4W73MEdh8Kbta0NLVFEu
         pXHJTNeWQRy4G+jTiGhbROWwXqQ4vGD7/I+6Boq3xybx5HHq8Yuesl3Hn9WN90pZJYiz
         rblg==
X-Gm-Message-State: ABy/qLb2dUQgr2gTuGDqaj6pUQYEscXIJOtM3Vl4+DhQakHxxs6Sc3n7
	5jaPXt8TsRnJMr+CFRIKX0R8dA==
X-Google-Smtp-Source: APBJJlHFJHk7dxJUGfF3nocomaie6wll22GTa1EEA2Nfjcr9TB9jb7ZOAYLSPe0NEAsx7q+L87fvVg==
X-Received: by 2002:a2e:b048:0:b0:2b9:e230:25ce with SMTP id d8-20020a2eb048000000b002b9e23025cemr1743884ljl.12.1690880046138;
        Tue, 01 Aug 2023 01:54:06 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id n7-20020a7bcbc7000000b003fe2120ad0bsm4869297wmi.41.2023.08.01.01.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 01:54:05 -0700 (PDT)
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
Subject: [PATCH v3 0/4] riscv: tlb flush improvements
Date: Tue,  1 Aug 2023 10:53:58 +0200
Message-Id: <20230801085402.1168351-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_015409_376057_83F9EACA 
X-CRM114-Status: GOOD (  10.99  )
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

Changes in v3:
- Add RB from Andrew, thanks!
- Unwrap a few lines, as suggested by Andrew
- Introduce defines for -1 constants used in tlbflush.c, as suggested by Andrew and Conor
- Use huge_page_size() directly instead of using the shift, as suggested by Andrew
- Remove misleading comments as suggested by Conor

Changes in v2:
- Make static tlb_flush_all_threshold, we'll figure out later how to
  override this value on a vendor basis, as suggested by Conor and Palmer
- Fix nommu build, as reported by Conor

Alexandre Ghiti (4):
  riscv: Improve flush_tlb()
  riscv: Improve flush_tlb_range() for hugetlb pages
  riscv: Make __flush_tlb_range() loop over pte instead of flushing the
    whole tlb
  riscv: Improve flush_tlb_kernel_range()

 arch/riscv/include/asm/tlb.h      |  8 ++-
 arch/riscv/include/asm/tlbflush.h | 12 ++--
 arch/riscv/mm/tlbflush.c          | 98 ++++++++++++++++++++++++++-----
 3 files changed, 99 insertions(+), 19 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
