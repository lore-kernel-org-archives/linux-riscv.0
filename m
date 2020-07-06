Return-Path: <SRS0=gb7b=AR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDD7C433E1
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 17:26:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 405922070C
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 17:26:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KBFoMpDT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="QDiATxqo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 405922070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T/hGkE1J7vwnJtjlKIk56Znvv9bmD3A65Q9QcJDVJ2Q=; b=KBFoMpDTb6x7Dmyt40UBWFlAk
	e1XGPZMjp/GKDECjra22ArPWRXVVJsgDHyM1YwtKDqxCE7cd0X433o3v7gwShHLVOGgUly2ver1+2
	4UDqGz9tZkZAWMavnkPU1AHvi0GHhEpflDGzJp3bL1ZS7DFSBwFppPhIQ8OqNEXme1eot3dlDAcfm
	ikwgiPe9LB64YeMZwXZWQvVMBuv8bsK4fKvxhauR0tGu33hVnjwbm2mnFQmncnKrCywwQVw87JUUV
	yEJfB5nO3dh86nbyacUbkR/ODL/5JQvE8Xv1ThAOAs4NM9skH3qm6MuUuJKluA6TWeegyz97RjsUt
	2oWLOuAOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsUt6-0002fF-L3; Mon, 06 Jul 2020 17:26:40 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsUt1-0002Zt-0X
 for linux-riscv@lists.infradead.org; Mon, 06 Jul 2020 17:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594056396; x=1625592396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5rYW4FEHjU+JIGZzSYacxByNR94cSOaxyWs5ncpc52A=;
 b=QDiATxqoOSqlLoGOlZcXVo8cgH5rTQrMuhf6n4QzoN8ysJGSpSGaBmao
 /YPiCtv9X/UT4EHu8tCUDwmkxQjtMTQzsqCiDPw5nWmegexqOcDiUAQFH
 Oya8x2240YcWuHVb+7j/VS8un0fC/Bl9t3A3gWW0DJ629UO1F8KzbAgK0
 d1/d/ZxMzWEJLMpsuj5pbiDjmIVR1sz0yVZC6uXKaZ+HkEC9E7r+7/4uN
 PASXP/rEe84KMz+uevAWU1IPGVOBWyiNe4XXXj/8gLgdZril5+tSxyr3h
 F7Y2ysJmDUthiX7zN3HfChmgADSxFToV+w8Kld8Je966g/tvbChZ1cMqr Q==;
IronPort-SDR: Varhblbd12+RckexEeh1WbVZ/LJ7qFj/boYO8pkpWodW+MPP/f8eJiNufBtKGkkIEfms6GgGOK
 9LXkkx673/4H3nPgUo8ST9IBV1vlE8NQJ35cWa1SMWz6BjqnV92mc7htBiUfeKgWf+23kORde0
 veH525Hx5OSRZnl8/aS+79V1yT5TYAPnxohKqXDZiDG5Wml5LJUn6TGpP1zsY1ETEMKCsWXdO2
 +XO4WDUTe0Q5umAFjDHt5paWRmKd2bfmBqiFe0UY5VFL8KOzvZPt8J1Hk36gQPSTQ34H2p+uRm
 sic=
X-IronPort-AV: E=Sophos;i="5.75,320,1589212800"; d="scan'208";a="141930680"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jul 2020 01:26:32 +0800
IronPort-SDR: cq3bSbFbNIZuH1hqm6NAVmlyEv2tC25VVU+NpufR3cTjprXNjdTjbDtQqmqAdwLcpDaXYTfqBY
 /6TkJkPH4G+6wQqB3o9Y85F/Bht3GokxE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 10:15:11 -0700
IronPort-SDR: JpeLRq4Gv2B6hJdrG2x8+bUFZu6OWKRYQZiJUf0qjG/GWht2sUiscYCg6ulNaKrzumxLHgpPpe
 CuXowP9yI+XQ==
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.57.161])
 by uls-op-cesaip01.wdc.com with ESMTP; 06 Jul 2020 10:26:30 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 03/11] RISC-V: Setup exception vector early
Date: Mon,  6 Jul 2020 10:26:01 -0700
Message-Id: <20200706172609.25965-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200706172609.25965-1-atish.patra@wdc.com>
References: <20200706172609.25965-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_132635_285951_1BE88AD6 
X-CRM114-Status: GOOD (  11.03  )
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
Cc: linux-efi@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>
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
index c5b529234ad8..eb123eda3663 100644
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
