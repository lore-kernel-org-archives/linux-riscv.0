Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9E8C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Apr 2022 07:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+fvAqfT2+s0Yri++G5Lgq4qUb4cGQmms2UDLEkmjU4=; b=udBgojUkXZsfrQ
	ZwiFYb0/qwpXCh3YbkIpoej1yqdZNvo0oGid3fB2PplsjEe59VQDN8K5oSIDWkd3iZoVpq5YG8mc9
	9hwqsjMZ2nfzoU9r9ATzaMk51p9s91gv5qKZyF4y2gg+QIctWyvbvpoCU9LYuU9TaYR7zuU8MQfTm
	4HiB4pdP5ykvTfnUcWghIStLVhnAIdowjM505ZYDW3kfzyv/uZCOQYWPSzC9OmNflexph8JmhYjlh
	/r19WlehBwFjM078cqzdQhdXOAiwbhvS4B8guVVTS52zz9gRtFl+TeFOy8iP1weNATpoVRmAi3W4u
	/kKYz4wz6eopBT4wNsQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncMgw-00A1VT-Lz; Thu, 07 Apr 2022 07:36:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncMf4-00A0TG-Mi; Thu, 07 Apr 2022 07:34:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F6EF61E14;
 Thu,  7 Apr 2022 07:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1673CC385A4;
 Thu,  7 Apr 2022 07:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649316873;
 bh=1ucMhnW8irziJNfuECEH3MHXjDK0nSaVyUwaETtw+gM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KelGW/uTUVx5N9Sv2N8w8R9JRf21b8/HoKoyaUYPNOJgWfIKzQiF7OA1rp6QJv+BJ
 ytq/FiqmKFGSs0Sfa/N6mEuTZZcNJZCxF2cXvcwjhXcqSOTZQOSw+U0ZP4WPx9hrTG
 Igt3l6DJxAD6TkFv//g0cb7uzlxGM9LBCU/dDhX1u+m2/qq5O7bjJE8Kir697/BF/C
 gPykEqhRL5iAJtMqzxMZC1C51u9klzBs0AiIiqvKs+dxQdsK35GL29VVfT3QNbarg4
 8fcYqEARmNuNjvOoZkd1vpBFpU1v2Bx7dFPjVeYLo38goAcOYyknOr6/WuWAhMceSM
 MC/wBEJ5daT5A==
From: guoren@kernel.org
To: guoren@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 stable@vger.kernel.org
Subject: [PATCH V4 4/4] csky: patch_text: Fixup last cpu should be master
Date: Thu,  7 Apr 2022 15:33:23 +0800
Message-Id: <20220407073323.743224-5-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407073323.743224-1-guoren@kernel.org>
References: <20220407073323.743224-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_003434_813156_221FC5FD 
X-CRM114-Status: GOOD (  13.38  )
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

From: Guo Ren <guoren@linux.alibaba.com>

These patch_text implementations are using stop_machine_cpuslocked
infrastructure with atomic cpu_count. The original idea: When the
master CPU patch_text, the others should wait for it. But current
implementation is using the first CPU as master, which couldn't
guarantee the remaining CPUs are waiting. This patch changes the
last CPU as the master to solve the potential risk.

Fixes: 33e53ae1ce41 ("csky: Add kprobes supported")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
Cc: <stable@vger.kernel.org>
---
 arch/csky/kernel/probes/kprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/csky/kernel/probes/kprobes.c b/arch/csky/kernel/probes/kprobes.c
index 42920f25e73c..34ba684d5962 100644
--- a/arch/csky/kernel/probes/kprobes.c
+++ b/arch/csky/kernel/probes/kprobes.c
@@ -30,7 +30,7 @@ static int __kprobes patch_text_cb(void *priv)
 	struct csky_insn_patch *param = priv;
 	unsigned int addr = (unsigned int)param->addr;
 
-	if (atomic_inc_return(&param->cpu_count) == 1) {
+	if (atomic_inc_return(&param->cpu_count) == num_online_cpus()) {
 		*(u16 *) addr = cpu_to_le16(param->opcode);
 		dcache_wb_range(addr, addr + 2);
 		atomic_inc(&param->cpu_count);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
