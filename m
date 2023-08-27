Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D886CC83F01
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 20:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y2xICvHHnrpIatiJI2cymh0d7ytXY9pEOJiMdbv6guQ=; b=Si8Tm62a9HhfGm
	WM7VcjLHubKShQgfMCUtpLuUQ2wRvfFwUT6bWDyR8rpvUEEEL+t7fwCDrobcmdNY1rli+NHsDoCqy
	R2IrJgBf7wGhJ0uCRh7OSriSH56EE4EICcIScfW0aLcTlBFy788o+d0FVpoSoBSlBMXeLfIiKBWv/
	FYyUPB2s8YjoZK/cnzVEPWpjAsirHWpg9H/rEQwWpCdOphM2m3pIXRxsKf6q4HuvG8jc6/2xaBwza
	ab4EkfB+xiQJw+PFwFJik8Etm6OiMufZBwj+ZgROutjlPaUC3F5QCFTm95VXi9arKyOQ1jWS9v3CQ
	SOpPT0SFSHuaWnyweE+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaMoh-008SVv-1K;
	Sun, 27 Aug 2023 20:57:03 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaMod-008SVJ-0A
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 20:57:02 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99bfcf4c814so323930966b.0
        for <linux-riscv@lists.infradead.org>; Sun, 27 Aug 2023 13:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693169812; x=1693774612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJAK2lEo2Ushg+QTBvqS02TVMVDEl0y6m3BBQOKXzGM=;
        b=UY70quMP3gdJS+VCHR5Tow+Z0l/1Yw/BRMlM0upUs71QFOlYJ4nDbLA1SfiWV3Yuq0
         55JllHtkDEJfvAZw5tuOfMAxRFtkQ33xzUON/mW7LsGEqOuo4xjgmKRK75c2XU4rDFX7
         fS2ChzAR5wzZBX1T+nQc5jeui3lbza9vZJcSpPva1kFHGSniNs8boQWRcH489o8OiHNt
         5QcnhGSTrympb2OwqiZRjxR1OlgX4L+N7UsbIz9LQkD3eWEiAbZQjQULZXeE2NvACv6a
         6R45YycBT9znoRclPEGaTEsSbTuYIekC/d2WE8GwUt8U6XTmCsOlvcTTO5b7cEDDumGV
         gf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693169812; x=1693774612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJAK2lEo2Ushg+QTBvqS02TVMVDEl0y6m3BBQOKXzGM=;
        b=dmA2/rrlARP8p7aRUsy8ILBsXPw9bxYLJrA0964YCi1zmAimxxl0wG8H5joZ0A/oDE
         QVPD9e6eA1Fm3UqBPP7UCG+Uc0+6v64m4mgBkrpBeDfsnx+USNLyienDxg0IZS73Lmc1
         DuxMj0oA+y6YrjY15JqRiuCmpmednAW6YslPMQYZr6UpaSuC7fC244AkKj5KkZPsOSPf
         iSjdYlwj5zyv1fGAvTX5UB2Wr6g3OPxaL+1hDwKnUPVsCckpUQHSc5RlETb29vLOT7EG
         py82wtZ1T3CIn8iEw5hpUJc0xtiWmilCGzo+Ul2zo/HGg0H0eIIjq0p3jPzBOzK0ZTLv
         AQbQ==
X-Gm-Message-State: AOJu0YyT0TukXfaw6WNKw90FRgDkFwIUcTPvqpoOpNkLuCeY638aXX0w
	12NpmQlCJWaGK3UUx0Ms+Og=
X-Google-Smtp-Source: AGHT+IHP5M1qiNTQZpm6LuN89GbfBfpH51fArtUnAdfRI5sTiMPPAGKYSQphLdCYxaxDZABFQSyEUg==
X-Received: by 2002:a17:907:a05c:b0:9a1:bd53:b23 with SMTP id gz28-20020a170907a05c00b009a1bd530b23mr12148538ejc.14.1693169811749;
        Sun, 27 Aug 2023 13:56:51 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id z3-20020a1709064e0300b009a19fa8d2e9sm3799181eju.206.2023.08.27.13.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 13:56:51 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bjorn@kernel.org,
	guoren@kernel.org
Cc: Nam Cao <namcaov@gmail.com>
Subject: [PATCH] riscv: provide riscv-specific is_trap_insn()
Date: Sun, 27 Aug 2023 22:56:41 +0200
Message-Id: <20230827205641.46836-1-namcaov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_135659_263411_6EC0D183 
X-CRM114-Status: GOOD (  10.18  )
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

uprobes expects is_trap_insn() to return true for any trap instructions,
not just the one used for installing uprobe. The current default
implementation only returns true for 16-bit c.ebreak if C extension is
enabled. This can confuse uprobes if a 32-bit ebreak generates a trap
exception from userspace: uprobes asks is_trap_insn() who says there is no
trap, so uprobes assume a probe was there before but has been removed, and
return to the trap instruction. This cause an infinite loop of entering
and exiting trap handler.

Instead of using the default implementation, implement this function
speficially for riscv which checks for both ebreak and c.ebreak.

Fixes: 74784081aac8 ("riscv: Add uprobes supported")
Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 arch/riscv/kernel/probes/uprobes.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
index 194f166b2cc4..91f4ce101cd1 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -3,6 +3,7 @@
 #include <linux/highmem.h>
 #include <linux/ptrace.h>
 #include <linux/uprobes.h>
+#include <asm/insn.h>
 
 #include "decode-insn.h"
 
@@ -17,6 +18,15 @@ bool is_swbp_insn(uprobe_opcode_t *insn)
 #endif
 }
 
+bool is_trap_insn(uprobe_opcode_t *insn)
+{
+#ifdef CONFIG_RISCV_ISA_C
+	if (riscv_insn_is_c_ebreak(*insn))
+		return true;
+#endif
+	return riscv_insn_is_ebreak(*insn);
+}
+
 unsigned long uprobe_get_swbp_addr(struct pt_regs *regs)
 {
 	return instruction_pointer(regs);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
