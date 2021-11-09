Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCCEC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:51:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A10E4611BD
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A10E4611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1qvt2qrXLjTDxtR9ADn0rG4pOUWw3f5OXXuTDdnQcY=; b=MeJxA0HMe0Aw1s
	djc/Mqhob6j+EU1h1MdxKqjVDuAbbHcXdv3AUixf/pGY1GMJNRhDAj0d/Y5Sc91kKRMiqsLcq0f5A
	V0zOl1Qp/DC+JbjRDuLWcIu9R1WwSbqkaSSS50NzXtP3YgE1UN+MNeZBuyujWYOumkek0zg8916Wa
	SDQiNwt0BnIcvJ+qwBUyI4BGwEQeVzFTReACl5lFa9L5I1MSJ8v/QzFCibCtntPYiIl6dbCcSliZG
	8SubeKrmeEd4uaEZoLnxn5x2deOEHa1sR7MURtS5h6JaSk+avCyilAIIcfY4ZLNvmmmzGvzOp5WoZ
	tpKkhOvEwxAS33tB1Wjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNmk-001KX6-9q; Tue, 09 Nov 2021 09:51:22 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNk8-001JTp-OI
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 09:48:42 +0000
Received: by mail-pg1-x52b.google.com with SMTP id p17so17993212pgj.2
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=earQXVM9ZpHBsIuYCgsSO014fLReRw8iXSg4gGRjLpA=;
 b=eFQ2LvIIOUcoe8Vnr8ZReO0zVkG6yBNbCkwqFSzinze8kstWqfY3ioU9vyHDUDNntq
 U9wXnP8dttrXtDOsrR04DzHK8J2Mur4UdSmi0f9Yn9Ws4HHi2RosvGd06d8KSzRK5NGI
 UQB7YL7E3rV0FnwJ8J6l/6tUJsIl76hR6HMw+Je3OiHlOXrerdNa4/AfwsI0fDDmMMj5
 XhQDr2iMG9CkD+n3Lvhwb+RDTDLPAyWS1wO2kq0nLzDQm2yXENE+qZGSTVs26GB1UvvU
 jv4cZPipi6gdOKHh1VOEegnNsi/801eWV0mfHu1PgIC48mGcHIJyrM3yzvyjAQvgA1hP
 TctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=earQXVM9ZpHBsIuYCgsSO014fLReRw8iXSg4gGRjLpA=;
 b=Q1rxNYgMrJRjLZQUHFWwQew61xz6MMyJl3KN4Doxss7k7XD6QUGJ9JdBC/kGaaut4H
 GAo7ctSV8afV5THr+DSGPTU2sp1VSGxJtSmoNFCW8u597E2Bl+miABiFRaByYRMNYlmi
 OBfQNuYbn9sj3n1bG45aQFvhnhYIZBEzc2zFyarFdqCQfSSOoI93bYYqpB01/u8jiX9T
 xKxkXW5fdNoqJ4Xxbirtwv1sFZXyW5QfCZLQMk2C2NVqJeYC7FHgrnXrCzTuf3qymTjb
 uzpT11Z67cAiNoLFGzLYhAg4YDKQAScLqeQcLPTkyFCwMnKu4H5chu18nKfSOEfARODI
 Q1JQ==
X-Gm-Message-State: AOAM531xDFAlLWbhYunD2NVToCN8Ad9TfbJDEeYdbxi0vqKL3dkNJz6U
 oGax6/a/C7vrRgn8bmNCQIYz/Q==
X-Google-Smtp-Source: ABdhPJxkLQJhp1q9mtVPkNo9QaKm6TAP/UN94ydOvWwI4RknDQjCZkuDN0aqowjnbprQ93hf3yNPlg==
X-Received: by 2002:a63:7308:: with SMTP id o8mr4878770pgc.77.1636451319866;
 Tue, 09 Nov 2021 01:48:39 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id cv1sm1940511pjb.48.2021.11.09.01.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:48:39 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v9 05/17] riscv: Add vector feature to compile
Date: Tue,  9 Nov 2021 17:48:17 +0800
Message-Id: <2684ea9e25a63c7a88faf46680a26e560027e444.1636362169.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636362169.git.greentime.hu@sifive.com>
References: <cover.1636362169.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_014840_891858_F70F49DF 
X-CRM114-Status: UNSURE (   9.21  )
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
index f076cee11af6..0311579920b9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -389,6 +389,15 @@ config FPU
 
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
index 37de70df4fae..f109214a2d7f 100644
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
