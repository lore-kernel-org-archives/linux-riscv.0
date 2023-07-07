Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE09AEB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 15:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQdWcgf35PDu6aiBjxW26EPZuQnNQYEHyrKBcSJM9tE=; b=Q7XIWDj0zNEi08
	aYSRee8hqAMBI8ltD1LtI1BxmZkiQBxuHWj0zQlGm5QG10HqNdX6Csi71H5Cg+mm/fvOGcpcEU5OS
	NqaqzlcnSOQm9camYPtg2IOfgmzogWjEnUvZAmkRII3t8rsWDey5M0XPv5Yjd/+9jKj5b8zSkTJU2
	IP+FON/hNHK2SDnOTCgFCQW94tblVXxV1SdFzModDO3UvENFi2glxc931Xo8u10A+yjoMmPm8Uvza
	KCillx7ApTMMiaT/6nUwo7TyiQ76NVxoItVBAWB5p1bPUk5zyRr01T/5UBzf0inlbAE4gCHjSUTn1
	QJHs1CoWwcur+sl3aa6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmx0-004xRt-29;
	Fri, 07 Jul 2023 15:00:50 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmwe-004xKP-1J
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 15:00:31 +0000
X-QQ-mid: bizesmtp66t1688742007tg949pqx
Received: from linux-lab-host.localdomain ( [116.30.131.119])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Jul 2023 23:00:06 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: F7g8sXqc8jKUXva1LOQuC3l6Huh4naBPWG4uwtnPE08/V+nzmxJAVIlC+NW4t
	GJBwcqaJMlH3AHBqAX6F0hXsEzGUuQj2+Q74Sxs9xvMGzhsPQ8eXADWbmJu7pt7Lky2X+Dn
	rwIOhzzB6DGVdZwiOfFl5lZJ08gjw668dZcOO+UMASsBHylhSt++/1YjHCR3vYaC3Dn2Tzb
	KDzd/Nd7hf6waMdwYz/zlrhe8E0wZckFp/hFTCcxBjqi0gereXhOL1hY0gYQCPPqH03bkBG
	Q2laSXI34883bzQwno94VwwwNoAaTo+M3fnMzBk7X4MVaLuXhsDJRMxTxE7tfjoMeI169XX
	608IzYYMbWNlzFPOQYTjr4y2sxvNcIizzGf64Ldy+qNDqeSumMrewESt2diJw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1688201172120877824
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v6 08/15] tools/nolibc: clean up sbrk() routine
Date: Fri,  7 Jul 2023 22:59:53 +0800
Message-Id: <ef8ebd7a5de89f9ac691c29412c6586cec1a413d.1688739492.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1688739492.git.falcon@tinylab.org>
References: <cover.1688739492.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_080028_763301_D058DA9B 
X-CRM114-Status: GOOD (  10.01  )
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

Fix up the error reported by scripts/checkpatch.pl:

    ERROR: do not use assignment in if condition
    #95: FILE: tools/include/nolibc/sys.h:95:
    +	if ((ret = sys_brk(0)) && (sys_brk(ret + inc) == ret + inc))

Apply the new generic __sysret() to merge the SET_ERRNO() and return
lines.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/sys.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 3d01a24e6f7a..61a3204b00d7 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -89,14 +89,13 @@ int brk(void *addr)
 static __attribute__((unused))
 void *sbrk(intptr_t inc)
 {
-	void *ret;
-
 	/* first call to find current end */
-	if ((ret = sys_brk(0)) && (sys_brk(ret + inc) == ret + inc))
+	void *ret = sys_brk(0);
+
+	if (ret && sys_brk(ret + inc) == ret + inc)
 		return ret + inc;
 
-	SET_ERRNO(ENOMEM);
-	return (void *)-1;
+	return (void *)__sysret(-ENOMEM);
 }
 
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
