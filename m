Return-Path: <SRS0=AGdw=U6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B7CC06510
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2019 10:40:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35C7F2133D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2019 10:40:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UxsdO07x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Bs9P3wHB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35C7F2133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=zC3n/wM7qKKlaZBz10Nvk6KjmrGPhVb/cO1bEaJxBBA=; b=Uxs
	dO07xyVfsTuXdbjuxtBKkHC8ydW4zOLfY/fI8r7I63RqDzXzHYFWlN8b1GEu0QCHB20Mz+pemEBEI
	ot+ANfHJM2SUVrhcDa+91oVpieveM9lb+nAQlHshA73eJF+NKdNqvJgoWknXBFGbHHeKqZ/tXl6Sm
	WOK9+CcKdr42/mEd3611jRIn9zlmIQ29hIotb5ZujYdGhSToe9JIwdvBbMn4I2wGCygx+4bRBBHXf
	Eslg9LxfBZ2t7b5lUqyxc+V8ao1bJmUoYmfXncVyEhCojPH4vSIizkOal4i8laKg4PSTzfX6wueo9
	geJe6K3LTMLaxeIBt3WNJiCC8v2NxzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhtk0-0004Kr-PC; Mon, 01 Jul 2019 10:40:56 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhtjx-0004K9-UZ
 for linux-riscv@lists.infradead.org; Mon, 01 Jul 2019 10:40:55 +0000
Received: by mail-pg1-x541.google.com with SMTP id i8so2647247pgm.13
 for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2019 03:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=J9c7HLFHB/6MQXAk9nbKdUnuKhx+YpHKq1KxJgKxyP8=;
 b=Bs9P3wHB2+j7xXbfUlkbZGeesB4uPleYuRpo/LZxWgX7auhEjYET5rsTqxsrsgHDvz
 Ak9ruswEkL+P/ohuhQ6IQrrdeMmgKs38Di6rb7bpxGdg24zaIsayOFSHsx0aP4/HYqua
 +KodY6PunVNqp8+GtnzrqFoc9TXb8Pkw31QPVKcjpcUzt+eqE623oc82A3pWGT7jtuhi
 dlO+aJ8AoTQADZHRmQeX9tNGrn3qB5TMeS1ih4Lf1/CzOR6vtDZ763oRUjvxStmXph7Z
 BT2uXEa9AeDxh7BBebcOV6wDWPWhyttKxVmgPlP0OyyrhwnoDxvh77Gj0rDyUl2zOgtD
 rypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=J9c7HLFHB/6MQXAk9nbKdUnuKhx+YpHKq1KxJgKxyP8=;
 b=C5FT/PV4yJfYX3il+t0GtXGqf72bg0XEZpv6xPl4Qy1yVstIaurtPwFqEGIWQffJzN
 TgA2FLd3IiDu1tFFPCfFB8lYCBfw9ldnD4ityM3HTVSRg7p8Y9qsAlrkwB1DJY05suQR
 cZLwcyY5T1UqTR1SAOP1uwwYhdx9s3f/5Jo4DEiY1oYGnPC2EOLyRNOjlea5QC1eadDv
 faufw5qSaqzLeZkHkDFZCZKqOGdOSZzhp5BbNpASnDWfiQuItcpbhJNUhT1IS4MH1ZCL
 b8RnbjjmNvdFO7ll2np2NLmVnjMpkz4oQ9NDYsrjTcVbK49G6LwRGTqMPxZssaFZBqEh
 +zzw==
X-Gm-Message-State: APjAAAX1lRUyRGs+sGXJvnpzVRlIo+135vRGrm0/1xHwqEJFDFRcQXEl
 GX62NGFCXNJXy2PPiYGqaNckUb2JytA=
