Return-Path: <SRS0=jEvo=KT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C433C47085
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 17:51:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A94361400
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 17:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A94361400
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9C+nY1C8ypDu5ZV4D9iQU3QbO7mLcD1qcu/PfziwkQI=; b=ki0DoglyOJF0ti
	D/jObY9PCWEnUpPeAw4jYU2f2g4XGEfL9LhairwJ0Hp9lrLzltnL4k+ot5f5E28ZPuaPMicVkXQw8
	dErxCmOuIhQRvLyo1Bo8u2Or2QlTPqfOZ6Kpn7xJ6sQdXjIYYREDbji71TzJU5fhJHrzE9SI1sTk/
	Q9pbA6E4+McJXJw5QG9DCBvoEiRhC8Gd6yTwUgeZzjRao9jWi9uI205LdbVcpPDoi5JwidhSYqzSg
	7cBb0L5coR9YVEKweAAglwEslFwPx/iuI07JcrWckCzAL97kXd+zrpCJyd71N61dRnJX0VbKLZXT/
	RB9gPbhT4p+m0gNh0VqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llEjM-001Lcw-CU; Mon, 24 May 2021 17:51:08 +0000
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll7j0-000pYb-Ag
 for linux-riscv@lists.infradead.org; Mon, 24 May 2021 10:22:19 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0UZvuTug_1621851732; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UZvuTug_1621851732) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 24 May 2021 18:22:13 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] clk: sifive: Fix kernel-doc
Date: Mon, 24 May 2021 18:22:10 +0800
Message-Id: <1621851730-32287-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_032218_549445_28398A5F 
X-CRM114-Status: UNSURE (   6.92  )
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

Fix function name in sifive-prci.c kernel-doc comment
to remove a warning.

drivers/clk/sifive/sifive-prci.c:573: warning: expecting prototype for
sifive_prci_init(). Prototype was for sifive_prci_probe() instead

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/clk/sifive/sifive-prci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index 0d79ba3..80a288c 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -564,7 +564,7 @@ static int __prci_register_clocks(struct device *dev, struct __prci_data *pd,
 }
 
 /**
- * sifive_prci_init() - initialize prci data and check parent count
+ * sifive_prci_probe() - initialize prci data and check parent count
  * @pdev: platform device pointer for the prci
  *
  * Return: 0 upon success or a negative error code upon failure.
-- 
1.8.3.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
