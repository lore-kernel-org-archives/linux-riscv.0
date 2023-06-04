Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C87C7EE23
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 05:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zt+yuc//oxEEhXj2Y+rILhO1nDL9XIp5EwfbxDdqIVg=; b=NpuxhWHrqFWGxP
	hw4DaGexb7jZJJizrFToZbyGEs1T9xNfLClbEIqNdRqRhVdJtrtGOj+KJnoxgg50rCRPUNv1+pLvW
	BB+fmVHRIQ6o4Eh6ZxSwVenNGGJoEHa62ujU3yoU1+exhJz1wZvj6yMFOV1XKOTxm+VdzHhIjdKo8
	+06+D+VY2cv+7geWtKljnQrz1688TzzfYk3EBFoQzVovD04kxlQtjLmvKYzkrUEMVKnvaD32B0Xga
	mmSF+A/LmAqC8CuWeSyN0ptDmi3w/K8BRBDr/itv+yDHXzzXkvRm85+1SAfF+ZVU9uRh5ogswNfbg
	VMdR0u2w2/o+aWJlNMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5gVo-00BNwf-0F;
	Sun, 04 Jun 2023 05:42:44 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5gVk-00BNv5-19
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 05:42:41 +0000
X-QQ-mid: bizesmtp72t1685857346t5xr8sni
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 04 Jun 2023 13:42:25 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: Z2qCHCq1/922HOu2rI3BNb7YZnwq6I3XqG+zETTdRX5VsVqTCcaEqWdJ/xe8Z
	nyxTVuLQd3K6s8lYS4Qgz4f0pv/WAO12sNEiy+9qWHlqo5jTMfgKcP3i63dAjba4Dysgloc
	Hm16xIq/C730s527UMkx8tR+oOeoz8YIinChVkV78frR33mszF+YhAzfvGGCSRQCtbSb+oX
	nTj+SzN5TCXcn7OkkJ7nFrXv8+dJu0PtIN+2aAgwVhP6Xbn9tAX2inmqu5dwvjx8K3jpeu7
	0p4Ag9EspgteAHAvgrqlXocbra5y+qJmTRonXAqsZ9yN9VUhbtHOxVgUYE+6tbxM7kaeCse
	8i67iyDZsITzvq1dype13lr1sYOAUfVG0VWOX3FbPOzygs8+PuFSEA//QvLKw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5104637929055565147
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH 3/4] tools/nolibc: sys.h: apply __syscall_ret() helper
Date: Sun,  4 Jun 2023 13:39:03 +0800
Message-Id: <b2a0ee856a62f2757e2d1c5c51b3c330be8a0df3.1685856497.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685856497.git.falcon@tinylab.org>
References: <cover.1685856497.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_224240_694374_08A1E4AE 
X-CRM114-Status: UNSURE (   7.76  )
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

Use __syscall_ret() helper to shrink the code lines of brk() and
getpagesize(), 10 lines removed.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/sys.h | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 937a8578e3d4..976f23d1fdad 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -81,13 +81,9 @@ void *sys_brk(void *addr)
 static __attribute__((unused))
 int brk(void *addr)
 {
-	void *ret = sys_brk(addr);
+	int ret = sys_brk(addr) ? 0 : -ENOMEM;
 
-	if (!ret) {
-		SET_ERRNO(ENOMEM);
-		return -1;
-	}
-	return 0;
+	return __syscall_ret(ret);
 }
 
 static __attribute__((unused))
@@ -550,15 +546,9 @@ static unsigned long getauxval(unsigned long key);
 static __attribute__((unused))
 long getpagesize(void)
 {
-	long ret;
+	long ret = getauxval(AT_PAGESZ) ?: -ENOENT;
 
-	ret = getauxval(AT_PAGESZ);
-	if (!ret) {
-		SET_ERRNO(ENOENT);
-		return -1;
-	}
-
-	return ret;
+	return __syscall_ret(ret);
 }
 
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
