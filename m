Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5687CC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 09:39:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26854206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 09:39:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="prhTpQXz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="i3u2DC2f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26854206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FBzY/BYBQVTn7M5/IdfSn9JXASTRRO6az+HPqKYyVuU=; b=prhTpQXzwtVBSZntirD+Jkd0i4
	pnJxVTcvYpvTr71Re4ye67NMJBLcB8OeOH96e4qQJKBLvJCavlIgtotDJXKmHMlOXmGpuKL9bDINR
	H20UvRdLRaGfhvYgPoSSaM4p4Nh+VdtdVC6e2bVa+5kvy3mrdZilu/xlrQP2eUQEdD0ynyN2Sh2GO
	i2pHcCiR8lS9e3JtoykZ1W3amyLbGeqVMBwYZUD3n0iXCNysjk1GXQb24uAkurjW2R46ML/UruQEz
	DcnqhUu0O7+cXUuwl9WnpDaMADqQ1BEAl05zpXn8O/ykAONPLlqLk6151UhtNJsSrVjtB1tgeIB/4
	7zesT9MQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggnqc-0003wh-SY; Tue, 08 Jan 2019 09:38:58 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggnqU-0003mL-RX
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 09:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1546940331; x=1578476331;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=bojnfVslHWWf25l3Qcim0lvK5HIdSXIJ0sC4JHd9reg=;
 b=i3u2DC2f90e7gwkOsGyQC1jBPjSjn99wDqU7ui575fJKkpoyDA4QzB3O
 TWAeNIWZ6aE3CfyPIsBxtGqHEDr7iHEFab5vCuRfwchrqx2U/0gCB1Ldg
 G8Jcdi8RVPqzw69ZwDnUYwxZk2QisduPll1++eFPIaUYRft2KhG7jVuse
 0jLu2mObSMmmheKHetkEHF0VCYCIgNS/qkpR+eSNew3+T2s6WJmej3rWA
 301ulR5WiJj+n0/QJ6EyNxXtK6vI8wFIiRMxvAHhEMypghLc/Wd8cXDMw
 1QknnVcPCZEv2xF2i2v8sz9dcfH5zmtb5GpMBBloBxOcP6bdOt6Ao74w1 Q==;
X-IronPort-AV: E=Sophos;i="5.56,453,1539619200"; d="scan'208";a="100000255"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2019 17:38:48 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 08 Jan 2019 01:18:52 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jan 2019 01:38:47 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v2 5/8] RISC-V: Compare cpuid with NR_CPUS before mapping.
Date: Tue,  8 Jan 2019 01:38:35 -0800
Message-Id: <1546940318-9752-6-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_013851_008307_A258BE0F 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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
Cc: =?UTF-8?q?Patrick=20St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Andreas Schwab <schwab@suse.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

We should never have a cpuid greater that NR_CPUS. Compare
with NR_CPUS before creating the mapping between logical
and physical CPU ids. This is also mandatory as NR_CPUS
check is removed from riscv_of_processor_hartid.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/smpboot.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 32e14572..7954470b 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -69,6 +69,11 @@ void __init setup_smp(void)
 			of_node_put(dn);
 			continue;
 		}
+		if (cpuid >= NR_CPUS) {
+			pr_warn("Invalid cpuid [%d] for hartid [%d]\n",
+				cpuid, hart);
+			break;
+		}
 
 		cpuid_to_hartid_map(cpuid) = hart;
 		set_cpu_possible(cpuid, true);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
