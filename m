Return-Path: <SRS0=Qujn=DH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6938C2D0A8
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2020 06:57:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E01F2075F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2020 06:57:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3Ci4p+t2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="fwowuDdE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E01F2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OUJcdPFJDkSBVU5ZwLq2ZfNab0stqLvYcJLjGY1Z3fU=; b=3Ci4p+t2FRgj4VCb7LgA6MEKuH
	j4Il27tyo/RObwvivG/zi1Wrfzb6ENRunNEaoJC7HB+vX8DWItwcQv/Lr9VkLYZT365iwidbaszwT
	SH3DluBT7A8yHQzSUvKDi8pUSC0faOkfs9sZDzkrnUCrs5FJtXWkM44r8MIzAGzM8tavl+qiOTW2w
	gXMO16SrKZOXpP3iuq1pakbswoDlBQmRs4d2OBW/BeUPmISBobIGo9vvCFLIhctqJ11pliEJ+fzz7
	KIUpPjktwnbIWuyeuQkYMWzAzt9IkT/BZKvMyPIGTBqJHfBCBum5+eogQ38/R6Fxpv+CLpBbHSfNK
	MjCHYh/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNW37-0006A0-RO; Wed, 30 Sep 2020 06:57:13 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNW35-000692-Gl
 for linux-riscv@lists.infradead.org; Wed, 30 Sep 2020 06:57:12 +0000
Received: by mail-pf1-x442.google.com with SMTP id k8so534093pfk.2
 for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2020 23:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=lM1G5qtj1KP+2jbfUsJYM02oVBwt+aqRoGHsH0e9HdQ=;
 b=fwowuDdE+hnj1IIHEa9T2Yy7DKtbvXg0vW6dhJTEVaJx0IBV5KXh/U6Di+qRGGfMnH
 x2l10xkBQ0MMNIt9zxK/Kvjf3eE5//oUtcSyo7l/CIdtTXxegW1zO4QUqyrgDxSnliDM
 vFMBAZfw4hqj2au1c9kD8uvqro5N8W4IQ5F8U7ZsdTKz5J9yVZTo96hrus99Ou/s5SMs
 OTbmUE+Llw7gYj24p1v9t2wR9YmGIz8kTiZJhc2jGyYHvIdyWOl3f04JvcbcoAmuiW+1
 Ew6homjm8CHtZ/NXtpxr1baGN/bzhRziiA6VMOHtg2dgldHkZr7DVzGq0eikt42XZtpI
 WFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=lM1G5qtj1KP+2jbfUsJYM02oVBwt+aqRoGHsH0e9HdQ=;
 b=Sflkt+7M9EvhH7psmWzi3nWsI/gwAj0aKSxnTr/MT1fdJeT+kGske8HF3TBpkPdck0
 +CUbDxGcmU0xCWO/cMlUChVMWah1J3brG5EOA/BwM+Es9VutFUd0PX6/SgAZHGQZQikM
 44Os4015/0pBqCiGyEOFM92Icv4sLh8imZZdfLbj+7rqnDREbOSRcQFjD3oO8asdVp04
 NrOp6u5leOmoiR8yZVDGxAlgIz2+kqax/JvBsuQnvzOndEbUERj9+2x8jen+ErJj1usU
 +wLlMJOVq2KcEnRlG07tZ+3bfomDHCxOG34so2EH1CsraBF6Ctg3XYuMymftSdHjTzfj
 LpOA==
X-Gm-Message-State: AOAM531AfFqB3Hs+8z8X5UwvtQjlKC5YfV7BazIf/56sGRe7S6/51C/K
 YLVmioCojNGpuRrIHii7f9+SSg==
X-Google-Smtp-Source: ABdhPJynrJs9UeDuENgQepipJXbUOcQYcOnevRFxBHMumsQvEXGl4vxDLIe+1abPC9Lu1exvdcux7g==
X-Received: by 2002:aa7:871a:0:b029:138:b052:3dc2 with SMTP id
 b26-20020aa7871a0000b0290138b0523dc2mr1425573pfo.1.1601449026689; 
 Tue, 29 Sep 2020 23:57:06 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t64sm997241pgt.38.2020.09.29.23.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 23:57:06 -0700 (PDT)
Subject: [PATCH] clocksource: clint: Export clint_time_val for modules
Date: Tue, 29 Sep 2020 23:56:18 -0700
Message-Id: <20200930065617.934638-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
MIME-Version: 1.0
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_025711_591156_FB689422 
X-CRM114-Status: GOOD (  11.70  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, kernel-team@android.com,
 kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

clint_time_val will soon be used by the RISC-V implementation of
random_get_entropy(), which is a static inline function that may be used by
modules (at least CRYPTO_JITTERENTROPY=m).

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 drivers/clocksource/timer-clint.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index d17367dee02c..6cfe2ab73eb0 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -38,6 +38,7 @@ static unsigned int clint_timer_irq;
 
 #ifdef CONFIG_RISCV_M_MODE
 u64 __iomem *clint_time_val;
+EXPORT_SYMBOL(clint_time_val);
 #endif
 
 static void clint_send_ipi(const struct cpumask *target)
-- 
2.28.0.709.gb0816b6eb0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
