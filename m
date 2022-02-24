Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8D0C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 15:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GW96CPND3IDXIlCjq1GQtuFX2I0NC7pyVKjt8cUvO/g=; b=RmI5X2tf7ep0ZY
	xLUNo3SuQ/OoLEVdE0ZQxKgvhDGcFg+jZul+2mP7X2Rjo7F2pDrESbYM5xXaYv8Ps33sA5FemgUhI
	7oi8FpZmg9Zm+84F0Q05lvH7i3R5HFa1LusGVIyR4wey+82Ru3juBJQFGE2iq8UCYHZk2lXfIs9xu
	hYqHqOFHdYkZORHBLtfuLrxacaeE3OgqEiPlmi/00QcBThsdTIJI22GU9EARJzwXij4KrZB16Idb1
	M47pW7pLy408sxU2VT4g5ansF0FCC5N9JvwVGAmOgYPI7AHiQRoYEPGTxfPJJidRzYF6OKwkwotyH
	cZwIpTY0WHe3JXFd3Beg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNG0N-001IMD-LM; Thu, 24 Feb 2022 15:26:07 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNFzh-001HyH-0S
 for linux-riscv@lists.infradead.org; Thu, 24 Feb 2022 15:25:29 +0000
Received: by mail-ej1-x632.google.com with SMTP id a8so5097580ejc.8
 for <linux-riscv@lists.infradead.org>; Thu, 24 Feb 2022 07:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U2McVQuv53c33dZYwtuytrfr7zhfRHKf5OwpDdiji0Q=;
 b=FeLVTuzc9wPFQH0ho6dLgoj+hWeW+fYvqEve7lVWA6cpLUDwNU3G4myXMgVZX8wV11
 OFiFwl9VXdVCJxputF6RNS9sOj5Rz0iwt+Ccsi4YLAt5xJOMf3Oct4BF7CtYgp07Hx0Z
 Px1K1NlBlRUjfC2Mf9oijmdM3U+adJmgDX0+emytZDFkGZ7pQQk7dbvzutjnDBh65znN
 5b/Qx/uM1lZm3wLRbuoCuqBXesw3IYGN3LBVCpCJDO4LdcN3Ao+RmXaZry2BPOuGUATy
 jXxmFYAm06C186UwdZme7YcBfIHiZRSc2jmnWWkU7kTp7vht4qvOi5IS+Hrk8gT0PR2u
 rRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U2McVQuv53c33dZYwtuytrfr7zhfRHKf5OwpDdiji0Q=;
 b=YJgBnh71/x5ocoUGCnZGt6eJkISb7xhCxOWKqV1CW+5AdRWejx7Lu+P3b+NyiWsOxb
 qTOL+gPsFHC5XydDd6Lo2VPlHEsfJv6X7CRint3C43UlqxQ2S9MPcG5/allQntaX7wwR
 Fr7I8c9M/8zs3I8mPSg3aHAG3WjXvxKPcTnlH5ssEO1/bNQjZHBq+SIEZGW1bQOfThIY
 llv7ulEZuKJmpMI0gcejd4KkPJXlQ5W/BBAJ0+5Oh4+jKPp+GIIhLeo5+q1LQs1vbfBb
 g69ojP8yIlPxox6+90ckLDAZtFbbov5rYs1HqwsVP3dcZ+tn5HKz1OF+UExVfhalxk+O
 /h9g==
X-Gm-Message-State: AOAM532Z8Qfo3KhWTYjTnclea3ZS0gmXRAq7sWBsWWyT9oBje+F3O+4t
 g87B3KMKuoOmuPDmtO3v4dJgssQBzoIJakdy
X-Google-Smtp-Source: ABdhPJzmtg5/x9WY3qCGLphHaryu+r7YthG+HP7Rm2wRL6NLXkgnTbKEoS4nS1g0S/n8hO2ecRMJzA==
X-Received: by 2002:a17:906:65d5:b0:6ba:3133:dfb9 with SMTP id
 z21-20020a17090665d500b006ba3133dfb9mr2818930ejn.56.1645716323553; 
 Thu, 24 Feb 2022 07:25:23 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id s11sm1509693edt.10.2022.02.24.07.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:25:23 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jason Baron <jbaron@akamai.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/8] riscv: Use asm/insn.h for jump labels
Date: Thu, 24 Feb 2022 16:24:55 +0100
Message-Id: <20220224152456.493365-8-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224152456.493365-1-kernel@esmil.dk>
References: <20220224152456.493365-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_072525_144455_D7F30E9E 
X-CRM114-Status: GOOD (  10.58  )
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

This converts kernel/jump_label.c to use asm/insn.h to generate the
jump/nop instructions.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/kernel/jump_label.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
index 20e09056d141..b5b4892c3e9e 100644
--- a/arch/riscv/kernel/jump_label.c
+++ b/arch/riscv/kernel/jump_label.c
@@ -9,11 +9,9 @@
 #include <linux/memory.h>
 #include <linux/mutex.h>
 #include <asm/bug.h>
+#include <asm/insn.h>
 #include <asm/patch.h>
 
-#define RISCV_INSN_NOP 0x00000013U
-#define RISCV_INSN_JAL 0x0000006fU
-
 void arch_jump_label_transform(struct jump_entry *entry,
 			       enum jump_label_type type)
 {
@@ -23,14 +21,10 @@ void arch_jump_label_transform(struct jump_entry *entry,
 	if (type == JUMP_LABEL_JMP) {
 		long offset = jump_entry_target(entry) - jump_entry_code(entry);
 
-		if (WARN_ON(offset & 1 || offset < -524288 || offset >= 524288))
+		if (WARN_ON(!riscv_insn_valid_20bit_offset(offset)))
 			return;
 
-		insn = RISCV_INSN_JAL |
-			(((u32)offset & GENMASK(19, 12)) << (12 - 12)) |
-			(((u32)offset & GENMASK(11, 11)) << (20 - 11)) |
-			(((u32)offset & GENMASK(10,  1)) << (21 -  1)) |
-			(((u32)offset & GENMASK(20, 20)) << (31 - 20));
+		insn = RISCV_INSN_JAL | riscv_insn_j_imm(offset);
 	} else {
 		insn = RISCV_INSN_NOP;
 	}
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
