Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30408C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 00:07:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B06A561208
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 00:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B06A561208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jiuyang.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v+E7jNJkgEkUDhz3+6fYKH+TWh03W5PX750/d3M0hPQ=; b=BYM1dbBWmvsnnZ4JgVykVOH5t4
	HwVPysALdDMRIGCwJegvpWxIScG4LLQ77wi3nvJz7WIbg4HXNG2zu4CFKXUxdp6XZ7OOzcd7cQrup
	W1LzqvoYvLB4iLYA2cyE4K7ITs51wRze9/Ft/dlUZmLxjd8Xr/1/ouSCNkHLSNqUGuYY7CnS4O+Hl
	ou90dTNTsmZifxIkPqQWyeKiS5KMgwZztDzRowjPL0wIeVaKj3X6adtj6dXiw/38Vvi1RLXPm/eBZ
	SPrdOPtB6E2216Y3KK6eN/NspTqR49lCUcB1TKsMqPcpTF3U4dFh9TUdF6o1KCIrFt1Pcm1jNYj6l
	Jpsh/rrA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVk72-005KSd-7O; Mon, 12 Apr 2021 00:07:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVk70-005KSV-I4
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 00:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=YnVs6iXJw2PnHXM+FTaBmQjNfh0kVz1yzJWe9NsSwR0=; b=g/61Fdk4BXbkvOFOFW3WR8eVsZ
 eRbBPVfdNiFu1hCUOoVUoK6bG+rGukCE4SxgX2wuWw/MPx04ESFYXSZaulwG4RrkELjaJtDMuyToj
 B+61IeJ0tu8O9a/3kK6d1M5Sman59WpG26RihJtBZgBOrwlrmmEtoF1Izsbvoc+hie0lXdYoYVhmC
 xDX3FiXzAOqUsai2zD0K9J0iBZpfgywwtRisPGbglbekLBsfRLr9TPiPqt+0T5pCZacM/gGV5JqkI
 8oRbblnshukTY4d95o751NjizwXGOL+a/B2AzOPH5NuOxgoNyR/fFmOiz/Xy3EuUuhiqIukQSke2j
 M96oHfMQ==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVk6x-005nmz-T2
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 00:07:29 +0000
Received: by mail-pg1-x52b.google.com with SMTP id t22so8058009pgu.0
 for <linux-riscv@lists.infradead.org>; Sun, 11 Apr 2021 17:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jiuyang-me.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YnVs6iXJw2PnHXM+FTaBmQjNfh0kVz1yzJWe9NsSwR0=;
 b=2FCp0QcA9KMN1+FvWg1Rjg8sWToiad0gBkN3N2EJetKRzsEwU0L4kPzDEai8bniM5Y
 1NVCO/N1/LVjMevSq5/++QC2mWE13WL+cstlo1xdFy5yI9PjlFw6lKtmpDJE5UnX07du
 LU9HykuIrJlfQluE876DA+/3BBY7T4Rk0fAAVCxOEXK/zjS/l/iQacIilwGNYBWWKZfh
 H/c1KZbbV68QbSvvQUSRZ4X9R6eLrRxDdNo1mpaiUlPBa+f0QqLRbX0ytoZsusftsxWG
 f9hbkOaUPzMDQ6PDCOanlBwjxxopQJgn8K/hCnoRMVQq7/944pDsE+rTJXjWdZ3LhBQI
 lPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YnVs6iXJw2PnHXM+FTaBmQjNfh0kVz1yzJWe9NsSwR0=;
 b=T5+9A5q3IjD+aybGF7CkWAoLjcGgVVZ/eE5SQoE6gCgma8/fqOemHrLiYbepOskZda
 rpsJFf2bEQ1osi1pKLarV21KXRUhn54zDTQ6lBConcZiohiA3RaLmP4kq2W2NQJE78C7
 8a816PNCxU8JtLPKXjc0XCakW7ndH+9XX1b05QdCXZi6Ug6GxrRstf3yE4t798opT0Mu
 5z5VBVxZUHYwn+WxvmXIoX3Iq4F6Ca0c/Y3Ar2Zjh13NJuhy2qSxIoxLBW2QTacufZri
 0H6tq9bvqq0qsYUtmYlD8vRObYpGMDgs8q13dF2wNMzf17wj+KGvyGB+w8vECAVrRV0W
 H4Zg==
X-Gm-Message-State: AOAM5305r/M5oAQXrSF+dqXTQRol08N6vw6G6hcy1Ku3R4PPYrNic+j4
 pAFp1JXyqqUzLe6lmR/WKdHrty4CtWhVuv60sTw=
X-Google-Smtp-Source: ABdhPJzDdTFa3CC1zKUIwEJQdDfwZ4tO3Fj5p3nGBQapMaKymcm2Jj7S+Ovc6enFWYjZC8kcHAi6bQ==
X-Received: by 2002:a63:30b:: with SMTP id 11mr24078481pgd.245.1618186044990; 
 Sun, 11 Apr 2021 17:07:24 -0700 (PDT)
Received: from nuc.. ([193.110.201.196])
 by smtp.gmail.com with ESMTPSA id 14sm8544872pgz.48.2021.04.11.17.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 17:07:24 -0700 (PDT)
From: Jiuyang Liu <liu@jiuyang.me>
To: Alex Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Jiuyang Liu <liu@jiuyang.me>, Andrew Waterman <waterman@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] implement flush_cache_vmap for RISC-V
Date: Mon, 12 Apr 2021 00:05:30 +0000
Message-Id: <20210412000531.12249-1-liu@jiuyang.me>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_170727_994795_F6524F80 
X-CRM114-Status: UNSURE (   9.31  )
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

This patch implements flush_cache_vmap for RISC-V, since it modifies PTE.
Without this patch, SFENCE.VMA won't be added to related codes, which
might introduce a bug in the out-of-order micro-architecture
implementations.

Signed-off-by: Jiuyang Liu <liu@jiuyang.me>
Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/include/asm/cacheflush.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 23ff70350992..3fd528badc35 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -30,6 +30,12 @@ static inline void flush_dcache_page(struct page *page)
 #define flush_icache_user_page(vma, pg, addr, len) \
 	flush_icache_mm(vma->vm_mm, 0)
 
+/*
+ * flush_cache_vmap is invoked after map_kernel_range() has installed the page
+ * table entries, which modifies PTE, SFENCE.VMA should be inserted.
+ */
+#define flush_cache_vmap(start, end) flush_tlb_all()
+
 #ifndef CONFIG_SMP
 
 #define flush_icache_all() local_flush_icache_all()
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
