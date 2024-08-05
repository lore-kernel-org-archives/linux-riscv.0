Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F39C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 17:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iJVZGHoLTsI9kPUkOwa56BvfcJdTgBOrru44XEtkNhY=; b=gJZaAetRGvb4iA
	gM3YKmpQ5lJF/6WRjSF4qz3Xv+w7FE36irSWKU4mt3X+p/h0G967tbBthWQGo92Iw95+OSCgPmPTB
	2VkI0IkkzFgW8EKt3L3B8qSdgFL51tQUFbGlZdcF8312NxUHvZZWNQNPBInS/MLtfl0iIB4B9eRBP
	ghXivkzm3mQxgb/a0UQl1rFFXIyK05OXepj/5BvdmyYr1bdXTN+bo61bcQ3Pb4vFinrOXoArbLXuQ
	chNopL1mWyMws0Tz/5dfBu/CW6U5hRPSocK8rVnMMFRp78xoVNTfhLXfKTQnLHaZWWNBJBJAiUajX
	B6x2sD0F2L3Q9bjFPXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb1f8-0000000Gicv-2OWk;
	Mon, 05 Aug 2024 17:38:26 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb1f6-0000000Giaj-06rP
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 17:38:25 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1fc491f9b55so85407245ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 10:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722879502; x=1723484302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yIqXJOcsWTmDQT18ltvBkvSKfPE+CI0ACIv+CWuAfhQ=;
        b=GhrWOTX9SDFNcc9wIZkOrdKMLB/Lwhp+y6XhAJB3QGf1GizLYa4qUY0r+hoIwm7441
         OKZRMWtjtr5JJqWFed0/WIOxby33rrxmVhN6AaK1w5bo60PIA7QOqLy5w4nkTC8Ie5iH
         SFHVW4ZkXlPFvK613agkj8jLjIn5gA8vm0qSpx6ElgcumzHC1rc0B3pmE2dCs4wn3j47
         7XhqgUKezOeEjpvIxFaOi3b955BZwbfN7SVugWK88alvHgirW0QV346pQPLcP/LJBVh8
         lErnZsWB3cmNRCRlzfL/sFgcSByOPE2wgN9vcVJT8GdGJ/bxGn0XIv4TjebTx7aEWwbG
         aDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722879502; x=1723484302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yIqXJOcsWTmDQT18ltvBkvSKfPE+CI0ACIv+CWuAfhQ=;
        b=g2PkmsEiwzrIqW0qebtwfKcxtHJ0BGapcQ4ajXbGvT3tDpMAOruYEKDPvmH//d2m1J
         CPkn8VAhI944FMrkrJqDZ8reQblZCSsPV6aXWGAOVeKPXIIIiduIdVXEAUobcf7aw8pK
         Q9sWSbhdwSNFoEOb4TI4SNxiV563L0XT7LrjCNYHpad/IcHHDFGisTvL+EF5KFvl5BTR
         RLcy5EVwzYHgEuw/8TvW4ZJklooSu7DnnwqDqSbMTC6t4h5d2liHIQ0j12noufefrqZ5
         1RtGUKYrUfUhM6Y/iB3ZXHIQNLM8kpV8fV1mx3lRIhdMvcOtsG/H7iYNIpQpHv4G8KFd
         1pLg==
X-Gm-Message-State: AOJu0YymQxZGXnnr1eywz54jUWdbIIWfspRgxLEyrt99zbW1RoWz/YSv
	ehNiACJU2injLjPT3sZrfbGNeMU5S6WXbEaq/acUfIT+/MS7pf5ND6LFXMvnNq5NCWQjbuXTitw
	c
X-Google-Smtp-Source: AGHT+IGA4ao6KXpD/OA6uBRaBG7aAABpIJEYunLTtbMZ72A9gi5Guwmmt27eLbpuv2kqVPSBJEaCbw==
X-Received: by 2002:a17:902:dac4:b0:1fb:90e1:c8c5 with SMTP id d9443c01a7336-1ff572c487fmr112872505ad.33.1722879501771;
        Mon, 05 Aug 2024 10:38:21 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5929407asm71128435ad.242.2024.08.05.10.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 10:38:21 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/1] RISC-V: Add parameter to unaligned access speed
Date: Mon,  5 Aug 2024 13:38:15 -0400
Message-ID: <20240805173816.3722002-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_103824_242743_8929E377 
X-CRM114-Status: GOOD (  11.96  )
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

