Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4EBC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 02:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oyXsHUMyZ4ne63CUqUIBlxmsnVNnSzgYPrT2FDhwjWU=; b=r14TDj3kz5sSz8
	ftEgSmh4J+EupaGzteg1mehl80SmRNnwcblz0riv+D77r6ETxjgzHywX+FL8A0A5KfylGblQb0+nB
	qUdhE5+IDK5oTnSJ+tdFVVMx4/W3nw5mA3Qc4G4qxx8mO8BYVU4nwclx6ye50XcPz5Z+Ul/3c2A1P
	ags7Ff5Cnb4LtTrUyZNi1LfVr37TAea2CdtQ7r5ViZWDxEM/Ef8+XNcEjmDYDXlvit7DxKOmXybRv
	11XFzvpfNGPf+NGwTSCr+thGk48KYTc6xDqpGVHjchrXYTJEK/KYXt0q0xfEP269Wnz14/HvHhN+s
	mbyGfXmfURp8qbmBdD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDGtj-00AHaA-CY; Mon, 18 Jul 2022 02:54:15 +0000
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDGtY-00AHRM-R1
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 02:54:06 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0VJbOXrs_1658112840;
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VJbOXrs_1658112840)
          by smtp.aliyun-inc.com;
          Mon, 18 Jul 2022 10:54:01 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: crash-utility@redhat.com,
	mick@ics.forth.gr,
	heinrich.schuchardt@canonical.com,
	guoren@kernel.org,
	k-hagio-ab@nec.com
Cc: linux-riscv@lists.infradead.org,
	hschauhan@nulltrace.org,
	huanyi.xj@alibaba-inc.com,
	Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [Crash-utility][PATCH 8/8] RISCV64: Add the implementation of symbol verify
Date: Mon, 18 Jul 2022 10:53:46 +0800
Message-Id: <20220718025346.411758-9-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220718025346.411758-1-xianting.tian@linux.alibaba.com>
References: <20220718025346.411758-1-xianting.tian@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_195405_077400_1E233A1D 
X-CRM114-Status: UNSURE (   7.71  )
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
 riscv64.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/riscv64.c b/riscv64.c
index cbf75cf..04064df 100644
--- a/riscv64.c
+++ b/riscv64.c
@@ -188,11 +188,20 @@ riscv64_cmd_mach(void)
 	riscv64_display_machine_stats();
 }
 
+/*
+ * Accept or reject a symbol from the kernel namelist.
+ */
 static int
 riscv64_verify_symbol(const char *name, ulong value, char type)
 {
-	/* TODO: */
-	return TRUE;
+	if (CRASHDEBUG(8) && name && strlen(name))
+		fprintf(fp, "%08lx %s\n", value, name);
+
+	if (STREQ(name, "_text") || STREQ(name, "_stext"))
+		machdep->flags |= KSYMS_START;
+
+	return (name && strlen(name) && (machdep->flags & KSYMS_START) &&
+		!STRNEQ(name, "__func__.") && !STRNEQ(name, "__crc_"));
 }
 
 void
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
