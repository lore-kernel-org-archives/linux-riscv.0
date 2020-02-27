Return-Path: <SRS0=0+L8=4P=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1538DC3F2C2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2020 22:27:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D42F8246A2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2020 22:27:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CNY8tgpQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="fcoClOgL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D42F8246A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sS1zZ4MwtCqm9iYiwROtnVTjPMx9muysW3lROcK3bh4=; b=CNY8tgpQ9X6QAX
	oyZ3sPPxBPEtluSmJh8mcVyYRCXJcOjAYoJtwbTQgVbJTPB82ZmtEjUmZOHJ8PNw5l+BJG/CvIpnh
	6zkiCA0oUj158s2VmcLz3pLEiaaxampbkxJqL8UxN919/1nC65jcwxEZEO0gxZqZ0r9nhXQGoo2jH
	dD5ddgp5P9TB8cdZgRacznUHcu5VizGf/QbbYwHxyy7ds3/mgQCCdTBEEakkVqWpdoJd/fkXFXmau
	ZNy682LUl8+DxUruy6/VXQd7MmfViSIcf8v0ityTn5oVBbhdfhSt+rpgRtCk6XTwAxTVo28GX0pGA
	KqrK+DZW3QHEZndOYVMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7RcY-0000i1-4D; Thu, 27 Feb 2020 22:27:06 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7RcQ-0000Xr-EP
 for linux-riscv@lists.infradead.org; Thu, 27 Feb 2020 22:26:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1582842419; x=1614378419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EHUEM7B8bQdVUOO+XqChXw4fxBDln7t5tGAkDnrQZUI=;
 b=fcoClOgL8vmNcmD4+LHb2jtuczSB/2tAxf1R5ioIZz4x4dHmmIGr8lcy
 1r6xQSfU4PC7DYBVU2GxWcLFuXmPpKzkacXht3JdHMQT0HhOEClGIrxiD
 OEmj7kZ25SmLgi9yAFBeIwRyy2I/EOVYt+A+E/9fVW5E7sSuhrMGQhm8x
 576absiYASdzW5e9zFx+QDvm5msSdyq/bxrP6ftR5dHADA6I54Kd/GKGS
 akLOplXYHjD5OtjFZu5jTwFqIOwVJKAL60tcfudrsyPkdIdOk7dZuexHu
 8mX1GSa/b0OwPbDvoBfDqIHq+DImusknU0AUxmAmk0lZRSQsqZoxsCo2S A==;
IronPort-SDR: wLDL8UsqploJgP9TMhuXVLqVr1YGBQ2op4aIryXTbKGlqMZr//iVOtn4AqsP0qa/QpAvlXyDw1
 FkuyG4ozUOTPQu1PBKum2HTHI8uC01wBL69qWUS7iFW736lGv3OJwwuesk2Mw8HPjcuG+yzuyb
 AdAoEU8Rzib95MSyGVkXxi3bwE8qc5i/0hKsZyfHDDhjMTp3+cYtUKdv+/Kn2mttuF5ZHwLLsd
 I0kxXM5jaAE5n6SGnl4eYGnK6/m5KffgZLV+uMGzlFC5nrUPM94LXSzWMgLARcc2cY2jOQr7c4
 jus=
X-IronPort-AV: E=Sophos;i="5.70,493,1574092800"; d="scan'208";a="132395349"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Feb 2020 06:26:51 +0800
IronPort-SDR: sGBlDKi9mYn4ZJcPxUTylnmVruKAKquDF+yReAh+nfbsit9x67O5w9Wn+VQbC79z9MwDiLR50W
 eUKUC7vQsKnsWUva2ifssacSh0CaFfSrzCsKHsexW9Gq/WeEVaxesh03gVaaVZ2PH972LfZMW6
 /LQQOXjpIiT7Ujfh69z5+wrxCgfxqcN6jaayfFaguyBP4sjm5roVqrLIcUJq13S+3KBoDXzOEx
 EWkh0jE7nESEoIgAZ4obPpgfOm2Q+h5za25kk1N4IR4dOVw/tY9ptdXwj/1pKHQrEHXAspWTEe
 L1DlzQkyc8VPAF2AhSXjxU1y
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 14:18:50 -0800
IronPort-SDR: YD6YeGhFTlMMzdBLGRQBddTkJ6fAkSTBalLAPGagkJGff3jvnk7ShMgdkHvtKi9lHv93MiTJbP
 FV0+/TE0pxagvgx828IfHnvvjOqvC2T8v+6Ty+CgZmCQXQSyiDRddCYok6zWKkRmESGV4x2Fw9
 mKVzPNX0rl/ZGJ1gk3abMm6UWic9LMlHkU0O7g25BCdLp9h4g/687VuCmXgx+ZO+Jn1OMi9Fr3
 zVwGYMMJ7kONZzI2JEyWWz0rQ6T787ZP9WDvADtR0PbT3QYUvWWcCI9gCmCRK3g2X/LVCoiIV1
 ulE=
