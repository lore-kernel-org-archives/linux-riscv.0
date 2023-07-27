Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F79FC001DC
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 18:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iPgyuaMro6nugvXOfNACY2znqEiMlSvW2Z3VhfrPDMk=; b=p68NMqIiPY07k/
	UV/y51Yr4gXCamJNkAkTT7K3P5rq4ya0j6NTJQkuhIWoLRcoDM/BiivJmgXMj10U9HC7mzQ4cPIvB
	y+0qDBEyi2PPZEgNlt0N3kC2xKvlq6SBLZOL5ev+miE/A7PzpzJ48BGldQoZUdmSEVKagkjO26cjf
	vLylJ2z/sRZs9BDJD3L4XoZMWrH/3IV+bsDhNIC/nIpdmELRWCJRK+1ahA0GQNvPCea+wdHjSB2Cd
	7QQUO0x9rfo/q3zdBilrIPYeg43+zndLC3XD4YWK8KshM7Sgq5/2rk7fwBY2do5LJ5ERrV2uZJEQH
	v41pwuMs3IHYIDP8j0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP69e-000Dp7-2t;
	Thu, 27 Jul 2023 18:56:06 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP69b-000DZz-0O
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 18:56:04 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbef8ad9bbso14737045e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 11:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690484161; x=1691088961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5FhI2SLAGzFPgM0XDlLYh3qjUrSBQmA+KXnizzmLufc=;
        b=UEbP1zqhCFEiTaUL5idLu7vKPg1UFl76YwNFzxk+gTjDjuwDufCyOxWIareE7LpI7M
         hQcy4WocH73NHpscnoUE2uao5LPwfT3On28WKOhhuLLnmQgK8lo4dVzqOTGjTi33ALg6
         c0/7py79DrKXQQpO35r81d4LEai/ijN+47oqcZVg/oTep4drF+adrfWVrIMhYBBmOwwW
         qxvwQ4vQ6q+8AyNVn3Mh2geRJmizY2Xeum0eYyg0CTL4wZVWTEVTg/SJ7yek42Ifpb1Q
         vGQsJgw6HlMmZSxtyxv3qNun490/7QiQpcxjaTP1yWWjQtpMhCI8ZcM2CMV4nQfYfzYr
         FQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690484161; x=1691088961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5FhI2SLAGzFPgM0XDlLYh3qjUrSBQmA+KXnizzmLufc=;
        b=iY0TBry9C8D7ZO4iCqexRdQcQmbK13/halameb9JZ7nbx6+GNFtQMJJozwIu2MDgIp
         kuDKF51kLgZzQEHxw3nWCCPoA7MH7Hoiv2mdizPCQn8AWIG8QR8n6eFmWSsCOYqHO9su
         VJDouLnA5Fwsss3R+yLKSYz5IpS5vVR+BS7v6aStcvSjCc0CYJ6v5CsnqxrVopcke7Pm
         6g2XLYrXXG0JWiY5erHPP/aJ85HyQHPRRdpqD+k5vGnReldLO5VfW+2LNZ3XI46ehHsL
         X7lt8CjJ1amgUBqyAPmIEKjF5+0eLcSxJt3Bt1HdtL7ULzyNuWefHI1uQ1ExYzbGgiQL
         yFSQ==
X-Gm-Message-State: ABy/qLYesWaRwo+OvFd+Zu7K3K7Qqt4oqGl2C9GmNsuIKI04CFkbtwQ0
	F7xVOymttt/e8ImSayhS4JyLVw==
X-Google-Smtp-Source: APBJJlEReV5Op3Esz4H3z1WgrD5RqflHv8MjR+KBErCwj/H8fcva/UlqbpkT+CFwmLCi+oxSnh262A==
X-Received: by 2002:a05:6000:11cc:b0:317:7af4:5297 with SMTP id i12-20020a05600011cc00b003177af45297mr4780wrx.62.1690484161377;
        Thu, 27 Jul 2023 11:56:01 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id u13-20020a5d514d000000b003172510d19dsm2754302wrt.73.2023.07.27.11.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 11:56:00 -0700 (PDT)
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
Subject: [PATCH v2 0/4] riscv: tlb flush improvements
Date: Thu, 27 Jul 2023 20:55:49 +0200
Message-Id: <20230727185553.980262-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_115603_380072_9808D04D 
X-CRM114-Status: UNSURE (   9.64  )
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
 arch/riscv/mm/tlbflush.c          | 93 +++++++++++++++++++++++++++----
 3 files changed, 96 insertions(+), 17 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
