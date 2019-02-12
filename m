Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16044C282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 11:10:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE55E2184A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 11:10:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VYxr55Yq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="AIpI+N3i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE55E2184A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ta9gXPE3TfFK+SXfYXeO+10Ybyu0RNdH1K6svt3iFso=; b=VYxr55YqJgZK8ErbWVY/3O9OLh
	ymCXB9V5ix/1LQSo47FhOWsYj5TVUMH0poejW1T63wSLx6tcAgT9rS5ZwzfNEYWTOILziEs7Q6SfT
	pJjzdFekWBeeOgjNe76z+ZJGXmltvLD/IZmpvPhdsrdOJq3girrs3RAqy00Q1GB2Wcig4vPKJHT6X
	D56ZTWgHsZrkf3iHdpk00bvhVb4IGxrrTL9Ru4xEEwirX7xAJSBjbQahV0KMxwhxlZqM0ML0I6KUx
	yGMrK+Bs8v+24B5GxoCBqJtQs9Qwf8jwcfU360GWZay+9PHXuJ7MLBNAgWedZ5YUYtJH6lZFehywk
	gnLZrumQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtVxX-00034F-9l; Tue, 12 Feb 2019 11:10:39 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtVxO-0002t4-Gc
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 11:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549969831; x=1581505831;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=BXPJoBB0Kgm4J4WvDGeNZxKZbFFkYo9XWYKOd8CvDv0=;
 b=AIpI+N3iOWFOzoFYe5Q2JVsm2Fv0ldwXov2/cr1ZznIL7aKztwYZHpXK
 5lKcJ3M/sWpQV4QBndmDBnSasmWMPdVt6ER0VvqRrBqmAncwMor9zgIaR
 GtpWzUucE3IWP7e+40iBACS9Zg9y+1JCD3Prq2MriNh6WqQ7qVqvnJpxj
 Y/NrmSO972wtRcAYktzqC6aSLQCn1YpSmVvjSyXAUaHwr8ujPWQYiCsrF
 5JBsX6UM2ogQcm1YKfqJWv/pXk4XSSRvmRD19vaLjfbA3LfooVv9fBkJV
 3R6mRyXgczw9NetNWPuHlydRAVWoFyxrDltlJW84CMPn0wWUjoxzFD3cz Q==;
X-IronPort-AV: E=Sophos;i="5.58,361,1544457600"; d="scan'208";a="102308196"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2019 19:10:22 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 12 Feb 2019 02:48:57 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 12 Feb 2019 03:10:22 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v4 PATCH 4/8] RISC-V: Allow hartid-to-cpuid function to fail.
Date: Tue, 12 Feb 2019 03:10:08 -0800
Message-Id: <1549969812-22502-5-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549969812-22502-1-git-send-email-atish.patra@wdc.com>
References: <1549969812-22502-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_031030_733535_0A8DF693 
X-CRM114-Status: GOOD (  10.77  )
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

It is perfectly okay to call riscv_hartid_to_cpuid for a hartid that is
not mapped with an CPU id. It can happen if the calling functions
retrieves the hartid from DT.  However, that hartid was never brought
online by the firmware or kernel for any reasons.

No need to BUG() in the above case. A negative error return is
sufficient and the calling function should check for the return value
always.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/smp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index b69883c6..ca99f0fb 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -60,7 +60,6 @@ int riscv_hartid_to_cpuid(int hartid)
 			return i;
 
 	pr_err("Couldn't find cpu id for hartid [%d]\n", hartid);
-	BUG();
 	return i;
 }
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
