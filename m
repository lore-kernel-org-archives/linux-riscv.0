Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34BFC433E2
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 20:08:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 744052077D
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 20:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SYAw7pB0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="vtT5TnAi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 744052077D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C6h8AjHgpdYlQu/mvEoPi0gClWu650Kr5Nz70zd3Iy8=; b=SYAw7pB0L4E1IPG2D8C2FAa7c
	CjKqqB/hlz5L+9Y30SX/w4MvzXcBHXGPy938HR/IxCVbsw4jP2+QcL134hW5q+EuyaGclNNiulYwn
	weM6pn0Qt2C8CmDgceYxYPyWQ1XRYj5hCbHyxGRF1XwntMVAwH64SSA4SerU7nKQPZht6t/xAp2AA
	+6KdLGSaPMguxWWFKGGckAoRZmDH5fSdwpsFQI4K4tYLePh2Xk17uembzPhOmb2VYjMXvF79i8dpq
	I/XhQMnlw23tkyE2Akcr5UZZS+F9nzHtC9tZcINoNq8wOnY1ny3UiEqBcHJzr2ReKDSfvQNIJq2Ts
	8AISkSJXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtcqL-00045L-OT; Thu, 09 Jul 2020 20:08:29 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtcqD-00040I-Ee
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 20:08:25 +0000
Received: by mail-pg1-x542.google.com with SMTP id t6so1455625pgq.1
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 13:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=Ei0TWvmSq4hVDTuU6LZYzruvqRF7MqwjJV4bz0WiKYA=;
 b=vtT5TnAiVeMv5AwYFOXrUp/RFcwllz1Ts2sQQMp1v6UHnsh+/l149KmZE9zelQji2P
 Wm8rWwY9hflE/9btdDlNCKnMrtEMHuhH17tW6kIO0swAvBwNc8EnAS5+lFIZd/s354VW
 DD7YgymIcJMir17cPMRtmC1k0f4A36wMdLDcxyujJjdABW0nyvD+niFSyHyeB9KBXhFr
 Yn8r0aG18vn2ZykWl99u77GpcsbG/IG7pEYVqSBJiu1TZz+E4zXsuO1TXr5+gtMuUA+V
 q17hKo54X627DvG3UEk1PJBK4gYKhzbiX+sg65RUeP+cdAICZuyQ1b4DCnDr+02afKg9
 U8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Ei0TWvmSq4hVDTuU6LZYzruvqRF7MqwjJV4bz0WiKYA=;
 b=U5X2CAS6si99GFVFTOjW6b4aTc5Qji26OW0VMiut3N86S9uwBvlKFHNC8e5UhU9Wlc
 mtaeKt+2c2GiUJB29z39FCUGTsGTr6Z16mXTd0yODL+AdfTF+H/Ukpd+LBv/n5mLBKYQ
 DLCKG7HP8jGPnPah2BAIcfX46wIenJ/b0iChHGsY+IGgTflo7zdeiAGDNoQRLK+HnZTu
 ZJS1qX5WEFeHPj0+qT6sb7TcpNB30l80DV1xlJIcDiSJUAsnXXv6W0zCXAI+71KvTPCH
 vzYn66Q4FzF5OD/cvfudo7nYKhWxu36pnCp1vdUAXOunzPcRMklhGkrjuScDQ2wcmU87
 T4+Q==
X-Gm-Message-State: AOAM531+SKaueQddYe94WOKwPWB7sSTzRdDcMmoGi3V5wR4pehLJpTOI
 z1AMYSw9LTz1jNLALaFChg1EXw==
X-Google-Smtp-Source: ABdhPJzstPC+eyNkZHH2mSMbiN4JBEyCw7jM/7s8GEh2zAKiRjXBj/1M4nmOotoZA7M2JYQpI2qnvw==
X-Received: by 2002:a63:b18:: with SMTP id 24mr57916489pgl.406.1594325299526; 
 Thu, 09 Jul 2020 13:08:19 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id ji2sm3404749pjb.1.2020.07.09.13.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 13:08:18 -0700 (PDT)
Subject: [PATCH 5/5] unicore32: Use the generic devmem_is_allowed()
Date: Thu,  9 Jul 2020 13:05:52 -0700
Message-Id: <20200709200552.1910298-6-palmer@dabbelt.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200709200552.1910298-1-palmer@dabbelt.com>
References: <20200709200552.1910298-1-palmer@dabbelt.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_160821_691524_DDE5DD3B 
X-CRM114-Status: GOOD (  15.21  )
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

Aside from being inlineable, this is exactly the same as the arm64
version, which I recently copied into lib/ for use by the RISC-V port.

[I haven't even build tested this.  The lib/ patch is on riscv/for-next,
which I'm targeting for 5.9, so this won't work alone.  See the cover
letter for more details.]

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/unicore32/Kconfig          |  1 +
 arch/unicore32/include/asm/io.h | 23 -----------------------
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/arch/unicore32/Kconfig b/arch/unicore32/Kconfig
index 11ba1839d198..5334f51614a5 100644
--- a/arch/unicore32/Kconfig
+++ b/arch/unicore32/Kconfig
@@ -12,6 +12,7 @@ config UNICORE32
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
