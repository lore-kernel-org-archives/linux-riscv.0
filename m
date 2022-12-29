Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02BAC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Dec 2022 17:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8wcqjz4Vvj6a0uLbqkJNT1mESdN542T/xykJZIb2ARA=; b=Yd7aoe2UCK3UQj
	WcFJ/gmejj5dTCT2F3Yl5oJRVt0Ka7HcpChSo1mNA34sPttGSszRKJvJHs/i6/KDBzsyojmc1Z9ff
	GBQhe1lKiiXgO3OhOPSleMzIOhcRhs+ANlQ/cKMvxN2ddWx8oiv/RmszGXNx0THU4lMAqApGMftWo
	jur3pKI14jzWo4kDMvrttDXN6jzgej3Ci9wAgZbHGSXm65cYvC+cpDajdk1wg1q4LlkeOGIcFACIq
	Xbe1c+zGBdB7fYuNtURc5uDbPwtT1WysJfPsUu+5I9eFfzSFfu4eTdYN2TlOpJo251ZwcfD0iyDZk
	/c0ouP5rujlKknIjT/HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAwLx-0009jE-Oj; Thu, 29 Dec 2022 17:06:01 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net ([86.15.83.122] helo=luna)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAwLt-0009c9-Jv
	for linux-riscv@lists.infradead.org; Thu, 29 Dec 2022 17:06:00 +0000
Received: from ben by luna with local (Exim 4.96)
	(envelope-from <ben@luna.fluff.org>)
	id 1pAwLi-0030r7-1l;
	Thu, 29 Dec 2022 17:05:46 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	linux-kernel@vger.kernel.org,
	aou@eecs.berkeley.edu,
	Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH] riscv: uaccess: fix type of 0 variable on error in get_user()
Date: Thu, 29 Dec 2022 17:05:45 +0000
Message-Id: <20221229170545.718264-1-ben-linux@fluff.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_090557_720631_FC4A86F7 
X-CRM114-Status: UNSURE (   9.96  )
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

If the get_user(x, ptr) has x as a pointer, then the setting
of (x) = 0 is going to produce the following sparse warning,
so fix this by forcing the type of 'x' when access_ok() fails.

fs/aio.c:2073:21: warning: Using plain integer as NULL pointer

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/riscv/include/asm/uaccess.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 855450bed9f5..ec0cab9fbddd 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -165,7 +165,7 @@ do {								\
 	might_fault();						\
 	access_ok(__p, sizeof(*__p)) ?		\
 		__get_user((x), __p) :				\
-		((x) = 0, -EFAULT);				\
+		((x) = (__force __typeof__(x))0, -EFAULT);	\
 })
 
 #define __put_user_asm(insn, x, ptr, err)			\
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
