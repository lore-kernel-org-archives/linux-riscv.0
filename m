Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BD5C55174
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 06:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gIRotMNJkOH3RTrt9S9v09/E+7hjOtKdUOTB1TSqSUc=; b=i7pQ2FHgl818aK
	w5aTDLVRyzheROiVR617DN2fWU5Reh8FlzTYJ5o9MPnnuWT1k9WLI0cODZ2sUanXt1jHJKylcLR0f
	W92FkSAZ10Qlv3TEQyhFtLUbQ5mxRBPCIjKILl1coo/otKgw71eGZdvJWLRaXJCxjsU7nF9qZkofv
	XW4vYtIR0RnHxHYtqvOfycnuKdVujeqAKfvmLQQpt8wc+4UvW2pipOxd18otEoLacUaA/l3Ap7iyN
	9iY/tl+0ZqUV9V80pwSRGiciius6qHB552aZX+8rXAhj6kcwwQXz20bxa3qJxgLtT1kfglUW2+Tdi
	ARqZt21qzRwiJajUc7RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsaJu-000000095MC-0qXq;
	Sat, 08 Aug 2026 06:14:10 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsaJr-000000095Lc-1W7F
	for linux-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 06:14:08 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38e58034d05so207450a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 23:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786169646; x=1786774446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OaXRgwcka4GcNFXOY3lpT85fV7dEeq31y3K0KIM6hIA=;
        b=GB9d6tnmZG94dNapP+TJwqKKLTGuBL6TWMfsMAJGPg572nDlbxO0MAvpJ8CrJlTn72
         3daaKnUCzIiRgvpUszhnvXilYkmxVuU0Pv5sKFbYh60cXojoGxEN7Wqw/p5zFqNsrz9s
         yHOEhI2dLPilPySwz5GkYpDHSces/1TM6XZmB4QX1ub1HpKg+4bRD//fS7EvRvOv22AR
         ug02RKCfAgIOxiP8qoIyJsIQc1y4CWfVfx2xF04BJLnk+Lr/EG4z2G+VitNh5HILk3dM
         bDBgon4yzKO8e0EmfrkuraK9vJTbEWfI8v1VSYExd9Pl1cDUvYqtccN9XudA64YfeUS6
         wwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786169646; x=1786774446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OaXRgwcka4GcNFXOY3lpT85fV7dEeq31y3K0KIM6hIA=;
        b=ijSGbZZe87vUNRfwOe6Guc0q/KoCKbw0Y0FItpTVaD9rBoFoONLLohbNtzso9bNjh2
         eGnz7JMXEfShMBW1Fc1Qk0FF9mBnaR6JTZGlVk5W5LttYt1PEKUAUa86KAtegbNTvcUi
         2AaD0ZdmpCoQPgTVATcbjGqYQ0qJPzccuNl2UvmiPs2kh/WT3p6/lRI+3texVg2msA3s
         krnBMw9hAHY1sTVT5rLCwK7JDEefhPtjuS7yg+xtKfL6Rg26Bsc97CZ2XB1enMDOGOGC
         T+H+n+vktmZNg37KhAeDCISWOfRsF1k+2IYHm04mOFmUMGtUr7+pE8Cu0SS8nVQnfTgx
         E0cA==
X-Forwarded-Encrypted: i=1; AHgh+RoEszKNW776W6Scmz8aEhmfTpnt06aOlBitkplfQiQyzqdXOeVJ+OS/WqUuK2DOIURkWYryyt4Cbe1Nng==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwDnAkH5f3zeYyS1WZZ76wW9pWVfT+m8szcsIrNn5npO3etxvT
	i5M0AHvk3oP1whz4KOYjylbqfp6XFRhPxr57jPVRDQQvWCgK+KzuHn5ztUQjarod7F9zQ0HEShS
	oeURFpmC0rm50
