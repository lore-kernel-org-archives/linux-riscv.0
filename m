Return-Path: <SRS0=Bqyv=EK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E482BC55178
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 06:10:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68FA6223C6
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 06:10:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nD7redjL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68FA6223C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cn1LYOskyw86dYGMQHGlJIp3R9yg40FX3pRXNugehVQ=; b=nD7redjL0/BBUgORYt8mUw9Ed
	cBNYiQQOWR4LdeManKDgzv8dmDNoiT3E3Z4zvUTE9mBNLl5zeNWTjX46l2/daT4IrczfcE24V2VpR
	KJMhTeZ0yC5ABNEgzqHnyzgAxG3zCzYJcFifVyFhdxa1BWjrHUkBJUhTSkQWuP5AnhoOrHezNj683
	SrxL2PI1TC8fn4vgcdBqY1wj7FvOftNO5oU7uEaMuAmXrlCKlphi/SKPqPguQj0sNB+GV8cMbWfgu
	pQJwVXVFMEmeYf2oRGcad3sYQrmUDvHf7On9qjuntKBIWBOTEBOknEOz+CXEmop1oFUqB7BlBQJPI
	BcnH89/dQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaBzk-0001mA-2d; Wed, 04 Nov 2020 06:10:08 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaBzf-0001k3-8H
 for linux-riscv@lists.infradead.org; Wed, 04 Nov 2020 06:10:04 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CQx7z28lbzhgbD;
 Wed,  4 Nov 2020 14:09:51 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Wed, 4 Nov 2020 14:09:44 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 1/3] riscv: Fix compressed Image formats build
Date: Wed, 4 Nov 2020 14:14:59 +0800
Message-ID: <20201104061501.91153-2-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201104061501.91153-1-wangkefeng.wang@huawei.com>
References: <20201104061501.91153-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_011003_735565_B50CDFB6 
X-CRM114-Status: UNSURE (   8.76  )
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
Cc: Atish Patra <atish.patra@wdc.com>, Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

make[1]: *** No rule to make target `Image.lzma'.  Stop.

When make ARCH=riscv Image.lzma, it won't work, let's fix it.

Reviewed-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 0289a97325d1..0d9ecb959962 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -96,5 +96,8 @@ $(BOOT_TARGETS): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 	@$(kecho) '  Kernel: $(boot)/$@ is ready'
 
+Image.%: Image
+	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
+
 zinstall install:
 	$(Q)$(MAKE) $(build)=$(boot) $@
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
