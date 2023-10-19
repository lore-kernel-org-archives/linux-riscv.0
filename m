Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24E8CDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 14:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8y29Wb/2UM6IE43zKL1LUc5tSSAlVNeH7v2Wzmooz58=; b=FENcHenU0vRo8S
	LwIKc28f2D92sNHS1vU3ZNgeS3rIDDXyM5HJyRo4CYBVDqe10rCfxZqo1q8C+yqRVHqwtWZ/w+Jxa
	++cPlT9PDL68TeDx5hd94fzJwh9O5mxO3ygMMJERuw+g3Eb7O6A5wpb09AnL0yPebRh1HJQP9cC86
	BJu6SaIcIcei+gC4sg11K1fBXb8kqjdi8KjNABWJNZBotenOXd1MjEUGovKk9PN04z/WKdOmvCzw1
	vS0qfnV0GYWMvbiAleNJcKv+GA/coct3Z79ky4n+fpPqcUUWjB57OD+VZdS1kDhWUvlaoLQUJH/EL
	eJK2Gaz6ihsw6im6v3mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTbQ-00Hb4f-1M;
	Thu, 19 Oct 2023 14:02:20 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTbN-00Hb0J-0H
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 14:02:19 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32d9d8284abso5211923f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 07:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697724122; x=1698328922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dYapP8IUUxaJFtFuPCmZusI+AtIHAeMa/0OE5NMEm0Y=;
        b=KvVrow/sP68UhduD72qGfwXlrPKzHs/Txz1fSUw/yZbgqUKCANQkYHwl+TMm3jvBut
         xzyRwy+dsDh9aPDPaa2ZLPW2DoVBQ1O7jONgwUkvIJ50iD2MkrCm/U7zZxUaPTCrqUBZ
         xpHepa/xOWZ1PyuGSPihG6Dl+k2a+b73WARUeYsTMVN79d9Ruz+AUPEolv6yqf7ib7qu
         9CBH6y7IdpHKsfTUrpgoJn5TFMJlZZlk1prGVHllLAtGzOwtSsPFXOaWbZylsuqtawqZ
         cGkeMl/gUtwDdQ8BouyEQPYJkD1PLXAkMTy8EZSItz4FNAcZC2RUHaCtU9+272OcBOhZ
         mC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697724122; x=1698328922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYapP8IUUxaJFtFuPCmZusI+AtIHAeMa/0OE5NMEm0Y=;
        b=EABdXQMtAyao7awxg120q2JRvvL5WujF21hEKwYHzc0S1+EkHNzp/vDEdbuu092ElK
         Iy9wRmXhB+skB5j1Ry1cD0OWKpYL7V+Ksd7aZOl5n9eMBpH1phJlOxiy/F94u24EDKCr
         wD9D+nhYPEomHpLGkKs8yFkkFDTRAOeYqatoDK7b6QMDmqO3YtIQ2hj9iXhxybIH9zE6
         q/z5WU5jY6jV/WUfVXiJD0ja8h9SAvifNB0TQTdpofawXaQnDDKGLYt2UwDEVTG7Kv15
         wUwA5W/vbV41tr8zAHzWiB9ytVSYiP4AUsfkKLw3+oTUKPFlFUTT6v5593RKJsMDdWID
         Sxwg==
X-Gm-Message-State: AOJu0YwpJhffJzpa2TRiv4z14AlUkPD157cgoUYN8Iw8h4ycGiql2fXj
	hwgQvidQ/J6TFrjSSk1DmKnpKQ==
X-Google-Smtp-Source: AGHT+IHxfbIAtPpTWfqvyIaAWohPN03476Ru2wycW4vXZu6twctXJ/42I8ftrwVedoleNr+FF1TXMA==
X-Received: by 2002:a5d:4561:0:b0:32d:a827:d0fb with SMTP id a1-20020a5d4561000000b0032da827d0fbmr1817267wrc.27.1697724121113;
        Thu, 19 Oct 2023 07:02:01 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id b16-20020a056000055000b00326f5d0ce0asm4598711wrf.21.2023.10.19.07.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 07:02:00 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>,
	Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 0/4] riscv: tlb flush improvements
Date: Thu, 19 Oct 2023 16:01:47 +0200
Message-Id: <20231019140151.21629-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_070217_125348_36756221 
X-CRM114-Status: GOOD (  12.43  )
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

Changes in v5:
- Fix commit message s/flush_tlb/tlb_flush thanks to Samuel
- Simplify NAPOT mapping stride size handling, as suggested by Samuel
- Add TB from Prabhakar
- Add RB from Samuel
- Remove TB/RB from patch 2 as it changed enough

Changes in v4:
- Correctly handle the stride size for a NAPOT hugepage, thanks to Aaron Durbin!
- Fix flush_tlb_kernel_range() which passed a wrong argument to __flush_tlb_range()
- Factorize code to handle asid/no asid flushes
- Fix kernel flush bug where I used to pass 0 instead of x0, big thanks to Samuel for finding that!

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
  riscv: Improve tlb_flush()
  riscv: Improve flush_tlb_range() for hugetlb pages
  riscv: Make __flush_tlb_range() loop over pte instead of flushing the
    whole tlb
  riscv: Improve flush_tlb_kernel_range()

 arch/riscv/include/asm/sbi.h      |   3 -
 arch/riscv/include/asm/tlb.h      |   8 +-
 arch/riscv/include/asm/tlbflush.h |  15 ++-
 arch/riscv/kernel/sbi.c           |  32 ++----
 arch/riscv/mm/tlbflush.c          | 184 +++++++++++++++++++-----------
 5 files changed, 147 insertions(+), 95 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
