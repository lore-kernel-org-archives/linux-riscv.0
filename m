Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9B1C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 10:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=awYisWuHgHDITpHTjfrKr7aKK8xkeQtAwqIvxKTsgkM=; b=48JBRkynUc5mOo
	ob8K89kyw/y5rH0GHj9EB+Q8UNtKcrNFfSpmRIr5HoePkXT+GarhETM6I74p0h58TAZJiw5yx/IUF
	+RbyrM9Fev9DnXqwYGxdyWWInqLsbw6HvPB9KRi7dfIU48PY+4iT+PDgelBItsHqD8yDM+pFW35lm
	clgC71MV0ZIluQf4wqNzTMBYg7szhSd+V1LtJKylvsGJbVtcGHS8nkFWkmnEudjRJAnf2tUmveKX6
	oGlwsLV2b3tMQi+2X1IXmX3rhd9We12xcdng3J7tOwuPnTzJ/kmUM5auX+35jeBcVCjMHai9/xljW
	7glGGOu/WlMO1XX5Z4sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmQg-00000009xA5-008q;
	Thu, 27 Jun 2024 10:32:38 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmQU-00000009x7E-36Kg
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 10:32:36 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-7067272245aso3751495b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 03:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719484345; x=1720089145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mmh+rI19FYvTX4VBo9RoQQF+CFlwjca98r/WMaZ3AgI=;
        b=Tf56ssTg/ytjMUSttYfA7u8efdNWY7ZGWZa+SIsg3B0JY5ebPIEtbcyrRv2FV874Ux
         W1g295BEao8LZoc5gPgr6xTCLOzfr0ygHh54d/hG6+jBR4mVFcHWF0x9xw5h6He1j6sS
         Faz3WshEiAEPSfG//YPR0cvmoz1p8vJwUObuT8FiFlW+AQV3lSHnmAABAwFSrs58qWYC
         rKgke0VtOU1Y4Ya47UM3zo6/vzH/3wQTVloMRELX3WudB4NezE+NYmobORH4NfoZXjyd
         S/nVmMGvnll+DueVpxj7yysutBP/9XIHAP7A4TOj++wggspGQ0pT1zU3a1hzwxURpqP5
         CiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719484345; x=1720089145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mmh+rI19FYvTX4VBo9RoQQF+CFlwjca98r/WMaZ3AgI=;
        b=xFvnhXBEzTG0o+J6Oe0YPkRLNMlsX75U7ay8aU1rLpsEqccQKHUMrhLdWB3DpZ44oB
         OF1rK2RJdV3+KNQDyXv5IDqYM4bbm4xpAQWnryrZ8Tgtv8M69bhroic+x8ruKeUJ4SN4
         FJepvwH8Ujl9MktpPbMnD9NduS9Xr/BN6iIKF/L5Ao7uJQ5Vhhgj+d1kNuF2Xa4COzVM
         rpFotJkbCnBIJr0SLlwLgXCs5l9Th5+Zbu64WJNXoFsG3lyoIiHqBxKrqs3JTW3o8isr
         wUP1O4EfrS7HocusIncvY9pUJFibW2LSXox5oY7SA3FjFw1dr7X8xQtn4pMZ4RxYp9u3
         B8pA==
X-Gm-Message-State: AOJu0YxCzsM9sX2u/yhFgvsMFl2ZwsDkV4s+zUO8+gKGZLgurPAgaTyR
	d7Y3OhGZStFM4mUicylzCWN+Wr4+M2fYXC8kXgOftw/AxzT/Yg7onDpwvKUfXDA=
X-Google-Smtp-Source: AGHT+IGH+QXTM5gHaVLPozuwgd8Aeizdbfooakik7KO6v8i735gwbRYhOSu54WAqSoHe6GUlXk+bnA==
X-Received: by 2002:a05:6a00:2d93:b0:706:8066:5cd6 with SMTP id d2e1a72fcca58-70680665df3mr13651186b3a.32.1719484344818;
        Thu, 27 Jun 2024 03:32:24 -0700 (PDT)
Received: from localhost ([212.107.28.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706b4a08169sm994352b3a.108.2024.06.27.03.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 03:32:24 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
To: linux-riscv@lists.infradead.org,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: linux-kernel@vger.kernel.org,
	"Dmitry V . Levin" <ldv@strace.io>,
	Guo Ren <guoren@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Celeste Liu <CoelacanthusHex@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] riscv: entry: always initialize regs->a0 to -ENOSYS
Date: Thu, 27 Jun 2024 18:32:06 +0800
Message-ID: <20240627103205.27914-2-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216; i=CoelacanthusHex@gmail.com; h=from:subject; bh=uImnSU73FfppRnJFjnbhQ8DpGMuTK/5eh1Eqwdt64C0=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMabX2S2McK1/saakP2s0R0KXLcMA0af+nj7u0UhOjr c3nfI8T0esoZWEQ42KQFVNkEdv59PWy0kcflvGazICZw8oEMoSBi1MAJvJLn+F/FM/dIrs57xuX vOp8wT5NySJji5qvn+/SDz6ODkfZE/9pMPwvnf8q5NEJU36D1tPSzl2l5R9Wv5DXfpVgUXWx8LT Z9b0cAI4SS+4=
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp; fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_033233_154364_D94C9BC4 
X-CRM114-Status: GOOD (  13.43  )
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

Otherwise when the tracer changes syscall number to -1, the kernel fails
to initialize a0 with -ENOSYS and subsequently fails to return the error
code of the failed syscall to userspace. For example, it will break
strace syscall tampering.

Fixes: 52449c17bdd1 ("riscv: entry: set a0 = -ENOSYS only when syscall != -1")
Cc: stable@vger.kernel.org
Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/riscv/kernel/traps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 05a16b1f0aee..51ebfd23e007 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -319,6 +319,7 @@ void do_trap_ecall_u(struct pt_regs *regs)
 
 		regs->epc += 4;
 		regs->orig_a0 = regs->a0;
+		regs->a0 = -ENOSYS;
 
 		riscv_v_vstate_discard(regs);
 
@@ -328,8 +329,7 @@ void do_trap_ecall_u(struct pt_regs *regs)
 
 		if (syscall >= 0 && syscall < NR_syscalls)
 			syscall_handler(regs, syscall);
-		else if (syscall != -1)
-			regs->a0 = -ENOSYS;
+
 		/*
 		 * Ultimately, this value will get limited by KSTACK_OFFSET_MAX(),
 		 * so the maximum stack offset is 1k bytes (10 bits).
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
