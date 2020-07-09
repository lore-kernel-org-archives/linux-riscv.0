Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092AEC433E1
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 21:20:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C56A520775
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 21:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qFkz7gsw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="gHoLY2mt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C56A520775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WSNbUAA0nj+47Tzo2a5/yVBUmqPqtP/0Cegh1N/aQdU=; b=qFkz7gswKqkrRlF9vkXHDlCg1
	h4dy2TWiul3qhOvve7EYjAfzjSX9dyOtm7FnPZSOz18XbLzLeoaSqoFqyXYKm7fukjrvuGeIQKXj7
	hbN1YCxQDDYiLo1xEOjj6abWxsOiOo165QfTMT4fEAKZ2j1S2T3+KvSz7kDnWaO1Fh2aT+q26Emd1
	tYyLRVatzB8E/UjQdu8CYgG5cM9LomKvzEdZ84drm4W85h1L0vx1CQ5kGTCdwzUtoc2VsLtOQ6HyS
	o5EEeekGmlzP1Xwl1zgs/OlaarWefz/3tg3yJP03kUqvEt6w7mGYVPyY2PC+kSPa2z1W5XOQHR07W
	50/9jPuJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtdyA-000397-UV; Thu, 09 Jul 2020 21:20:38 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtdy4-00033e-LZ
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 21:20:34 +0000
Received: by mail-pg1-x543.google.com with SMTP id d4so1526864pgk.4
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 14:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=R0X1WZiPa2fv/zPPPrCWvHiss6LlgCawfrwgKo9wAMU=;
 b=gHoLY2mtRy2ScjxyuU7UsDUQjCloeYrxHdCuOW63TOSDuG02GQ35kF/ylikEl8Ya8V
 jbx3MsCzDDDcPG9nbR+Ddp8VGV5f+jDaUCgwrX/EDB9h4i2spUvJqaJDrO8f/G5mvWJE
 i/7qKFp3mlbDr7KLFASIIxN6vAzUqO7BlOBUMRzsCm9dCWViZWxg0yswjNw3vSlBTGWO
 G7bZj3dRDvqd1w+MrGemymGoAPVPlAFirxj3wssQCJvpPgcPzQ4YNOIDJKxJSrkgQXwf
 jp1ijvO5miBXTJ3Ri+lin++jIIdopk1Yq5ynG3ainRkBaa1s9vUBXdU8Di+fxe09sC+Z
 yfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=R0X1WZiPa2fv/zPPPrCWvHiss6LlgCawfrwgKo9wAMU=;
 b=KitetxBejlA//3ZWJPsZLOlrnSgXF/3y+z4fqRexoou6de4AoNpDL/ojb3Vrkcoiat
 8AhaFiIB1RI+h22XiXK3As7KqywYEFu2ea2Z1qaWi8lY+t2FeVL7ZkDAG6qMJldd8Aqt
 CDx0AudDggpWu8tBrbNMBiLqrCPN3FqhLuig6h6GpWmgKpOTEpBnRUZ0Z+SxJ7o0bNG0
 Eha7iyhgUGhksVvpmamh889ixMglUQNkBH3O9QX5CoRQYbcdWamsZq1Ul45QPUuptDop
 /FXoBW4W6fab9AbtYOMLVBUvWAteYgj0rivsi4dUPndpJUqKmEsHBsYeU1lZhLJN3dTa
 zf0Q==
X-Gm-Message-State: AOAM531mVShEYnrFbXiXH+mkU4M2GKjQZuaC7JqSepT/OwqBYBFBHy3V
 3oa862OqTMyqnh652Xogc2RByQ==
X-Google-Smtp-Source: ABdhPJyOOQ3prvzFKDsLYd+p2HeWmGcehQ0vzPmqHYcXilIeLzPEBpHNjdro1JFnj0KAUzSGeeCVJw==
X-Received: by 2002:a62:a217:: with SMTP id m23mr28290249pff.291.1594329630762; 
 Thu, 09 Jul 2020 14:20:30 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y19sm3926535pfc.135.2020.07.09.14.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 14:20:28 -0700 (PDT)
