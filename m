Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFDDEB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 05:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3CWNVX+ej/MRg8ARpuI2isNbJGRbfay+TZ5biz6NZqE=; b=l1ScaxFOzNQ52R
	7UHOHB0ikrWhJioG8sAoBubOwztpc5WloeAvSNZMBTxUv3sev9TDLblHq6rUzwiw19m1O0uR6oyZb
	bLx6m+m8/xwl9zCxth7plSk5S1FulrNecHZ6lM8BThqUg08OkP6b1nKO8FI1pJb9IkNIwEVybcA8Q
	Ukv7RlJZgKKrXxMn+gjlXgPN2w6lEryhAeQuF00OAk6HlSNhINe6QAnptvJ5i6pmNIBWRb9V/zA3P
	7r+9I2sI2u+4ZOvKHaYEh1FR/pmcB+65U3/VsLwaONMGJ2xaVuREfV7USwrbWOS17+yv6FZd4BWKc
	kn7d3GIiXRbvFFOqeEsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOAl6-006JMJ-1h;
	Tue, 25 Jul 2023 05:38:56 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOAl3-006JLg-31
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 05:38:55 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9923833737eso748100766b.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 22:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690263531; x=1690868331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7e91BMfpSrUV8pLZU1LBjqTvh3MYJ90peEUrbZ0fJg=;
        b=DUV24tjMeuaYTRh7/en2rwqUQ0+Z84MXh9/5CuvvoPYwgfUUGT5C92XvGlgjodir7I
         DdKAbGyDJNcNNPqr9M7EbSkoyGIxObjYdArkaS2KSPwsqM785K3rSeWH2Alvn9h05Qm9
         WlBBkAH92Hur813wc/6oNLVSXUAGe/mMeRVieqSfSJ19PnFyaGu4YVDevZh7L7fxonT2
         sqSu8jL3ZSNzRMIRmxTM8RV+tfF1B6W9NiMcG4tUSGvcUPqp+FGO0KmsC/NsSNLS+KOa
         JihUGIjt1i2UhE0zex4wEfQ1u1Q/lNxR7zu8ks9wdLNGSKmkgYYsckHHA7jJZfEk7TKd
         U3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690263531; x=1690868331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7e91BMfpSrUV8pLZU1LBjqTvh3MYJ90peEUrbZ0fJg=;
        b=B5xXtwM9AIxu+nwJJ/oJFlWTwk4+Jq2IXwIuhjrOIJlWvc4ZgqbWJHy3ppX32rXtdn
         L7UonkoCfTMwMq/I0+FS/PjcOYVKQNLApZMBZ/tfW75PcSIzHenmemn/45DFjIgge07r
         20PwRELeT84xtxErjFywGk7dyd7S41+raMbqZ2PEI6znJdrfga61oyG+3S945MoRXuQW
         pGGQ7DPwV1BqyOpmODGzQiVecYMIH33tdZBqqAa6RoWJTqUzT7bIoGone98w8XZe9Fj2
         jBtAkwicb+aluJ5ZyyuF2E0iC41CcL171sGpDcV0oAI4xt4hMWJKq4UvXmH+De5uX/67
         nU2Q==
X-Gm-Message-State: ABy/qLa9q1AIpyi1KjfkfaH3IKvxYWxzXXLCdjNRgdf+kFCnFLpog1FG
	NP74sA6tdYN2k01wIW4CTOI=
X-Google-Smtp-Source: APBJJlGIpBQohsfNWMduzGbsUTuAkIXnC9gXiYrUHa9hdT4wan2u4ldYKt0z7d2XhO4EFumjgXnwxA==
X-Received: by 2002:a17:907:a070:b0:993:da91:6e0c with SMTP id ia16-20020a170907a07000b00993da916e0cmr11226554ejc.3.1690263531214;
        Mon, 24 Jul 2023 22:38:51 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id jp7-20020a170906f74700b009937dbabbd5sm7639369ejb.220.2023.07.24.22.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 22:38:50 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcaov@gmail.com>
Subject: [PATCH] riscv: remove redundant mv instructions
Date: Tue, 25 Jul 2023 07:38:35 +0200
Message-Id: <20230725053835.138910-1-namcaov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_223853_973906_9655BD13 
X-CRM114-Status: UNSURE (   8.94  )
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

Some mv instructions were useful when first introduced to preserve a0 and
a1 before function calls. However the code has changed and they are now
redundant. Remove them.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 arch/riscv/kernel/head.S | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 11c3b94c4534..3710ea5d160f 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -289,10 +289,6 @@ clear_bss:
 	blt a3, a4, clear_bss
 clear_bss_done:
 #endif
-	/* Save hart ID and DTB physical address */
-	mv s0, a0
-	mv s1, a1
-
 	la a2, boot_cpu_hartid
 	XIP_FIXUP_OFFSET a2
 	REG_S a0, (a2)
@@ -306,7 +302,7 @@ clear_bss_done:
 	la a0, __dtb_start
 	XIP_FIXUP_OFFSET a0
 #else
-	mv a0, s1
+	mv a0, a1
 #endif /* CONFIG_BUILTIN_DTB */
 	call setup_vm
 #ifdef CONFIG_MMU
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
