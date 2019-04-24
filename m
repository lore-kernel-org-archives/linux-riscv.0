Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73994C282E1
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 21:48:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42E9C20811
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 21:48:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RL0xmjzz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="kueSs2qP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42E9C20811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9f9rnSOT6G4QkammUTS6Yvbavx4jPJrKrIDCc5btvE=; b=RL0xmjzzs7R1vS
	cHIWowcfLLc/2TcoLysWn8dkgbSZyg/gw0CPSomhqhxrRoHqC9SCywz1CnKaUyLaOhUfEI2/GSPsG
	Zvp/skz3ccpbANd9wi82nHi5o+UFUcowI6FFylcXzFm//0gKjftP0YzK+J0HKDVR+V2K0Kea1SPZy
	M9iHwHz5qOYN1DztHcPuM3BVDS95ZoWF3A6ReDEAEin6WtKkHA5htrrJoZo71Vi1XgU9M9TjDp9rL
	YXWZveiPXtMTo0MjdiE9z1HqKOCMzzeLlZmihs8v4NHpElqqli0pa2BV7mFvPa7LE+2h+1voEbl6R
	v+nIQ2s1M1k3Ro9M/ZlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJPkZ-00013V-Cl; Wed, 24 Apr 2019 21:48:19 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJPkV-00010m-IN
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 21:48:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556142495; x=1587678495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HLJmdPo2DIDSxK8iquvXyeVmtyscqRTd/8goqoSULLM=;
 b=kueSs2qPbwaUOXHeQHa9N0O/HcNYoxYYwGBYKvgkU0lVfFp/0J442OWt
 806wWTI2ZsqK3PTbBRenq1eBTBHqifh1HvBAe7H/oDHZPMGNyacr3ALX4
 rTMSNAJQ2W7mRx1mRZ/TW75Sf90S/EYR8d+ksnKMJeGKDiqS2fnboWdko
 /AmNEylHbkbqDYRkCpZ4SCWN0+OL7a256P3KMrpOSdYl44mdBgJyrUk88
 LcPs3twy+DgdkXp02hSjaY1SM/sco06zofqsSn9cfBvit3KXrPGDKQ+cH
 KdIttJQVVzCmnkKYdBrq1bDUrzKPLldGHpBtfrY8SKwwTpDz0F9LSNXqG g==;
X-IronPort-AV: E=Sophos;i="5.60,391,1549900800"; d="scan'208";a="212581732"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2019 05:48:14 +0800
IronPort-SDR: orJLCyCNUxFsRnIRjqN3NUCNzJOpz6AoswjcYoz89q4b/R6bccFypyagOcr8ocD8HWL2bTU9Hc
 FzXmZzOctvvByhIx7Ta8EHpnaup+zHJLJWHP5FAF2uXol6/Mx6nNlF4E6w77wCxpWXlhSqi61k
 MvA+tCPGRKBC5LcwnCYyGwkBagpPJbpQU4pNNzN60gGMe3JQgmkEkfeJ/KQMk1hFGuYiiwkKuh
 T3gEKkWgWK+/7FWuto6nKJnpgH4iR5pGfjWiRP2m2KewmlG4qvwux9U4Nt+q0zPjmo56s1lQ2y
 OCRzeYec017msvxqWWHl/GjI
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 24 Apr 2019 14:24:46 -0700
IronPort-SDR: jlBo3KgjjCtfbZ0C2//CHKveriNkLa5ePBIwBiiz2JWS4EEMAwAa6wBKMMCcn5W3PQiQnO0oug
 qmSDOSi3AE1owkEmlOwzrBqH9elQKwPCqBhB3pjdxc8htom8fSSvoo3fNHZyzZ1GirqPmjBSul
 QeFlIQ2sZFSSbZ71SvqCn/m64Z4C39umiG7jv4VwJNWv4mhk3K+I8rBp7cf2eTnkhMuGiJHt07
 dsiJNgj+HO2VeYO677yy/xVmHT/gmMZFsZ6Q25AmJ3uRbeA4BFKaYBuNH8ryQxBtX7dwVToil2
 4WQ=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 24 Apr 2019 14:48:14 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] RISC-V: Implement nosmp commandline option.
Date: Wed, 24 Apr 2019 14:47:59 -0700
Message-Id: <20190424214801.18880-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190424214801.18880-1-atish.patra@wdc.com>
References: <20190424214801.18880-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_144815_719659_6C3C8070 
X-CRM114-Status: GOOD (  10.71  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Johan Hovold <johan@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

nosmp command line option sets max_cpus to zero. No secondary harts
will boot if this is enabled. But present cpu mask will still point to
all possible masks.

Fix present cpu mask for nosmp usecase.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/smpboot.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index eb533b5c2c8c..a8ad200581aa 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -47,6 +47,17 @@ void __init smp_prepare_boot_cpu(void)
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
+	int cpuid;
+
+	/* This covers non-smp usecase mandated by "nosmp" option */
+	if (max_cpus == 0)
+		return;
+
+	for_each_possible_cpu(cpuid) {
+		if (cpuid == smp_processor_id())
+			continue;
+		set_cpu_present(cpuid, true);
+	}
 }
 
 void __init setup_smp(void)
@@ -74,7 +85,6 @@ void __init setup_smp(void)
 
 		cpuid_to_hartid_map(cpuid) = hart;
 		set_cpu_possible(cpuid, true);
-		set_cpu_present(cpuid, true);
 		cpuid++;
 	}
 
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
