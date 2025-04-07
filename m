Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D0BC369A5
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 21:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSOtXMKZW/Pfy0p356PC/ryYbJ9nwCWfqck5VD7vHvk=; b=0xGuN9CQ2q1WYB
	0IUnQ6PD2GuelYw1BncLjql5Pz7J/gYHzi7ayDYgPDlxUz20Rs+lyTRvX7ZHr2ZVWMDZiIWMw9O7v
	Exc1ozHzJhGi2tL8EsLdwp0ynknEkaIc4ggNC9Ue1puj4eXPqmI6a9Wc8XSYTWLd4/jtmEFDzyEMg
	BWqnv6pJbwKCwY6Rc+ePHmY0cwdffxS35edewWLsStstzb4Q7mZ/+hIuUkB1YRNb7F7aX7u6nkDdb
	+ECsXTMXKjQgtztjNmJhrvjlf4A+VWe5fheEn+frNOrPsGw1PMi44pJeFNVuMTYC1ln0+tJRsyYzN
	bJjd5DyUZE7qYU4aNh0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uIo-0000000244T-3Ghy;
	Mon, 07 Apr 2025 21:46:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1r1W-00000001VJq-3vsg
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 18:16:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD70B49FAC;
	Mon,  7 Apr 2025 18:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53D5C4CEF5;
	Mon,  7 Apr 2025 18:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744049802;
	bh=QjTZVZpLSS+0ELNf070SsOOXNr9BdGZ36boybxSz8d4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mILM1JuRO3G8+RuzMDn/IuQVP4WtUg8FT6i7WuTFPoDtB3LiqvL8h3LGfVxHTfMC2
	 UXvVy2khev8u2L6C8A1NGpQe5DyGvHgY/NtACFOx+H3tNMwx44BIu3lPDRvSJt4sY/
	 /hsq7iRUv77V4707mGrgcdlMSJMJO2hj4egZ8uyji79k1O7Apra4InMdFl0lOzeRnr
	 mEED0qGMjf2mkrfy4VCu8Y9D2mwtkuK1dH7pq57/3qEwgofiIhjpT5ASGaNOZmL/1S
	 krRhbXV9xngdOxG02qqv4Lo/3+xpaMpZavkCqiAMl4A4E82/M9356r3X8PvdQyg10v
	 qM9ar2IYh9Uxw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Charlie Jenkins <charlie@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	oleg@redhat.com,
	linux-trace-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 2/9] riscv: tracing: Fix __write_overflow_field in ftrace_partial_regs()
Date: Mon,  7 Apr 2025 14:16:28 -0400
Message-Id: <20250407181635.3184105-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407181635.3184105-1-sashal@kernel.org>
References: <20250407181635.3184105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_111643_071116_3F4A4067 
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

From: Charlie Jenkins <charlie@rivosinc.com>

[ Upstream commit bba547810c66434475d8800b3411c59ef71eafe9 ]

The size of &regs->a0 is unknown, causing the error:

../include/linux/fortify-string.h:571:25: warning: call to
'__write_overflow_field' declared with attribute warning: detected write
beyond size of field (1st parameter); maybe use struct_group()?
[-Wattribute-warning]

Fix this by wrapping the required registers in pt_regs with
struct_group() and reference the group when doing the offending
memcpy().

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Link: https://lore.kernel.org/r/20250224-fix_ftrace_partial_regs-v1-1-54b906417e86@rivosinc.com
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/include/asm/ftrace.h |  2 +-
 arch/riscv/include/asm/ptrace.h | 18 ++++++++++--------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index c4721ce44ca47..ec6db1162021f 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -207,7 +207,7 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
 {
 	struct __arch_ftrace_regs *afregs = arch_ftrace_regs(fregs);
 
-	memcpy(&regs->a0, afregs->args, sizeof(afregs->args));
+	memcpy(&regs->a_regs, afregs->args, sizeof(afregs->args));
 	regs->epc = afregs->epc;
 	regs->ra = afregs->ra;
 	regs->sp = afregs->sp;
diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index b5b0adcc85c18..2910231977cb7 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -23,14 +23,16 @@ struct pt_regs {
 	unsigned long t2;
 	unsigned long s0;
 	unsigned long s1;
-	unsigned long a0;
-	unsigned long a1;
-	unsigned long a2;
-	unsigned long a3;
-	unsigned long a4;
-	unsigned long a5;
-	unsigned long a6;
-	unsigned long a7;
+	struct_group(a_regs,
+		unsigned long a0;
+		unsigned long a1;
+		unsigned long a2;
+		unsigned long a3;
+		unsigned long a4;
+		unsigned long a5;
+		unsigned long a6;
+		unsigned long a7;
+	);
 	unsigned long s2;
 	unsigned long s3;
 	unsigned long s4;
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
