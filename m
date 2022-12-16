Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EFAC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 16:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ARKDmdWkgFKptkKBShs3hmSAGb3TRVpzYKt3yMIcPKQ=; b=KvB6TxywT+c2ON
	EGKqA4L0tRfR/ctzw2yfk+2aeWRit+3OmNynxgNiXun6jIu37SJJZRhF0husP87BzO7KzoKBtztT3
	OQ8B+8dNEHTqoDLe+SP2nN1oOXtFW+9DVzyvcljIDj6UOtfvkKOm4hU6SxofA5INolx+Pje4ccPe4
	B7sPTv79U4L5cCvtIZf4IfwULVhXL2si2ezn3KerbFGDEArTjej7/1LN++KeebxA5Rze0Y/yTXnZP
	FPVf+IGJ5EXdWl9oi5kb4mEHg5w0gMc5n26EwSP/vOON/sHEeec7gOVtnU9Y+MQU6IfTkY6Y+Oq6v
	YDMS5c3TepYsMQJg83qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6DY7-00GQIj-Nu; Fri, 16 Dec 2022 16:27:03 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6DY4-00GQGn-DT
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 16:27:01 +0000
Received: by mail-wr1-x434.google.com with SMTP id co23so3040809wrb.4
        for <linux-riscv@lists.infradead.org>; Fri, 16 Dec 2022 08:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CyWdPwmsoEln1rCKIxbXcZ7tw/K7pVLqcNgYwRXhLM=;
        b=Rvbra2pefYxN5Q59kp/VQ7E4iiWi056Ll+Lc97nNZ8xQjIW01p4/Hhmq8nyEsUCZaN
         fFEJ5yuh0sy9fep0YuWkUVmUgvhZWLsE6V/HZlrqB9miJXEuCFTFIs/2UY6MbYspUkw8
         sgtydWJi7DQ6WrAVuF3osCpkGVohxOEeO4DvlEa5KpypUXdKdcXWxti2XjDocPJq856p
         qMZjBMDvhk8b7uBHCy5IqIy3rBfQdCQG92tE+pUgOJMDn560Xj0on7/f03e3sGFwkkaP
         g88GQZxRYpt/58KFbHAgzx82CtnYDhfZQONayWapn6ilzFCEXq+aR6oxaHrFfnaE8lO7
         OAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CyWdPwmsoEln1rCKIxbXcZ7tw/K7pVLqcNgYwRXhLM=;
        b=pXx0kpUzmmLtZffsvuRwwbPB2WOgxrNevY4BtFWfxwtLH/EtYEu502++lTdgMa25ST
         O9/60gi337PdTFfAZobrN+9cTLfUBVmrr4pg5MOKiYt8xSx0Oe4tPZ1CzlMDsxZSKayF
         12FD5vkkCdCHB0bpmxPinzGXXfA4+BJcNwOi+WwNHoRzpke+0CrMvxbU14jQBtH/6QT2
         xJSaw3dxL9qQgwEQ5CNSDb6B85qbO/o6VmfRYb86EMpy1UcGPcy4kYhZbEz/nitAwBfi
         oCFPPZQnywJfAfgY4yMa3BmAR0ZI0uGzxx+E4i/LdArCaurobvtEZc7N1QDNRg6dp4j1
         NGyQ==
X-Gm-Message-State: ANoB5pnyRiO17MrHveaBu0ZSIIjQtZTgdMWFgGL8Dwv99caEkZL2kwNz
	w6T2jValRn/aspXuDBFZJFrghw==
X-Google-Smtp-Source: AA0mqf6hPxfK2i4tDJ4xpuFfTwdw7faWUPdgx5VEnXDVJO+7l98ZIdasi7aT4CKr/yV1k0PiX318Fw==
X-Received: by 2002:adf:f9c7:0:b0:242:4c28:c9a9 with SMTP id w7-20020adff9c7000000b002424c28c9a9mr19141287wrr.46.1671208016801;
        Fri, 16 Dec 2022 08:26:56 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id z7-20020a5d4407000000b0024245e543absm2554603wrq.88.2022.12.16.08.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 08:26:56 -0800 (PST)
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
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 5/6] riscv: Fix ptdump when KASAN is enabled
Date: Fri, 16 Dec 2022 17:21:40 +0100
Message-Id: <20221216162141.1701255-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221216162141.1701255-1-alexghiti@rivosinc.com>
References: <20221216162141.1701255-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_082700_470161_830CA887 
X-CRM114-Status: GOOD (  11.83  )
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
