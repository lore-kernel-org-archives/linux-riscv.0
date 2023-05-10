Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E240C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 16:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+pglu3IsJKOW07JmiOpp4T5fiN3XAy/JbWoAx8hdjw=; b=ZNxFcGptRqdiKj
	rNfLCagkoh+VD6xEKRwk2WLerQYtPldM9jvxDCoV5OCvluUj115BTwlmC+HCUYSFjLrvEdLTSs0uQ
	s0IF1gfgmAXriatUM95X+0SDEgssVOlsNfneBlWdglPUIKnpZO/hOvhNrJpDGoYO39rqpm4/tkI+K
	FZt9R67Ky/tvtr7MQmAalzfYsyQNxZdhzxDxNd0RRQnQv/VAYxyDRPACUDcMLpUvuy1jlc1x4cubc
	AZFo6Du6apTGkmTRjFO8YXKZn5q4KmPg6eSv1FxPDHJkvJjm2ka5TybzcP5yQhGm4cJ/0UKztmseO
	4LPKJaKpDMBAJzu36W1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwmmi-006aC3-0H;
	Wed, 10 May 2023 16:35:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwmmf-006aBI-2d
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 16:35:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 64BEC64A1E;
	Wed, 10 May 2023 16:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B1EC433D2;
	Wed, 10 May 2023 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683736521;
	bh=g7XPNarzH/wqmr6jhG8yJoDzEIyJ6X2782gc+T1vwWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nCemHidxkEx6i5wrALhCiB1N0fHoOy8JS21FwUzqiktdz70tFZZ/3G4V+LmeDhyCg
	 3BbgC3OUBY8ApUQWdlTKT1qZuq9oCWDpBcyFXMag77sWFKMbhqUXntGuT5PkcCr3h1
	 vpOVnlTDW7Y77cVA01MxS6o0pIy3LvCaboxMsWdGfAYKtLHU8FbA6J/3BUOf5H53rb
	 1xYq93qM1j+0U23ySNHGAVLcuIJYAnmDxXunzoYjzXBjktG39OMo5LR2L8nj4q30cC
	 aWEQ4yoi9B60GvVyy1vBbz0gA3ly8xvvW89KqttSsxAFcq2rw9QMj7FB3fZGKi0s3o
	 2emM8Elpu7nFw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Schaffner Tobias <tobias.schaffner@siemens.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH RT 3/3] riscv: Allow to enable RT
Date: Thu, 11 May 2023 00:24:06 +0800
Message-Id: <20230510162406.1955-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230510162406.1955-1-jszhang@kernel.org>
References: <20230510162406.1955-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_093521_895864_D5C62D4D 
X-CRM114-Status: UNSURE (   9.49  )
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

Now, it's ready to enable RT on riscv.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 89e9d9fb35c4..622561d1e388 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -42,6 +42,7 @@ config RISCV
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
+	select ARCH_SUPPORTS_RT
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
