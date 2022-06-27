Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A99C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 16:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHmtrEmPuqJJeFZwsW7qG9xlu7DVIrrmvnv47CqdBGY=; b=dXfKAryuhYxA52
	BH5A5773/4Dc7hVcgA4qjwlsOzdoi44vw4vfzLZhy6cyWCB98//EngT7JU2pX0pEE3Og60MG3ESqg
	mgGhmr93GUPi7dIzbmMbiOU9NQZvKvxk6jNo3JFr/m2G14mtv4sKTQ6iBMJBDhER8VTefodrIkLqH
	mlbVwqwmXJIdv/ovhZ6aSBPTFCC3/YZWK+dLAASvjQYaxOeu4DsoL494HNvZ1HTVBUBytN/zISdIQ
	yIH9VyC4lUL+o5FpxsRk6tlWiDT/D6ieAatMi2mrx3erXvT9N9Ar1SOG67dOC4F6FCmK+4r4AQU2n
	3TF+IA1w9VwOUSA+4QFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ryr-001v8z-Na; Mon, 27 Jun 2022 16:52:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rx6-001u40-RI; Mon, 27 Jun 2022 16:51:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E18AD175A;
	Mon, 27 Jun 2022 09:51:07 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E53FD3F792;
	Mon, 27 Jun 2022 09:51:05 -0700 (PDT)
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
Subject: [PATCH v5 05/19] cacheinfo: Add support to check if last level cache(LLC) is valid or shared
Date: Mon, 27 Jun 2022 17:50:33 +0100
Message-Id: <20220627165047.336669-6-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627165047.336669-1-sudeep.holla@arm.com>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_095109_007904_EB7115C6 
X-CRM114-Status: GOOD (  12.89  )
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

It is useful to have helper to check if the given two CPUs share last
level cache. We can do that check by comparing fw_token or by comparing
the cache ID. Currently we check just for fw_token as the cache ID is
optional.

This helper can be used to build the llc_sibling during arch specific
topology parsing and feeding information to the sched_domains. This also
helps to get rid of llc_id in the CPU topology as it is sort of duplicate
information.

Also add helper to check if the llc information in cacheinfo is valid
or not.

Link: https://lore.kernel.org/r/20220621192034.3332546-6-sudeep.holla@arm.com
Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/cacheinfo.c  | 26 ++++++++++++++++++++++++++
 include/linux/cacheinfo.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 2cea9201f31c..fdc1baa342f1 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -47,6 +47,32 @@ static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
 	return sib_leaf->fw_token == this_leaf->fw_token;
 }
 
+bool last_level_cache_is_valid(unsigned int cpu)
+{
+	struct cacheinfo *llc;
+
+	if (!cache_leaves(cpu))
+		return false;
+
+	llc = per_cpu_cacheinfo_idx(cpu, cache_leaves(cpu) - 1);
+
+	return !!llc->fw_token;
+}
+
+bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y)
+{
+	struct cacheinfo *llc_x, *llc_y;
+
+	if (!last_level_cache_is_valid(cpu_x) ||
+	    !last_level_cache_is_valid(cpu_y))
+		return false;
+
+	llc_x = per_cpu_cacheinfo_idx(cpu_x, cache_leaves(cpu_x) - 1);
+	llc_y = per_cpu_cacheinfo_idx(cpu_y, cache_leaves(cpu_y) - 1);
+
+	return cache_leaves_are_shared(llc_x, llc_y);
+}
+
 #ifdef CONFIG_OF
 /* OF properties to query for a given cache type */
 struct cache_type_info {
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 4ff37cb763ae..7e429bc5c1a4 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -82,6 +82,8 @@ struct cpu_cacheinfo *get_cpu_cacheinfo(unsigned int cpu);
 int init_cache_level(unsigned int cpu);
 int populate_cache_leaves(unsigned int cpu);
 int cache_setup_acpi(unsigned int cpu);
+bool last_level_cache_is_valid(unsigned int cpu);
+bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y);
 #ifndef CONFIG_ACPI_PPTT
 /*
  * acpi_find_last_cache_level is only called on ACPI enabled
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
