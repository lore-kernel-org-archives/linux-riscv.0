Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51ABC0218A
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Feb 2025 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T41qsjbsDA34dVLjQgcw3HNW1XpFz2ysZWxIjSue7Lc=; b=x3bomKqAD2OgDI
	pkPTOgqe1ZMOML8OhayyeegvQT5KkwWKNvPhpdkzisCC0MPce95fUGubwAosBBIVZ4I+Q35Jjkg2W
	854MX87Ag1INFW07su7wLhWfl/KcLQBjqMMopO0oREzkkL29dO/149DCbMM/9mnxhlsXYb8UxQtzF
	MpCEZODdQ4XzoL5+IF2FEPbVUTg7iYW9wiCodTavSg83WdDSRLBIyDjCPSaBaKbIQNnfCWtqOrNLs
	putPowBQiO8ze+34m47LeNCFp/s8mdBRarZzIl3Ie45m1ju6NcfUegZj7pLjyAdC1Q3sFHiNdq5An
	IlgFJlkvtOksBFX9Bx1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teBKP-0000000CCaI-2UcS;
	Sat, 01 Feb 2025 11:06:21 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teBKN-0000000CCZx-2Wj2
	for linux-riscv@lists.infradead.org;
	Sat, 01 Feb 2025 11:06:21 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2166360285dso48094105ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 01 Feb 2025 03:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738407977; x=1739012777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NFPVMy8BgNHHVFCk4Umjo34OqaXwDDOaW1/XfTPcIuI=;
        b=Chs7GbpDXrCo5bf2jJWGm42R/C9oL0xuH1f7yKOQYVzp8he/nAYS2Ac5Xr4odYpMKK
         Sx4eyIvd2UVZTXRVEJB0NffIL4DRtcUV+UkjU4HTvJ0VNdofCeQAvwKcmRkSw3WPHfuc
         ZVgMAJtdZR6N2pB4utPtAGJ4HNOYUuwc0JIfmErhzOUWJHF1x74Pdi4f+YqcoatwiE1h
         X9aGgdQvcPGU7BOyh8PxcEaUuCgC28a5w0TSzBxWLbvg9ADoDDmxRrS+415i5Omsl/jC
         KbB7JNuCABZPTQvhiO/gfuEs2/h4y1DsoQiqBLmax8OpBYy1kdulGrGfqSX4mJ+4O6EI
         K02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738407977; x=1739012777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFPVMy8BgNHHVFCk4Umjo34OqaXwDDOaW1/XfTPcIuI=;
        b=Qw+iqyMlZLNutHolooHQ43z5kWj5XX4IMgr5fXgue2aRjuXrckAAxWzSS39TSxa2Wo
         GHkXDAHfTstle1/trhJ5cSUNj4jnioEKMo/mVwOOUAFWe5aJYeplbc1PadpfPoUH0r6D
         Y/UDsLA5cOjX87xIB0l6pOLK8q7b9mB1XvblsV2iSeGgY5I0fbisow5Ad6lqF2yqpy6G
         5OFouqkb+X2s4r+xn/Y48tv+pZF66tP+BTulWHYfPqQhVWn7Zpz4BfBGTkeC8+UmGh0O
         DiNngwAXizp8KrOlC3cQw89eFtouxMCKcOpOFJsU7nJ1YQDP+9Of9TOv+LzaH8toSEwc
         fYUw==
X-Forwarded-Encrypted: i=1; AJvYcCWWFN6s5/XMYpNTYMcL0iD8xsQmwsahLsl/tb5JSCNFrQiSYdLzuZ8zlhn8fijT7MQLXQZBiHVlEiQcnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/v5XrFv63zep602roz6jEzKbrC/W9naCO/kKOBwfnrxrvQr1P
	qS1JQlAveVUuBQm/8h4at5dGIDGEjN3kxwEd3HLCrT+K0vRHDUWOnFy6uRW+aSU=
X-Gm-Gg: ASbGncvvXrhmDDe+bVWqTRUhUcmitzNo352/WDNbxBf+dyNtMLO9toZC7TLdVRl46Om
	KAH+8BGMKBFFF/rbxbwJiMVBruRDY/F16xzraQOK5+oLGOJihE6y3CxlJqjDBhVxnLHc1VudEGe
	ys0yLj/5aXSugMCnvZpgj+t/uaRSxCuRZZ5Zv/N6z50qvXcZm5YjYE5jgfpqYlh65U+U+owwq7E
	X8aC2CPExRcOwjLdPFUbGEMvVexDYiwQ7z8Inu7v3nWGUO42XL1Yjt7lMmsbOCGLO5g+aE86n1U
	d9htRPw6GE4n7Fx4yU1mvr/TuiklocrXf8xqQlC0FokEJ3dExg==
X-Google-Smtp-Source: AGHT+IFFncmjCRHjy9I4MaDVqunMMShucAcAwY2M9gZO0BE9KZ2l8j5Bo0vUbRC/ex69Cu5wj1kdVQ==
X-Received: by 2002:a17:902:ba97:b0:21a:7cbe:3a9a with SMTP id d9443c01a7336-21dd7c62bf4mr171522585ad.14.1738407977468;
        Sat, 01 Feb 2025 03:06:17 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f72d1sm43817065ad.78.2025.02.01.03.06.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 01 Feb 2025 03:06:17 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: apatel@ventanamicro.com,
	atishp@rivosinc.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cuiyunhui@bytedance.com,
	samuel.holland@sifive.com,
	alexghiti@rivosinc.com,
	jassisinghbrar@gmail.com,
	takakura@valinux.co.jp,
	valentina.fernandezalanis@microchip.com,
	ruanjinjie@huawei.com,
	charlie@rivosinc.com,
	conor.dooley@microchip.com,
	haibo1.xu@intel.com,
	andybnac@gmail.com,
	ke.zhao@shingroup.cn,
	tglx@linutronix.de,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: print hartid on bringup
Date: Sat,  1 Feb 2025 19:06:07 +0800
Message-Id: <20250201110607.34766-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_030619_949401_4F385ABC 
X-CRM114-Status: UNSURE (   6.48  )
X-CRM114-Notice: Please train this message.
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

Firmware randomly releases cores, so CPU numbers don't linearly map
to hartids. When the system has an exception, we care more about hartids.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/smp.c     | 2 ++
 arch/riscv/kernel/smpboot.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index d58b5e751286..e650dec44817 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -48,6 +48,8 @@ EXPORT_SYMBOL_GPL(__cpuid_to_hartid_map);
 void __init smp_setup_processor_id(void)
 {
 	cpuid_to_hartid_map(0) = boot_cpu_hartid;
+
+	pr_info("Booting Linux on hartid %lu\n", boot_cpu_hartid);
 }
 
 static DEFINE_PER_CPU_READ_MOSTLY(int, ipi_dummy_dev);
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index e36d20205bd7..beba0efb00b9 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -231,6 +231,10 @@ asmlinkage __visible void smp_callin(void)
 	riscv_ipi_enable();
 
 	numa_add_cpu(curr_cpuid);
+
+	pr_info("CPU%u: Booted secondary hartid %lu\n", curr_cpuid,
+		cpuid_to_hartid_map(curr_cpuid));
+
 	set_cpu_online(curr_cpuid, true);
 
 	/*
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
