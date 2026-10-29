Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0855606A325
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 03:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1CnPuSpx;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aMZcUyuG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/z9IGAiCTr19Bi6IkxRRtwmoLSBgc/nhMc6/WN587DY=; b=1CnPuSpxqCw3DkIPKpLNrzoA2d
	0yXV3CXMNOsq4alIbgGPi1/Y759MIO1FEwqk8C4cpeoAffmpMxtxU4HRVdpzjxR8jf8vWpb4mJe8D
	IyHECgiZyfE5zx8USabBXCTwUqUZP5BAZMiX7ubf2gOz/kDWUMAaZa6d5U8Qbu9bDol9kpln858ck
	sPnPTGByOpHPpUd96rKeFZAoUD5S3Sg1kQxhWqt4ZslhBi/2ORS2coZh/CrO9briCsWSiwF7zp+YY
	VNX8rcUieo4cNQBA0XI1vARotFBOnGxtycG5sOJStCkIXX4NcIR+GlYqyVPRzxLD0pByGtDG0grv5
	gmejW4rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHD2-00000008HHZ-3ztn;
	Thu, 29 Oct 2026 03:53:48 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHCz-00000008HDd-2kHu
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 03:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ot
	VPgR69rapmEguUIGNpGUBHey5Mb7pxmVbkoiOMICE=; b=aMZcUyuG4d6BwZBsb7
	Aq41lFcTAGiw//e96sgwFF9tfftGb1CH77SJ7aNoJbJdFDzhPW/pZVQYYUm7Tnep
	PslkNujfz8JEceDdYqViwuU3+sSKreECE1fjYsLAXRCGV3w4RMVM1YoQpLIdRku4
	x21M5frhsj5BrLe8F8cWWc7zE=
Received: from pc.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCnsSkVw+JqTWv_Cg--.16381S9;
	Thu, 29 Oct 2026 11:53:04 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@linux.dev>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 07/20] riscv: validate RINTC entries before use
Date: Thu, 29 Oct 2026 11:52:38 +0800
Message-Id: <20261029035253.2333852-8-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029035253.2333852-1-yaojiale02@163.com>
References: <20261029035253.2333852-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: PigvCgCnsSkVw+JqTWv_Cg--.16381S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr43Zr4fWFWfZry3ZF1kZrb_yoW8XrykpF
	4DKr98Wrs5GanFg347tr4kuay5ArsrGa1aqrWjka4UtF47Gr1UXasa93WY9F98tF10gay0
	9F1Yv3W0va4UA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UPWrAUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQBMhmriwyDjuAAA33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_205346_099760_987F6417 
X-CRM114-Status: GOOD (  11.75  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RINTC parser reads the flags field before checking that the MADT
entry contains a complete RINTC structure. A truncated firmware record
can therefore trigger an out-of-bounds read during early CPU discovery.

Move the existing BAD_MADT_ENTRY() check ahead of the first typed field
access.

Fixes: ce92546cd637 ("RISC-V: smpboot: Add ACPI support in setup_smp()")
Cc: stable@vger.kernel.org
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
