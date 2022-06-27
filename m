Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B021CCA473
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 16:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Blrxrrq1aauUAhlb7Co3+eemEnv41FleRbEK1sHOf4U=; b=LdHhKgBPJF3uBW
	IleDgaQ9/UmIVwTBI/cs8owawys9q5eM94kJoR1sA4d4XCn/TXno4eUFKqeapwdr/g8F6YTqK9/u3
	mgko4qRM374JnlFp/3oeNUHJzs1P59pOc8tnGjh10Bk600Boi8+dTC9NIvkxZXo5UJypRfEn676PG
	RRMJvjtNhOu5933JPZxhaTKeXuH+05rSX/DQvDqrzytsCLQjg9DGbxOn4jJd4+WXQfhwiNTBXF8uh
	aWLphatpj9ueUYgemBMqU0UJJ2cQ7ZuapCAHv7tiHT7WpaxWlHAYW/Vq5VdO5w3buVKCg/IpWwUpq
	lV0GTwu3TZ1ktlo3Hjuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5s0X-001w5d-6T; Mon, 27 Jun 2022 16:54:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rxI-001uC1-JC; Mon, 27 Jun 2022 16:51:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D24581758;
	Mon, 27 Jun 2022 09:51:19 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D64E43F792;
	Mon, 27 Jun 2022 09:51:17 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: [PATCH v5 11/19] arch_topology: Drop LLC identifier stash from the CPU topology
Date: Mon, 27 Jun 2022 17:50:39 +0100
Message-Id: <20220627165047.336669-12-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627165047.336669-1-sudeep.holla@arm.com>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_095120_740695_AEE24D1A 
X-CRM114-Status: UNSURE (   9.52  )
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

Remove the redundant LLC ID from the generic CPU arch_topology
information.

Link: https://lore.kernel.org/r/20220621192034.3332546-12-sudeep.holla@arm.com
Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>
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
