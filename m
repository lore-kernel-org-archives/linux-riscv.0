Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3090EC27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 08:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ARKDmdWkgFKptkKBShs3hmSAGb3TRVpzYKt3yMIcPKQ=; b=Kz0P+zKK5/LWfU
	BPx9Q4SEl4qhj4xG6fdlSqTjlZeQt8n0GXMM8c0nOy+HQxHeNXC4kuZ4KNv2yX4/l4WuTfmFrwhFM
	hKbAJCNqUWqwVdFc7EfGE3gGidB0w8yn0OWoI3RPxhUwidldpLYiMRrK7SMMI2ExHWlvOe4W246Ze
	GdwyKUwt+OLOhTze7NT3HpswELUkE9ALF6SBZqjQS34w2fNPzIe4SImNKyukw9Wqn0vT/80dH/nJ7
	F0XZJh4i6YnESH/1SEDV0HjYr6+RtfQZ6ZsavC0oH5C857jt1TxRBOPrQYzXkYUSVysS9c3u8gSou
	2lgbF7RJQ0+w3a2W+tsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKb9M-006Q5t-NU; Wed, 25 Jan 2023 08:28:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKb9I-006Q2z-SJ
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 08:28:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id m15so13133779wms.4
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 00:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CyWdPwmsoEln1rCKIxbXcZ7tw/K7pVLqcNgYwRXhLM=;
        b=OisDsC+EIU6/jRjZrG5YFX4xE8/lvWiWrn7vehFtHMjH7D0bf29AeT04n5xGe5fKJp
         QwzGcRQRPD4oviUUPE7WZPnHk2GiI+k65Kj1+4IqzyFas7V1+uq3scf39HwiUSCDS0bM
         3GFbIfDG1qf+5p6j7xF62Am7PdJqMN0hs0O1MBDOyx+VgkEARy7VqAMxUUoozspSuyCb
         zGptkj2sywHeru4KD/jipfAgT/fDB6eiDqPgV8sNJawFiakebAPzX9f/+aFyeqaELdjM
         EWj99llip6FBzTieb0mX39hEiGm4J8Aivv2WdB2psRB1QsdCZ2daajNJ816Crq3pUT3I
         iHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CyWdPwmsoEln1rCKIxbXcZ7tw/K7pVLqcNgYwRXhLM=;
        b=nuCCec/4+cZWO6n0L6M1umIvt6pk+hm7MF5otC1dmxsMZqOJSBtIM9ONAnIgq1/JDd
         Qhac72M0h5NnTMAra32Njfc4R665r7MJkK/79jG+47+Me4AIs6Ny4TZyS6I2qlm+dUeA
         msAUeKe/l+hrLrObsLU+IS6KBP1tE7CgpI1UO1dyR6bmjsox1hO24eItfjuVD0Ghv8+7
         SeLhYCxib7jS/jKZNfN90FhnI1iuYpIg3wF8nqX1jqRfgxGtDMMtBDiiY1toTd9WlQgj
         3CVKdv9301gEPy4asdhisZJhkgbhSpEBY72vx6Bb6yoVA5h6M1DihmGdKnX6IC/fstHe
         hVLg==
X-Gm-Message-State: AFqh2kpVclA5riUNuXm0W/ep7ScuXIs/At8uOukBXdudQdJbEpNPPNoQ
	dT8iB3XYrfDcViYYCezH3JgUmw==
X-Google-Smtp-Source: AMrXdXtQiFRonCSKZgGEtQQk1kbS0BKk/gtu6+bWv/OU7qtsnQJRbTeUZKPdSNWmMFbG9pHM7wQoFw==
X-Received: by 2002:a05:600c:43d3:b0:3da:fbcd:cdd2 with SMTP id f19-20020a05600c43d300b003dafbcdcdd2mr31194035wmn.9.1674635328028;
        Wed, 25 Jan 2023 00:28:48 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id d11-20020a05600c3acb00b003db30be4a54sm1080541wms.38.2023.01.25.00.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 00:28:47 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 5/6] riscv: Fix ptdump when KASAN is enabled
