Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2BECCD184
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Oct 2025 06:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k+PuqFYxYbqRQlq7b0gWSH+bi97zbXm4yrDYof6UntY=; b=09dfyoh5duK448
	15JANPcWbl8UHRsPsSVyoKwb2V9t0J8PQBlrsw1cVykGUVBy3eojBugnTpYLbdEXPAt8PT26WJPyP
	g/K4SMyHdw4y2m/UzxtzuLb1BCKerW0Cxkp0yAAJ/zZelJnsPINFjARLf/wGoUbC0JFSze02pw+gN
	Nr/3eZmEXN6fp9xtYNqKzzYbAYcc6qC0C6aiZuz+gsNPYuUVoqFJe2wSOParbXA26CZRmCCye3bEU
	p/BYYuPxNDaxieOOKotJNw3t7GCtCNXxZgro5MywhazSUstjoDNxHJerNrM5z2Wh0H5dcBMRSyzP5
	CPA5RsA8hTsCfTYS91tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA0TH-00000009biq-2nHU;
	Sat, 18 Oct 2025 06:31:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA0TG-00000009bii-0PQX
	for linux-riscv@lists.infradead.org;
	Sat, 18 Oct 2025 06:31:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA8B26026B;
	Sat, 18 Oct 2025 06:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56658C4CEF8;
	Sat, 18 Oct 2025 06:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760769075;
	bh=Pe18bSnJttdBMJWFp8aOXL+hPDJB6fNIKludDZ/2qTI=;
	h=Date:From:To:cc:Subject:From;
	b=m94Qr+LgKNtIBl3EJ0s6214Ppzej5/R0s/13iJh8oszsKHZpk74lUN+/Y4ajGGZmd
	 Sm0x8V5w++K2gyZxzD8bzMtwUuteNq+6QoLhlWvbt6SWVnzluVC9zbeuAsAbkdG2Qf
	 hcRSGz2XRLyi7ExlVhCDmj8/3sMU7SzFZ+BdKxzh5ES5VgAb1I1f1x0313fzsyhM2j
	 y/0A+/qB0hGSajZKTEYR0k+ONkUsfNMV3hwVQ6Bab4mTEK+w5fUkGNGVKr/B9ns1YG
	 ssxWNB7hFHelsF00NWjVkI23GxPNV+GDfMYmUk7CNX/QYnENiteMCojOXiFmIMIE6G
	 duNR4a4/7RhRA==
Date: Sat, 18 Oct 2025 00:31:11 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org
cc: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH] riscv: cpufeature: avoid uninitialized variable in
 has_thead_homogeneous_vlenb()
Message-ID: <22674afb-2fe8-2a83-1818-4c37bd554579@kernel.org>
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

In has_thead_homogeneous_vlenb(), smatch detected that the vlenb variable 
could be used while uninitialized.  It appears that this could happen if 
no CPUs described in DT have the "thead,vlenb" property.

Fix by initializing vlenb to 0, which will keep thead_vlenb_of set to 0 
(as it was statically initialized).  This in turn will cause 
riscv_v_setup_vsize() to fall back to CSR probing - the desired result if 
thead,vlenb isn't provided in the DT data.

While here, fix a nearby comment typo.

Cc: stable@vger.kernel.org
Cc: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 377be47f90e41 ("riscv: vector: Use vlenb from DT for thead")
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/kernel/cpufeature.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 67b59699357d..72ca768f4e91 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -932,9 +932,9 @@ static int has_thead_homogeneous_vlenb(void)
 {
 	int cpu;
 	u32 prev_vlenb = 0;
-	u32 vlenb;
+	u32 vlenb = 0;
 
-	/* Ignore thead,vlenb property if xtheavector is not enabled in the kernel */
+	/* Ignore thead,vlenb property if xtheadvector is not enabled in the kernel */
 	if (!IS_ENABLED(CONFIG_RISCV_ISA_XTHEADVECTOR))
 		return 0;
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
