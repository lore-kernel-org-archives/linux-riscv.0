Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63178C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:47:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B6F361153
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B6F361153
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rcb8B0NWSJUOXZAsyopCt/YPjGsdLy8ooQaWgqoDl3U=; b=QWQP/w/ozXuOH/
	0KGYy1JJNzHxj1yA/AtJjT5s34blo9CBTMigUtPjMaCDHSuFmNLg8LfwnZe3LnEWRkMXim6FrY4Wh
	+yjKVZwBCT0ZO1NOU++5LBzw2HPL5st7a60EfRP7MP7n7qCsY7rsYDBIgJhJ+giW1yiEiIXe+PSWb
	g6Ayr+d4GJgWkaFKgvYHweJrdqGRcsLGSlrZneuBe/Uvs1o5WA8l/Rpu/q2+3AEK+20rua4d8fKf0
	FYmhUFvYuVHvUe/5wCW7od5LZH+NBv0lJd/3KpgYSBsLUIw905g8eCGlJjjjrwkyW21uTsiUuudDN
	1Uig1BjGyDut/AzyYFIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1do-007INq-Dd; Wed, 08 Sep 2021 17:45:44 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1dj-007ILN-N0
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:45:41 +0000
Received: by mail-pg1-x530.google.com with SMTP id s11so3387771pgr.11
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 10:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SzySQXHTaCH/jeJ8V7t+kf/QD6+VmDcSCT1AxKS8udk=;
 b=DB15qCxohZ22l04+RGbu7grVI6SpFKncc0d6Da+a03aqKMyVGPCzco8oxHHInqeXuc
 c3iv7eHdGSG3qdb1pH9//EUcGCh7CQptN4+A6BCO6e+4hucI9zbOoJMDRjUJ+EaR5Tj2
 17boaXKHiDlr5BPK+IF6dJUHm2VBtHHeMsoH97CWxx7yU/QW9k1jKa1oCS6HT1EplTfc
 osJnslw+31xFXwPjTr1upqGubxjtHcE7QmuXhR8NhwG7hnNvH8q/AnvHW8CJfpARc2hF
 i1kNSjpf1g6kexXblCn0uMCg9mbi3RuqQNvIYdqvf/lpmV0NG6FkA7CxKHXZKV6zrT9l
 WO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SzySQXHTaCH/jeJ8V7t+kf/QD6+VmDcSCT1AxKS8udk=;
 b=dYA3avbuBWAlp05yKJbXOO2NWc2HmGHaUG5Y5KgHKFnsUkXK94+KwCsj9bjvZTjrjs
 6BKX5Be8RfspAWr6oxMlUDJh5BnNErTTL+WCMk1FdCtEzRZLpDdxhBqL0OXovkY02LSx
 sph4Xxbq5+tjvk5WIXgSm2LbMsUyXRcwl2pzkJQZ7feW8G5jgZK8dW7k3asP8pMKJi85
 egQQZMB4QI6e7VaqlJAGCEfg11PvCYpP+/CF3QhPldym4cLiscibz816ke5nBqAaukE2
 NOHtIadXwOTg302QIDw/YOQ3ABFPBoGci0O1hoK5eJerJoAAq1KZKoDOUBQ2OQ2isTVl
 bmyw==
X-Gm-Message-State: AOAM530eh+J4b3ds6VPRZdjsNTy2b/SLBU/9W8F+UC5Er7FJ6/NOZt3H
 o0K0gDrHptj38Q+UoBQW8hJ++2pughxPnw==
X-Google-Smtp-Source: ABdhPJxM9rF1WAh036ev+RVBF9Akd3H1vW4s2HtXc3jdFm4fGSdj8nPBEXdJhR5R71kuBdEj3PZ+Ew==
X-Received: by 2002:a62:8fc3:0:b0:405:473a:7461 with SMTP id
 n186-20020a628fc3000000b00405473a7461mr4984222pfd.28.1631123139133; 
 Wed, 08 Sep 2021 10:45:39 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b5sm3108466pfr.26.2021.09.08.10.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:45:38 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [RFC PATCH v8 02/21] riscv: Rename __switch_to_aux -> fpu
Date: Thu,  9 Sep 2021 01:45:14 +0800
Message-Id: <e89cf81cbead296dd4c80b078c1d1f74b5d8bb32.1631121222.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_104539_791871_845422BA 
X-CRM114-Status: GOOD (  10.47  )
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

From: Guo Ren <ren_guo@c-sky.com>

The name of __switch_to_aux is not clear and rename it with the
determine function: __switch_to_fpu. Next we could add other regs'
switch.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/switch_to.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 0a3f4f95c555..ec83770b3d98 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -45,7 +45,7 @@ static inline void fstate_restore(struct task_struct *task,
 	}
 }
 
-static inline void __switch_to_aux(struct task_struct *prev,
+static inline void __switch_to_fpu(struct task_struct *prev,
 				   struct task_struct *next)
 {
 	struct pt_regs *regs;
@@ -65,7 +65,7 @@ static __always_inline bool has_fpu(void)
 static __always_inline bool has_fpu(void) { return false; }
 #define fstate_save(task, regs) do { } while (0)
 #define fstate_restore(task, regs) do { } while (0)
-#define __switch_to_aux(__prev, __next) do { } while (0)
+#define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
 extern struct task_struct *__switch_to(struct task_struct *,
@@ -76,7 +76,7 @@ do {							\
 	struct task_struct *__prev = (prev);		\
 	struct task_struct *__next = (next);		\
 	if (has_fpu())					\
-		__switch_to_aux(__prev, __next);	\
+		__switch_to_fpu(__prev, __next);	\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