Date: Wed, 25 Jan 2023 09:23:32 +0100
Message-Id: <20230125082333.1577572-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230125082333.1577572-1-alexghiti@rivosinc.com>
References: <20230125082333.1577572-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_002852_961951_AA03F595 
X-CRM114-Status: GOOD (  12.63  )
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

The KASAN shadow region was moved next to the kernel mapping but the
ptdump code was not updated and it appears to break the dump of the kernel
page table, so fix this by moving the KASAN shadow region in ptdump.

Fixes: f7ae02333d13 ("riscv: Move KASAN mapping next to the kernel mapping")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/ptdump.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 830e7de65e3a..20a9f991a6d7 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -59,10 +59,6 @@ struct ptd_mm_info {
 };
 
 enum address_markers_idx {
-#ifdef CONFIG_KASAN
-	KASAN_SHADOW_START_NR,
-	KASAN_SHADOW_END_NR,
-#endif
 	FIXMAP_START_NR,
 	FIXMAP_END_NR,
 	PCI_IO_START_NR,
@@ -74,6 +70,10 @@ enum address_markers_idx {
 	VMALLOC_START_NR,
 	VMALLOC_END_NR,
 	PAGE_OFFSET_NR,
+#ifdef CONFIG_KASAN
+	KASAN_SHADOW_START_NR,
+	KASAN_SHADOW_END_NR,
+#endif
 #ifdef CONFIG_64BIT
 	MODULES_MAPPING_NR,
 	KERNEL_MAPPING_NR,
@@ -82,10 +82,6 @@ enum address_markers_idx {
 };
 
 static struct addr_marker address_markers[] = {
-#ifdef CONFIG_KASAN
-	{0, "Kasan shadow start"},
-	{0, "Kasan shadow end"},
-#endif
 	{0, "Fixmap start"},
 	{0, "Fixmap end"},
 	{0, "PCI I/O start"},
@@ -97,6 +93,10 @@ static struct addr_marker address_markers[] = {
 	{0, "vmalloc() area"},
 	{0, "vmalloc() end"},
 	{0, "Linear mapping"},
+#ifdef CONFIG_KASAN
+	{0, "Kasan shadow start"},
+	{0, "Kasan shadow end"},
+#endif
 #ifdef CONFIG_64BIT
 	{0, "Modules/BPF mapping"},
 	{0, "Kernel mapping"},
@@ -362,10 +362,6 @@ static int __init ptdump_init(void)
 {
 	unsigned int i, j;
 
-#ifdef CONFIG_KASAN
-	address_markers[KASAN_SHADOW_START_NR].start_address = KASAN_SHADOW_START;
-	address_markers[KASAN_SHADOW_END_NR].start_address = KASAN_SHADOW_END;
-#endif
 	address_markers[FIXMAP_START_NR].start_address = FIXADDR_START;
 	address_markers[FIXMAP_END_NR].start_address = FIXADDR_TOP;
 	address_markers[PCI_IO_START_NR].start_address = PCI_IO_START;
@@ -377,6 +373,10 @@ static int __init ptdump_init(void)
 	address_markers[VMALLOC_START_NR].start_address = VMALLOC_START;
 	address_markers[VMALLOC_END_NR].start_address = VMALLOC_END;
 	address_markers[PAGE_OFFSET_NR].start_address = PAGE_OFFSET;
+#ifdef CONFIG_KASAN
+	address_markers[KASAN_SHADOW_START_NR].start_address = KASAN_SHADOW_START;
+	address_markers[KASAN_SHADOW_END_NR].start_address = KASAN_SHADOW_END;
+#endif
 #ifdef CONFIG_64BIT
 	address_markers[MODULES_MAPPING_NR].start_address = MODULES_VADDR;
 	address_markers[KERNEL_MAPPING_NR].start_address = kernel_map.virt_addr;
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
