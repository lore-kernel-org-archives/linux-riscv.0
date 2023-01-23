Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB88C05027
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 10:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pVjbFmC0ap8kkvtjSWRC0/uzev1SHAV9lJmN+wixxmU=; b=yrgsSbBp8sygMo
	2QopyHGulYAUHjVnr07BuNfXLno+1tLiFK2RFGbqdGnpFjMXBfCJ/Z2IA4nfBFeWZKbZ2+ag9xeoo
	FzIVrwOhGQPogs0izWEiA+U/9kA17ajJ4hFhHD7fzRHkSpjwtgSaMjk8rSu9I1OH1TBMhcGhUItl7
	gAAy2FqCA3d/TXCMddwE0/rdZ/4pVIEzimjt5FjmpRJYgYwo1Ke7Kl0RKs3g0nyGuC7yKgT5V3Tb7
	7e0NTXVTsFLK1pYQMpIHKNepy7YE4NZaVcMZ+i6etl6i9haTLUVEDd93QXCicWLgabkhgfw8dZfPh
	yT/8QCTCd1fKrHXEW/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtuK-00Gkrf-CG; Mon, 23 Jan 2023 10:18:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtm0-00GhKt-8p
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 10:09:58 +0000
Received: by mail-wm1-x32a.google.com with SMTP id e19-20020a05600c439300b003db1cac0c1fso8699729wmn.5
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 02:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BowUBQydnAafqAai7xO8TqOkM+didbH9IqQu35TSCq4=;
        b=dOwqxgrVb3ypUy4k4M318f6E0m70qvhPaXk+aDiLRN4MuUpj2iih++Rsv4zeEwZQ/Z
         gve4hd6zTyG8YvQ8gOY1uzbwnzAsu8I9uZILphr7ks/N2yRFJ1CpIjkgVlnnsXLZ2rUL
         kv1LZ40Yjom/NcmpJWLKMyTNYHqVb8qelkDTrEkp/Ke1pH/imyoTS902MaR6FW2fQGmX
         ZOW2vt+6UBqyMc3E+NRg5YaC9YTt3EeMpt35ByUCj8q+2MXSNjSiU/JPVfvxLaocF2FT
         Lhp0sAkCvc8dDuvPa4LLRyhtveEfzTDWMGuyFcq+DHJVqPUWTkG8iZ6UZJ/wAitUfsV0
         h2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BowUBQydnAafqAai7xO8TqOkM+didbH9IqQu35TSCq4=;
        b=suZ39bzY/1dByg0Fx2EcefvftnoPx3aMUqLpxZSPdm9FKatWgaVo1sGvJIZOJsveLH
         iJYZMqrNSsA+uZ7wmi1YLhb1KYBWhRU68M9zeSuRoFxvdABXmn65bU05dhc2jo6LM4ym
         RNI85OFxPbqZj0PPA9svWec0Xse9OkluKcIP3Wgv18VXvTHN1P+61XCGO+b0yP2nuHYc
         6ep5Iq6jQ24muwGS1XZbuI2kG+BTYY18YrIe8fJanTz3E7bSnP+LOwaWvcRHHqkmQEjn
         ZYqcWvQPZ/tATDeqMy2L6Nh1TcWCptofoWNeP+YhhKGDaspMMXy7rr0N3K2MWYAM7LXU
         hjLg==
X-Gm-Message-State: AFqh2kqPGQrjsU1hIAxPQZoBHja+x/JRPpHlYIW8h01fXuYJIov5j6Lf
	Z/dROqTPXW7PmW4F5AZ6qcabPg==
X-Google-Smtp-Source: AMrXdXs7SiqkzdfbYCN4klaQirQ4x4dMCIkYAZcYH8jLjpLSn5XUFPnaT0RkC3gKysT8Z1wF4lVK7w==
X-Received: by 2002:a05:600c:1c01:b0:3c6:e63e:23e9 with SMTP id j1-20020a05600c1c0100b003c6e63e23e9mr23745245wms.24.1674468593747;
        Mon, 23 Jan 2023 02:09:53 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id bi16-20020a05600c3d9000b003daf89e01d3sm10170407wmb.11.2023.01.23.02.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 02:09:53 -0800 (PST)
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
Subject: [PATCH v2 0/6] RISC-V kasan rework
Date: Mon, 23 Jan 2023 11:09:45 +0100
Message-Id: <20230123100951.810807-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_020956_632243_4411C8AD 
X-CRM114-Status: GOOD (  13.28  )
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
