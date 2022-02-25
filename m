Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EE7C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Feb 2022 12:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3QWFP1KFUTTa745XTeRWDk6DXJvlXkW+R3/jcjBQO9s=; b=Sc7vyaRo1s6q3E
	N5QpC57mXxlTtQOZ8oSDd5dVv34xwF7XGT7fCXH8A8UxRsXAGNAqDDIXEdtKntcB3qnLjHJRJJ9jD
	+b48D8b0X2mJl/9VOTsqbEGIPABH/lsXPluWvsMfuXPnHKAiqvgjDhoycZa8gt7ZGDwr8SqiY6Dnv
	j1AIBWDf74NTBrKMnjiqrJhA84P5iFdulEE6alfFYKQLepIx16ENaWDvUtVDcebIWarAi7hsBKQwu
	th17vRfItPwWQ6Wk4fH4UZ7tShOzHsdHGuVL8OQ7SQzXRkOOBj1SVdMUUDbcd7AyLFUxWt3xQakSH
	RKbhOQ1xusZqb92E2Agw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNZtJ-004sUR-To; Fri, 25 Feb 2022 12:40:09 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNZtG-004sTP-Vz
 for linux-riscv@lists.infradead.org; Fri, 25 Feb 2022 12:40:08 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A97823FCA9
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 12:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645792797;
 bh=HCBpo4PsqJUx1yHp1r7/10LuebIPFGAh3ml+5ybdqeU=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=bjt6hy1G+KXwuPQ7NJSHRNhqfGQTCqO17qOhRBwYM4J+6nknLKWxlgjmbCI5tVH6b
 9Eqen2yWdwoNigzIQOgNXLX4za8BwzxnKcO0CLGH17aONXEhgukPW0DNbPhQpICKy2
 x9FwoaxCzrd98nkQlhXTs3RO30s4zaa0snTV+r+Umfb0qNsqtaeT64TJ5TZuZK9B3N
 KgDuy7BJ0RLwlmN2xt0MUk+gHkWamR0DwAloDIuGrOu9yDNF2mScIHuX3pD+hjr433
 xCc/rv6iMizPK7poKnXPudq9AFfeY0PKyq1bmA5Thz/3pLWhvfC/I+Ai8XHBBigZSR
 2qQWAb77/p8ow==
Received: by mail-wr1-f71.google.com with SMTP id
 e26-20020adfa45a000000b001ea860cd35cso859094wra.4
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 04:39:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HCBpo4PsqJUx1yHp1r7/10LuebIPFGAh3ml+5ybdqeU=;
 b=e2F8Xo2dDhrJQw1eUj38wwls400KjiBfA1EW0h/WosHcaCCA805xNgPV+HhsGb0UMZ
 PlmMhJ64y1TLj3rlLAjJEoePeFvEHIByNZEIZe5a30YwPFn0nrYEVvEO8GXO+Kh3PUvB
 FdXAjfgWEEjFk1Rawd9cDtAzs+U/f+BLMWwqBg9pkmWphn6Mim/PavAQgjPO6yHAIFf+
 /pJfoiJibluyCXnDMWW9wkxq4nmUZHlnpAzdr2z3SIuFOktf41FaMayqyKl7ijIO26D6
 JCblC98sKPrE5ZlpqolhoknYPMVVq0NpeuOjiA2MpeDnREQYfemAGcHutNCXhdzAISLV
 6png==
X-Gm-Message-State: AOAM530x9hreVIjFSIEzPCIXzFnsJ6N9S6+8zI3j6qD74k1xj/0GZ2CH
 Nr/Xtu3yUkDmJaMupNZxWnSrjGDeZXz82wE8hTIzgyhbX5vIwZyCN8M+kESKw45Ts8QlhH/3kgh
 H2fvBRzaN0GCl0/eNJHmS3O+67/SBTAevbZpN+19aQhaP/w==
X-Received: by 2002:a05:600c:4e8d:b0:37c:4e20:baa6 with SMTP id
 f13-20020a05600c4e8d00b0037c4e20baa6mr2571092wmq.19.1645792796220; 
 Fri, 25 Feb 2022 04:39:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9QofFekuLpagTizNm0Nvue0YJrwM7JnOms0+vyselmIfyGv4HfSWC7mWt/qp/V+q7KV98Kw==
X-Received: by 2002:a05:600c:4e8d:b0:37c:4e20:baa6 with SMTP id
 f13-20020a05600c4e8d00b0037c4e20baa6mr2571082wmq.19.1645792796034; 
 Fri, 25 Feb 2022 04:39:56 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1]) by smtp.gmail.com with ESMTPSA id
 m1-20020adfdc41000000b001edb7520438sm2216981wrj.115.2022.02.25.04.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 04:39:55 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Aleksandr Nogikh <nogikh@google.com>, Nick Hu <nickhu@andestech.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: [PATCH -fixes v3 0/6] Fixes KASAN and other along the way
