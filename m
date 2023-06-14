Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C638EB64DB
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 13:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4X2eKYEbC7sMSMW64HWuRR2gvrwm+M11D9X3Z7au51Y=; b=Gpc0PegRUvoyHM
	tJnbGvy9H8Kx/BJYUMgGwqGE5U+Z7P+jVfXg/V0/u0XW+7xu7CO1ZTuTUYaOEAP165apMeRbMkBKm
	8B/yNPRqTtgkJ6BUrRCjUgENLH5ylZOae8AEipCUvDwONeWlCrFjUs6cmR+e+cCpZ/yU0SyS5Z/cX
	UMgA4YCAPpRgMOBMitKpN9+4xI+zGdgzzj6e+mjooEVQ3DNpnDiyXD2XgCYDHAwJQGm+iCe0exMMH
	UgMUPjCih8b+eskwW4MHWlfwy4DWCY4+hvqoyhX8Kpi2LUZ4jh3szutzEOFbukCc7nyTF936R5unU
	ZO9C1wckqzqUvrfmIWtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9nQr-00F3rN-1g;
	Thu, 15 Jun 2023 13:54:37 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9nQo-00F3qW-1m
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 13:54:36 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b512309d18so8523815ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 06:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686837273; x=1689429273;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=0F/E/Wcv8LomVkJmOYhpozB3jxfLbWnP2FDRJbC9H60=;
        b=CycNHiVELCJDfRjv0vzP8n1omPPaOlexURCnXlLOxluMucCoPofLMjDYoz8fkUo72W
         nkHVeRdu1bxoPJf/ibk1M+A5Q5PwyZdS8IWHVoa3TGXX8+K2DDCpFgb+1TlE+c1xgm8J
         +2G34HjSuFc2CYWjqzpun3j07Qw/8mT/xEVpd9d0CsMQITmTGjhyguLDEklHrjKoHIE2
         DkXM1b6/kpDdbqbXGN8x1HLwJgakSMYb3suecLa9iraodf54EBdIFp8mkq7CgAImOXxX
         9du7zkGQBr6EnhTM2KkFu6dzbZKiCOSyFSTN8yyJv50jDpg6Zov59hUetxVkjB1spPj6
         TDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686837273; x=1689429273;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0F/E/Wcv8LomVkJmOYhpozB3jxfLbWnP2FDRJbC9H60=;
        b=BunvmdRPXj960JBTpgEGPgQ5Tx9w3m8wyJcZCW970YpwrHM4FzvKeXoEMaDx1kaPaw
         5cydR+qFTyH0aCsG7wnoRuxNN9fb/+rjSVvdJtrH31Q8pvq9vXAmdvBUasPVy4ItNCGj
         zyy6LKi4fqz8aFHOVL7JZwgGM2SoCqeH9ggcPWAuLBoNjy2AaQo31I6rXv+JkDhG+8fJ
         5XdL8UCElrXYVhdfvPD78tmap75XVUDOX8rxiQPf7/h+pLbpt0Yi8WMGa+kKQ0fJ0W8J
         nuGRqhSte8KOiV6caDkPz7uWBrIQT4oR42JNRG3Kq7G62fCu5ZMetR9wqi3hgjong4F4
         htaw==
X-Gm-Message-State: AC+VfDxCCHMrZzxv8HmULkcPzYBtHA670VX65u73FpzBQG2qVRywCt8h
	3EgIB+1A/NNX6gUqh6fl08HZEyNlwP3gjIDIFUg=
X-Google-Smtp-Source: ACHHUZ63r8Z5Jq5EQXnEw4x4fUxVKURFIU163ResjPOIZQnWXYhjYWQ2A4GMBdwjBWwt0JxLRp3fZQ==
X-Received: by 2002:a17:903:48f:b0:1b5:1219:ec5b with SMTP id jj15-20020a170903048f00b001b51219ec5bmr2248980plb.36.1686837272866;
        Thu, 15 Jun 2023 06:54:32 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id x21-20020a17090300d500b001a221d14179sm14070215plc.302.2023.06.15.06.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 06:54:32 -0700 (PDT)
Subject: [PATCH] RISC-V: Clobber V registers on syscalls
Date: Wed, 14 Jun 2023 09:35:34 -0700
Message-Id: <20230614163534.18668-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_065434_592855_C2AC6528 
X-CRM114-Status: GOOD (  11.56  )
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

The V registers are clobbered by standard ABI functions, so userspace
probably doesn't have anything useful in them by the time we get to the
kernel.  So let's just document that they're clobbered by syscalls and
proactively clobber them.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
IIRC we'd talked about doing this, but I didn't see anything in the
docs.  I figure it's better to just proactively clobber the registers on
syscalls, as that way userspace can't end up accidentally depending on
them.
---
 Documentation/riscv/vector.rst | 5 +++++
 arch/riscv/kernel/traps.c      | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/riscv/vector.rst b/Documentation/riscv/vector.rst
index 48f189d79e41..a4dfa954215b 100644
--- a/Documentation/riscv/vector.rst
+++ b/Documentation/riscv/vector.rst
@@ -130,3 +130,8 @@ processes in form of sysctl knob:
 
     Modifying the system default enablement status does not affect the enablement
     status of any existing process of thread that do not make an execve() call.
+
+3.  Vector Register State Across System Calls
+---------------------------------------------
+
+Vector registers are clobbered by system calls.
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 05ffdcd1424e..bb99a6379b37 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -295,6 +295,8 @@ asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
 		regs->epc += 4;
 		regs->orig_a0 = regs->a0;
 
+		riscv_v_vstate_off(regs);
+
 		syscall = syscall_enter_from_user_mode(regs, syscall);
 
 		if (syscall < NR_syscalls)
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
