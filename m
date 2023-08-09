Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38584EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 08:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XpdUzzJqETeGdUZs2YLX+ASyvoxqFSTq+q5pJdzy2+U=; b=yimCTK37ann8OW
	qH013xpf46Lfez8QuQmDWaxaqLVNbN4y8RHrxWRDvsyXoEnrrUcffJCMreXdWES7H0oak0CljvAa7
	lnx/SPXjJLFdOl+0YYMm6MV/ks6wYAuZyB+Dr6ZNTAFvfLXEFxaHdpnrD4gM/Bqg7XxMJNcJG0smB
	+E83aoE+4B1Q9VEN7XlbzQGmW5E3kFohriSBQ7mZGYy5X07+ztV7fFuVscDOE9WIkr+/K6NxWfHJ0
	fGygDs/NTFJ+4lPW37Vqz/al/5b6GSkVUUgrF7Qds70lkHazJiuWuN+H0xSleRYT1mgKF/lJWD/qd
	9OLcSKkKRLmyKef7jn/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTezO-004Pcj-2V;
	Wed, 09 Aug 2023 08:56:22 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTezL-004Pc4-0u
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 08:56:21 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RLP2j2VHBz9tmL;
	Wed,  9 Aug 2023 16:52:45 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 9 Aug
 2023 16:56:13 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<ilpo.jarvinen@linux.intel.com>, <richard.genoud@gmail.com>,
	<samuel.holland@sifive.com>, <frank.li@vivo.com>,
	<linux-serial@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] serial: sifive: Remove redundant of_match_ptr()
Date: Wed, 9 Aug 2023 16:55:41 +0800
Message-ID: <20230809085541.2969654-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_015619_529162_D81AC559 
X-CRM114-Status: UNSURE (   9.77  )
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

The driver depends on CONFIG_OF, it is not necessary to use
of_match_ptr() here.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/tty/serial/sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 3ac9fbd0226e..e2efc3f84eff 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -1031,7 +1031,7 @@ static struct platform_driver sifive_serial_platform_driver = {
 	.remove		= sifive_serial_remove,
 	.driver		= {
 		.name	= SIFIVE_SERIAL_NAME,
-		.of_match_table = of_match_ptr(sifive_serial_of_match),
+		.of_match_table = sifive_serial_of_match,
 	},
 };
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
