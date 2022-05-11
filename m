Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79EEC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 08:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZMMZWwF8pTvOocVRj6YyHUTT/Gc1CdEjNs5Xv1qBpY=; b=WKS3CTVQcMZQZP
	xqGXZtB/9h3y5KSV7wTqSSKfVOjtGnSIRrLUNSQIZ5gg9AZMfgDuzQ2W+HE5mn+PveH3QxcKg0+t4
	TNQ4f7RcOqPYJEdSuDVu0fmGMmbX+NN0SMdBaq/8I/Txd7tFpieIAUhQFoLeIli3YFtqcqCqYeR/M
	W5To+WTcou2e8cQ+nb0t5R8z8htP38eqUGN1PQ1n6htr1i51BUYR+3dPwWshIBiu0f4s9QnlrBjr8
	WID8B04GNkacJLrmcKH4EivQaGP4aXTzJIC41HHk1oouKpMjKWsUIzVhkpYu93SNPp8CFYnBUOTzx
	hhiEEDfDuvL7bvMmQ24w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nohl3-005xPa-EO; Wed, 11 May 2022 08:31:45 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nohkx-005xEO-M9
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 08:31:41 +0000
Received: by mail-pl1-x634.google.com with SMTP id i17so1177756pla.10
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 01:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
 :references; bh=vOP9ZS/vxkzOlI/l+cYdq2hR42ZqOFcbpjPtOsjjFaA=;
 b=f/GBF7F+MFK3EAYxoYQRrccahir05NtthLiHYzXGNTNWj3phkyDZ2fKkhIvoEhMKex
 GFha3bwBcWHrhhkSK7v/OBVw7NoZItkcqrRCD7K8PUQDf897gbKw8a7aaNpYm/HzIUt5
 ug3QcVV4xJ7gZw71SUTKUsLxKtD0rHn9SG7HJxEEtqm2ZpVQLdsDqma4TVsMEiIVrEo8
 E19T2gxzZrFQcfhx+qYSHH4PgZ8VhbFqiISaXwOJe2jUnp+qcTS+zwMcOjFMYGOPEU11
 mQEaVkOo5xqgqVDA9l5sPh1NpI7Cwv84vnYKUr0jICaWf9sQ3/Jj2f6ToVVjM7cwMKmH
 pIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=vOP9ZS/vxkzOlI/l+cYdq2hR42ZqOFcbpjPtOsjjFaA=;
 b=pA6P1p7HNHTza+ulXZkzOVXgSq3ChEkSy+vvVPqikUeYqqP1B+rY6a9G9K+NuG9N2+
 2v/dWuLavm96niqwasUttii+dwVdwGbpppBeTIuOBkigAvmRpKetnXaKKhGnbH4fEENW
 ZRWYFJti8r6kCS2dii8ZZdIULcscDT+yEhigZoUhdcIKgb3j4/kn1sQiKFFlY9e6iEQ4
 /WE2ERDfeqWoBPQKoJKTa99pYuHQfdtytIwS0ApuJz8hsMigy6H8WG3haGfhda4NVuhu
 OFF6xb7GATVZ///Fn7fgDC+LJsQN/djH9rE9k/8df3RGHi+ezHUVo/Ji4EbE4bAZ2soR
 B7mw==
X-Gm-Message-State: AOAM530IZt76MocfpSOVQQrFph3P58HLZ5XoPXF0uEFPaK1fPU+B5Cy3
 OQAHbkBZSLq7k2NsOS5mv+PgKw==
X-Google-Smtp-Source: ABdhPJzd9MohPSdgpI7PT06NrpVeiGGVvF1d4vkuVIARh6Sr2k+nuPxNbBaG8oTBR6ik6brdH9/xHw==
X-Received: by 2002:a17:902:b48f:b0:15e:da68:8f12 with SMTP id
 y15-20020a170902b48f00b0015eda688f12mr24076205plr.27.1652257895794; 
 Wed, 11 May 2022 01:31:35 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net.
 [59.124.168.89]) by smtp.gmail.com with ESMTPSA id
 m10-20020aa7900a000000b0050dc7628170sm1020202pfo.74.2022.05.11.01.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:31:35 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v10 04/16] riscv: Add vector feature to compile
Date: Wed, 11 May 2022 08:31:14 +0000
Message-Id: <f286c78682842079f4718af15f6a5c38ba289e51.1652257230.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_013139_812862_8203C8AD 
X-CRM114-Status: GOOD (  10.39  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

This patch adds a new config option which could enable assembler's
vector feature.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/Kconfig  | 10 ++++++++++
 arch/riscv/Makefile |  1 +
 2 files changed, 11 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 00fd9c548f26..f54f37cc746b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -343,6 +343,16 @@ config FPU
 
 	  If you don't know what to do here, say Y.
 
+config VECTOR
+	bool "VECTOR support"
+	depends on GCC_VERSION >= 120000 || CLANG_VERSION >= 130000
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
index 7d81102cffd4..1f19bdac6767 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -50,6 +50,7 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
+riscv-march-$(CONFIG_VECTOR)		:= $(riscv-march-y)v
 
 # Newer binutils versions default to ISA spec version 20191213 which moves some
 # instructions from the I extension to the Zicsr and Zifencei extensions.
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
