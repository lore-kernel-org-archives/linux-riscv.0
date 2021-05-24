Return-Path: <SRS0=jEvo=KT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC922C04FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 16:34:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D727613CC
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 16:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D727613CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RlBM9hH0CDyhOUfh02uaxbMKPgjEYUwa/rb4uGjkRW0=; b=jRVl29iek85mlY
	nBvISkmbxdgqvcHgE/R0m9rtmJLN7btaAANv1lCP0o2uodWvtqAtOtPG8Cxen/rHafkWayWxMF3TA
	Oeu2zjed30k4kdw09ULgK0JKKnMtpKGxTinVKXcgm0J/nLDTtLJ8y+aSXVS1cZLYp9yOuPYjSLflu
	V4g1J8TedFV4hlbGoOKJVSO7f71dy7BWLSCyyZtVrvelqplcl0YIyWtktj+2g8s1iKxYdyoNdg+ex
	7I83KSlirB2P59SQ0LC3AP23T2ONn129ll69kdTeclD8UiJLpyBsKfkBKp0FDc9vOhNQkuBknBJph
	lOXLi6+vwXrfgvGyCxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llDWN-0017hF-9j; Mon, 24 May 2021 16:33:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll4RW-000j6u-1c
 for linux-riscv@lists.infradead.org; Mon, 24 May 2021 06:52:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF7D16105A;
 Mon, 24 May 2021 06:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621839121;
 bh=KUxxMIboqKng0IyfhiaidfhsDw8pJK1odbLPMKgDjI4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=udf5cfged3xJcKnJN0XoXqeYbQ0f5K1ItIBM4/rX3qVl3zq0o66OSs+jvQI8iGKPi
 k3TNWFD0Wy++YLJR6elWv1awp2Hc+F8SlD4xUyJURVV790FfznntEmso4uz/Hp7IQ+
 h7GILcX79KxX4twcBc3GHarBu8vgWHfQGRXMH59acXvLCfA2IJlu8mTNH5+QGDQInw
 5lO+UsL4yaX/UsydRvf/0l2qGbksND2U/lJGO8t4lLjCxMRfzJVk3t/VXBKPRvlzkN
 HodTttLhOO8Ti2TSX8dLoDT/UDIkfVx/psRGBdRVL/+zQZkUWpHbYPUoWTVQf4qfcg
 oyQlhK6dUtqgQ==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 2/3] riscv: Fixup PAGE_UP in asm/page.h
Date: Mon, 24 May 2021 06:51:07 +0000
Message-Id: <1621839068-31738-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621839068-31738-1-git-send-email-guoren@kernel.org>
References: <1621839068-31738-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_235202_125668_394D9EC2 
X-CRM114-Status: UNSURE (   8.50  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Current PAGE_UP implementation is wrong. PAGE_UP(0) should be
0x1000, but current implementation will give out 0.

Although the current PAGE_UP isn't used, it will soon be used in
tlb_flush optimization.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 6a7761c..c611b20 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -37,7 +37,7 @@
 
 #ifndef __ASSEMBLY__
 
-#define PAGE_UP(addr)	(((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
+#define PAGE_UP(addr)	(((addr)+(PAGE_SIZE))&(~((PAGE_SIZE)-1)))
 #define PAGE_DOWN(addr)	((addr)&(~((PAGE_SIZE)-1)))
 
 /* align addr on a size boundary - adjust address up/down if needed */
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
