Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C55BC7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qf6pZwnw6ou6wsF2Jmb6OQ9edSgVYscHl2BoOyDpDJY=; b=4WiHK9jQxr25xc
	V7MAodvf/LS9RMnFUvwsycZ4+6Et30qiCDqFBHbBoqZmRZVR6oF9qcihFTCOfQnYGQ4OGqIWCAW+r
	omBn/AP+YGQdpqxCN98Fx3A8Skzis5uBLey3zEK8Iz/5pjL/5p2LMmvYA0N3V77oMrj67+ji5As8i
	a9TOfvI6hmf+JK2qw8FGw/BxwmKIkev/vpN2uIz4eHewtzD31H9oYsV/V3WNwT7H8+wejNVliGpK4
	Z2jqQPIZcvjcm47JDihrJAvJipm+jK9dYlJKICtw2kI3DV7LrcooXT0bUpwCo6YbCdWn5mgdFIFLs
	NUCD8eEczC0bCyKEmmMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbTp-003EY4-MW; Fri, 24 Feb 2023 17:03:33 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbTm-003EHi-0F
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:03:31 +0000
Received: by mail-pj1-x102b.google.com with SMTP id c23so12214933pjo.4
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sQCYkWxghjLS7BAQiZptP45payXWmeGjuFJjmEJEuNw=;
        b=iG7u46voWoCSXsiGC6Ysj4m1pbjjUvB2vqFL7cTXHrPGbkWtDLDalWuivRKZXBTTfe
         kD1u/0FERjeGskarnybYskbOvXn6AYKDq09mEejyQ2Ve9fGuHqHgEiHSBck53ZOXpI4g
         6v1qPCxZ3IWdn3xjhhkeiqlW+L8Vnnd0dkkqylyO0ZYXjZmheTHjZtbxC4gmXx3ZzUHL
         fOw6b0msdExdSij/iTwNJBulPwJTbau1hxc3xCPlJ7FPzno08MfUSbODByVjxMbAVZz+
         KG3+8ra9cffVbtio4BTEJqA0sfeqN7gdTX0yz4a3naXCwKWMFUOkO4Ax9+EvwVC9ON3C
         LErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQCYkWxghjLS7BAQiZptP45payXWmeGjuFJjmEJEuNw=;
        b=3ZU+pnB6aD3MC0gC+PEVLJjCe2LPkbBDnB4qMK+1DIm4T8w4omL1glEf/+goU/Y/Lh
         vd0Q1ACQHfzUXFH+XYnFWDSUoKSF00z6et8tGgnQMnzrN0UyuCx8kcwSNQvAbIeXhUPg
         uC+gjI18bQ4pa7D9jCJxuizGpgaw9cI6K66T/CEh2UqhsT6Xtgqt64WWCFF+NDPwuRBV
         WreZlfkQlbErhSlSEAUXLRjQZ2VRlEeTRqZ9o9kY7YTr95F4y5uiiHIUbgtkfGpFU8Je
         WZsNcSSgTL4MJvXz0jX3jTP/3ieo/H4rBMv5ZbGu1SFODApAjzCdHIa9ULo+JqM51AML
         W4Qg==
X-Gm-Message-State: AO0yUKUap9+AN6cyPZMmrUymWLNGfx+8hHfWewbIZ0wJsoKeuFMufWrH
	28eAHQ7C//aaexA2x/r8bgL8PFyktwwbVrpDZf/oCqL/eRyc6VnRRVNwKQH0zTShL9HdymWswiU
	fA0AjVQyiQrO2d6ZmCD7VjbLI0O1+GmzjLBtzVSmppby5+u1viKgWTdUqKbneuIHJagz8Qywe3L
	iiYy6bsMpDpg==
X-Google-Smtp-Source: AK7set9Ndd7cIxsBi8HJx0vn2lfPItJRZuCTbx6BWLEvEmJFMQ8OEZOrWu57xNwWs55af4DUU19VCw==
X-Received: by 2002:a17:902:b286:b0:19c:a9b8:4349 with SMTP id u6-20020a170902b28600b0019ca9b84349mr9480458plr.32.1677258209313;
        Fri, 24 Feb 2023 09:03:29 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9234731pls.251.2023.02.24.09.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:03:28 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH -next v14 19/19] riscv: Enable Vector code to be built
Date: Fri, 24 Feb 2023 17:01:18 +0000
Message-Id: <20230224170118.16766-20-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090330_089659_5E4925F6 
X-CRM114-Status: GOOD (  10.61  )
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

This patch adds a config which enables vector feature from the kernel
space.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
Suggested-by: Atish Patra <atishp@atishpatra.org>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/Kconfig  | 18 ++++++++++++++++++
 arch/riscv/Makefile |  3 ++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 81eb031887d2..19deeb3bb36b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -418,6 +418,24 @@ config RISCV_ISA_SVPBMT
 
 	   If you don't know what to do here, say Y.
 
+config TOOLCHAIN_HAS_V
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64iv)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32iv)
+	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
+
+config RISCV_ISA_V
+	bool "VECTOR extension support"
+	depends on TOOLCHAIN_HAS_V
+	select DYNAMIC_SIGFRAME
+	default y
+	help
+	  Say N here if you want to disable all vector related procedure
+	  in the kernel.
+
+	  If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 76989561566b..375a048b11cb 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -56,6 +56,7 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
+riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
 
 # Newer binutils versions default to ISA spec version 20191213 which moves some
 # instructions from the I extension to the Zicsr and Zifencei extensions.
@@ -65,7 +66,7 @@ riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
 # Check if the toolchain supports Zihintpause extension
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
 
-KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
+KBUILD_CFLAGS += -march=$(subst fdv,,$(riscv-march-y))
 KBUILD_AFLAGS += -march=$(riscv-march-y)
 
 KBUILD_CFLAGS += -mno-save-restore
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
