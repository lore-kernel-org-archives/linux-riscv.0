Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21DBC4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 14:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+xTyMcMQ/THPKF+slDVYfSZOhPnu7rzW1d2BUaZK2Js=; b=pFwxXgG/gDxrmq
	DbkkXeVmPzvhAVpm7ZuBwqVS8UK2a/CH9yTsaJ25kzz0iK8Low3yLlde3fcTcErLdU9tz5k6G7kwE
	AUE4gmvMSVse0qM+2eNLzxR1KMtJgZ3qAUF36B8olE0MotD5FR0imCSdWlAAeUNE9Z88rMFyQoBY6
	IUlTPOU7TAcnCUYxiBA99wsSGDy8+DHyFANzjOf4qw12WYsLSaTRPFn1ZiV0fd79zcQHJF/aiFlMK
	yrpD2w2V0UtXiSNnZsTdr8UXVJ6Y4IUnQSAGI1o3EekqleHov/1XTSD8Py5q/HOtP4LNCVuYrMgwG
	/qlCrYG6knePXbVQnKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9Qmi-00FmoH-25;
	Sat, 02 Dec 2023 14:15:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9Qmf-00FmmU-29
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 14:15:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 82E0F60A5C;
	Sat,  2 Dec 2023 14:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82F8C433C8;
	Sat,  2 Dec 2023 14:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701526551;
	bh=fwdhwt3eDeqZRwcBFACwkkWnjPtptuE2Wu5b5bty77c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oQ72I/i6LN9WRbDkrkT9M9kOLmigG1FyWGGpxqvKDzK8Ed7mBok7Xna5Rno92B6gj
	 /XX0nb16HB6UkRBDog/J/WWTPO/5HtSFde3mvKL+Yo4z4M7PJyanFKMRJ0ecX0vpwu
	 kW0h6cCwkSUUIOzNSolHE+92AyLd7syaH+iL98NweXOkA4xA5WEnnmMAVNqHUvYlDN
	 fYOdl/nIa/HYzblmbtfeba1gDN0VzQEY7gta52VNWuc+y4S4MLdaGLanZV9Ne5H8uM
	 yxx/DRCMIs+4u1zB+ol2wV6E7lqNnlKjcWNXa+lYHWlMxDrNxj8nY5kExp7zxqauhT
	 62de3GKfgbhDQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] riscv: select ARCH_USE_CMPXCHG_LOCKREF
Date: Sat,  2 Dec 2023 22:03:22 +0800
Message-Id: <20231202140323.315-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231202140323.315-1-jszhang@kernel.org>
References: <20231202140323.315-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_061553_744326_43FA0BEA 
X-CRM114-Status: UNSURE (   7.19  )
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

Select ARCH_USE_CMPXCHG_LOCKREF to enable the cmpxchg-based lockless
lockref implementation for riscv.

Using Linus' test case[1] on TH1520 platform, I see a 11.2% improvement.
On JH7110 platform, I see 12.0% improvement.

Link: http://marc.info/?l=linux-fsdevel&m=137782380714721&w=4 [1]
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 433ec617703e..da4ae76a892c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -51,6 +51,7 @@ config RISCV
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
 	select ARCH_SUPPORTS_PER_VMA_LOCK if MMU
 	select ARCH_SUPPORTS_SHADOW_CALL_STACK if HAVE_SHADOW_CALL_STACK
+	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USES_CFI_TRAPS if CFI_CLANG
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
