Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266E5C4151A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 01:52:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9EF921917
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 01:52:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m3IHA7dS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="H4Xbceq6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9EF921917
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f6UQjBouwxU9jU0zZbzH7OOBbz7t9M0eixYqVBQtTrY=; b=m3IHA7dScHoSd1mi/eVEsrWsnl
	/f8ldKdzKYQlYkCq70e66Ol0snPZoZGmb8/2bQYL8XQI0DXN30XiN74z+o8MOdO3rz+wsTD2i+9Lx
	tZ1RPuHWRso6hj7SbFATif4UK8eqItzf/J3pyaq3HaJYrAm4M00uXc/LKV4OkcC+t2VYxNKD+u/85
	JX6G8MZqnv1+gC5xHAuE9c1mrdh6hW7I83VneB+AM5fnHcC+kVzL5rHVIxOj63mAJZye1B1bxsE0W
	RTisvNyxwn00p/otMFmVxG2WzpQ8hCZVuphKWYnD0DIOTNgGrSrxLrHgkkwiA721zm5JDUgIYzuvb
	vA4o0QVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grvKg-0002jJ-Bi; Fri, 08 Feb 2019 01:51:58 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grvKZ-0002Yr-E3
 for linux-riscv@lists.infradead.org; Fri, 08 Feb 2019 01:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549590711; x=1581126711;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=yFxyFB1JVE6e5EMBaqk5nHsWdldjjgWU0zDphOBw+f8=;
 b=H4Xbceq6EyGIb+JfN5v3yLpnjtDwdt9gMxzgfCF8H/aQs5wj0UO1nn2W
 r/C4s41JwMTs5yNdMkRZ7/CLpWCBkSEQdL1Gb0PYvCY5OYXc2YQ5Tp0AN
 GaQczfVXmQggte2J0V9nGRI8GTZtG0hWAQPZOn9axLnNqeReUcl/ZJDhC
 WgpZmv4pEvmh4wfina3VWeYESstfWK7SCSU5EIXMNZqNkUgogRJs73Tgu
 CI0RGS90NqeAfkyvJFFey+WPULqtnXjHRvGA1SBVHaCfbofgpGR5XPZzc
 eVUCnb8rU7lm2hJKZejRNVNg58J8S8hpCKx5RMsSykSDfhi/uXF5oUwrc Q==;
X-IronPort-AV: E=Sophos;i="5.58,346,1544457600"; d="scan'208";a="102533286"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2019 09:51:37 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 07 Feb 2019 17:30:20 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2019 17:51:37 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v3 PATCH 7/8] irqchip/irq-sifive-plic:: Check and continue in case
 of an invalid cpuid.
Date: Thu,  7 Feb 2019 17:51:20 -0800
Message-Id: <1549590681-24125-8-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
References: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_175151_669387_D5812421 
X-CRM114-Status: GOOD (  10.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?Patrick=20St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Zong Li <zongbox@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

riscv_hartid_to_cpuid can return invalid cpuid for a hart
that is present in DT but was never brought up.

Print the appropriate warning message and continue.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/irqchip/irq-sifive-plic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 357e9daf..254ecd76 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -237,6 +237,11 @@ static int __init plic_init(struct device_node *node,
 		}
 
 		cpu = riscv_hartid_to_cpuid(hartid);
+		if (cpu < 0) {
+			pr_warn("Invalid cpuid for context %d\n", i);
+			continue;
+		}
+
 		handler = per_cpu_ptr(&plic_handlers, cpu);
 		handler->present = true;
 		handler->ctxid = i;
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
