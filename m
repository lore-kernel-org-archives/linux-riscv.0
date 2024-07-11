Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97469C41513
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 11:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MSO2jFTj8eePpGZIRfRsk9mE+0YOxZzFP1STpFHMIJ0=; b=dyqq35FkXw8bsa
	OdC3vsn4UgK9vr6LJLWLPgwZJdvP2Ny5Qgms1JhBDxoLp+fYyzRzBDbyua+g4wrgMjT0ImQ67OATH
	Tdrqw4NnK7olYLEtJ/xPVpLS1jZ3e6+U5HHvnNFunfI6I8qICg7JaH4FLaJ9Il3eFy5nnRvbw53Sz
	0wkEQbN0SxUF4qi4EDac94ycwXtPbIdDAAoWV93Licxk15HEqRXHTxxw4DHYSBAWOqjlK5+ed9Vb1
	eguYXoyRXbhgRa9GeaJBY8L40074v5VhVhTQutg4PflR/vFXwYb7FTKUsJjxpQqvmPdBoFK7QsJMe
	QkzIVk2Iyhy0K/cvWdGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRrhX-0000000DgcY-2WCy;
	Thu, 11 Jul 2024 11:11:03 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRrhT-0000000DgbS-2Ajt
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 11:11:01 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WKX330h3jz1T5SV;
	Thu, 11 Jul 2024 19:06:07 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id EE9ED140361;
	Thu, 11 Jul 2024 19:10:50 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi100008.china.huawei.com
 (7.221.188.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 11 Jul
 2024 19:10:50 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<samitolvanen@google.com>, <debug@rivosinc.com>, <andy.chiu@sifive.com>,
	<guoren@kernel.org>, <songshuaishuai@tinylab.org>, <bjorn@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] riscv: Remove unused _TIF_WORK_MASK
Date: Thu, 11 Jul 2024 19:15:08 +0800
Message-ID: <20240711111508.1373322-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi100008.china.huawei.com (7.221.188.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_041059_741428_B9A7773B 
X-CRM114-Status: UNSURE (   6.33  )
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

Since commit f0bddf50586d ("riscv: entry: Convert to generic entry"),
_TIF_WORK_MASK is no longer used, so remove it.

Fixes: f0bddf50586d ("riscv: entry: Convert to generic entry")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/riscv/include/asm/thread_info.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 5d473343634b..0eead6b7b790 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -111,8 +111,4 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 #define _TIF_UPROBE		(1 << TIF_UPROBE)
 #define _TIF_RISCV_V_DEFER_RESTORE	(1 << TIF_RISCV_V_DEFER_RESTORE)
 
-#define _TIF_WORK_MASK \
-	(_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED | \
-	 _TIF_NOTIFY_SIGNAL | _TIF_UPROBE)
-
 #endif /* _ASM_RISCV_THREAD_INFO_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
