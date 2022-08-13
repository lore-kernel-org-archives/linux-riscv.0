Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FF6C00140
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Aug 2022 03:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xdn+fYEB1+5ueHL1MBRRb0B86s6h0QTUYFhfhzG6bIo=; b=pcFdnt0yqC67ak
	NgP+XkOMXv6GPhXPFmRT+Qm+4vJm/92t99up/Cs3BDRsQF0mmShgW5aX1N8f5RmODhMm5bSCJKPqX
	xNuMtKjdS+wleny6sXAqscKZTMtGzxkWaqfGHYGL4I+5hiM8K4qQ6rlXSMgFSaArKNxx4iaV2LmA6
	+uPeHizxeseN/2eE4KO+JSWsK+1PEj5Effd/cBDvwaaNgdgMAqbD78d0J5IQbeqCy9sdokLESC9/L
	EORSYDPpkSqEKigdnYgMcrsOYSF2Y7RLS2Fu6g1STiJF0ejScItxTlCAb0x1vtFepQpyhH3urb1LR
	xI/9CVSucNlPCkxhQD+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMhfb-003wlS-3X; Sat, 13 Aug 2022 03:18:39 +0000
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMhf7-003w6e-AV; Sat, 13 Aug 2022 03:18:11 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R251e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0VM4jZl8_1660360684;
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VM4jZl8_1660360684)
          by smtp.aliyun-inc.com;
          Sat, 13 Aug 2022 11:18:05 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: crash-utility@redhat.com,
	mick@ics.forth.gr,
	heinrich.schuchardt@canonical.com,
	guoren@kernel.org,
	k-hagio-ab@nec.com,
	yixun.lan@gmail.com,
	lijiang@redhat.com
Cc: linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org,
	hschauhan@nulltrace.org,
	huanyi.xj@alibaba-inc.com,
	lifang_xia@linux.alibaba.com,
	Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [Crash-utility][PATCH V3 9/9] RISCV64: Add the implementation of symbol verify
Date: Sat, 13 Aug 2022 11:17:53 +0800
Message-Id: <20220813031753.3097720-10-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220813031753.3097720-1-xianting.tian@linux.alibaba.com>
References: <20220813031753.3097720-1-xianting.tian@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_201809_613025_066D32CA 
X-CRM114-Status: UNSURE (   7.22  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Verify the symbol to accept or reject a symbol from the kernel namelist.

Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
---
 riscv64.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/riscv64.c b/riscv64.c
index 0e5c9c6..cbb57f2 100644
--- a/riscv64.c
+++ b/riscv64.c
@@ -165,10 +165,23 @@ riscv64_cmd_mach(void)
 	riscv64_display_machine_stats();
 }
 
+/*
+ * Accept or reject a symbol from the kernel namelist.
+ */
 static int
 riscv64_verify_symbol(const char *name, ulong value, char type)
 {
-	/* TODO: */
+	if (CRASHDEBUG(8) && name && strlen(name))
+		fprintf(fp, "%08lx %s\n", value, name);
+
+	if (!(machdep->flags & KSYMS_START)) {
+		if (STREQ(name, "_text") || STREQ(name, "_stext"))
+			machdep->flags |= KSYMS_START;
+
+		return (name && strlen(name) && !STRNEQ(name, "__func__.") &&
+			!STRNEQ(name, "__crc_"));
+	}
+
 	return TRUE;
 }
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