WDCIronportException: Internal
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Feb 2020 14:26:50 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [v1 PATCH 3/5] RISC-V: Define fixmap bindings for generic early
 ioremap support
Date: Thu, 27 Feb 2020 14:26:42 -0800
Message-Id: <20200227222644.9468-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200227222644.9468-1-atish.patra@wdc.com>
References: <20200227222644.9468-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_142658_531871_DB38A6DE 
X-CRM114-Status: GOOD (  15.19  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-efi@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 Atish Patra <atish.patra@wdc.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, "Chang,
 Abner \(HPS SW/FW Technologist\)" <abner.chang@hpe.com>,
 Michal Simek <michal.simek@xilinx.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Greentime Hu <greentime.hu@sifive.com>, Borislav Petkov <bp@suse.de>,
 Mao Han <han_mao@c-sky.com>, daniel.schaefer@hpe.com,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Alexios Zavras <alexios.zavras@intel.com>,
 Alexander Graf <agraf@csgraf.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 "leif@nuviainc.com" <leif@nuviainc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

UEFI uses early IO or memory mappings for runtime services before
normal ioremap() is usable. This patch only adds minimum necessary
fixmap bindings and headers for generic ioremap support to work.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/Kconfig              |  1 +
 arch/riscv/include/asm/Kbuild   |  1 +
 arch/riscv/include/asm/fixmap.h | 21 ++++++++++++++++++++-
 arch/riscv/include/asm/io.h     |  1 +
 4 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 27bfc7947e44..42c122170cfd 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -65,6 +65,7 @@ config RISCV
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select HAVE_COPY_THREAD_TLS
 	select HAVE_ARCH_KASAN if MMU && 64BIT
+	select GENERIC_EARLY_IOREMAP
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index ec0ca8c6ab64..517394390106 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -4,6 +4,7 @@ generic-y += checksum.h
 generic-y += compat.h
 generic-y += device.h
 generic-y += div64.h
+generic-y += early_ioremap.h
 generic-y += extable.h
 generic-y += flat.h
 generic-y += dma.h
diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 42d2c42f3cc9..7a4beb7e29a3 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -25,9 +25,28 @@ enum fixed_addresses {
 #define FIX_FDT_SIZE	SZ_1M
 	FIX_FDT_END,
 	FIX_FDT = FIX_FDT_END + FIX_FDT_SIZE / PAGE_SIZE - 1,
+	FIX_EARLYCON_MEM_BASE,
+
 	FIX_PTE,
 	FIX_PMD,
-	FIX_EARLYCON_MEM_BASE,
+	/*
+	 * Make sure that it is 2MB aligned.
+	 */
+#define NR_FIX_SZ_2M	(SZ_2M / PAGE_SIZE)
+	FIX_THOLE = NR_FIX_SZ_2M - FIX_PMD - 1,
+
+	__end_of_permanent_fixed_addresses,
+	/*
+	 * Temporary boot-time mappings, used by early_ioremap(),
+	 * before ioremap() is functional.
+	 */
+#define NR_FIX_BTMAPS		(SZ_256K / PAGE_SIZE)
+#define FIX_BTMAPS_SLOTS	7
+#define TOTAL_FIX_BTMAPS	(NR_FIX_BTMAPS * FIX_BTMAPS_SLOTS)
+
+	FIX_BTMAP_END = __end_of_permanent_fixed_addresses,
+	FIX_BTMAP_BEGIN = FIX_BTMAP_END + TOTAL_FIX_BTMAPS - 1,
+
 	__end_of_fixed_addresses
 };
 
diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 0f477206a4ed..047f414b6948 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -14,6 +14,7 @@
 #include <linux/types.h>
 #include <asm/mmiowb.h>
 #include <asm/pgtable.h>
+#include <asm/early_ioremap.h>
 
 /*
  * MMIO access functions are separated out to break dependency cycles
-- 
2.24.0


