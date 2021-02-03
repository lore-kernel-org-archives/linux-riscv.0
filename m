Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA652C433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 14:19:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD73664F41
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 14:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD73664F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9+J8TUYwlZi3X4RZ7TaB3Vfvnv7Mu7dhURoiRfcfcI0=; b=P8zy9cpw4i5URNjDnKWB+XcujX
	FbQAuq0GGKK+PZ6YQuczHogqVCpDiXFwln/fRyT0uEwrlzQfvpsLCgTBNRE7guWSO+T8yiqT5b7zx
	/ozVLSxAMVu+NJHNOa8dl+57FF1RvmdYsKVYlNgWePsAxdW1lh8Of7Ukz4vm6djY5u1DxRxEdACuD
	UJMMwcMQJhX3IlEM78Z6BDB5Ur89U1E5zlFphTqTmBk0Z4S74fS55FJM0we5GkM+iSokeOaGVtR7m
	m+/IhSwl8zzUJFAPp8/ZEgbrp6vpwFRqpS70QPgDR0SVLr8hYHgOu0UjkuBHpXRvmtRpMtCCi3puJ
	PsL+PmNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7J0R-0003PY-7c; Wed, 03 Feb 2021 14:19:43 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7J0N-0003Le-2w
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 14:19:40 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DW3gL4wXYzjJNq;
 Wed,  3 Feb 2021 22:18:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Feb 2021 22:19:17 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <palmer@dabbelt.com>, <atish.patra@wdc.com>,
 <linux-riscv@lists.infradead.org>
Subject: [PATCH -next] RISCV: Add some depends for NUMA
Date: Wed, 3 Feb 2021 22:23:43 +0800
Message-ID: <20210203142343.59781-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_091939_386748_939D76F7 
X-CRM114-Status: UNSURE (   9.64  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The numa feature is useless for riscv32 platform(MAXPHYSMEM_1GB if 32bit),
and it should depends on SMP feature, this also fix the build error,

  riscv64-buildroot-linux-gnu-ld: mm/page_alloc.o: in function `.L0 ':
  page_alloc.c:(.text+0x4808): undefined reference to `node_reclaim_distance'

Fixes: 4f0e8eef772e ("riscv: Add numa support for riscv64 platform")
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 22fa17898d29..ac7f5801bd82 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -312,6 +312,8 @@ endchoice
 # Common NUMA Features
 config NUMA
 	bool "NUMA Memory Allocation and Scheduler Support"
+	depends on SMP
+	depends on 64BIT
 	select GENERIC_ARCH_NUMA
 	select OF_NUMA
 	select ARCH_SUPPORTS_NUMA_BALANCING
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
