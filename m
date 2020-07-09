Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52069C433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 21:20:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DA6A20674
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 21:20:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OHYu/XdK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="Uw061yOt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DA6A20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T9u4pOQ/XW5FuUcQJmCWLz/OJa3uBEBoXMke5XM55GA=; b=OHYu/XdKOZhZ82EKIi3aZS4/v
	3d4fjpAQaepP5WitZbeWg693KhR6B8JzSSEyJ4BI7JfA9+eTSON/MvmxwKR7bVwct2vCX98ks/6bg
	YBBwNrl5sIWVb1POd3TwPV7MMUUzaPKVLejP8E8ry5eCcJnVJAiCKzjyGYnOocgdmICoAUVOzef0g
	BPY0Fd1aG3bXWAJ/6+53Ag1AQNA1ASN43QyW0PVG/edHbpNHSVX2dn0ABa8AqnfKmHQ3IZlAYu+rW
	Loy9wt3ifghDebSzDDiwn/B01I23j2EwlIc+8IVRL+jGMB7+VQuFcZbBCrel1ydx0VtbFt5ecXnPu
	O9WCZ7gGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtdyD-0003A6-3R; Thu, 09 Jul 2020 21:20:41 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtdy8-00036E-5b
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 21:20:38 +0000
Received: by mail-pl1-x644.google.com with SMTP id x8so1329300plm.10
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 14:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=mwiqaheWU8Sd0guj2IwnvydGK+iHxoHpd+MuCk0aqII=;
 b=Uw061yOt7OeddQFKqaypRf5R2yIYdjOMOco3/+7Alxe2a1baKGudlPSVh2eRLk7Agm
 8GH7xetKjHjyKvOR1maVuUSTL0g9axXGDOKBsrj6j4djlKTpJrtJOkuLosO1YBecrWNf
 mKLBekf+OdiRN2/d4pLs5meFRu2mTzSdTIh2kYwSOvbK5XV6Qdk9hzMsOvWyOEwph0lY
 nZXbVUMuQnzuoK6DHvluQhnGwVAysRvICuO3JkkOnD44v6VSohj7e0RNS5pkqkHtbs4h
 VoMPZBsazXY/0R9hYqmSNyVteIruHr5UH6yb0Dbke9x+lreLXrYB9DXqqVEfOe+lUtGc
 GUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=mwiqaheWU8Sd0guj2IwnvydGK+iHxoHpd+MuCk0aqII=;
 b=IT+mihRU3Khdtw6oRo9MoI6PNtj2ocOtGjBDUgiO9r9t/Cg/MLZVpYhy3T9MPcu2X1
 nqElF8vTh9hvQ8GC6DHoOFvPHnXCMpFhzxdGTyVOPJZK5zaFxUP2cx4OJPeq+NG6OQJo
 mwGWlzT+TrqxXNy5nV4e9AKc3psGb8og3i4m4aosqTMD2/K8s/h4xYbh3yyS71PHrbY6
 QgT3UgYfJc76HSaUalUdirwxGiBvUUPsWB/VqlJ7Qn0mwnYc393nvXHBAy6RwfGiY38t
 Wa55YqGvDDxwyjTeHQd8DsZEkx4AH4/qQJ6xp1y6M2/b16C6kzQwIi70dZDK2d17dCuu
 H1SQ==
X-Gm-Message-State: AOAM530ws7B/caLgpi9ztz3f2PBSfvlRBlhYtriK4mgFm3J7CZ7xtR5R
 Cq9LmlR4RwHz6t3Q24JwguFgdQ==
X-Google-Smtp-Source: ABdhPJzLsRo3etfu0HhpC+DBT4gHVQ7ocsi70IQCb8hFwx9+nia8o+Hy+mBoiPb4zdhaZgAHcr7OEg==
X-Received: by 2002:a17:90a:eac7:: with SMTP id
 ev7mr1955691pjb.21.1594329634168; 
 Thu, 09 Jul 2020 14:20:34 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x7sm3694230pfp.96.2020.07.09.14.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 14:20:32 -0700 (PDT)
Subject: [PATCH v2 5/5] unicore32: Use the generic devmem_is_allowed()
Date: Thu,  9 Jul 2020 14:19:25 -0700
Message-Id: <20200709211925.1926557-6-palmer@dabbelt.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200709211925.1926557-1-palmer@dabbelt.com>
References: <20200709211925.1926557-1-palmer@dabbelt.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com, linux-riscv@lists.infradead.org, rppt@linux.ibm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_172036_423788_65DB1896 
X-CRM114-Status: GOOD (  15.97  )
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

Aside from being inlineable, this is exactly the same as the arm64
version, which I recently copied into lib/ for use by the RISC-V port.

[I haven't even build tested this.  The lib/ patch is on riscv/for-next,
which I'm targeting for 5.9, so this won't work alone.  See the cover
letter for more details.]

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/unicore32/Kconfig          |  2 +-
 arch/unicore32/include/asm/io.h | 23 -----------------------
 2 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/arch/unicore32/Kconfig b/arch/unicore32/Kconfig
index 11ba1839d198..7610571044f4 100644
--- a/arch/unicore32/Kconfig
+++ b/arch/unicore32/Kconfig
@@ -2,7 +2,6 @@
 config UNICORE32
 	def_bool y
 	select ARCH_32BIT_OFF_T
-	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_KEEPINITRD
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
@@ -12,6 +11,7 @@ config UNICORE32
 	select HAVE_KERNEL_LZO
 	select HAVE_KERNEL_LZMA
 	select HAVE_PCI
+	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select VIRT_TO_BUS
 	select ARCH_HAVE_CUSTOM_GPIO_H
 	select GENERIC_FIND_FIRST_BIT
diff --git a/arch/unicore32/include/asm/io.h b/arch/unicore32/include/asm/io.h
index bd4e7c332f85..4560d2531655 100644
--- a/arch/unicore32/include/asm/io.h
+++ b/arch/unicore32/include/asm/io.h
@@ -42,28 +42,5 @@ extern void __uc32_iounmap(volatile void __iomem *addr);
 #define PIO_MASK		(unsigned int)(IO_SPACE_LIMIT)
 #define PIO_RESERVED		(PIO_OFFSET + PIO_MASK + 1)
 
-#ifdef CONFIG_STRICT_DEVMEM
-
-#include <linux/ioport.h>
-#include <linux/mm.h>
-
-/*
- * devmem_is_allowed() checks to see if /dev/mem access to a certain
- * address is valid. The argument is a physical page number.
- * We mimic x86 here by disallowing access to system RAM as well as
- * device-exclusive MMIO regions. This effectively disable read()/write()
- * on /dev/mem.
- */
-static inline int devmem_is_allowed(unsigned long pfn)
-{
-	if (iomem_is_exclusive(pfn << PAGE_SHIFT))
-		return 0;
-	if (!page_is_ram(pfn))
-		return 1;
-	return 0;
-}
-
-#endif /* CONFIG_STRICT_DEVMEM */
-
 #endif	/* __KERNEL__ */
 #endif	/* __UNICORE_IO_H__ */
-- 
2.27.0.383.g050319c2ae-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
