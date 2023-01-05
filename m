Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7370C3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 18:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8SqrnvESaDDd2jekSMfcCgqMNzb1HMtIgzClfc1eb8I=; b=bWfbWeH6tT+a03
	cbSBXC2idVisNii3c6EBRoLUxydqvtDHYrsPH0Teh8OKdmHnj3kqjwidQPyUZBm1L4Dn9rd+Js2YI
	WhJYM+tiYr0eNm6Azo9/wUS7EYZIUlOSIxpgVHyKfdtr/W3llJ0Krems3cD3V7OThluA3qRl0Bccx
	JVrF2JRmC48Cp+RUqv8UvC2EepExRWYwHXpjjwXXwka8yzt0Bz8tAmyrYBWZQGTjz+ZY72Lmcx+nz
	lD90QO+vlCRKNXzRd4LMJBdZkmjem4nPSUyt6tVhY0HKVq/OTPT2hgzt6KpaUvlyYC6ba9uzImiCU
	ZcUByvxC9MKvosjbvSaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVRL-00Dtw6-Sd; Thu, 05 Jan 2023 18:58:11 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDH4i-000xCr-Dx
	for linux-riscv@lists.infradead.org; Thu, 05 Jan 2023 03:37:55 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 98BFE24E1E1;
	Thu,  5 Jan 2023 11:37:17 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 5 Jan
 2023 11:37:17 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 5 Jan
 2023 11:37:14 +0800
From: Ley Foon Tan <leyfoon.tan@starfivetech.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ley
 Foon Tan" <lftan.linux@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2] riscv: Move call to init_cpu_topology() to later initialization stage
Date: Thu, 5 Jan 2023 11:37:05 +0800
Message-ID: <20230105033705.3946130-1-leyfoon.tan@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_193752_779869_2AE28F34 
X-CRM114-Status: GOOD (  10.75  )
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

If "capacity-dmips-mhz" is present in a CPU DT node,
topology_parse_cpu_capacity() will fail to allocate memory.
ARM64, with which this code path is shared, does not call
topology_parse_cpu_capacity() until later in boot where memory allocation
is available.

Move init_cpu_topology(), which calls topology_parse_cpu_capacity(), to a
later initialization stage, to match ARM64.

Tested on Qemu platform.

Fixes: 03f11f03dbfe ("RISC-V: Parse cpu topology during boot.")
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

---
Changes:
v2:
- Update commit description with suggestion from Conor.
- Added Reviewed-by.
- Added Fixes.

History:
[v1]: https://patchwork.kernel.org/project/linux-riscv/patch/20230103035316.3841303-1-leyfoon.tan@starfivetech.com/

Conor also submitted patches in [1] to add "capacity-dmips-mhz" DT
parameter for RISC-V platform:

https://patchwork.kernel.org/project/linux-riscv/cover/20230104180513.1379453-1-conor@kernel.org/
---
 arch/riscv/kernel/smpboot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 3373df413c88..ddb2afba6d25 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -39,7 +39,6 @@ static DECLARE_COMPLETION(cpu_running);
 
 void __init smp_prepare_boot_cpu(void)
 {
-	init_cpu_topology();
 }
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
@@ -48,6 +47,8 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	int ret;
 	unsigned int curr_cpuid;
 
+	init_cpu_topology();
+
 	curr_cpuid = smp_processor_id();
 	store_cpu_topology(curr_cpuid);
 	numa_store_cpu_info(curr_cpuid);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
