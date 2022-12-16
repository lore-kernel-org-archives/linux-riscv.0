Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D1FC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 16:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sJMk3BhTzN75N2d4+Y5sb+Br6jN8DyWtRZi1IJqFu64=; b=Z3rWsan2WF2Nyg
	0fPwLxuBV9pcDwxvH/8K7xRPzQJvA2D8Ip7OQNo9VC1bDY7TRYlKxeqe8Tt8Ivw8Oo0RfrS7eVqc8
	MhWBs8lm/0qr4coETloiFcboewfELSAFZBkHeLU2Q44/Hazmsipd6aGo6/5OCnOim40WcMcMhPDGT
	plP7E2ummO8+CwExrC3Vg++W1M8zRgzIxCtQk5zQPoPaL06RTTpwog9p4VhG9WsaUl1WFBkelwuTa
	0NUJdgsO5rZPTevw8Fd/fW9LRnbu76ORqPrj4gvHHLFYTizpW/CBBDy7Uu6oeJtYnTAFOv/4jwG+F
	zzZp4qJ+6Q7NkrXeusvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6DTD-00GNKG-Ge; Fri, 16 Dec 2022 16:21:59 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6DTA-00GNGR-45
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 16:21:57 +0000
Received: by mail-wm1-x344.google.com with SMTP id o5-20020a05600c510500b003d21f02fbaaso4459416wms.4
        for <linux-riscv@lists.infradead.org>; Fri, 16 Dec 2022 08:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G6XB8sFEdgRyJHccqiCj1UYEgQGTrZTp9EBrE9hoiO8=;
        b=tMy2czpcjtMBFGplX2Fj7b6/e2vG/fUtkThLYkBLLkPglMspo20XEG9HwQEYmXVsLt
         eO4VB9DrpQAXgI4uETDdB5L/OKyiOCfwyhrPKjBWG9vZWeSVuhwtQJMlvHU/2IpavWrp
         X86zGFLZ9TwJ5mquI/XvqoT+hBZxioXiysJ9WYjdGkLQ0A19DgU7N8Uo9ghG0Qd5nVH2
         avk3pjckQjBuRBCwX+hZYyijMiEK5rNp4CRX+dgJr74DbLMoG9mt5xoCJerRFZgKGCj2
         DFdtGso5i2tLuoWGzkL+T0dKYB53/BOLKQbuzU66FYjo6xcL9xaZ+SzMMIyRzTiC79xj
         CTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G6XB8sFEdgRyJHccqiCj1UYEgQGTrZTp9EBrE9hoiO8=;
        b=q3HWyWMaqZ1/mCaAt18yf70d2h1C38zW/8m9cPwT9w6FREUW5JgfMm9sMAhYQg6Zxl
         vnf1wj/B+JuuM9RBR0tOfUxOTFfn7WktiZji3OwezICVR3muOk9Si5CPTSAudvHoo1c7
         MFLJMvvthNlL97GfqHCXWVzLcFuGeUFdQ3ijg56LCDyZg3bKTeseQZWIPzt850g25KCb
         e2UFtIgy3pYGrSLB/VobQECRCoYEVf0x7p2SwhqdjxcG8MwfGqXWGIdIhDFLULjXemb3
         Tm2M1xZDjx/KWksx0Yk3j57Nlu7Um3W/945ppV/63QBKIrWE7S9Al4aCs0KdwJpcZlTY
         nROA==
X-Gm-Message-State: ANoB5pmqCgYFtXYw7S0CMmpCNYOq4jSqxc1YIvD9LijVw73ArqWqYI0b
	92W3vGL/M/nfm333pCi09dI09A==
X-Google-Smtp-Source: AA0mqf6XX4eU8Q/Q2iGuiyIeR9rQW9MHPz8fX+YXLEsXTUndzUIQSOASBsznrQAqHBCm+nCjyFr86A==
X-Received: by 2002:a05:600c:1e8a:b0:3d1:bd81:b1b1 with SMTP id be10-20020a05600c1e8a00b003d1bd81b1b1mr24959580wmb.18.1671207712025;
        Fri, 16 Dec 2022 08:21:52 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id z19-20020a05600c221300b003a3170a7af9sm3027506wml.4.2022.12.16.08.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 08:21:51 -0800 (PST)
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
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 0/6] RISC-V kasan rework
Date: Fri, 16 Dec 2022 17:21:35 +0100
Message-Id: <20221216162141.1701255-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_082156_196321_824F10E1 
X-CRM114-Status: GOOD (  11.60  )
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

Alexandre Ghiti (6):
  riscv: Split early and final KASAN population functions
  riscv: Rework kasan population functions
  riscv: Move DTB_EARLY_BASE_VA to the kernel address space
  riscv: Fix EFI stub usage of KASAN instrumented string functions
  riscv: Fix ptdump when KASAN is enabled
  riscv: Unconditionnally select KASAN_VMALLOC if KASAN

 arch/riscv/Kconfig                    |   1 +
 arch/riscv/kernel/image-vars.h        |   8 -
 arch/riscv/mm/init.c                  |   2 +-
 arch/riscv/mm/kasan_init.c            | 511 ++++++++++++++------------
 arch/riscv/mm/ptdump.c                |  24 +-
 drivers/firmware/efi/libstub/Makefile |   7 +-
 drivers/firmware/efi/libstub/string.c | 133 +++++++
 7 files changed, 435 insertions(+), 251 deletions(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
