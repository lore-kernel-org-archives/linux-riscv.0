Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FC7C35FFF
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+hUbPYoNCvzSbLtb9XM/tX3BhhJseN/C4la6EBJndIE=; b=2/cSN/yD2vmdT7
	qripjSBfb0WA2alrt/YrrvYHotKPoR87TAIImprjRwq5850me/H7/tOznMu+CweldQ3M00SM8umqJ
	TSCTpGz7QLfAqsdXJ4KVbCu9JS4/SaSoXBGgw4zxMEWux/gnaOW08zMZ4cC1+5uQToNtd88oviyVh
	r3sZqFwmXxZkZdYZ4HE1fcLMCQWvZ/1ESCv+hrTfEIzvLA7jxyp9J30CI6fIzgRqUfWUUyHVa3Fy3
	aWcn32DaR2a9c0tCYEYPfehXif7jOqpftyq/EtUGimo1ULj5IDLbbeeLYZUB1ZfmCJhhd9BCP7O0Y
	+Et2yPWzvTy4GE+UrgxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYKM-00000006El4-1MCB;
	Tue, 17 Sep 2024 13:33:10 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYKJ-00000006EkU-0MWa
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BAuGBA6SeGp8hx6Y+sRmy9j/6zVyRjrmgZdRmAJIH6o=; b=OJb8gcLPH5kl/h9Oqnuu6YCEvh
	h7AEo/dT1E+oKZgS2G+9OXJwxtT9aBoYPHoHG9SPi8bGer6gk22wnU50+TBzCGg0P7GHVwlrlGxpP
	yqfl04uryUJqGSaOrTUMk6HgGFLytoM5HRJlvOi0hxQhz3STyE/Et1CasYN9X5BPR3w4YGLtlXmKO
	ZzrlyXmYUF62qZcDGXBKpamEjOwkCbCdcFkFDcZECE7GCrR+gMGtvWtlfI0vd2CZ6d7YErz9QMTye
	+xoAVatjS7ZVSrgVHF822es4aU141/wGUbOr7FMt4jW8LDzsSx9u04F2qrjuokKrbdZEgB+1ihGT8
	z+hc/jMg==;
Received: from [83.68.141.146] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1sqXws-00FSG2-NZ; Tue, 17 Sep 2024 14:08:54 +0100
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1sqXws-000000004rP-0VIV;
	Tue, 17 Sep 2024 14:08:54 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 1/3] riscv: ptrace: add regs_set_register()
Date: Tue, 17 Sep 2024 14:08:51 +0100
Message-Id: <20240917130853.18657-2-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20240917130853.18657-1-ben.dooks@codethink.co.uk>
References: <20240917130853.18657-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_063307_230200_ACFEA780 
X-CRM114-Status: GOOD (  12.05  )
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
 arch/riscv/include/asm/ptrace.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index b5b0adcc85c1..66fc1795141d 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -143,6 +143,26 @@ static inline unsigned long regs_get_register(struct pt_regs *regs,
 	return *(unsigned long *)((unsigned long)regs + offset);
 }
 
+/**
+ * regs_set_register() - set register value from its offset
+ * @regs:	pt_regs from which register value is gotten
+ * @offset:	offset of the register.
+ * @to:		value to set register to
+ *
+ * regs_set_register sets the value @to to a register whose offset from @regs.
+ * The @offset is the offset of the register in struct pt_regs.
+ * If @offset is bigger than MAX_REG_OFFSET, this will ignore the write.
+ */
+static inline void regs_set_register(struct pt_regs *regs,
+				     unsigned int offset,
+				     unsigned long to)
+{
+	if (unlikely(offset > MAX_REG_OFFSET))
+		return;
+
+	*(unsigned long *)((unsigned long)regs + offset) = to;
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
