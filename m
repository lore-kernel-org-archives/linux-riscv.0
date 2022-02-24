Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FECEC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 15:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGGEGMpYvPKEvnedgucXcLRWaBv7IyN5uKFnsxCjmLw=; b=CMMns3bCyfint9
	+BAtmgNQRd9ZJErcJKsUUL1z+FSAzJ0edR4oeS4ye5ccEIzw948rp1brcGJvtiXeArwLZJ6UfCFx4
	hxxoWpDp2VjGQKXjji6u2XJEiZthEJdIbl4JuoEnMw74eKBpqQ5xv83QRM661abtJ/QIgtGJoH87f
	Fy+djobglemLpoGVKJHfAylExx1LGXpYMPY0OLyoZvm9pauZ7BuuE5Uc/WfMCct9yMAuxp7kJBoMj
	xgJbJETthFCbePwbG/Jkhc0hJjztytP4mFX5gzV6Jhicv8LvQ5+rMitqZZ0aV+77l9NZAmijNH9Ny
	8tI89BkGrPG+ISTkThIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNG0X-001ISY-S8; Thu, 24 Feb 2022 15:26:17 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNFzg-001HxU-J6
 for linux-riscv@lists.infradead.org; Thu, 24 Feb 2022 15:25:29 +0000
Received: by mail-ej1-x631.google.com with SMTP id bg10so5132677ejb.4
 for <linux-riscv@lists.infradead.org>; Thu, 24 Feb 2022 07:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uv9kZcj+SYuMKmc2v8qVWQoeoD1xbOxuZhUO9LDOn7M=;
 b=bX8bQwwicUGsPVy4Y3mCqGccZPF/GGpbluqz317ey+zLTOQ8c1fHnPI/DfzWOV1UYh
 trfJkNv4XTVJi09MAREd/Uj1wKpzLT7JGQ7Tt+J6DfwVsdakLY+CYarxxiaBsF6EOifX
 G1LBOc3kKYU754bVeI8/3HceRIVewkj+qWX8iAHHYnfMLLVXVWFzlAFTkPcS705ti4HE
 WO4bvtl6dq7IvcNWGhEv6DQnxHq9LLmKzfqxpMcaC+SWiiiMWxkgVVA9U2SE5v97t0FH
 /ZXQPpG8O45IQmob4YkGgegJZnVWJNfRfHwTbLHoNQJfzgLF0l0XizzrW5m8vb7Gi82u
 +AeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Uv9kZcj+SYuMKmc2v8qVWQoeoD1xbOxuZhUO9LDOn7M=;
 b=s5VCpatO6CFpevx8CL9zVzJA7ECTEXjvrv+yspTWGR8unbxbFe9KbRutBphfxZseJj
 p1jjf0xuKL7DADYb3eg18c9QnJKNx508U1LYQwZxaMZJihRYRimsMpm3YPBqmnUhIpLC
 KCfb9///vGqAAnCj8bI1WxbfToj8C38GPTz0BhCbM9acHC8NtO6xkbCu+VWrX33bD+Ck
 Pq6E+pff/lTJtrZN2GCOtThTvpPG2u6IjmepxsgGXSWQnin3amgNu0X09cFxNtQK/v/m
 9pj3RIip5cUt4ij/yVzwgrU28lIVUIb6OkZjbOGi3w0U9sEzCvxEzPg4Cq+V6s+zE0+d
 CJbQ==
X-Gm-Message-State: AOAM531fMwo928RtJSWqtfwQQ3F4WLpk1vBgAlSsIxOYOAANpv9dJMN4
 9LHnDjiS4YOodK0OLOUhFKsDRWYjppgVOopQ
X-Google-Smtp-Source: ABdhPJx2BEkVsAOUtvzhxXAulZFuBAavPEG0SaUBdCmd2wQhOtBfUaEYSeBVOeUXEPdh2WkJ1Gu0yg==
X-Received: by 2002:a17:906:39da:b0:6cf:7f09:a7bc with SMTP id
 i26-20020a17090639da00b006cf7f09a7bcmr2769072eje.457.1645716322553; 
 Thu, 24 Feb 2022 07:25:22 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id s11sm1509693edt.10.2022.02.24.07.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:25:22 -0800 (PST)
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
Subject: [PATCH v3 6/8] riscv: Use asm/insn.h to generate plt entries
Date: Thu, 24 Feb 2022 16:24:54 +0100
Message-Id: <20220224152456.493365-7-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224152456.493365-1-kernel@esmil.dk>
References: <20220224152456.493365-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_072524_684556_B0016D4B 
X-CRM114-Status: GOOD (  11.05  )
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

This converts kernel/module-sections.c to use asm/insn.h to generate
the instructions in the plt entries.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/kernel/module-sections.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
index 39d4ac681c2a..cb73399c3603 100644
--- a/arch/riscv/kernel/module-sections.c
+++ b/arch/riscv/kernel/module-sections.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleloader.h>
+#include <asm/insn.h>
 
 struct got_entry {
 	unsigned long symbol_addr;	/* the real variable address */
@@ -61,36 +62,16 @@ struct plt_entry {
 	u32 insn_jr;		/* jr    t1                            */
 };
 
-#define OPC_AUIPC  0x0017
-#define OPC_LD     0x3003
-#define OPC_JALR   0x0067
-#define REG_T0     0x5
-#define REG_T1     0x6
-
 static struct plt_entry emit_plt_entry(unsigned long val,
 				       unsigned long plt,
 				       unsigned long got_plt)
 {
-	/*
-	 * U-Type encoding:
-	 * +------------+----------+----------+
-	 * | imm[31:12] | rd[11:7] | opc[6:0] |
-	 * +------------+----------+----------+
-	 *
-	 * I-Type encoding:
-	 * +------------+------------+--------+----------+----------+
-	 * | imm[31:20] | rs1[19:15] | funct3 | rd[11:7] | opc[6:0] |
-	 * +------------+------------+--------+----------+----------+
-	 *
-	 */
 	unsigned long offset = got_plt - plt;
-	u32 hi20 = (offset + 0x800) & 0xfffff000;
-	u32 lo12 = (offset - hi20);
 
 	return (struct plt_entry) {
-		OPC_AUIPC | (REG_T0 << 7) | hi20,
-		OPC_LD | (lo12 << 20) | (REG_T0 << 15) | (REG_T1 << 7),
-		OPC_JALR | (REG_T1 << 15)
+		RISCV_INSN_AUIPC | RISCV_INSN_RD_T0 | riscv_insn_u_imm(offset + 0x800),
+		RISCV_INSN_LD    | RISCV_INSN_RD_T1 | RISCV_INSN_RS1_T0 | riscv_insn_i_imm(offset),
+		RISCV_INSN_JALR  | RISCV_INSN_RS1_T1,
 	};
 }
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
