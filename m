Return-Path: <SRS0=66UJ=IV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCC7C433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Mar 2021 01:39:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0DEA61934
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Mar 2021 01:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0DEA61934
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uhvmvsMSC0OMoeAhEgU9sPVeVn8rsBeWk9XiuKeocYg=; b=c6eU9g9yf96GFuyifUdR8YGyDh
	VMyfDpFe0I9XcCmd86Xd8SDCnf4CCX9In6pSde9sdiC5GZokTH9W03mGR8Cfmw//TT3f7N8DeEVxs
	BdQlcy8tfjO/t3RVlFmk8IHqYBACC9bCE603xO8S6tjWa9RcL/jVbnhRMor1seWaMC2FjmThR9oIV
	yuGpVEedyaCdEbveJiqWRwa9pMW4YTG8Hc0GUm2ZvXTD7GSFqUr1+Ayh7kEnQUzs5GBzWu4EDPGVD
	VCkqU3spguW+HVe9fwQo+x+qgBc2vfrcy3iy9aba9hSOw+qAQn/8v89xaLTqx61Dr8xT8v35R7oq6
	k3hpAqjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOVzo-00DFpb-8S; Tue, 23 Mar 2021 01:38:12 +0000
Received: from mail-m17637.qiye.163.com ([59.111.176.37])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOVze-00DFmQ-VO
 for linux-riscv@lists.infradead.org; Tue, 23 Mar 2021 01:38:06 +0000
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
 by mail-m17637.qiye.163.com (Hmail) with ESMTPA id 21B629801E7;
 Tue, 23 Mar 2021 09:37:48 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-riscv@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kael_w@yeah.net,
	Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] drivers: pinctrl: Remove duplicate include of io.h
Date: Tue, 23 Mar 2021 09:37:27 +0800
Message-Id: <20210323013727.135571-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTklDTE9DSUgdQ0lLVkpNSk1PTUhPTUNPT0hVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MSI6Djo*Oj8SAjoaARYOGCwD
 IxgwC0lVSlVKTUpNT01IT01CSE9IVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFKTkJPNwY+
X-HM-Tid: 0a785cbb1739d992kuws21b629801e7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_013803_339707_C1ED3172 
X-CRM114-Status: UNSURE (   6.26  )
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

linux/io.h has been included at line 6, so remove the 
duplicate include at line 18.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/pinctrl/pinctrl-k210.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index 8a733cf77ba0..f831526d06ff 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -15,7 +15,6 @@
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
-#include <linux/io.h>
 
 #include <dt-bindings/pinctrl/k210-fpioa.h>
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
