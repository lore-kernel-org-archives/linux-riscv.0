Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBDCC49EA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 22:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qAFcudK905hrAjqE5xzxNiGPro76SsAFvfpfSa46yVE=; b=PMceYbAVAGpv3W
	JFW4+ljo39yX0uk0EI5sIQYvRPXu8g9HG7+fKcBh7HZEtepcVNGjXoZ4FgfYgmwqhSoFntaNgKtbQ
	ZHo0Yo2Ayk4KtOkWyK5UhAM1rXPIJrhvyuUMO6yPkgBxF70reF0oGcVhrp7n6IyPAj/5ZhxfQqt/P
	LBOWIYJl8+dpQLEP9dAeiLU/jofWLeg9OTRc7w3MpYtHtGYxZf4dZfHPgUSTKqiJzpqaZvqdqDqB6
	Vvz2p5DNep0hZ9SBN1As1C/leITEfN60B2pReQBXXnRo/AlrGwV8/8g35XY2RGMeYEhFUCsgRSh9G
	2LCSzMx6pizDslxdmSAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbSSM-000000037zZ-3u0H;
	Tue, 06 Aug 2024 22:15:02 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbSSJ-000000037vi-1mJx
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 22:15:00 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6bb687c3cceso5630046d6.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2024 15:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1722982498; x=1723587298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DpwrGsGSvnHFdGVf1tlm4Wyo1L4IUT4bE3I4p9OVTOM=;
        b=PG3Ic8mPBRfwMOtSYTxwrGT4aRMS7b4jHp5c43gndrCwozH9gVm+F9IsY7VwPv838o
         glpXIx+Lsn+hUovXsLcCpH5akQ3cC98T4r1aY9jWq1Yq1qXJE67UAXZBjueTV757QHF1
         nTayZGg2G44UzqlRtbshkDwTP5FIkO4EHHowf+lyq6z9vrlFe7R7U36+52fh1I+LURKu
         3oEoo+2GsVFdd8P8SfxCjhef4B62g2lIsx0r4im6ZTX08ktyFKjpVw4iFpIp+SYJQEph
         has/m2fsgBHk1QNECzo+yU26KLatIxBUjkMptrVk0ovWQmMRsga6kUB6HUKbQ6sH+cJ+
         Zkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722982498; x=1723587298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DpwrGsGSvnHFdGVf1tlm4Wyo1L4IUT4bE3I4p9OVTOM=;
        b=aC2vSWUWEUBPqfYduNPDqhwh1v6r9C9AA1yYw4AuiNPtuldss6oFbrI7YvYAqDa19x
         nMXu/D8MXxm7mzzqndhKMuZWM0a4mmd2C4urVUap+K2DGPWnHpV3AlfreQmVAo69uVat
         USyucM9+X+B50dSwdmkMhHkdRAgbdDKrrVr/mRo13549OYQPEe2kdSoszG0KZ4XWD6PF
         rSLfxE0xKWVS7ZjSNkyyynjbTp3F4Qek7ByCGgRc5hWd3Q05K/4qhJYA8iP5SIoLXTPI
         nYwpYSaxw8J8HcQqrveMi1BWTYog2krQI60ovJw/O9XCS/qj2z7E9sY1kFZ/gq0pciLF
         4iBw==
X-Forwarded-Encrypted: i=1; AJvYcCWj0RHjvjBNPYuJUQckbB6egw/eWGTab1/jBJZYZ7Vmy9l9xYTGS9jdoNknidMscFyi5VQUP5MhgN8Jl508VG9nBAaGFIwtqRI3/M6WRgbQ
X-Gm-Message-State: AOJu0YzGZEt6K/PRjIk+E9om+kXNaPUrBkzkTvjdkzbhGAUCSK54K/YC
	2rj785pWXvODqNkFDiBS5R92b8TiXBj7dQkefMjr/mcLBUIAlsF9Crq8AKps2kU=
