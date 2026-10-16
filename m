Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B832ECCA46C
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 14:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cysCKKVrjzmOoCN1vAY0xFf/qhbKyRnGcTK8J5lZDr4=; b=HO4KO7ukDq4TIS
	IFaM2rJoKvUDXfOtPp9te5B4EgolK8tTbMDC7ncDP/6NAMuK3vFASTRnz2UIpwB4DgYVS9Ma8t11f
	r51sTLSJBLTyGAHskl6XiuM7GaXHrDfaKe83k8PTnsLRYTQW78Cp5Vf1HK1ZmDVu4y+BeuWoqcXKq
	ym7lOGAxeTcOBTyFxRAP5Yg2z77FGO15qOnKdnfpia1u9pYh2UAszvOqF/GdfG1En70PL9cljOnF0
	vkVOqkXQClgavu9RwDd3+0iJM3k/6dcCNky/lu7Y4/s/AiYt+Qae7oyzOPJk3splLZFhNgppblkKI
	ryVlqMWpuvVD8VLzccmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHigw-000000036qW-3fto;
	Fri, 16 Oct 2026 14:13:50 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHigu-000000036nh-2G9i
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 14:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+L
	zUBOKkn8lISsRKm3JBUHS+G+X3VkNgk7YqK6ls+Ac=; b=pR9pOXNlLfOilxJYdw
	+RFXkYgY2jYpMHWl7maAjcjjoqWA4o7KHqUuXjJCCEhVV+5is8Dp+pUBD6GnpG2h
	2Ms3rog4kZoEyRFMMw7EShkNsRi9rs1PuRiv7psNy1Pcc+WcnakQUwwneXgeEFob
	htmjlJn4OSV868bs2/vl/PKAs=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCX5Hj5MNJqeorFAA--.36405S3;
	Fri, 16 Oct 2026 22:13:15 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 1/2] riscv: validate RINTC entries before use
Date: Fri, 16 Oct 2026 22:12:47 +0800
Message-Id: <20261016141249.2791819-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016141249.2791819-1-yaojiale02@163.com>
References: <20261016141249.2791819-1-yaojiale02@163.com>
MIME-Version: 1.0
X-CM-TRANSID: PCgvCgCX5Hj5MNJqeorFAA--.36405S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr43Zr4fWFWfCFW3urW7urg_yoW8GF1UpF
	4kK3s8WFs5GanFg343tr4kuay5JrsrGa12qFWjka4UtF47Wr1UJa9ak3WY9F98tF109ay0
	9F1Fv3W09a4UA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR189tUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xuZ02rSMPueugAA3p
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_071348_944705_033BD0C2 
X-CRM114-Status: GOOD (  10.98  )
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

The RINTC parser reads the flags field before checking that the MADT
entry contains a complete RINTC structure. A truncated firmware record
can therefore trigger an out-of-bounds read during early CPU discovery.

Move the existing BAD_MADT_ENTRY() check ahead of the first typed field
access.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 arch/riscv/kernel/smpboot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index a9de2dae804c..9c341398058c 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -76,6 +76,9 @@ static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const un
 	static bool found_boot_cpu;
 	struct acpi_madt_rintc *processor = (struct acpi_madt_rintc *)header;
 
+	if (BAD_MADT_ENTRY(processor, end))
+		return -EINVAL;
+
 	/*
 	 * Each RINTC structure in MADT will have a flag. If ACPI_MADT_ENABLED
 	 * bit in the flag is not enabled, it means OS should not try to enable
@@ -84,9 +87,6 @@ static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const un
 	if (!(processor->flags & ACPI_MADT_ENABLED))
 		return 0;
 
-	if (BAD_MADT_ENTRY(processor, end))
-		return -EINVAL;
-
 	acpi_table_print_madt_entry(&header->common);
 
 	hart = processor->hart_id;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
