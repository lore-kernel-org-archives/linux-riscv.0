Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524FDCA5FFC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fBuTm5WdoGtXs5smYUXNHKn36RNQXHO3bs6GSH36s8c=; b=c/7r0uweQxNrY/
	a8H8pqwfIm9O9iDpIwk2h9zJsVZq2rq/We/LgGbJVgwTYHgrd3hYW/eNUO4s7U/w1J7u1ICAk0Chm
	Uz2EACBruSoQxTZs1G6GdIWKH1bfgkouA8sopL/7QESuRtx3Vrp+wBV1Nednsj67V4QxKgDxu0dMK
	xA3Ksz/pf6qKoGM+h0mrWGwU0xHrTJejvsM2lPyHyERzYrQDbpcVx2QJwM593LpYTQSrCcQu30HRV
	JNaEZIZxl22eGfPC5F/R6bj0DJ5S7JQrX6IR5fikn+1ZVu9IuNJlvE86u1HRy4lEOC85ebggVHapx
	blyvcS6u1N4fTiBiEWYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEU1i-00000002jpu-1aHZ;
	Wed, 07 Oct 2026 15:57:54 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEU1g-00000002jpD-2M5U
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 15:57:53 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-34ca2d54925so6582880eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 08:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791388672; x=1791993472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RyG/X5i0vkChanPWXCAobrxzoJwwd2fGJPSSEJItfY=;
        b=jf2PDEgLRwH2pPHNkpuf9xU3rLU9Of+34fVzngMQBq9Nu8saPcVVWbSNGzGGG4ydb8
         JNcu7N97wGAy8XT6gtx0+1ZvBzmLNqT2bFU/Vp5QhZTkLtdWAShhpxMlg54ygkcneYA5
         S0TtmmvWBFpOJ7L61KyvWhFU+OkX3rb9gk7UxaF06ffJsYgBXplkXMHuJ6rVf5YGp/CQ
         s2x9683wyiuMHcuHroBdWbs6PaPGpNMOvJoVJM6c0wt0G+IskkNWYm/7bn1z7LSwumae
         0JGR9MeoRYEPu3DF7TIzg7SYtwoXz012yij8g/p8SmPrfs6goW4lbPpSYduXBjfhve+e
         gHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791388672; x=1791993472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0RyG/X5i0vkChanPWXCAobrxzoJwwd2fGJPSSEJItfY=;
        b=gsTwGoo3CJTgglfPlutIkxjof9PtqAvo6Tm0BX+M8psha6AQsQGj1Y2JBzrBZ318A8
         DwLCeHaR9x9vZsspIL90GMm5VCbtgZR4zO9rzATr5fK4uBOgK7jnlcWq34cZlW7A0rso
         cbRqTpKLaOBOTWgIVe+64e9IC2zhxz8AFS7VjSBiAy/NDeyCQ9MJ7cGz7V6oCG3NUDpK
         aZfsK4IGyTEWxc8qu9W37d1n68kxTGnaunMUCHVSzV7fAepnqfxHWuO4oxjZSxZzt21S
         S5QXbnH+ume3QDFJz2gkuWiaJDvkazuoEGXQI4m0+NPsSQh1c0BaKCFguRehvUZT1iFi
         gjRg==
X-Forwarded-Encrypted: i=1; AKwUvBydtJa8UT8S+VIWsBvPqeSsUgvXKIF+NGsW1++TaxuYPHpElBFZDMJg0r4Ms+5HTwXSSCORXyv1agF/Fg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKQnpdZaEfYl7x3A8z5oIufozmGFsN9ft+w8DQELP3b3DAyy24X
	E0MjeTPjvLH9DQj/UtnuLTaOHc5oF28laPrg9zD9anO8bfG2okDuCI2Um6tY7zXbGC0=
