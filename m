Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7511BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 20:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kLz5mJOJZ1LpzMMrLu7kJs8Su5WTXTNRGDlRKDepfss=; b=qjH3uvrRkbOwEw
	A0j/CmONNPxjjQVSXVumlpVV4hDbY9T0KVPOeyvmBCFzdkdc8PESTR5mr09jyHdF63ivYSUmQeVgY
	9CGdUL2yPO8lkaC3Fa2vEtO/O2L1AoTMTsfDZ6g7yKWPjIfILxKPfT0ROWLz/FLnOQk6buNQCxcVe
	IkgbrCW4sLbr3RqzJBu8vXA6ITZD/01/uDdK39oQnzXKwMTjWz3hyrvzwra4nZtevks3g4dplOnql
	mvXak1L9avwtzozsVvm+0TboPuCmZNY9FtfIZWjvwCwRDcb1HQ0wywgSPvjPc83IeIaSlLHWouezL
	VUkbJCiOg+Nt5HLgfRUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npFr6-00DR84-Oe; Thu, 12 May 2022 20:56:16 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npFr1-00DR7H-Hf
 for linux-riscv@lists.infradead.org; Thu, 12 May 2022 20:56:15 +0000
Received: by mail-pg1-x52d.google.com with SMTP id q76so5629453pgq.10
 for <linux-riscv@lists.infradead.org>; Thu, 12 May 2022 13:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P/Ac7JONYQRbqYr75B8cPwknKxer6j9wwthXWi5R/P0=;
 b=a9vzilDVBWK31znRhkyZYpN3fhm2ncMeaUJqBg+1Cpjx8PT05UuCERtREHvRj5BHZY
 Qb+gUvYtymqMI+8FsdrWl5qJaHIb9D8nY6hw+JhhW9OK3h0faS05sGiyNkahpMmBRmGA
 8QDus7tX6d4JAuz8co/q2DLC6yAObwIO7HHwzsZw1JQhclpVIotCG0HYwgwn5pTJY6gt
 ZAq0zNpe0o7wb0GOe0d4/l2FuMHzZ/5sO7chV6AxbUX9YPJqMDeVParVYbCyIBQq52aJ
 oWzRcnakW25XwwMmpRl2YtoK0PdhjncL4T87XixUuikhuN8FGDxwpoMFAPRsV4gFyCdE
 HK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P/Ac7JONYQRbqYr75B8cPwknKxer6j9wwthXWi5R/P0=;
 b=t/2pRf2qnL86hkeR+ksH1RXf+OA40t8EQyXeKDTgTOhyAAxivWshTaE3H7SR/KpKnD
 BCbNW/vHgmD8P0dluS+roWGGXFEIBoiKISLVlNW71JHStAn90E39IsGFasx1KXcPLX2t
 NWKbqDlLwDE1wEEeWqY8667W92ydsXsCQ6IaI5wPGj1MXeqigj7vV15XAt/wQBQCiEdY
 EVuHkf9dln8faDzc6t4+iLxg/MbI3s+r7fZJTmQsi9hWvWOnxLeGQKC4SOz/Ny7fBgvF
 fCa0gKvfGCiTook8jYTzA1laXR4tFhsfWT6PyAVtgwiWy9qLTgIrZ9GcSGZzN/8SoZJY
 GBNA==
X-Gm-Message-State: AOAM532L3gAPVC6bXZqjjxLGCLsn+eGAAUVVRRjPOHr3IGIlVs9cCuCQ
 OJDB4uw42RNX+zK0nQ1b12A=
X-Google-Smtp-Source: ABdhPJwGz4p76paZX1fTS49cyppG95kskcfcQitNZXrNm+Ea3iZqgsWKNzmM6+/+tz57/l3BGKh8gQ==
X-Received: by 2002:a63:d90c:0:b0:3c6:4ab4:fbfe with SMTP id
 r12-20020a63d90c000000b003c64ab4fbfemr1129133pgg.499.1652388970134; 
 Thu, 12 May 2022 13:56:10 -0700 (PDT)
Received: from localhost.localdomain ([2604:a880:1:20::1f:7001])
 by smtp.gmail.com with ESMTPSA id
 t189-20020a635fc6000000b003c14af5060dsm139955pgb.37.2022.05.12.13.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 13:56:09 -0700 (PDT)
From: Wende Tan <twd2.me@gmail.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: Wende Tan <twd2.me@gmail.com>, nathan@kernel.org, ndesaulniers@google.com,
 llvm@lists.linux.dev
Subject: [PATCH v2] RISC-V: build: Allow LTO to be selected
Date: Thu, 12 May 2022 20:55:45 +0000
Message-Id: <20220512205545.992288-1-twd2.me@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_135611_644954_2C8FF8C0 
X-CRM114-Status: GOOD (  11.64  )
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

Allow LTO to be selected for RISC-V, only when LLD >= 14, since there is an
issue [1] in prior LLD versions that prevents LLD to generate proper
machine code for RISC-V when writing `nop`s.

I have tested enabling LTO for `defconfig`. The LLD took ~2m21s and ~3GiB
on our Intel Xeon Gold 6140 server and produced an 18MiB Image. The image
can boot to shell using an archriscv rootfs on QEMU.

I have also tested it for `allyesconfig` without COMPILE_TEST, FTRACE,
KASAN, and GCOV. The LLD took ~7h03m and ~335GiB on the server,
successfully producing a 1.7GiB Image. Unfortunately, we cannot boot this
image because the `create_kernel_page_table()` -> `alloc_pmd_early()` ->
`BUG_ON()` logic limits the image to be < 1GiB. Maybe we can fix it in a
separate patch further.

[1] https://github.com/llvm/llvm-project/issues/50505, resolved by LLVM
    commit e63455d5e0e5 ("[MC] Use local MCSubtargetInfo in writeNops")

Tested-by: Wende Tan <twd2.me@gmail.com>
Signed-off-by: Wende Tan <twd2.me@gmail.com>
---
v2:
- Some textual changes suggested by Nick.
- Drop the changes to `arch/riscv/Makefile`, since the LLVM issue is filed
  and resolved.
- Drop the unnecessary changes to `arch/riscv/kernel/vdso/Makefile`.

v1: https://lore.kernel.org/linux-riscv/20210719205208.1023221-1-twd2.me@gmail.com/
---
 arch/riscv/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 00fd9c548f26..c55f6b95e5af 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -38,6 +38,10 @@ config RISCV
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
+	# LLD >= 14:
+	# - https://github.com/llvm/llvm-project/issues/50505
+	select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >= 140000
+	select ARCH_SUPPORTS_LTO_CLANG_THIN if LLD_VERSION >= 140000
 	select ARCH_USE_MEMTEST
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
