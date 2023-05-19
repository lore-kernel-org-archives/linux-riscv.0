Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE78C77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 10:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MAx4mIqjxhOxYqTiifbWYKvjS5bA5vtVxTCZ06xuCyA=; b=GCxg4/fPQjfttv
	T7/63+NaQvIYNz4ZGhwcpuDbjr6BIL1ieBNrCbHKfWxwC9Wi35BxmwtuxmZXblnbSWPP/XU4UuO8m
	PRWY9TpURemmcoueAlKzdU9hvHUiccdxJv7I8KUqRLGJQSdgfrD/yr9jIlOhz5L1TsNGu5t97MyEO
	ymp8xvWFlkBXCnIs2J00f1y+OZKR72zHtHOLMf/DQHkCst+a7gCouv2x4q9PAKCUWY8vioKfi3rue
	kx1+avQen1NWDfk+B/71NqBqOGX8yvt/dmrPgFpp+6A8wYh1q7KEmOqij+4t9awwl8srHNq+gwcGM
	EfB3/5CEL5OdzwsQG1eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzxMN-00FtnO-35;
	Fri, 19 May 2023 10:29:19 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzxML-00Ftmk-0c
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 10:29:18 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1ae85b71141so3049675ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 May 2023 03:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684492156; x=1687084156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dyCts+3MIamz/ZP/Th1oUrcgbH11s2oWCUMvcOwKW/c=;
        b=QwQQ1jJWLOQbljg6TCUXa5q9qgSjdve6OeoE561RDnhWjdKSN8Ga4m81FubQ9mtfC7
         iPCKNMdZNbrLBp0aYOQ3WyKkrYI8Rksn8fKcwFdXF+46wQYH/mB1rxMeHXeo+PyXJ1/O
         8l5l25MIW2Kg198SOnoYzl6NQcdfRqrHAUglrIUPPTB0GfWfh+zH3FzG1cE+133HABWJ
         W5XMihnrXeQEkPbQtdELGmA5Sm0LHRMqN8osScTjCYITHfWrr45XfAsS7IuQ5vmPT/FQ
         krpPDhSJ8yhIvvidzzMDrc4am9qi3WZygZMG1TC0uncBnRDIwwCps2co07joA0pXRcCS
         vKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684492156; x=1687084156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dyCts+3MIamz/ZP/Th1oUrcgbH11s2oWCUMvcOwKW/c=;
        b=b6rY6RSTquExEWR5s/qEyrhc5l1OyKj1HUN5BLBRm4jzvy9iv0yOpHa0kyoceZpkiH
         1m2awgs824VUD0fRFySCXfUaZ7mrl1gslGo7oWDyX013si5aitIVi7I7WH1dg+cGCePN
         ZhVrmNR3ewdj8JlEirL3k35/UQHhb8wVn1h8TnCVGPw9sWcuNsFIJ79IQ15W0asfyDdY
         p6tiJMqoHTxmdtF1uDsaIQb6cjjLg9EvQPgOE1MpMCmO6GVjEwGgjXkRSH+wrpLJFTwT
         QpSr4QH0U577Sa56bOzqzrtICuPVclIwTY1+iMqvDKjDv16ju0vIh0ZV4vsSefmtmwb7
         evDg==
X-Gm-Message-State: AC+VfDz1lTWAZPHu2R9OF6xfO9T6uKuViIO1w9UPNtNh3OUD/5O09C6B
	NArBqySaarOg9Io8TsVbM9w=
X-Google-Smtp-Source: ACHHUZ7NMUT3TKAc7YbJrIYDWFZGmpcw+HSt+Acfdj11Pwa6UO0f3XrjjVk5DPL0j87P6igKTx2o+A==
X-Received: by 2002:a17:903:1112:b0:1a6:8ed5:428a with SMTP id n18-20020a170903111200b001a68ed5428amr2918121plh.22.1684492156382;
        Fri, 19 May 2023 03:29:16 -0700 (PDT)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id x4-20020a170902ea8400b001aaffe15f39sm3102770plb.30.2023.05.19.03.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 03:29:16 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	suagrfillet@gmail.com,
	mason.huo@starfivetech.com,
	leyfoon.tan@starfivetech.com,
	ajones@ventanamicro.com,
	jeeheng.sia@starfivetech.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <songshuaishuai@tinylab.org>
Subject: [PATCH] riscv: hibernation: Remove duplicate call of suspend_restore_csrs
Date: Fri, 19 May 2023 18:29:08 +0800
Message-Id: <20230519102908.253458-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_032917_248466_387D55B5 
X-CRM114-Status: UNSURE (   8.10  )
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

The suspend_restore_csrs is called in both __hibernate_cpu_resume
and the `else` of subsequent swsusp_arch_suspend.

Removing the first call makes both suspend_{save,restore}_csrs
left in swsusp_arch_suspend for clean code.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
 arch/riscv/kernel/hibernate-asm.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/hibernate-asm.S b/arch/riscv/kernel/hibernate-asm.S
index 5c76671c7e15..d698dd7df637 100644
--- a/arch/riscv/kernel/hibernate-asm.S
+++ b/arch/riscv/kernel/hibernate-asm.S
@@ -28,7 +28,6 @@ ENTRY(__hibernate_cpu_resume)
 
 	REG_L	a0, hibernate_cpu_context
 
-	suspend_restore_csrs
 	suspend_restore_regs
 
 	/* Return zero value. */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
