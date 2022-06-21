Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0573DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 19:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/EupI9UFGVxvQwcoY9ZGGs0k0oHcmqJJ4LBP3pWmNw=; b=exJ2nkzuAvgseR
	9TCKQmTGkEa6T/K7GJgifjlhi2je10aaFyK6VMzZUOXEQYxGeH9JfmAbSCSxGiTeN2CzIK0xm1kWG
	HSKzn2ao27/kWiA+Vq3cyy+g1ul3DBaTz/A2ePJlISMNvzyAAeVUGADTa+udtfp5VDW0JcMOKTbS+
	XPQXV3MCIiemVfa2POlzx5Ukx1S5r216+6GBJv8+mg0U5IaymLLOc5/LdlmmLWFDXlVZMWcMFky+b
	fewHZaFrPOH1ISgoH2FR3okGCBKgz6I4dNi6Ul/jBeXiX6U9mwD2620hYwb7qWVQy4Dz1pvAaOKqQ
	DBQWfnl3OS4HO2mmIyjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3jQu-006o62-W2; Tue, 21 Jun 2022 19:21:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3jQi-006o1F-HP; Tue, 21 Jun 2022 19:20:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B4D9168F;
	Tue, 21 Jun 2022 12:20:50 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 62B853F792;
	Tue, 21 Jun 2022 12:20:48 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Atish Patra <atishp@atishpatra.org>,
	Atish Patra <atishp@rivosinc.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>,
	Rob Herring <robh+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v4 02/20] cacheinfo: Use of_cpu_device_node_get instead cpu_dev->of_node
Date: Tue, 21 Jun 2022 20:20:16 +0100
Message-Id: <20220621192034.3332546-3-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621192034.3332546-1-sudeep.holla@arm.com>
References: <20220621192034.3332546-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_122052_688144_5043E94C 
X-CRM114-Status: GOOD (  12.15  )
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

The of_cpu_device_node_get takes care of fetching the CPU'd device node
either from cached cpu_dev->of_node if cpu_dev is initialised or uses
of_get_cpu_node to parse and fetch node if cpu_dev isn't available yet.

Just use of_cpu_device_node_get instead of getting the cpu device first
and then using cpu_dev->of_node for two reasons:
1. There is no other use of cpu_dev and can be simplified
2. It enabled the use detect_cache_attributes and hence cache_setup_of_node
   much earlier before the CPUs are registered as devices.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/cacheinfo.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index dad296229161..b0bde272e2ae 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -14,7 +14,7 @@
 #include <linux/cpu.h>
 #include <linux/device.h>
 #include <linux/init.h>
-#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/smp.h>
@@ -157,7 +157,6 @@ static int cache_setup_of_node(unsigned int cpu)
 {
 	struct device_node *np;
 	struct cacheinfo *this_leaf;
-	struct device *cpu_dev = get_cpu_device(cpu);
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	unsigned int index = 0;
 
@@ -166,11 +165,7 @@ static int cache_setup_of_node(unsigned int cpu)
 		return 0;
 	}
 
-	if (!cpu_dev) {
-		pr_err("No cpu device for CPU %d\n", cpu);
-		return -ENODEV;
-	}
-	np = cpu_dev->of_node;
+	np = of_cpu_device_node_get(cpu);
 	if (!np) {
 		pr_err("Failed to find cpu%d device node\n", cpu);
 		return -ENOENT;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
