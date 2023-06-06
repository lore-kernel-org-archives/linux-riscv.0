Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D009C7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 08:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YdjchpEnkcUNawnOygspLd2aUBYvboaJGIT5fviY/tM=; b=AEbeKt2cjJ69bF
	YghRmLJdybHet735CK5nASNzSIMlCT7CPEA0bimAwASm/0Rj111E/TjVggwBPoyAlG/eiY7sYBAvc
	VlT+SZee3yZWsgKSnVsjxHTI1000jb3thxMp0oRgLlMACQrPIc4cFB877QCDJe5KYbuq5n+FNvMRE
	gNptz2V6KUPa0PxyqEfvSIQ7ql3OJgVJZezHTOJOyKCbglBOLtHXonS1RC3hWt/Dc/mq+nMXrQyoe
	g63hGgTSpJMOZ8QTDzYJOJ0g+3jbosyWPiWpZDRPeIEYcp74Y1SfRGYsy6XXCeTvi0sM2ipy7P6Z5
	D0K+4XsSoJ+SduLEiAWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Rry-000l26-1i;
	Tue, 06 Jun 2023 08:16:46 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Rrv-000l19-23
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 08:16:45 +0000
X-QQ-mid: bizesmtp79t1686039390t3zfjj1g
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 06 Jun 2023 16:16:29 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: fs34Pe/+C2RtSKmKHJC+wIdHChvPdDuUHsW0Y/Oc0Nqkrgol9/YGblT2gCBGq
	cvnFZ34Cj87k/IclwMobyHylf5h+9fQkW9ILGGrAdoTKg0xnOYEGdZTtIiQcKOkVrx0jmAW
	JY4DnauTC17PygPFGcUxAME9czb9I8yE/6Wi/RpF+fIioznqAMNklXe4n/XNMPvwtBZKLsK
	HzdqGH1uJ98z7dPX4MSq8KVirLCEXk/O6EymZycq6APbFhLTe8UpChE8PlruhQIr6z4joi7
	6L5DhdOHvTng5Ie0eOs6uxPs3durFfFDDHs9nZ7BbNDrXrjSylG6VdHuvnnaAv8JLU6EW8j
	Jdv+XKibESyIOVUM2iaxHOmMGHW7CDYGQu68zuWQxmkQJlFiWVlD0YaJJQT2w==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14987419174521382926
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/4] tools/nolibc: sys.h: apply __sysret() helper
Date: Tue,  6 Jun 2023 16:16:12 +0800
Message-Id: <20039f63dbbb54889c310196e909469ace5e503e.1686036862.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1686036862.git.falcon@tinylab.org>
References: <cover.1686036862.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_011643_990520_30397F72 
X-CRM114-Status: UNSURE (   7.67  )
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

Use __sysret() to shrink both brk() and getpagesize() to oneline code.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/sys.h | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index c12c14db056e..f6e3168b3e50 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -78,13 +78,7 @@ void *sys_brk(void *addr)
 static __attribute__((unused))
 int brk(void *addr)
 {
-	void *ret = sys_brk(addr);
-
-	if (!ret) {
-		SET_ERRNO(ENOMEM);
-		return -1;
-	}
-	return 0;
+	return __sysret(sys_brk(addr) ? 0 : -ENOMEM);
 }
 
 static __attribute__((unused))
@@ -547,15 +541,7 @@ static unsigned long getauxval(unsigned long key);
 static __attribute__((unused))
 long getpagesize(void)
 {
-	long ret;
-
-	ret = getauxval(AT_PAGESZ);
-	if (!ret) {
-		SET_ERRNO(ENOENT);
-		return -1;
-	}
-
-	return ret;
+	return __sysret(getauxval(AT_PAGESZ) ?: -ENOENT);
 }
 
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
