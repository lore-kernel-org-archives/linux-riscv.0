Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E09C433E3
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 20:08:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC49820748
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 20:08:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GHHUSl28";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JTLVV+X1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="mUoQh16L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC49820748
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VKNXQ4ZIu5ey/PBIr4TYxKsbM+GS+MKyk3cGXj5SYIs=; b=GHHUSl28E5sXkTm67+3mvjybL
	UYFZegAo6S6jxjSQToHkLN9PdhuRLweCIjSmF7usYMh5nJvKGNytk2mc2+Oo9vaY4yyBQDDuHva+M
	NrMwWjNhnAqzbym0pF5aKXmbMQ7+GLJHVwiWM5zMBM2uSNGWCbO1C2twURp4LomuPnL0vVbYcayai
	wIoVA2f+jR2l3EkvPr/o7XbqmHWOKYNMIt3PzgxFb4jbWLLSuAjif5DKY46jXkJxDus1yzsA5lkGl
	GwhxJCrBPkywwiCs0Py+70T8pfEnix/oBulK50tLuGZU5hUrn819LNvgSCcVbhtrbdb8XVDPxY1oy
	XsGP+YgEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtcqR-00048L-Jr; Thu, 09 Jul 2020 20:08:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtcqP-00046i-42
 for linux-riscv@merlin.infradead.org; Thu, 09 Jul 2020 20:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=To:From:Cc:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=QnurR7K6BPRfnTLUtwHY4Q88UHUkQ5JhJ6oRLe/Vy2I=; b=JTLVV+X1GK6Gjllkl9vmU+LdeZ
 au/BSjro68zosxuTV/KPbmKRGSOzGVMi9eFDiZtGDLD8jOtQt4nqHP0yKY389wtWszmaTcmqo8Ug2
 +MGJxO0jSkxukskBnhfCNKQTyHsowL3tMfwW0gc8h85ovaV/34uK9qnTjelHBmyyJgcyJqfCpBjJm
 KlW2UcoBrU+WDj2nnn+kbGfmLm5OJPVRH3MRF8d1uttP3tV0UKi3C5X+iPXXKGeUXtZNKTmVsseMM
 9ZKNqHGc6Ubvs+McZvdTy4qYJm12IQcizgkpDwCkXQMiGxHAGml8rLnd3jNSkkUbY4OUuQheb18EC
 11c7h8JA==;
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtcqC-0000uD-Kz
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 20:08:32 +0000
Received: by mail-pf1-x441.google.com with SMTP id u18so1466631pfk.10
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 13:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=QnurR7K6BPRfnTLUtwHY4Q88UHUkQ5JhJ6oRLe/Vy2I=;
 b=mUoQh16LfS76JjXiApvCLtUURIrln8QBy4z4KJ9cxNLpVN1HsGpQr1kBYvlfEpIda/
 LoU2sTePgiPsVUktY9PLay5T/LWuA3SDlvl4EC+tzu4MnafyF/ciaZHGkNU/HG8T9OpE
 KVzeCoEIRng2pW5XYTVTkZpES51Xe5P8EaOR57UDK6McQDJBkaQ7s22u07OnYIAhRxj3
 8Kym3DKDmDIbQhedwXAnH996hmuesUoUcKdZZw2jmgUP8rky9R9IycIEElXJJBJQ9h6D
 EwVHGVT8826dl07WOOq2aung0LV8qgk3FPr4NBe71Evllt8Mlkwq1HzZ++bm+1vYZdAP
 KcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=QnurR7K6BPRfnTLUtwHY4Q88UHUkQ5JhJ6oRLe/Vy2I=;
 b=h8bvNiMQS7fv4slP9maBS1ytVPHaoFD9y5ha8qrHi+cFwtFxG6P6x+q3Ut1dvblKb2
 K/oRbDBHmm8mfT14QghPaX9553JWELGM15rb+s7FKpLtYITFWCxtARQRk+kv6dC0TYeJ
 cdFdrhcCPtey80UzWDFgX1Oo12We9p/oxTQKbBQTDq+Td2nkiXMfo+zIpBQcAOrwEdbm
 L9xz8mDfmWBuYf/ZQJWpDa7JFt2G6uPQYvxXOhnfp3Kq7JWVSxx8ocplGnEoOmQnPvnA
 7Y4c7wNVcHDp4sz4zLKqQ3xZ/XuZfGigofJpsQN8hx7j6i6aGA7QJRc5s6jUP5sekaoL
 ZATQ==
X-Gm-Message-State: AOAM53218MC0loY8T1ZvC6u4UgOtJLUHpRhWBssq4CEU51EfnwBkccba
 /PQO+UNo3c1YOFpT3FKuka2G4g==
X-Google-Smtp-Source: ABdhPJxPyfDF7MMhraNjxGcxjmelZhmosqxz9Rr+wxAOwY45CYkRfCLmLvGQVfIwcidfX5xstsKX8g==
X-Received: by 2002:a62:2c48:: with SMTP id s69mr18582019pfs.63.1594325296622; 
 Thu, 09 Jul 2020 13:08:16 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id m9sm3442448pjs.18.2020.07.09.13.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 13:08:16 -0700 (PDT)
Subject: [PATCH 3/5] arm: Use the generic devmem_is_allowed()
Date: Thu,  9 Jul 2020 13:05:50 -0700
Message-Id: <20200709200552.1910298-4-palmer@dabbelt.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200709200552.1910298-1-palmer@dabbelt.com>
References: <20200709200552.1910298-1-palmer@dabbelt.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_210822_018839_6D214158 
X-CRM114-Status: GOOD (  15.75  )
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
Cc: mark.rutland@arm.com, steve@sk2.org, davidgow@google.com, ardb@kernel.org,
 catalin.marinas@arm.com, linus.walleij@linaro.org,
 Palmer Dabbelt <palmerdabbelt@google.com>, elver@google.com, glider@google.com,
 willy@infradead.org, mchehab+samsung@kernel.org,
 linux-riscv@lists.infradead.org, alex.shi@linux.alibaba.com, will@kernel.org,
 dan.j.williams@intel.com, linux-arch@vger.kernel.org, uwe@kleine-koenig.org,
 alex@ghiti.fr, takahiro.akashi@linaro.org, paulmck@kernel.org,
 masahiroy@kernel.org, linux@armlinux.org.uk, krzk@kernel.org,
 rppt@linux.ibm.com, bgolaszewski@baylibre.com, james.morse@arm.com,
 kernel-team@android.com, pmladek@suse.com, zaslonko@linux.ibm.com,
 aou@eecs.berkeley.edu, keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>,
 rostedt@goodmis.org, broonie@kernel.org, matti.vaittinen@fi.rohmeurope.com,
 gregory.0xf0@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 tglx@linutronix.de, andriy.shevchenko@linux.intel.com, gxt@pku.edu.cn,
 linux-arm-kernel@lists.infradead.org, rdunlap@infradead.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 mcgrof@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, mhiramat@kernel.org,
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
 arch/arm/Kconfig          |  1 +
 arch/arm/include/asm/io.h |  1 -
 arch/arm/mm/mmap.c        | 22 ----------------------
 3 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2ac74904a3ce..0c9da68835c2 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -54,6 +54,7 @@ config ARM
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
