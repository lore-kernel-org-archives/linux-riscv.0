Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EBDC77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 05:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9SosvBJl/ksRW6XJhE/OjKUP+7AQjRtjJjaTOjxWxNE=; b=2EtQQjIk6bUay+
	4iBLIxaNCMJwuckPsR2E+GMsq/GYMxiM4gZpAbQzjZnX0pIbYVxU4zgdMqfjDe4+AWBRyNdRTC1Az
	+Qvgiw+g1fV7og10Z1wXRolFbJ+Q47zcX5O9avFUb4e/0OcQYJWNTNKDJVNv13xx6uxSzyN68g5rs
	fL1QlYsAoDfsV+j7rEQuld//uWcg+up7QG9tRWQDLxCBcPbqV4zizcQr+iWXHqv2Fdvl9lS1CTIf3
	+CqWYd5tgn6Kcr2E7WUYYcCMgMN+ssX1BI5HdG8zR8pwJBMtKFTEquabt6i+Ir+O5jvc3ZTUsrvnL
	oF11NV0DhIWfJst4yuHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR5h-000zbc-0D;
	Mon, 15 May 2023 05:49:49 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR5d-000zaK-3B
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 05:49:47 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1aaef97652fso84438555ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 22:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129784; x=1686721784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfepdXJdsq6ohX2AkAAGDRO8NQz+5w0XQmMbJfl5w48=;
        b=FF8l4h5Fv5CwOz55cyPlj8vNJJWDVMCkL9k6YPzgVyjIgqTq/5qVdZ+c4hVx+DU5zG
         7FfFBlhKYQ/qpU6PI+9MV2mxM9OMWh7pkrzjZFF7VozIKpoMEFsyNAUuhUgqygzA6ppl
         F9A9otVKxhESo1/uy9WyOYILhBG3Cgt6hE555xQafhrdCOiVWGhJ7Sbidox20cyLS3Zq
         LAQ6ahssk9FCrTXi/bK2hki2RPlJbPq3hy7OLkle8O1qIfmMB+/vAzltSc0mp9ptjvTX
         GpO78EjhUJCv3I33Cvf3aQcgYKCxTBrJfbhM4ZVlLyT5MW7sa1n0NG0KW4x3q0DBBFf1
         /d7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129784; x=1686721784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfepdXJdsq6ohX2AkAAGDRO8NQz+5w0XQmMbJfl5w48=;
        b=WY3hdZ5qUnytF1/0JxcpHt+TbuDakY9RKWOz9SJuk1WvXg8awrnq240kehM77MVdWO
         b+uX6hPIlQg+eCm3GeTbbWPts6jsqyRk4HGwngtJ18qEJNZsAllb3nwJeWXKwT7oc46u
         JS7TORd2xnBnYXWmG6ed7Ud0YRBVf8eVMqDu1mLX5a+8Y+P+F5Q+xp7BD4KZ/U4N1ZLL
         O7o+0nSCcpuRKHg+Pb1gIJLpmUhPG1XDX4SXJug6ydT1xZD+yo6b69nQDr4ifmWI0EyZ
         KhJw+QaimtGSNxUFlNt2V3xWux0l9cKZUozFww0GQ7crUHK9d3QKCNBfZKm1O5OaNNPB
         zyZQ==
X-Gm-Message-State: AC+VfDwCwnihbZIHi3cP/QHNMXfUn5cog8WiDGiwzuxuagXc25AQy+Tx
	DqK0br9xbvXkWVCdVMwcTr5IogNd7dAqdSxALFg=
X-Google-Smtp-Source: ACHHUZ60Bn8aXfOJxmjZ+b6wNx+tjPWbD4NXCzp9i69pk0qeKeo90gXjsK0vstRnw9C/Wioy6rg0Yw==
X-Received: by 2002:a17:903:2448:b0:1ac:63b6:f1ca with SMTP id l8-20020a170903244800b001ac63b6f1camr36172090pls.0.1684129784583;
        Sun, 14 May 2023 22:49:44 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:49:44 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V6 01/21] riscv: move sbi_init() earlier before jump_label_init()
Date: Mon, 15 May 2023 11:19:08 +0530
Message-Id: <20230515054928.2079268-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_224946_025759_B8DFD01B 
X-CRM114-Status: GOOD (  12.78  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>, Atish Patra <atishp@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
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
index 36b026057503..9fb839074e16 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -270,6 +270,7 @@ void __init setup_arch(char **cmdline_p)
 	*cmdline_p = boot_command_line;
 
 	early_ioremap_setup();
+	sbi_init();
 	jump_label_init();
 	parse_early_param();
 
@@ -283,7 +284,6 @@ void __init setup_arch(char **cmdline_p)
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
