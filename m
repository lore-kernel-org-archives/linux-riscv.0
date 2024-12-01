Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF522D49762
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Dec 2024 10:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkY50LEf2t0aek9wRQu1zD4dSfCGwaREF61y9RVENeA=; b=HVwbYGkKQXgVGE
	K3NNDFGZymMbDX63K4TXeKeUuQW2HAiDPV7JnKoWQgKcKe9Ir9ZpKA3ewYFKPkjM5XZt72cHVH2vO
	iUiOPNBG+yc4orijS5FhGKO6c/j0gpm+iRZGW9bK9R4/xDqNRPpPQWj9MHmWB6vhRl09d8GX020Rc
	4EXZ+OiQpU2BLS/FXVj31Q7KtJvYoxrWmK1/xiCxxvv6cpwnYNM0cP7wCdQqn3yy1EIiWbEAMBxkm
	TGWaqOCPbOe9Gd/zojqjfuJYJNTajLICyjZ5UMSdeRLbaXFfP9V59KxdU8gYFoidxN2/lAlxvJ6MN
	bzk8xGY/GLE9N/mKfkxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHhBU-00000003INp-0KHI;
	Sun, 01 Dec 2024 10:28:12 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHhBQ-00000003IMR-3odt
	for linux-riscv@lists.infradead.org;
	Sun, 01 Dec 2024 10:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yw5hif6R2xr8gQiHoZQCNSDbVLkDYEqGBRYYvkoSF24=; b=LHB8KC2ceCUaLl8HnzUR3b1Grj
	BZ9cWpI4lgSkVPfTu18s994++ksTwOa4xCTC7FEflRLHfXY6/8M0HdctVQ1KXraGVqNFKjzgN4MgL
	ozDUpvZL298+ycf4KdQ0sV2Ar787ecGTuGCNmFT7FVar0yX1C2KvGhPyPhtRel9iz5q0twlbl8O/m
	axOGyaJSZ8e/mjcHPXWE78oX5w3Y4Eh2VyAedO33W4eMhQvm7oEiPVXztwbi2Djs2fhZtfMOhNBxp
	5djzNopQvxW5GyrM0TIURiR+3gbqgiBGADvH3Jb9RHO1pqTQwkCSApD2A7dja93lRqbNcKwYVrP7S
	uFNt3PlQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tHhBI-00FjrP-RS; Sun, 01 Dec 2024 10:28:02 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tHhBJ-00000000vYn-2pUh;
	Sun, 01 Dec 2024 10:28:01 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: ajones@ventanamicro.com,
	palmer@dabbelt.com,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v2 1/3] riscv: ptrace: add regs_set_register()
Date: Sun,  1 Dec 2024 10:27:57 +0000
Message-Id: <20241201102759.221176-2-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241201102759.221176-1-ben.dooks@codethink.co.uk>
References: <20241201102759.221176-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_022809_121774_184CB21D 
X-CRM114-Status: GOOD (  11.37  )
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

Since we have regs_get_register() and we could use the set counterpart
for things like fixing up traps, add regs_set_register() to set a pt_regs
value from offset.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
v2:
  - fixed Andrew Jones' suggestions for comments
---
 arch/riscv/include/asm/ptrace.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index b5b0adcc85c1..45c503b592c8 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -143,6 +143,26 @@ static inline unsigned long regs_get_register(struct pt_regs *regs,
 	return *(unsigned long *)((unsigned long)regs + offset);
 }
 
+/**
+ * regs_set_register() - set register value at its offset
+ * @regs:	pt_regs to which register value is set
+ * @offset:	offset of the register.
+ * @value:	value to set register to
+ *
+ * regs_set_register sets the value @to to a register whose offset from @regs.
+ * The @offset is the offset of the register in struct pt_regs.
+ * If @offset is bigger than MAX_REG_OFFSET, this will ignore the write.
+ */
+static inline void regs_set_register(struct pt_regs *regs,
+				     unsigned int offset,
+				     unsigned long value)
+{
+	if (unlikely(offset > MAX_REG_OFFSET))
+		return;
+
+	*(unsigned long *)((unsigned long)regs + offset) = value;
+}
+
 /**
  * regs_get_kernel_argument() - get Nth function argument in kernel
  * @regs:       pt_regs of that context
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
