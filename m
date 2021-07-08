Return-Path: <SRS0=GvX2=MA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0316C07E95
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 01:53:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92B6A61C9A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 01:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92B6A61C9A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PT6dU9Tvow7K1Z4ekdnZVqOtIPPpa3zvHaPLQjQuNwI=; b=qTpahhp+vPF58W
	dEZ9Ul4myZwxfJVh/YT3frv/i75ZECDEUG9/ZyKDyFANVBU9aNzM5/CYi+qm6cX8borZGbbGao/18
	YRqBWJ8AUbVd13eoS6uCY5AM+qRlB0aD1aJNRQ/AEVMo88YvD+E/S6Yb8PHfplJ2j1pbhi6xDIT8X
	8UqmmspjlRQdp3xve7zIyRzCWMMDyJCFyha2HygHAVf47XCYnIPDMuBpOW/7huwUc9GLo1X/5Ziuc
	xOZ1y/W/zTJn5kaeEsgLldSkDUWv9WbCC8CqMIhcHaRIXApCxWLiTEc6KSb9Qiw0Bv/dBDqAwkPa3
	Nh/wUKT/B80JGMJ22BEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1JDd-00Fx2R-Du; Thu, 08 Jul 2021 01:52:49 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1JDZ-00Fx0t-Vi
 for linux-riscv@lists.infradead.org; Thu, 08 Jul 2021 01:52:47 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GKzjc4ZBPz796T;
 Thu,  8 Jul 2021 09:49:08 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Jul 2021 09:52:36 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Jul 2021 09:52:36 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <palmerdabbelt@google.com>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>
CC: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH 0/3] riscv: Enable some feature for RISCV
Date: Thu, 8 Jul 2021 09:59:46 +0800
Message-ID: <20210708015949.20076-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_185246_247163_22D9BF49 
X-CRM114-Status: UNSURE (   3.91  )
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

Enable IRQ_FORCED_THREADING, GENERIC_IDLE_POLL_SETUP,
GENERIC_IRQ_SHOW_LEVEL for RISCV.

Kefeng Wang (3):
  riscv: Allow forced irq threading
  riscv: Enable idle generic idle loop
  riscv: Enable GENERIC_IRQ_SHOW_LEVEL

 arch/riscv/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
