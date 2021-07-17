Return-Path: <SRS0=adiZ=MJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7495C636CA
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jul 2021 04:45:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60E7E613C4
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jul 2021 04:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60E7E613C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6Oy8LI/Y1OdPWCeIfjwws/VFj4BgmiesI9TTGSFj4pc=; b=mV6q+5VnpOLpvz
	Nsoekwcr/9aHLOT6qDNQaPzlh4oQMcMVjlDHLKdA1xBSru+Hc90Jz583xef/A1fwZvH4ySDC0Tdru
	v5uz+Sq+vye9RBlJLqFECGYnLVD7mRc8Ft7Ji373ieaVy58o1+FWpmZxnKSrjEZy7IAzbVuSvYTkb
	m55ZQd0nuIr8p7bwR9vB+pBN1SkWJYD5VxU1FpiywnaOKgPt6GZJv/z3be8h3Yh7hx42VCWedEZBD
	9JzNnt5vpiivdyUQHkNP5GcWblLRF+s4a922x6wmENVUQo1Yf0z0a9ZMW9Z3XTXwp3Hb8Te6Kjlhq
	St7pUfgWzcmr5AmHo5Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4cBf-005vx2-Vy; Sat, 17 Jul 2021 04:44:27 +0000
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4cBd-005vwh-DK; Sat, 17 Jul 2021 04:44:25 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: add rv32 and rv64 randconfig build targets
Date: Fri, 16 Jul 2021 21:44:24 -0700
Message-Id: <20210717044424.17478-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
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

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org

 arch/riscv/Makefile              |   10 ++++++++++
 arch/riscv/configs/32-bit.config |    2 ++
 arch/riscv/configs/64-bit.config |    2 ++
 3 files changed, 14 insertions(+)

--- linux-next-20210715.orig/arch/riscv/Makefile
+++ linux-next-20210715/arch/riscv/Makefile
@@ -132,3 +132,13 @@ zinstall install:
 
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
+++ linux-next-20210715/arch/riscv/configs/32-bit.config
@@ -0,0 +1,2 @@
+CONFIG_ARCH_RV32I=y
+CONFIG_32BIT=y
--- /dev/null
+++ linux-next-20210715/arch/riscv/configs/64-bit.config
@@ -0,0 +1,2 @@
+CONFIG_ARCH_RV64I=y
+CONFIG_64BIT=y

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
