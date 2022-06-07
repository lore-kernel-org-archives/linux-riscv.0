Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163CFC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 19:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=npBpx+Mmkq7Ab0Tj3o5i6dMbZiKFT3AH3Q06X2i2kZA=; b=rML26wwDkU6JD4
	QaNSdJxA8q89ePjMxN+sCcARexzeusX1ZLRH5irdabY6yIBQr6xA+//q0T0MmQs+J5KB5OL1W6b01
	zYVWc02MXvDEchg7e+kjQ0uDVn++Gn9WaQRbve8KdFtSAyMv1OKNJeK4Fi1Zqbb/eTpHGzlgKPE1e
	vDiDVqr5GTxXSjXqo7ZXW4XUzTrMlJ2aeYOdkNGPxoBp9EjrMJf0vDlznc/sLSrWIAo1jNm2XtCgc
	TyufaHYagpxQeonclVaS4wav3+gZRSJ335WMhBnWssMZka7RB3kZHI3s6A8JJkP5kwisaqAulRYX2
	ZYGue919nmnHKSpf+lJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyfL5-0096q5-1c; Tue, 07 Jun 2022 19:58:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyfL2-0096oM-Cm
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 19:58:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C549CB823DB;
	Tue,  7 Jun 2022 19:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44582C385A2;
	Tue,  7 Jun 2022 19:58:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="P3yIR3c3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1654631878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UkQJjvZ5xCdBwiht+8tu2AP0BLnypsD3C8jDx5YCgmc=;
	b=P3yIR3c3DtR/RhcoMlwU4sIlFUoCPUUImnF0ckmOipgBY1DMO0Mr7snbuEmvcVropUQvY+
	1+phCFG5vWnyOj2zdcr06D8eVgM1LzYv7wfljGWl2x/n8RrmYu9w+z90FdjamBIDjW/kyK
	/93Sjs9SFfqRUWrygIZrwCI5ylBXVf8=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5d384389 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Tue, 7 Jun 2022 19:57:57 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Phil Elwell <phil@raspberrypi.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Russel King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] riscv: initialize jump labels before early_init_dt_scan()
Date: Tue,  7 Jun 2022 21:57:52 +0200
Message-Id: <20220607195752.1146431-1-Jason@zx2c4.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_125804_606840_92E726B0 
X-CRM114-Status: GOOD (  13.17  )
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

Stephen reported that a static key warning splat appears during early
boot on arm64 systems that credit randomness from device trees that
contain an "rng-seed" property, because the dtb is parsed is called
before jump_label_init() during setup_arch(), which was fixed by
73e2d827a501 ("arm64: Initialize jump labels before
setup_machine_fdt()").

The same basic issue applies to RISC-V as well. So this commit moves the
call to jump_label_init() just before early_init_dt_scan().
jump_label_init() actually requires sbi_init() to be called first for
proper functioning, so it also moves that to the right place.

Reported-by: Stephen Boyd <swboyd@chromium.org>
Reported-by: Phil Elwell <phil@raspberrypi.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Russel King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Fixes: f5bda35fba61 ("random: use static branch for crng_ready()")
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/riscv/kernel/setup.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f0f36a4a0e9b..c44c81b1cfb3 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -263,13 +263,15 @@ static void __init parse_dtb(void)
 
 void __init setup_arch(char **cmdline_p)
 {
+	early_ioremap_setup();
+	sbi_init();
+	jump_label_init();
+
 	parse_dtb();
 	setup_initial_init_mm(_stext, _etext, _edata, _end);
 
 	*cmdline_p = boot_command_line;
 
-	early_ioremap_setup();
-	jump_label_init();
 	parse_early_param();
 
 	efi_init();
@@ -285,7 +287,6 @@ void __init setup_arch(char **cmdline_p)
 	misc_mem_init();
 
 	init_resources();
-	sbi_init();
 
 #ifdef CONFIG_KASAN
 	kasan_init();
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
