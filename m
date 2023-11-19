Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6AAC072A2
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Nov 2023 10:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fuISxyX8lmz8YSC5YSqDjVliS1oidikFH4oDSI12Vgc=; b=l9o1H9wxw2LLOd
	wlZgWL2NlS8Acqr+FCFxOBbXD8slBFqqAEm+tacWXw5U1eXxFvFBllDdVspRgACQ+vAbefJGuY4bx
	FVe6o22+hPn+Ju8Yqjik/SEIMlgCeRFeJTvybXc1gkJbMhS1EnDYfSPLGb3q9E6d95hv4541kwSnN
	NBXtwztQBZ+/A7I0qF/VgZxPorcvTS9YW2NfsrTJkgSoAlsUbojWMDFJwNHkgW78ThKaWE/vZG8pC
	KR0e+DI3lM2GaMQwxIqdxnWyZdFoUyTfPnAjDGUodB05e2iPLyRFobBRkjYCofeqGASKPred/CBAt
	Hc8nGVX2gwgfwh813drQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4ebe-009oe1-1T;
	Sun, 19 Nov 2023 10:00:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4ebY-009od4-2I
	for linux-riscv@lists.infradead.org;
	Sun, 19 Nov 2023 10:00:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5F67AB80B93;
	Sun, 19 Nov 2023 10:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA6BC433C8;
	Sun, 19 Nov 2023 10:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700388032;
	bh=naEGp220Hlp/9TKOLlkrInZMXHL++3zGxHRa1Qn2VXM=;
	h=From:To:Cc:Subject:Date:From;
	b=WqPTCY3CPwP92hiBsGumKLNmvLDW6/1mtslFwykWsMmHeTvUehwOike6DbS/UmuZ/
	 JYQfaIEfswVgN2c5BipGTvsGqXC+CrskcsTtemYcabPYVBfOQPGMWF+FrIZGB0kikz
	 hhNCYHSc43etV69mXhCgNTtmn31LCFXSqTqTlTg8nv2xoM0IBwsX5yqxkuRIgbRB7m
	 sjnLbTeVKSrLWTjcz+v1I3uYru5jZN/NLKU2cisIn7p2vggjxfyDzhs5IQ/G+l+IB3
	 wepBMinkKrHZ9Nmj+KNkzvO91KNikghE4nt9xmupP4lAzrUCBXSQ+sigKOgpj6TqPk
	 9fTV+wFKmNtrw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2] riscv: add dependency among Image(.gz), loader(.bin), and vmlinuz.efi
Date: Sun, 19 Nov 2023 19:00:24 +0900
Message-Id: <20231119100024.2370992-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_020041_054555_20F756C3 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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

A common issue in Makefile is a race in parallel building.

You need to be careful to prevent multiple threads from writing to the
same file simultaneously.

Commit 3939f3345050 ("ARM: 8418/1: add boot image dependencies to not
generate invalid images") addressed such a bad scenario.

A similar symptom occurs with the following command:

  $ make -j$(nproc) ARCH=riscv Image Image.gz loader loader.bin vmlinuz.efi
    [ snip ]
    SORTTAB vmlinux
    OBJCOPY arch/riscv/boot/Image
    OBJCOPY arch/riscv/boot/Image
    OBJCOPY arch/riscv/boot/Image
    OBJCOPY arch/riscv/boot/Image
    OBJCOPY arch/riscv/boot/Image
    GZIP    arch/riscv/boot/Image.gz
    AS      arch/riscv/boot/loader.o
    AS      arch/riscv/boot/loader.o
    Kernel: arch/riscv/boot/Image is ready
    PAD     arch/riscv/boot/vmlinux.bin
    GZIP    arch/riscv/boot/vmlinuz
    Kernel: arch/riscv/boot/loader is ready
    OBJCOPY arch/riscv/boot/loader.bin
    Kernel: arch/riscv/boot/loader.bin is ready
    Kernel: arch/riscv/boot/Image.gz is ready
    OBJCOPY arch/riscv/boot/vmlinuz.o
    LD      arch/riscv/boot/vmlinuz.efi.elf
    OBJCOPY arch/riscv/boot/vmlinuz.efi
    Kernel: arch/riscv/boot/vmlinuz.efi is ready

The log "OBJCOPY arch/riscv/boot/Image" is displayed 5 times.
(also "AS      arch/riscv/boot/loader.o" twice.)

It indicates that 5 threads simultaneously enter arch/riscv/boot/
and write to arch/riscv/boot/Image.

It occasionally leads to a build failure:

  $ make -j$(nproc) ARCH=riscv Image Image.gz loader loader.bin vmlinuz.efi
    [ snip ]
    SORTTAB vmlinux
    OBJCOPY arch/riscv/boot/Image
    OBJCOPY arch/riscv/boot/Image
    OBJCOPY arch/riscv/boot/Image
    OBJCOPY arch/riscv/boot/Image
    PAD     arch/riscv/boot/vmlinux.bin
  truncate: Invalid number: 'arch/riscv/boot/vmlinux.bin'
  make[2]: *** [drivers/firmware/efi/libstub/Makefile.zboot:13: arch/riscv/boot/vmlinux.bin] Error 1
  make[2]: *** Deleting file 'arch/riscv/boot/vmlinux.bin'
  make[1]: *** [arch/riscv/Makefile:167: vmlinuz.efi] Error 2
  make[1]: *** Waiting for unfinished jobs....
    Kernel: arch/riscv/boot/Image is ready
    GZIP    arch/riscv/boot/Image.gz
    AS      arch/riscv/boot/loader.o
    AS      arch/riscv/boot/loader.o
    Kernel: arch/riscv/boot/loader is ready
    OBJCOPY arch/riscv/boot/loader.bin
    Kernel: arch/riscv/boot/loader.bin is ready
    Kernel: arch/riscv/boot/Image.gz is ready
  make: *** [Makefile:234: __sub-make] Error 2

Image.gz, loader, vmlinuz.efi depend on Image. loader.bin depends
on loader. Such dependencies are not specified in arch/riscv/Makefile.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Fix commit log

 arch/riscv/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 5cbe596345c1..1d6ed27e0a2a 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -163,6 +163,8 @@ BOOT_TARGETS := Image Image.gz loader loader.bin xipImage vmlinuz.efi
 
 all:	$(notdir $(KBUILD_IMAGE))
 
+loader.bin: loader
+Image.gz loader vmlinuz.efi: Image
 $(BOOT_TARGETS): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 	@$(kecho) '  Kernel: $(boot)/$@ is ready'
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
