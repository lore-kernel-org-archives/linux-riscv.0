Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13887EE7FF4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZtriB81gUGGB0tLRdnzy4F9n1R1Zx3taMqCyMfOWU5Q=; b=nKkKEpACH/HM12
	0QlKdPWKuKKTWVXONVgFFk4s9xFPrh0dk2PmQgLbt33cjJB6BxWNP/b2scg8b7XIr1lBykJdGQsSF
	61ZZ3AHRiNI4R7GO/dHnswbnV/wAQV/gAJw3HFEvhdiF7V7P789Nvh/E4DBjMNAAPRHXoq+bgaCIU
	O/qH3ycFWvNmCqUWVfzlahCuLrp6J5LCxMfmfTMGtGFD9k1fywRlYUQV5ujYtOvyCzA2st24bcQLY
	NAso2iafoP3xVl5Yo4npi88n7nVgNU2sbdEBalcZxrmPwixkWXC7+iMLnAU5n/AOadyKl7Tqy9+nI
	7So5laXDzw2NgoYABx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgiS-000ZlK-1z;
	Mon, 11 Sep 2023 13:12:36 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgiN-000Zjy-2W
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 13:12:34 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31f4a286ae1so4104922f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 06:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694437947; x=1695042747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YAch9/9+1yvRN3ndGGQdZRoEnDN1q2q/b1WTFSVL2jQ=;
        b=Kap1rWteufwQDs8GRFGwNWOnTObalSIK+gFlNPfYLZ2lFhGfB6MmBhUS6/xNt2CRug
         fF8JUROd55uS9iJFYjUXNn1HrDQSkN7oQmEuBbGY5wY/rM+v4MnL5zb9yl4mQtdtRFcE
         ysgi48dCMWGmSOcl3GB0Z+gEcWSNRrF1l37N3di1nA6dEVHCH4Bpoas8eUya22nk1XjD
         RqIrUULSuYP65FGX631RrfJhAdM4pWMy0T1jNUaKfo2Sxy5/a5fohCSL8zd0Tu04Gqxw
         TgQV64GFiTAMXeMeIzcNvVEcvWQojzb0KvxA8u1CBdkrwHwNhTOAyQamdy7RYjmUHz93
         Mnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694437947; x=1695042747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAch9/9+1yvRN3ndGGQdZRoEnDN1q2q/b1WTFSVL2jQ=;
        b=Zv5wn6ryuRAxdPP+bZ+GBkkjsa8ZtU4iA+Ky+FhxAQfsM1qP4Tu6hUrAJjhi1N+OFl
         Kf+pWUUHZJwoG0H+Ba4cBVSXaKRYjdXo3O+WKc8gk1DjtMqchQK5R+a/VFfDKAi6t4a/
         YXCD/37iGRPISZGNyN1e3XBwSX+6JtyJ5wVjwFJjPpYh04gYztfpT1TVUwaZVkpbZ29F
         T3KhjWzz8blWyEeXzIY+GYtAdlMBeEos6CBSwbIz3DE5yrDyxwyn+sVMVFXbbeYSfUrV
         JVQPYUW0Nz0nHoVhlUtahX3uPg2H0jmpfrS6fPYqWXejWnJYhNPj0v5kfSAzChyOeviC
         JP2A==
X-Gm-Message-State: AOJu0Yy3jvKeGs5CTJSFFkIwKnEWuXQlP/JJ4ZfoY0k1cqx6Qu0Obkbg
	6UV20Obv6bdf7TLHQiqdcu6cEA==
X-Google-Smtp-Source: AGHT+IEo8vfSE/53LIIg4K2AfasH/DaM1jP5FLSKYkUJRorFSpro0cfH84Iowld11wYazbHz32ri/Q==
X-Received: by 2002:a05:6000:1101:b0:317:650e:9030 with SMTP id z1-20020a056000110100b00317650e9030mr7641721wrw.57.1694437946629;
        Mon, 11 Sep 2023 06:12:26 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id r17-20020adfce91000000b003198a9d758dsm10104895wrn.78.2023.09.11.06.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 06:12:26 -0700 (PDT)
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
Subject: [PATCH v4 0/4] riscv: tlb flush improvements
Date: Mon, 11 Sep 2023 15:12:20 +0200
Message-Id: <20230911131224.61924-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_061232_039241_B956C214 
X-CRM114-Status: GOOD (  11.57  )
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
  riscv: Improve flush_tlb()
  riscv: Improve flush_tlb_range() for hugetlb pages
  riscv: Make __flush_tlb_range() loop over pte instead of flushing the
    whole tlb
  riscv: Improve flush_tlb_kernel_range()

 arch/riscv/include/asm/sbi.h      |   3 -
 arch/riscv/include/asm/tlb.h      |   8 +-
 arch/riscv/include/asm/tlbflush.h |  15 ++-
 arch/riscv/kernel/sbi.c           |  32 ++---
 arch/riscv/mm/tlbflush.c          | 192 ++++++++++++++++++++----------
 5 files changed, 155 insertions(+), 95 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
