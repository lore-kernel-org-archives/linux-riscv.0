Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF72C05023
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 03:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dU3gjRF5bEdGvRguJu1v0VGFZha6kcKg4C4a2UHXq0I=; b=O4lXYBBFHShaqp
	QfA8BkAzPiogaZoODFAD9GmC9DlHxP5nFZRehamE9NfyqUyPw5x0IPrTPXQvYnuoIhMbnlqj9ZoOg
	+b8On/Ma2XWjAjNatlSsPZBTkwq7+Euyw1DTFqgfQb9Ssmu301uD8VCt5cKnwPGPBQmY7aYKiFaL8
	cVJFxCMp/ZiM79Q+7Wc+qIBcfoq2GwdVNqxzUlQ+0pqw1a0bVRPlU3L1pxoVielWKWDqdBeUHXLHA
	DLMkObxTBko+NWuAScFeLEPvAx3273dT317WA2eMpnNAfUs2/4av7I01mCKY69NnMPMwFxPbfr5aU
	bdoSYy/Hh3Ep0UcxxVTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxIhC-00000000olV-2IKC;
	Thu, 18 Apr 2024 03:44:22 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxIh7-00000000okH-0AiH
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 03:44:18 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e5715a9ebdso3667025ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2024 20:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713411856; x=1714016656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uV+tTK/O3Cf3pGvDZokWea7cMMg5t3YML7P6RO2qmfM=;
        b=Rk3+bFF+00TrUaUzORCODvROQyq7z0/szZ+NtZZl+3GWfPeRXUgfL4ypLx5t1YP+bB
         Ama4k5kodRynIFKTCzR/lfhs3HMohFfy/sM/KOB56Zx8MXvMJLSVPLL+2exVQa+lYj6B
         Rqa+zIZvWEMFQHG+/6RF8YabYQclS44eNLqVu3Rhqjipz2RF4AVTkzNHpelAWb2jx/lz
         89b+6zmCWIIAfILbcb0cqsZ6OUkKCchgF+vxduWkMuYWJsMS6bxdJqXHq2PD7etUwdbi
         cuCwAtmkL+FESNWjHwEhZcFvgoZiBT6fD3hmmFx32DXzxC1QyoR0afQZ8ehfI5mGzfkj
         mLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713411856; x=1714016656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uV+tTK/O3Cf3pGvDZokWea7cMMg5t3YML7P6RO2qmfM=;
        b=kQ/JvwBjN5Y8WWd1IZo1iZT7Woo86Qkf1z2eK4FvTWFaTJsAy3kvu05Pa3LWZXCkEZ
         c//C9qNtPQTJkXS8ZmVMTXe8I4zAAlmbtQWPm/Kxg1jj/KuGJBR91+pcFOKaSe/UotBO
         SPNnhlQY0z7C8HA+W3BEHrbXfzaFeTKMraTMElBonDAHECTSZ0vOVsItKbkkYb5NJY7T
         9eiX1JS39dc3jqb9qs0Gh96sZ0hu0T9eE7r+D09t3Jdtr6zTeteujfFpDK9+2dRYmC/k
         /e6IYhS3lF+moxZ7THxJvUw11KCO50utkHQ7KR+tEXlhJSkMYNLSFQcYrhYMM0S1e9fL
         ijxA==
X-Forwarded-Encrypted: i=1; AJvYcCW4r8h2t7CA1Hy0ERivUtFOzipFfH2j8apA9PKHfmYF8cM4nAnSYwKzWBSl46FDdj3IVaGF8gvKXM3s7nF9Rfn+Jd5H9wHgl1EFA6Vsv/CY
X-Gm-Message-State: AOJu0YwMDZ7TvhBW7kytXTFpYppfpqfnqjxMeVac38J2ehe2iiJvLkU2
	/XLvuQJMZsEUNOaeG51xRyx9VkqM3KzZYECzx74O1ZJuAnUGptRQx3tNTRpLLEMCh+xdmn8+7ub
	+TnE=
X-Google-Smtp-Source: AGHT+IF8Ybd8h59QRpmrLTR1zcYkAknZUw68pJcmzna4XUaXYII2l5xPSDLL6d6AFTyAFaONPu4ZYw==
X-Received: by 2002:a17:903:22c5:b0:1e3:cf2b:7151 with SMTP id y5-20020a17090322c500b001e3cf2b7151mr2011147plg.59.1713411856291;
        Wed, 17 Apr 2024 20:44:16 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.13])
        by smtp.gmail.com with ESMTPSA id lb4-20020a170902fa4400b001e88a4ebeb2sm109880plb.152.2024.04.17.20.44.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Apr 2024 20:44:16 -0700 (PDT)
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
Subject: [PATCH v4 2/3] riscv: cacheinfo: initialize cacheinfo's level and type from ACPI PPTT
Date: Thu, 18 Apr 2024 11:43:29 +0800
Message-Id: <20240418034330.84721-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240418034330.84721-1-cuiyunhui@bytedance.com>
References: <20240418034330.84721-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_204417_123061_DE4BAF0E 
X-CRM114-Status: GOOD (  11.82  )
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
 arch/riscv/kernel/cacheinfo.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 30a6878287ad..e47a1e6bd3fe 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -6,6 +6,7 @@
 #include <linux/cpu.h>
 #include <linux/of.h>
 #include <asm/cacheinfo.h>
+#include <linux/acpi.h>
 
 static struct riscv_cacheinfo_ops *rv_cache_ops;
 
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