X-Google-Smtp-Source: AGHT+IGvHhFLKBv+CzG3kEzbceETNjAkvAWmYHLIEUsuY6FkehJnB//a5YH4EciwSMoOH9WpYcIhcQ==
X-Received: by 2002:a05:6214:5990:b0:6b0:86f9:64ad with SMTP id 6a1803df08f44-6bb98493eb3mr259732626d6.52.1722982497815;
        Tue, 06 Aug 2024 15:14:57 -0700 (PDT)
Received: from soleen.c.googlers.com.com (118.239.150.34.bc.googleusercontent.com. [34.150.239.118])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c8778e1sm50584506d6.128.2024.08.06.15.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 15:14:57 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	alexghiti@rivosinc.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	arnd@arndb.de,
	bhe@redhat.com,
	bjorn@rivosinc.com,
	borntraeger@linux.ibm.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	chenhuacai@kernel.org,
	chenjiahao16@huawei.com,
	christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com,
	david@redhat.com,
	dawei.li@shingroup.cn,
	gerald.schaefer@linux.ibm.com,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	hpa@zytor.com,
	kent.overstreet@linux.dev,
	kernel@xen0n.name,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	loongarch@lists.linux.dev,
	luto@kernel.org,
	maobibo@loongson.cn,
	mark.rutland@arm.com,
	mcgrof@kernel.org,
	mingo@redhat.com,
	mpe@ellerman.id.au,
	muchun.song@linux.dev,
	namcao@linutronix.de,
	naveen@kernel.org,
	npiggin@gmail.com,
	osalvador@suse.de,
	palmer@dabbelt.com,
	pasha.tatashin@soleen.com,
	paul.walmsley@sifive.com,
	peterz@infradead.org,
	philmd@linaro.org,
	rdunlap@infradead.org,
	rientjes@google.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	souravpanda@google.com,
	svens@linux.ibm.com,
	tglx@linutronix.de,
	tzimmermann@suse.de,
	will@kernel.org,
	x86@kernel.org
Subject: [PATCH 1/2] mm: update the memmap stat before page is freed
Date: Tue,  6 Aug 2024 22:14:53 +0000
Message-ID: <20240806221454.1971755-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_151459_484386_E90563A4 
X-CRM114-Status: GOOD (  10.91  )
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

It is more logical to update the stat before the page is freed, to avoid
use after free scenarios.

Fixes: 15995a352474 ("mm: report per-page metadata information")
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/hugetlb_vmemmap.c | 4 ++--
 mm/page_ext.c        | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 829112b0a914..fa83a7b38199 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -185,11 +185,11 @@ static int vmemmap_remap_range(unsigned long start, unsigned long end,
 static inline void free_vmemmap_page(struct page *page)
 {
 	if (PageReserved(page)) {
-		free_bootmem_page(page);
 		mod_node_page_state(page_pgdat(page), NR_MEMMAP_BOOT, -1);
+		free_bootmem_page(page);
 	} else {
-		__free_page(page);
 		mod_node_page_state(page_pgdat(page), NR_MEMMAP, -1);
+		__free_page(page);
 	}
 }
 
diff --git a/mm/page_ext.c b/mm/page_ext.c
index c191e490c401..962d45eee1f8 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -330,18 +330,18 @@ static void free_page_ext(void *addr)
 	if (is_vmalloc_addr(addr)) {
 		page = vmalloc_to_page(addr);
 		pgdat = page_pgdat(page);
+		mod_node_page_state(pgdat, NR_MEMMAP,
+				    -1L * (DIV_ROUND_UP(table_size, PAGE_SIZE)));
 		vfree(addr);
 	} else {
 		page = virt_to_page(addr);
 		pgdat = page_pgdat(page);
+		mod_node_page_state(pgdat, NR_MEMMAP,
+				    -1L * (DIV_ROUND_UP(table_size, PAGE_SIZE)));
 		BUG_ON(PageReserved(page));
 		kmemleak_free(addr);
 		free_pages_exact(addr, table_size);
 	}
-
-	mod_node_page_state(pgdat, NR_MEMMAP,
-			    -1L * (DIV_ROUND_UP(table_size, PAGE_SIZE)));
-
 }
 
 static void __free_page_ext(unsigned long pfn)
-- 
2.46.0.76.ge559c4bf1a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
