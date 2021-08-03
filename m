Return-Path: <SRS0=9VPL=M2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7341C4338F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 09:28:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69DAA60EBD
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 09:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69DAA60EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m2GS1Hizssgwt1Z81pA//3in59DeewRciHNepFtPkf0=; b=XFiGALtngZy2aX
	lVRc11DYNl6c80mgiLLOoLsd2zscQfxXvEGDiJIGgP0Z/3lnf0eGwvl0vDNmZ+AseHRWE0rGb2QNG
	yLBdeP2WzZWBpdfWWv/yZHW/ge15WPUjSh54+SPMxnenSeSog0VN3gOKA6Tid05KzE3BjS83V+SPQ
	vJED3UsntRLJW7+KZIvIEfMCn7qF7OnNw/xTGejRaJZtHK+KpnUVXZc1Z8blb80tJ/ZnRO+6ISrcE
	BWA0n78TsKTCwxABAWKZMykIGRrK6AEIYRw+ljrQ+pfm7c6W/Ze6/QzN8uzn+UgaS390QLHokMyPP
	ZxN5aqPhR4mH0O36hgTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAqiO-001ozg-FB; Tue, 03 Aug 2021 09:28:00 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAqiK-001oy1-TN
 for linux-riscv@lists.infradead.org; Tue, 03 Aug 2021 09:27:58 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso3843725pjf.4
 for <linux-riscv@lists.infradead.org>; Tue, 03 Aug 2021 02:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=j1KIVK8kQE4DHR/QQyZ/87RDXcMgovo55+h8wHZB8aE=;
 b=ekISGUB3OYmMwuXZmrrfZdDFY3e0Ci8AuD/B23hP+btAajOZLvzJws/I70dJzD0xCf
 D8GKnyUxMbZWtsmuDMfRg8bzFH7NCKRuY+g80YoR0WDHxl32LzLw2SWrDkQ8UiS+sPK3
 FAd1Y7BN+1fUCVJSlZ7aTdBljzoAOv8KRX5cFvve9jZ1CR775xiAGa1zplVuDXJqwqIQ
 spKc+CtSRsD2u3Ous249OBFtftKIBJ9PD0u90YRA2/TW9Dr5KjCkhhzLOWQPODUZXGI4
 E3TDEJQSHSR0nS4WTajxRUUzSTnLY2U4KBI7my49WLZlgqtMi6JoXzX3OsZVNnQn7EXy
 avJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=j1KIVK8kQE4DHR/QQyZ/87RDXcMgovo55+h8wHZB8aE=;
 b=s8t6JYjBTi0ZkbxLwqgVrY3LjoeOTuPxtKyetb+k9+fsMpxODpIEueTqu4LUFg2VXq
 XzZwVIRi+lkPtQZf92E79CEg3ALa2E9vZR7HDc74YDj2bYC3zWaO6Xq50GfC1ap2evUI
 EnX986i4TXPB0piTpCEocgVJe24WrUbDaq5b5qM+TTGjdpw4sJLzr91vVyL7jbIuEkII
 77HgdawCpovMepq1KWlwozaiYbm+p7lX2e/xtV/u8xCohKezBRreaanBiH5mN1T3CkVQ
 G1Els0VaIOFpFvx2rbdhwEFuRAIUtSzyMmZpZlTNYRC180SLDfpr93/82hSIP4obCw/v
 YgJw==
X-Gm-Message-State: AOAM53051gtWUxLGD6WZotSNqGhTz2uuHR6EAzQ7kwvcjutPIloCXWO/
 yg5cFP2YWG5F9yQjGbImj0LmIA==
X-Google-Smtp-Source: ABdhPJzZPRhzslZGVNmM4gWaeBD5Bgr0x56zmAdvqNpGYooJUF56TsdNWrhq+RdrG0NXcgTgVKhs3g==
X-Received: by 2002:a05:6a00:23cf:b029:2d5:302e:dc77 with SMTP id
 g15-20020a056a0023cfb02902d5302edc77mr21962408pfc.63.1627982874713; 
 Tue, 03 Aug 2021 02:27:54 -0700 (PDT)
Received: from localhost.localdomain (36-227-234-175.dynamic-ip.hinet.net.
 [36.227.234.175])
 by smtp.gmail.com with ESMTPSA id p53sm3244796pfw.143.2021.08.03.02.27.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Aug 2021 02:27:54 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: oleg@redhat.com,
	palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: vincent.chen@sifive.com
Subject: [PATCH v2] riscv: Ensure the value of FP registers in the core dump
 file is up to date
Date: Tue,  3 Aug 2021 17:27:51 +0800
Message-Id: <1627982871-29807-1-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_022757_032720_F75B0EA8 
X-CRM114-Status: GOOD (  14.05  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The value of FP registers in the core dump file comes from the
thread.fstate. However, kernel saves the FP registers to the thread.fstate
only before scheduling out the process. If no process switch happens
during the exception handling process, kernel will not have a chance to
save the latest value of FP registers to thread.fstate. It will cause the
value of FP registers in the core dump file may be incorrect. To solve this
problem, this patch force lets kernel save the FP register into the
thread.fstate if the target task_struct equals the current.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

---
Changes since the v1 patch
1. Include switch_to.h to avoid compiling error.

---
 arch/riscv/kernel/ptrace.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 1a85305720e8..9c0511119bad 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -10,6 +10,7 @@
 #include <asm/ptrace.h>
 #include <asm/syscall.h>
 #include <asm/thread_info.h>
+#include <asm/switch_to.h>
 #include <linux/audit.h>
 #include <linux/ptrace.h>
 #include <linux/elf.h>
@@ -56,6 +57,9 @@ static int riscv_fpr_get(struct task_struct *target,
 {
 	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
 
+	if (target == current)
+		fstate_save(current, task_pt_regs(current));
+
 	membuf_write(&to, fstate, offsetof(struct __riscv_d_ext_state, fcsr));
 	membuf_store(&to, fstate->fcsr);
 	return membuf_zero(&to, 4);	// explicitly pad
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
