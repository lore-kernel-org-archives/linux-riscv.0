Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50365C43613
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 09:38:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BD43206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 09:38:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zsi6IbcM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="cOJOA4pj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BD43206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AK6m0/F8snbWxj284KZIIMnrG81Fiki9OwkblnXfO6E=; b=Zsi6IbcMa+iTGBQ59F4aWoy5Vq
	T9WfJxWaNaSjxs0MC1zgCWuwcz5g0wOwydw6j19S0pHLUx1Z1c671U/XBjxM3WQGN5CBc8ZKoeUFU
	FSXlIrDXiYGOM5+Ehe9IWre+aarSe+7Ztga80vzwXxnTyD+mUkY8EXs/IVQVHL6n0Vc8BI2AjkqPn
	YKsMxANqj5QB6DXzYyCT2SbY1YP7AjMOMC7o6WzoXAvhLTNZoG9UiNFoB/YnAx8cWIuGKE2q1xkHV
	c5FtJ2yRcsQqEFHLhgGImYjZF5jXCMjemwkaqiEl46tkwkT7Mda2kPPX+xl6Qf7O4DPfCRveFjrNK
	d3HvxY8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggnqZ-0003sT-Ci; Tue, 08 Jan 2019 09:38:55 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggnqT-0003lt-7y
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 09:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1546940330; x=1578476330;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=m/8wk+BMZ6U5qeF6LVioutsW76YRgCcFXfZnC5OB1os=;
 b=cOJOA4pjCe6j91zsVunQzimpYC/JrXLYrMw9pLDF2Dm97nn1z93SM50m
 h7Nb01eqaQZ81uzYvYsncCRsnUjdrUQGsMTyP1/+LpyYCqkCIvEHPeh02
 xnx0XESHlqXd0n6U8Hl3aCsr7RgBWIw33h9bXf9HPhWZS4iWQQpu3P7Fy
 3Q9x7Ah5pOqGAjNiPEGK7EkABBYXvGFm3Xwb/BJDd3U8x0b/b7Q0OOaUQ
 jjJ+SI38kj3cbnLuGeDkvit+zkUIx6fINwL31p59QgVWw0PYjHPKQZuLH
 3nPGcD5+pHeLtIwdDDgpDllLw98MrBgIjWua6We6uUL/8WelR5XnBUDu/ g==;
X-IronPort-AV: E=Sophos;i="5.56,453,1539619200"; d="scan'208";a="100000252"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2019 17:38:47 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 08 Jan 2019 01:18:51 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jan 2019 01:38:46 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/8] RISC-V: Remove NR_CPUs check during hartid search from
 DT
Date: Tue,  8 Jan 2019 01:38:33 -0800
Message-Id: <1546940318-9752-4-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_013849_386091_E745DDA1 
X-CRM114-Status: UNSURE (   8.66  )
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

In non-smp configuration, hartid can be higher that NR_CPUS.
riscv_of_processor_hartid should not be compared to hartid to
NR_CPUS in that case. Moreover, this function checks all the
DT properties of a hart node. NR_CPUS comparison seems out of
place.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
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
