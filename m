Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FCBC001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 18:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jIQu2PzNl1i/KEWl1T2FBTv1m06TwebdFg6RWaBpHaA=; b=38wFR3W4OhyU/ecPFTclQHHvA5
	Vm9K0lVZ1cK3jhELkBtL14YH4F6aW83xdCQrp739Lyo4zC9e4MB4nx/+zcBYCFqSG53olk0N5DRGQ
	4fP6tStocF54EEh06p/4qA0NONl+Ng/m6J9bKEKF/1yXG+sBKzuOCGZ29CgByl42iPLweWehhMd2W
	a1tYxwpP8ffuBCUH02dy4d6Ys4xSOiVQEfRmAVAOUNUUnhl/NaXJjERbp2WwQRYnhuMAEncXP7xGr
	mGgqt+TQfRymQwXKTQMHxbEM2czK82kiS9GqhVZm7g3OlhDeWEmM56jL5UR5O3iC5q/Yjah/Vz5kg
	QTn9sUEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIvjq-00CTG7-2J;
	Mon, 10 Jul 2023 18:35:58 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIvjm-00CTDk-23
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 18:35:55 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-262d296873aso8040760a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 11:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689014153; x=1691606153;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S9zW43FbHuOlleSu+un6XWqUn1fn2QP5MnKtge68NZw=;
        b=2BvIE+7Cb5J6MVl7t68AQmPcTEFhZlWe+/b7KN/uzDN9+Ao94fJCMlNpxZlDgcGKeB
         m7Tl+0X9ccOfZ5iYWxiMFwYu8nN55HeVYr4+ygARqmsVCzleZFu1hQDTPf+6UsV5eCOl
         kLBmxXHq0U/yhc0QwEqq00hwEhv3CEZRvWM7eMi65KLJY6UXulbtXwlfFOOvNvw9zY1U
         yedqcc3skBZ6xL9hEdYz7sPiFHWBSANUiAkJAZOILfsY9K1OSZgWw3wcPdmj7Kt8fZcu
         ZjEHV76VEFbS5c51oWd9V7kbiPIXZgzl+hqRGNa3UlpuufenDyzzjDzQuQYbYuxS7VeN
         VuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689014153; x=1691606153;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S9zW43FbHuOlleSu+un6XWqUn1fn2QP5MnKtge68NZw=;
        b=B2WrleHtschn5zCNytZGJqSkJTicCKIdmRLKloBFV5/FBsLSIwsM3ZGNQgxb25lRFD
         J6Z9S5NR4/A50xsv7ziGJpf/HBlxh3zL2Bvin843sB6L1eKusq/j4TY97guNQTwTDmZG
         4z/KeYthTOdLA2+ComBFTztCw7hpBz1uGIGgfLFooDWIr+sLuz/mbfvB9MoxZo/tvMoI
         eOHiKHRPSu9paYxkxrCg++4c7/x50fibioS+7IERSPxw291uwMesY2J5SFzD42z+KDLr
         UuAL+h6m+zjpcvxb2KdKZFnPBXt58tMmrIr1+K/jVaD5KW8/LCNej7Ef2n3secvhBESY
         CQiQ==
X-Gm-Message-State: ABy/qLaV7fZqnkktOC8MV+XaNpyEemLEgILsANvMaqMFBeO3v5MPIGSS
	AT1DM7y+MnnAAsBT/h78WWT8e97orvZbVEDYOvk=
X-Google-Smtp-Source: APBJJlEHUxfZq7uWFQrz0VKHKSqMYGKtLRHE2eeMBabDYg36u9soDrUt3GcdQwg/5s00tNoVMufWeUuLPI80l6/+3Fc=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:90a:8912:b0:263:dcce:ca9a with
 SMTP id u18-20020a17090a891200b00263dcceca9amr10877384pjn.1.1689014153561;
 Mon, 10 Jul 2023 11:35:53 -0700 (PDT)
Date: Mon, 10 Jul 2023 18:35:48 +0000
In-Reply-To: <20230710183544.999540-8-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230710183544.999540-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=977; i=samitolvanen@google.com;
 h=from:subject; bh=SyYGssy02WwznPseKLFWBeRZamjspo0IenMK/78d1Tw=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBkrE+AvhWQwKiqzsK7Notr2TR4pdX+nw6HsLRg3
 vakDRSEwnyJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZKxPgAAKCRBMtfaEi7xW
 7m1tC/9kAC6G5E9nlSHjofInL/y8Zju/2BQWR+G6A2hA1YqzCT8IGkEC1AOGiEzHTcV3GCT/87U
 h87Ilj+zvqCqR/d+1E7J9h46MhhF+f91eFa3Q5kJ2dnf1eX0M4HYypa5V/CoQ7RZNtqr4I39GY8
 v5SyYiUxkMUMEemjvdfuawjqjnFuPAyWyWVdfZICe+4Sz3zISBhytRl/GX56rQnYFBa3M97kAq+
 AM8FE6CO1URei4DbbZk7iNcBStfCfgywRwJonIGhtU7ySqz56WP4VVchnPlMDd2/uFrWwVfnaOR
 gHgFbUIGyvvJRDS2ioIDNTWhYuiAwUzyqbpnysqXGWuSm4fshKMe2+HwhBVABEk2757Tq21sNoN
 jvxlF6Rf8fhicoFRZHmWrSpYAHFemEceYre4wE8AI9ZC1v6f1raY1lMDD5QEk9XE3mFHOQDjdU0 BmpHkd0OocbQjGmBzxP6u2W+S41FuvElG8m9BI30J7iGdiMFpjgsS9pXwLLwK75J6Z0PQ=
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230710183544.999540-11-samitolvanen@google.com>
Subject: [PATCH v2 3/6] riscv: Add ftrace_stub_graph
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_113554_691982_A72C3087 
X-CRM114-Status: UNSURE (   8.83  )
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

Commit 883bbbffa5a4 ("ftrace,kcfi: Separate ftrace_stub() and
ftrace_stub_graph()") added a separate ftrace_stub_graph function for
CFI_CLANG. Add the stub to fix FUNCTION_GRAPH_TRACER compatibility
with CFI.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/kernel/mcount.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index 6c9469050f4c..8818a8fa9ff3 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -57,6 +57,10 @@ SYM_TYPED_FUNC_START(ftrace_stub)
 SYM_FUNC_END(ftrace_stub)
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
+SYM_TYPED_FUNC_START(ftrace_stub_graph)
+	ret
+SYM_FUNC_END(ftrace_stub_graph)
+
 ENTRY(return_to_handler)
 /*
  * On implementing the frame point test, the ideal way is to compare the
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
