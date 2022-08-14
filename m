Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EEEC25B06
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 14:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KC3F1RjMBEueWwiQHGnP5tufMZiV+xhOJnc4wFvTRdY=; b=ogSocqsENi+OYa
	d8dt+WgMbXnJRg9gfeTIogBpTlNlzNA+2rcjg9B88qGjnrOekIMIncKn1T4fdhSDOKg7SMczwHo8q
	tO++sEbH+oXXzbnKSs6Kig7j2LxQvIKvq5PjmpTJG9HZrqJNySDpQVyAW0IkGmsGQWvbIWfalJYEp
	8zbRyMBckMQTFXYh76j4Y2/1zoZx58556ePIvItoU7HaZElYn0ijF6cN0q6ZlfcTlP1W+aLaUep2C
	ENn/CHOXgrRVU/1wq9Oc34ExeCIdGBZEav5fMSy/6tTBzV9Qaz3ALckQYWH/rLudMzrgj9ANZlD1W
	bFolifteBcN22c7XMYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNEMZ-0070gT-5F; Sun, 14 Aug 2022 14:13:11 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNEML-0070U6-Hk
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 14:12:59 +0000
Received: by mail-wr1-x430.google.com with SMTP id j1so6369921wrw.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Aug 2022 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Jpi+qYPVkjjgLSftDLRCVgzhzYoBkPjkNBatqeFjYP4=;
        b=Qq8AUk/9AWVqplZnZsraolgAwvvs+PIe6EeGfq6jN5MM2n6AruvuyymJsCkvpb+OzP
         DYg/NMqHsO6QTHRAmrKsuXtxegQV5ArT1zwjqST2UY7tF7wobikGXu8YTrZv50Ep0Ae3
         kQ6O0X7afhbpbhHnOfxIltiwZLRErrqF5lam6sIXJu4xMzzliWzprfPqRkgZB1tMXU1/
         R7yHX1sH3JLUhkX3H1H84GsxsU9S9kdPrpHmC8xt1v98s+gs4HLrQJ3K/kl6UABKJ4Rr
         uV7ZKh1Ouv6RetM5zMnnJz7UfMlbuOU52TAUum4YqqIrYAQSjRgz7dY13Phg2BCkc3lq
         qL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Jpi+qYPVkjjgLSftDLRCVgzhzYoBkPjkNBatqeFjYP4=;
        b=vZBgpQf1jVPmru8LWst7HeXOOAa0ZfJAT+U7b3i+pkVUJ6mIUUrUUGrfZdv+7Ga5V5
         GG/Jrjm41OSUbC4nWO0C37pmtUjdRdvCbhTZRZU1vyezXCVVFKeJm33NlMq0mr1SN8R4
         5PQvcXHQ+KmoeJzN8QpnUFJOS9/L+TOFvff1+3TuutIkf4bceTXLncYPTFnnhwMEubte
         rr9SLEBxTm2CEakCg0LLN62PeYBhVL8JzbPwg3x/DH6MZoENQSTfVeaKSSJL4I5BtbG8
         XBgd4M3hnn6AzrwmqG+ti0/7hd/PWv3R8G5QXLtsbZvtaxw2o5c34DDSk5xzxVGZRqvW
         N7Ig==
X-Gm-Message-State: ACgBeo1q/jeGIuO7M1dJbzTLfjxnFfwcAJieSZufKsp6/dr/gayyxZCN
	IsyhyJEmDIKfRZbEsRouIzgZJw==
X-Google-Smtp-Source: AA6agR6FYk+iY85iu6ZNNhqlEqAtS2htyInEPS/oNlnm6Idei+lVhLdGdUcw2QokwFea/pPKDyVQbg==
X-Received: by 2002:adf:f90e:0:b0:21e:417b:dbd with SMTP id b14-20020adff90e000000b0021e417b0dbdmr6282420wrr.425.1660486375541;
        Sun, 14 Aug 2022 07:12:55 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id b8-20020adfde08000000b0021db7b0162esm4625419wrm.105.2022.08.14.07.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 07:12:55 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Tong Tiangen <tongtiangen@huawei.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] riscv: traps: add missing prototype
Date: Sun, 14 Aug 2022 15:12:38 +0100
Message-Id: <20220814141237.493457-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220814141237.493457-1-mail@conchuod.ie>
References: <20220814141237.493457-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_071257_726646_CF76F791 
X-CRM114-Status: GOOD (  10.00  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Sparse complains:
arch/riscv/kernel/traps.c:213:6: warning: symbol 'shadow_stack' was not declared. Should it be static?

The variable is used in entry.S, so declare shadow_stack there
alongside SHADOW_OVERFLOW_STACK_SIZE.

Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/thread_info.h | 2 ++
 arch/riscv/kernel/traps.c            | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 78933ac04995..67322f878e0d 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -42,6 +42,8 @@
 
 #ifndef __ASSEMBLY__
 
+extern long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE / sizeof(long)];
+
 #include <asm/processor.h>
 #include <asm/csr.h>
 
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 39d0f8bba4b4..635e6ec26938 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -20,9 +20,10 @@
 
 #include <asm/asm-prototypes.h>
 #include <asm/bug.h>
+#include <asm/csr.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
-#include <asm/csr.h>
+#include <asm/thread_info.h>
 
 int show_unhandled_signals = 1;
 
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
