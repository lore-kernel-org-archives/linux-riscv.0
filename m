Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D14C001B3
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 23:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=feQC9B3Nt2mQyEH6l0qNdwwb+KJAKZ96Y79v84K+6yU=; b=SvYUS1qyIUvUQn6QWYfgqoGUW9
	r2cZnxqQT/m9I2Fcee0Uy0VllPgLAT3/loi8+KCTNL/8LI+tmPR20+q3myXgmzeKfgbB/L63jYucD
	lAMLA6yV1YkNmee9CsRugUHW7zRzdpSPtyxolgptKaZsnaRIw1wjBIwayotFKTL9BSHNgmfzXuGPK
	tsfkHLB5HrwzGoVdRbRc9yd1MqTGOHB1Sxqr/33HhRAcBwCnImLa0Wo1A2SiUf3lDGbNwWsp3yyjL
	ZNN0D0HoOudgURa9AFCxkpqAMAXT3GoFdV1iBaPGU4vg0NjucS3ODb0iX7PrnQGSU1FQZYF9WDFy6
	5km+FS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF1Hz-002Txx-0i;
	Thu, 29 Jun 2023 23:43:03 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF1Ht-002TvI-2D
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 23:43:00 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-bfee5fd909aso1071844276.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 16:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688082175; x=1690674175;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Xnc4kEY4EbaBnYfn4j7l+LmuswSwMsWgqgbgeywLsM=;
        b=kp2ERfWqnMk1aYCcY3Lh5Z6gm14ZJ3i2mXlb/00TiljzMsnxeQFs5kbVGLwdlHdXWH
         1Pr+W0hxAGlZuFtJ34Gw8FWCTQKcdth2yYQ4kpxbIRDw+N4gAfjsiMTV7jzpomXHcLTS
         0kT2wDspmdW0ky6LKXOjJbvqFbwXOfI+Uqy9S8KBiTg+C/CpcRA4cNvS8TaL+WBXZhiJ
         gqG0bbHz3u6ZHweyCgmLfplLh+OdA+qcH5DUy3t0ecNfXfQIxRtzjJjc8ialYxW+YbE9
         hNIbzRRmtDZvI0K4dsHoLvVVFESxxWxy+57P+dee5eOgXSh7DXoAPg7ADh/35TMj2lK4
         3t9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688082175; x=1690674175;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Xnc4kEY4EbaBnYfn4j7l+LmuswSwMsWgqgbgeywLsM=;
        b=cWX6r0/XM05Qq3HyVbJ1IThCngem0SYT7j+tgBDjDCZS+qdonlFmnAANSHUtA/qR1F
         clX5XSFhS82xvqD+kHscteLXKB/NfL+A+EbTLisox6gDjgk5Nb0H9hYxAT4OTCZ6F3WX
         bNvIaVJGdBC0wlaHRCPKa4VEioljQTKao1S+Kl26ailPHvfQ8F0Ww0PBuMUP6iBh4qqC
         hJCUg+6jLkGBOqy8+qOqbA90OPR8ECH+fS+80GTSQyvcqroO/Y/pfr+1sJtKW+BN2hzS
         h4Ty//9tmRe01iga1y6aKFHwBVT7fp2orzhu4z3Vqf+mdLCwFBGa/+nvpaaOzhdZzAQ4
         I6fg==
X-Gm-Message-State: ABy/qLZrxhrv+9hI8SEYzxh3q3B8NsmqO6zmGSte5yvj4gsBKYIIstCz
	qPAdAoh4QhkNR/fn5JZp+Mzm9YIOjoIhHKMGD78=
X-Google-Smtp-Source: APBJJlELQmIdC0rGqtb4VJitzpWLBDF1z2wW/3vjqsBQPQv0tSZIA2LaC77zwb28Y653cXNP4FPxNLuggPDhhv7s5Yw=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:3f44:0:b0:c39:4e0b:2f05 with SMTP
 id m65-20020a253f44000000b00c394e0b2f05mr7310yba.6.1688082175113; Thu, 29 Jun
 2023 16:42:55 -0700 (PDT)
Date: Thu, 29 Jun 2023 23:42:48 +0000
In-Reply-To: <20230629234244.1752366-8-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230629234244.1752366-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=879; i=samitolvanen@google.com;
 h=from:subject; bh=jTMsDVHp3vLP+kp6kYa8Yt2xhzF3g8PflLJEr5zwipc=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBknhb19IaK8IPSrcbSiqkp1zwKDFD22eRwAN9KJ
 9YK7ujl6kKJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZJ4W9QAKCRBMtfaEi7xW
 7hKeC/9phxEf9/+dB3hfrEFRxhxmmCZAlHL7B2GBUkQCOpdHg2ck1MABWcoko419h0tlSz45RPv
 IyV9eudwY59txN8eLDO2Lh+KuGtj/I/xL9yy+6j71mkvxiRbmFzuLHv/QwdBqbMDOUZdK9LNjwC
 hjDZ12Mk+tdQ2pAfhWRG7oI2pvSd76+bgvv5glho5QYig7FnKmOdl6Lly7gAjjaP/bsB2ESWl/f
 5wZ6tCp/E/iOu6m6yF4LBt0RObJUIyuvpYsPmObRxGFVZVAQkogHlMGdi0l0XVwpHY2xcKqzusS
 HhpVp8d4J/FreeR1zKHdC3oJqbkgtBa0poSZnm9iOzOtdaMNnRRYqf5ih9YbDcrim2hjDQGfTZc
 iaP32nHcDEaHWHNpHRw0gEionM52PXSz8IxY4GPajiUthGRen5n5T/2UzAho1Odw6xFE36Kvd3/ ayJR/eygigxaJNCGU8rkS9ho97aA+Ng4gci+jDMa+FPMitZDgr6U1fYKqpHrXzUK/jUjA=
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230629234244.1752366-11-samitolvanen@google.com>
Subject: [PATCH 3/6] riscv: Add ftrace_stub_graph
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_164257_728618_ADE3C2E4 
X-CRM114-Status: UNSURE (   8.76  )
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

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/kernel/mcount.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index 712c1d2c2723..c73d7514e45f 100644
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
