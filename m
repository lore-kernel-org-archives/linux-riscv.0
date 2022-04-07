Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F277C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Apr 2022 07:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAqh7CJa1BaxB8E4MTiz2FUMaImJFAdUNEAs7T8I7eE=; b=eiYvxu4LUECXE6
	JfywIyneeIF49A4My7wrq/hxKCESeEVk/Hwxb0NqQxXZmuJJpBC8gj0Oxoo/e2ucGmNjBRd/MAi8t
	tfLayrAe4UFSTnF30PiA6D5XFsfubA+nRSZsm9fAOQoqT90eZ0rvpV+SezUw78RxBNt3xBDxrMpZb
	Hx+1epdf2elf7jhKzCkMUBgjDSXOTbEP3/a3xT52+UdXGL0DPu8bl3NhPLjgJjkpAkjbXr2bWu9WX
	hVaQL8s6ondEL/JDawOL6sH5RcYlbliJqFzMqYXpL3yYKQ4WQg1GFaRuNhQ2ibhu6JHm57gP5cf+4
	SQ6+Wi10GkJgWXqxUdYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncMfT-00A0gH-Kv; Thu, 07 Apr 2022 07:34:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncMed-00A0HG-HL; Thu, 07 Apr 2022 07:34:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6DAD61E07;
 Thu,  7 Apr 2022 07:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393E2C385A9;
 Thu,  7 Apr 2022 07:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649316845;
 bh=Lq9EhyRijx1cfe4dEDp+AdieXvyyIhRaAjpvB7W8v1s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hMVhkWDgaKW7xR+gIWxFoU2fJjcz2m9cvJ8rHJeSJCXIE8aZFvMrAW/BStymn+T2e
 0rQr1eouZWS72DT7IKe+1k5LDSIb14lGiB+icEK/brzv4tOvm8icRFHRL95VcKxtUL
 WKlxZBpH7tUCydPdcBBWDN6RxszZJ113iYYEws+rF9PPybUOBUyLvUzANlkMGkcX6J
 V+sqIB/OYIjO02NwbgMFGYlRo3P75PgRvJOHwQGjrpv/mhYTLklZFHQlBWW93nWPqX
 2nkdfKPS73HXnFtJXT6u/bToYSDyfA66rkbKPTRPvu2a9yU44xYRjRQmhcb0/elX+b
 bV5un3MkOIEFw==
From: guoren@kernel.org
To: guoren@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 stable@vger.kernel.org
Subject: [PATCH V4 2/4] riscv: patch_text: Fixup last cpu should be master
Date: Thu,  7 Apr 2022 15:33:21 +0800
Message-Id: <20220407073323.743224-3-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407073323.743224-1-guoren@kernel.org>
References: <20220407073323.743224-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_003407_676609_0C242641 
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

Fixes: 043cb41a85de ("riscv: introduce interfaces to patch kernel code")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
Cc: <stable@vger.kernel.org>
---
 arch/riscv/kernel/patch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 0b552873a577..765004b60513 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -104,7 +104,7 @@ static int patch_text_cb(void *data)
 	struct patch_insn *patch = data;
 	int ret = 0;
 
-	if (atomic_inc_return(&patch->cpu_count) == 1) {
+	if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
 		ret =
 		    patch_text_nosync(patch->addr, &patch->insn,
 					    GET_INSN_LENGTH(patch->insn));
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
