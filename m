Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9F9C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 19:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uy5Wje3F2MZly0Gs7SxE939i6MigM7CmOdIW39mA47g=; b=H6uwk7/0Zbx6QY
	j3pOCudQOynU6y1SXmb0bF6sgF3ZW6ZOoAGcQIoAGmLuXQr3QIw59/x/nd/TmONz+e381mNpkE41W
	yeL+0cO84KBmuUVA3vHNMxg563tL2MKWiFTWwgMNIfVXgXlZg46QWQsEm8/eQoq8AxXO3JjfLpN7/
	mAfr4PoUhphKcLBUskCvp9Oh8h1lJl6lNJkfWPNJvxCbJ0ljRzIW/E84OdmOvNZfL6aGAzwpsypoa
	kT6nWup3kLpZIpHSdMSniH2g+EzaJJdyMZjlrOKCA/iF6HZXROGEhjAWKv1AePzJLXsyo2Ne9fyZ4
	U5kEpXgrBodpC7b0AFFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3jVD-006qeQ-JM; Tue, 21 Jun 2022 19:25:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3jQy-006o7J-P4; Tue, 21 Jun 2022 19:21:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D46D1688;
	Tue, 21 Jun 2022 12:21:07 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 008833F792;
	Tue, 21 Jun 2022 12:21:04 -0700 (PDT)
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
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v4 10/20] arm64: topology: Remove redundant setting of llc_id in CPU topology
Date: Tue, 21 Jun 2022 20:20:24 +0100
Message-Id: <20220621192034.3332546-11-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621192034.3332546-1-sudeep.holla@arm.com>
References: <20220621192034.3332546-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_122108_904160_485562B7 
X-CRM114-Status: GOOD (  10.46  )
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
there is no need to parse and fetch the LLC ID information only for
ACPI systems.

Just drop the redundant parsing and setting of llc_id in CPU topology
from ACPI PPTT.

Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm64/kernel/topology.c | 14 --------------
 1 file changed, 14 deletions(-)

Hi Will/Catalin,

This is part of a series updating topology to get both ACPI and DT view
aligned. I have not cc-ed you assuming you won't be interested. Let me
know if you are. The parts affecting arm64 is just this patch removing
some unnecessary ACPI code that is now moved to core arch_topology.c

Please ack if you are happy with this and OK to take this as part of the
series.

Regards,
Sudeep

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 9ab78ad826e2..869ffc4d4484 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -89,8 +89,6 @@ int __init parse_acpi_topology(void)
 		return 0;
 
 	for_each_possible_cpu(cpu) {
-		int i, cache_id;
-
 		topology_id = find_acpi_cpu_topology(cpu, 0);
 		if (topology_id < 0)
 			return topology_id;
@@ -107,18 +105,6 @@ int __init parse_acpi_topology(void)
 		cpu_topology[cpu].cluster_id = topology_id;
 		topology_id = find_acpi_cpu_topology_package(cpu);
 		cpu_topology[cpu].package_id = topology_id;
-
-		i = acpi_find_last_cache_level(cpu);
-
-		if (i > 0) {
-			/*
-			 * this is the only part of cpu_topology that has
-			 * a direct relationship with the cache topology
-			 */
-			cache_id = find_acpi_cpu_cache_topology(cpu, i);
-			if (cache_id > 0)
-				cpu_topology[cpu].llc_id = cache_id;
-		}
 	}
 
 	return 0;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
