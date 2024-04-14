Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277A4C04FF9
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2024 02:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9z81A7+1Fl02aHYWmiRhfE6Stq8xWjy5ACmO7wBaiP8=; b=fhjtNXgE0ipo/z
	pWsiEPfWbmTCg+rb6YrUMHmL71J0Q+GaE6y6xudXunMLXASaTv9Hcs1Xz0306BRrPSNjHhcWeHwz+
	1rDYBvacFJ9mNaKOJpEeY37VzfaUD42PRwtJBcKzPH6myTrN9R9XLTftw6ZKvvoj6rZcDTc4CQRxI
	fZ5+6pq3FySgqNuF1RCBIqb2r3Eubp613z5I6IqVR5BUrT4pjXD5TVAwvP4lfYa6GjvQhWg32OlZA
	cJZdyu6GGkgTBP7qjqy7UMqzg/0ZyGsJg1Ujiuz9H9E2jMUKy2XNY5jMsa8TFdVPX4YvGeI/AdkAL
	GDy8HfmYkzi0sUNG4cqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvq5r-00000004RlM-2XhA;
	Sun, 14 Apr 2024 02:59:47 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvq5p-00000004Rk7-23ri
	for linux-riscv@lists.infradead.org;
	Sun, 14 Apr 2024 02:59:46 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5f415fd71f8so1696403a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 13 Apr 2024 19:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713063584; x=1713668384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+iJ/bWcbs5TbNYkdodB+bg4kp9o+X2TePK5VotNZ5U=;
        b=dAzh/aZWO7ajiPlqJE4LL+VGc+JpFi2BjG5nWDOBQHhBv5pDr7FgExeBtVK3nrfKn1
         R49Nh1OqCrqdCWQIWEV9q4LlMLqwpzZKyvezc6xStAnNlm1kKKoQD7JqwmLB/vfo+LEq
         l55x22fXrxN9JC4ZvfxU5XOSEcrmsJLkQWdgf4ZnVcmDT0bRY66AGq8I+uEh6A87BvCR
         3iUYYHZJxiXrxXtBFV82kmBn6Wsc3fXR5NGR6ooKaXfalebcgNt+5PFZkiyG7hA7eTvI
         1h9RpzCXXpBkdQ6pzEBTC9CXNQanLV4bN3WgUd9kpnLbdfJfYwbu/CjJfEmLN1Fn8cGU
         us/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713063584; x=1713668384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+iJ/bWcbs5TbNYkdodB+bg4kp9o+X2TePK5VotNZ5U=;
        b=gunpZjVsnSBf+1lDCc3bNuxxfXV2m9FEuSbw8ohlSjwLd1Q/GIrjSbbI2q1qxEuGuH
         TeYC3a91WyrRPMb02WjZJNf55ZIW286m2T5KkmhH4yKaPPk+CNUOXNdUJHI3DMZjPrSO
         0X0hrrIWt4toz1LL4HluSKGVpdHpvXW+bwxmyVjy+gEt1Te8dEVzHqfPArjgtDrO5CkB
         RqBH2DMtjkuH+RdCmZdWWZf9h8bQ5/mUM3hhi4es+wLS9aafErATYtLtnO/oIpK5MrKZ
         EWYegX3DJfcw8Jrw+Lkwv++colJVMTmTJIJ4CnDxJzf/aQ/kTHnm7nuzlTBS4iRM5Nr6
         LvUA==
X-Forwarded-Encrypted: i=1; AJvYcCXcbZFZN8IOHKn5NVR41fZKXLpaOiZkGe6tYA1XnAsKOYMd+NjF9M5OghjM68Rq4dkcz0dytuPD/7QS15ryKmMF75SmTWP0Q6IYtzQwa+LL
X-Gm-Message-State: AOJu0Yy1655rW9jrp1iCVrpXMBaiZeHGvii604gJrD8/KzVw27iFkc8X
	kslJyliWE9MKtzNcfjiuOHdCe+mE1fi5cxLhrKhUe1+cfF7dn6eU2Q/R63VqUD4=
X-Google-Smtp-Source: AGHT+IFC7Ostz4NVqRl+TdyivWIDYqcK3ZnTae/PQDs3xYi5nfAgFK24gkFZANSYBnnATXXDHJF4Cw==
X-Received: by 2002:a17:90b:80a:b0:2a5:513:921e with SMTP id bk10-20020a17090b080a00b002a50513921emr5443131pjb.31.1713063584355;
        Sat, 13 Apr 2024 19:59:44 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.246])
        by smtp.gmail.com with ESMTPSA id cx15-20020a17090afd8f00b002a219f8079fsm4799913pjb.33.2024.04.13.19.59.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 13 Apr 2024 19:59:43 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: rafael@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	bhelgaas@google.com,
	james.morse@arm.com,
	jhugo@codeaurora.org,
	jeremy.linton@arm.com,
	john.garry@huawei.com,
	Jonathan.Cameron@huawei.com,
	pierre.gondois@arm.com,
	sudeep.holla@arm.com,
	tiantao6@huawei.com
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 2/3] riscv: cacheinfo: initialize cacheinfo's level and type from ACPI PPTT
Date: Sun, 14 Apr 2024 10:58:25 +0800
Message-Id: <20240414025826.64025-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240414025826.64025-1-cuiyunhui@bytedance.com>
References: <20240414025826.64025-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_195945_559201_E65E2119 
X-CRM114-Status: GOOD (  10.91  )
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

Before cacheinfo can be built correctly, we need to initialize level
and type. Since RSIC-V currently does not have a register group that
describes cache-related attributes like ARM64, we cannot obtain them
directly, so now we obtain cache leaves from the ACPI PPTT table
(acpi_get_cache_info()) and set the cache type through split_levels.

Suggested-by: Jeremy Linton <jeremy.linton@arm.com>
Suggested-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/cacheinfo.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 30a6878287ad..ece92aa404e3 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -6,6 +6,7 @@
 #include <linux/cpu.h>
 #include <linux/of.h>
 #include <asm/cacheinfo.h>
+#include <linux/acpi.h>
 
 static struct riscv_cacheinfo_ops *rv_cache_ops;
 
@@ -78,6 +79,28 @@ int populate_cache_leaves(unsigned int cpu)
 	struct device_node *prev = NULL;
 	int levels = 1, level = 1;
 
+	if (!acpi_disabled) {
+		int ret, idx, fw_levels, split_levels;
+
+		ret = acpi_get_cache_info(cpu, &fw_levels, &split_levels);
+		if (ret)
+			return ret;
+
+		/* must be set, so we can drop num_leaves assignment below */
+		this_cpu_ci->num_leaves = fw_levels + split_levels;
+
+		for (idx = 0; level <= this_cpu_ci->num_levels &&
+		     idx < this_cpu_ci->num_leaves; idx++, level++) {
+			if (level <= split_levels) {
+				ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
+				ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
+			} else {
+				ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
+			}
+		}
+		return 0;
+	}
+
 	if (of_property_read_bool(np, "cache-size"))
 		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
 	if (of_property_read_bool(np, "i-cache-size"))
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
