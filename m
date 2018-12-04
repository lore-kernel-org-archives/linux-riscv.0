Return-Path: <SRS0=2eJe=ON=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8766FC04EBF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Dec 2018 14:11:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 565082081B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Dec 2018 14:11:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lDrkq8//";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="ayXCV5tX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 565082081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ox7AzoJpa1JHWHJdsKeyYPsoVZivd8oLAscW5Yu+5c0=; b=lDrkq8//4hskcmKA+UHO3dje7O
	aB3fkcaUZ+gLIcrz+gDbPijjQVqHHyJpQ62B+8sRtLvuT2/8hax++s0Qk2mZwjsmfk30EMlDA4dJr
	ZqFu5soFoWOfTqLuvZ9gNvNKDA4DkuN+x3dHek+Bg/yLLAABx25eRyhCxddmOsxUD8ndp91V/Ibze
	hhU6RlUG06PlcR93+bdlCuXCbFeYxJP8YdsICK8Oiq5vC4Pm5PCNwzBlr59UCJGiGbMnE0RB4XSgv
	n86xpACP3mM4hab1pHNBVwbXV76wAhzb5La1emjBgfA6wwqmH0WAWkrbYRMnCm3av5a0UXVEK49HU
	TKLe7Fqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUBQF-00076B-Ch; Tue, 04 Dec 2018 14:11:35 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUBQC-00074j-CH
 for linux-riscv@lists.infradead.org; Tue, 04 Dec 2018 14:11:33 +0000
Received: by mail-pg1-x541.google.com with SMTP id n2so7435052pgm.3
 for <linux-riscv@lists.infradead.org>; Tue, 04 Dec 2018 06:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JjE3m3KhoW/fupLlyitIScJqRKLQdmncQOfWLq2YHj4=;
 b=ayXCV5tXDBvefnE96niiHdR1lxYBaQDf/OrEr6JpIHqyUIcgHz5rwM5VBe5W+Q30aw
 pNA5lzvZNDJnqOyz/XFSRdDbmsr4rfCajEGmZNNfUB54sUfcd3+HqGvFlmazQLbDcSKx
 GgWKvD7lrGXYCFsFPeJFtaF8nGrbSG9pes/pGxJjRisFIBDZNp6QxJfJVoP/d+KsvYJA
 QTPbfCRrnadMdcOgaZnlNWWJtB0bbbF6mzUuh0E1V9XuZIAJtrrEkeiiHdbwnjSzpn4/
 cRtYiHgzNdZFjt0lHdFyWuGcC8FVw7Ilr3vwewmCp4RhaJbw/GXlPlzthQDkdomd+7VF
 l5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JjE3m3KhoW/fupLlyitIScJqRKLQdmncQOfWLq2YHj4=;
 b=jiTBbSUZXVHxGuNjtXfJCEep/gMdJYzp4Kxcx65PDKvtzC3EUpHGhYJ21rqPyD4RQu
 k29Wlz5Y3JZbMGd1qrvqst4yQLwE2zSRWEWFT+OCF01qIFM6H4iqNxPcbTbaHRdz2xx9
 VMaCBmm6mhPzT8r7d6hR4xBnDGaWlbigWtxzv0y0kJ1RJaXT6s3GYA++JqbTWFjlsZNO
 AY8LQkFg2/zWyevDX5z7F2q/ZTT8HBqF403BwLgzSJ4ZGjWjZ3ODhxOp1wBhjTXtYHk/
 zKdgyHhejk4jfeQI3xF3Ef5ZJp6MUZwfml+rfpHNBfSgNQQ0wOUt3poS8uJuH79UtXje
 WkJA==
X-Gm-Message-State: AA+aEWbvxYPog0TWJ4HhdFeoFyDUtLVjMkVRQFe/r3RGScKw6HCvMxuG
 J3Tbn+ZuXxfaz/qAoSsROpZ83A==
X-Google-Smtp-Source: AFSGD/WFzf2OlR+iBlm92g06JcgbMovmeH6PyBxCULu5iF8ycg+wb//PssBQCzrDSC4V7y7QtGsM4g==
X-Received: by 2002:a63:4706:: with SMTP id u6mr15986664pga.95.1543932687281; 
 Tue, 04 Dec 2018 06:11:27 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([49.207.53.58])
 by smtp.googlemail.com with ESMTPSA id
 k129sm31298884pgk.29.2018.12.04.06.11.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Dec 2018 06:11:26 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 3/3] RISC-V: Remove EARLY_PRINTK support
Date: Tue,  4 Dec 2018 19:25:07 +0530
Message-Id: <20181204135507.3706-4-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181204135507.3706-1-anup@brainfault.org>
References: <20181204135507.3706-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_061132_417863_A5D1AC60 
X-CRM114-Status: GOOD (  11.72  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, linux-serial@vger.kernel.org,
 linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The EARLY_PRINTK using SBI console calls is not required
any more because we now have RISC-V SBI support in generic
earlycon framework.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/Kconfig.debug  |  2 --
 arch/riscv/kernel/setup.c | 28 ----------------------------
 2 files changed, 30 deletions(-)

diff --git a/arch/riscv/Kconfig.debug b/arch/riscv/Kconfig.debug
index c5a72f17c469..e69de29bb2d1 100644
--- a/arch/riscv/Kconfig.debug
+++ b/arch/riscv/Kconfig.debug
@@ -1,2 +0,0 @@
-config EARLY_PRINTK
-	def_bool y
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 2c290e6aaa6e..fc8006a042eb 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -35,31 +35,9 @@
 #include <asm/sections.h>
 #include <asm/pgtable.h>
 #include <asm/smp.h>
-#include <asm/sbi.h>
 #include <asm/tlbflush.h>
 #include <asm/thread_info.h>
 
-#ifdef CONFIG_EARLY_PRINTK
-static void sbi_console_write(struct console *co, const char *buf,
-			      unsigned int n)
-{
-	int i;
-
-	for (i = 0; i < n; ++i) {
-		if (buf[i] == '\n')
-			sbi_console_putchar('\r');
-		sbi_console_putchar(buf[i]);
-	}
-}
-
-struct console riscv_sbi_early_console_dev __initdata = {
-	.name	= "early",
-	.write	= sbi_console_write,
-	.flags	= CON_PRINTBUFFER | CON_BOOT | CON_ANYTIME,
-	.index	= -1
-};
-#endif
-
 #ifdef CONFIG_DUMMY_CONSOLE
 struct screen_info screen_info = {
 	.orig_video_lines	= 30,
@@ -219,12 +197,6 @@ static void __init setup_bootmem(void)
 
 void __init setup_arch(char **cmdline_p)
 {
-#if defined(CONFIG_EARLY_PRINTK)
-       if (likely(early_console == NULL)) {
-               early_console = &riscv_sbi_early_console_dev;
-               register_console(early_console);
-       }
-#endif
 	*cmdline_p = boot_command_line;
 
 	parse_early_param();
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
