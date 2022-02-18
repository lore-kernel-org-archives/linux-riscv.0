Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52142C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Feb 2022 13:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OsUBeUXOfp1CILFS9Sqi+tADYSQgJFezJpFVcvvex5Q=; b=Asl5gr78VZpuc7
	DsVAMRL+QZQT8P7oSf/Q+pHZZAB6R8u9gcQ2B3BTyNBArrVKqVu7Wjn+v0XTHnbAOjpqdORdZXCta
	LPWr/q3+PLniAsEPzxFabVZJIODspcu946MlhNbAQdn32wsXdwPtWYblMymlBOMhyOqkSPHNJCntF
	MPn01MP06nqtkuPMHS0jaI3e20T5tXolFO9b0+fuodspJwhFK+IlZX3vy/Wl8f7vUZ0KrYlzwqkKs
	a1gIuGft5hixEuX/dTLVCznQfzvHise1qX1EBGlIrusHMbc7ceXvzPGtwXOWV7hm7XqQu/OYLntmN
	pen/3qV26gr/lYVxcvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3a2-00EgoN-GK; Fri, 18 Feb 2022 13:45:50 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL3QF-00Eca4-HJ
 for linux-riscv@lists.infradead.org; Fri, 18 Feb 2022 13:35:50 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 290A23F32C
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 13:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645191342;
 bh=2yMxZwtr/8gF+DdEs5PumNe+/8vsdXtXdAp73EogBDY=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=gBEiYa9bvjC4T+pfNrq0TNusdZl8LGP5BtKvSOdLA/RB1IjR5PFOE9zsa0znYRA+K
 AorIwvoM9gC8iYcRZDeECJlCbd3x3uZ8k4JZ/JsSWpfnA+vp+rLWGTXRXBgEARcO2z
 YAOCZe+LvGMTAO2o9i+HO74vKjcEyeQu4pzjR5d9JAZg+pAwXCBddSX4bDNrevi/7U
 uc6Uv07mTImRddLHVJhfBVXvqK5dWuOwxbOBvzA9FzdM58K4Kq77WM9taZFD7ArPPi
 /O4hKuZOlY7F6/KqgXPJ9ANNLqvfOxSRXOGk/bDMiG0Xavv6lLw11q5mmmTK9wmwTS
 tluc32QSswSvw==
Received: by mail-wm1-f72.google.com with SMTP id
 n3-20020a05600c294300b0037bc685b717so2853618wmd.8
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 05:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2yMxZwtr/8gF+DdEs5PumNe+/8vsdXtXdAp73EogBDY=;
 b=7b4p3u9yen8t4C4S8nr6ZIucdqrNIqzVgygHpGUdUvnLJmJ0u4wtC2i6J1kQ/nCx+b
 Y3u9sCN7NCkNpAfRLU9DL69UUpABCQ/+NSCZaCoNQZVxLk8BsmPqmHjS4EsRydyGDBML
 +F6TzD++8QdFevdGVEqYYObm7ZvMgvOytoVNvT1LNN/R1yLDPiT7uiyLOeYaCBrJOaBd
 BId8RtNO8D/33WBmDQE2kA2H1xPSX82LCNlXO9G+KCekZVJ1Ksnpwq4cYavqSL0mUBkf
 z1zAzKPU2RZVuPEck5kh3UMERwYPFz/R9UOd+RPp1LX60XqeO11Jh+pjHXwW/MdLnss2
 6HAQ==
X-Gm-Message-State: AOAM532W1jAC4g2e6jiraJTNZhEp8cHycHdOfSfQjsVgKpC48SuEj3/3
 NwcDL4ZFtcBaswe+s4RmiuprkVjh3M4bs/Koydk5Z1Uu0KcSC8LGeGO7+ErjtYFcCYq62pTOe5E
 ixHpQZQfx156pRwNqsyKkoLjLUQIaA6cNhMUsW8NdRlF0ew==
X-Received: by 2002:a05:600c:1e8e:b0:37b:b9ab:e35d with SMTP id
 be14-20020a05600c1e8e00b0037bb9abe35dmr10720478wmb.109.1645191340873; 
 Fri, 18 Feb 2022 05:35:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyohAygHewTfQYDTOphC1Yoet4IBKeTpab9xavEBbLBq0CfmQQB3UD7pgUqU6ku/vHItAmtOA==
X-Received: by 2002:a05:600c:1e8e:b0:37b:b9ab:e35d with SMTP id
 be14-20020a05600c1e8e00b0037bb9abe35dmr10720462wmb.109.1645191340715; 
 Fri, 18 Feb 2022 05:35:40 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1])
 by smtp.gmail.com with ESMTPSA id c4sm21258318wri.22.2022.02.18.05.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 05:35:40 -0800 (PST)
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
Subject: [PATCH -fixes 0/4] Fixes KASAN and other along the way
Date: Fri, 18 Feb 2022 14:35:09 +0100
Message-Id: <20220218133513.1762929-1-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_053543_818981_4C8A34B7 
X-CRM114-Status: GOOD (  12.93  )
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

Alexandre Ghiti (4):
  riscv: Fix is_linear_mapping with recent move of KASAN region
  riscv: Fix config KASAN && SPARSEMEM && !SPARSE_VMEMMAP
  riscv: Fix DEBUG_VIRTUAL false warnings
  riscv: Fix config KASAN && DEBUG_VIRTUAL

 arch/riscv/include/asm/page.h | 2 +-
 arch/riscv/mm/Makefile        | 3 +++
 arch/riscv/mm/kasan_init.c    | 3 +--
 arch/riscv/mm/physaddr.c      | 4 +---
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
