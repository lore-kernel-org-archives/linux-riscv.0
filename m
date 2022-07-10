Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA922C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Jul 2022 07:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=zjrcK25AVEQUvP1rCg5P4Jx1s3VTRyezHHpRspnwnek=; b=JBp
	ofZInJ6MEzsNvHrJ/idg7yq3zrtUJzKKTPT6+XRu9iStlUvtqeI+fkyePdfaXgU+VQNNM1c1CLHnv
	9ZjXw9cc9/32BAy5hiNvcKtRrxlW1JzbltNkZ9dULsLA4b1t2ReUtSeqmpXfELU325OfDalMdBEBp
	txIL6a8kkNGj02HHUI0vuiJQT9B4/FluoDPTujgionYVQuaSMyUKBV24wTWDSV4wGwe8svE0mESg5
	u2HS/rv3BrBtWBK2h/Un7s7t51YlXpQMsk3uKXG5tELexyLJVeLyxjlrGGCCMN0bjHsavdroKrKX6
	0+6wgRu/5rHfNA2K8pI7Yd6+laB2IKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAR6E-00Avfp-1Y; Sun, 10 Jul 2022 07:11:26 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAR6B-00Avf0-GH
	for linux-riscv@lists.infradead.org; Sun, 10 Jul 2022 07:11:24 +0000
Received: by mail-yb1-xb49.google.com with SMTP id b129-20020a25e487000000b0066e1c52ac55so1798852ybh.11
        for <linux-riscv@lists.infradead.org>; Sun, 10 Jul 2022 00:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=yAMjD7bFyIwsVP6jYrt8xQond+JqwS9zkIdAHuIkxN4=;
        b=liUn+rKXpXfrSoXvO27l9hLOj7oo5CX3m8yhnF3O8Uo0ba67YaoDhrup80Hbcz/pZt
         3kEuSGbXJ20Wjh0GYHTqFpZtKEZTJfIOo6ThgYoOEp2lTm2OD1kiiQOE5AlkPCIb7FhR
         Tgr1uBsd4QNXfMDjRN98RrNJXH2RxHP4DsVvOShzHxsugmZFmGMPWkmfqWEUF6RLrBlh
         cvl2b5KOOrsYKyDUTpPB8jei5OI4Mvz7jOa92WwuRm+EyFtKNtzWbal3Xi9gB2ZoXySc
         /UwtJaMhzidFnMAMzLeSU447Q7mJxgTTUU8bSkvqarH+A4jBk0DqFjmT0m4eHC3F5Kka
         kbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=yAMjD7bFyIwsVP6jYrt8xQond+JqwS9zkIdAHuIkxN4=;
        b=W9kPzvmP2FnGONzbJsu+6A2wPV+LCCak+2r28h5BC/AcFfC9l7S5+PPmDeg+dtLBY3
         9IOqWjsE+ZBpZazX8DDskqqjExQM9LBnMG7KTGOyppdaNC6pJLdSQ8LBGrJWmeCpL4B7
         VADaeOz14VXKsupfo/qbAQv6iMyCxWSAAxC7TaL60DJ8Gw3IH6B3nqe68yul6jgpRJ1N
         gAj+4n1IQdNEmZ3NHVWfT/1hVyo8NO6JC0mDinYkJP6uBE/BGgR0ks8kJGaqPhxilpuG
         MHZW905jX+DyhcP+Z6Telxk7lGnyU9Z662nWZDRyJm7nROy9VkwwSDB+cPHcBUDqxgiP
         E6Tg==
X-Gm-Message-State: AJIora+qWFt1W1j1zS2+6g4p3cQOrLTmF+TW6XKfKLMTLyvNSB29KSXl
	CBTnwoZzKx5YPSToIiYJUdZDGVf9XYsK
X-Google-Smtp-Source: AGRyM1uY19WwEDO1WCIR2j0jrtOz0gxs4GLwPuef+3yW0ZQEqrwPS8ucUN0ZHVTBtuSCTsnBGf4HM4ONI3cb
X-Received: from maskray1.svl.corp.google.com ([2620:15c:2ce:200:1844:d82b:e1a:5303])
 (user=maskray job=sendgmr) by 2002:a05:6902:706:b0:66e:ef10:1f7 with SMTP id
 k6-20020a056902070600b0066eef1001f7mr5952684ybt.610.1657437080152; Sun, 10
 Jul 2022 00:11:20 -0700 (PDT)
Date: Sun, 10 Jul 2022 00:11:17 -0700
Message-Id: <20220710071117.446112-1-maskray@google.com>
Mime-Version: 1.0
Subject: [PATCH] riscv: Pass -mno-relax only on lld < 15.0.0
From: Fangrui Song <maskray@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Khem Raj <raj.khem@gmail.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Fangrui Song <maskray@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_001123_600864_165E5F73 
X-CRM114-Status: UNSURE (   6.81  )
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

lld since
https://github.com/llvm/llvm-project/commit/6611d58f5bbcbec77262d392e2923e1d680f6985
(milestone: 15.0.0) has implemented some RISC-V linker relaxation.
-mno-relax is no longer needed in KBUILD_CFLAGS/KBUILD_AFLAGS to
suppress R_RISCV_ALIGN which older lld can not handle:

ld.lld: error: capability.c:(.fixup+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax but the .o is already compiled with -mno-relax

Signed-off-by: Fangrui Song <maskray@google.com>
---
 arch/riscv/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 34cf8a598617..7e4ceb2a0981 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -37,6 +37,7 @@ else
 endif
 
 ifeq ($(CONFIG_LD_IS_LLD),y)
+ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 150000; echo $$?),0)
 	KBUILD_CFLAGS += -mno-relax
 	KBUILD_AFLAGS += -mno-relax
 ifndef CONFIG_AS_IS_LLVM
@@ -44,6 +45,7 @@ ifndef CONFIG_AS_IS_LLVM
 	KBUILD_AFLAGS += -Wa,-mno-relax
 endif
 endif
+endif
 
 # ISA string setting
 riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
-- 
2.37.0.144.g8ac04bfd2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
