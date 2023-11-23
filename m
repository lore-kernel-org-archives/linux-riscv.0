Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DB3C61DF7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 14:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LLmBNbt/OJFiY9MrPhGdGu3cjK5wM+a9Vyneb6WeSfQ=; b=FYozwWTVKBP96k
	w9jP60qUJ07srDL1Tj4SbOonUxx5kZ2keT2XYYWTJV2G71AwzzTRcGxBp0oyevYSbUCjMQNukDHl8
	QTyrnQNWIll667+IPpBJ66tWRSVZY/Aqoyj0cMRjtVrVrYTOmIQlGgIPouzuKZmUkW4C6l4VAhUti
	B6ROX1QGhBsMWvcYh7e0C2SSz0J/iP4yEU1tcxBys2mpmBRHzNh4hZUDftqrNKDrjJBt7jJ767jRE
	yuPlG257jFiDL7RwXU41fskN7efUaXx2xYJrpYJPX3q+cZPkBmjLvueMnGyly1M/ufiRewKjdmhBT
	XTT8WuIpKNY71xrFOs4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6AVE-004zes-2K;
	Thu, 23 Nov 2023 14:16:24 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6AVC-004zde-17
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 14:16:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=X7MbYzx1WwZG7kkxbSNQXQ8lOJbHZOY6MUwMS7TQckk=; b=dakTzhCwvs3zfH7PwWIyFa1pj3
	E0HXSUwXYGbz/8cvZX4f5ddzd61vyujZx03qE9vBtiKdolKmf8rNBeEx/z5pqhJcBD5zeYraE1/ez
	0/hUkgBSpwf4Nqgi9Uvg0275RC8gwTbfNJs+aZiHBg9I8lbwuN0hPVVwWuG9sW0VaRi0/OVLmFDVV
	G+/5VY/X2QoiejsrIw+xq3SLg3qqWS5sMHKZ3PwvME0vZHNO9FPJbZOPxWZGARqYS4FqQJq34uh5V
	v2WXsMhO5F78Wbit5thqXBaDf8awJNyrihM69zTmQFAbSALFOfCLq8Uly09zTY2YWhFHodSVUMXrj
	Z+uMCRUA==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1r6AV8-004Tcz-6d; Thu, 23 Nov 2023 14:16:19 +0000
Received: from ben by rainbowdash with local (Exim 4.97)
	(envelope-from <ben@rainbowdash>)
	id 1r6AV8-000000015XA-3BGH;
	Thu, 23 Nov 2023 14:16:18 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] riscv: fix __user annotation in traps_misaligned.c
Date: Thu, 23 Nov 2023 14:16:17 +0000
Message-Id: <20231123141617.259591-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_061622_472031_87456E65 
X-CRM114-Status: GOOD (  12.58  )
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

The instruction reading code can read from either user or kernel addresses
and thus the use of __user on pointers to instructions depends on which
context. Fix a few sparse warnings by using __user for user-accesses and
remove it when not.

Fixes:

arch/riscv/kernel/traps_misaligned.c:361:21: warning: dereference of noderef expression
arch/riscv/kernel/traps_misaligned.c:373:21: warning: dereference of noderef expression
arch/riscv/kernel/traps_misaligned.c:381:21: warning: dereference of noderef expression
arch/riscv/kernel/traps_misaligned.c:322:24: warning: incorrect type in initializer (different address spaces)
arch/riscv/kernel/traps_misaligned.c:322:24:    expected unsigned char const [noderef] __user *__gu_ptr
arch/riscv/kernel/traps_misaligned.c:322:24:    got unsigned char const [usertype] *addr
arch/riscv/kernel/traps_misaligned.c:361:21: warning: dereference of noderef expression
arch/riscv/kernel/traps_misaligned.c:373:21: warning: dereference of noderef expression
arch/riscv/kernel/traps_misaligned.c:381:21: warning: dereference of noderef expression
arch/riscv/kernel/traps_misaligned.c:332:24: warning: incorrect type in initializer (different address spaces)
arch/riscv/kernel/traps_misaligned.c:332:24:    expected unsigned char [noderef] __user *__gu_ptr
arch/riscv/kernel/traps_misaligned.c:332:24:    got unsigned char [usertype] *addr

Fixes: 7c83232161f60 ("riscv: add support for misaligned trap handling in S-mode")
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/kernel/traps_misaligned.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 5eba37147caa..446e3d4eeea9 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -319,7 +319,7 @@ static inline int get_insn(struct pt_regs *regs, ulong mepc, ulong *r_insn)
 static inline int load_u8(struct pt_regs *regs, const u8 *addr, u8 *r_val)
 {
 	if (user_mode(regs)) {
-		return __get_user(*r_val, addr);
+		return __get_user(*r_val, (u8 __user *)addr);
 	} else {
 		*r_val = *addr;
 		return 0;
@@ -329,7 +329,7 @@ static inline int load_u8(struct pt_regs *regs, const u8 *addr, u8 *r_val)
 static inline int store_u8(struct pt_regs *regs, u8 *addr, u8 val)
 {
 	if (user_mode(regs)) {
-		return __put_user(val, addr);
+		return __put_user(val, (u8 __user *)addr);
 	} else {
 		*addr = val;
 		return 0;
@@ -343,7 +343,7 @@ static inline int store_u8(struct pt_regs *regs, u8 *addr, u8 val)
 	if (user_mode(regs)) {				\
 		__ret = __get_user(insn, insn_addr);	\
 	} else {					\
-		insn = *insn_addr;			\
+		insn = *(__force u16 *)insn_addr;	\
 		__ret = 0;				\
 	}						\
 							\
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
