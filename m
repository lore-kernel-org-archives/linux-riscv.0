Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8BEC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9/wFc5FTe9/Umaj+oy2kKktQO0v+nnlsLjgzcB524Fs=; b=SGKMpqDDPqWbzV
	g6ey3Pz5RYrOir2HaR4y7qcdCwSuLrqF0S9uNVlEnoLxFbeFHRpREL2jWA7BoTzh/3FSGUFTZlRkz
	VQssxv7DDUSJdjbGLRupin3tqNfE/y5EGlEntcwHIkOL4jibH4fEeh480R1msGGmsj7UDtE+pcOiJ
	hjJRRK7WMo1HLFOxfGQRklFWXF4TSnfdEC123VkDJmvXd+S4OSHQ4KoiyNPQpuy9xJ60BYlJBAfpM
	UwzfsjjrF9wS1fm7xkT9TzwLrs/syVFpi7G2gjkB306vWRQszy5YMWzKFl1ds1AlSDZUHq1E8vUYO
	hyqaJD7zdeXVdhkQDN2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD8Yg-00Axho-PU; Wed, 04 Jan 2023 18:32:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD8Y8-00AxVq-Eo; Wed, 04 Jan 2023 18:31:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5FD41063;
	Wed,  4 Jan 2023 10:32:19 -0800 (PST)
Received: from pierre123.arm.com (unknown [10.57.44.105])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 071103F663;
	Wed,  4 Jan 2023 10:31:33 -0800 (PST)
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Pierre Gondois <pierre.gondois@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Gavin Shan <gshan@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v4 3/6] cacheinfo: Check 'cache-unified' property to count cache leaves
Date: Wed,  4 Jan 2023 19:30:26 +0100
Message-Id: <20230104183033.755668-4-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104183033.755668-1-pierre.gondois@arm.com>
References: <20230104183033.755668-1-pierre.gondois@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_103140_614894_3137277E 
X-CRM114-Status: GOOD (  16.25  )
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

The DeviceTree Specification v0.3 specifies that the cache node
'[d-|i-|]cache-size' property is required. The 'cache-unified'
property is specifies whether the cache level is separate
or unified.

If the cache-size property is missing, no cache leaves is accounted.
This can lead to a 'BUG: KASAN: slab-out-of-bounds' [1] bug.

Check 'cache-unified' property and always account for at least
one cache leave when parsing the device tree.

[1] https://lore.kernel.org/all/0f19cb3f-d6cf-4032-66d2-dedc9d09a0e3@linaro.org/

Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
---
 drivers/base/cacheinfo.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 3e965ef6ee42..339cd1e3d5af 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -225,12 +225,9 @@ static int cache_setup_of_node(unsigned int cpu)
 	return 0;
 }
 
-int init_of_cache_level(unsigned int cpu)
+static int of_count_cache_leaves(struct device_node *np)
 {
-	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
-	struct device_node *np = of_cpu_device_node_get(cpu);
-	struct device_node *prev = NULL;
-	unsigned int levels = 0, leaves = 0, level;
+	unsigned int leaves = 0;
 
 	if (of_property_read_bool(np, "cache-size"))
 		++leaves;
@@ -238,6 +235,28 @@ int init_of_cache_level(unsigned int cpu)
 		++leaves;
 	if (of_property_read_bool(np, "d-cache-size"))
 		++leaves;
+
+	if (!leaves) {
+		/* The '[i-|d-|]cache-size' property is required, but
+		 * if absent, fallback on the 'cache-unified' property.
+		 */
+		if (of_property_read_bool(np, "cache-unified"))
+			return 1;
+		else
+			return 2;
+	}
+
+	return leaves;
+}
+
+int init_of_cache_level(unsigned int cpu)
+{
+	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
+	struct device_node *np = of_cpu_device_node_get(cpu);
+	struct device_node *prev = NULL;
+	unsigned int levels = 0, leaves, level;
+
+	leaves = of_count_cache_leaves(np);
 	if (leaves > 0)
 		levels = 1;
 
@@ -251,12 +270,8 @@ int init_of_cache_level(unsigned int cpu)
 			goto err_out;
 		if (level <= levels)
 			goto err_out;
-		if (of_property_read_bool(np, "cache-size"))
-			++leaves;
-		if (of_property_read_bool(np, "i-cache-size"))
-			++leaves;
-		if (of_property_read_bool(np, "d-cache-size"))
-			++leaves;
+
+		leaves += of_count_cache_leaves(np);
 		levels = level;
 	}
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
