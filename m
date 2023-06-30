Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619B3EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 10:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7gJ7Apg+iwHSEzL+qpbHxBNe8PgVZ0D6lcBFCBWr7TA=; b=MGf+8Ty0MgSUzl
	HohpwqSD+v9FEJtQCDwXjIu+YJxfl9QkU1chBTESA8RILNcSpk2rIbrKBDdV/Y4OMRnVe0SDbBgMq
	O/C6VWYLVCdB5TzbfYRQz+JM1D5ALhUSO3SfTda4bC0balpVeJlhRQxjCpRXerjfcQwu3vF+qMnIK
	Db2lywXZarOHk3MUJb2DuMMy0dKNAveFaay+nsNHm4lpvW12lR0i+LYIj5BNyG48/l4Z6muisQ0bc
	zGOSA0eGGgmEup8rputzR5MHPYOSF0IbuCDJrKmCpSYijQ/P5UClXcNLZKkxpWgHWISaFZCqU0z8F
	kYlRYfmukrmslYmpJWYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFBqx-003TVb-1x;
	Fri, 30 Jun 2023 10:59:51 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFBqu-003TSz-1V
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 10:59:49 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b80ba9326bso13272465ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 03:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688122786; x=1690714786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFrE+nd0LeR05nJ5NVrdpn/ufPx0wKCGgMdooQskSO8=;
        b=M62+hmz8SSePadjJXz71Q8pq7HqyWXfJKK/UQMiabow3oyGMUgm9ZYsRS94utLkGwI
         4Wsx8nROvO2Ib0/xd8v+4KdX2+7yeDpFd5PBrM/dyfF0cPN0HDkK8yPsCFqjHhPnDZXL
         quDB65UYh0TTv3lJ4aNeRNfp+vCd5lD3o/yRO4Ik/sboKP7QdKchzdOJx4l89gjXSUVU
         Zha2W5a4WkGTTDf2oN8cpQYk168Nwfu7penKwi8uFSmIj/UPW8riJ3sGbXwYr2R9WVvR
         EqRiKLhEiPN2d7/DHGt+EG669RXUmp/OKDjXXErwGitM5CIaMYqHPHHdRKUQPAYCDMu9
         ZVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688122786; x=1690714786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFrE+nd0LeR05nJ5NVrdpn/ufPx0wKCGgMdooQskSO8=;
        b=UBGhSHn+m4kjnzXa9mVAO7M09HDbcWt14q1bHqfqulVGIEwHjyV3ZpWuR5U0DGZ3mi
         Vc+Pn0AHrxD+O7rVkutki6ZswJgjl8DbnpyvJvr7j7QWupnUytU9yZg8/j100ij+5vuo
         Mlzl8s64UArQGbYwBI83lzMSdztFa81mV5jx1rFQvLi+AQU6wJkDoY/RY7Irk67IfCV2
         1gg7QsS3B7i56c55gyVvrGK/T7mjExVflglaKVjSKkovbABLW03yHOyLabqG9yPBmJuy
         rm/EgmrYi0fX8G0SFpsoO3lYqOpPsP5NNRCVECjidYV3Bfzt54qDmsSaKiKGGG/0ucWC
         8Hcw==
X-Gm-Message-State: ABy/qLb+IoJXbwdhzLqwP2XrvukGbbfy+2cGbqMDL2HGxLw0c9YQbaf1
	BFs9saB1y2s5K8/W7E4pmLM=
X-Google-Smtp-Source: APBJJlEorxDlYCCE4k4tSFhPD6RKUovabJRUTk9iGyqV1FTWpz/+wHvtljhQWARdjwkL2hP5M9x61g==
X-Received: by 2002:a17:90a:4b:b0:262:df8e:fcb6 with SMTP id 11-20020a17090a004b00b00262df8efcb6mr1998839pjb.43.1688122786288;
        Fri, 30 Jun 2023 03:59:46 -0700 (PDT)
Received: from localhost.localdomain ([2408:843e:c10:118:1a0:d87f:f44e:7fe7])
        by smtp.gmail.com with ESMTPSA id q9-20020a17090a68c900b0025bf1ea918asm10435172pjj.55.2023.06.30.03.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 03:59:45 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	ajones@ventanamicro.com,
	sunilvl@ventanamicro.com,
	heiko.stuebner@vrull.eu,
	apatel@ventanamicro.com,
	suagrfillet@gmail.com,
	evan@rivosinc.com,
	greentime.hu@sifive.com,
	leyfoon.tan@starfivetech.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] riscv: Add BUG_ON() for no cpu nodes in devicetree
Date: Fri, 30 Jun 2023 18:59:38 +0800
Message-Id: <20230630105938.1377262-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_035948_502614_30696F01 
X-CRM114-Status: GOOD (  10.12  )
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

When only the ACPI tables are passed to kernel, the tiny devictree created
by EFI Stub doesn't provide cpu nodes.

While if append the "acpi=off" to kernel cmdline to disable ACPI for kernel
the BUG_ON() in of_parse_and_init_cpus() indicates there's no boot cpu
found in the devicetree, not there're no cpu nodes in the devicetree.

Add BUG_ON() in the first place of of_parse_and_init_cpus() to make it clear.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
Changes since V1:
https://lore.kernel.org/linux-riscv/20230629105839.1160895-1-suagrfillet@gmail.com/
- revise the commit-msg and move the BUG_ON into of_parse_and_init_cpus() as Conor suggests

---
 arch/riscv/kernel/smpboot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 6ca2b5309aab..04d33afbdf55 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -147,6 +147,8 @@ static void __init of_parse_and_init_cpus(void)
 	int cpuid = 1;
 	int rc;
 
+	BUG_ON(!of_get_next_cpu_node(NULL));
+
 	cpu_set_ops(0);
 
 	for_each_of_cpu_node(dn) {
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
