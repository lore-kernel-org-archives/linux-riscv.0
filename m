Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7920C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 03:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KgDWbIaDK2G8DEkgqE+h5FUAFMGMA+6oXNU70xDMl5U=; b=NqO5tau/KnjHZk
	k8DiXCAwLCk3oAYVPpKTlhyirJyc7zYlAq0/EUOWJwtXk35L3dyDFfMwtlecfDy9Za51ngd6OTHyj
	tGlSUTi1Zogc1l5yEa4vVjR7NNhi7jh7NRJH3itrvDYK/opGCySuDLG9cWYUkrQdBA5GwYd8WFWld
	YOhfZjvUG7CqY5TYgzFWXfbE2UiF7rKt2m1eGSnOdEW+d62Pw61cT5ttOMeW+UJpQMh15M9fd2pgt
	68wp+PBz9grfrURmdVtXWPwqNdRf5IqCOjAEyrV+VUOgbRoO2X8pJsfZ0TLv7W5xIxs4WRty7imkY
	o8j/8qgHh4X6I6wcUsCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW7OP-0035zP-0o;
	Wed, 16 Aug 2023 03:40:21 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW7OL-0035yr-2f
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 03:40:19 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2681223aaacso4067825a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Aug 2023 20:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1692157214; x=1692762014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rPu9EybHcv+f53uItq5HW0DqxX8IdZv8teFDMaig/ZU=;
        b=GAaINHUgKkTiffbKFeyXGI3ArOVCLgHFwm6+07G8C/STkypzCHvDKQ56rHHIqsMPXN
         PwL04sykxFggY55dLFzQONd53BheUBhhUEjJJiBzdR82K1yjSRhF00bZVxgtTP1MvCol
         jZsFJrssJmRleYvplUDv4i8FbAXE5eCRC2tgNF/nEZSj9Vd4xUoIjJesdmKxrFdv7Cij
         Xo74xb8lxqSKUVCioIvLDw9mfG/wS74O90H2PvUWmEM12+GFUdRpY68eeeK+cIiZJsDf
         hfgnV/QEdapc5qO+rP39B5ynQKZND0jQlhmXy629b6hkosSvumrfO5CVogxgimUp3sAI
         5VLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692157214; x=1692762014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPu9EybHcv+f53uItq5HW0DqxX8IdZv8teFDMaig/ZU=;
        b=ctjfs7tsNQFqsHj5mMwcF2QpOueivHyiM31PMXszXW0p+yF3UnDVNfkw/jHNR6ue64
         gqrp43OLVNHumZWu9SKdRk5S7sdWqtMAZsJ9cgqzmgtP1oGfZ9Z8cO3/5kc1HAdRCT9U
         aU80XvfysmmokvtUp0E1tyWo5KCHnp9R5i2+HT1XTMrHz9s8jdmWOJlHitnbnyzWL2/+
         1DQOnDUV9y8I7LaFXH3gHZJVOmIiSiEW6ICmv+pXcZouIvibydOOMr5Wp/m3dHPi4ZjM
         60RPVECVANJetUHxTBnZlhmlploIrWlHJipvHB2qaKh1R9QWhnN2zW8ilXeco7xy7BpI
         2pGw==
X-Gm-Message-State: AOJu0YzgUsz8al/LIW+nFwJGoMDQm80+41c6SstdmL/UncZd3G/knQD9
	Nig/CDXXv6DPAeim9xLNHMTAXw==
X-Google-Smtp-Source: AGHT+IHmH/xVr3Y8BUiUQjbv9iZDetSovCsqgNIWzDlt/MkeMZW5ou45NWSH/+8kp3BkeiVBk9d/GQ==
X-Received: by 2002:a17:90a:9386:b0:26b:69c1:9a6a with SMTP id q6-20020a17090a938600b0026b69c19a6amr4775690pjo.20.1692157214230;
        Tue, 15 Aug 2023 20:40:14 -0700 (PDT)
Received: from work.. (1-161-171-111.dynamic-ip.hinet.net. [1.161.171.111])
        by smtp.gmail.com with ESMTPSA id g14-20020a170902868e00b001b9dab0397bsm11796274plo.29.2023.08.15.20.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 20:40:13 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: nick.hu@sifive.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ajones@ventanamicro.com,
	mason.huo@starfivetech.com,
	jeeheng.sia@starfivetech.com,
	conor.dooley@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andy Chiu <andy.chiu@sifive.com>
Subject: [PATCH] riscv: suspend: Add syscore ops for suspend
Date: Wed, 16 Aug 2023 11:40:09 +0800
Message-Id: <20230816034009.2614866-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_204017_934208_2AD1F2AE 
X-CRM114-Status: GOOD (  11.19  )
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

Save and restore the FPU and vector states when system suspend. If a
task is the one who performs the suspend flow and it also do some
floating or vector operations before the suspend, we should save and
restore the FPU states and vector states for this task.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
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
