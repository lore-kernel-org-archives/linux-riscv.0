Return-Path: <SRS0=/HzI=OC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FD8C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Sep 2021 03:46:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1C6860E9C
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Sep 2021 03:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1C6860E9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kKesF67QjEhNpv23RlY6JttUQEkE+O3sIWyxLO4x5Ms=; b=m8TZUiiA/PKqOi
	cVpfPZT6fLmdzb7k2j8QSF4xcK6jTL1FZ6pVFA8iXtjyl1YZn+6VhhKQAxHZOv2ELy5RVQ0IFF3GD
	pse9jquQkUC+Nj+WwQCoeUgWMGA8ElOndPfltefhOqlHjSHa34nUhHeHBG5Zxq1vGhTySLQc+QRsP
	5d0TGoX53WGIJg2bWSltzvH3U9J85Hnsx7h963adWROjrR5aa9oQ0lXqS6ZxGEGaqhdkJcOrzle86
	W4zcmfGizrl0ZFgZQvohI9kwWh6E+JiDCgeI1+lYRsASoJjZu0Mt9bwdutnrTRyiUGxG5XmxVxGy5
	q/Ua6NKrif4MyHKMjGKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPGR4-00FmnJ-TI; Sun, 12 Sep 2021 03:45:42 +0000
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPGR1-00Fmmw-NJ; Sun, 12 Sep 2021 03:45:39 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2] riscv: add rv32 and rv64 randconfig build targets
Date: Sat, 11 Sep 2021 20:45:38 -0700
Message-Id: <20210912034538.19404-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add the ability to do randconfig build targets for both
rv32 and rv64.

Based on a similar patch by Michael Ellerman for PowerPC.

Usage:
  make ARCH=riscv rv32_randconfig
or
  make ARCH=riscv rv64_randconfig

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
---
v2: add missing S-o-b

 arch/riscv/Makefile              |   10 ++++++++++
 arch/riscv/configs/32-bit.config |    2 ++
 arch/riscv/configs/64-bit.config |    2 ++
 3 files changed, 14 insertions(+)

--- linux-next-20210910.orig/arch/riscv/Makefile
+++ linux-next-20210910/arch/riscv/Makefile
@@ -141,3 +141,13 @@ install zinstall:
 
 archclean:
 	$(Q)$(MAKE) $(clean)=$(boot)
+
+PHONY += rv32_randconfig
+rv32_randconfig:
+	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/riscv/configs/32-bit.config \
+		-f $(srctree)/Makefile randconfig
+
+PHONY += rv64_randconfig
+rv64_randconfig:
+	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/riscv/configs/64-bit.config \
+		-f $(srctree)/Makefile randconfig
--- /dev/null
+++ linux-next-20210910/arch/riscv/configs/32-bit.config
@@ -0,0 +1,2 @@
+CONFIG_ARCH_RV32I=y
+CONFIG_32BIT=y
--- /dev/null
+++ linux-next-20210910/arch/riscv/configs/64-bit.config
@@ -0,0 +1,2 @@
+CONFIG_ARCH_RV64I=y
+CONFIG_64BIT=y

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
