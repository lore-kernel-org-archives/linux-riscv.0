Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9377C64EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:16:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96EDC20666
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:16:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IAn0CBRS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="CE4gsfCS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96EDC20666
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=F6WXh357eKFBXjdzCY1E0UP8RarM/pBtiSP/umrPNGY=; b=IAn0CBRSI93bqAIlzooVfUzwsu
	kB+N99b7BKIrWjrY2Qoub820v7pF/bjJ1ilSEy/ns2emPwfoccNQApFNXxqs8ah+EFzW9Iduot7r5
	mglCg/uKRi06SPH1xhhtXh8gXqaoXQKItVkkNL9FF0yvf7RHdFzSgNRlZRRd5rzH9FVK+2sqNdL7C
	sbooJlwAgIQ+a6E1a+PQPGM0/ghsLBRxGCha7ATWjSyW5yqychX2TYAhDgpWlX8HrWLkH2NNpX4yH
	w8/j6RtHQ+n0zUfm+g9AtxeGJBuzQrCbDXxeKlZnb6HLJE9zESY+B6AAvV794VfX7k9vJ+2zXfjtQ
	Ss6ZAGlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Q9L-00064q-2D; Tue, 02 Oct 2018 19:16:03 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Q8t-0005Mr-TP
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 19:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1538507736; x=1570043736;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=0OZ3nt/EEsQssBD+UQWuWr8qJL45NeYy9tco1TnCX6Y=;
 b=CE4gsfCSf8fTPXbuwS+KiN9uuhCSAAgbVA1Zu+dxnGGetA9q/MFXqoIl
 vHCNNqZc9NRAMma10MOKx5GZdgKPWDDMBek4u6j1QBxxMC4dhMpRZcoUh
 ihHvJGc5tUrlIRK3v60GAHCykaKGYu41rxCPgiDWjRSt9yhUvlAX7aO1Q
 jYxtgulTva57lNx39ZltY+cTuGBSz8HO5CXtJMD1j8QUJrHTT2oD4elgK
 hBKKZKGgWTCuUFA+Mn5FzG9QGHyYJuN4v8PXbl/+gCB/c3DmL6EsPd3TQ
 oO3t+beumw9vzDFDO6FjWB8q+j2SD1JCpeMKnx0JozFdxg1r1tK6H+fHg w==;
X-IronPort-AV: E=Sophos;i="5.54,332,1534780800"; d="scan'208";a="92732907"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Oct 2018 03:15:12 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 02 Oct 2018 12:00:51 -0700
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Oct 2018 12:15:10 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org,
	palmer@sifive.com
Subject: [PATCH v6 08/14] RISC-V: Rename im_okay_therefore_i_am to
 found_boot_cpu
Date: Tue,  2 Oct 2018 12:15:01 -0700
Message-Id: <1538507707-22299-9-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
References: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_121536_072347_277B9CD4 
X-CRM114-Status: GOOD (  12.51  )
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
Message-ID: <20181002191501.b1edFWnEPg9uyYVl5zOVSaIJb0yGZSehbnF6Vs8f8EI@z>

From: Palmer Dabbelt <palmer@sifive.com>

The old name was a bit odd.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/smpboot.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index cfb0b02d..4a232600 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -50,7 +50,8 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 void __init setup_smp(void)
 {
 	struct device_node *dn = NULL;
-	int hart, im_okay_therefore_i_am = 0;
+	int hart;
+	bool found_boot_cpu = false;
 
 	while ((dn = of_find_node_by_type(dn, "cpu"))) {
 		hart = riscv_of_processor_hartid(dn);
@@ -58,13 +59,13 @@ void __init setup_smp(void)
 			set_cpu_possible(hart, true);
 			set_cpu_present(hart, true);
 			if (hart == smp_processor_id()) {
-				BUG_ON(im_okay_therefore_i_am);
-				im_okay_therefore_i_am = 1;
+				BUG_ON(found_boot_cpu);
+				found_boot_cpu = true;
 			}
 		}
 	}
 
-	BUG_ON(!im_okay_therefore_i_am);
+	BUG_ON(!found_boot_cpu);
 }
 
 int __cpu_up(unsigned int cpu, struct task_struct *tidle)
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
