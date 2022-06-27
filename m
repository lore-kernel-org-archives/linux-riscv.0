Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5176DC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 16:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWFF+j1Fe2zj36qxC1hdRBvq768Yw222DqDY3jpk2ng=; b=XVoGUIpL6s2kkc
	033W6gHryV3u7wh9raJXlmDg0Y5M/5KGC9AKRA1Y4AzDsKN32ou8s+ar14PDSKf8s/hp/RdRgaE1L
	2FgIV1B26SaIje8yPPQeLYsylObNhN3EG1URr1eKbXWBb+UeUeT6F9IG3EQ9fKfktF2Xgh1dUf6xK
	QUt30LNgmVL38s7fW0xnuQFI1e4sZya6F/bHnB7XHTTBKh755ehQUUAMHoPQGsj0eKmOoxxo83Ry0
	DnhTiB8bqF247mZ2I3DO36zEubewF7p/fEAWu4B88q/RF+heXlqws1XciGsMhytaF4uMXhuoc96Vr
	RjSYu4GbOSvz96Lh0mVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5s0k-001wEe-Su; Mon, 27 Jun 2022 16:54:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rxL-001uC1-Ei; Mon, 27 Jun 2022 16:51:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBF55175A;
	Mon, 27 Jun 2022 09:51:21 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CFDD63F792;
	Mon, 27 Jun 2022 09:51:19 -0700 (PDT)
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
Subject: [PATCH v5 12/19] arch_topology: Set thread sibling cpumask only within the cluster
Date: Mon, 27 Jun 2022 17:50:40 +0100
Message-Id: <20220627165047.336669-13-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627165047.336669-1-sudeep.holla@arm.com>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_095123_591810_710AA5A3 
X-CRM114-Status: GOOD (  12.48  )
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

Currently the cluster identifier is not set on the DT based platforms.
The reset or default value is -1 for all the CPUs. Once we assign the
cluster identifier values correctly that may result in getting the thread
siblings wrong as the core identifiers can be same for 2 different CPUs
belonging to 2 different cluster.

So, in order to get the thread sibling cpumasks correct, we need to
update them only if the cores they belong are in the same cluster within
the socket. Let us skip updation of the thread sibling cpumaks if the
cluster identifier doesn't match.

This change won't affect even if the cluster identifiers are not set
currently but will avoid any breakage once we set the same correctly.

Link: https://lore.kernel.org/r/20220621192034.3332546-13-sudeep.holla@arm.com
Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/arch_topology.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index b63cc52e12ce..7a5ff1ea5f00 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -708,15 +708,17 @@ void update_siblings_masks(unsigned int cpuid)
 		if (cpuid_topo->package_id != cpu_topo->package_id)
 			continue;
 
-		if (cpuid_topo->cluster_id == cpu_topo->cluster_id &&
-		    cpuid_topo->cluster_id != -1) {
+		cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
+		cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
+
+		if (cpuid_topo->cluster_id != cpu_topo->cluster_id)
+			continue;
+
+		if (cpuid_topo->cluster_id != -1) {
 			cpumask_set_cpu(cpu, &cpuid_topo->cluster_sibling);
 			cpumask_set_cpu(cpuid, &cpu_topo->cluster_sibling);
 		}
 
-		cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
-		cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
-
 		if (cpuid_topo->core_id != cpu_topo->core_id)
 			continue;
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
