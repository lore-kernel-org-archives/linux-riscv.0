Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4607C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 23:30:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6322C20658
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 23:30:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rkZ7B8sU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="mvNE7jgA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6322C20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L2IywrC6OtL2s/JnAKBEBVKhVS726B6FX9NJ+f5jiCI=; b=rkZ7B8sUBSj0V7zV66vvbGL3q
	Lyb9k9e2tRqEqubpJTttCjnTZIHYVsKk56Gx/zttQMms5jn4JuN3zp2pUiD1LFJCOmux12Hv3qZS1
	XvfU3ecf5utP9nPz3hTx8vyNArfH3Ldf+ERNpmMKuyfMEmCLBlGdisvbrGripOltZIQTFayLlCDk9
	Nd6MPmraPnk5lvw6Eh6XcVc1UnvKGhfEYju9oPu1zoDCQEfvJqbzB6uMTQk9+zBx8Z6ggHJfFR4pf
	XTXWM6SgMFFpIeri32Fbh4ATQZGUN3/HOwhz/PevocLlJHYEbEh2RvsnkFx8+8lcPVbkJ1fKq926G
	WGiOQpBqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvqr1-00071t-4G; Wed, 15 Jul 2020 23:30:23 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvqqy-00070f-Ib
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 23:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594855822; x=1626391822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GmdUefgLBOB6PwU6TU8acnzTWIcf74JT8SNUiU8W9IE=;
 b=mvNE7jgA5ww9fkkJna/Abdk67z6d22kCL+ElROhSdYK4zn9g5ZQGJf2R
 5qzSL1IyiYIukTmFsqHlstrQlqlrOsF5xP6ZXtf/hGOGIk8HrXbQRmKKc
 pwRSYbDttuHjEnKLvFyNvM2jnmdSBGnhJwbqD1+L8cV+GvArM6brRk0Mh
 hYC3Q6aaRnXGDGL4w1YrsKnRCRmtFIP1CiNeDWba1SVwAs6BeJkgGwTrh
 c7/4Dec5IOMwEefinYehHmydG+mfWp+HQjgAqjTbViZ8Z6/DfFD7ZLRdR
 Wd+Iur4blI5jBI49MZd3JRgCOl2W6qHqxmnLS5jSCJGyNpfiVnP9lS43H Q==;
IronPort-SDR: 3sCQGqG1rP0XZdCS8qm+rZUiy6artuk+dz/51i+otjfT6sLkZlTGV5qUnkIteZh5sTWjzpIeB6
 X9ZFnlA1JQYgfCVl4fDutHhzQ3MLDr4j4hJ8sN42oYQcWSQ/8J8IrG8VDdbfoTtvunZz4rQRnA
 VqgNtexk+cGtsj9YRpkMYAOqSqb3ctsoU32qI9zDlRCxQD7mC2tFut53yajpshOAXkvQsuB3gl
 TXufhwi1J8sAMhC4OsMuY4KKKWmLd6LDI5L7sFFyqd8TTRd+0OLIQQVaIO32K3AEQP5UWoZ/lV
 +QY=
X-IronPort-AV: E=Sophos;i="5.75,357,1589212800"; d="scan'208";a="245592874"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Jul 2020 07:30:18 +0800
IronPort-SDR: 1f5DUEQWvYnin624cHkFMp1ZCqm6Ig511GDlYvQVSZ87ttSj42/VPJksFkHt53up7soHzckjaO
 MOuSUe/zWqJwqX5Ze13pywx9g6pcZ8qys=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 16:18:09 -0700
IronPort-SDR: Q9PPzO3I5sP4soZoy+FP95bTTSmzWIFA2ZaPnmYDUwcXva5OXZSyHl61x14Sl0d10zsFYjODc0
 JfkewB3zndJg==
WDCIronportException: Internal
Received: from cnf009656.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 16:30:15 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] RISC-V: Setup exception vector early
Date: Wed, 15 Jul 2020 16:30:06 -0700
Message-Id: <20200715233009.27183-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200715233009.27183-1-atish.patra@wdc.com>
References: <20200715233009.27183-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_193020_749181_4FB6B549 
X-CRM114-Status: GOOD (  11.08  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Vincent Chen <vincent.chen@sifive.com>,
 Anup Patel <anup.patel@wdc.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The trap vector is set only in trap_init which may be too late in some
cases. Early ioremap/efi spits many warning messages which may be useful.

Setup the trap vector early so that any warning/bug can be handled before
generic code invokes trap_init.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/head.S    | 10 ++++++++--
 arch/riscv/kernel/smpboot.c |  1 -
 arch/riscv/kernel/traps.c   |  8 +-------
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 7ed1b22950fd..d0c5c316e9bb 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -77,10 +77,16 @@ relocate:
 	csrw CSR_SATP, a0
 .align 2
 1:
-	/* Set trap vector to spin forever to help debug */
-	la a0, .Lsecondary_park
+	/* Set trap vector to exception handler */
+	la a0, handle_exception
 	csrw CSR_TVEC, a0
 
+	/*
+	 * Set sup0 scratch register to 0, indicating to exception vector that
+	 * we are presently executing in kernel.
+	 */
+	csrw CSR_SCRATCH, zero
+
 	/* Reload the global pointer */
 .option push
 .option norelax
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 4e9922790f6e..5a9c127a380e 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -154,7 +154,6 @@ asmlinkage __visible void smp_callin(void)
 	mmgrab(mm);
 	current->active_mm = mm;
 
-	trap_init();
 	notify_cpu_starting(smp_processor_id());
 	update_siblings_masks(smp_processor_id());
 	set_cpu_online(smp_processor_id(), 1);
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 7d95cce5e47c..ad14f4466d92 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -174,13 +174,7 @@ int is_valid_bugaddr(unsigned long pc)
 }
 #endif /* CONFIG_GENERIC_BUG */
 
+/* stvec & scratch is already set from head.S */
 void trap_init(void)
 {
-	/*
-	 * Set sup0 scratch register to 0, indicating to exception vector
-	 * that we are presently executing in the kernel
-	 */
-	csr_write(CSR_SCRATCH, 0);
-	/* Set the exception vector address */
-	csr_write(CSR_TVEC, &handle_exception);
 }
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
