Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BF1C433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 13:24:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 565D8619C0
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 13:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 565D8619C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XEPSwM8SELm9Ws5TUG0FB/kAZ4l2Q49gHtRU9/rqjEQ=; b=m7XcU6992h5YT0Kb+NyHbKydZW
	+DC7lHWAGJKAop9i4AMN4f6SIEVkcyTz9NBBcFozjABqrJbzDM0T0QAVuTb1Fp2+bVO664MxJCc+n
	kzocQp779JaYT5uXQvyVHW7RLjlkryyoxwGZcmyi8eTnd0d4gdT/Bcf8Z1LRlr4KlHh3sOoGTUESy
	UntfAcI2KC7cMoyYAIwvaOKKkUZXhIb9RIqmJrUwm4CctcD2BDtCGhr3WFRazQoQFgK+6LU9KtKlv
	BwbPEkD4uaGAIw8axQXIR7FXoUxNrvMWsbvzdpZxGH4nYPAEsN72oWknffcJOm+JcgPkOkPhX3Uts
	xcw/mwNA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lREMF-003pSQ-JH; Tue, 30 Mar 2021 13:24:35 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lREMB-003pRf-4I
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 13:24:33 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F8qr25ZdfznTqV;
 Tue, 30 Mar 2021 21:22:42 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Tue, 30 Mar 2021 21:24:16 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: <linux-riscv@lists.infradead.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, <atish.patra@wdc.com>,
 <palmerdabbelt@google.com>, <akpm@linux-foundation.org>, Atish Patra
 <atishp@atishpatra.org>, Kefeng Wang <wangkefeng.wang@huawei.com>, "kernel
 test robot" <lkp@intel.com>
Subject: [PATCH] riscv: Make NUMA depend on MMU
Date: Tue, 30 Mar 2021 21:25:31 +0800
Message-ID: <20210330132531.67706-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_142431_716586_D5D26D29 
X-CRM114-Status: UNSURE (   9.81  )
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

NUMA is useless when NOMMU, and it leads some build error,
make it depend on MMU.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0368453adc30..958676c6d5ce 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -317,7 +317,7 @@ endchoice
 # Common NUMA Features
 config NUMA
 	bool "NUMA Memory Allocation and Scheduler Support"
-	depends on SMP
+	depends on SMP && MMU
 	select GENERIC_ARCH_NUMA
 	select OF_NUMA
 	select ARCH_SUPPORTS_NUMA_BALANCING
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
