Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E6CC64EBA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:16:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B6EA2064D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:16:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lb7yS47z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="T7337DTw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B6EA2064D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UCOvnR9bdit8vw6IqnjNmVqiUdZgt4B51w12hJU8ALA=; b=lb7yS47zpRdQFSdR0lytbBdG1S
	RmwKdR1Lafl8ZqdVpyYXNxyLUtb+XkO5H6/ROVTNXCAcFq8GiRR9pELm5EWSPlSpx+9jhifJJ5nvC
	6WjMq2mvRciTyjrnfJevDI3l8ovSIbWM5w+EBlkJK1Zk3F1HSAEyeAMSU7eOOY/xksiwoZes4R+Lj
	NA5o8Y3j6QgTFwMke4a+9DVnRES7ryZD44xuZSit7f4JlvntlkmDNRI65eZITIJwPF3NrQWoYeBnJ
	2VMtNzSu2qVOnRru0T6X9y1Zf5iFtsvBonqGNTdB6AqOJmjgeYO3VIodh7763lic2nJrBoFVjQbrI
	eSZTNSPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Q9P-000679-Ll; Tue, 02 Oct 2018 19:16:07 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Q8y-0004mL-T3
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 19:15:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1538507741; x=1570043741;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=QoJF+zxi71e6lxam6xbMcJHOAzHqmAmlkJMulFCOr4w=;
 b=T7337DTwifkc2bSggzVzEhLmsgdtQjk6ZQgZm4/vxuIYGdNNrdwuZGN+
 avqaRklnqVXacUIn8J4fuXpQWfpyYTypPUlGqrkDSK5ZkdG55snfRZq0Z
 Khsi0QX3fFfksE4U/cH39B+0eFvZkLOqWA2BoNKDPKAphtd+AKzAHssOk
 G7broCJUJhZT5qQPOjx28BGZDpyyUgdR1L2nM4sa2bLoLed31ZTaw65ZN
 MrscxNTpBMabajKUUcvGvmpEplKQAoiBb86Oe8V4BEpCzegxF0vwwgoHV
 +cDA3bNN8t2Mq99VbZ8zlEgLPUk5jiNJBeck2CTfhsrcEsQM4JCWHDhuc g==;
X-IronPort-AV: E=Sophos;i="5.54,332,1534780800"; d="scan'208";a="92732910"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Oct 2018 03:15:12 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 02 Oct 2018 12:00:51 -0700
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Oct 2018 12:15:11 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org,
	palmer@sifive.com
Subject: [PATCH v6 13/14] RISC-V: Show CPU ID and Hart ID separately in
 /proc/cpuinfo
Date: Tue,  2 Oct 2018 12:15:06 -0700
Message-Id: <1538507707-22299-14-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
References: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_121541_027961_CD54900E 
X-CRM114-Status: GOOD (  12.19  )
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
Cc: hch@infradead.org, anup@brainfault.org, linux-kernel@vger.kernel.org,
 atish.patra@wdc.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002191506.Jz_UJRoKnrAWz_MDQcEDBoZMz4YNrV9PvrJK7fsNYMk@z>

From: Anup Patel <anup@brainfault.org>

Currently, /proc/cpuinfo show logical CPU ID as Hart ID which
is in-correct. This patch shows CPU ID and Hart ID separately
in /proc/cpuinfo using cpuid_to_hardid_map().

With this patch, contents of /proc/cpuinfo looks as follows:
processor	: 0
hart		: 1
isa		: rv64imafdc
mmu		: sv48

processor	: 1
hart		: 0
isa		: rv64imafdc
mmu		: sv48

processor	: 2
hart		: 2
isa		: rv64imafdc
mmu		: sv48

processor	: 3
hart		: 3
isa		: rv64imafdc
mmu		: sv48

Signed-off-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index cccc6f61..3a5a2ee3 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -81,7 +81,7 @@ static void print_isa(struct seq_file *f, const char *orig_isa)
 #endif
 
 	/* Print the base ISA, as we already know it's legal. */
-	seq_puts(f, "isa\t: ");
+	seq_puts(f, "isa\t\t: ");
 	seq_write(f, isa, 5);
 	isa += 5;
 
@@ -96,6 +96,7 @@ static void print_isa(struct seq_file *f, const char *orig_isa)
 			isa++;
 		}
 	}
+	seq_puts(f, "\n");
 
 	/*
 	 * If we were given an unsupported ISA in the device tree then print
@@ -116,7 +117,7 @@ static void print_mmu(struct seq_file *f, const char *mmu_type)
 		return;
 #endif
 
-	seq_printf(f, "mmu\t: %s\n", mmu_type+6);
+	seq_printf(f, "mmu\t\t: %s\n", mmu_type+6);
 }
 
 static void *c_start(struct seq_file *m, loff_t *pos)
@@ -144,14 +145,15 @@ static int c_show(struct seq_file *m, void *v)
 						   NULL);
 	const char *compat, *isa, *mmu;
 
-	seq_printf(m, "hart\t: %lu\n", cpu_id);
+	seq_printf(m, "processor\t: %lu\n", cpu_id);
+	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 	if (!of_property_read_string(node, "riscv,isa", &isa))
 		print_isa(m, isa);
 	if (!of_property_read_string(node, "mmu-type", &mmu))
 		print_mmu(m, mmu);
 	if (!of_property_read_string(node, "compatible", &compat)
 	    && strcmp(compat, "riscv"))
-		seq_printf(m, "uarch\t: %s\n", compat);
+		seq_printf(m, "uarch\t\t: %s\n", compat);
 	seq_puts(m, "\n");
 
 	return 0;
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
