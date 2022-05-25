Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FAFC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 08:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYM1PJzgQaZWz70VbYSmwLVyqsCgNDfJn147UUx8cC8=; b=0fCL3MNDmVQwUi
	maKpHwHZoaPkdEHynx3rdBHLPoJEFGfwePGTgS+qdjTeyF0LNYmjSJ6RzBAG0/YwpULcLOuI3YSqR
	5gCdjDrUDInLlghPR1w01bvAD+Jtl1LivKS4I8C7SALl4zsWBMJ5xLrQF2u2L8wpMnz3QfxHHuTbm
	wDCW09yRGcbci0NlLzCz815Rw6eC0cSk74h/DzhG81C8KBXfoDaPEc0rm7RYJ+7nUL/pRmEDglJpm
	qUmfxgWzZG80UdUNHjta0juW7GGD4vIis1jaCOTXs3i7/6Le+eFfG6DWlKZdxfJqwb21C+2Y9GQay
	0wV+Ds0jUU+JLPjOERxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntmAk-00AIf3-L1; Wed, 25 May 2022 08:15:14 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntmA8-00AIO4-Rl; Wed, 25 May 2022 08:14:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3E361042;
 Wed, 25 May 2022 01:14:35 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 427F33F73D;
 Wed, 25 May 2022 01:14:34 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, Atish Patra <atishp@atishpatra.org>,
 Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Qing Wang <wangqing@vivo.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 02/16] cacheinfo: Add helper to access any cache index for
 a given CPU
Date: Wed, 25 May 2022 09:14:02 +0100
Message-Id: <20220525081416.3306043-3-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525081416.3306043-2-sudeep.holla@arm.com>
References: <20220525081416.3306043-1-sudeep.holla@arm.com>
 <20220525081416.3306043-2-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_011437_028940_EC5B3AE4 
X-CRM114-Status: GOOD (  13.30  )
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
per_cpu_cacheinfo(cpu) and offseting it by the required index.

Instead, add another helper to fetch the required pointer directly and
use it to simplify and improve readability.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/cacheinfo.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index b0bde272e2ae..c4547d8ac6f3 100644
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
