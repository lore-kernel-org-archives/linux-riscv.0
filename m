Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E88C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 07:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kGRLpm2DE9+3odmOTibwrcN3cfyS0CqkJT91St1vYqg=; b=QGVN7CmnR+ONyl
	vTDkGe9MKMXCoCfsAVV8k19G/Yz1cPE54g6ofQbNIu1QBgQekc0ol62is8AXucfHco+Z+W1KCE7Iz
	7JsoRPvEm0GbtilOZjvMkqiq1gogYRnWyvcE+4Js8X094RNKthruyG5BlRDa5iJluMS+ZKIUtFeGH
	yzAsnC1gqYpojBpKWkKYPks6Co1GW53jjOQ81d4Ne4HaTJi2R2ggqKlPcQ1/vlzi4uTwsRMohZk8/
	64ia7+H2lMKt0eJ6ZWDX5HWp9JIts03q/w4C76jRUAPMnGvWsFlfrjLGgx+vtQobadbasb1YmO8NQ
	z1qtJ+CqAr3MkioYum3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqsC-000s66-4I; Fri, 03 Feb 2023 07:52:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqs8-000s5R-Lg
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 07:52:38 +0000
Received: by mail-wm1-x32b.google.com with SMTP id u10so144368wmj.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 23:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NlhJRyLGWhYCTglJAyNtdlMktkkn7B+K+8DalaA2gVM=;
        b=qQ4IzbW+3YUP1LGsXZqe+TW2yoNdt5CgIM9iCfoPeTDgRcMgdCF93Uik1VA+RXDJ6w
         /jbovzM4aJ6zefnsmmc88ugJf7g0TqnY8PFjV1D9ZMT9NBBQZwHCHJdn7r9+cbiLzmti
         RJQFrxE2IfePta/OjJhTxnpSxtTui+FBNymB1THoXsoy+lDE6UJ/ey1mOQt3Qvu0B/Uw
         AlsMy8Ua932t0qE+8JUTdRuYjP3YYPr4rNlE4U+KJzZkzxnJvzedEiWKGEK9vRGiXXsU
         84/XnF4I6ebriVsJtPGVUt3r3y0fHhqmgE4BiUj13dmhDv5+mEvv3RCtikwPAUhRrNg9
         WChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NlhJRyLGWhYCTglJAyNtdlMktkkn7B+K+8DalaA2gVM=;
        b=GVtlHc2R0J4NlumUB8DyYkJTfa81ocBLlN+7jXaADRl5niI8a9lr0eLai/LOmgf7u3
         ip0asIUUTUDe7U05aulhJ4gilmE3B4g9mlu7b32VsRHxbfxaHOJQBjskmAJghPEzXH8J
         f91GKgdNLXYtb9Bmm8XFEWbYsdwJ2rnuqiwnoBB8G9yNaz+0P9jy/53QHJUlHXQ7ZYnx
         zDe6irytiltiFzuIX5A9b/9nOsFFmJhkN071jDPTBpXfhddA+XXWWQclvw7XcT12Q8jD
         Rx2Owwl3w+e0+9c8ZHDek3dm0jMDpcpOz9o6b8lGAg1KqBJcnq4E8R3vvBIUGCNTNVYb
         opVg==
X-Gm-Message-State: AO0yUKVf/9rINj3tKeEqtI8mctNIjV+MoBqhxkv55yv1IBGJLSs1xaLi
	kJm9HYYnlxxpM1W9FcueUk0qGA==
X-Google-Smtp-Source: AK7set90A1kagYMQXQLp0Dpaj79ES5rzB/gI2zg7vosBGRuakhbiQzPbMNfGJHjyZk7AI2wAtWkDHQ==
X-Received: by 2002:a05:600c:1e19:b0:3dc:52fc:7f06 with SMTP id ay25-20020a05600c1e1900b003dc52fc7f06mr8189377wmb.41.1675410755367;
        Thu, 02 Feb 2023 23:52:35 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c445100b003dc433355aasm2020861wmn.18.2023.02.02.23.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 23:52:35 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 0/6] RISC-V kasan rework
Date: Fri,  3 Feb 2023 08:52:26 +0100
Message-Id: <20230203075232.274282-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_235236_954420_ECB34660 
X-CRM114-Status: GOOD (  13.93  )
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

As described in patch 2, our current kasan implementation is intricate,
so I tried to simplify the implementation and mimic what arm64/x86 are
doing.

In addition it fixes UEFI bootflow with a kasan kernel and kasan inline
instrumentation: all kasan configurations were tested on a large ubuntu
kernel with success with KASAN_KUNIT_TEST and KASAN_MODULE_TEST.

inline ubuntu config + uefi:
 sv39: OK
 sv48: OK
 sv57: OK

outline ubuntu config + uefi:
 sv39: OK
 sv48: OK
 sv57: OK

Actually 1 test always fails with KASAN_KUNIT_TEST that I have to check:
# kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan__test.c:1020
KASAN failure expected in "set_bit(nr, addr)", but none occurrred

Note that Palmer recently proposed to remove COMMAND_LINE_SIZE from the
userspace abi
https://lore.kernel.org/lkml/20221211061358.28035-1-palmer@rivosinc.com/T/
so that we can finally increase the command line to fit all kasan kernel
parameters.

All of this should hopefully fix the syzkaller riscv build that has been
failing for a few months now, any test is appreciated and if I can help
in any way, please ask.

base-commit-tag: v6.2-rc6

v4:
- Fix build warning by declaring create_tmp_mapping as static, kernel
  test robot

v3:
- Add AB from Ard in patch 4, thanks
- Fix checkpatch issues in patch 1, thanks Conor

v2:
- Rebase on top of v6.2-rc3
- patch 4 is now way simpler than it used to be since Ard already moved
  the string functions into the efistub.

Alexandre Ghiti (6):
  riscv: Split early and final KASAN population functions
  riscv: Rework kasan population functions
  riscv: Move DTB_EARLY_BASE_VA to the kernel address space
  riscv: Fix EFI stub usage of KASAN instrumented strcmp function
  riscv: Fix ptdump when KASAN is enabled
  riscv: Unconditionnally select KASAN_VMALLOC if KASAN

 arch/riscv/Kconfig             |   1 +
 arch/riscv/kernel/image-vars.h |   2 -
 arch/riscv/mm/init.c           |   2 +-
 arch/riscv/mm/kasan_init.c     | 516 ++++++++++++++++++---------------
 arch/riscv/mm/ptdump.c         |  24 +-
 5 files changed, 298 insertions(+), 247 deletions(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
