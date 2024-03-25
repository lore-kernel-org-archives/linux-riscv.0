Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965D9C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 11:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2KcqGPmfE9URusB02/gu8sxx3PqV56gZv50rptimyI=; b=PRkiF7P0mdJP6D
	LspF/4WKIJkWSCOnPyL0sqfcM7yz4IOVpSt27Iepa/yNNpxMrRV8QTTuFiBqHNmg/KCf5InVeFAWA
	5xBVBwDIfl+b2uN7Eg8E2LWQiPA0Ll85xGmNEMS06r0QkN+dtXqXM70b4jVYT/zlT7DB3/nsurlH9
	/DVe6tzpRhRos5lvmZYOYqm+Ek6eOyQG6ptdC2XHIgHX/A/Yz6WjO2xjXCK974CWgAC7Uax0jk/DS
	2aUXxQL+fdX6vbbOH4RvP66OmzyBmDWp8AaLEsnNas9Zs9wzSTBhTXjQjrQAsVQTQF2Xhz3zvQjm9
	Egj8nfHununHnD4Qt7GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiQx-0000000H1tO-0ToK;
	Mon, 25 Mar 2024 11:24:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiQo-0000000H1qX-2F2X
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 11:24:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DAA02CE1723;
	Mon, 25 Mar 2024 11:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D14AC433F1;
	Mon, 25 Mar 2024 11:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711365836;
	bh=TkQFAl0y/SHZ/rPLxSlv1JjtbvVld+zmq7CDJ3afisw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WDstMSAUtMz3dbEcVm+KLj1GR9k7r52hnpVzlF2STimuRRvPFMDaOrFV7Ov/86urM
	 zkXfEq9MVCWVOD9OWWqn7Drl8ilkELX/EqjZG6TzDk7LfjGKaAs+wfBGaUDX3u2v5i
	 KeSkxzv2cEv+9KJbpqxro/uYf9da5AiVxCu71SIB86Fx2MsLQI3kZDailyNKwl1VIl
	 BT++7eVE+OcTA6uRxlJuy3a5oLyc8cTSBl6kJ0AEkSYOp4+4pkwrdvzfJgv9eGXoQ3
	 1HCQ4zA7BRYic/5jofv/E1MRs15h7yHC0sJZZdCB1JdpRT4JkkZZJ2FWTZzQRLlsES
	 41Wunpx0FrcUg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH v3 RESEND 1/2] riscv: select ARCH_USE_CMPXCHG_LOCKREF
Date: Mon, 25 Mar 2024 19:10:37 +0800
Message-ID: <20240325111038.1700-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240325111038.1700-1-jszhang@kernel.org>
References: <20240325111038.1700-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_042358_806009_ECC1CE8E 
X-CRM114-Status: UNSURE (   7.44  )
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
index aba42b2bf660..7895c77545f1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -58,6 +58,7 @@ config RISCV
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
