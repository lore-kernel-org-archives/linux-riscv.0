Return-Path: <SRS0=vm5i=MN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC869C12002
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 08:02:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54C7C61019
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 08:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54C7C61019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zM2qZKS0kWMgOdhJqZNJC+qhezVh5b1JZyBbrPFDlRc=; b=xIZZ3I/GjvfSnK
	caWAk52Yh5iabKeKgureyPBw08UdFqNWjNDelj1i9ABb7qed+7ckqQo4K9pN6lyA9Gz1cpRdWaQfb
	oQyUUTtjge7pLMJM5vRIbJ4xk/VhkTySD27IQ8LVtbFyQZchq+v0Ru2L5ez7WDJ5wX1UAS2EPZ05m
	P5mi14Oh2XcJIi3qZ79ZgY+oRRSvGkyfjbmOU3Vrt0hegVJaGgYIRKbOZ5juacrTTdqDk1HS0+ezE
	bn60j1lhMzjW8N+HCbQpiCu2gWvaErn5B2fBpVB+5XZZLDkAE8XPdLQqIFpNTUUZgNsa9aztTKgyv
	XYrWq6U9Ubn6EXPqF3fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m67Ax-00EoSl-BD; Wed, 21 Jul 2021 08:01:55 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m67Au-00EoRV-WE
 for linux-riscv@lists.infradead.org; Wed, 21 Jul 2021 08:01:54 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 65F52FF812;
 Wed, 21 Jul 2021 08:01:49 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH -fixes 2/3] Revert "riscv: Remove CONFIG_PHYS_RAM_BASE_FIXED"
Date: Wed, 21 Jul 2021 09:59:36 +0200
Message-Id: <20210721075937.696811-3-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210721075937.696811-1-alex@ghiti.fr>
References: <20210721075937.696811-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_010153_209907_9F77FF14 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
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

This reverts commit 9b79878ced8f7ab85c57623f8b1f6882e484a316.

The removal of this config exposes CONFIG_PHYS_RAM_BASE for all kernel
types: this value being implementation-specific, this breaks the
genericity of the RISC-V kernel so revert it.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 8fcceb8eda07..6a02caf49cde 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -494,8 +494,13 @@ config STACKPROTECTOR_PER_TASK
 	def_bool y
 	depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_TLS
 
+config PHYS_RAM_BASE_FIXED
+	bool "Explicitly specified physical RAM address"
+	default n
+
 config PHYS_RAM_BASE
 	hex "Platform Physical RAM address"
+	depends on PHYS_RAM_BASE_FIXED
 	default "0x80000000"
 	help
 	  This is the physical address of RAM in the system. It has to be
@@ -508,6 +513,7 @@ config XIP_KERNEL
 	# This prevents XIP from being enabled by all{yes,mod}config, which
 	# fail to build since XIP doesn't support large kernels.
 	depends on !COMPILE_TEST
+	select PHYS_RAM_BASE_FIXED
 	help
 	  Execute-In-Place allows the kernel to run from non-volatile storage
 	  directly addressable by the CPU, such as NOR flash. This saves RAM
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
