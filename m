Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD93C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 15:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVMO6wv0B+sTnkppuekDLKYYKkS/ILwS7tY+Ii5YBEs=; b=rCZjLSDBvXMwjN
	nK5GvfWfUEOuXqqeWfaWjIt+QciiQkN5gxOSwo3at0wK3ltGvJe1IRLJ25PWW+BLdHphRydZlcqZu
	mFrSipk0wIVWQXa0D7BIqf4FyrCHB0vUzx9Vdyd4F+r6nIM6UM3LDCcgD7XRcz5ckSLPNUOm1BWNl
	msPLwF/vIikN8yKwcaBXY3PvC3DdoyhEL6eHGEHmS4nqkF/6xM8lIAXbdMOUnUpYHkvftiscXMLHj
	mEcptq9iUTxpO8CgiG83q1/2wrFxDaIUQr8chGJ5RCGt5mT1qaTBEzlEPUVPl2gR0msXoEq0fhIcF
	TcV+8lA6iR/A9XPZiaog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT1Ob-00000000YeF-42Rk;
	Thu, 25 Jan 2024 15:12:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT1OZ-00000000YcT-17Wl
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 15:12:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B635161365;
	Thu, 25 Jan 2024 15:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FBD0C43390;
	Thu, 25 Jan 2024 15:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706195518;
	bh=qaC0W89Ij+l6ejUX971u7DsedKgRmIMuV9AHu7Mxo8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nSXdWtBRn7k/oWkIm7gkawOUKqSN1OL4w9QeB24Fl8ZRHsLgAjoCIHhFWXd79Mp/k
	 3Ywru/xCQb2wY60k7l+yyuii5qOHoNUPxJY9OA4fDUB9tsBI4CKKLva81H4c5Npxko
	 soBi2N+5Uw7UwkYTWpLpjdPKPQ0wBM3LM74JmxAgiScgs4je9bRGpVKtSOL7XfqcrF
	 qK+tHIU3yLfbf+4jshsQqPu95ovDWv9J+0QvFX4IW5ZFrIZ/pWLLCKym8nubIjGZDb
	 ItQ+fc24J9ME0sCIyGDYtuTdbnutgAEV9mcG2Qrx1ywShbrYa9g7szY7BW8Otb0SZs
	 axAz+H2EwRvfA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH v3 1/2] riscv: select ARCH_USE_CMPXCHG_LOCKREF
Date: Thu, 25 Jan 2024 22:59:06 +0800
Message-ID: <20240125145908.968-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125145908.968-1-jszhang@kernel.org>
References: <20240125145908.968-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_071159_424707_52DCE62C 
X-CRM114-Status: UNSURE (   7.16  )
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
Reviewed-by: Andrea Parri <parri.andrea@gmail.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fdd1a595ebd8..248cea3e2749 100644
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
