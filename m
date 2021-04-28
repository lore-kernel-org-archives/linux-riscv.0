Return-Path: <SRS0=fWiV=JZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E8BC433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 03:35:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 411D161042
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 03:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 411D161042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hhttFpiTPOh1dj9nMqoXrZ2IfucPsULLmA+WOLnlnkw=; b=oVuUSR3BLnMJDacSkIft8KwJ1w
	qzgTzY7qGLDkdwqE87AB48g5KIzeOpAWwvcJRo6ghDEWJyBZmw7GluMwJXJ0wePSZwH2yJbJZflKm
	IkVUWKpbX/7owGZ002yWxBfBvGSQ9BT64HMJvwxy20Rfi4VZzl3bXBjyaVRXh7YT33nv8O7MMcMip
	Wv1RL9aaIdy7zh5yelAyBNaSY6AW2G6c8wXKJC1mxS9O7tBvTZUaBo5JJ+0Ch3iJVnXreKkJ8ehTE
	+PNGd+Ef1j+jd3iIxJO+40N3+uhHivCyZV8eAiSzH4JP/uUeQDBpbhn23UBQK66PCClHY5Z2uFpHv
	VkegNQTA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbaz3-002gb2-Ls; Wed, 28 Apr 2021 03:35:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbayy-002gaR-5q
 for linux-riscv@desiato.infradead.org; Wed, 28 Apr 2021 03:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=To:From:Cc:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=vtak+go3WyFH+Z4SifbQHwiLP50hFLvT92GjDh2aMwc=; b=ClWlAsajPRsEpSUE6c8TmcZMvH
 SZ9qO5OlNnBFRX2kjFFcJBLZtxHnlqq5lkGMy4KgTB8VhUIRkgPNs89VqI8r9t1yZtNmyuj3da0tn
 9WE41reqWyAW2k2QFPtrjQyeYVgdX7uKUqildDHWJMo796bC2zqKstXUHNDsEsuN75aAKOc1+4rpH
 58lxzuwJB4VAjqZLu5zdkNPZ2WN+OJDziq/NGGgkrziMSKeluN6hO5ZXarv8iRq+V1BElE26sYB49
 019fkzlNGYv+Gepkv/bwP+XMCVq26B9lWUbld+EybeJEOlTal4uONEF5bBZe7q4zJxEScH7EHr3Ic
 MDEr/ERA==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbayu-00HA2f-Pz
 for linux-riscv@lists.infradead.org; Wed, 28 Apr 2021 03:35:22 +0000
Received: by mail-pj1-x102d.google.com with SMTP id md17so4620277pjb.0
 for <linux-riscv@lists.infradead.org>; Tue, 27 Apr 2021 20:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=vtak+go3WyFH+Z4SifbQHwiLP50hFLvT92GjDh2aMwc=;
 b=dsDpNy8jry1Is3B4NZLRFbftN/qOKSSeld8iqW2y0DSZ1+Qag1mVZAgj0bb7W7kvVm
 Q43mtfUJOzXIQEDaaa6VCuR26ZZ+ZlDOkFcDd2wvVVrttEIZUCKGn6R+6b/5/cz81rU1
 GS1VFc5v/MHO/Iv7fZ83H9JIPwYMEfOK+aNicNMXMZ6OOd7Kd/b7A+kEXxEN6iBJ11cq
 q9PlWbZI4dnoHRp4vtDlidTdbOQ5LS3m2fRur65vcd2MGGes6GI5gBE7V2XCg5dJycGf
 LTG+cZLtFC+1oSVVjnxS4NabKajQBLr9RIFMv5lTthDqJbkMAtM/oYMlgb1K6bvxDuw4
 yGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=vtak+go3WyFH+Z4SifbQHwiLP50hFLvT92GjDh2aMwc=;
 b=EYUFtYfn3He7n4N6DfSxCBBX+ybDK1tam7NziPv6Z25qxdBVuDSSVYVfXWtnS9TUXP
 45x4EGIMQu8wHphT4N0J6qcFyqPFDbOxbipeaWBmQ77w9fz5BPIhEq0Z+GMpncZjZ2+w
 NH0p+Z1UKnKFOIBAII8v2r2c/UDA2MjauP0zSfgzAYugdIobYlbso/bDvBiThAvAUcCX
 z0Ct50x4/u4+JwFnLeg1WtUItjh5Yf60wn7MBE7QiV0NBbfmazh34qYNIzbacGlZrSJD
 MsnVFrcjJXan+FT1XgcSpoeK3gQG08Ic5fY8Z4Ddg3oE/YX7LMLO1CfJWd21gz2LqjUi
 cg9g==
