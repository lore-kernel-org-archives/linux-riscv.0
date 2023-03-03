Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4777C7EE2F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbU66AYwDeOuh1jh3XXJ+ESo9jU3G9K2moA62clhIbQ=; b=WVl7Q5OcRqrKx9
	votdVyvO5Sf6chiyAkzEUzBAbDaRm2Db65gYF+TrRnoraXWbtT6iM+dp0BTyDIfd1q3lZMg9jt7xJ
	Ifu5fhz2q73eUAehrtVDKetpVG7PP4JJb9miAmLdeNLXF7vqsfHVKevxYxAvVdRMsoM+uqajW+FX2
	xHrp5jr8Uup6lYCLRr/j8MLYSYMjPlRI5F296fOzu3lSJ4MMsHLtcC5NJClt6YW4TQYoGqIdvaVUu
	BelDeKPRhfE0Gm1jukDH19wUchfu0uzo8x5lAe8K+fBh807fY2KQnVOWSxWbSj/RJicufM+IJ4TF8
	NKwcaBSbFIR6Sd+DZPzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5aq-006SxX-AR; Fri, 03 Mar 2023 13:37:04 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5an-006Swc-Nk
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:37:03 +0000
Received: by mail-pj1-x1033.google.com with SMTP id p3-20020a17090ad30300b0023a1cd5065fso2313140pju.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFClBCEHVbePO27Fju+ZNSU82apTBuXNOZbPa4NKUXM=;
        b=BaGOIcvg8yJWm+BIvCQOan2HHyyVeJEeaVJeASwbhGxl7BQSCOpwN9u25ktOOtlKqo
         uKJs2wjzyHW2sl5DzomdnOjELA3eXTKPy20+cTaCZlK5KRqdoFa0j8owuweg12R+tsdK
         BwxvWflFFoGEPgmpNarq6mKLDF6x2GZQbaAgGGa3IXZjyytIOKd8MXddS8OXGK68BcsO
         AjQcAGXJtcY20mIjMqoVKR7EuNbpxaV/NlOgxeZqwKIILS6n3ucL7q5YablSFhkqVBoN
         6vHdUn9huE+cJoGdX7bPLS81LIsRXLdCh04zY4Wd4w0eQDc/4m20oy/DZTzbNOySH83z
         gDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFClBCEHVbePO27Fju+ZNSU82apTBuXNOZbPa4NKUXM=;
        b=SBC0tuoWlEThRWDOJ2kiT/+1+CIPE5+J3gNN1DPrQUM4MmU4dnfFqvGDYuIwW+NLYC
         ETouwdDlhKjqXhlkeesvr8zxYkivDLYU7pC9J108GMberd7/LfPUZjgmk9q8bEe+csun
         RfbcwYC2N8pVZzcsfiyesJRxYuTDT9eCjIQbH+9d00jeCthZ1HVxHIsW8wDM7pPRIQ9u
         huPGGBEiKR57x+AgnlACdvKYEmNS3ZENKWhWHb/26fxH7LpceAfsdxDzhxjYfsmUGavR
         HUSBzFHDPdFYbXaNpiasiMbgcJbsUMaN7v2la/z2f2essvftnBDZpcAJv/WCRf03tW6F
         POsQ==
X-Gm-Message-State: AO0yUKUSpg7dMiOx+gnfWLvWTi7gSYTOCze8THICA9NakdjtUHLKrIRH
	AZo+QWXb4lkeqYnjb/nFLFgYKccQcwCGI2E6
X-Google-Smtp-Source: AK7set9rVAiWhWsuT5gKj6VGWXOC1pbmjRIxn98S9isZGtuhj7j9KMQuPfPis1dh/e9gvtSrvJNi4w==
X-Received: by 2002:a17:902:b28b:b0:19e:639a:e72c with SMTP id u11-20020a170902b28b00b0019e639ae72cmr1754516plr.52.1677850619796;
        Fri, 03 Mar 2023 05:36:59 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:36:59 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH V3 01/20] riscv: move sbi_init() earlier before jump_label_init()
Date: Fri,  3 Mar 2023 19:06:28 +0530
Message-Id: <20230303133647.845095-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053701_822415_F686D2E7 
X-CRM114-Status: GOOD (  12.20  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 376d2827e736..2d45a416d283 100644
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