X-Gm-Gg: AYBFou2ufZ4QLw4x6o0Tbw36Cuou+vDsUqhD9DjOhwL7d5L9VgprhY9pLhqiXTsv4ng
	HaL5kHRAJwoZHz+BamGbNqX5RL246KGzB35qt/AswVRIMJhLtPoC/vCV6Pnd4Uhj3Cfrr0JEgrW
	yVnq4DlYqjMgyt6VBt/fDatOxQvIO3xrW4aoOSu86M5TAyNylO/WMKgx0RfO2Fbz+vKn7YMh1oW
	xJ/jlCYqRoJ2tqPm180BGtr8jpVdJIgHEMI+x/I2b9mSYj/1ZJgLArsOcZXcyA7wJcLro+28Ghr
	hLYsvYNmqEdkeXM7/oG0DbJkKCqg2p03klkV7Eb5aGAw+/g5B/F4seGGlorjKpu9ntkLaPlf+IC
	EFcdehUdCGV5cXBs9P/hNNdq6GzVKpl9QAPar7e0ODmgTljj6+fUB70dLcXsO0sBwcII6w7fmAU
	XimpvmaMqv5Y3B5/LmJaQIlAVJe3z7HkF0UkPcWkFh4eaQOSH85Rc+dbXavIedDh4mswaNBAyXW
	p7KEdmnEM9nqJmKINl5
X-Received: by 2002:a05:7300:e9c8:20b0:34d:3ad2:680e with SMTP id 5a478bee46e88-3515dd51cd5mr3194766eec.14.1791388671211;
        Wed, 07 Oct 2026 08:57:51 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16168f586f8sm9457788c88.13.2026.10.07.08.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 08:57:50 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: Deepak Gupta <debug@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zong Li <zong.li@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 2/2] riscv: cfi: Only write envcfg CSR when task is current
Date: Wed,  7 Oct 2026 08:57:41 -0700
Message-ID: <20261007155748.291814-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261007155748.291814-1-samuel.holland@sifive.com>
References: <20261007155748.291814-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_085752_603150_BB93DF8D 
X-CRM114-Status: UNSURE (   9.96  )
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

set_shstk_status() and set_indir_lp_status() take a task argument, which
lets them operate on tasks other than current, but they always write the
envcfg CSR for the current task. Fix this with the envcfg_update_bits()
helper, which only writes the envcfg CSR when operating on current.

Fixes: 61a0200211d31e ("riscv: Implement arch-agnostic shadow stack prctls")
Fixes: 8a9e22d2ca5855 ("riscv: Implement indirect branch tracking prctls")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/usercfi.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 23c4d6d9d8cbc..86141e5bab822 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -15,6 +15,7 @@
 #include <linux/syscalls.h>
 #include <linux/prctl.h>
 #include <asm/csr.h>
+#include <asm/switch_to.h>
 #include <asm/usercfi.h>
 
 unsigned long riscv_nousercfi __read_mostly;
@@ -66,12 +67,7 @@ void set_shstk_status(struct task_struct *task, bool enable)
 
 	task->thread_info.user_cfi_state.ubcfi_en = enable ? 1 : 0;
 
-	if (enable)
-		task->thread.envcfg |= ENVCFG_SSE;
-	else
-		task->thread.envcfg &= ~ENVCFG_SSE;
-
-	csr_write(CSR_ENVCFG, task->thread.envcfg);
+	envcfg_update_bits(task, ENVCFG_SSE, enable ? ENVCFG_SSE : 0);
 }
 
 void set_shstk_lock(struct task_struct *task, bool lock)
@@ -96,12 +92,7 @@ void set_indir_lp_status(struct task_struct *task, bool enable)
 
 	task->thread_info.user_cfi_state.ufcfi_en = enable ? 1 : 0;
 
-	if (enable)
-		task->thread.envcfg |= ENVCFG_LPE;
-	else
-		task->thread.envcfg &= ~ENVCFG_LPE;
-
-	csr_write(CSR_ENVCFG, task->thread.envcfg);
+	envcfg_update_bits(task, ENVCFG_LPE, enable ? ENVCFG_LPE : 0);
 }
 
 void set_indir_lp_lock(struct task_struct *task, bool lock)
-- 
2.52.0

base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
branch: up/cfi-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
