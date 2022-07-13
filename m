Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDF0CCA47C
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 21:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0tb8cgtIIcvSnjTCWyZmeIiFKsNvVuVDcAPD2YJ32DE=; b=hJoQoV01bV1BxK
	Qu8WSf7hP0Y+DNtPL08sy4Ic8cdP8hYxAePjq9WoGMnAusMdgA8PcLXPFBHKCANhcj3c3XNYKo993
	QPUVtVRlp4jtvBE0ZtqaAV6zmhjUtnxI+75+oURjtthzW7jvnZTeVtsghrZ6/oDOeFUVLa+cyf7jW
	J1Ftqeklg06oExHSVD4j0La3hZfCFePmKDciQR98mIYWlCPLNQIBrvvGUq+1tO8hxLziKZK33iM51
	szNZG6BGtYzRG627hCLuoqXVGlYB9Owu+agjw2kPQmYjgKmORiAhvIUpNnSlUzGk9s5IEZnqY6Rxr
	D9rWfIT1XvMH4M+246pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBkIP-008GTz-KH; Wed, 13 Jul 2022 21:53:25 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBkIM-008GN5-T7
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 21:53:24 +0000
Received: by mail-wr1-x432.google.com with SMTP id a5so17344379wrx.12
        for <linux-riscv@lists.infradead.org>; Wed, 13 Jul 2022 14:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1if+iJ3Rfg5Ije1XujLZDPGuDmZak3oUwO8pKstWfJ0=;
        b=SGIZYvlDMwHfcExTYpWGGn8diVwGA9eOtGHLdxP5zELgU1Gseu7yfUbmyhr8JPsUnI
         /jaJKjhq6uQNrN2L5ib3W0XSgWR3seTCHSNF4KixugXuAwO+SpdOPKvFDM/1H9EJJipv
         hTGJGp62vuBy43J2AHlvvNtYxI/6huLqjcNiIcQ3x8CEPzxAQI2c+Q5yGU6jgkAgb9Iq
         i78ndSs5e6jM9zkVqNBHJ323bB83bvQA74ZmhJ7mT0iUWzEDauRvEaXwbbA59QBDJRwx
         E015iKHBS2VJuvxHj8bvw/RgQAaAZ7lJLNsSaAp4qcgraiggeE+5bQPXDuzbqP0i9/Qs
         9Wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1if+iJ3Rfg5Ije1XujLZDPGuDmZak3oUwO8pKstWfJ0=;
        b=cmTXL7XPYuqokvAJurBIRBtzscT0OfLNQ2tA1X8mfMF6RyHxKKZXPYU7GUEwkfzKMQ
         752v1koVOf/7vH2bDeRratlR7iEaC9vT1Ncw0Y5nSDT+guZ8gKfx+dS7eTSBK+3L6ODg
         hkMBS16lxRmU6V8bkaPc8uCSXc3PyVf89vn6TVRLucqvxFFqR9UTmPtAqP0/zaC7Lgqe
         hYm5+SpHCloQunjeGi3OB0XYKAk0NPaBVE+rmuq6A2yWAwg9Yo/uXNSyVRrXH/ruZbWU
         yyY+ouDodrSmmMlr5j8JitCAxcsO4Ggiw0jdmGeUHbVqpbVa8Yk3rX2M8seMm66Ho6WA
         TvHQ==
X-Gm-Message-State: AJIora9LMKrqMvKLRjwIh5PQ5DAacUwCLWkz4QjojLvbjAC8s5i0OZQO
	qydxymYTUhDaC3FxNlNZIOKNsoMQ52XCAw==
X-Google-Smtp-Source: AGRyM1sXfCH7y4GVfRGkn+PpeFhCm5FUh0GugILauWjzEzItq1w/ex7fUHIw8FzWj3/XqzDhMn+G0A==
X-Received: by 2002:a5d:64c3:0:b0:21d:720c:4ade with SMTP id f3-20020a5d64c3000000b0021d720c4ademr5451301wri.570.1657749199962;
        Wed, 13 Jul 2022 14:53:19 -0700 (PDT)
Received: from localhost.localdomain (cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net. [86.15.83.122])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c1d1300b003a300452f7esm535428wms.28.2022.07.13.14.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 14:53:19 -0700 (PDT)
From: Ben Dooks <ben.dooks@sifive.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sudip Mukherjee <sudip.mukherjee@sifive.com>,
	Jude Onyenegecha <jude.onyenegecha@sifive.com>,
	Ben Dooks <ben.dooks@sifive.com>
Subject: [PATCH] RISC-V: cpu_ops_spinwait.c should include head.h
Date: Wed, 13 Jul 2022 22:53:06 +0100
Message-Id: <20220713215306.94675-1-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_145323_170993_54159B20 
X-CRM114-Status: UNSURE (   8.24  )
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

Running sparse shows cpu_ops_spinwait.c is missing two definitions
found in head.h, so include it to stop the following warnings:

arch/riscv/kernel/cpu_ops_spinwait.c:15:6: warning: symbol '__cpu_spinwait_stack_pointer' was not declared. Should it be static?
arch/riscv/kernel/cpu_ops_spinwait.c:16:6: warning: symbol '__cpu_spinwait_task_pointer' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 arch/riscv/kernel/cpu_ops_spinwait.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/cpu_ops_spinwait.c b/arch/riscv/kernel/cpu_ops_spinwait.c
index 346847f6c41c..c662a7cf10a4 100644
--- a/arch/riscv/kernel/cpu_ops_spinwait.c
+++ b/arch/riscv/kernel/cpu_ops_spinwait.c
@@ -11,6 +11,8 @@
 #include <asm/sbi.h>
 #include <asm/smp.h>
 
+#include "head.h"
+
 const struct cpu_operations cpu_ops_spinwait;
 void *__cpu_spinwait_stack_pointer[NR_CPUS] __section(".data");
 void *__cpu_spinwait_task_pointer[NR_CPUS] __section(".data");
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
