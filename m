Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE35C282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 01:51:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E7FC20869
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 01:51:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p3pUVyyr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="jDVr9vId"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E7FC20869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=n+OyUo+NViPX7gVEu/jiSIQ8bLbDgn3KxH3I3WdgE18=; b=p3pUVyyrXCML+JL/4LMeA9QyLD
	ltXEJieYyz/js94zdxuQbPDAtpnOtJIiI6cvb+o60qqK/yeo0WYd5oHCtRHodqcP/SX+fVIVh7rVi
	cp6vk5uAsRSuAr3oCYOgWS5FnmHGU66bzeNY38iltjleXWQciPitvvTlwDA27ESiD1fsrFllwsz0l
	5fm928ffJZKyh2YTy9rUTELFrjTSsxijrXAEEA3jcXCt+YUrARqG7k4/gf8J2rsCrZHmMr7JLowJp
	h9crxwUuSSFng1Nov5TrsPKKt1xmHtmbKEBHJrngPGemaIcO5y0XHbB5mtTSaXCWGF5MW8g9iygHB
	0j+Gu9Sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grvKc-0002f8-Ny; Fri, 08 Feb 2019 01:51:54 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grvKX-0002Xt-D9
 for linux-riscv@lists.infradead.org; Fri, 08 Feb 2019 01:51:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549590709; x=1581126709;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=7egq28/CSCkrSFqdZR+3wqM8pX3AZ5gSH/KN6l36VFg=;
 b=jDVr9vIdUrjnmSeHxA/wgL7ayiII70mdOAu8tZTMg6Gf7v0siBOKA7KP
 79LGSqQd7tG+kj60feJJgIMvB/IAYqMDi7LJOCnta4zVMtO6ax/I8xvfp
 ROgLzn355sxPUIwd/QLu1xe+NL/0YksClTY11zOk9Mh3R9w/nemXRuF7q
 oWxtIwNibLRTaQa12oLn6yK3ET7R9uWqk8LXfbpJQ/brbm3OuT0Ykcn/z
 vansyWifCAo+J8+Ji6ITsBwG/vyr3yJBKzFjDx+geGRFN60KzJjSTE13+
 EyPDgakV7eSwwiIbK6DU0dIyEykQ2p+DYga8LXemNitcKY/q2TQCfTvtS g==;
X-IronPort-AV: E=Sophos;i="5.58,346,1544457600"; d="scan'208";a="102533282"
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
Subject: [v3 PATCH 3/8] RISC-V: Remove NR_CPUs check during hartid search from
 DT
Date: Thu,  7 Feb 2019 17:51:16 -0800
Message-Id: <1549590681-24125-4-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
References: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_175149_830378_2CCED967 
X-CRM114-Status: UNSURE (   8.82  )
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

In non-smp configuration, hartid can be higher that NR_CPUS.
riscv_of_processor_hartid should not be compared to hartid to
NR_CPUS in that case. Moreover, this function checks all the
DT properties of a hart node. NR_CPUS comparison seems out of
place.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kernel/cpu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index f8fa2c63..19edaeae 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -34,10 +34,6 @@ int riscv_of_processor_hartid(struct device_node *node)
 		pr_warn("Found CPU without hart ID\n");
 		return -(ENODEV);
 	}
-	if (hart >= NR_CPUS) {
-		pr_info("Found hart ID %d, which is above NR_CPUs.  Disabling this hart\n", hart);
-		return -(ENODEV);
-	}
 
 	if (of_property_read_string(node, "status", &status)) {
 		pr_warn("CPU with hartid=%d has no \"status\" property\n", hart);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
