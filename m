Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F1CC43461
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:12:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E487120731
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:12:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zanEiwkV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XT+/rTXy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E487120731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KdiX8S0ciSG5xIK6zTBGTkdBnSnGmJXiRfWwJ+R2LH8=; b=zanEiwkVSy9Vce/Vumvg3yCz0
	ZKTpl1oeKdPuvupm0l6BHz+9UJ8xAN1GLB5C8T02EoEGgMUdELMBDBLax8W+GIFgad2+2Bz8dQrxy
	K+SqG+zBQdeQByq+uXOe95wmmQifPdhKyNfSZHR9Zem/Rx7XacEsGUOkRSFpx1GfJkAYnLlnu2Qct
	wrW0fOIyIwNnFdIkQC5QNIyWIJJliH24VjQFaZqq8f836peICf752cB9SwXZLwh1CUej83POUD3xi
	uo8HhEAgNlNfN767OZykujrQM49P8LNWAEXu1v5FBgo/635vWELVZZkWWJ+Xx6RwxR7o26DR80d11
	dQKeLePMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHhF-0008BP-1J; Thu, 10 Sep 2020 08:12:45 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHhD-0008A8-4m
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 08:12:44 +0000
Received: by mail-pg1-x541.google.com with SMTP id j34so3829271pgi.7
 for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2020 01:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JmKbThgzqbDY+/UyIBOV/py9QNKCn3663FFj9Ytmh4w=;
 b=XT+/rTXy4+F81PxarhjGF4uZjYapLuWQd7pvXQYmt0dFRKgz0jAaAAo8AkP53a54V2
 Wlnv1zFNX7gl5wDv7pgEfrci3gbD4rAkY3HblD0WOtWyIzhDEFF15qnD7mdiGdX8Zw3S
 sdb9N+limI2q5Tg+UhrteMuL004SrtOYOVsbm0U1lbmIcWAWX4ES3nGjoqhOUqp5rGv0
 c5WUBYxTwz9CDBpc/u+OwtZfYDLx/o8770/xub8IlKHNT2KlG6JZgrFLyzb/vwv+7Nto
 n+dnubYCDHuazzcS4CBTYNApXnT28fBVu+ACwgpXu7e1Slw7aMMMwQBBEZ4dqKFbo8s2
 6a2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JmKbThgzqbDY+/UyIBOV/py9QNKCn3663FFj9Ytmh4w=;
 b=RJq8Xz8vIBq2kUvc3cpovEST7DJBgekRu5vUVh5LfGYsYyuAwNYhjCK3PwHbydELYK
 RzsYK2gLrzJ8Ct3Mx3vidr2TvZGVtsM8XbUjeuyWIwMGEDnSl9WOdk/Mct+rGGt9JFSv
 t9uaYUQYreTLZZ3qbfBY5ZVe9ca7cZxg/4bU1IKPIWQDYdsuBwEDZ+ocvAYKTvC+gAd9
 ekbh7Jx5fOVxHqIhfHvYZ65kjlJq0OOpI6yLOduu+fxUGqlGfjF7ZU1VIPzAYvqjcr4Y
 /kEivJOd70AR9/MsdmA3ou/iVTzRcxhPg2BEX+QrfwnI0hnjKXSIm8f5J73rLjbzY52w
 cmzg==
X-Gm-Message-State: AOAM533wVICHyNZpgwton9glWTaDwbzbdoiiGwAz8vr8fzOsvhTcJsCA
 pZMRfmXOuL6C8HVGD777J8/5yA==
X-Google-Smtp-Source: ABdhPJyM5pqCEbrW/ZjKyxLXcqHXTZyqjPKUFbYo6PArPLcEjQtDn9LMKK3iD2Z8Nw9stnH9fQOWfw==
X-Received: by 2002:aa7:9dd2:0:b029:13e:d13d:a109 with SMTP id
 g18-20020aa79dd20000b029013ed13da109mr4276909pfq.37.1599725561077; 
 Thu, 10 Sep 2020 01:12:41 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id e1sm2196056pfl.162.2020.09.10.01.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:12:40 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Subject: [RFC PATCH v7 02/21] riscv: Rename __switch_to_aux -> fpu
Date: Thu, 10 Sep 2020 16:11:57 +0800
Message-Id: <cc97813e4b83f66b1b069114bdba54c07592490c.1599719352.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1599719352.git.greentime.hu@sifive.com>
References: <cover.1599719352.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041243_213568_D9067323 
X-CRM114-Status: GOOD (  10.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <anup@brainfault.org>, Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

From: Guo Ren <ren_guo@c-sky.com>

The name of __switch_to_aux is not clear and rename it with the
determine function: __switch_to_fpu. Next we could add other regs'
switch.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/switch_to.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 407bcc96a710..b9234e7178d0 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -44,7 +44,7 @@ static inline void fstate_restore(struct task_struct *task,
 	}
 }
 
-static inline void __switch_to_aux(struct task_struct *prev,
+static inline void __switch_to_fpu(struct task_struct *prev,
 				   struct task_struct *next)
 {
 	struct pt_regs *regs;
@@ -60,7 +60,7 @@ extern bool has_fpu;
 #define has_fpu false
 #define fstate_save(task, regs) do { } while (0)
 #define fstate_restore(task, regs) do { } while (0)
-#define __switch_to_aux(__prev, __next) do { } while (0)
+#define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
 extern struct task_struct *__switch_to(struct task_struct *,
@@ -71,7 +71,7 @@ do {							\
 	struct task_struct *__prev = (prev);		\
 	struct task_struct *__next = (next);		\
 	if (has_fpu)					\
-		__switch_to_aux(__prev, __next);	\
+		__switch_to_fpu(__prev, __next);	\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
