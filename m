Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C86A7C433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 21:20:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FBC320674
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 21:20:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JGy+vvff";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="SUOLf4vQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FBC320674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YLyfzW4a5VP1cd6bro8oQgnVNo3/JQBe3W/5lOKgqBc=; b=JGy+vvffr5CsdPhVNoHpAioeJ
	PnaZWQCH253xYHZ34sMv4z3gn+ZnAI0G4eYGeB/h9yFcuE7syzPNf3PRQ4BiicfqOWDZy7reH7OGD
	igF61Ubd+LStLsr76P7nqVQ4oCgV89NGzEshQqA0hxhkdj/+kgfSPVgjhcLE+vspMTQezTomVuRsT
	QRFUXwc8kVTX0fyux6VCS1bp2jKS/SJvVO9xrNqPzrtpEDEPiYNzduX+oO9lVSpn1xgWKQsK3qAep
	mwhlpUNPDfXtJgqRbZXagPdXHIzCaJMBykzx7lXv8e5bvTRArne3YMZ7ygvFmbiiz73LyP1foishq
	9+1gUQXZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtdy9-00038J-Ti; Thu, 09 Jul 2020 21:20:37 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtdy1-00031j-VU
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 21:20:32 +0000
Received: by mail-pl1-x641.google.com with SMTP id x9so1342781plr.2
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 14:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=humMU+Z0Exo5hJuZkhcd7ak4FYmgdKWiBrCsvIrWPuM=;
 b=SUOLf4vQarIjvyvlOOAhhVT7P9m21jtN5ihUqtkZ9obzyZaC4L/EUFtfArBgEiwQJv
 0LQWUVLHki9V8Qsi3maekJoY6vs2o6bbfZvYZnE3jyho9VJWMDcPyv2KCJjcGoDmwUXI
 CHj65+PTXI1vkP727zohZ6WNglt5+oFlC7NCJ1pJ+W8driafdgcKQzN5VyI7d8X7cYGo
 +aIIQ+X0oyE8RbAtl+uMA5dW8nX+xlGlq3gTvjc6U3SgbnTo05nPNIV3HBSP4tw+JJG9
 9Y/+gHoQ6N/yB2w5gvCVPVlKITZi8MYRJyRMXvrbx2EXMb9PuPSkJ25eLkR2CZypkG8P
 roEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=humMU+Z0Exo5hJuZkhcd7ak4FYmgdKWiBrCsvIrWPuM=;
 b=ZWaH2MD/ir5LjFDPTyDB7v4ll6h3/WeZFpvd/x8PP8MH6923FrOzNfg7ipOoMnQaah
 YOamTwz044buI0XcAQ4OAVv/tTM/mTcWgsNVZoOeZfhh9rHW90J+ANP3cut+0UpBnfbK
 kStB54iSMbBNumtmFoBFdJeoNa/pvvdqjWtMN8L8l00f5Xv6Zy9Xgz5+Drmzhf6A7Kuv
 gPZwpjDdEPCqJQXIXxHcWW7THn2oQ5fC0dhoPKlUXCHxgEDbklx0qMaJ02MBGiZG2nDk
 RW9oSS1TeU00oEhcHuJ/NvVv0H64W84loIqMK9zmsJ6ze+aGXVRHXGyuoN1toMSnFSto
 CuIA==
X-Gm-Message-State: AOAM531M8aAN/yqT5RZ2WY3CSeZby7i9WXIv92YtNKJi7gUkKn9zFiy/
 Id0RjGH8q0NUO8xymjMpEgm39Q==
X-Google-Smtp-Source: ABdhPJxUaJZaEgTh+T28Cmi30vt64oGCq5p0op2S/N93QpXKWiXPU6WjltK9bv4DtLQ0OZxLGtsZRA==
X-Received: by 2002:a17:90a:ea83:: with SMTP id
 h3mr2214598pjz.176.1594329627792; 
 Thu, 09 Jul 2020 14:20:27 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id p10sm3567439pjp.52.2020.07.09.14.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 14:20:26 -0700 (PDT)
Subject: [PATCH v2 3/5] arm: Use the generic devmem_is_allowed()
Date: Thu,  9 Jul 2020 14:19:23 -0700
Message-Id: <20200709211925.1926557-4-palmer@dabbelt.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200709211925.1926557-1-palmer@dabbelt.com>
References: <20200709211925.1926557-1-palmer@dabbelt.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com, linux-riscv@lists.infradead.org, rppt@linux.ibm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_172030_070599_0883AB89 
X-CRM114-Status: GOOD (  15.10  )
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

This is exactly the same as the arm64 version, which I recently copied
into lib/ for use by the RISC-V port.

[I haven't even build tested this.  The lib/ patch is on riscv/for-next,
which I'm targeting for 5.9, so this won't work alone.  See the cover
letter for more details.]

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/arm/Kconfig          |  2 +-
 arch/arm/include/asm/io.h |  1 -
 arch/arm/mm/mmap.c        | 22 ----------------------
 3 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2ac74904a3ce..da0f88f6c196 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -5,7 +5,6 @@ config ARM
 	select ARCH_32BIT_OFF_T
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
-	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_DMA_WRITE_COMBINE if !ARM_DMA_MEM_BUFFERABLE
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FORTIFY_SOURCE
@@ -54,6 +53,7 @@ config ARM
 	select GENERIC_IRQ_PROBE
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
+	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select GENERIC_PCI_IOMAP
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
diff --git a/arch/arm/include/asm/io.h b/arch/arm/include/asm/io.h
index ab2b654084fa..fc748122f1e0 100644
--- a/arch/arm/include/asm/io.h
+++ b/arch/arm/include/asm/io.h
@@ -441,7 +441,6 @@ extern void pci_iounmap(struct pci_dev *dev, void __iomem *addr);
 #define ARCH_HAS_VALID_PHYS_ADDR_RANGE
 extern int valid_phys_addr_range(phys_addr_t addr, size_t size);
 extern int valid_mmap_phys_addr_range(unsigned long pfn, size_t size);
-extern int devmem_is_allowed(unsigned long pfn);
 #endif
 
 /*
diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
index b8d912ac9e61..a0f8a0ca0788 100644
--- a/arch/arm/mm/mmap.c
+++ b/arch/arm/mm/mmap.c
@@ -165,25 +165,3 @@ int valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
 {
 	return (pfn + (size >> PAGE_SHIFT)) <= (1 + (PHYS_MASK >> PAGE_SHIFT));
 }
-
-#ifdef CONFIG_STRICT_DEVMEM
-
-#include <linux/ioport.h>
-
-/*
- * devmem_is_allowed() checks to see if /dev/mem access to a certain
- * address is valid. The argument is a physical page number.
- * We mimic x86 here by disallowing access to system RAM as well as
- * device-exclusive MMIO regions. This effectively disable read()/write()
- * on /dev/mem.
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
