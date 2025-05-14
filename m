Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78354C3ABD9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 12:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MGlKakh+rfCcxls1PDAxwTIZqjLDpUhjft6TSwVehBI=; b=0zCfmKJFFlePo+
	iCewBVX7sZxa//oqb80ofAL7oWGItvHii2oRp3nm8Ho/A1dkJQTQBqyHL0B4j89fDEvozWnDpahEc
	lqNtCpyJjLcIsgzFL+9Szcefh3nrwCllfghjaht0QZHZAOkHimlUozvdFiehtjJPgly4oWoE4iIRC
	njjrVlqzC6W/+0GHOP5Hj6Jdrq3yhHzXMYTd1gHisfMv8jQVx9qZIF7+gYhgxvj6hG2JgCd1Tjng5
	tqad/Z6GCSUoKRtfnKrWtaNtwwjNnvddFg0Z6L0xM6bbuxAByrDxoM5ScJhiQltaC0PJGOYeHlj9e
	8iZmL3FnyskyhpnB6ccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB4o-0000000F1tE-3qtl;
	Wed, 14 May 2025 12:19:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8Zp-0000000EhC5-0dHr
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 09:39:02 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OfgQRDO7AB6uETq0DU5GYjI7YmKL4k2E304qWHHoNUk=;
	b=RyufCY3k//eNjv7tWeK1662ub2Z1eNq9TjWH1G8DQK4D6b8QfLj8WHd9EU6AIz25PNz3KV
	gjFDj1dWabJE9+kk7WBAlxgezpJSyahavni5xgGhb1RcWu2G4lZtCZgwdvpUdSj04ZnKdA
	1qy4FBB8x78xGuRvSMvITyc1G4azGitqZaRZatOgtL1afnB7XZp8KuCyfSK7jEtkE2AdyK
	YRNocxKLzf0hwRcQK6JmfZIl+LRuH4lH9vJEip9gf8bK+EYOl6GHkQhQaj1fsgfaLYD3vX
	/U9BBLtNFi9Bbb6B4ev/v/qi9LvEEk5uYBg+2H8Z1Xmlzvbr/TfHKKKYMfhE9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OfgQRDO7AB6uETq0DU5GYjI7YmKL4k2E304qWHHoNUk=;
	b=ibtVUyaVu6qhfG/3XG4o82j7JacZZzxQp03SCi18+9zGlP8MgkBLnsK2EsFCVg/Zf6nSvK
	ZmyRew9ruVmob8BA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 07/11] riscv: kprobes: Remove duplication of RVC_EXTRACT_C2_RS1_REG
Date: Wed, 14 May 2025 11:38:46 +0200
Message-Id: <d56955cd683411c6d2f63d13c78e0572462a3269.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_023901_364088_F205E1E9 
X-CRM114-Status: UNSURE (   7.69  )
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

Use RVC_EXTRACT_C2_RS1_REG, instead of reimplementing it in
simulate_c_jr_jalr().

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index 5defbde4dd50..f5d64613dab5 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -188,7 +188,7 @@ static bool __kprobes simulate_c_jr_jalr(u32 opcode, unsigned long addr, struct
 
 	unsigned long jump_addr;
 
-	u32 rs1 = (opcode >> 7) & 0x1f;
+	u32 rs1 = RVC_EXTRACT_C2_RS1_REG(opcode);
 
 	if (rs1 == 0) /* C.JR is only valid when rs1 != x0 */
 		return false;
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
