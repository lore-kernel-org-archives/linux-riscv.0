Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB815CCD195
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Oct 2025 15:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FUfDmzefhEhJd8Qw0kiWpPTmXUhO95WjkSFnDT3O2qM=; b=328tTNtC92KvzB
	ktAznMFbRj/lXrlLReGL4KDMXGA/GNPvnD0gTBK1L2SvrKxrHTNQ6CEo4CqdVFaxeBjFWP0EPC4U+
	Iy303JnSKS/sN46uVch1s7cww3OP8Dup/4vA7jPFQyfUB8ULASwrYq+RZ5xYRiTdVoCPIKcWFIlHh
	IW9rOSHynCj+c0g/4MzniEat89NqbAcppBt0BMqCkJoDQgk2PA4sW9fNQ/qHEYXZHxaK9y8F5TL+J
	n49JdjUuNugIyowZRV3YnR5CiRSyCcaKCYbTMd24Ktu0ahck/FNhdaRuuXr95Qeto8WMzM7MM7Uag
	h9ciih9NJ87L6yqbT6yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA8up-0000000A5Nc-0aSY;
	Sat, 18 Oct 2025 15:32:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA8uo-0000000A5NR-230o
	for linux-riscv@lists.infradead.org;
	Sat, 18 Oct 2025 15:32:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51DB361127;
	Sat, 18 Oct 2025 15:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5AFC116C6;
	Sat, 18 Oct 2025 15:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760801536;
	bh=9672cgfaFWFjA9Pp1F1cX3P694dbW7annGqIuGStn7w=;
	h=Date:From:To:cc:Subject:From;
	b=JjXHJuV7bDQm1g2NZJu5SPy67wjq0yoyhhAsh5WsI03yosFRCwPnd2g1T2jaP4QzC
	 C0kPxq6k43B/YlM2O0bmjlAV8ZOl/aOzuc+/cCSZt11kJaNVs3Hb4Gp2pjSYDT5cRf
	 8p3ygUMwqT3XidptmSSdaVFkwo2Kppzxx4jTxzqh7dwnmq1Rr78Lh7ONAYrQwbdqDl
	 +MeS5E/PWmFJkkawMpp3+XI+psWKcFQuxDZmGCfRQdWzphkxKm+6CpT9O5quwsCwKP
	 qLpJGGalpOwFRkZAH/YpQNnbr47vccOU+o+/ifZRYEar3R48BTZc7PgR33XhmII8XE
	 xHUjACw0SmbHw==
Date: Sat, 18 Oct 2025 09:32:12 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org
cc: Evan Green <evan@rivosinc.com>
Subject: [PATCH] riscv: hwprobe: avoid uninitialized variable use in
 hwprobe_arch_id()
Message-ID: <cf5a13ec-19d0-9862-059b-943f36107bf3@kernel.org>
MIME-Version: 1.0
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

Resolve this smatch warning:

  arch/riscv/kernel/sys_hwprobe.c:50 hwprobe_arch_id() error: uninitialized symbol 'cpu_id'.

This could happen if hwprobe_arch_id() was called with a key ID of
something other than MVENDORID, MIMPID, and MARCHID.  This does not
happen in the current codebase.  The only caller of hwprobe_arch_id()
is a function that only passes one of those three key IDs.

For the sake of reducing static analyzer warning noise, and in the
unlikely event that hwprobe_arch_id() is someday called with some
other key ID, validate hwprobe_arch_id()'s input to ensure that
'cpu_id' is always initialized before use.

Fixes: ea3de9ce8aa280 ("RISC-V: Add a syscall for HW probing")
Cc: Evan Green <evan@rivosinc.com>
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/kernel/sys_hwprobe.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index bc87bb9725fd..199d13f86f31 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -31,6 +31,11 @@ static void hwprobe_arch_id(struct riscv_hwprobe *pair,
 	bool first = true;
 	int cpu;
 
+	if (pair->key != RISCV_HWPROBE_KEY_MVENDORID &&
+	    pair->key != RISCV_HWPROBE_KEY_MIMPID &&
+	    pair->key != RISCV_HWPROBE_KEY_MARCHID)
+		goto out;
+
 	for_each_cpu(cpu, cpus) {
 		u64 cpu_id;
 
@@ -61,6 +66,7 @@ static void hwprobe_arch_id(struct riscv_hwprobe *pair,
 		}
 	}
 
+out:
 	pair->value = id;
 }
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