X-Gm-Message-State: AOAM531gZjJ275Blxe+vw/ijihbr6avlY/QH4Ajul5OENa8V8HlPla1w
 8ulzDxIacupiTYKY0w8uzVCEpg==
X-Google-Smtp-Source: ABdhPJwjSP9qSrfeRTIdS587iYsRRioH6Tt+Hjyvj1BL7CkB1aMM8MxUoMihwS0dFCLXPjsqoxB1GQ==
X-Received: by 2002:a17:90a:a613:: with SMTP id
 c19mr1681578pjq.117.1619580919209; 
 Tue, 27 Apr 2021 20:35:19 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z23sm972435pgj.56.2021.04.27.20.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 20:35:18 -0700 (PDT)
Subject: [PATCH] RISC-V: Always define XIP_FIXUP
Date: Tue, 27 Apr 2021 20:34:15 -0700
Message-Id: <20210428033415.107756-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, akpm@linux-foundation.org,
 Atish Patra <Atish.Patra@wdc.com>, 
 Anup Patel <Anup.Patel@wdc.com>, wangkefeng.wang@huawei.com, rppt@kernel.org,
 vitaly.wool@konsulko.com, 
 alex@ghiti.fr, greentime.hu@sifive.com, 0x7f454c46@gmail.com,
 chenhuang5@huawei.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-team@android.com, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Guenter Roeck <linux@roeck-us.net>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_203520_930488_5979B079 
X-CRM114-Status: GOOD (  12.89  )
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

From: Palmer Dabbelt <palmerdabbelt@google.com>

XIP depends on MMU, but XIP_FIXUP is defined throughout the kernel in
order to avoid excessive ifdefs.  This just makes sure to always define
XIP_FIXIP, which will fix MMU=n builds.

Fixes: 44c922572952 ("RISC-V: enable XIP")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/pgtable.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 2f1384e14e31..fd749351f432 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -73,18 +73,6 @@
 #endif
 #define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
 
-#ifdef CONFIG_XIP_KERNEL
-#define XIP_OFFSET		SZ_8M
-#define XIP_FIXUP(addr) ({							\
-	uintptr_t __a = (uintptr_t)(addr);					\
-	(__a >= CONFIG_XIP_PHYS_ADDR && __a < CONFIG_XIP_PHYS_ADDR + SZ_16M) ?	\
-		__a - CONFIG_XIP_PHYS_ADDR + CONFIG_PHYS_RAM_BASE - XIP_OFFSET :\
-		__a;								\
-	})
-#else
-#define XIP_FIXUP(addr)		(addr)
-#endif /* CONFIG_XIP_KERNEL */
-
 #endif
 
 #ifndef __ASSEMBLY__
@@ -101,6 +89,18 @@
 #include <asm/pgtable-32.h>
 #endif /* CONFIG_64BIT */
 
+#ifdef CONFIG_XIP_KERNEL
+#define XIP_OFFSET		SZ_8M
+#define XIP_FIXUP(addr) ({							\
+	uintptr_t __a = (uintptr_t)(addr);					\
+	(__a >= CONFIG_XIP_PHYS_ADDR && __a < CONFIG_XIP_PHYS_ADDR + SZ_16M) ?	\
+		__a - CONFIG_XIP_PHYS_ADDR + CONFIG_PHYS_RAM_BASE - XIP_OFFSET :\
+		__a;								\
+	})
+#else
+#define XIP_FIXUP(addr)		(addr)
+#endif /* CONFIG_XIP_KERNEL */
+
 #ifdef CONFIG_MMU
 /* Number of entries in the page global directory */
 #define PTRS_PER_PGD    (PAGE_SIZE / sizeof(pgd_t))
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
