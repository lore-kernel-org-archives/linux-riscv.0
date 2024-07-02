Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3155C3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 08:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aJzvKjctF+n8rvkPioy4TjIF74zUnh5jzLoJGjw/aWs=; b=Auwhg3ayywNw8G
	aVNNhCgOBkczygAPKBROR54jRL62oyRYie10ucHq2i+mDZlGBp4VAsUIyZt9Eg7dEFzVGmoMWskZv
	Vrc3/WVqyOEKQ+Nyq43GDwQR9OVr5vG1UOA3oeA2PAbHvtl717ER3WJxpjgtABlhfdy0V+cTbr6qK
	fQ59dNwu8ljh0Bntr/mCqoIIwXa+LBX5Nf1konVcLyaNxJ/8XiBseFUQLpeCcfBs8Y1EzpAxoAovW
	4uzGafrXnGtQbhsIsEKWrWOs2IfTr+N8fG9KV/E4+NcaWw7UkOpq50AH8eVfg7UXelgb7iCWRz5p1
	Z89s6mxysmbyytn/qJYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZE4-0000000620R-1VkR;
	Tue, 02 Jul 2024 08:51:00 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZE0-000000061zz-3FpI
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 08:50:58 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-361785bfa71so2749721f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jul 2024 01:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719910255; x=1720515055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+xS1Bqi59c49E2PHWFY2Vpj6P66JYDOn9uI6CEb5XGw=;
        b=prCgHWsS2Cj3whx2BhxvfESrkC6HdS7IYj+WX9lNNTu/4FdohHBMPDQLCXk9jG7oZT
         yZEya36RXF7LEBtKnN1/AJyDXeg1w92A5pX+StBz75lkXvyQ7BX6h3Xbho7zTT3H3zR6
         xR+FCgmrrqpzzCRT5kisOPiwQH69dup7/F/FakveSNr025OL2mO0IF/jJXC32gOBe0fx
         CqZrWyA8HRWXrbIgc7SPY2dZmcCUBlRS7aePiv5ohQIIe7hVtPJtgl/qbpTj4aXMD6bg
         uqWcgqAewP5qmc6Fp7UV/9YscCBppPLCRxgTyWr5hcYypqEWtqbcY0N+ZbBgVMBtSHr9
         KkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719910255; x=1720515055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xS1Bqi59c49E2PHWFY2Vpj6P66JYDOn9uI6CEb5XGw=;
        b=SWZFFJjoK++Qm7OYKmHlTLuuntbJNjGglq3bXP5iLAa+SaeFo2bbjqBo1JlCAZmPUc
         iBMobKFewYKPbsKS3BPjjfH4RBJGK2gR0fM2yztiLWr+ZwiNsbJsCDOZ9R9OILrmvntY
         daZQWW5JZceLMNSwbAxU2B2GaTXcroc2tvGh5+ZL+tlItR8/WHfKVX5bZ5y+E+U6h7h5
         aEE55scaQDkR1N3F9rSFR9++jPocpd8zImWz2JbZrWTyONjvuB30VSPAnlyTxOhMD4EH
         HrzxK4rXmau0NNOJBvDClFivMtDDFJkvrDplzoQjmWRbqLKEdYe6Ubl3LOaq8BvjZj6Q
         e0xg==
X-Forwarded-Encrypted: i=1; AJvYcCV+AQtj8aha35ySOitDUbLNqVTbcIAlDFEM7ty1z9e9JC/e//UG4n9idLId5oKee2UXV2umWzsjKe0G8IbpzYU5a9u5KHJdhpjmZ2VDwA5H
X-Gm-Message-State: AOJu0Yz+2wsspGtDDL+XYvP2rOWSvW82tkgwTs3AcoAduSZu2x9TC8y9
	754p7KcugQ9dP/+HeETw3R+C9a+e/zPtx2l1MKAtN8XK69oaeeoZnTe8WmNsxzs=
X-Google-Smtp-Source: AGHT+IEGKjdmwTLWZQHNUg3WoGX6FwM1wWssxVPjJRPeaKNE2FUT9N5nuel7WS5lK14l4cEdRt8FFQ==
X-Received: by 2002:adf:f80d:0:b0:366:e838:f5d4 with SMTP id ffacd0b85a97d-36775699f64mr5125514f8f.3.1719910254746;
        Tue, 02 Jul 2024 01:50:54 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a1055b9sm12499800f8f.95.2024.07.02.01.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 01:50:54 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 0/4] Svvptc extension to remove preventive sfence.vma
