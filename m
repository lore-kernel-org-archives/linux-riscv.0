Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABE1C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H6jI65sLt9a0PPYiSTvqbkwrB8WdDSJYf0WaTDnbgq4=; b=wY03fo5fGY/nxB
	JI70n2WmadXTlWds9gTsS7gPpOIrB4j4i90AUFjkTU80CuvBNd7gkYJ24zmwZOouYufxBaz/D0R+J
	7zmuEquyg/I35KoY2qJL3xQQubmNnFqnhXhn/lsHE99HtTKq8bHb0tP1cE3F9p8d8J+qJKJ2gy8rC
	bJS0Xo664oSpk+y1IvEG6NO8G7SvafmJnMAG2fcF5OJ5ABv94RSnxjDIk7Hmd7xPs4IkB76Xn0KR/
	TYQ7SeqtBsv80FsluocuADTDbcq2Lc/PRbnvBeqxq4RlqO1eN/L1Uw4A08mQlho/JvlkJ3j8RF8R5
	+gBlT8JgX+msp/B41AKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSisQ-00BTOM-Hj; Thu, 16 Feb 2023 18:21:02 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSisN-00BTMS-I5
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:21:00 +0000
Received: by mail-pj1-x102e.google.com with SMTP id nh19-20020a17090b365300b00233ceae8407so2960973pjb.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zt5AKTEcwHiFDwLgavojOfY1pFXS3U3JrowEB907ryU=;
        b=hh3s2OimS73QDs15kWCc2k+lI5tdH7x4xpQgd7UXBzADhjqkPdoP9zDNLKlvXIcB3j
         WhapBBPx3FQ50Ef9UATRHacKSfPD51PY94qt/38FAuRex3S4rktbxTUVWewRc4eTYN40
         JzddLtS9xtnca0cYhHjA8PPX+Fg2/plv2OigHAVwz7TcxcFWTyONo/Iy/ttkziIKqRJE
         7gyNPrVRvfy1tgsW3pJO7dUBOd018tUx1cmCfyC7+4Q7P/xXrxcqGYWDpBJXntex4zNG
         tNdkvuY106SjtLM/sh3J66oTgx61nmV0t4JUqJc+AhDSIrDtCm3S9H4csLsaqCx/DFi6
         CrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zt5AKTEcwHiFDwLgavojOfY1pFXS3U3JrowEB907ryU=;
        b=lw0skcOZKi2KstGptYNOAGkSaAwCJsKxdkLp1UoEJcU7Q05v+CSvf4/Sl0A5YFKU3E
         q+Wtq7QzZFLP/MufqR3KQ5s2jTVUs3YpAPTW+GS0JZkuIKCXmQEEup/7KEYDUlctr0qb
         faetlZo9MEzzsAy43QztEHy62mo3Kr1BALCloNxw6qauLWW+Sxz2ctUfGzqKajbGRors
         AvtGmRsKqSsRY2u9jC94TtimRYcxlMy5frUhl69L+B9P9OtuRndb8rIVsLMYPfiF+LkR
         o3cb0L/kiAB9OpjGs5DmQRs1m/ame4y19Tb1h7gja6rZQRdQXKRWHzlubiwLlFNBFkJv
         uong==
X-Gm-Message-State: AO0yUKVRzVp08bJmbv965D2jPYbMc6S4DlPdqQKiXWPhVdzBmaX5TSlJ
	VaRUmO/Ehm6uzZTiwuVwNS4J5g==
X-Google-Smtp-Source: AK7set+9ugdYQXsd9nFuZ0RuwmCqqGWgTItMCKqMDeOgGO/BOe4S+YBcFoIYg1vQdLiP3+Rlf9qHHA==
X-Received: by 2002:a05:6a21:9814:b0:be:c217:9580 with SMTP id ue20-20020a056a21981400b000bec2179580mr5065551pzb.49.1676571656477;
        Thu, 16 Feb 2023 10:20:56 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:20:56 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH V2 01/21] riscv: move sbi_init() earlier before jump_label_init()
Date: Thu, 16 Feb 2023 23:50:23 +0530
Message-Id: <20230216182043.1946553-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102059_638058_2732CED9 
X-CRM114-Status: GOOD (  11.97  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
