Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A9FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 22:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0NGbXXTCT02a/DaZAD/5wif7qiAvr4EcTYwaaZKvMsU=; b=JhcQz6We+/2da1
	aEH/gXf/2Pfmh0AQVZybW01sgGtagfyvPFQ+6JzNTEnBvzWjrq85L5NZr/XVB+hqs1CfPIxfZxHhv
	YgwNHwkNxTfM5lZ/uc3qUIwKq79uAlHfUTlNxBDhJchK7YPNbY5ahOOQ3VY7n7P1+gBonYzIpniXE
	R3o8JzysyeF8WfOf9CwKjr6prLwsGlLjba3untwSiFUZwodCotUYCYf7gxNLeQ7879uxPNobw56iy
	0aD0UeUkMem3PTPYTHOD5rZ7wRh+1EowA9c4bSkpU8NoNp7PpgW48aFDaqjnK2uGa9fShZTZE6aY9
	rU1dEx3F5VFdW7DGmgcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Zcz-000S4V-8j; Thu, 07 Jul 2022 22:05:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ZcQ-000RhZ-Mb
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 22:05:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id i128-20020a1c3b86000000b003a2ce31b4f8so103094wma.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Jul 2022 15:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B5wkC6bSg20bpLD4uQZm3lcPPl+j3uqj6NVt2WW5Mcg=;
        b=JoYnHtdqAYiT+36KpL4vd68z4rhaJnSSsg1xfE6U/TWcp9nowym0LLc5feUvF6cUvt
         FBUAoeUMgHU+d8gc/nAa9KYVpHAA6oc64AfaDNZLuPUl+oOt6hoTTzlVpA6g244CjRAC
         0b7eCJwc2WiueTqO7ly4o/mFQwqCHi5xTKI0OY3HTbmapB9RyS7H0ypUMkLfcxwySOUe
         H+bi7Sss1x8a7j145shtX+T2pXLMx4rZ8NewuiYN+dGyOs7RUfZXeqIbqn3mW9bBWIJK
         HbNIlILXJ2QlL38ltMXCL5N/aO9naJdqKNA0TMzNgFvBYDziN+CR6FNoB0EVmWiS/LoY
         hNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B5wkC6bSg20bpLD4uQZm3lcPPl+j3uqj6NVt2WW5Mcg=;
        b=oEe1H/BoP38Je6jWXdAdvvtL47PcTsokkWxGIuw2yoZ7ZB0vx8UJ6Xs1aNE2m0fPnm
         3kLojKTRjYIb+UZAPDoSdBy2g2jqYo/NmJvP0sDRlY15jgn2SZUcmtao1a3rJWGqcwIj
         CxfDVwBkKCYlu6VCUrn7Q/B+cZLXtZ7kzQ67AA5MqeKrmZ+B1v/IOoszJ7dWGHaxv0zb
         Vw/Kuj+NEziKEhOyyx3g+b11JsxSAa1QkXP6QzmzBEj9eOpkRbD/P9uszxPaVcEz5uoD
         gs1SxP47SBjZtQ7g5IVqqHu7ISrOH7sR5VXOVOB5mh4XilpnEH9chCt4Yfh+DGsfSA4Q
         jWPQ==
X-Gm-Message-State: AJIora/Cv6WXefKUBRaXErVatMR/K9lVPHr6hzMyaz0d1CCMguWcDIoq
	tXSuQXJFXJwr/VW+ZdsCa1r+Mg==
X-Google-Smtp-Source: AGRyM1tnnzsxvhPG5IKs+YBZgLkAEtXKFH5kbjSLNkMp91lah456WA9wRpXL5hKIPbb8QYLBQN/YLA==
X-Received: by 2002:a05:600c:22d8:b0:3a0:4092:caff with SMTP id 24-20020a05600c22d800b003a04092caffmr7025020wmg.59.1657231499789;
        Thu, 07 Jul 2022 15:04:59 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id bn24-20020a056000061800b0020fe35aec4bsm38625743wrb.70.2022.07.07.15.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:04:59 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Zong Li <zong.li@sifive.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jonas Hahnfeld <hahnjo@hahnjo.de>,
	Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Changbin Du <changbin.du@intel.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Rob Herring <robh@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Brice Goglin <Brice.Goglin@inria.fr>
Subject: [RFC 2/4] arch-topology: add a default implementation of store_cpu_topology()
Date: Thu,  7 Jul 2022 23:04:35 +0100
Message-Id: <20220707220436.4105443-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220707220436.4105443-1-mail@conchuod.ie>
References: <20220707220436.4105443-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_150506_779865_982A726E 
X-CRM114-Status: GOOD (  12.33  )
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

From: Conor Dooley <conor.dooley@microchip.com>

RISC-V & arm64 both use an almost identical method of filling in
default vales for arch topology. Create a weakly defined default
implementation with the intent of migrating both archs to use it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/base/arch_topology.c  | 19 +++++++++++++++++++
 include/linux/arch_topology.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 441e14ac33a4..07e84c6ac5c2 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -765,6 +765,25 @@ void update_siblings_masks(unsigned int cpuid)
 	}
 }
 
+void __weak store_cpu_topology(unsigned int cpuid)
+{
+	struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
+
+	if (cpuid_topo->package_id != -1)
+		goto topology_populated;
+
+	cpuid_topo->thread_id = -1;
+	cpuid_topo->core_id = cpuid;
+	cpuid_topo->package_id = cpu_to_node(cpuid);
+
+	pr_debug("CPU%u: package %d core %d thread %d\n",
+		 cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
+		 cpuid_topo->thread_id);
+
+topology_populated:
+	update_siblings_masks(cpuid);
+}
+
 static void clear_cpu_topology(int cpu)
 {
 	struct cpu_topology *cpu_topo = &cpu_topology[cpu];
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index a07b510e7dc5..fee306b8a541 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -92,6 +92,7 @@ void update_siblings_masks(unsigned int cpu);
 void remove_cpu_topology(unsigned int cpuid);
 void reset_cpu_topology(void);
 int parse_acpi_topology(void);
+
 #endif
 
 #endif /* _LINUX_ARCH_TOPOLOGY_H_ */
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
