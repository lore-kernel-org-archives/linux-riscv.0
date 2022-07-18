Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54330C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 02:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uArLOWj5lUAXQtpn1MPWmtqZ03X3SpeSK2esVCSiG1o=; b=4TFSrU52RWPthq
	DXYnj+s+/zx1vzyCIm7Qb+bnTC9peVfajvqX2PxOJC8MOwN466Vb0KPuafQWqZq6XSrZ6oHdG+Szx
	Z3Z1IA65eP/reMRkaYOg653wh2qE9SEBOlw/jerx6UwaXwquhkMRLgJpevFhjUw9wVTrtvI7W6d1Z
	HI2h0RvMZoAT6tl+nuP4brWcewaaucfMtLj3A5ZT4Bn261jjIFQo7REjYtJ7QCYDVhyC8tB0tXRt+
	Bvb1F0CUuZ1cKK8PU6IwQGlRYrrW20atYEDC5ivOuEbVE/Q46kjpYsNT5MApIHInEqdjeD/mOZPlD
	Z5XHiH2j+fxdJ3THXN1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDGth-00AHYL-Bk; Mon, 18 Jul 2022 02:54:13 +0000
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDGtY-00AHPZ-2G
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 02:54:05 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0VJbOXrN_1658112839;
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VJbOXrN_1658112839)
          by smtp.aliyun-inc.com;
          Mon, 18 Jul 2022 10:54:00 +0800
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
Subject: [Crash-utility][PATCH 7/8] RISCV64: Add 'mach' command support
Date: Mon, 18 Jul 2022 10:53:45 +0800
Message-Id: <20220718025346.411758-8-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220718025346.411758-1-xianting.tian@linux.alibaba.com>
References: <20220718025346.411758-1-xianting.tian@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_195404_338492_080AF769 
X-CRM114-Status: UNSURE (   8.54  )
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

With the patch we can get some basic machine state information,
crash> mach
                MACHINE TYPE: riscv64
                 MEMORY SIZE: 1 GB
                        CPUS: 1
             PROCESSOR SPEED: (unknown)
                          HZ: 250
                   PAGE SIZE: 4096
           KERNEL STACK SIZE: 16384

Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
---
 riscv64.c | 45 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/riscv64.c b/riscv64.c
index 475dc98..cbf75cf 100644
--- a/riscv64.c
+++ b/riscv64.c
@@ -139,10 +139,53 @@ static int riscv64_get_struct_page_max_shift(struct machine_specific *ms)
 	return (int)ceil(log2(ms->struct_page_size));
 }
 
+/*
+ * "mach" command output.
+ */
+static void
+riscv64_display_machine_stats(void)
+{
+	struct new_utsname *uts;
+	char buf[BUFSIZE];
+	ulong mhz;
+
+	uts = &kt->utsname;
+
+	fprintf(fp, "		MACHINE TYPE: %s\n", uts->machine);
+	fprintf(fp, "		 MEMORY SIZE: %s\n", get_memory_size(buf));
+	fprintf(fp, "			CPUS: %d\n", get_cpus_to_display());
+	fprintf(fp, "	     PROCESSOR SPEED: ");
+	if ((mhz = machdep->processor_speed()))
+		fprintf(fp, "%ld Mhz\n", mhz);
+	else
+		fprintf(fp, "(unknown)\n");
+	fprintf(fp, "			  HZ: %d\n", machdep->hz);
+	fprintf(fp, "		   PAGE SIZE: %d\n", PAGESIZE());
+	fprintf(fp, "	   KERNEL STACK SIZE: %ld\n", STACKSIZE());
+}
+
 static void
 riscv64_cmd_mach(void)
 {
-	/* TODO: */
+	int c;
+
+	while ((c = getopt(argcnt, args, "cmo")) != EOF) {
+		switch (c) {
+		case 'c':
+		case 'm':
+		case 'o':
+			option_not_supported(c);
+			break;
+		default:
+			argerrs++;
+			break;
+		}
+	}
+
+	if (argerrs)
+		cmd_usage(pc->curcmd, SYNOPSIS);
+
+	riscv64_display_machine_stats();
 }
 
 static int
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
