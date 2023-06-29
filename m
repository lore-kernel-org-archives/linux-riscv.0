Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E52EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 10:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m0B781MhT2JEXQcbsLGCa1KsJxZQlHNvQ6H2pehuK5c=; b=DX5CmWlVzxT1ek
	gJNiSdvBG+EeUFi8zYa/ehOC5HBlgyAGakva7UayL/qkb4WwOmV19yZhKJUEla0VWuh8FycVCpjzl
	wcogCB11xXY/xERf6cf+PvpUb5p5dNDV/K3fpA9zxgCRWQOjhQc6Wz4vbvThkOOnPNLzYEXlpdj7J
	cGyZfDabEhL3TUa+VJgp1Wl7hKn2OMp9eA0p54lLPJuR0agJw/2I+DBvd8JhrqHoIX4IN3CtPnwLw
	/mV6zN6zVrzSYy3s+Bwu7alvstTHqWVqGXmClvhjWc8by8v2eHAtMYV5530Gjc5jcIc0WKhYEMP4b
	5PCVvVjTiudL8LXccAYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEpMV-000tUd-1C;
	Thu, 29 Jun 2023 10:58:55 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEpMT-000tTR-0Z
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 10:58:54 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7659dc74da1so54095285a.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 03:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688036328; x=1690628328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4VnJRF+bvKvFG7e8QSGNJVbP7sD6ShtvV0wC+uPz2w4=;
        b=o+qZW/ID5ykc5l20pWKMRIfquYco820JW+lACiz582Rsj0smJHw5Z3gH65bwUneaXA
         yNqJHtP+M8vGgBhLymuXaUOXZ1UyEfXQ2lp7hMt4szT+h7oko6ubijEU9SlZcazeE678
         zEOmKvdpw9Hth6CA9pDyIqCdNno+GS/7J03Sgblkfs5mhZrsRPy+TkvermqpEXR7WYdD
         82mgiIaB8umzKsR3XxXeg5WMQyy9cmuNEuVDM21wTsA7j2rXLY8twTS6UH4q2a8Krxil
         1tQ6fEKUot0PAbjfskZeyu3UWOshyNFXy+O3e2/yJfAGBSyu/9zQQsJzQ6PmcUjN8p85
         U3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688036328; x=1690628328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VnJRF+bvKvFG7e8QSGNJVbP7sD6ShtvV0wC+uPz2w4=;
        b=gRy6/ccYJH5wSS4xI8Fw2s0p9arpiYI472OCRL8ukx507axH0WDMsvLRxwfZ+YcS+k
         XCxxCliLYi3WGErJ4D72eKK/qltXvwHetdfhSgDpPTeWcdwSMJB06DB2MM9bSpExC6av
         l1VtNER2i4rANwbfLUlbgg3vRa+AC8mLR/TNc+aiLubL/hOk4sN302wK7DTHktEPCPeQ
         gzMez09GNoSqLazis+/bq3HV1qdLeIx0PBNH1Jx2W0c1gQGsrshVODrWtILeX7z9k99V
         gS7bXtS4jfJEyPo2QMuIZLtKbhlan3MgT6vHziqJD1PJDgjLziB4Of54DtHD63c5js6R
         x01A==
X-Gm-Message-State: AC+VfDwcDA4pk/YbvICpDtMjudjq9D1sMBJw2nOi6QTVO7stxz4sfuJ+
	RmO37l2vNgR4Eh178il9/q0=
X-Google-Smtp-Source: ACHHUZ5l2fGgSesEkEiyi9CYPVPtoZ/T7+l/KE9QTC0baTm/v3rkXZmUpjQBPEQ9ufeg2STeuhmC+g==
X-Received: by 2002:a05:620a:d89:b0:767:2f4a:e07a with SMTP id q9-20020a05620a0d8900b007672f4ae07amr2027566qkl.68.1688036328270;
        Thu, 29 Jun 2023 03:58:48 -0700 (PDT)
Received: from localhost.localdomain ([58.240.82.166])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a195d00b0025ef39c0f87sm9734017pjh.0.2023.06.29.03.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 03:58:47 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	ajones@ventanamicro.com,
	sunilvl@ventanamicro.com,
	heiko.stuebner@vrull.eu,
	apatel@ventanamicro.com,
	suagrfillet@gmail.com,
	evan@rivosinc.com,
	greentime.hu@sifive.com,
	leyfoon.tan@starfivetech.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: BUG_ON() for no cpu nodes in setup_smp
Date: Thu, 29 Jun 2023 18:58:39 +0800
Message-Id: <20230629105839.1160895-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_035853_213380_B91D611C 
X-CRM114-Status: GOOD (  11.25  )
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

When booting with ACPI tables, the tiny devictree created by
EFI Stub doesn't provide cpu nodes.

In setup_smp(), of_parse_and_init_cpus() will bug on !found_boot_cpu
if acpi_disabled. That's unclear, so bug for no cpu nodes before
of_parse_and_init_cpus().

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 arch/riscv/kernel/smpboot.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 6ca2b5309aab..243a7b533ad7 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -187,8 +187,13 @@ static void __init of_parse_and_init_cpus(void)
 
 void __init setup_smp(void)
 {
-	if (acpi_disabled)
+	if (acpi_disabled) {
+		/* When booting with ACPI tables, the devictree created by EFI Stub
+		 * doesn't provide cpu nodes. So BUG here for any acpi_disabled.
+		 */
+		BUG_ON(!of_get_next_cpu_node(NULL));
 		of_parse_and_init_cpus();
+	}
 	else
 		acpi_parse_and_init_cpus();
 }
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
