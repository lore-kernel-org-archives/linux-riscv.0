Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB62C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 16:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWyuk723+BzxlPHib7Pu4PIkF0pNoDkvUlbdvWvOUpY=; b=r3LbhvHBMdIOao
	0NGOGI/dMfeFY3HNyrnjrtPYaLEeqsoTnH9m80QUN5dU24yNjsICWF/QlDNiS6Pas6A0s+CPU8xCg
	c11zqnBbGrCW1RZEImhqxXIyq3B33PWiAZSfpftTel+zAu3qydvbKzvArR5JGg6sxH1/h7HcX7Pgf
	kgRdwpm69OnXxXywapgcaerxUqzyG7jMrWAhRFY13YZV4wthp6Y1USpn9eHcpStVmeqpX487YeEyq
	fu0bPektpZrvJYiwWY6UHahwaLluFWYDFoKyGUXUkVgRjVplGOY0JaN9M5mcph8DmNtYHQH0sEIDw
	UVlzyCOBvvb/Xme7w1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ryG-001umA-9G; Mon, 27 Jun 2022 16:52:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rx2-001u40-TS; Mon, 27 Jun 2022 16:51:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EED6E1763;
	Mon, 27 Jun 2022 09:51:03 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F0E193F792;
	Mon, 27 Jun 2022 09:51:01 -0700 (PDT)
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
Subject: [PATCH v5 03/19] cacheinfo: Add helper to access any cache index for a given CPU
Date: Mon, 27 Jun 2022 17:50:31 +0100
Message-Id: <20220627165047.336669-4-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627165047.336669-1-sudeep.holla@arm.com>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_095105_062897_F2A44DF4 
X-CRM114-Status: GOOD (  13.66  )
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

The cacheinfo for a given CPU at a given index is used at quite a few
places by fetching the base point for index 0 using the helper
per_cpu_cacheinfo(cpu) and offsetting it by the required index.

Instead, add another helper to fetch the required pointer directly and
use it to simplify and improve readability.

Link: https://lore.kernel.org/r/20220621192034.3332546-4-sudeep.holla@arm.com
Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/cacheinfo.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index b0bde272e2ae..e13ef41763e4 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -25,6 +25,8 @@ static DEFINE_PER_CPU(struct cpu_cacheinfo, ci_cpu_cacheinfo);
 #define ci_cacheinfo(cpu)	(&per_cpu(ci_cpu_cacheinfo, cpu))
 #define cache_leaves(cpu)	(ci_cacheinfo(cpu)->num_leaves)
 #define per_cpu_cacheinfo(cpu)	(ci_cacheinfo(cpu)->info_list)
+#define per_cpu_cacheinfo_idx(cpu, idx)		\
+				(per_cpu_cacheinfo(cpu) + (idx))
 
 struct cpu_cacheinfo *get_cpu_cacheinfo(unsigned int cpu)
 {
@@ -172,7 +174,7 @@ static int cache_setup_of_node(unsigned int cpu)
 	}
 
 	while (index < cache_leaves(cpu)) {
-		this_leaf = this_cpu_ci->info_list + index;
+		this_leaf = per_cpu_cacheinfo_idx(cpu, index);
 		if (this_leaf->level != 1)
 			np = of_find_next_cache_node(np);
 		else
@@ -231,7 +233,7 @@ static int cache_shared_cpu_map_setup(unsigned int cpu)
 	for (index = 0; index < cache_leaves(cpu); index++) {
 		unsigned int i;
 
-		this_leaf = this_cpu_ci->info_list + index;
+		this_leaf = per_cpu_cacheinfo_idx(cpu, index);
 		/* skip if shared_cpu_map is already populated */
 		if (!cpumask_empty(&this_leaf->shared_cpu_map))
 			continue;
@@ -242,7 +244,7 @@ static int cache_shared_cpu_map_setup(unsigned int cpu)
 
 			if (i == cpu || !sib_cpu_ci->info_list)
 				continue;/* skip if itself or no cacheinfo */
-			sib_leaf = sib_cpu_ci->info_list + index;
+			sib_leaf = per_cpu_cacheinfo_idx(i, index);
 			if (cache_leaves_are_shared(this_leaf, sib_leaf)) {
 				cpumask_set_cpu(cpu, &sib_leaf->shared_cpu_map);
 				cpumask_set_cpu(i, &this_leaf->shared_cpu_map);
@@ -258,12 +260,11 @@ static int cache_shared_cpu_map_setup(unsigned int cpu)
 
 static void cache_shared_cpu_map_remove(unsigned int cpu)
 {
-	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	struct cacheinfo *this_leaf, *sib_leaf;
 	unsigned int sibling, index;
 
 	for (index = 0; index < cache_leaves(cpu); index++) {
-		this_leaf = this_cpu_ci->info_list + index;
+		this_leaf = per_cpu_cacheinfo_idx(cpu, index);
 		for_each_cpu(sibling, &this_leaf->shared_cpu_map) {
 			struct cpu_cacheinfo *sib_cpu_ci;
 
@@ -274,7 +275,7 @@ static void cache_shared_cpu_map_remove(unsigned int cpu)
 			if (!sib_cpu_ci->info_list)
 				continue;
 
-			sib_leaf = sib_cpu_ci->info_list + index;
+			sib_leaf = per_cpu_cacheinfo_idx(sibling, index);
 			cpumask_clear_cpu(cpu, &sib_leaf->shared_cpu_map);
 			cpumask_clear_cpu(sibling, &this_leaf->shared_cpu_map);
 		}
@@ -609,7 +610,6 @@ static int cache_add_dev(unsigned int cpu)
 	int rc;
 	struct device *ci_dev, *parent;
 	struct cacheinfo *this_leaf;
-	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	const struct attribute_group **cache_groups;
 
 	rc = cpu_cache_sysfs_init(cpu);
@@ -618,7 +618,7 @@ static int cache_add_dev(unsigned int cpu)
 
 	parent = per_cpu_cache_dev(cpu);
 	for (i = 0; i < cache_leaves(cpu); i++) {
-		this_leaf = this_cpu_ci->info_list + i;
+		this_leaf = per_cpu_cacheinfo_idx(cpu, i);
 		if (this_leaf->disable_sysfs)
 			continue;
 		if (this_leaf->type == CACHE_TYPE_NOCACHE)
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