X-Google-Smtp-Source: APXvYqxRbbkcM3EC4AAooXtro5KK4p2N7RlMCFLz7OVdz7IN7Z9Yh+tGOL9jDwil84AW7t3NWSN6bA==
X-Received: by 2002:a17:90a:d814:: with SMTP id
 a20mr30532666pjv.48.1561977652141; 
 Mon, 01 Jul 2019 03:40:52 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id g62sm10410755pje.11.2019.07.01.03.40.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Jul 2019 03:40:51 -0700 (PDT)
From: Yash Shah <yash.shah@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com
Subject: [PATCH v2] riscv: ccache: Remove unused variable
Date: Mon,  1 Jul 2019 16:10:30 +0530
Message-Id: <1561977630-32309-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_034054_047531_77BECE62 
X-CRM114-Status: GOOD (  10.09  )
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
Cc: sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>,
 palmer@sifive.com, aou@eecs.berkeley.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Reading the count register clears the interrupt signal. Currently, the
count registers are read into 'regval' variable but the variable is
never used. Therefore remove it. V2 of this patch add comments to
justify the readl calls without checking the return value.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 arch/riscv/mm/sifive_l2_cache.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/sifive_l2_cache.c b/arch/riscv/mm/sifive_l2_cache.c
index 4eb6461..2e637ad 100644
--- a/arch/riscv/mm/sifive_l2_cache.c
+++ b/arch/riscv/mm/sifive_l2_cache.c
@@ -109,13 +109,14 @@ int unregister_sifive_l2_error_notifier(struct notifier_block *nb)
 
 static irqreturn_t l2_int_handler(int irq, void *device)
 {
-	unsigned int regval, add_h, add_l;
+	unsigned int add_h, add_l;
 
 	if (irq == g_irq[DIR_CORR]) {
 		add_h = readl(l2_base + SIFIVE_L2_DIRECCFIX_HIGH);
 		add_l = readl(l2_base + SIFIVE_L2_DIRECCFIX_LOW);
 		pr_err("L2CACHE: DirError @ 0x%08X.%08X\n", add_h, add_l);
-		regval = readl(l2_base + SIFIVE_L2_DIRECCFIX_COUNT);
+		/* Reading this register clears the DirError interrupt sig */
+		readl(l2_base + SIFIVE_L2_DIRECCFIX_COUNT);
 		atomic_notifier_call_chain(&l2_err_chain, SIFIVE_L2_ERR_TYPE_CE,
 					   "DirECCFix");
 	}
@@ -123,7 +124,8 @@ static irqreturn_t l2_int_handler(int irq, void *device)
 		add_h = readl(l2_base + SIFIVE_L2_DATECCFIX_HIGH);
 		add_l = readl(l2_base + SIFIVE_L2_DATECCFIX_LOW);
 		pr_err("L2CACHE: DataError @ 0x%08X.%08X\n", add_h, add_l);
-		regval = readl(l2_base + SIFIVE_L2_DATECCFIX_COUNT);
+		/* Reading this register clears the DataError interrupt sig */
+		readl(l2_base + SIFIVE_L2_DATECCFIX_COUNT);
 		atomic_notifier_call_chain(&l2_err_chain, SIFIVE_L2_ERR_TYPE_CE,
 					   "DatECCFix");
 	}
@@ -131,7 +133,8 @@ static irqreturn_t l2_int_handler(int irq, void *device)
 		add_h = readl(l2_base + SIFIVE_L2_DATECCFAIL_HIGH);
 		add_l = readl(l2_base + SIFIVE_L2_DATECCFAIL_LOW);
 		pr_err("L2CACHE: DataFail @ 0x%08X.%08X\n", add_h, add_l);
-		regval = readl(l2_base + SIFIVE_L2_DATECCFAIL_COUNT);
+		/* Reading this register clears the DataFail interrupt sig */
+		readl(l2_base + SIFIVE_L2_DATECCFAIL_COUNT);
 		atomic_notifier_call_chain(&l2_err_chain, SIFIVE_L2_ERR_TYPE_UE,
 					   "DatECCFail");
 	}
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
