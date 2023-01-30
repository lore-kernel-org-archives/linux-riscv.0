Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196B1C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LqmuCL3fOn9+T/0jlm/tD4FXbgO+1m2PJjUtydPakQk=; b=m4irSjJyot6ZvU
	c6a/eFCr8JCWCo0pIQFuFIKKdUVAt2bR2fOwu/z1xQRWweOB0kcTwa6sb7h70slt7USyYJfGRJwj0
	f+uj49Gmn+mR7GmW+wESQzv1MspycLZCrIK7hxs9RYpwrZMUaaq/XMt4Brw8CSaoTnqCX5AihRbEd
	jGu9q5Fblmwt8VzgAhpOcQx0UtG6aRLueQGozBgtvH3HTjTovTyKaSO2zEXs7rAl08o6O+5ahAc3C
	Z4xoKd4RXdVnq9W6lor8KiAixwJk1J4MZLpRQX7h6HgHqmJqN/bMu5HJIBXg2VVdEgmSr1sRbHYp+
	tMyKUc5YDon+GWzLVylQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYpm-004xhD-S7; Mon, 30 Jan 2023 18:24:50 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYng-004wnx-G6
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:22:42 +0000
Received: by mail-pl1-x634.google.com with SMTP id jh15so3492634plb.8
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7KlC1E/qchNA2FeI/jtSOoGuHWoLpY70PQmwt3/hBY=;
        b=UAEtEYB4sxc8KHHENJmXhvAQAx2IpZSpMetPcln5se48nk/nwrzG6OCr8vrvlOUK4R
         Q+wYu1Ei9STWCCcjnVi0yf8DJySBsWU4urpY0FXpxBrXWGscireaG+r2UxmjnzPvg2IL
         LxJ0jAlYtFZ2uAx70DH9AUiRgf4N/2VZIKisxxdLNHogJxvEDSHwnESsH5fIRX9kLuQH
         BSxZoAcbStJwMc5BV5sYkpWhZJcbX2j9cI28SyWWheLy+onRcrtMd6fX6MzSNd7mf+3V
         X4QmOiVfdgskQjJPOvOk4K9vQRx+ifGBs1R8C9y9NTsQKp25glwE7MQEAxzFO3dGX8kC
         Qw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7KlC1E/qchNA2FeI/jtSOoGuHWoLpY70PQmwt3/hBY=;
        b=LGjhEtUwRgolj+hZXg4nMhGXndaVDn5zpSuWmFBO90/wWtSFGMBnwNqFUqKF9HWkDP
         zpFunHK5cOgvK4CkGSyPrP38Gn5k6+X6JA9kikux4l3OM5rueVqO+3RwgxSQAjcFts4W
         MB940mGCVxWB5vo2We47IUd4gYGMNLnFlris3ruUlP1mUWRBoObkd9lHRBNTkLPJBXkV
         2ibFDray7186i+ZTAhfXcxqdl7QR+xcORkNfrySRmlkls/hP9CRDLu3hzJmR93b9Jgp6
         ZR74EFszDJbVSKZW9zRBiAXLXdnve2+LQpOCfxss2qO/6s2Dj90Lu5KVP5KJyD2k3Rio
         6zjQ==
X-Gm-Message-State: AO0yUKWdGmn2kM0PsiGY8gTMqE5z3pfzeTNk9I6AKFJWa3WHXz/lmXRq
	Ipr08IoHxxkEg/91eint3agO8w==
X-Google-Smtp-Source: AK7set9BFSU/mcgDE8X3OMCmuvOsHIDDbHvxpRXfPUvGLXJNQQEIIvYdvRJRPOqM+/blvkVNGf+CvA==
X-Received: by 2002:a05:6a20:441f:b0:ae:47a6:e6d9 with SMTP id ce31-20020a056a20441f00b000ae47a6e6d9mr13097359pzb.6.1675102958616;
        Mon, 30 Jan 2023 10:22:38 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:22:38 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH 01/24] riscv: move sbi_init() earlier before jump_label_init()
Date: Mon, 30 Jan 2023 23:52:02 +0530
Message-Id: <20230130182225.2471414-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102240_602109_12EE4145 
X-CRM114-Status: GOOD (  12.39  )
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

From: Jisheng Zhang <jszhang@kernel.org>

We call jump_label_init() in setup_arch() is to use static key
mechanism earlier, but riscv jump label relies on the sbi functions,
If we enable static key before sbi_init(), the code path looks like:
  static_branch_enable()
    ..
      arch_jump_label_transform()
        patch_text_nosync()
          flush_icache_range()
            flush_icache_all()
              sbi_remote_fence_i() for CONFIG_RISCV_SBI case
                __sbi_rfence()

Since sbi isn't initialized, so NULL deference! Here is a typical
panic log:

[    0.000000] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[    0.000000] Oops [#1]
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.18.0-rc7+ #79
[    0.000000] Hardware name: riscv-virtio,qemu (DT)
[    0.000000] epc : 0x0
[    0.000000]  ra : sbi_remote_fence_i+0x1e/0x26
[    0.000000] epc : 0000000000000000 ra : ffffffff80005826 sp : ffffffff80c03d50
[    0.000000]  gp : ffffffff80ca6178 tp : ffffffff80c0ad80 t0 : 6200000000000000
[    0.000000]  t1 : 0000000000000000 t2 : 62203a6b746e6972 s0 : ffffffff80c03d60
[    0.000000]  s1 : ffffffff80001af6 a0 : 0000000000000000 a1 : 0000000000000000
[    0.000000]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
[    0.000000]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000000080200
[    0.000000]  s2 : ffffffff808b3e48 s3 : ffffffff808bf698 s4 : ffffffff80cb2818
[    0.000000]  s5 : 0000000000000001 s6 : ffffffff80c9c345 s7 : ffffffff80895aa0
[    0.000000]  s8 : 0000000000000001 s9 : 000000000000007f s10: 0000000000000000
[    0.000000]  s11: 0000000000000000 t3 : ffffffff80824d08 t4 : 0000000000000022
[    0.000000]  t5 : 000000000000003d t6 : 0000000000000000
[    0.000000] status: 0000000000000100 badaddr: 0000000000000000 cause: 000000000000000c
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---

Fix this issue by moving sbi_init() earlier before jump_label_init()

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 86acd690d529..4335f08ffaf2 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -270,6 +270,7 @@ void __init setup_arch(char **cmdline_p)
 	*cmdline_p = boot_command_line;
 
 	early_ioremap_setup();
+	sbi_init();
 	jump_label_init();
 	parse_early_param();
 
@@ -287,7 +288,6 @@ void __init setup_arch(char **cmdline_p)
 	misc_mem_init();
 
 	init_resources();
-	sbi_init();
 
 #ifdef CONFIG_KASAN
 	kasan_init();
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