Date: Fri, 25 Feb 2022 13:39:47 +0100
Message-Id: <20220225123953.3251327-1-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_044007_191773_4BAAD28F 
X-CRM114-Status: GOOD (  13.78  )
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

As reported by Aleksandr, syzbot riscv is broken since commit
54c5639d8f50 ("riscv: Fix asan-stack clang build"). This commit actually
breaks KASAN_INLINE which is not fixed in this series, that will come later
when found.

Nevertheless, this series fixes small things that made the syzbot
configuration + KASAN_OUTLINE fail to boot.

Note that even though the config at [1] boots fine with this series, I
was not able to boot the small config at [2] which fails because
kasan_poison receives a really weird address 0x4075706301000000 (maybe a
kasan person could provide some hint about what happens below in
do_ctors -> __asan_register_globals):

Thread 2 hit Breakpoint 1, kasan_poison (addr=<optimized out>, size=<optimized out>, value=<optimized out>, init=<optimized out>) at /home/alex/work/linux/mm/kasan/shadow.c:90
90		if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
1: x/i $pc
=> 0xffffffff80261712 <kasan_poison>:	andi	a4,a0,7
5: /x $a0 = 0x4075706301000000

Thread 2 hit Breakpoint 2, handle_exception () at /home/alex/work/linux/arch/riscv/kernel/entry.S:27
27		csrrw tp, CSR_SCRATCH, tp
1: x/i $pc
=> 0xffffffff80004098 <handle_exception>:	csrrw	tp,sscratch,tp
5: /x $a0 = 0xe80eae0b60200000
(gdb) bt
#0  handle_exception () at /home/alex/work/linux/arch/riscv/kernel/entry.S:27
#1  0xffffffff80261746 in kasan_poison (addr=<optimized out>, size=<optimized out>, value=<optimized out>, init=<optimized out>)
    at /home/alex/work/linux/mm/kasan/shadow.c:98
#2  0xffffffff802618b4 in kasan_unpoison (addr=<optimized out>, size=<optimized out>, init=<optimized out>)
    at /home/alex/work/linux/mm/kasan/shadow.c:138
#3  0xffffffff80260876 in register_global (global=<optimized out>) at /home/alex/work/linux/mm/kasan/generic.c:214
#4  __asan_register_globals (globals=<optimized out>, size=<optimized out>) at /home/alex/work/linux/mm/kasan/generic.c:226
#5  0xffffffff8125efac in _sub_I_65535_1 ()
#6  0xffffffff81201b32 in do_ctors () at /home/alex/work/linux/init/main.c:1156
#7  do_basic_setup () at /home/alex/work/linux/init/main.c:1407
#8  kernel_init_freeable () at /home/alex/work/linux/init/main.c:1613
#9  0xffffffff81153ddc in kernel_init (unused=<optimized out>) at /home/alex/work/linux/init/main.c:1502
#10 0xffffffff800041c0 in handle_exception () at /home/alex/work/linux/arch/riscv/kernel/entry.S:231


Thanks again to Aleksandr for narrowing down the issues fixed here.


[1] https://gist.github.com/a-nogikh/279c85c2d24f47efcc3e865c08844138
[2] https://gist.github.com/AlexGhiti/a5a0cab0227e2bf38f9d12232591c0e4

Changes in v3:
- Add PATCH 5/6 and PATCH 6/6

Changes in v2:
- Fix kernel test robot failure regarding KERN_VIRT_SIZE that is
  undefined for nommu config

Alexandre Ghiti (6):
  riscv: Fix is_linear_mapping with recent move of KASAN region
  riscv: Fix config KASAN && SPARSEMEM && !SPARSE_VMEMMAP
  riscv: Fix DEBUG_VIRTUAL false warnings
  riscv: Fix config KASAN && DEBUG_VIRTUAL
  riscv: Move high_memory initialization to setup_bootmem
  riscv: Fix kasan pud population

 arch/riscv/include/asm/page.h    | 2 +-
 arch/riscv/include/asm/pgtable.h | 1 +
 arch/riscv/mm/Makefile           | 3 +++
 arch/riscv/mm/init.c             | 2 +-
 arch/riscv/mm/kasan_init.c       | 8 +++++---
 arch/riscv/mm/physaddr.c         | 4 +---
 6 files changed, 12 insertions(+), 8 deletions(-)

-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
