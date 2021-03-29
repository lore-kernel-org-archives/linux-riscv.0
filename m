Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EA6C433C1
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 23:59:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F97D6191B
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 23:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F97D6191B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TT7zFRYWgS0cIlVJbK3liREsg4NoktpgtYQniCHl3m4=; b=RDMmSLY5o/I+rbwk7IRCzEcvl6
	Izgo0WoIe895Mt1P+EHeeGNsV62bZb/8lsKmwOSdaP2LS+G2DFFXw6bbYCMOLtKGfF4R4ltPYeccZ
	GS1pEfycVnLkFXSELXpr/gkS1CGG12ZiP33psx34VZkYfjzMyZMVO+GOfMEHhQmO5lY3tDXtIIOjK
	0aHHenXc+RIrm0cx/wnT9x+JUcvWPiB1bPJlXjjQV5jAXZQnCnQk253KhV6zx9p68JM6AmPhSgAn1
	7xew2Xl+iVAoYn3QPwTlbmNrx7stNlw5TN0wUKPsLg9GXMmxTVLP7flSA2/5EVx1sRRw3LnWMmf9R
	cmll3JAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR1mp-0025El-GA; Mon, 29 Mar 2021 23:59:11 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lQwSA-00114P-33
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 18:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=8AEiwnSsasg6gLp5dzgvHy4Ekf+YglgM5SFsq1PHSp4=; b=MytSx5WYdNAIS
 raZizWn3fBGBzqGuCU8LEm7rANsdZA2U6+ZjrFVx2zVFowB/SvEox+M+j1hZiKR7
 0PzbYC571M5H54l4M+t8RZ4v2YbIlnEAtGwZnvEBKPnESue73FYaTt6dEfPgNvCh
 lVZ5EqqDukM+TZq7JTqjSzWVvQNcHQ=
Received: from xhacker (unknown [101.86.19.180])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygAnLkqxGWJgMuZpAA--.42274S2; 
 Tue, 30 Mar 2021 02:17:22 +0800 (CST)
Date: Tue, 30 Mar 2021 02:12:26 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Masami Hiramatsu
 <mhiramat@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: add do_page_fault and do_trap_break into the kprobes
 blacklist
Message-ID: <20210330021226.2fc7b2ec@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygAnLkqxGWJgMuZpAA--.42274S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFyxKw47Gw4UXFy7JFW7XFb_yoWDKrg_C3
 Z2k3yfWrWrJa109F97tws3GF40y3sYkF93G3ZFvrWrCFyYgr18Kw45ta15tr1DX34fua97
 Zr9xXr93G3WIqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbFxYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
 6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
 I_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
 6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj4
 0_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
 Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j1VbkUUUUU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_191730_925450_91C4579C 
X-CRM114-Status: UNSURE (   7.78  )
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

From: Jisheng Zhang <jszhang@kernel.org>

These two functions are used to implement the kprobes feature so they
can't be kprobed.

Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/traps.c | 1 +
 arch/riscv/mm/fault.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 0879b5df11b9..1357abf79570 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -178,6 +178,7 @@ asmlinkage __visible void do_trap_break(struct pt_regs *regs)
 	else
 		die(regs, "Kernel BUG");
 }
+NOKPROBE_SYMBOL(do_trap_break);
 
 #ifdef CONFIG_GENERIC_BUG
 int is_valid_bugaddr(unsigned long pc)
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 8f17519208c7..c5dbd55cbf7c 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -328,3 +328,4 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	}
 	return;
 }
+NOKPROBE_SYMBOL(do_page_fault);
-- 
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
