Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCAFC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:47:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD3CA61153
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD3CA61153
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPe+kn3lw87yt6/WTL4cptAXPuG20FZNWPOG6THUTOw=; b=Puu+PFgU7OFlY+
	+4swHge7O9m5q1T/+V3mNM1kg70j+0YFiE0MyYWs7Rhy7nuhWeegZgaE0GaS4sOHPN1NrQ0F/Bj8c
	7jDpmFX1Gmng9wExWAlbg/OR/7q4279ADCW1xIh2aPfRxhMV/4avhKxaZN3hn2EDjWWBEWn31DAZR
	b2Sbr06vwFwsxMusvDfCSWinnRUCTBiN1Dbnd67AAwquGgh7VsbfH6c4roEyFKI08FLbg/ZUl10tt
	rwxzbRgpDuNWdYbZd+PXup62/NZ/U6R/iItnQUQ+UppfHlN3liuu10D79K6QqcfqEM4+KIZaQ1HAR
	0CovmE5ASue99Hy268Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1dv-007ISH-6S; Wed, 08 Sep 2021 17:45:51 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1do-007INp-Os
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:45:46 +0000
Received: by mail-pl1-x636.google.com with SMTP id l11so1775718plk.6
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 10:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oNkS5juwsia6SB7bGOojrAbLTbecFtQQ9fLEL8O0v5w=;
 b=RVQ4JtZYx7jyTfuystkOEpsOXyRRa7Src2FGs8ZOB2SiHNbhYAZSUZVKp3c1risQFm
 c5lsMS+jCUT5xXuKkQMbUQlnJO5RsAveQsSM30U961U96y5J6OuTnHvJytBUH64gYDkg
 J0XK2HzmaA6Ko3b0du9yO6RpT4GimfTlEmGaT6vkTM6RtNZP5iMCAHTX/jGga9VtJ5OL
 6Mp+YcRWRxjl5wF5vAt4ej19dek3rfYuf0+XZD8uItOAhx3qmBLa2Tsdkv3SoWMoWazf
 zItFVRAU9SkZVF0Wi1IQCcMDbHk2ZK9Tjbxb51T7zB+65GLpdwE31eo/m70Pe7zkBvs+
 E/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oNkS5juwsia6SB7bGOojrAbLTbecFtQQ9fLEL8O0v5w=;
 b=sWb7x/lCZr7EOmXkLkewj2QWMp53tBamYeCzH7UNzoh+Yg76JUQkiZnE5e5oJcK0uw
 YQ9iKZjCdolEqy7+++zRUky8NLQtT7DidyN6IEDIoD83gPv9UGfAe318mhEvoXzvu7Eg
 9ZQVqZIEKAS+u59kH/3/lnxo9kFVKjbVuJ6oexrWuCJeDHVDCEE6pO5N613K7aUOWEWt
 My2/9qQR/PlewY5+9hkQYXrXcP/AmqPcCz9BrWGgqjKgktEJZligPV0ktFaaBlhg8zct
 EFcifMzVUEeo9h/56HgF11vp9CTwfMfC4VBDn1HywkKAl581y6H7G93enOmWLS06vRej
 zcUQ==
X-Gm-Message-State: AOAM531F6SnkwnvVDiG5miP7n1MA5jPUBR5pS2YE89G/wCxcpzXrpr4Y
 h2facVM1Xm9DlGAe11E1vAupLX2yWhXjzw==
X-Google-Smtp-Source: ABdhPJx3EGcGnD0EZkL4f0+SvMnybZfQnGYOtf5O47oFxQGSK8S3WUh/vd/MsehTR25JjboLkdg3AA==
X-Received: by 2002:a17:903:1c2:b0:138:b303:7b95 with SMTP id
 e2-20020a17090301c200b00138b3037b95mr4024138plh.78.1631123143765; 
 Wed, 08 Sep 2021 10:45:43 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b5sm3108466pfr.26.2021.09.08.10.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:45:43 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [RFC PATCH v8 05/21] riscv: Add vector feature to compile
Date: Thu,  9 Sep 2021 01:45:17 +0800
Message-Id: <3bf5002402f4aad88daf11e223ec40ef195fe308.1631121222.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_104544_842751_E4D2BBA2 
X-CRM114-Status: UNSURE (   9.23  )
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

From: Guo Ren <guoren@linux.alibaba.com>

This patch adds a new config option which could enable assembler's
vector feature.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/Kconfig  | 9 +++++++++
 arch/riscv/Makefile | 1 +
 2 files changed, 10 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4f7b70ae7c31..619cfc370ee5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -380,6 +380,15 @@ config FPU
 
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
index 428bd3bc202f..1450bdde5288 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -57,6 +57,7 @@ riscv-march-aflags-$(CONFIG_ARCH_RV32I)		:= rv32ima
 riscv-march-aflags-$(CONFIG_ARCH_RV64I)		:= rv64ima
 riscv-march-aflags-$(CONFIG_FPU)		:= $(riscv-march-aflags-y)fd
 riscv-march-aflags-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-aflags-y)c
+riscv-march-aflags-$(CONFIG_VECTOR)		:= $(riscv-march-aflags-y)v
 
 KBUILD_CFLAGS += -march=$(riscv-march-cflags-y)
 KBUILD_AFLAGS += -march=$(riscv-march-aflags-y)
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
