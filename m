Return-Path: <SRS0=iP4b=E3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F18C388F9
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 23:12:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9404A2168B
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 23:12:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rVgjnHN6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="F5ZhKToD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9404A2168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=28/LosMvGvjHqhxRbfpfigZQRaq8oot3qm6IJvaeqAc=; b=rVgjnHN6HK8Fh6dsQnw7FW7kT2
	ktp5dVQblql8D/LRZuRJUCUSK5DxrkNlBidoRDigzngPyZxsCI7vH4f969Rb5Nbmm7tgX+TudAvzr
	iNdwK3Kvm0g8eVUw2TcHK5oHhRPiveaMEUQxmTIVaYfC3aFFeNfQkrMXLnjqFkFLsN6xcs3kWtm+1
	rq4D5/qoURz86RiZjQ+NyeL3iwgyhOTOFSHGK17QeVAwsVc0rTt/mXTX+bMj0fVod38ZJ9zTDpLYW
	7nK8uWnCh8kkSXOGOGgVIdID+rxZyJqJuUWRLOK5noprHAL76khz51vn0WTeoA6CjTHs9IdxQUzAr
	0oYRKCkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgc3R-00081n-6U; Sat, 21 Nov 2020 23:12:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgc3D-0007xa-NM
 for linux-riscv@merlin.infradead.org; Sat, 21 Nov 2020 23:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=BGHU8zX9sAoC3r2CNc9TcIUMO7ktiNVS95ScxXwf994=; b=F5ZhKToDz8eIHm+A2sICPyQrNx
 jjEzPxX61PnvjuIfX4RWC4tgcMc/5BFuNxhh7RWS6D5uMfeRDZuJdGwEzr/2DWKw4IBxAcjEXhaLF
 1aXnOvEMJR9TMKcEVW8yxDdJmKA8QyoeGU7ZvErdawcJIsZLKJJAULFaa0a39gnuW4f6ljREgqcH4
 2vubgUx72+WalS70H5sCzoRdc5tHR8ljXbngjTUSL2+umVZQEkWrvrncFhAndhiBzjlLVHelcol07
 II5tCMUbRPx2zMoEhQbfp8N7mK+0gHPKDQS2JTDoH5EST90U8K2CCTaCQyvagvxlpI9UziQOL9TN1
 em5e34pw==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgPrQ-0001zV-9t
 for linux-riscv@lists.infradead.org; Sat, 21 Nov 2020 10:11:19 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CdTgy07W1z6vxh;
 Sat, 21 Nov 2020 18:10:38 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Sat, 21 Nov 2020 18:10:47 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>
Subject: [PATCH] riscv: kernel: Drop unused clean rule
Date: Sat, 21 Nov 2020 18:15:19 +0800
Message-ID: <20201121101519.165053-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_101116_986550_1BF6F482 
X-CRM114-Status: UNSURE (   5.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/kernel/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index fa896c5f7ccb..f6caf4d9ca15 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -56,5 +56,3 @@ obj-$(CONFIG_KGDB)		+= kgdb.o
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 
 obj-$(CONFIG_EFI)		+= efi.o
-
-clean:
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