Date: Tue,  2 Jul 2024 10:50:30 +0200
Message-Id: <20240702085034.48395-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_015057_035574_8E5FA963 
X-CRM114-Status: GOOD (  17.85  )
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

In RISC-V, after a new mapping is established, a sfence.vma needs to be
emitted for different reasons:

- if the uarch caches invalid entries, we need to invalidate it otherwise
  we would trap on this invalid entry,
- if the uarch does not cache invalid entries, a reordered access could fail
  to see the new mapping and then trap (sfence.vma acts as a fence).

We can actually avoid emitting those (mostly) useless and costly sfence.vma
by handling the traps instead:

- for new kernel mappings: only vmalloc mappings need to be taken care of,
  other new mapping are rare and already emit the required sfence.vma if
  needed.
  That must be achieved very early in the exception path as explained in
  patch 3, and this also fixes our fragile way of dealing with vmalloc faults.

- for new user mappings: Svvptc makes update_mmu_cache() a no-op but we can
  take some gratuitous page faults (which are very unlikely though).

Patch 1 and 2 introduce Svvptc extension probing.

On our uarch that does not cache invalid entries and a 6.5 kernel, the
gains are measurable:

* Kernel boot:                  6%
* ltp - mmapstress01:           8%
* lmbench - lat_pagefault:      20%
* lmbench - lat_mmap:           5%

Here are the corresponding numbers of sfence.vma emitted:

* Ubuntu boot to login:
Before: ~630k sfence.vma
After:  ~200k sfence.vma

* ltp - mmapstress01
Before: ~45k
After:  ~6.3k

* lmbench - lat_pagefault
Before: ~665k
After:   832 (!)

* lmbench - lat_mmap
Before: ~546k
After:   718 (!)

Thanks to Ved and Matt Evans for triggering the discussion that led to
this patchset!

Any feedback, test or relevant benchmark are welcome :)

Changes in v3:
- Rebase on top of 6.10
- Remove the comment about xRET acting as a fence which is not part of
  the ratified specification
- Add #sfence.vma to the cover letter (Andrea)
- Remove the RFC as svvptc was ratified the 28th of June 2024

Changes in v2:
- Rebase on top of 6.8-rc1
- Remove patch with runtime detection of tlb caching and debugfs patch
- Add patch that probes Svvptc
- Add patch that defines the new Svvptc dt-binding
- Leave the behaviour as-is for uarchs that cache invalid TLB entries since
  I don't have any good perf numbers
- Address comments from Christoph on v1
- Fix a race condition in new_vmalloc update:

       ld      a2, 0(a0) <= this could load something which is != -1
       not     a1, a1    <= here or in the instruction after, flush_cache_vmap()
                            could make the whole bitmap to 1
       and     a1, a2, a1
       sd      a1, 0(a0) <= here we would clear bits that should not be cleared!

   Instead, replace the whole sequence with:
       amoxor.w        a0, a1, (a0)


Alexandre Ghiti (4):
  riscv: Add ISA extension parsing for Svvptc
  dt-bindings: riscv: Add Svvptc ISA extension description
  riscv: Stop emitting preventive sfence.vma for new vmalloc mappings
  riscv: Stop emitting preventive sfence.vma for new userspace mappings
    with Svvptc

 .../devicetree/bindings/riscv/extensions.yaml |  7 ++
 arch/riscv/include/asm/cacheflush.h           | 18 +++-
 arch/riscv/include/asm/hwcap.h                |  1 +
 arch/riscv/include/asm/pgtable.h              | 16 +++-
 arch/riscv/include/asm/thread_info.h          |  5 ++
 arch/riscv/kernel/asm-offsets.c               |  5 ++
 arch/riscv/kernel/cpufeature.c                |  1 +
 arch/riscv/kernel/entry.S                     | 84 +++++++++++++++++++
 arch/riscv/mm/init.c                          |  2 +
 arch/riscv/mm/pgtable.c                       | 13 +++
 10 files changed, 150 insertions(+), 2 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
