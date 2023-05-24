Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B21C77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 17:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gFQB4QTUBeUAhsngtGEPYfQy31cI7I0AEdhX4nbd6WM=; b=iO2dlORJhlY1it
	vq+LTa52no4TTr4eEN+eSa9ouofnGjj0EBvJuDQIMer9mqiTzva2ST8SZJfiEaQqE0hvfKq2TDwT2
	oYSDeglqBPyyI//xI1LHjgkylHlYH4t9KyxS5aF6ZliTNGLLGH7QGH1Sf8Sq3B/7BagEl9smZa77h
	x0CBdfxnvE9dqXZnx3hj+87UgEPKLqKI7EIqJmJXOl6CeI31xClQprNEzZylW3wlQZDMswgEXYiI4
	OJhQH9yVdx/M+ZRD/69KMaIMpym1IoLwxd0dwo8G4Nolouo0vyLV/moHv7XxZJ+FPCvM4F/39jDKI
	ENSh0jodF+EZ+RRmrnCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1slG-00EIV4-0E;
	Wed, 24 May 2023 17:58:58 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1slD-00EITU-2t
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 17:58:57 +0000
X-QQ-mid: bizesmtp74t1684951127tibius57
Received: from linux-lab-host.localdomain ( [116.30.125.36])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 May 2023 01:58:46 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 3M0okmaRx3j5XLeAsUaE/DkfZWFl5CmfKZrVp7OoqgrEw0wk0brdmyrXBI5zN
	NpWpiQQzR4ct/fvme1WqRNqVlEyVp0V3y4gZ4FVeqTORPQSaNUNIVU8zXT0xSs7UvR82pAU
	piv68CfZe0vXIJ/2ZF6hgetaWwXz2z51mbzLshvXJcW7SEUTAlpAm6OUnZxrq622N8BIfRE
	rDg0PT1ere6yY0p/7uVW7DoOggF8vXvKxIkzNa5uthRTIAHlaGXdikv0yyDo/nKhqjaY8wB
	xM8nuDYA1NVSgtnqjG5mLKnJKA5+CugBcPb4GxOb/Cf9R0iXc0GBZQyP2drBsZnEkynxhd2
	FNSa53ww7eKmKY/+W9ATQKkdLd8ZWHT7fLYAKgSZ0Xfzj1+35PgLCcy6Q4s3Q==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4532114979322601860
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	thomas@t-8ch.de
Subject: [PATCH 10/13] tools/nolibc: ppoll/ppoll_time64: add a missing argument
Date: Thu, 25 May 2023 01:58:39 +0800
Message-Id: <cbcc4afca5f80aff6533ca4536cb12093cb65cb5.1684949268.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1684949267.git.falcon@tinylab.org>
References: <cover.1684949267.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_105856_238463_B42DD4C5 
X-CRM114-Status: UNSURE (   9.07  )
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

The ppoll and ppoll_time64 syscalls have 5 arguments, but we only
provide 4, align with kernel and add the missing sigsetsize argument.

Because the sigmask is NULL, the last sigsetsize argument is ignored,
keep it as 0 here is safe enough.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/sys.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 08d38175bd7b..c0335a84f880 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -935,7 +935,7 @@ int sys_poll(struct pollfd *fds, int nfds, int timeout)
 		t.tv_sec  = timeout / 1000;
 		t.tv_nsec = (timeout % 1000) * 1000000;
 	}
-	return my_syscall4(__NR_ppoll, fds, nfds, (timeout >= 0) ? &t : NULL, NULL);
+	return my_syscall5(__NR_ppoll, fds, nfds, (timeout >= 0) ? &t : NULL, NULL, 0);
 #elif defined(__NR_poll)
 	return my_syscall3(__NR_poll, fds, nfds, timeout);
 #else
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
