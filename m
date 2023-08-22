Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886A6EE49A5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 05:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ax06rD9Yait500LmS3EYK3DRSVaq10gKxBC8pXRX38I=; b=44MXNhQSJXpYhi
	Ep3gY02FRxZaHeU2632Zc8lNc0aEna6Fpb4BmgMdinNAgYE5qoluP7Plg3VO2wOmkLFytK6g2uCwZ
	QAX/w6uBASGUbEnB8RHyc9ZSQj2s5CujY83fBGwMZ6D5T4kdHs2wEbOBT/RTuIWxhdvfG6J17S/iY
	E765Cvfkx0wa4LNTJ213uiboA8G9y3RlcJ1vL6u9KnXYBtg0pyInqQRYPiMw2v30DuY2oJPjKgb3H
	6/ustRouwT63VQuDGX/NkiAlSdxI4khyV5wz7z2kjmrMJjrwho0zYO3i8U4VdqsMG0ulLkmF9KV6w
	va2EBxR9JSoKg8m+SysA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYKFB-00FBkL-0x;
	Tue, 22 Aug 2023 05:47:57 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYKF6-00FBjK-0P
	for linux-riscv@lists.infradead.org;
	Tue, 22 Aug 2023 05:47:55 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso25607745ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Aug 2023 22:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1692683265; x=1693288065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9JssbzQX9VFHAc9E36F93tbDb41jway9Jc+dLt1MhU4=;
        b=f5qyb62EomFMuXfeRcS7JOgD2JnPA6D1D4Dkp2HxO/cqufRxiZdybYvpiil06eviJS
         5IJ24PgSA8jUMrt0C7Re5s9JJsglRhoT7RAJgc0dD3hOXKUJvigaIeIMSbVhOHXwJUI+
         mRcB4S5VRAGhHyqCR+vXS7DI0oT4TYY3XKl+XBjyu54j6cskt/p87Wk1j0ebnirci+Fw
         qijHvni9PmxWJinn+ZUYCPqm3wOme+ND601xFUNJDljkX0jkVPHv0qcsBi7E9CDR7QMZ
         qTbgWNjv+B5oBBP0b1l1vVPj6nUsGoAp+fY1OQJG+LWkUg4Bakj1/E85hZFWZ+sXa03n
         IYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692683265; x=1693288065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9JssbzQX9VFHAc9E36F93tbDb41jway9Jc+dLt1MhU4=;
        b=IaUFAjjeQHckgHadFrRah4h+ptO50Hi5XNHIwzMj8MTrj5R13FFTv9kGxZ5A1ckn7N
         iwKU5ho6/tMQBESdCi32KfaLEchuPU7gBC1Vt3H7Gm/+BlyOR8fWrSFDA+Rw0XOb4uKa
         WQwn6H5S7k9bBX/iDCEjUhgnOQKY0sP7roJGlIW7BliQsbLLcwmyKH7pZ1VPwIcJdSTr
         Cpng1W0kphHKh1ESWti27qEezxbp9GnRyFY/an2PMxXezBgJShcRXmuv9dETi/KnrHV5
         8VmaUIE7z5qF9b1VLZuRNyiOBa32bxUU9NeouWnviEb/X5O79aaF0ByrIj16WbgdU51e
         sgZg==
X-Gm-Message-State: AOJu0Yz70x6fP3UUCg3t7w5vyVLoYsQxu2NETz/iWBCpTuV4lRCbCY+p
	CU/ZTmSz3u9ZCY/PQ6iMOczi7g==
X-Google-Smtp-Source: AGHT+IGcfw+6MOZHdD4U2hB0gH3hptIg8rcq2NQYs+I+XfPKAPiSEgcJIG5E87JSML6WFF6YydVXYQ==
X-Received: by 2002:a17:902:bd45:b0:1b8:28f6:20e6 with SMTP id b5-20020a170902bd4500b001b828f620e6mr5446680plx.34.1692683265524;
        Mon, 21 Aug 2023 22:47:45 -0700 (PDT)
Received: from work.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q6-20020a170902a3c600b001bbd8cf6b57sm8199960plb.230.2023.08.21.22.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 22:47:45 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	leyfoon.tan@starfivetech.com,
	mason.huo@starfivetech.com,
	conor.dooley@microchip.com,
	jeeheng.sia@starfivetech.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nick.hu@sifive.com,
	zong.li@sifive.com
Cc: Andy Chiu <andy.chiu@sifive.com>
Subject: [PATCH v2] riscv: suspend: Add syscore ops for suspend
Date: Tue, 22 Aug 2023 13:47:39 +0800
Message-Id: <20230822054739.33552-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_224752_165460_532A6B49 
X-CRM114-Status: GOOD (  13.03  )
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

If a task is the one who performs the suspend flow and it also do some
floating or vector operations before the suspend, we might lose the FPU
and vector states when it goes to the non-retention system suspend state.
Add syscore ops to save and restore the FPU and vector states of the
current task to fix the issue above.

Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
Changes in v2:
a) Add Co-developed-by and adjust the order of signed-off
b) Rephrase the commit message

 arch/riscv/kernel/suspend.c | 45 +++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 3c89b8ec69c4..ff69ff8a1974 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -4,9 +4,14 @@
  * Copyright (c) 2022 Ventana Micro Systems Inc.
  */
 
+#include <linux/cpu_pm.h>
 #include <linux/ftrace.h>
+#include <linux/thread_info.h>
+#include <linux/syscore_ops.h>
 #include <asm/csr.h>
 #include <asm/suspend.h>
+#include <asm/switch_to.h>
+#include <asm/vector.h>
 
 void suspend_save_csrs(struct suspend_context *context)
 {
@@ -85,3 +90,43 @@ int cpu_suspend(unsigned long arg,
 
 	return rc;
 }
+
+static int riscv_cpu_suspend(void)
+{
+	struct task_struct *cur_task = get_current();
+	struct pt_regs *regs = task_pt_regs(cur_task);
+
+	if (has_fpu()) {
+		if (unlikely(regs->status & SR_SD))
+			fstate_save(cur_task, regs);
+	}
+	if (has_vector()) {
+		if (unlikely(regs->status & SR_SD))
+			riscv_v_vstate_save(cur_task, regs);
+	}
+
+	return 0;
+}
+
+static void riscv_cpu_resume(void)
+{
+	struct task_struct *cur_task = get_current();
+	struct pt_regs *regs = task_pt_regs(cur_task);
+
+	if (has_fpu())
+		fstate_restore(cur_task, regs);
+	if (has_vector())
+		riscv_v_vstate_restore(cur_task, regs);
+}
+
+static struct syscore_ops riscv_cpu_syscore_ops = {
+	.suspend	= riscv_cpu_suspend,
+	.resume		= riscv_cpu_resume,
+};
+
+static int __init riscv_cpu_suspend_init(void)
+{
+	register_syscore_ops(&riscv_cpu_syscore_ops);
+	return 0;
+}
+arch_initcall(riscv_cpu_suspend_init);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
