Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2073C25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 07:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AakNC7JjC+k0GeH3x8XLsxsj/oZpA0OZxF50MayBLVk=; b=Rh7XwrFw9mqcwz
	krbfG63ytsDiLGpGz2cPyWhv+ikJr8T1vc9POu1Om+N/nkp9R1UXBIxUxGY4REWtXG9/9PkbaHu7Z
	AURauL9ShYipGnfGjy7erc38/VTZ9LSJtQGVshXFRFFEErBctC0WgMdNPYy1fbJ12chaN80BCVczV
	nCFkv4ZHBtMr5M6RHLaklXNfyV+7P/PUp6FizJ0bRXUWs0IMPyfeyNcnkyA3UPXZ0i+jeoEfBKh0l
	GONLrsOw7kFuBj+a8hdNzOP0ddpOL4kxDa7fky7NTFtuL8vpZQAXM64fjD2T+TIFYLQBx/CLi7p0N
	GBKrZEo39x/Fx6ueMuxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4yHy-00000000hb7-08Mu;
	Thu, 09 May 2024 07:34:02 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4yHv-00000000haF-1Z03
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 07:34:00 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1ee954e0aa6so3829505ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 00:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1715240038; x=1715844838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cwpsa2HL8S5jIz0x6grJAB8mOqnJkhHeKGCfgHpfOE=;
        b=DWNfmxc8MIAbNzAC7xjRVavgKASPKCeeKHiSC0uaCFzARNL9cTMWJVv2oawNxQsFRG
         WBCWc/KYjbPjE92D8dO65EuA5PqZipDVP7sK/DWw3XOrSqBPMXTVcifZZ+h0T9YWWvga
         nFlguCZ5asbrO3apYq4US8Hu0cjNSfdAYHaBkXjjMk86iwN+2FA/fxCdxeIAMGY5eNG9
         vG/lsZU+Jq3xQFsFV7Co+esjIDDEeN/VBat5kn06OU9RFzFUeSFI6G9tpcQe8Ih5nAY4
         VrG4/qFfbsEkphKdNBPPDD45+O7EAGcYUlCKKz++RJa2XbQ6+QlwWWp/3Ab6TkY3OcWG
         kaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715240038; x=1715844838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cwpsa2HL8S5jIz0x6grJAB8mOqnJkhHeKGCfgHpfOE=;
        b=WuFZxrsYT2PBZjybq3AyazYcfa6mVreSwoiHKqMqHXka99u9a6mUbHo4pteFCYkZZk
         Y5jxk738g373QLvwwdJGqtSovRcTZqMJGGcYiBLr3vc3aqzsxhTVsrIdliwOcf/5VaL5
         HxcCd/rq0PRadyWqIsweSf/0RSG8DgshMJCqp3r8tK8GQJFtI5GjC4RVG1twydabTx8m
         0pwB2twHEC7BmqW8ZxcQGqnMm659coTQCW/HUd3rs/50jd01vqXqQPoqGn6+Om4/SvzH
         F7SESLL0FPqtBr5UMcD0F/qsxdhix/7ZdKnGZ9f5RFp6yw9/KT25aWdCN04S4upNImOL
         Gosg==
X-Forwarded-Encrypted: i=1; AJvYcCX9TQPPAjAoB7FYOKlmW7G/UujKCSm0db5RzmAc12xCxVoWT1cZHXSBnlP/7CL3yo134Uo/4RnUjJ2EQzJEHSehHeiRA15Lb8DbsnWy7YQu
X-Gm-Message-State: AOJu0YzBo3AP2bXrehIVE6xkTGIT5VMm8jZFUnK1aVrDHcUxfSw5vSwj
	rwRCZNVxlS+OllthRyiyybJ7Fv7HImBujS0TorhNlAINYVBQPAFBlN+06XVPBys=
X-Google-Smtp-Source: AGHT+IG/D+4lV51kE6nf+1RISOvQK/tQQrWPzktPgLKIYfH6V7gZRVDpOTsPNQO9YGcb3oeKoFgoIg==
X-Received: by 2002:a17:903:258f:b0:1ed:1d37:267e with SMTP id d9443c01a7336-1eeb05919damr43288965ad.16.1715240038702;
        Thu, 09 May 2024 00:33:58 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0badcbacsm7519045ad.97.2024.05.09.00.33.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 May 2024 00:33:58 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: rafael@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	sunilvl@ventanamicro.com,
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
Cc: Yunhui Cui <cuiyunhui@bytedance.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 2/3] riscv: cacheinfo: initialize cacheinfo's level and type from ACPI PPTT
Date: Thu,  9 May 2024 15:32:59 +0800
Message-Id: <20240509073300.4968-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240509073300.4968-1-cuiyunhui@bytedance.com>
References: <20240509073300.4968-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_003359_440405_BA338064 
X-CRM114-Status: GOOD (  11.92  )
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
and type. Since RISC-V currently does not have a register group that
describes cache-related attributes like ARM64, we cannot obtain them
directly, so now we obtain cache leaves from the ACPI PPTT table
(acpi_get_cache_info()) and set the cache type through split_levels.

Suggested-by: Jeremy Linton <jeremy.linton@arm.com>
Suggested-by: Sudeep Holla <sudeep.holla@arm.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/cacheinfo.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 30a6878287ad..d6c108c50cba 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/of.h>
 #include <asm/cacheinfo.h>
@@ -78,6 +79,27 @@ int populate_cache_leaves(unsigned int cpu)
 	struct device_node *prev = NULL;
 	int levels = 1, level = 1;
 
+	if (!acpi_disabled) {
+		int ret, fw_levels, split_levels;
+
+		ret = acpi_get_cache_info(cpu, &fw_levels, &split_levels);
+		if (ret)
+			return ret;
+
+		BUG_ON((split_levels > fw_levels) ||
+		       (split_levels + fw_levels > this_cpu_ci->num_leaves));
+
+		for (; level <= this_cpu_ci->num_levels; level++) {
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
