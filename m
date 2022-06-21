Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB7AC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 19:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXlMou/WYkjb70uDXX0S5L9lUVd5FHiUXzUSZD3Ch+U=; b=skID8qctnygHcB
	4Ck501BvVw6EyfTK7xn+fI9JIvVnWqddZGT7fA/0+JWstRrx5+UecPPZ8JS3BGsWQP5Dh4KBFTB4y
	0lYtjVfksWHYJXVpZze2SJxLATYB/V27UmM9FktP/Eqdi8BbjbCiQ650kzdAkDPLu8Vk1QldfjtIM
	xxM6EyaEeIjH/y0xqpiw5gdlTgmlwcVfbWBlRdhiQ1U8zzpV6yCMDvfg5pHerOlOU2xpzoh2fpy8N
	d6l6V+DoQb4ThogM/DSifGPDlCU9fUiuKqO8rVyr6G37goaNZ4CTgvzDEFJQBwOkoJ76JYvP2S1z1
	LGdWLX4dv23ZP9+d+EPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3jVp-006r0t-Vn; Tue, 21 Jun 2022 19:26:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3jR0-006o87-HU; Tue, 21 Jun 2022 19:21:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B154165C;
	Tue, 21 Jun 2022 12:21:09 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4ABE63F792;
	Tue, 21 Jun 2022 12:21:07 -0700 (PDT)
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
Subject: [PATCH v4 11/20] arch_topology: Drop LLC identifier stash from the CPU topology
Date: Tue, 21 Jun 2022 20:20:25 +0100
Message-Id: <20220621192034.3332546-12-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621192034.3332546-1-sudeep.holla@arm.com>
References: <20220621192034.3332546-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_122110_672631_D8AE48E0 
X-CRM114-Status: UNSURE (   9.13  )
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

Since the cacheinfo LLC information is used directly in arch_topology,
there is no need to parse and store the LLC ID information only for
ACPI systems in the CPU topology.

Remove the redundant LLC ID from the generic CPU arch_topology information.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/arch_topology.c  | 1 -
 include/linux/arch_topology.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index c314c7064397..b63cc52e12ce 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -752,7 +752,6 @@ void __init reset_cpu_topology(void)
 		cpu_topo->core_id = -1;
 		cpu_topo->cluster_id = -1;
 		cpu_topo->package_id = -1;
-		cpu_topo->llc_id = -1;
 
 		clear_cpu_topology(cpu);
 	}
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index 58cbe18d825c..a07b510e7dc5 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -68,7 +68,6 @@ struct cpu_topology {
 	int core_id;
 	int cluster_id;
 	int package_id;
-	int llc_id;
 	cpumask_t thread_sibling;
 	cpumask_t core_sibling;
 	cpumask_t cluster_sibling;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
