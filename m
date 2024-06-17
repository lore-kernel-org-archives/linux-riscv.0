Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2B1C2BA18
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 13:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x20VAhRhVfmGpeKp4aV0d00phvyLKB35mgaXKk7xchU=; b=Pkc1sDLJdjhfwK
	4+BK7Qt/1AjZQkZ6w6tEv0OAMRn8bZHQpPMLr23jiDUZWF088NzlOyfhueU9WAafzWz+0HPnp+tN4
	Sqk2r/245Xrr/a45u9bCZe5vDcyZd8Z5Tc+GqqRM1nC/XYfQAWGQtxjDvepWwsG51CgJ0wRJuEJ8D
	QWXYHotcowElsGlw9QvRoQviszf7m95NC9PRE+6mlAzJnhBZRnaiz73oB+JJV6UqhnHKLHzdDPONF
	T03IAgA0z2Yr/L36NRv44bDbiL6UlTO7znKj3uNZl+1rLs4Wqsubw2Aj9lcclkOuCkV2qalkEI46W
	AMYoZtmEqnBLrlmKP9DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCC3-0000000AmZP-1Inq;
	Mon, 17 Jun 2024 13:14:43 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCC0-0000000AmYR-2qNy
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 13:14:41 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-701b0b0be38so3885381b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2024 06:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718630080; x=1719234880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/f2nZESk5IwUhjcBCwDQD5m6WSIwM88cL3SwI9ltT4Q=;
        b=l5hpG6PdFc7lBDp32swNZOoZVGBpaAeD8NDU7/ESFeL5gSnUvsxDOKl7LpxFHJaY+b
         Bcc/jOt7hFFEMOPRNSw/kNm1ORWimZ8F2BMgZRKGX5eNc2nENtUL9yTmXsYZbS0OE2lS
         C+kq5k2CY/P6oGb4VXXGNDNQbl3SA0ca0iv3hlpOcYzn+rRsLUDUxBwWQadlx2MD3pPX
         gPQCz1tVwVb8Npm6M6t0Z4D6UPkibygXI66xpcPjWQuD10hgt24cO+eMcFfNa8t+EpPJ
         Ehwr1FhADHJw333m1gNHjQPRGEO54shOoIrMaVaFmgxfEyUHbm7ywT3uOcuD5FTBebpt
         figA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718630080; x=1719234880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/f2nZESk5IwUhjcBCwDQD5m6WSIwM88cL3SwI9ltT4Q=;
        b=dmrCHugOj8WauymQjb5zqTcQdKG4m7QUEqbGjDP52w0soM75xAA376ztcfggLSMJDX
         QB91/TBEqtchPLLO6T9eO4Du7Y0o2+oNx0dKXKWLDAZDiADPwhyWORST/g7VloajNuSX
         vTJ57qbuW/BhGP18mv7NkkJ40OQOKHpyQX8Eqe9zErBiapUlqrvaKj/r+1OM2yQ/4ydn
         u1OaHKO71Is00kcX5r9YxgwdzKT76SpAgIUIW2DZVvqf+a2XR74hfU273dFISWKsOXCG
         FZfH0QftbUvUsEFEfSpRRtIY5PTp3RsSLvWE9Joc2lYrBIgM/Yb8h7GZBY9Mvi3fvrhc
         D2nw==
X-Forwarded-Encrypted: i=1; AJvYcCUTzu9qN2AP0Urr6rRUQex2btvLjoswPx6vwRD6GNIligS6iVjSI0VHYPc98nxk3X8IDZ0L3ETRyh2T3iHJMh/ISmRwbvBIj+p+BT/fbkIZ
X-Gm-Message-State: AOJu0YxQw9lX9uDp27kt3witaBmGzE0Vu6o6xTTCFQjhvD0dyYrRPlHC
	f3PnZfaR0kn07j/5WYX64RaMdEYzz0fjaL3hHdYTAfQvnw6d9ngA5DcJVIcyS00=
X-Google-Smtp-Source: AGHT+IFyXVXcwEnHkFr+M+B09gwoggwiZPCR+TNh4urQv2uHfL8+aZj9PiLWU/sney1s+CzXzICoGA==
X-Received: by 2002:a05:6a20:6597:b0:1bc:a4c5:445b with SMTP id adf61e73a8af0-1bca4c54494mr873421637.24.1718630079903;
        Mon, 17 Jun 2024 06:14:39 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f0260csm78801785ad.200.2024.06.17.06.14.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Jun 2024 06:14:39 -0700 (PDT)
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
	jeremy.linton@arm.com,
	Jonathan.Cameron@huawei.com,
	pierre.gondois@arm.com,
	sudeep.holla@arm.com,
	tiantao6@huawei.com
Cc: Yunhui Cui <cuiyunhui@bytedance.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 2/3] riscv: cacheinfo: initialize cacheinfo's level and type from ACPI PPTT
Date: Mon, 17 Jun 2024 21:14:24 +0800
Message-Id: <20240617131425.7526-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240617131425.7526-1-cuiyunhui@bytedance.com>
References: <20240617131425.7526-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_061440_743500_A6765336 
X-CRM114-Status: GOOD (  11.41  )
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
Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
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
