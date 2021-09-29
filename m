Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51731C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 14:52:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01CFC61440
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 14:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01CFC61440
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tsi94cLj8cXACUIEMgYFNqezZsRI45XOZBiPXETkVIE=; b=vPQUu1X4utHbRo
	jLqc3NdhCfKF19O21k/+lcSRW+fPDM9xNy2IKYpjkoTti5d+NPXda4CZDMC/9fCL53Es8EHhxTn4v
	zkDLBbdBqFk38pOizJOg8pGQ3Q4uBZnf8hBYiwqGVD6UC2rkW8RoBOeZUB8wiBvSkpWpEfiX14GAz
	r08s4ilg8z2EPMcijFri3IfEAfQ35aFf9EC0HLYdFLkzvm0PKO9rzSLs5jJkCXJAf9uKsBVxawFNw
	5i/bAlmFgUNDyst6mXe5u6khKc+LLdejeESo26n459TI4FU8SELgTcg7j2/jPaGqIt21anpqN8Ny3
	PRInuYYDCulZbZDh00lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVaw6-00BOg9-DI; Wed, 29 Sep 2021 14:51:54 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVaw3-00BOe4-Lp
 for linux-riscv@lists.infradead.org; Wed, 29 Sep 2021 14:51:53 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9B12F3F4BE
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 14:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632927104;
 bh=/TquUrfUmr5oNmyuO1+Qsp/eD8gniIfYD04SJchk9B4=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=V+g7psqsOYFC+4GlNHvbk+DARbf4ut8lJYDd7jPfLyrEVq+D+kCwdbb1rPyWkprB1
 6pbF8D9f681KfsJk9We/0Kd6V5qOZMfToTrLr0rAv68xbyiYLkJ7VOOYUGJd3GMQP+
 ibLXdCNkUMmRqeSZnJywCj3KVzxszoeSkBR7Dr7Nn+JSA+ZeHFhowbFCMqbj+11sWr
 mFC7PocWED16ih/RuOPQ6+q+1nioTFftWN9vWnNVarPAyAK1rpLza+b9Jo37zefOzJ
 unaPfvkCANtvbAMNz6QnwNPSnknuFJeruFyvjTAiSTZ/YB5Xxvu8xQeoju+xCsk4Os
 B+hLAwzX+zp7A==
Received: by mail-wm1-f71.google.com with SMTP id
 p63-20020a1c2942000000b0030ccf0767baso2810661wmp.6
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 07:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/TquUrfUmr5oNmyuO1+Qsp/eD8gniIfYD04SJchk9B4=;
 b=6BvvPGfAaBJSWjlwSdLhSkAAxqzM1+tq8s+5sxvm6oSJnYPJ6cV4lTn43tyipj3wkS
 /lpfiqrnNdlP6tifvYa3nwrmC6KPLw6oPziGw+qddRuddHkkiVgrreeGEmW6dA/s15jo
 MRQklEnSpsbJAuqcT6TYzFkIJjVp/dljVGEX13Q9cYWIgmeurOUma+ImZY/C5EfIwjtN
 jekAjvoXbPXmwezigoG/+/2hNoqqdtPAcOs1+7gfhorlJAfEmIDjWVO0eu5j5fqzZv5M
 hx8WKQfe5FGPKBZY28ka48zDR9QpGxnISJGMfe3oi3ZVIcKT7VjI0q7s3Tnfm4amnkaV
 NZQg==
X-Gm-Message-State: AOAM533Fa2gU8Th0CS5CBRsOzoJq3YS55pGyxXhTmL5Ru72n3gwN/eVZ
 lh9JGDNHJQV9byi9xYbrLpedqefBZ5ieZVb667YrE8u0vETGkKAb5dcIFo5FXb0wL9fkvzVe5zn
 0VPSe9XEnc8/5nUrkI2eg+RVCsrp0oQuVQKrTgjFCESrLLA==
