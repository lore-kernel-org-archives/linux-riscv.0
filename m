Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBB8ECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 13:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BJtKIMNu6OOZPro4N+KVa9AZu5LnXfHem848Mfkc1yw=; b=qCrKBy3ysVy14J
	TZphW3eeJyo0zXGpC5hck9NHwAQSwr25EAliK7kBNXO+VgHxvDYZa2n3kOc2B3ZhNF0Bf/rqUUuq9
	Au+E81eDlP2otTwPzPbt9uU7eVHovwhdb0BDVoPMuEc/PcXC9VmcBo0tI8PROgtEcPolJG0csFro4
	5cIJ4jSqCcIK28bASEgQf72jbcyISzWLfDHfyYtzMk/N71tPqkD+/Z+hdaBrRlbxVZsA7am/BqrQU
	I1zp+2obW8t4tf2NGSfhkn31kNBHOiqMDPeMmKXAIC3GYjf5eQZXlheUBe7V850zNI5PlqqrWNw6Z
	4jZkLl5m8X7HVVnfhILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaGOn-00Bn2P-C3; Mon, 19 Sep 2022 13:01:21 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaGOj-00Bmxs-4g
	for linux-riscv@lists.infradead.org; Mon, 19 Sep 2022 13:01:18 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MWPpL3NndzmVBX;
	Mon, 19 Sep 2022 20:57:14 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 21:01:07 +0800
Received: from huawei.com (10.67.175.41) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 21:01:07 +0800
From: Yipeng Zou <zouyipeng@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <zanussi@kernel.org>,
	<mhiramat@kernel.org>, <liaochang1@huawei.com>, <chris.zjh@huawei.com>
CC: <zouyipeng@huawei.com>
Subject: [PATCH 0/2] fix kprobe event gen test module
Date: Mon, 19 Sep 2022 20:56:27 +0800
Message-ID: <20220919125629.238242-1-zouyipeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.175.41]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_060117_382683_A94AF726 
X-CRM114-Status: UNSURE (   4.77  )
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

Adapted to register names under arm and riscv, So that it can work on
arm, x86 and riscv.
In addition fix an para error on kretprobe remove in moudle exit.

Yipeng Zou (2):
  tracing: kprobe: fix kprobe event gen test module on exit
  tracing: kprobe: make gen test module work in arm and riscv

 kernel/trace/kprobe_event_gen_test.c | 49 +++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 5 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
