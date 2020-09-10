Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C69CC43461
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3DCC20731
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ulr4Ojit";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="azD4MkWS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3DCC20731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/l3H3wZ12ZvAOhWsm81WCgibwEZc9eQATtjAMTPlMbo=; b=Ulr4OjitzVPjakTq+izcTPdjU
	BBm/NCzWi0RMIviJX5puDAb+64Em1w6N+Z0Skf/H+o0Ru5eTnaJY4JCkjG28ghLDA6XAKUORnYY1L
	irGGKqP0IE76/CBttgXLZGuloXaSpSncKaVajQ8wRFW5QQrNpdVroMhjiTaMNl2O9BMfn39A5KY8N
	7vKzB70iZSDzHw9Cz8pbiWBjj9Jei0NVShaWBOFz7kRKODY/XvRC4UuSvqt21We0zywaq41ZMxg/8
	gCAyAWm4d85k6PtrzxzHM8K4CiNhL8q9WbcHZ2iXV68SKuqpXz7LzBWMrafM2kCtaaH7rnWuCVCaF
	QiwsuTIdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHhL-0008Ev-Re; Thu, 10 Sep 2020 08:12:51 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHhJ-0008Cx-FS
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 08:12:50 +0000
Received: by mail-pf1-x441.google.com with SMTP id w7so4196016pfi.4
 for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2020 01:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jTWmtcACzAQn5qJ6Bhs/uGk8LJx7IP1Lqtl0V+UVL/4=;
 b=azD4MkWSBr7dTIgX/UNno4IJiwn9U8nNOQ8s9HUsHeqnVRrnURFEzjZT9lcM7D6ZOq
 Qtcc/XgUcCXx5yOWHr6ZYbTQZK2EeBLqP0tpb+W1pNeStoC/bSIkPpzGx1XrIyqLqznI
 gOFGvz0fzvDQz7GnULmd9o5cgBDmnznWPBC0m5hrBiHSLGB0tJkMkw7ssJphBfpR1M5/
 V4NnYVTumV+zc09YMyI1kzZbm5p7yFtT6lBfbgdXfOavjjpkDvJwOA7LH0x4vt92Uw0F
 9KPhlH1QLoaP06XBpwzq26j/x2hd1QT1GdvCmVSMWcjkFlbHk1R9YpVI+YGgKa6wDUeR
 +QWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jTWmtcACzAQn5qJ6Bhs/uGk8LJx7IP1Lqtl0V+UVL/4=;
 b=X0pAbhwrJtRvkLBt5rDIRkq95F5nr20hgI8+52l66qQH+CDT7/vu2IFXOJXV01C5RK
 30nRHNeCZBYaQo8W8Bpgl39qAJ23sfk1O6tOa03mYumBhJ4y8ejKrgETop2pRMHw9pAs
 rWLoxaUMNMp4Y3J7UL+LlsZPUTvxpXJTI1WcbDwL5oI/LqXYirrThVglW7PKJSASpYwO
 ZmVhlw/mk3+9R621smdM5qaYta5M2UMEF40Xv6rk+3+nTrsgMGPtoXx2Jae7pfEl+zyP
 86x9w+aQMxhlQjgbH9xCb5valxRTmlmSvHu2tXRL1vW2MXUHVLTzTE69tOP4otkMkfC7
 LcHw==
X-Gm-Message-State: AOAM531Cnbl7hMEnzqN5lDStcFymCP87sMxNXoO2ZdentNbkx9bl2y5K
 OS4LHXNV6kt2sOANFj3rcybBRGu+FqwbITeZ
X-Google-Smtp-Source: ABdhPJxKgW/VRNPprSjSiwbdDxz6nC0HICvtgnXwr9m2q/8ztRXpjt6uqMgZy5wNQsaju/4R2qnk4Q==
X-Received: by 2002:aa7:9aa9:: with SMTP id x9mr2832162pfi.67.1599725567281;
 Thu, 10 Sep 2020 01:12:47 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id e1sm2196056pfl.162.2020.09.10.01.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:12:46 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Subject: [RFC PATCH v7 05/21] riscv: Add vector feature to compile
Date: Thu, 10 Sep 2020 16:12:00 +0800
Message-Id: <a9f3a84d3dc7d66b36f10a68c49d6cb75a648a08.1599719352.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1599719352.git.greentime.hu@sifive.com>
References: <cover.1599719352.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041249_529419_DC64F3E3 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

This patch adds a new config option which could enable assembler's
vector feature.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/Kconfig  | 9 +++++++++
 arch/riscv/Makefile | 1 +
 2 files changed, 10 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index df18372861d8..58673089c900 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -327,6 +327,15 @@ config FPU
 
 	  If you don't know what to do here, say Y.
 
+config VECTOR
+	bool "VECTOR support"
+	default n
+	help
+	  Say N here if you want to disable all vector related procedure
+	  in the kernel.
+
+	  If you don't know what to do here, say Y.
+
 endmenu
 
 menu "Kernel features"
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 957d064bead0..7c80c95582e3 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -46,6 +46,7 @@ riscv-march-aflags-$(CONFIG_ARCH_RV32I)		:= rv32ima
 riscv-march-aflags-$(CONFIG_ARCH_RV64I)		:= rv64ima
 riscv-march-aflags-$(CONFIG_FPU)		:= $(riscv-march-aflags-y)fd
 riscv-march-aflags-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-aflags-y)c
+riscv-march-aflags-$(CONFIG_VECTOR)		:= $(riscv-march-aflags-y)v
 
 KBUILD_CFLAGS += -march=$(riscv-march-cflags-y)
 KBUILD_AFLAGS += -march=$(riscv-march-aflags-y)
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