Subject: [PATCH v2 4/5] arm64: Use the generic devmem_is_allowed()
Date: Thu,  9 Jul 2020 14:19:24 -0700
Message-Id: <20200709211925.1926557-5-palmer@dabbelt.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200709211925.1926557-1-palmer@dabbelt.com>
References: <20200709211925.1926557-1-palmer@dabbelt.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com, linux-riscv@lists.infradead.org, rppt@linux.ibm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_172032_793629_2E3C4BDB 
X-CRM114-Status: GOOD (  14.51  )
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
Cc: mark.rutland@arm.com, steve@sk2.org, davidgow@google.com,
 catalin.marinas@arm.com, linus.walleij@linaro.org,
 Palmer Dabbelt <palmerdabbelt@google.com>, brendanhiggins@google.com,
 elver@google.com, glider@google.com, mchehab+samsung@kernel.org,
 linux-riscv@lists.infradead.org, alex.shi@linux.alibaba.com, will@kernel.org,
 dan.j.williams@intel.com, linux-arch@vger.kernel.org, uwe@kleine-koenig.org,
 alex@ghiti.fr, takahiro.akashi@linaro.org, paulmck@kernel.org,
 masahiroy@kernel.org, linux@armlinux.org.uk, krzk@kernel.org, ardb@kernel.org,
 bgolaszewski@baylibre.com, clabbe@baylibre.com, james.morse@arm.com,
 kernel-team@android.com, pmladek@suse.com, zaslonko@linux.ibm.com,
 aou@eecs.berkeley.edu, keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>,
 rostedt@goodmis.org, broonie@kernel.org, matti.vaittinen@fi.rohmeurope.com,
 gregory.0xf0@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 tglx@linutronix.de, andriy.shevchenko@linux.intel.com, gxt@pku.edu.cn,
 linux-arm-kernel@lists.infradead.org, Greg KH <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, changbin.du@intel.com, mcgrof@kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, mhiramat@kernel.org,
 akpm@linux-foundation.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Palmer Dabbelt <palmerdabbelt@google.com>

I recently copied this into lib/ for use by the RISC-V port.

[I haven't even build tested this.  The lib/ patch is on riscv/for-next,
which I'm targeting for 5.9, so this won't work alone.  See the cover
letter for more details.]

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/arm64/Kconfig          |  2 +-
 arch/arm64/include/asm/io.h |  2 --
 arch/arm64/mm/mmap.c        | 21 ---------------------
 3 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 66dc41fd49f2..0682672cb244 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -13,7 +13,6 @@ config ARM64
 	select ARCH_BINFMT_ELF_STATE
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
-	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_ACPI_TABLE_UPGRADE if ACPI
 	select ARCH_HAS_FAST_MULTIPLIER
@@ -110,6 +109,7 @@ config ARM64
 	select GENERIC_IRQ_PROBE
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
+	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select GENERIC_PCI_IOMAP
 	select GENERIC_PTDUMP
 	select GENERIC_SCHED_CLOCK
diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index ff50dd731852..c53eba1a7fd2 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -200,6 +200,4 @@ extern void __iomem *ioremap_cache(phys_addr_t phys_addr, size_t size);
 extern int valid_phys_addr_range(phys_addr_t addr, size_t size);
 extern int valid_mmap_phys_addr_range(unsigned long pfn, size_t size);
 
-extern int devmem_is_allowed(unsigned long pfn);
-
 #endif	/* __ASM_IO_H */
diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
index 3028bacbc4e9..07937b49cb88 100644
--- a/arch/arm64/mm/mmap.c
+++ b/arch/arm64/mm/mmap.c
@@ -47,24 +47,3 @@ int valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
 {
 	return !(((pfn << PAGE_SHIFT) + size) & ~PHYS_MASK);
 }
-
-#ifdef CONFIG_STRICT_DEVMEM
-
-#include <linux/ioport.h>
-
-/*
- * devmem_is_allowed() checks to see if /dev/mem access to a certain address
- * is valid. The argument is a physical page number.  We mimic x86 here by
- * disallowing access to system RAM as well as device-exclusive MMIO regions.
- * This effectively disable read()/write() on /dev/mem.
- */
-int devmem_is_allowed(unsigned long pfn)
-{
-	if (iomem_is_exclusive(pfn << PAGE_SHIFT))
-		return 0;
-	if (!page_is_ram(pfn))
-		return 1;
-	return 0;
-}
-
-#endif
-- 
2.27.0.383.g050319c2ae-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
