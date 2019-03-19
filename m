Return-Path: <SRS0=7N9o=RW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E23C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2019 22:20:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A23962175B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2019 22:20:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N054tl1B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="dlorfKHu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A23962175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BlFRjNYL7sMV+rPYm5GRya/aa284hpuEYaloSFH+zdA=; b=N054tl1BlmDSVz
	6qpmrFJ1jjEj/VGCrlF9YC3cs1reWGWRS21GlHFRUEjvJQ7TzuWVhI73f2tnSNgAGLYkZEtrknV3Q
	A+gYMd8Vj0IwSUMLtu2/zfNSQ9qT4k7SbeKpQUNgekT0OIGmSH86zpVumyaL0QYylajUlbuFIiMkL
	shhp4dhZsq3TFIG0tU15mYRRMUY6oQW+AhH6G6H4UE02DHoym0d/AOlYjfS1dF7NbNQP8qwkemV86
	qWACVCIUFKyy9J8cJMaOt5SFsvJighiotiD3eVazmnhTrmg3PD4c98IVRmzV3PrXlMBBjJC46+Ald
	S/JjkuZxB4eF4HPcRavA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6N6G-0003PE-7p; Tue, 19 Mar 2019 22:20:48 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6N6C-0003KZ-Ee
 for linux-riscv@lists.infradead.org; Tue, 19 Mar 2019 22:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553034045; x=1584570045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L+ofvLBu3teqXjyuNvizoBfdnh+2OK/Hq+Is5NyQizk=;
 b=dlorfKHu+Ntt80nj145DPLqByx976xbVfEeqnv9fiQUoHjR3JGJvXzFM
 wv3FXMySIpXvRh3z3hUMmLGMYEy1drWHhtaUowv+Fk7aI9MeurjtQit2E
 p7rHuzuahz/ZdE0mNjDy4bYsQbK7QCdaay2S0x+NFKHATQTIgc5AS6O3I
 zZ6oDPtS6Dw7uiM0m61Vzk397cCKgjw9LSSEQqJ5iR9ngHRCI9cgBvIfc
 nzf5MIGFlKnyX2CHihF4eVOUAtmYNvKkEnw4Z5B1ks7T5CYuvmrRrn3FL
 j0pH4BK0Ev9gWYaTDIzyolYTioqaNV5p2lajviWzi8XIoCMwsZBobOW2C w==;
X-IronPort-AV: E=Sophos;i="5.60,246,1549900800"; d="scan'208";a="105129864"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2019 06:20:43 +0800
IronPort-SDR: S4Axhll0eBzNndjrNgg1twzTK3phMeq5hU4W+7xHQ8QrrlAhERpLuJML1At9F7y8SGgTC+VrmK
 uPuZJvhVxXzpwXh8iEd1JmuzlVKURBiwtoKx8srhCfo6iaHQfe04a7LFyhT3ThUtU+lOPKOlCI
 P0R6BEYqVeRuplbgMqV45HTA0+TUHADhOjPtpomF+LuSDzwMOt23Sixq1FyxiosKCOm+H4CkAQ
 yxmi7+gM/MIE5kZWH5siR8abO8imSNcc1mjEiZneDUZW9dEB/KyMGl5XGstAGedNuUP53Tc/tA
 /CStxmwgLB6ZFvNtd09TDXxJ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 19 Mar 2019 15:00:22 -0700
IronPort-SDR: VcKq2dqPDs/FdGnf+fVnkyRVToeqlLSVJ7/l5js6EPxjNkDWo3KcMkYjyoDiiKm3LHkTogiUMY
 hgdWkDLRevhuHVM/JAMf7UpjznW7YtgYFW+Rctq/nGIdMxFXJbsqJKbYvqAicMDbZeCE2WGyZZ
 pSGv3d3vuGALE0Q1j6Ka21To44+GFz8Y9qb/jRlHbjyNvMhxyNpAmVagm7pHNemcnQFehPk5an
 z/PG4qc1fPR6YWIA8dgIxTHiHQ1YCYdSuPqP2bi+OKDkN4mXXP7mvJV9dJHuHoMUnxj42IyT5s
 EgY=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Mar 2019 15:20:43 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v1 PATCH 3/4] RISC-V: Implement nosmp commandline option.
Date: Tue, 19 Mar 2019 15:20:27 -0700
Message-Id: <20190319222028.4293-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319222028.4293-1-atish.patra@wdc.com>
References: <20190319222028.4293-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_152044_622224_31BDC1F3 
X-CRM114-Status: GOOD (  10.02  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

nosmp command line option sets max_cpus to zero. No secondary harts
will boot if this is enabled. But present cpu mask will still point to
all possible masks.

Fix present cpu mask for nosmp usecase.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/smpboot.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index df353199..609475c5 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -49,6 +49,17 @@ void __init smp_prepare_boot_cpu(void)
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
+	int cpuid;
+
+	/* This covers non-smp usecase mandated by "nosmp" option */
+	if (max_cpus == 0)
+		return;
+
+	for_each_possible_cpu(cpuid) {
+		if (cpuid == smp_processor_id())
+			continue;
+		set_cpu_present(cpuid, true);
+	}
 }
 
 void __init setup_smp(void)
@@ -76,7 +87,6 @@ void __init setup_smp(void)
 
 		cpuid_to_hartid_map(cpuid) = hart;
 		set_cpu_possible(cpuid, true);
-		set_cpu_present(cpuid, true);
 		cpuid++;
 	}
 
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
