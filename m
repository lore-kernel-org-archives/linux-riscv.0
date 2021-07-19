Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60E2C07E9D
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 20:53:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4D856113A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 20:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4D856113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FbIaeNx43kOhiuNb0OeBHLh909Ej+PL91bvQne3J+jc=; b=CgyAMnRHIY1S3h
	Y4BKD0dUu4LCjzjt80+nwD3/nvtLPE5Z/a5U6hC4RRh+PhM6vDUgiMDmbSGpFEqATOgYH1KB2S+cf
	uAIHxpdZsPLAiLP7eBvpYf+w47bZU276Myda3KczPezaJ373U9k9IYDD6T3NRD9dQWrvMIFrxluH4
	DBcQv1FAqaFatqrpuch1AwxLgmIfIrhmKGd3o7MYAGHS5n6GuV7VPjsCkRVdOSHgz6t4PvHEdMQcp
	DV3CA+Fc3a99dMwcISeHormAnFJ5/FtUJ0LSHdr04GpxN4ruibZh7aCwCXWcEbTObQ99JFUsH3wDV
	0lAsfkQxNbrdA+XEFw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5aGA-00BJT5-Vx; Mon, 19 Jul 2021 20:53:07 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5aG8-00BJRi-Dt
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 20:53:05 +0000
Received: by mail-pg1-x529.google.com with SMTP id y4so20375658pgl.10
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 13:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8A1iXDeLNYYrVR0I32gx+QMWguxvpqwemwOUepfzw5s=;
 b=HYSrMR9Zep+UMiSH3YqYBlB9E8jy2LFQ9eB1q/SWNvL0VO0h33LzpgkcJNkE3WSG4L
 Aqos5F4Y1uQzUE8Oi/qyn4QyAPagI4SI96sqgq3pybuDUq1xXP1Ts+gVd2kfqr6Kl64E
 0Aja/nD/1QSyEA3W/p7Z30E5bZEptaAhmSUC7/xsVOL6Zi7kNpOD4qbdTHRCBuwt7kCN
 XyXgY+CF7KzZBsbUrbfleSiJ/FVw01I9UnFtvmBxwTkLJXOPDOJfUhV27QolN7gg1cjC
 7TC/QncHcXX6fQsqGii9rLUHvhNZF30jkz9lTbkcgMZre5UHuAeqZrFk+VSqQw90/Y6O
 ZTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8A1iXDeLNYYrVR0I32gx+QMWguxvpqwemwOUepfzw5s=;
 b=EZM2Gl6HLX7OWZKJ4iBMkfUQsEwq5mKM/A6eMCC2a2smCkniwQ/wFNglTPXBtOhJkp
 5UzgH3vxjEj0bXcDM6G5L1VkH/aYJJIBd0P7HYWNqQwZk6tH3rFUaMTnia2dX866un9a
 cpR5Q/lgeMfUYzOy4gmkc66Hvg9/ahPu/jNdsCVmtPlvJJnlrGzkWn5YDW+JexgRRz4J
 vsccJuS6utKW8UUCp9JCRnKOCFXvrCmFWUXzvgIlgTgATpIjK4SZCcY8BRcQzuvMpEWj
 Bja4BMb9EqFbB5+uTOUSbN2rrk1bS4mKQQAQhJhlhcvGrgcr4lZ2Zy3SjOAWtZDaSDXp
 Yr9Q==
X-Gm-Message-State: AOAM530QLSIUcnHwZQWfG0pkNI8lp4ymS+WLPDH6rx0mvvTLm6tUlMki
 kuBY4MY1/ZMDwrL68betkNUCyLmeMcGSjHUb
X-Google-Smtp-Source: ABdhPJwe4Oi1OwTIQCaKihtJYps+hyJEuEcvsx3p+EGK4Yxwjizv+fjP/bF9k+SqvOgAZv261yY/xg==
X-Received: by 2002:a65:6243:: with SMTP id q3mr27333523pgv.297.1626727983495; 
 Mon, 19 Jul 2021 13:53:03 -0700 (PDT)
Received: from localhost.localdomain ([2604:a880:1:20::1f:7001])
 by smtp.gmail.com with ESMTPSA id b19sm5621281pfo.97.2021.07.19.13.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 13:53:03 -0700 (PDT)
From: Wende Tan <twd2.me@gmail.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: Wende Tan <twd2.me@gmail.com>,
	clang-built-linux@googlegroups.com
Subject: [PATCH 1/3] RISC-V: build: Pass `-mattr` to `lld`
Date: Mon, 19 Jul 2021 20:52:47 +0000
Message-Id: <20210719205247.1023289-1-twd2.me@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_135304_506634_A96DF1F4 
X-CRM114-Status: UNSURE (   7.25  )
X-CRM114-Notice: Please train this message.
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

Pass `-mattr` to `lld` so that it can generate proper machine code.
By the way, it seems that `-march` does not work well now.

Signed-off-by: Wende Tan <twd2.me@gmail.com>
---
 arch/riscv/Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index bc74afdbf31e..bbc186a3ab45 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -52,9 +52,16 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
+riscv-mattr-y				:= +m,+a
+riscv-mattr-$(CONFIG_FPU)		:= $(riscv-mattr-y),+f,+d
+riscv-mattr-$(CONFIG_RISCV_ISA_C)	:= $(riscv-mattr-y),+c
 KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
 KBUILD_AFLAGS += -march=$(riscv-march-y)
 
+ifeq ($(CONFIG_LD_IS_LLD),y)
+	KBUILD_LDFLAGS += -mllvm -mattr=$(riscv-mattr-y)
+endif
+
 KBUILD_CFLAGS += -mno-save-restore
 KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
