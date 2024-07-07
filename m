Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D77AC2BD09
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jul 2024 00:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W+SKGALg9dxYKzGYJ546rnUzDhZaprdSmjfWWYwoXJI=; b=voJVmXntn/x/UQ
	sRRvDvY9oPN0KNpNa0/ySGJz8q1ox6l557qASEm+oCXHiNS0i2jDDnwYYaeC5Hu5n0svAX31LUxuo
	PqiZxf2bCEWuA84hzpOACBOu2wR43Kt0j9xX7ZHq/MlhHG26VI/byml9mC2/sFTGrtpfiXGLDKgU1
	MHmCB9rbxoBqTv16yVeTRtChh26M5gg14xZGCSOdWfP0ViOLFnkfj6jG0588JPIE2p4GC7MpKhbbq
	a7zZ2H07w3Xs8hnd43jBa0nPX3wavlir1X1NwLgZ3xv2z4yOWvpkgS8U2o0MNzc1F09s22ljU+E7p
	VwDeqiA2Mn9jJACZIG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQFsX-00000001ATc-2z20;
	Sun, 07 Jul 2024 00:35:45 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQFsU-00000001ASw-2f3l
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jul 2024 00:35:44 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-52e9944764fso3155782e87.3
        for <linux-riscv@lists.infradead.org>; Sat, 06 Jul 2024 17:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720312540; x=1720917340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y24B369tsqgPF1sE6m458QbjU1a5YFUso0PShTrZFVA=;
        b=K3csjZ70EGaIr3GhAUgBTaIhoXP69w9hyso+uKFGhyGxYiBRQUQI2A2D6m/U2160+0
         kIAOgMCgd8m3bgSeI2DgQT7hxXNlVCW1OliOxJOeVXDzH4dDD/kPZkx7rai00YxdMTns
         icZTtp+ksplA2faZJ4z6Wb94yYNWma1HyXkLUSW3tPtMBFR320B/rlJ1dTlltLlpUJc7
         3mCxb8xnAl7EgtVaweoDnkt7Ws7mtvB4oVUi1fwXJJWu+yEV8oAThOmXBfHlw5hBaYNi
         /3dNn4mKV5tVxkKGG+SSyNJIqJie0aa4wRcwbBy74EWLk8XZC/6W9peVs8bBcskbE0y2
         pMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720312540; x=1720917340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y24B369tsqgPF1sE6m458QbjU1a5YFUso0PShTrZFVA=;
        b=FJrgapB/1QuzHfQVOMDgNp2X/VJ/cR9bltwxGXkKDfOSTuIJBmy5emCcRZMbgL0i7e
         OseEB2MQScIn0fWkBcy5C/Tq7/wzG4KhUYT4i2MYTU9LAqnmCHUErEOj5Gght5dLuHAD
         gQIQ33FZni6JFXpV0THRfuNME484t0ILekRyIu3ObEHymgpQt8ms14PiyiYmQ2HXXbW5
         Wk7VBOljyVS+KPdG/jR8E1Mwe4B5hFCL0ZH4NCI23KApE/24xY5AqSMT7pjjy4Ectb35
         m6B8wJ4Uw6PQCl3zkp16yzws8K8Dg3fuEFTshuV9iDBTHoh4HLAuAYEczIPoc9L332/u
         uWwg==
X-Forwarded-Encrypted: i=1; AJvYcCW5Q1DDnKumkvKegpegmjWbZrtI4SK90M+wVJzFJE5wFdDwh8OKg3fpoQVruURqNezsvClBY+TASx/cXXBC0xk088X6WTxfUXJm/AkhDXxT
X-Gm-Message-State: AOJu0YwNk1nR789otKIbryhDsrCSj1lCPFYlWygpboG37g4JpOGKTM98
	zYRpqRryPC3OIxSys8Lw8kbRoAknNTlYok0a4i/09IoTRevSBsFX
X-Google-Smtp-Source: AGHT+IHER6OTwEkphqEqCz/Hc+vaSOEIX7b1oYd1erOGY64etZFqoEfyqZtLtq59+I6TM9BwzSzKCA==
X-Received: by 2002:a19:ad04:0:b0:52e:9670:e40b with SMTP id 2adb3069b0e04-52ea0638c48mr4940123e87.39.1720312539614;
        Sat, 06 Jul 2024 17:35:39 -0700 (PDT)
Received: from SP-RaptorLake.dyn.int.numascale.com (fwa5c4a-112.bb.online.no. [88.92.74.112])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-52eab4445dbsm222658e87.192.2024.07.06.17.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 17:35:39 -0700 (PDT)
From: Steffen Persvold <spersvold@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: spersvold@gmail.com
Subject: [PATCH] riscv: cacheinfo: Add back init_cache_level() function
Date: Sun,  7 Jul 2024 02:35:15 +0200
Message-Id: <20240707003515.5058-1-spersvold@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_173542_700532_BF7F7B52 
X-CRM114-Status: GOOD (  10.82  )
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

commit 5944ce092b97 (arch_topology: Build cacheinfo from primary CPU)
removed the init_cache_level() function from arch/riscv/kernel/cacheinfo.c
and relies on the init_cpu_topology() function in drivers/base/arch_topology.c
to call fetch_cache_info() which in turn calls init_of_cache_level() to
populate the cache hierarchy information. However, init_cpu_topology() is only
called from smpboot.c:smp_prepare_cpus() and thus only available when
CONFIG_SMP is defined.

To support non-SMP enabled kernels to still detect cache hierarchy, we add back
the init_cache_level() function. The init_level_allocate_ci() function handles
this gracefully on SMP-enabled kernels anyway where fetch_cache_info() is
called from init_cpu_topology() earlier in the boot phase.

Signed-off-by: Steffen Persvold <spersvold@gmail.com>
---
 arch/riscv/kernel/cacheinfo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 09e9b881..42c22f83 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -71,6 +71,11 @@ static void ci_leaf_init(struct cacheinfo *this_leaf,
 	this_leaf->type = type;
 }
 
+int init_cache_level(unsigned int cpu)
+{
+	return init_of_cache_level(cpu);
+}
+
 int populate_cache_leaves(unsigned int cpu)
 {
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
