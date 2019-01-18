Return-Path: <SRS0=fYNd=P2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC10C43612
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 14:04:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8604A20652
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 14:04:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bPAd7yA1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8604A20652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdBB0PaxdsdCVtFA8m7oWNL/vtcDrHhbQTvnQZHoQHA=; b=bPAd7yA1zEqRCS
	BYlNOjjcB7R6Ph52kPx/xaQBE5hMged5pE8oTShqkMn0eOLE2j+297mE/9dEZOtV5P8Qd2ZceewCB
	6FTXVZ9tUXsm+mueqgfk5bDu2VkD4g3icZS7B+REnBcB56Lb2f7KbcjA/q5EIgiZj6ZBG8Qgjy64F
	raBwUW0Z7QNX9WBbER3OewjpCBsBUKjZD8sC6GSu7QuM/fP76XUU+Sb5k5IQQMnHKc7vnqnLNzzuK
	wg1N9ud2Izlp4HyxcuafxIFw1SMeTb3frN2Nkfaoaeoz0Fy7P+DRKbEkUQcsO/c1TfSZMPpiGDPP1
	EeYQR23oRIO4wbgdLUNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkUlP-0004pz-Li; Fri, 18 Jan 2019 14:04:51 +0000
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkUlF-0004eB-KC
 for linux-riscv@lists.infradead.org; Fri, 18 Jan 2019 14:04:44 +0000
Received: by mail-lf1-f68.google.com with SMTP id y14so10548125lfg.13
 for <linux-riscv@lists.infradead.org>; Fri, 18 Jan 2019 06:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gUE4wXX4TJVPhb5KX9MWt1+d3yl5yS/n/x3TIPSxP/o=;
 b=mwjRAVxyCt6ZiIXVTWfB4hipEHoR+Ybm6GLiirRf2KiFiSyW2tb01+1lb2mqF6S7Ra
 /7/WbhS+Y0XdFMhCuxrhyv+BTkUZL8n7pCwuKrYNTEf/MVJOBI2j+y6DYzOxdxLO3jdC
 ByVcdXVV/NHC2k+N4+INOqmSbYa6mUynTCEOZWnqw0cHiQK9rczpvIUrn8x+L+Y8rut+
 rfEITbafBqwoUkQ8yiNQV6Vqg9kbySWuO6Yz2hhSDtRdOQBh5Q2vtO19ragQUekKjzmc
 Dffc1WgNN1knCIn47evZqR+LTmWC94mKeHV4PPf8sKJ4kF81nVy+rveTQJmF/Dvo7RJm
 tR2Q==
X-Gm-Message-State: AJcUukcVj/VZjD1gBvSD7BkHKRe6GdfA3r3DEjgR6fN7tkpjPcvVh80T
 kH8cuu+JBt5/YpCFfgfs2CA=
X-Google-Smtp-Source: ALg8bN6AvZBFYlhhXRJh6nq08nZfOMzdrlybPlCgKOHtBUEXc9NUoFatW3gzf/Vj9C/jPlTyK6lTdg==
X-Received: by 2002:ac2:53bc:: with SMTP id j28mr13296649lfh.86.1547820276569; 
 Fri, 18 Jan 2019 06:04:36 -0800 (PST)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.190.116])
 by smtp.gmail.com with ESMTPSA id q67sm831214lfe.19.2019.01.18.06.04.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jan 2019 06:04:35 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.91)
 (envelope-from <johan@xi.terra>)
 id 1gkUlB-0002Vq-60; Fri, 18 Jan 2019 15:04:37 +0100
From: Johan Hovold <johan@kernel.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 1/5] riscv: add missing newlines to printk messages
Date: Fri, 18 Jan 2019 15:03:04 +0100
Message-Id: <20190118140308.9599-2-johan@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190118140308.9599-1-johan@kernel.org>
References: <20190118140308.9599-1-johan@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_060441_658464_18B1CEC4 
X-CRM114-Status: GOOD (  12.52  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add missing newline characters to printk messages.

Also replace two pr_warning with the shorter pr_warn, and fix up the
tense of one error message while at it.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 arch/riscv/kernel/cpu.c        | 2 +-
 arch/riscv/kernel/cpufeature.c | 8 ++++----
 arch/riscv/kernel/ftrace.c     | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index f8fa2c63aa89..11ba67f010e7 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -106,7 +106,7 @@ static void print_isa(struct seq_file *f, const char *orig_isa)
 	 * a bit of info describing what went wrong.
 	 */
 	if (isa[0] != '\0')
-		pr_info("unsupported ISA \"%s\" in device tree", orig_isa);
+		pr_info("unsupported ISA \"%s\" in device tree\n", orig_isa);
 }
 
 static void print_mmu(struct seq_file *f, const char *mmu_type)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index a6e369edbbd7..4891fd62b95e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -50,12 +50,12 @@ void riscv_fill_hwcap(void)
 		if (riscv_of_processor_hartid(node) >= 0)
 			break;
 	if (!node) {
-		pr_warning("Unable to find \"cpu\" devicetree entry");
+		pr_warn("Unable to find \"cpu\" devicetree entry\n");
 		return;
 	}
 
 	if (of_property_read_string(node, "riscv,isa", &isa)) {
-		pr_warning("Unable to find \"riscv,isa\" devicetree entry");
+		pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
 		of_node_put(node);
 		return;
 	}
@@ -67,11 +67,11 @@ void riscv_fill_hwcap(void)
 	/* We don't support systems with F but without D, so mask those out
 	 * here. */
 	if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
-		pr_info("This kernel does not support systems with F but not D");
+		pr_info("This kernel does not support systems with F but not D\n");
 		elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
 	}
 
-	pr_info("elf_hwcap is 0x%lx", elf_hwcap);
+	pr_info("elf_hwcap is 0x%lx\n", elf_hwcap);
 
 #ifdef CONFIG_FPU
 	if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index a840b7d074f7..b94d8db5ddcc 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -32,7 +32,7 @@ static int ftrace_check_current_call(unsigned long hook_pos,
 	 * return must be -EINVAL on failed comparison
 	 */
 	if (memcmp(expected, replaced, sizeof(replaced))) {
-		pr_err("%p: expected (%08x %08x) but get (%08x %08x)",
+		pr_err("%p: expected (%08x %08x) but got (%08x %08x)\n",
 		       (void *)hook_pos, expected[0], expected[1], replaced[0],
 		       replaced[1]);
 		return -EINVAL;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
