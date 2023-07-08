Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD075C001DE
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Jul 2023 01:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MezI3WHTvZFcriQj6vtf5otC16BWvdA8RW/qWAgU1Yo=; b=qiOmd6U/jC3TIn
	AUhRf63lGZdsIUZki9sUvjARPIE4kqUtRKa38Cdwivvpfuv/UmVuMxBO/J6agmYTv5zxMsw8aPeHg
	OAVev6jzI5MaqaGbrZjNCliJqpCZKpuKHlZMjmCCeRmFxYtyZWaTGvTb5yhC9QWgTnoVz8MVjPuDw
	bcHa4pjkLIcCJ+7fHcs0Jmwp4lrQVJCOFQPxclRRrdvHrRI4mFZkL4o7Liq1LUPl1puvFhdcVNf2G
	o8nlV9AqzivXqXG2pevD5MMO6uQdH6qfRbRiWJ+aZM+8jdQyIC2l8C06af4Iu/ILPZNVNd0NAGGCr
	2UHtio3i4wnPO5m4xapQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHwUo-006DkK-2q;
	Sat, 08 Jul 2023 01:12:22 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHwUl-006DeX-14
	for linux-riscv@lists.infradead.org;
	Sat, 08 Jul 2023 01:12:21 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b8b318c5cfso16872185ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jul 2023 18:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688778731; x=1691370731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hG/AQXuxFAN1krhx66y6oqNvLxTmXg3B48rFR/wju6k=;
        b=kSdi/rNNNHfMSpMFIlfOp/mOBJADnhFaAkk66ucVjag4lVze23mZCljnN+xyusXAE6
         uwi+Cq9yHV8Xj1AjwIfBaestAxuDhlSvML5JIt51GA0wKM7W21y+lYcRF4pZHqSVfbHX
         kmLPAFzBPN3Le+mo2dUUh4iy5dqdffKDbShbJ6jD6thbA18ssPldJ1ftLXv0aVtbzLQH
         TKFlwOixvLICPJGYOuUyJ3onYj6xf+6ObnIn6JGO3uDdE2/T4PAkD57OnrAqIEoeFH1+
         uUaTIeoPDPz1mdI5fua3omzz/1t0033c4GVajNsi4GqNXKBlUYF+Hc7pLj5490GIGTga
         shYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778731; x=1691370731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hG/AQXuxFAN1krhx66y6oqNvLxTmXg3B48rFR/wju6k=;
        b=OD0ZzJb+vYzvX5vB9xdD7elePbASm0aLa+qJHIwKoyiEXX7rtmcubGIhod8zU4K5cp
         QTSZgGDeyoHgNOAK5jLGm+nBcUm+0OMUgrVVRWylC4tcv2vPFlaJdgOMTRu7kju3fVpJ
         jeDSnln12IvgzG0m9xbOavLnhQU3378UV0+Q+QwMTrz+rDbjrQfGkydhxPs+PqRuK4f/
         GUNWAofhTsq8+FeXjr+4exLX4o13bwmXpqtmBx1P3EPJ3IbzzwJcOAKTtmDE53kms4vX
         Ksn6TYQgy1QEOzzmAXdtCuNrCOH2eDAA+FSl7maXKJ/bIeASd9GvuGgY8H2qPza0Qt89
         U8gw==
X-Gm-Message-State: ABy/qLbijEU7Eduq2lC96In7iWg4pV1dxp9Uet6oiCzOqAUR+0wtpFuK
	LB4ogbGWv1NWEZ6MMwRmWP/8Zx6qid240lEM+iA=
X-Google-Smtp-Source: APBJJlEfIeSIG6gg4bQuj7jzvSYRUPZTMB4e5Z3mxa32edquCBC5onRLyiJegqwpT1yjoKYrnzvs8g==
X-Received: by 2002:a17:902:eacc:b0:1b8:ae12:5610 with SMTP id p12-20020a170902eacc00b001b8ae125610mr6450652pld.7.1688778731557;
        Fri, 07 Jul 2023 18:12:11 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id x24-20020a170902b41800b001b87d3e845bsm3830654plr.149.2023.07.07.18.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 18:12:10 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: charlie@rivosinc.com,
	conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@rivosinc.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	konstantin@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	mick@ics.forth.gr,
	jrtc27@jrtc27.com,
	rdunlap@infradead.org
Subject: [PATCH v4 0/4] RISC-V: mm: Make SV48 the default address space
Date: Fri,  7 Jul 2023 18:11:31 -0700
Message-ID: <20230708011156.2697409-1-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_181219_364922_0B33CBEA 
X-CRM114-Status: GOOD (  11.02  )
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

Make sv48 the default address space for mmap as some applications
currently depend on this assumption. Also enable users to select
desired address space using a non-zero hint address to mmap. Previous
kernel changes caused Java and other applications to be broken on sv57
which this patch fixes.

Documentation is also added to the RISC-V virtual memory section to explain
these changes.

-Charlie

---
v4:
- Split testcases/document patch into test cases, in-code documentation, and
  formal documentation patches
- Modified the mmap_base macro to be more legible and better represent memory
  layout
- Fixed documentation to better reflect the implmentation
- Renamed DEFAULT_VA_BITS to MMAP_VA_BITS
- Added additional test case for rlimit changes
---

Charlie Jenkins (4):
  RISC-V: mm: Restrict address space for sv39,sv48,sv57
  RISC-V: mm: Add tests for RISC-V mm
  RISC-V: mm: Update pgtable comment documentation
  RISC-V: mm: Document mmap changes

 Documentation/riscv/vm-layout.rst             |  22 +++
 arch/riscv/include/asm/elf.h                  |   2 +-
 arch/riscv/include/asm/pgtable.h              |  21 ++-
 arch/riscv/include/asm/processor.h            |  43 +++++-
 tools/testing/selftests/riscv/Makefile        |   2 +-
 tools/testing/selftests/riscv/mm/.gitignore   |   1 +
 tools/testing/selftests/riscv/mm/Makefile     |  21 +++
 .../selftests/riscv/mm/testcases/mmap.c       | 133 ++++++++++++++++++
 8 files changed, 232 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/mm/.gitignore
 create mode 100644 tools/testing/selftests/riscv/mm/Makefile
 create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap.c

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
