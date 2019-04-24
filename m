Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9873C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 21:48:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 984E82183E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 21:48:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RWYNNneF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="PqV5G4HW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 984E82183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZhzruJOjhod8LIOd1LQAFm7CCQDmbaIZZxoBrNUyYNs=; b=RWYNNneFYqU6qg
	wvOuBK/xPJoGSvh2XovrFisqHiQVs07Bu22+YahzB1gqiq+tjC4bBlI+L8oQYhmzdTw7vyt5nBq9z
	x3BnauEtaBlfvAsXy7yYTa4UEa439Y2di81o6nzDGVWQ/LYIjBOTx0vgGK4Zeynks++LEGugsEDYe
	okTzJIlT59+Wx3GPA1Ei1K095RDwk6QETEDV31AmEpMhsrMPaZudKmlJ1ZpQEmSzhbkj59GouakFb
	BUJXNB2K1SY/TutM2e7j3pkZYDNhS/124/DIkWU1UO3ZXt54fy0so8sZ6bDPYedM3qmAkLqBV7ylP
	15M6MZkcR2OFVGTJorEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJPkY-00012P-GN; Wed, 24 Apr 2019 21:48:18 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJPkU-0000zv-Sw
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 21:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556142494; x=1587678494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ptio9EMvYP5f+ORUvvZuKR6bpx8beU1V6Uj718zf84I=;
 b=PqV5G4HWfi+BfTChUrhjYgIFAt+WLvY1/lC/dU4mieAYJf+ac1Nknntw
 mgmLT+19tufxBjnJM4MDlQ9JOD5U34+8OZwitQn8oZCUwi20oLLjftFAt
 nYbf6iEV1jeFH0bkTtVLS/hXA+ftl/AVh0x5/QxK1SBFtwD7adUpNq76U
 QK1whfpRV1YbZdZyC1opkfeGJVPBX/XMKfTQiDWPxZ4Ge6973M2eQWIMY
 q5mlypABpuyznyPFrYjxLaYAQMT5Re0k2G2RKmNSxT4MSq+jBsvRu9S/r
 zSZ7keH4ZxNCOhD0uXBEHIM+d3PzCXAQbXvGyJM6EmfivXHVbC3Qf4lXm Q==;
X-IronPort-AV: E=Sophos;i="5.60,391,1549900800"; d="scan'208";a="212581725"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2019 05:48:12 +0800
IronPort-SDR: gb1wYxazq+ABpdmesxX2hVADf3uRkH14xRNWSAboigGvFKu5cTO/kEKPS+x8LmL/d3tPShGbtZ
 MjxGU0bssDGwQbhTcnoo/5VOROyYjZa3hcwkASY45AvIgdoWDLUEQAmVrANz+7xSoZjEEfKJVp
 kkOzMHKJEsjDgF+Z78f5Dl2IwgTYWr5rnYYxlrQXbyAe3pmJcaYLeHmVJJLhjnBwYZ3995hlPz
 Bit37sy67h0sJ79nLLelk1rYTkVrKfsQRbR/YJklpoZaREfUtNgquNXGK+qdenBQTMjFANcthj
 bY1yRTRnU1YnZUm8RRiO8gpt
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 24 Apr 2019 14:24:43 -0700
IronPort-SDR: quCW3b+lX1Ndy1Wt7UxWgfVqe8zOsHY0ctGiHEEhl8VQViFsLHwbAKApNMc4MLDnJ71TfEvJhG
 5fmonddg2oJW1G2U9rn9a7BumtehvKQptK86BofNA8471TxgDQT6rF/2i9WS+QuFMkU9GAFp4o
 2y/UkPjhmrIk5VUtMBi1zS00v9Ohr9fgMct/lsRVpT7EixYquKGXVPDBGRyLy2P1hCDHLp/J7W
 5424QVAXORveZ4zm0dLvUkuzw8uFB6G1HdmrcfKGv0ancXO1BgZz7LAfvAcEfa1WjJDwpUSMj7
 lLc=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 24 Apr 2019 14:48:12 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] RISC-V: Add RISC-V specific arch_match_cpu_phys_id
Date: Wed, 24 Apr 2019 14:47:58 -0700
Message-Id: <20190424214801.18880-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190424214801.18880-1-atish.patra@wdc.com>
References: <20190424214801.18880-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_144815_074656_403052EC 
X-CRM114-Status: GOOD (  11.19  )
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
 Anup Patel <anup@brainfault.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Johan Hovold <johan@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

OF/DT core has a hook for architecture specific logical cpuid to hartid
mapping. By implementing this, we can pass the logical cpu id to cpu
node parsing functions.

Fix the instances where logical cpuid is expected as an argument in
of_get_cpu_node.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/riscv/kernel/cpu.c | 3 +--
 arch/riscv/kernel/smp.c | 6 ++++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index cf2fca12414a..c8d2a3223099 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -136,8 +136,7 @@ static void c_stop(struct seq_file *m, void *v)
 static int c_show(struct seq_file *m, void *v)
 {
 	unsigned long cpu_id = (unsigned long)v - 1;
-	struct device_node *node = of_get_cpu_node(cpuid_to_hartid_map(cpu_id),
-						   NULL);
+	struct device_node *node = of_get_cpu_node(cpu_id, NULL);
 	const char *compat, *isa, *mmu;
 
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 0c41d07ec281..89251f8ab754 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -70,6 +70,12 @@ void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out)
 	for_each_cpu(cpu, in)
 		cpumask_set_cpu(cpuid_to_hartid_map(cpu), out);
 }
+
+bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
+{
+	return phys_id == cpuid_to_hartid_map(cpu);
+}
+
 /* Unsupported */
 int setup_profiling_timer(unsigned int multiplier)
 {
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
