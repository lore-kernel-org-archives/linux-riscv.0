Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA9EC678DB
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 15:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bP55+4BHBkM9s+1GeO1RR4T+m/IeuwjA1+uYZYN2uP0=; b=o7Cs616fACgb+b
	GnE35vWkDCudFCxsh4vx7ZI+Yp61JSWj6LWkpzgHY0CU0ItddUZlrqgbta7bNU1X6r2+Ws9QL98tW
	FPvFlS7gce396s7CmnUT0h0gCGBOJCPyv+5fSeqDJ05OKVrlH7sQieZ52uGTyU5NqlrhNT2S5olsO
	PynvXwDnURjI6awwpLzCshR4t+kFkDP7Xeb+IygnB+RSVMxQXcEttyuQc70l2aTKEatJdYVuszl+v
	cLnnmMgo7NwlGWh0OLHuVIJ5LJwEfKUQw2Mxz75ZGrYqQPozPCRA+CDTqj7eymSEv3Mw/j3sMAJWf
	+TzwHZl8epr1yxf88j/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVaH6-0030ee-Vq; Fri, 24 Feb 2023 15:46:21 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVaGz-0030as-7o
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 15:46:15 +0000
Received: by mail-wr1-x430.google.com with SMTP id bw19so3732114wrb.13
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 07:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHj6q3/hE45FopGTdeZ8oN+dB8rKBvOMiNlZw3TvrH8=;
        b=UW05nLLxY41uVWN06UTWyPbzgvKODuXPsFGAelkAciw17kKN7a4swD0guFFD1sMNAk
         hMAaNxaS+COWARk5dq9vBxiiEIfNslRXyOurfx5u4UIEolc3725lrLEZEu/AQ5iv4D9f
         d9jna1XObb7SXjYtVgrkuY+jkMgYPg3UqSmr7nvgbz7DBGaMTwMiDgBfMbzrLcGD5Mjz
         o6b6xvRk3eMMouJNUwROJruzCNbK34ldusprxjz89FRTwvxRPAr2fd/cmepdOw2CYlnd
         N7CUkM5bKJX56VZWmqcduzHVbvXhkp+aL7LG/8bZQq+bi3za6T6d3b3XxgFQcommVMnx
         ZrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHj6q3/hE45FopGTdeZ8oN+dB8rKBvOMiNlZw3TvrH8=;
        b=kVcMp1RMrY9XyEjrofqwtQ59hzoQAKDkSQsaVxjTT1hYSaAKEpErwpSsugHjFQApxn
         +qdT1SLJw2+sTyvBBZ7ItvtLe8gKKn9Q4np9qFQNYCsPk/8xTmuFm0qyT2xoqOaIzoZh
         H85uHrwRcD06DsMdGesZdfgsv2mokuH9lnWM6NvO7kBE2bTRm72y5iANbmrLOTbUoIE/
         FJsoUwE5NTXuP/bOOVNS9ExtHiIXRQRX4zjuXyVgd/2X2Pfa8an7seWL+G2bCsTbLw5v
         lcBFP5A0pWDER9wJuKFsn7h937He8miAaQeNl8urHg4yXeEWRG7722REDRVtQoE46its
         rf6A==
X-Gm-Message-State: AO0yUKXFWaloJinTOaaCfmoAn7CYPr+nnntilzTbHqo9wWUqfcyLrxob
	CzvQHk1BNvbazrkpT1N/KxNiGjnkLxWytkbB
X-Google-Smtp-Source: AK7set8PMkNDOwV4zskjV0L2J1C3aiOw9VHB9kQ/3/+jxao+eJlRvExWVLatIxACi0+8jdvkX6DoYg==
X-Received: by 2002:adf:f48d:0:b0:2c7:fc9:c51c with SMTP id l13-20020adff48d000000b002c70fc9c51cmr6301027wro.9.1677253569952;
        Fri, 24 Feb 2023 07:46:09 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p14-20020a5d4e0e000000b002c5a790e959sm15887620wrt.19.2023.02.24.07.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 07:46:09 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v2 5/6] riscv: lib: Include hwcap.h directly
Date: Fri, 24 Feb 2023 16:46:00 +0100
Message-Id: <20230224154601.88163-6-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224154601.88163-1-ajones@ventanamicro.com>
References: <20230224154601.88163-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_074613_300419_D1D45B1F 
X-CRM114-Status: UNSURE (   8.81  )
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

When using alternatives for cpufeatures we should include hwcap.h
directly, rather than through errata_list.h. Opportunistically drop
an unused include too.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/lib/strcmp.S  | 3 +--
 arch/riscv/lib/strlen.S  | 3 +--
 arch/riscv/lib/strncmp.S | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
index 986ab23fe787..4f9b80dfb5db 100644
--- a/arch/riscv/lib/strcmp.S
+++ b/arch/riscv/lib/strcmp.S
@@ -2,9 +2,8 @@
 
 #include <linux/linkage.h>
 #include <asm/asm.h>
-#include <asm-generic/export.h>
 #include <asm/alternative-macros.h>
-#include <asm/errata_list.h>
+#include <asm/hwcap.h>
 
 /* int strcmp(const char *cs, const char *ct) */
 SYM_FUNC_START(strcmp)
diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
index 8345ceeee3f6..ed78449f2e05 100644
--- a/arch/riscv/lib/strlen.S
+++ b/arch/riscv/lib/strlen.S
@@ -2,9 +2,8 @@
 
 #include <linux/linkage.h>
 #include <asm/asm.h>
-#include <asm-generic/export.h>
 #include <asm/alternative-macros.h>
-#include <asm/errata_list.h>
+#include <asm/hwcap.h>
 
 /* int strlen(const char *s) */
 SYM_FUNC_START(strlen)
diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
index ee49595075be..e4e97d9b4e4e 100644
--- a/arch/riscv/lib/strncmp.S
+++ b/arch/riscv/lib/strncmp.S
@@ -2,9 +2,8 @@
 
 #include <linux/linkage.h>
 #include <asm/asm.h>
-#include <asm-generic/export.h>
 #include <asm/alternative-macros.h>
-#include <asm/errata_list.h>
+#include <asm/hwcap.h>
 
 /* int strncmp(const char *cs, const char *ct, size_t count) */
 SYM_FUNC_START(strncmp)
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
