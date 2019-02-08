Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7826FC282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 01:52:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49EE421916
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 01:52:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aZ8aGKuW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="eQaA2m/n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49EE421916
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AOG8QA4B4+NI0AuMKPbfk5e0ntZdmlYMjI4ElZCqp9E=; b=aZ8aGKuWADSfy89k4kIXUTzX1S
	R9HRY5sdWMdB0ieZzdsIBkFvTebIeKvYyZTTCG/GpUYpuZsAGnQ/ftov36tF4LBux6y4dfU8cdixy
	n/AqtIXpPbwupXZGk+5mar1s/RK01eMLZVxz5nS9dZEWk74tRLo8U4E+OCUHqZt4ABDaOotTNoKPu
	D/dhYksHW1A3p7TpGdx+rg+iyBaREqrdqjxNeCDGBElYO+NNsP8daR/Wd02MtRFPUD/aXJu5ecXrp
	0xxdFPNA7tcBtyVOouMvCmbLt+UJ99jdcYwthqVHLsgXqT6O1fqgusOBgltLqQ//Zg9AXWKhvLBgZ
	TKypEyYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grvKj-0002nU-TJ; Fri, 08 Feb 2019 01:52:01 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grvKX-0002Zy-LT
 for linux-riscv@lists.infradead.org; Fri, 08 Feb 2019 01:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549590709; x=1581126709;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=a5eO8iqcCF0fX5LzHmEyvUks9ILPsjzZwae5L7sLHgs=;
 b=eQaA2m/nwkQz1NjSzz1GRna2u66fHY7tXs/yhW2jNMjUyvSLgCwk8PGE
 PiE7AK2EUKzA6MYh9kXPtRdL7lYG42oL9gnkkcdHIlshdgjmn/v1FwfpD
 0rWgGy2egLrZQuJUPj6M3588sZl3pNVW5Rvvf1QZ0C3a8MScFFSW/8ybF
 rg5aKql0DWKpMRWt4Dvi+f3IYWFF1GPNiLefgG3C3i8ZW5zomnCvs95es
 zEvXxVAXRoffxUE0XigoJtLdmKBmlpMRNildFrl11qXt+6IGIkWIGd2XF
 j0ayI4gPH1x495xWEjOU9VtQkdknQLQX7zk+ckYQ3anrQ0aNirSKHOB0X Q==;
X-IronPort-AV: E=Sophos;i="5.58,346,1544457600"; d="scan'208";a="102533284"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2019 09:51:36 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 07 Feb 2019 17:30:19 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2019 17:51:36 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v3 PATCH 5/8] RISC-V: Compare cpuid with NR_CPUS before mapping.
Date: Thu,  7 Feb 2019 17:51:18 -0800
Message-Id: <1549590681-24125-6-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
References: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_175149_940164_CA77258A 
X-CRM114-Status: UNSURE (   9.91  )
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
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Zong Li <zongbox@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>
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
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/smpboot.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 669eb332..f120d325 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -66,6 +66,11 @@ void __init setup_smp(void)
 			found_boot_cpu = 1;
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
