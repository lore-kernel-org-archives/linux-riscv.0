Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2C7C64EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:15:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C9882064D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:15:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vul5rM0q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="egVb4dvZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C9882064D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pje1BxPde/8rB09AsSBsazqCx2Xgvo9x5mf2sao6Hk8=; b=Vul5rM0qzUZt7iw9w7RHlT3pNO
	WVxU1tZdlf8XBTJFSbjr3j6+8aiu6Sug7cEa/yb5zYNXhfThcPVB9cX5uNCVVxrIGGqF3gKjzAU5D
	s0DaawW+k2Ob4mUC/g1f/YPVIs/9qic2pAVvtMFdWMZSYedZW6czLgt0I+77SzOnkYpzcrn0onacT
	aWVuSCA/T6W2wGqkxDaid/rgNwAubX99Y0Qhj9FEyHEOvQBLzXcy5Pttb9IWNEQlSv2TWxSs1zTEx
	EHFW9iMyP76qIPRafxb8Li0xVz+jcayeL1/yYEtx7epGzbK9VftLBGG/ZBPGO9fcgv+QHfTx7vmub
	tmd4QJoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Q8x-0005ru-4S; Tue, 02 Oct 2018 19:15:39 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Q8j-0004mL-IX
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 19:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1538507726; x=1570043726;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=DtzhQvMvxLSSEv9fq5kc/Y4PFD1IDH+eCGEVY+GherI=;
 b=egVb4dvZUxQeRZuWALrLIyeEzQOwHz5KhE5MgJoZQjR117PvzZZqZfX6
 0q8WHwjPHHnAzwKdrDlUajJXrgEU80dGNDP74Mcega+lGFmxhX+jFLZ8R
 VB2sfjsMTNRuwWAsYR7HPd9pTZxMXunupGhVMdEoTRjo+FGShtkva8aZH
 xF0IfomBLRfl3Lw/WW6GH9aj1OTjKXocV8TxF09E2AcJWoUUvSA3buNh7
 fOf+8QSUcooF+yheh2n1oWwUrdDhXPFkCxY2cTyKcLrdaSNLTAkZObDio
 aa+x+RdL/7mM8g1D+iAuOGHwJ5YqOZgSS7KG2x6KVX4iVBNYDdE7DYaSJ A==;
X-IronPort-AV: E=Sophos;i="5.54,332,1534780800"; d="scan'208";a="92732905"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Oct 2018 03:15:12 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 02 Oct 2018 12:00:50 -0700
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Oct 2018 12:15:10 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org,
	palmer@sifive.com
Subject: [PATCH v6 04/14] RISC-V: Comment on the TLB flush in smp_callin()
Date: Tue,  2 Oct 2018 12:14:57 -0700
Message-Id: <1538507707-22299-5-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
References: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_121525_693237_4CD5F22C 
X-CRM114-Status: GOOD (  10.95  )
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
Message-ID: <20181002191457.3mU4xUSqqIoFM4-oGlZQNB68smjxu77OKHh2TMvF9b4@z>

From: Palmer Dabbelt <palmer@sifive.com>

This isn't readily apparent from reading the code.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
[Atish: code comment formatting update]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/smpboot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 56abab6a..712e9ca8 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -106,6 +106,10 @@ asmlinkage void __init smp_callin(void)
 	trap_init();
 	notify_cpu_starting(smp_processor_id());
 	set_cpu_online(smp_processor_id(), 1);
+	/*
+	 * Remote TLB flushes are ignored while the CPU is offline, so emit
+	 * a local TLB flush right now just in case.
+	 */
 	local_flush_tlb_all();
 	local_irq_enable();
 	preempt_disable();
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
