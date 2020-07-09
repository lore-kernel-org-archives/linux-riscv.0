Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E394EC433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 21:20:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B08EB20674
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 21:20:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e7r4zIZ3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="Ti4pfq5h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B08EB20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aJgLkMTkLQoLPNjWj8sj1fklUXvq6W+VirMPvS1+POI=; b=e7r4zIZ3rtzO9ms7A9TK1I1qI
	4Wz33tTV6taw3zXCzb62XQBWxyVdFixWtoEeCIJX899aVd4NlCIosFbKgf6i0f7VrvznZRCaLjl4p
	BHFtAhNVzY0vqrt2m7JGXRODLwx3a3Dz2XvrRwvX80+adTZZIHBaNMnwx9L3I/V5ZHH3lvbqyjY8y
	L0jeBTnClZmLK087ycCBv2TxNFQe1nsAZUj2kStouJpnnLNCl/ifxqg3WnD3DG3SRcQN7jD6Mm33k
	Kb485bHtAswZpsIOjYyy+tZ2SxYOELwHoIxvapn5CVKNeAd0113b4nAszGO55qQATFLyp0St/fs5f
	7KXrt/0gg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtdy3-00033T-NK; Thu, 09 Jul 2020 21:20:31 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtdxz-0002zk-30
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 21:20:28 +0000
Received: by mail-pg1-x544.google.com with SMTP id g67so1515517pgc.8
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 14:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=n3uMLnloJ4eoHyrHmlqZET1T4BdruPnLDoTh0ErPA48=;
 b=Ti4pfq5hVT7B54E4TaVMVrAeYHki2ArpgjGeSYrfCb/iDXle+vyTyvA31jiZOyXBgH
 lmiJDL4QhUKORseAo9uCFC/RcRTq82RhEBkOgw9HsNYg/iY5PfxwXLnbbitN9Lo5KUsv
 jQ9IwmWEyi7fpghdnLVek5+NXVFPmumgd0ODHdxhTr01UfTuHtHNvwO+dc9ZgNDonQl0
 HnnjedGHGBDZOylRUIXE7Mz0VZ8i/azvN0xXdnAQ/oNHMowrSHWERiG/zIRTcVCRijMZ
 y6PonQUen8yRH6LrlgjRpn7SMjeQxjsFeCDvNqHhm9pnLKmGNeT/EEdGPxO5tev+ny6W
 gdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=n3uMLnloJ4eoHyrHmlqZET1T4BdruPnLDoTh0ErPA48=;
 b=VCklw0odURcFPlD+wBEL5dR5/y2EiODD0JFMP++K4I6Zszk4dtzY10VWFUzThXzMq9
 uPNtBaE5I+FSKazfwJ2Ev7MQOyOhBxHQ3nzAWAABD8chDaDf9GsxrC8y+MjAI85Nf3MA
 r5THCgq1NJcSbHyHLqGjKQU3FS/3kh5aehhEtYrQefezUt6vvLHiLDO5MbdDD2JqejKk
 px4VvNH79jm97QHa1qNAcm8c/52ABx9dtqoYA/+0zN+HIe7uJYz59vTLA0drsrr5xpQH
 J7UPNbbYKlAdjIOb4RBckWpnkVG2ifLKWoepMmz2Wrs3z0lmj1K8vccss2TuKvErkRGR
 QrKA==
X-Gm-Message-State: AOAM530AL3D0SlP6YrnymuqrXzypaQES5o3Lsd2B6P6tXkoab9dEK9ds
 ynpx+HswJ536kcH0qBKZH+taxA==
X-Google-Smtp-Source: ABdhPJwAFW4C6tY74gfZvPffqn4h7O2BREWMy0oRJqf5W76z8L2GT69ClyF9O+6eRuT8V2YNIFJhZw==
X-Received: by 2002:a62:7505:: with SMTP id q5mr56034672pfc.262.1594329625096; 
 Thu, 09 Jul 2020 14:20:25 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d65sm3660443pfc.97.2020.07.09.14.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 14:20:24 -0700 (PDT)
Subject: [PATCH v2 2/5] RISC-V: Use the new generic devmem_is_allowed()
Date: Thu,  9 Jul 2020 14:19:22 -0700
Message-Id: <20200709211925.1926557-3-palmer@dabbelt.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200709211925.1926557-1-palmer@dabbelt.com>
References: <20200709211925.1926557-1-palmer@dabbelt.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com, linux-riscv@lists.infradead.org, rppt@linux.ibm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_172027_203781_C15850BD 
X-CRM114-Status: GOOD (  10.41  )
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

This allows us to enable STRICT_DEVMEM.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 089293e4ad46..8ff368a65a07 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -37,6 +37,7 @@ config RISCV
 	select GENERIC_IOREMAP
 	select GENERIC_IRQ_MULTI_HANDLER
 	select GENERIC_IRQ_SHOW
+	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select GENERIC_PCI_IOMAP
 	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
-- 
2.27.0.383.g050319c2ae-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
