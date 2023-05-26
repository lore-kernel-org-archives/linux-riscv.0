Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68958C77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 17:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0iMkZKSSoNt+7OvcmXyP6AyANLDi/EPn5+F0EkqRTA=; b=2XL0yP9/To9hNG
	P0knUG05PZzDTeB2VYVUMWH1akimgxfkGpnH8YX0wWZefvOlz2aynoRhC7eU4TGCkFU3oEt6biCDI
	NSRLgNKG7ZdQXUGfuqDu0h+n4n9/lCwT6CVPAtfSH67TXN7ZAa/kqGDACd64SMVixqyQzQKLXQQhm
	MYwCAOuMlXvR/Ah0hzNQJP8W2uqX1/ZVF2Kd5c96nhBpdX+KCQOA8bfEXfUc1PQs97YoLT31QCbMc
	SBm2Ah19txnhEGftM/EOEIEvl7kNCcQSNyH/HRJLBfmbVETMby6a59p4j/85zqW7XzD8e5sBGETcK
	t0iv8jgZ2kD/23L7RUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ayC-003FdG-1t;
	Fri, 26 May 2023 17:11:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ay9-003Fbk-2R
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 17:11:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 56DC3651C0;
	Fri, 26 May 2023 17:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C85C43446;
	Fri, 26 May 2023 17:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685121072;
	bh=N+SE5apBHJdpc4kl5LVsR83pASoe466MUuKqmk4qCmY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dy9f79qlz416EP/3kBixmbxtEXL1AKGqFraAcnWqIMmty/VaLIObcEn4i3SO2uOV5
	 QkhwCRgI/Oay6bicOxByimULBFgUFw4j6xneFP+fsk11XbUZMlDS3mNrTjpUoqqqTz
	 DPwGGmjWeRBgtFzQ9ouzXuhtXZ9Y46W8C6ObVWRrOdxmxoX7UOcfV9J0b5bErkxuxC
	 ppNttvMssdEoz7kRbhRyYN6bZlp+UYB42+BkQAbnz1U92W3qY73ZMyiDf8+iCahGwg
	 LLej5KAh21kHUwffCZrId0f8ZlWjsdXRsPwBaepbd0kjN2eSX6TmWWJEi/Am3Jq5P5
	 BklHbdj0qYrUw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 1/6] riscv: errata: thead: only set cbom size & noncoherent during boot
Date: Sat, 27 May 2023 00:59:53 +0800
Message-Id: <20230526165958.908-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230526165958.908-1-jszhang@kernel.org>
References: <20230526165958.908-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_101113_833142_0F19E06D 
X-CRM114-Status: GOOD (  10.27  )
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

The CBOM size and whether the HW is noncoherent is known and
determined during booting and won't change after that.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/errata/thead/errata.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index c259dc925ec1..be84b14f0118 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -45,8 +45,11 @@ static bool errata_probe_cmo(unsigned int stage,
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return false;
 
-	riscv_cbom_block_size = L1_CACHE_BYTES;
-	riscv_noncoherent_supported();
+	if (stage == RISCV_ALTERNATIVES_BOOT) {
+		riscv_cbom_block_size = L1_CACHE_BYTES;
+		riscv_noncoherent_supported();
+	}
+
 	return true;
 }
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