X-Gm-Gg: AR+sD11QYbYxQCQLNnGQMldXkP3p83O3D/Nz3ZQFwTRbAgKY4V8TnJCDBvmS5J2Ax0u
	D9NGR+T1GB2+UigZ30Ld1MVA6bgO4dgI3KOn/clQ3uFmHmiJT3/KuNHWyoxtDngXNWmfIrmIFSX
	qB6tAYdlXHPoh3HWvOLISWpiigg1iww5NE1kVPQTvGUxCW9/eCex3gdOvdCQYn/BSrfj53RmvQf
	uSGEBuiJBrOActoOPwslZEUneASJoUunXq2qTzwMpmkDti4NERqsbid950PqhE/jOq0aELeZkZG
	S0r70m3LEEPY1egzD0pKXkbxXWTxIA1pUypeFere98HFcaNaC2Quame5LS5iaUF2t4t7G3tQZDQ
	p9B1AUZqfffP6ZMkJkSCYtw1D8RTeC3ByLAkfS400Eb8bXnL1gVwGdhWAZ9/9rXDjz1B+ngdFRr
	R/ZBUGxPtgzY5mfxiq92onXFlCgWSAHwrCDbMQ2ePU93UXu8Y+OjrKG+WXSgyGJQOUr76NjPbYC
	rpsrY0X3NE=
X-Received: by 2002:a17:90a:da83:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-3903c5d2f8bmr28251405a91.11.1786169646463;
        Fri, 07 Aug 2026 23:14:06 -0700 (PDT)
Received: from hsinchu01.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fd957cesm4998395a91.6.2026.08.07.23.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 23:14:06 -0700 (PDT)
From: Jimmy Ho <jimmy.ho@sifive.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jimmy Ho <jimmy.ho@sifive.com>
Subject: [PATCH] riscv: pass system-failure to restart SBI call on emergency restart
Date: Sat,  8 Aug 2026 14:14:00 +0800
Message-ID: <20260808061400.14652-1-jimmy.ho@sifive.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_231407_415974_A1C7D090 
X-CRM114-Status: GOOD (  12.55  )
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

Let the restart SBI call pass the restart reason as system-failure
when an emergency restart occurs.

Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
---
 arch/riscv/include/asm/emergency-restart.h | 13 +++++++++++++
 arch/riscv/include/asm/sbi.h               |  2 ++
 arch/riscv/kernel/sbi.c                    |  8 +++++++-
 3 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/emergency-restart.h

diff --git a/arch/riscv/include/asm/emergency-restart.h b/arch/riscv/include/asm/emergency-restart.h
new file mode 100644
index 000000000000..14c8da0f7ea2
--- /dev/null
+++ b/arch/riscv/include/asm/emergency-restart.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_RISCV_EMERGENCY_RESTART_H
+#define _ASM_RISCV_EMERGENCY_RESTART_H
+
+#include <asm/sbi.h>
+
+static inline void machine_emergency_restart(void)
+{
+	machine_restart(RISCV_EMERGENCY_RESTART_REASON);
+}
+
+#endif /* _ASM_RISCV_EMERGENCY_RESTART_H */
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 5725e0ca4dda..c8dceefa677d 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -121,6 +121,8 @@ enum sbi_srst_reset_reason {
 	SBI_SRST_RESET_REASON_SYS_FAILURE,
 };
 
+#define RISCV_EMERGENCY_RESTART_REASON "system-failure"
+
 enum sbi_ext_susp_fid {
 	SBI_EXT_SUSP_SYSTEM_SUSPEND = 0,
 };
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index c443337056ab..dae147420f1a 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -10,6 +10,7 @@
 #include <linux/mm.h>
 #include <linux/pm.h>
 #include <linux/reboot.h>
+#include <linux/string.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
 #include <asm/tlbflush.h>
@@ -519,10 +520,15 @@ static void sbi_srst_reset(unsigned long type, unsigned long reason)
 static int sbi_srst_reboot(struct notifier_block *this,
 			   unsigned long mode, void *cmd)
 {
+	unsigned long reason = SBI_SRST_RESET_REASON_NONE;
+
+	if (cmd && !strcmp(cmd, RISCV_EMERGENCY_RESTART_REASON))
+		reason = SBI_SRST_RESET_REASON_SYS_FAILURE;
+
 	sbi_srst_reset((mode == REBOOT_WARM || mode == REBOOT_SOFT) ?
 		       SBI_SRST_RESET_TYPE_WARM_REBOOT :
 		       SBI_SRST_RESET_TYPE_COLD_REBOOT,
-		       SBI_SRST_RESET_REASON_NONE);
+		       reason);
 	return NOTIFY_DONE;
 }
 
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
