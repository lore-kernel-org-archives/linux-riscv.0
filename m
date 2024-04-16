Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC08C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 03:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xtnkKCUQgDaPQGpDuWNslDhGzeqlmbZF6IKYD4JAsJk=; b=AkZbRuH41tAok7
	w0622yfW3FlrzaUToPgSuswU0Exvadva//MvAZbBNjGoHc4wa6D1hhjANL6Na9SwF4LaFQ3fkSC4c
	wzuEHEnGmGGJGRv32V64Lonyk/XyVgW5Nx3mrVhIWdzA1+6sZssbCrh+8RD8V9Hbey4xTAL19+uwc
	84DK+8LW7cIxoQ8dMx+9h0MYsacP5Q1Wx5riR1NPHH0UL7XNoUUpHRasMQVa94+jZ3MXSde0U/OLs
	GekPBEmN4+lvNsCDdnNoohVTYjV35qe6ThLfizXWsAnEWWBeOqGqY6wkt1dcbxYrQtqSYcDsKXdMe
	IcmRiM61/JmnXeGseP/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwZHh-0000000Acpu-15vI;
	Tue, 16 Apr 2024 03:15:01 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwZHc-0000000Aco9-3ogY
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 03:14:59 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6eb7b6f92d4so1141453a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 20:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713237294; x=1713842094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yve68TeIN/f8pyzLtfbyGcp16m/kz9ccR5yLCEIe7Y=;
        b=SYAKREV8qyWhc3rjXd9vob6rv42UwnJj/ANRSdWxoVS0j33k0Vel6cxKkI7YuIop8d
         DqNTqn+G+Hvlt7Zd67ShwLPwqI5Y0E9Z8H+unNMBi4LO3CUBxLGvo5dHIWtVPCZz50C3
         ExGdDYmRZv4mSYGt+w+IzYh1t5Rp6XIKRNOINR7ocfvZrBlN5f2xlCdq9ztK5nY/k2qd
         t0ARKPKU0zp/YZ3BU5UXV3ublVtsT8eUl3eFwmfGWjS6kgUfrKHo2dkH6QoOy1S2tC2e
         mS3ToMi9uCC7JVnHo+JDIyEsS6Rlwynqtaj09EIyoyOV8/27+hM/qwVhvpfLqS52Bc3/
         hdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713237294; x=1713842094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yve68TeIN/f8pyzLtfbyGcp16m/kz9ccR5yLCEIe7Y=;
        b=nHMuit//8Hd3z40h6MGyjQGNyHxf4u8dBr7FKF222aSMt49XsD7Ddcpdkbf7iwB1jn
         SyZX3ug5x7pZOCFVUV8nJ/u5P/BKEav7HRPvIu0Gn7VnQ0DB3IESrHhB0MVE/BB5PLaL
         00jF6j/KUCNkRY0YZK2APEjaE9iPTr1awxbDyI3UULEPWK+YAgSeBiAbV5ZxHgOXw61Y
         mz2JrckFKQmJ/jhU4EyDycqj5sSbpZPU3QXn2jlQ/WPT+wLWO4TZlahtbAKg5oK3jOLR
         vkUJ+Cwg1FIWHa7UDKF2NFFSknGvRV70VmJkUV/SfoRFX7+3PrhdeTgP8+u+Rz3WagvU
         qBTw==
X-Forwarded-Encrypted: i=1; AJvYcCVIz3ypu3UgJev5Kz1hgPC4cjhAV/1VsoBr5L8nRfWzQflFpPytSWcfdpATsC17R2ocsoP8jHutr/Bd2mjq4xqB/RE5lfs/F0i8OwoLrRTM
X-Gm-Message-State: AOJu0YyxBZkkXdrPv30JDO6Ouia29edpzlVBYrOuV6Yo6v3pED/EB6Mc
	28pfro1dD2mhvzgpO43vEOmdif5AOlNQlS8ZtedmtjF8u8R6pyt9SlXfweQ50JA=
X-Google-Smtp-Source: AGHT+IEeADcSOG5m5cSI0ix14SxkbexoEWR7Z85N/k76lNUya9yj2CgCsg1obRQTztWOVlClkCQkEQ==
X-Received: by 2002:a05:6808:6044:b0:3c5:fb09:aeea with SMTP id dd4-20020a056808604400b003c5fb09aeeamr11353481oib.35.1713237294624;
        Mon, 15 Apr 2024 20:14:54 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id d20-20020aa78694000000b006e6adfb8897sm7907983pfo.156.2024.04.15.20.14.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Apr 2024 20:14:54 -0700 (PDT)
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
Subject: [PATCH v3 2/3] riscv: cacheinfo: initialize cacheinfo's level and type from ACPI PPTT
Date: Tue, 16 Apr 2024 11:14:37 +0800
Message-Id: <20240416031438.7637-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240416031438.7637-1-cuiyunhui@bytedance.com>
References: <20240416031438.7637-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_201456_977946_A357ACD8 
X-CRM114-Status: GOOD (  11.38  )
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
 arch/riscv/kernel/cacheinfo.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 30a6878287ad..dc5fb70362f1 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -6,6 +6,7 @@
 #include <linux/cpu.h>
 #include <linux/of.h>
 #include <asm/cacheinfo.h>
+#include <linux/acpi.h>
 
 static struct riscv_cacheinfo_ops *rv_cache_ops;
 
@@ -78,6 +79,25 @@ int populate_cache_leaves(unsigned int cpu)
 	struct device_node *prev = NULL;
 	int levels = 1, level = 1;
 
+	if (!acpi_disabled) {
+		int ret, idx, fw_levels, split_levels;
+
+		ret = acpi_get_cache_info(cpu, &fw_levels, &split_levels);
+		if (ret)
+			return ret;
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
