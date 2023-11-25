Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE10C624B4
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Nov 2023 08:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/WEMrHNkf/bRZyb6WQ9A44R8LInuF1qUaAbh2Qnhks=; b=f9LjoEciOIwRdK
	qAq6sLQtC2LBaBBpFM+HORFPApqJnew7c2QUFNZjYe2mtMsueGKO56kdiW0XRmGWrYTUtONw66c/f
	VowJ39ry04atsWqHGQpQBCjBdnvzExcbefSOlkoHCdH8jXRRboK6+0admzxE0M50BnRCrE5qeJmjT
	oTrNXgLBoqU4w7hB9rc2TE66Muy14k6zERAHWYSLofMFkT5x38Qs9EzzSINXsLmP4JXrFuw0IehAo
	7R39aPvcVBROdJ0sI3GTo6AEzvkBhJG7qQQFUFxvnccIB9OGWstNLc2EFmfhSSSFxi8VX4k9Tirxx
	0eNP9hV6gEhaPKrzJ/RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6o7C-008qrY-38;
	Sat, 25 Nov 2023 08:34:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6o79-008qpZ-1g
	for linux-riscv@lists.infradead.org;
	Sat, 25 Nov 2023 08:34:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B821DB80884;
	Sat, 25 Nov 2023 08:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6381C433C7;
	Sat, 25 Nov 2023 08:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700901249;
	bh=sULvz/WSntLYIuz8arrxbKY+JbBMr2OcovMfkGjh65Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uHQ/QCsenj6f9OJf8bInnyQuHu8Hf0uFEnDtugC8O9iL8r0q4Brx28gsrovvT3FAs
	 LhawTxe3j5d8scxzMzbQiGyJZfkVMXpK82I/5XqTPoZ6u3pTdxsvLqRvezbWhDAW2o
	 LVd+SooqmlELp+W3QibQsEqlJfY86m5+zw9VlZNPYDsZ7csQTMorfHtMvpIS+Dq9pe
	 M0dRry6v0rhKpgRVei8IUl7Pcs3dA36MV468JtfYNLs4CN6PPE5CqUCLhI5Hd3bIFv
	 Fbys8DjygX7Hus6H+yoTHr45M9gj5Hyu00GZb7Ow0LkMXz3xwA/WIKfQI2CgQwPJWh
	 TNym1R38OWYZQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: select ARCH_USE_CMPXCHG_LOCKREF
Date: Sat, 25 Nov 2023 16:21:43 +0800
Message-Id: <20231125082144.311-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231125082144.311-1-jszhang@kernel.org>
References: <20231125082144.311-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_003411_728415_87C9EF29 
X-CRM114-Status: UNSURE (   6.91  )
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

Select ARCH_USE_CMPXCHG_LOCKREF to enable the cmpxchg-based lockless lockref
implementation for riscv.

Using Linus' test case[1] on TH1520 platform, I see a 11.2% improvement.
On JH7110 platform, I see 12.0% improvement.

Link: http://marc.info/?l=linux-fsdevel&m=137782380714721&w=4 [1]
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 433ec617703e..7f8aa25457ba 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -51,6 +51,7 @@ config RISCV
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
 	select ARCH_SUPPORTS_PER_VMA_LOCK if MMU
 	select ARCH_SUPPORTS_SHADOW_CALL_STACK if HAVE_SHADOW_CALL_STACK
+	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USES_CFI_TRAPS if CFI_CLANG
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
