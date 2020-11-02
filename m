Return-Path: <SRS0=qpiA=EI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799A6C388F2
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2020 03:59:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27AD32145D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2020 03:59:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Utau4Hr1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27AD32145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5/0oxnMt+ClN8bDJFXL+/5iWZyVFILPp1wuC9gbrmkg=; b=Utau4Hr1swQWSQXyZx5s75FEX
	gSxbL85+IwB6e5Zb9Rd35y3GsB3Ix9ywz7bWsqYY3EZ1ur/EdXicNK7dp8XiXTewubFMEgsfZ+yR6
	93CUMyQNZC4yafdEnHcu2zsV8t3Qqpb7GCRtF6b+xWo2uv3pn/4r1co0Z4o+PfwWKzAEM/ijrg+Uo
	pG6qxfl7EVSKHf0q3Ti9OGl0hDwRDHciJONVQ+gMDk/5eF/C/Iq2oVZwIBIP6ZFAIgRtPbfTAUZHF
	MpxtrWv7HnRBogxne5fwM/Zid6sKFCwzVfGesFAS6Ij6evW4+2ngjBZMYTtfpuNHzvo18MHqgto8d
	gPABJgCsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZQzR-0001xo-NA; Mon, 02 Nov 2020 03:58:42 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZQzO-0001wA-5s
 for linux-riscv@lists.infradead.org; Mon, 02 Nov 2020 03:58:39 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CPfKJ37YYzkdQC;
 Mon,  2 Nov 2020 11:58:28 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 11:58:20 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>
Subject: [PATCH 2/3] riscv: cleaning up boot dir
Date: Mon, 2 Nov 2020 12:03:56 +0800
Message-ID: <20201102040357.118400-2-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201102040357.118400-1-wangkefeng.wang@huawei.com>
References: <20201102040357.118400-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_225838_522282_6A359499 
X-CRM114-Status: UNSURE (   8.45  )
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

Let's remove all files under riscv boot dir by using archclean rule.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/Makefile      | 3 +++
 arch/riscv/boot/Makefile | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 0d9ecb959962..8c29e553ef7f 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -101,3 +101,6 @@ Image.%: Image
 
 zinstall install:
 	$(Q)$(MAKE) $(build)=$(boot) $@
+
+archclean:
+	$(Q)$(MAKE) $(clean)=$(boot)
diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index c59fca695f9d..666f08662170 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -18,7 +18,8 @@ KCOV_INSTRUMENT := n
 
 OBJCOPYFLAGS_Image :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
 
-targets := Image loader
+targets := Image Image.bz2 Image.gz Image.lz4 Image.lzma Image.lzo \
+	   loader loader.o loader.lds loader.bin
 
 $(obj)/Image: vmlinux FORCE
 	$(call if_changed,objcopy)
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
