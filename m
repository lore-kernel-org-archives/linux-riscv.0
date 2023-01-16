Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE66C67871
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jan 2023 15:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfuCjhc4NEegZ7yqc7DnqSj8Xiy9YAZcYlcT+r1X7dM=; b=V/mw6xNAB77iaf
	KId6q4w4+Ozkx+FN0TLtArdU5WguYgpGHn6T986a7mxWV5LaiYPUv6n3vEsCYPxUknw/QkcrcInKk
	FOY9GUzDX+W9bDntQlaJSRlQMoCb69CG/2mrZA0MVO3QNBGUSQTvDN/uV2Ap2341HUdNdux1Pvjyb
	b4SBiGcxig4qG8Bmq/BmbMoC01FxGDcyFr97x/5L3Tl4sLo75ZVkms1KW43/UO/RzEtK1sXUMJY9n
	u8IKYLNvOfEXLnsO+siz8uV3yPeirFahUlMvCPG23qqTC6mzQjk+6BJUoZ49MTOtEosOU7x3nAXfj
	Fz5XZepQJlPZYs4T+yUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHRsT-00BAzb-Oe; Mon, 16 Jan 2023 15:58:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHRsR-00BAyO-2S
	for linux-riscv@lists.infradead.org; Mon, 16 Jan 2023 15:58:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BFF72B8105D;
	Mon, 16 Jan 2023 15:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2488DC433D2;
	Mon, 16 Jan 2023 15:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673884704;
	bh=Q3aUPyCmgVUYIBmI6uVtAlDrofg5WEVa3xPWnM7xs/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mru8Lkmegyc0W+Cn7bxVnvtPm1xWBYH3fluAbrGMdkbbNt/NvYr31nj1Lo0WFK8OK
	 WLAXR6ak/NHop4MfGbN0yv7WVHA4tPAslu0oVlhBZufCvB0U6aKbsETQ3JyGG7pcqz
	 H9uPrPJMx0+2CdIWAKbeLkZWQNl9gcnuJwypJSbFYkBxQDRU1wijQ4Z9tfVxzqYxxR
	 cnI2nljWFBubmVIl49xtqSxI0mpWS+cs+OYgCY5AVvzeR1Rdwx8oYCZfdjYDtvk2T3
	 s0dbEX8AebX5tmswx0SZzF+glmHu/vWiY9T0ubXpNxUzAUuQzcCHvPXKvj1IZpG4ts
	 ArFTUMJNvxT6Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org
Subject: [PATCH 4/4] riscv: select ARCH_WANT_LD_ORPHAN_WARN for !XIP_KERNEL
Date: Mon, 16 Jan 2023 23:48:00 +0800
Message-Id: <20230116154800.2396-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230116154800.2396-1-jszhang@kernel.org>
References: <20230116154800.2396-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_075827_281886_79157022 
X-CRM114-Status: UNSURE (   8.85  )
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

Now, after that all the sections are explicitly described and
declared in vmlinux.lds.S, we can enable ld orphan warnings for
!XIP_KERNEL to prevent from missing any new sections in future.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e2b656043abf..335e0c45cced 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -46,6 +46,7 @@ config RISCV
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_GENERAL_HUGETLB
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
+	select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
 	select BUILDTIME_TABLE_SORT if MMU
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
