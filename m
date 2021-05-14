Return-Path: <SRS0=Ai3O=KJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43401C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 20:57:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BBE0613EB
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 20:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BBE0613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sPhWZVoS3RF7SHZ2PoQ5Ywcv4aq2xeDCEs1HOjoqqPo=; b=PuFmkRXtRocORXsfQjJQyzRZn6
	z4yiKxDehiVVqh2a2NY2J3aeAkY2wF3sayw/EwMt8Ulmd7QwG0FmNa3CAoW5PtPmL1whJ/CrTGCSP
	kmsxBnDYZgVe/Khb3d9deYTb4w0ZlvFmuLBdtBW1UpeFvngCtHyFXYVGNlaOeeQ/WDFmlxw3dtvVl
	6Ow+k12gCQ+p1VhF519NZwii7E2mb4arF73o7hG55Ep63AaTyMSS6gTb/rOuyYIlOncmU+o5pYLGZ
	31c2q1DevYOQljgBdDiLwiL+fFeebRtlqVmIFUYmDGOOpxW0axr+f9mvTR14pl+L07nbtW/Sqxs2b
	aTsvyhMQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lherr-0090De-W3; Fri, 14 May 2021 20:57:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhern-0090DN-Gh
 for linux-riscv@desiato.infradead.org; Fri, 14 May 2021 20:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=2fvOFfIAxcQKIG6FfQSNQIWF5U/hDFDvo7cGWOH+Z/8=; b=2S3aNQDHOH4KCKKk2/DCXkJ/Gp
 6oKWm2gx1JwOKWzEdBMvW+zN3+IgdmCANxEVEWmjQ0OyCHMHGCsWA8r9iN1DShQ68vzQeCfSACquB
 z1l5wwfIIjiGHkMG4GTKLvyXvetNEwDQspY+hYs5gjLojmwquUe8ui3tnoVDv+Aw4TIXY2wPsrpzf
 bnI4CPilGJxsoyl7e/2ZQXxQHNU8OJ7bf8YZ9Ij8qeRZFbH6gL1ALvk2I6ZhYhLLWn0beu66oxPxH
 +5RvXrMxqLqJm1uE+iSfnwZhQGlTzsvDZEGFBJBCkXgJxBkAh9Bjhel02ySj4WLeeYynAYjUkjSLZ
 8RTd8q4Q==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lherl-00CFtt-0m
 for linux-riscv@lists.infradead.org; Fri, 14 May 2021 20:57:02 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so2273687pjp.4
 for <linux-riscv@lists.infradead.org>; Fri, 14 May 2021 13:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2fvOFfIAxcQKIG6FfQSNQIWF5U/hDFDvo7cGWOH+Z/8=;
 b=ftrIUdlCmHMLx/Vs2bQbH23tuaxYUhb94m19ZOXZFKvXo0IwkSSWFMIXgwQfmzoE0M
 Wv0W0DIChCvNfxlryZO/BbhDLV7izp+gScK6tvMnhe7KrWYDQcRjHp2wCx/6O9uhnuWt
 n7kI6KHqomKDahUeNLXKSdrZGqEncZPtlZP6WiJdn16sVgsvDFTpiVp5xDW6W0SzPArm
 CkPvo808IcDDI85GFeWVWaHcW29op1HRwrIDnqn1Kk5NSi6Yp/4I5UpLIFXzqOVvn6A9
 sKzN2MOJ3az1StBvriWHT9R5lJJ5DXVrPFx3Hsf1gbkRgnfzXbIAFXMeux1EORqmccjE
 0OPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2fvOFfIAxcQKIG6FfQSNQIWF5U/hDFDvo7cGWOH+Z/8=;
 b=lud11psGgMFZBqLFWRbxwBFQH36x2Pp45ZEy7z7Z7G1wRG17i89Zui1a5nYzC5DmHy
 FgKHuYQUdxCjb1jiTZLDOVqTbYHza6IOA1DcAZ7FsrDUyP3lvtrYHQdGeGKTayjoWSC+
 hp+TjjmQzJKN57cQvUMGBUxx/1uAjmp2/YHw0VHOWuvnKEfoAv43rr74u2CCgcMOCgsT
 LTDhN2idU4cQRhXZJhy5NijttV4HYlKQIxVXvlpRa7L4veteg2mlvX5kXKKlPlzG4i1K
 nJINTOCN3cm1tsH31hXt3KL/c3qCM9BG+1zi7oiWNUJpFhHmSYUukksYuJePLy++s6xf
 YntQ==
X-Gm-Message-State: AOAM533AKoAROvhYm8Dj7RApKDaIakwG/+tXV6sMDxBQwwnpkg3c3oop
 u3y7OkVl8tQXvtT6cfFdQtEeMLLKVOHgNA==
X-Google-Smtp-Source: ABdhPJw1Q+YKuoOO6JNXr/zHfWM3v1qiMhlQxVZuR3qZZQ+Dk9JXOySQMo3LEaHswGexuXGSVIfD6w==
X-Received: by 2002:a17:90a:6309:: with SMTP id
 e9mr13674375pjj.20.1621025819522; 
 Fri, 14 May 2021 13:56:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
 by smtp.gmail.com with ESMTPSA id j16sm5235774pgh.69.2021.05.14.13.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 13:56:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: linux-riscv@lists.infradead.org,
	clang-built-linux@googlegroups.com
Cc: Khem Raj <raj.khem@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH] riscv: Use -mno-relax when using lld linker
Date: Fri, 14 May 2021 13:56:43 -0700
Message-Id: <20210514205643.383422-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_135701_081386_9BE8EEC3 
X-CRM114-Status: UNSURE (   8.79  )
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

lld does not implement the RISCV relaxation optimizations like GNU ld
therefore disable it when building with LLVM=1, Also pass it to
assembler when using external GNU assembler ( LLVM_IAS != 1 ), this
ensures that relevant assembler option is also enabled along. if these
options are not used then we see following relocations in objects

0000000000000000 R_RISCV_ALIGN     *ABS*+0x0000000000000002

These are then rejected by lld
ld.lld: error: capability.c:(.fixup+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax but the .o is already compiled with -mno-relax

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/riscv/Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 3eb9590a0775..519f133e0d53 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -38,6 +38,15 @@ else
 	KBUILD_LDFLAGS += -melf32lriscv
 endif
 
+ifeq ($(LLVM),1)
+	KBUILD_CFLAGS += -mno-relax
+	KBUILD_AFLAGS += -mno-relax
+ifneq ($(LLVM_IAS),1)
+	KBUILD_CFLAGS += -Wa,-mno-relax
+	KBUILD_AFLAGS += -Wa,-mno-relax
+endif
+endif
+
 # ISA string setting
 riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