Add a kernel parameter to the unaligned access speed. This allows
skiping of the speed tests for unaligned accesses, which often is very
slow.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 1548eb10ae4f..02f7a92a5fa0 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -400,13 +400,94 @@ static int vec_check_unaligned_access_speed_all_cpus(void *unused __always_unuse
 }
 #endif
 
+static DEFINE_PER_CPU(long, unaligned_scalar_speed_param) = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
+
+static int __init set_unaligned_scalar_speed_param(char *str)
+{
+	cpumask_var_t mask;
+	int ret, cpu;
+	long speed = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
+
+	if (!strncmp(str, "fast,", 5)) {
+		str += 5;
+		speed = RISCV_HWPROBE_MISALIGNED_FAST;
+	}
+
+	if (!strncmp(str, "slow,", 5)) {
+		str += 5;
+		speed = RISCV_HWPROBE_MISALIGNED_SLOW;
+	}
+	if (speed == RISCV_HWPROBE_MISALIGNED_UNKNOWN) {
+		pr_warn("Invalid unaligned access speed parameter\n");
+		return 1;
+	}
+
+	if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
+		return -ENOMEM;
+
+	ret = cpulist_parse(str, mask);
+
+	for_each_cpu(cpu, mask)
+		if (per_cpu(unaligned_scalar_speed_param, cpu) == RISCV_HWPROBE_MISALIGNED_UNKNOWN)
+			per_cpu(unaligned_scalar_speed_param, cpu) = speed;
+
+	free_cpumask_var(mask);
+	return ret == 0;
+}
+__setup("unaligned_scalar_speed=", set_unaligned_scalar_speed_param);
+
+static DEFINE_PER_CPU(long, unaligned_vector_speed_param) = RISCV_HWPROBE_VECTOR_MISALIGNED_UNKNOWN;
+
+static int __init set_unaligned_vector_speed_param(char *str)
+{
+	cpumask_var_t mask;
+	int ret, cpu;
+	long speed = RISCV_HWPROBE_VECTOR_MISALIGNED_UNKNOWN;
+
+	if (!strncmp(str, "fast,", 5)) {
+		str += 5;
+		speed = RISCV_HWPROBE_VECTOR_MISALIGNED_FAST;
+	}
+
+	if (!strncmp(str, "slow,", 5)) {
+		str += 5;
+		speed = RISCV_HWPROBE_VECTOR_MISALIGNED_SLOW;
+	}
+	if (speed == RISCV_HWPROBE_VECTOR_MISALIGNED_UNKNOWN) {
+		pr_warn("Invalid unaligned access speed parameter\n");
+		return 1;
+	}
+
+	if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
+		return -ENOMEM;
+
+	ret = cpulist_parse(str, mask);
+
+	for_each_cpu(cpu, mask)
+		if (per_cpu(unaligned_vector_speed_param, cpu) == RISCV_HWPROBE_VECTOR_MISALIGNED_UNKNOWN)
+			per_cpu(unaligned_vector_speed_param, cpu) = speed;
+
+	free_cpumask_var(mask);
+	return ret == 0;
+}
+__setup("unaligned_vector_speed=", set_unaligned_vector_speed_param);
+
 static int check_unaligned_access_all_cpus(void)
 {
+	int cpu;
 	bool all_cpus_emulated, all_cpus_vec_unsupported;
 
 	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
 	all_cpus_vec_unsupported = check_vector_unaligned_access_emulated_all_cpus();
 
+	for_each_online_cpu(cpu) {
+		if (per_cpu(misaligned_access_speed, cpu) == RISCV_HWPROBE_MISALIGNED_UNKNOWN)
+			per_cpu(misaligned_access_speed, cpu) = per_cpu(unaligned_scalar_speed_param, cpu);
+
+		if (per_cpu(vector_misaligned_access, cpu) == RISCV_HWPROBE_VECTOR_MISALIGNED_UNKNOWN)
+			per_cpu(vector_misaligned_access, cpu) = per_cpu(unaligned_vector_speed_param, cpu);
+	}
+
 	pr_info("\e[31m%s vector unaligned access\e[0m\n",
 		all_cpus_vec_unsupported ? "All CPUs do not support" : "At least one cpu supports");
 	if (!all_cpus_vec_unsupported &&
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
