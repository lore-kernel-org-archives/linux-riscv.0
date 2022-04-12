Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49634C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 03:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xOjhH5gvOZtz8F3IlSvDpPa6JDIV//VErWbWVo/1fXw=; b=rAMv/rBRjn3maZ
	DosDm2D8K2lq9bvRzf+mU5f40TPQo0ZZ69l90NVwJ40TOcg5gtHKCIcYJcccsPwekdrfqGdVMa8+C
	Ohc1Z9KicT40dtXNwtxRk+zTdUwIlfpzLLRNCq4Qpbn3SZ70AmUnfC4oE6ImunW/48le4iJ0AWG8g
	m3LWkZ3ZrsVQFmEqFb6PpsIB8xLjHW8HP7xQ45cmrZERaGExWUk3Gbr1wuSjcNzmWjpTDxWmM22Nd
	0aG+wF80YlA4Sf9y9dQlJxZWKMWr7KJrNE44uH9dMF7TMjHNJ0CXdhnJL69CjapwF1wO2WcNbGiF6
	n5S+RqlULZOucdgv2xMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne7Xs-00BSdJ-9U; Tue, 12 Apr 2022 03:50:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ne7Xp-00BSbi-UT
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 03:50:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3E753B81A93;
 Tue, 12 Apr 2022 03:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA0CC385A8;
 Tue, 12 Apr 2022 03:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649735419;
 bh=q5E3N7iiWK51L+7Z6ISITmvKVndirLXdYoiSjDA/02g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k8odB8sRdWaLXNZa7+M/xqJrvpLfjm7XvSDV28pXHT1VyXUJlpupe9unA/I78UV4X
 6WPAnq3CZ44Pcvs0SXYjmP2m1igDByB/IRtlZfbW7rsurG3PrRny+6ERAxaMOu8fdZ
 JVHBV06MmRfLTlyzuD9tdbnqFH9GHphkn8jFmvzlEd67aF6x2GBSZDmCS5xyd0D09t
 6ZDsihNN1TaLCYPJ4UeE+v3k3CsZw3o60D/jlM9xC3s0xU71H+bfzO1Y993H/XDeI4
 MY9/Sf+tijOtiS3lmhk1uYNH37yaVM64y5VQDRZJktsUtcNemfDuTr8T+cKszQ/KYv
 7oE/gLI8jjlAQ==
From: guoren@kernel.org
To: guoren@kernel.org, arnd@arndb.de, palmer@dabbelt.com, mark.rutland@arm.com,
 will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 1/3] riscv: atomic: Cleanup unnecessary definition
Date: Tue, 12 Apr 2022 11:49:55 +0800
Message-Id: <20220412034957.1481088-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412034957.1481088-1-guoren@kernel.org>
References: <20220412034957.1481088-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_205022_152319_4FA2D359 
X-CRM114-Status: UNSURE (   8.75  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The cmpxchg32 & cmpxchg32_local have been never used in linux, so
remove them from cmpxchg.h.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/include/asm/cmpxchg.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 36dc962f6343..12debce235e5 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -348,18 +348,6 @@
 #define arch_cmpxchg_local(ptr, o, n)					\
 	(__cmpxchg_relaxed((ptr), (o), (n), sizeof(*(ptr))))
 
-#define cmpxchg32(ptr, o, n)						\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
-	arch_cmpxchg((ptr), (o), (n));					\
-})
-
-#define cmpxchg32_local(ptr, o, n)					\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
-	arch_cmpxchg_relaxed((ptr), (o), (n))				\
-})
-
 #define arch_cmpxchg64(ptr, o, n)					\
 ({									\
 	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
