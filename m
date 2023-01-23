Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549C8C05027
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 10:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ARKDmdWkgFKptkKBShs3hmSAGb3TRVpzYKt3yMIcPKQ=; b=KCD0fVZARwWvEK
	/GsDFt/UHmdlajyus74dKdtxyKFC9m+AtMriu6tbZ0NKs2HFRsAnaxdgUscrQaVPV4uCZf9j6xXLv
	no9d5e0c4XeN8TShW9pf6gAzqoKKKowdWYudK8Jw8EDvS1IUdYiPhQAZ7FmwRKpJLpqkcsScU/FGi
	F/MTN/CFdrOc3Y1FVBTNaOSjx+iDM+WF1AdDwUPXs4LXI0s0KmpB1Ej7jHsv7ICQArghmb7NyKnel
	S551U7bvF86VhufUwwfqFJawcXmpLeO+NE1aOB+HBd1CeDdOX3C+2Vc9ndcM3SBrCOw71RXnY+tBD
	YQhUkYVrfxHkaUsPQDkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJu2t-00Gofl-8J; Mon, 23 Jan 2023 10:27:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtqu-00GjKj-EJ
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 10:15:02 +0000
Received: by mail-wr1-x429.google.com with SMTP id q5so5610271wrv.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 02:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CyWdPwmsoEln1rCKIxbXcZ7tw/K7pVLqcNgYwRXhLM=;
        b=B/+9cQa9D3OWbWrGWG8AkvGVZ9bHw4OI3uim5Hs8mPKvCgofoiFEtTIOjMoY5H4B2J
         7J7sp0vWGL4HmZT42kveiMzKLuXWbI622TnAgAJibD86SCnYfzPsjU7xWVvJBoOvDVWw
         FTziqsumYW2MVAiRg88H5Nk5tZR+fD5PLftSJ1zW/FYW9Ub2BhJk0crppgiy2jnltvI/
         RH/VDVpkSH5X/ugk0aZUGh3HdbWxPBSPNKGFkdEt5I0Qfp0kqUgDuXB7hrTWwBrgSAso
         6sC9Rg8mEOQlyWgqeCxXIt1kANCdPYx9I3UxfyEZUckUMJD3LDvIEefUp3qfnNL47LI+
         yBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CyWdPwmsoEln1rCKIxbXcZ7tw/K7pVLqcNgYwRXhLM=;
        b=rjXg9hiFQ3/CT2NaZVSbSwro5tXRGZOsy22BWSSoVnfb1ZhtFIulZKPSZQa6KkH85K
         uiJhOvjMuEI2W6AknUXRN4/6e8goHmLLUzYzXcjwY5+h/o3eFmkApds4QNnEuBwdCudF
         BuldC+w5mVDnBDP4Spw+R1ldBsxnPuzwoBvGqyn3niTeMvbVrse9ZiTGbA+Ebz0yD8RA
         MynmxxXXX+NWCEjgX9iA2puKR75zzLYstv1BhqumsweNaCJhGoJ/NXVbjZSntM9BC96N
         4ErJyliHfD3LJDqU1nCYH+0BCt3fmSg534pkNm4E8ZnoDTKxGq0vc7wBUZ9YhWlNbi1d
         l18g==
X-Gm-Message-State: AFqh2kqMK2cfFf6NTWXY6DxwsajYm43fAgTEwKgOWL7SazZCNKpN7c0i
	VSbevk5baJ2n2Ho+7861n9fAEw==
X-Google-Smtp-Source: AMrXdXvBvUSsZmQtLl9aDGwv2lGv6Nx60FmSYTVQPcJpaIRYrIWljEcJJVSyxsikO9FjEzadqU/y0w==
X-Received: by 2002:a05:6000:388:b0:2bd:dc0f:5ee5 with SMTP id u8-20020a056000038800b002bddc0f5ee5mr25724943wrf.22.1674468898664;
        Mon, 23 Jan 2023 02:14:58 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600016cd00b002be25db0b7bsm7130225wrf.10.2023.01.23.02.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 02:14:58 -0800 (PST)
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
Subject: [PATCH v2 5/6] riscv: Fix ptdump when KASAN is enabled
Date: Mon, 23 Jan 2023 11:09:50 +0100
Message-Id: <20230123100951.810807-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230123100951.810807-1-alexghiti@rivosinc.com>
References: <20230123100951.810807-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_021500_551276_1D2F8F1D 
X-CRM114-Status: GOOD (  12.36  )
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
