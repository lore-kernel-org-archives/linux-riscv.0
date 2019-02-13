Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AC2C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 20:18:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 276FF222AC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 20:18:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HC4uwCgH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="QGF8W1HZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 276FF222AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ylVZlvhij+al/8yHz0kKZJpV6j87gnvZlcGdryqgNdQ=; b=HC4uwCgHwPg04wOCSsitzzidFv
	Jo8bwngx5z64fT3Ytf66urp/4t4lzn1ROk01LowFTKIofCQTe95Re98plpOZ329RwDOlxYBVJk/Ad
	B2a1dLtaR2qQAHm9fQ3ElBefWidx2HDZ2fkMwvjeTIJrcSquk9z0qDQAoqK5qQcLFU2RPbfzfeJ7t
	Xb1jrZ6/3U16r4pk01JsnVUZ8hglQgwiVdpw28etL63WOh3N0cr6k3mf9EwKuKmJRkMiqUzEb7XNi
	Z/jAyn/zeE+htWsKl3uaFtGOLPIdLDFfVPyYi8gKeZW2AplJZdd2uRHr0XW0LiSPc8sNcE1GHnUkN
	mhufD14g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu0zK-0003R6-C9; Wed, 13 Feb 2019 20:18:34 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu0zB-0003CA-OS
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 20:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550089106; x=1581625106;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=8ACS64L8kLVdF8msWr97l0gsAFThAeL/KOxtN4a6b6E=;
 b=QGF8W1HZGRzWc8dWzYQ4zESBFx0bptQ34y4Mitv9tKGggKuLuysku27g
 AE1QXXg77FHyMSyPP4tNd36XjnTKcQBFe4SdsApTO2tt9hAsSAchr27FC
 Bt0F8x7sSp13y6Jcf8B33Z+nIGblBSBxrS1viLoMM4aiXtbEZnPgMFw6S
 o5zO5bFQ/cQq1ZYaSRBWIOwnQO3T2q2e4dxBBfZ2IhsLk4msc9QDhddNF
 EBERzAqLYIpGV4HneYDowTYhuGM7OfKjpgSeS2soi8havuVCADdaGCCaD
 m/oD78H37ddXX32S6tlzWDkmm4QCaGiaOtGDo20+0TGY+ML1EQn0DzjBo w==;
X-IronPort-AV: E=Sophos;i="5.58,366,1544457600"; d="scan'208";a="102463833"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Feb 2019 04:18:22 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 13 Feb 2019 11:56:55 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Feb 2019 12:18:22 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v5 PATCH 7/8] irqchip/irq-sifive-plic: Check and continue in case of
 an invalid cpuid.
Date: Wed, 13 Feb 2019 12:18:11 -0800
Message-Id: <1550089092-28783-8-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550089092-28783-1-git-send-email-atish.patra@wdc.com>
References: <1550089092-28783-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_121826_139687_A4B54896 
X-CRM114-Status: UNSURE (   9.99  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Guenter Roeck <linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

riscv_hartid_to_cpuid can return invalid cpuid for a hart that is
present in DT but was never brought up.

Print the appropriate warning message and continue.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/irqchip/irq-sifive-plic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 357e9daf..254ecd76 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -237,6 +237,11 @@ static int __init plic_init(struct device_node *node,
 		}
 
 		cpu = riscv_hartid_to_cpuid(hartid);
+		if (cpu < 0) {
+			pr_warn("Invalid cpuid for context %d\n", i);
+			continue;
+		}
+
 		handler = per_cpu_ptr(&plic_handlers, cpu);
 		handler->present = true;
 		handler->ctxid = i;
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
