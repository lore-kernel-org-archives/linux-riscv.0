Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8C9C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 19:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXiLlPVgJFKS7pe0JMrpriUUp597SjTqmD1CuYCd8/Q=; b=0V3kf6pqXtF6ff
	+CGy/UgsZKdytktyYWjMCpTSViDJKved+AQ9bTZnsMmnWrIysD27VSbGg5eg3QrRXPAYm/I+IOhzU
	PZ6EUsbzT3nz02KXeZZC4TlYR0rZHpC+4NxsBLv4I/62DKo3/EOze9bKDR9vJmcaJUO5f+yOHWZ4F
	dwd8eealS5OygItN06/CqkNlFyKn5T4bGqDJJEmZ42OwyWEVt8fgyiNdS4CJD8S8I/jNQLQ77SP2i
	t7IDAPKptLP3b9wekhbKLBIDzbmvapLYHdyRBiEZssZopU4LJfFLkt33P7Y697oCtiHbB52FjsRh7
	o/QKYUhmWOgQUVy0v6mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3jTo-006pkv-KC; Tue, 21 Jun 2022 19:24:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3jQs-006o3q-BB; Tue, 21 Jun 2022 19:21:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B878A168F;
	Tue, 21 Jun 2022 12:21:00 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CB7223F792;
	Tue, 21 Jun 2022 12:20:58 -0700 (PDT)
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
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 07/20] cacheinfo: Use cache identifiers to check if the caches are shared if available
Date: Tue, 21 Jun 2022 20:20:21 +0100
Message-Id: <20220621192034.3332546-8-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621192034.3332546-1-sudeep.holla@arm.com>
References: <20220621192034.3332546-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_122102_446895_663FE24E 
X-CRM114-Status: GOOD (  11.23  )
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

The cache identifiers is an optional property on most of the platforms. The
presence of one must be indicated by the CACHE_ID valid bit in the attributes.

We can use the cache identifiers provided by the firmware to check if any
two cpus share the same cache instead of relying on the fw_token generated
and set in the OS.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/cacheinfo.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 2aa9e8e341b7..167abfa6f37d 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -44,6 +44,10 @@ static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
 	if (!(IS_ENABLED(CONFIG_OF) || IS_ENABLED(CONFIG_ACPI)))
 		return !(this_leaf->level == 1);
 
+	if ((sib_leaf->attributes & CACHE_ID) &&
+	    (this_leaf->attributes & CACHE_ID))
+		return sib_leaf->id == this_leaf->id;
+
 	return sib_leaf->fw_token == this_leaf->fw_token;
 }
 
@@ -56,7 +60,8 @@ bool last_level_cache_is_valid(unsigned int cpu)
 
 	llc = per_cpu_cacheinfo_idx(cpu, cache_leaves(cpu) - 1);
 
-	return !!llc->fw_token;
+	return (llc->attributes & CACHE_ID) || !!llc->fw_token;
+
 }
 
 bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y)
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