X-Received: by 2002:a05:600c:4e86:: with SMTP id
 f6mr11084961wmq.52.1632927093809; 
 Wed, 29 Sep 2021 07:51:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy9Wf93oel0uFuiz+G/bu4P6jRU9wFw42uTqgvwTyHqxhPmb9DM6m0bHj2SXFqePSIfq7jLA==
X-Received: by 2002:a05:600c:4e86:: with SMTP id
 f6mr11084945wmq.52.1632927093654; 
 Wed, 29 Sep 2021 07:51:33 -0700 (PDT)
Received: from alex.home (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id q7sm129478wrc.55.2021.09.29.07.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 07:51:33 -0700 (PDT)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@wdc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
 linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v2 00/10] Introduce sv48 support without relocatable kernel 
Date: Wed, 29 Sep 2021 16:51:03 +0200
Message-Id: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_075151_874270_80ED4501 
X-CRM114-Status: GOOD (  16.65  )
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

This patchset allows to have a single kernel for sv39 and sv48 without           
being relocatable.                                                               
                                                                                 
The idea comes from Arnd Bergmann who suggested to do the same as x86,           
that is mapping the kernel to the end of the address space, which allows         
the kernel to be linked at the same address for both sv39 and sv48 and           
then does not require to be relocated at runtime.                                
                                                                                 
This implements sv48 support at runtime. The kernel will try to                  
boot with 4-level page table and will fallback to 3-level if the HW does not     
support it. Folding the 4th level into a 3-level page table has almost no        
cost at runtime.                                                                 
                                                                                 
Tested on:                                                                       
  - qemu rv64 sv39: OK                                                           
  - qemu rv64 sv48: OK                                                           
  - qemu rv64 sv39 + kasan: OK                                                   
  - qemu rv64 sv48 + kasan: OK                                                   
  - qemu rv32: OK                                                                
  - Unmatched: OK                                                                
                                                                                 
Changes in v2:                                                                   
  - Rebase onto for-next                                                         
  - Fix KASAN                                                                    
  - Fix stack canary                                                             
  - Get completely rid of MAXPHYSMEM configs                                     
  - Add documentation

Alexandre Ghiti (10):
  riscv: Allow to dynamically define VA_BITS
  riscv: Get rid of MAXPHYSMEM configs
  asm-generic: Prepare for riscv use of pud_alloc_one and pud_free
  riscv: Implement sv48 support
  riscv: Use pgtable_l4_enabled to output mmu_type in cpuinfo
  riscv: Explicit comment about user virtual address space size
  riscv: Improve virtual kernel memory layout dump
  Documentation: riscv: Add sv48 description to VM layout
  riscv: Initialize thread pointer before calling C functions
  riscv: Allow user to downgrade to sv39 when hw supports sv48

 Documentation/riscv/vm-layout.rst             |  36 ++
 arch/riscv/Kconfig                            |  35 +-
 arch/riscv/configs/nommu_k210_defconfig       |   1 -
 .../riscv/configs/nommu_k210_sdcard_defconfig |   1 -
 arch/riscv/configs/nommu_virt_defconfig       |   1 -
 arch/riscv/include/asm/csr.h                  |   3 +-
 arch/riscv/include/asm/fixmap.h               |   1 +
 arch/riscv/include/asm/kasan.h                |   2 +-
 arch/riscv/include/asm/page.h                 |  10 +
 arch/riscv/include/asm/pgalloc.h              |  40 +++
 arch/riscv/include/asm/pgtable-64.h           | 108 +++++-
 arch/riscv/include/asm/pgtable.h              |  30 +-
 arch/riscv/include/asm/sparsemem.h            |   6 +-
 arch/riscv/kernel/cpu.c                       |  23 +-
 arch/riscv/kernel/head.S                      |   4 +-
 arch/riscv/mm/context.c                       |   4 +-
 arch/riscv/mm/init.c                          | 323 +++++++++++++++---
 arch/riscv/mm/kasan_init.c                    |  91 +++--
 drivers/firmware/efi/libstub/efi-stub.c       |   2 +
 include/asm-generic/pgalloc.h                 |  24 +-
 include/linux/sizes.h                         |   1 +
 21 files changed, 615 insertions(+), 131 deletions(-)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
