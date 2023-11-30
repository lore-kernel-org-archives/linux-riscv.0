Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE3BC07E97
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 02:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZW51JmIh6m2YeSsRAS5CfwYvC507aqPDi4VWo3RIVaQ=; b=HR2lZj6sW3Juq+
	p2b/xsSK0O3v5VKBAIvR5UzKQG0dog9Y17GWZkw1uM7gq2R/BuwlyCsXNg+g/10eap/Py9h/Pu3xv
	5EOfYg6rMzX82vmV1h5Fd9rDbYY6rq4BW5IJou97slhdMi2u01SqGQJMhIM0Mvzo++AvXBkoEeKdJ
	7YxVg9c1XaLjJ8vK277UDPwBu4b2gjVyx61Xu9ciciWWJRQAWpqb/zQgNRNA+kEGPITqcsPQ4HRvH
	pNiGC1t6FVgWn1gZSy4ajU3JpFO7yyy7/oZlQ+9rdvC0Vn4t/lQSiUIwd7aQMYAGqeH28h2wTy7Ls
	B7R8B83IkN/1vdwm3NmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Wyw-009mTm-1d;
	Thu, 30 Nov 2023 02:40:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Wyi-009mGc-34
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 02:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701312036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rdwBdzw1OKhTav+YH8fRcY/9XRVbx1jKltcdxPMZtNM=;
	b=GJHXiBIUcPyJzwXuQzslneiLC0IjsKfg7s/mwUloYb/U3D7OVxi5CXX0T96GlMFl7hZP98
	aFjpIHFJoVjwW1vHf//ijW5bz11gWRq8P9ofSJPF9ZLBvAbe+uJhLCwawjZn33Ho8F0rHz
	kjQVzryWBGHpwa1Lw7Fs7vZtF8/NI1A=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-79-z7H-g0mWPeOtPLBUD5zPOA-1; Wed,
 29 Nov 2023 21:40:30 -0500
X-MC-Unique: z7H-g0mWPeOtPLBUD5zPOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0121A3C027E4;
	Thu, 30 Nov 2023 02:40:30 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.113.121])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DA7602026D4C;
	Thu, 30 Nov 2023 02:40:25 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org,
	akpm@linux-foundation.org,
	joe@perches.com,
	nathan@kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v3 6/7] kexec_file, power: print out debugging message if required
Date: Thu, 30 Nov 2023 10:39:54 +0800
Message-ID: <20231130023955.5257-7-bhe@redhat.com>
In-Reply-To: <20231130023955.5257-1-bhe@redhat.com>
References: <20231130023955.5257-1-bhe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_184037_082864_26D19A12 
X-CRM114-Status: GOOD (  13.16  )
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

Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
loading related codes.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/powerpc/kexec/elf_64.c       |  8 ++++----
 arch/powerpc/kexec/file_load_64.c | 18 +++++++++---------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index eeb258002d1e..904016cf89ea 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -59,7 +59,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	if (ret)
 		goto out;
 
-	pr_debug("Loaded the kernel at 0x%lx\n", kernel_load_addr);
+	kexec_dprintk("Loaded the kernel at 0x%lx\n", kernel_load_addr);
 
 	ret = kexec_load_purgatory(image, &pbuf);
 	if (ret) {
@@ -67,7 +67,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 		goto out;
 	}
 
-	pr_debug("Loaded purgatory at 0x%lx\n", pbuf.mem);
+	kexec_dprintk("Loaded purgatory at 0x%lx\n", pbuf.mem);
 
 	/* Load additional segments needed for panic kernel */
 	if (image->type == KEXEC_TYPE_CRASH) {
@@ -99,7 +99,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 			goto out;
 		initrd_load_addr = kbuf.mem;
 
-		pr_debug("Loaded initrd at 0x%lx\n", initrd_load_addr);
+		kexec_dprintk("Loaded initrd at 0x%lx\n", initrd_load_addr);
 	}
 
 	fdt = of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
@@ -132,7 +132,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 
 	fdt_load_addr = kbuf.mem;
 
-	pr_debug("Loaded device tree at 0x%lx\n", fdt_load_addr);
+	kexec_dprintk("Loaded device tree at 0x%lx\n", fdt_load_addr);
 
 	slave_code = elf_info.buffer + elf_info.proghdrs[0].p_offset;
 	ret = setup_purgatory_ppc64(image, slave_code, fdt, kernel_load_addr,
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 961a6dd67365..5b4c5cb23354 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -577,7 +577,7 @@ static int add_usable_mem_property(void *fdt, struct device_node *dn,
 		       NODE_PATH_LEN, dn);
 		return -EOVERFLOW;
 	}
-	pr_debug("Memory node path: %s\n", path);
+	kexec_dprintk("Memory node path: %s\n", path);
 
 	/* Now that we know the path, find its offset in kdump kernel's fdt */
 	node = fdt_path_offset(fdt, path);
@@ -590,8 +590,8 @@ static int add_usable_mem_property(void *fdt, struct device_node *dn,
 	/* Get the address & size cells */
 	n_mem_addr_cells = of_n_addr_cells(dn);
 	n_mem_size_cells = of_n_size_cells(dn);
-	pr_debug("address cells: %d, size cells: %d\n", n_mem_addr_cells,
-		 n_mem_size_cells);
+	kexec_dprintk("address cells: %d, size cells: %d\n", n_mem_addr_cells,
+		      n_mem_size_cells);
 
 	um_info->idx  = 0;
 	if (!check_realloc_usable_mem(um_info, 2)) {
@@ -664,7 +664,7 @@ static int update_usable_mem_fdt(void *fdt, struct crash_mem *usable_mem)
 
 	node = fdt_path_offset(fdt, "/ibm,dynamic-reconfiguration-memory");
 	if (node == -FDT_ERR_NOTFOUND)
-		pr_debug("No dynamic reconfiguration memory found\n");
+		kexec_dprintk("No dynamic reconfiguration memory found\n");
 	else if (node < 0) {
 		pr_err("Malformed device tree: error reading /ibm,dynamic-reconfiguration-memory.\n");
 		return -EINVAL;
@@ -776,8 +776,8 @@ static void update_backup_region_phdr(struct kimage *image, Elf64_Ehdr *ehdr)
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		if (phdr->p_paddr == BACKUP_SRC_START) {
 			phdr->p_offset = image->arch.backup_start;
-			pr_debug("Backup region offset updated to 0x%lx\n",
-				 image->arch.backup_start);
+			kexec_dprintk("Backup region offset updated to 0x%lx\n",
+				      image->arch.backup_start);
 			return;
 		}
 	}
@@ -850,7 +850,7 @@ int load_crashdump_segments_ppc64(struct kimage *image,
 		pr_err("Failed to load backup segment\n");
 		return ret;
 	}
-	pr_debug("Loaded the backup region at 0x%lx\n", kbuf->mem);
+	kexec_dprintk("Loaded the backup region at 0x%lx\n", kbuf->mem);
 
 	/* Load elfcorehdr segment - to export crashing kernel's vmcore */
 	ret = load_elfcorehdr_segment(image, kbuf);
@@ -858,8 +858,8 @@ int load_crashdump_segments_ppc64(struct kimage *image,
 		pr_err("Failed to load elfcorehdr segment\n");
 		return ret;
 	}
-	pr_debug("Loaded elf core header at 0x%lx, bufsz=0x%lx memsz=0x%lx\n",
-		 image->elf_load_addr, kbuf->bufsz, kbuf->memsz);
+	kexec_dprintk("Loaded elf core header at 0x%lx, bufsz=0x%lx memsz=0x%lx\n",
+		      image->elf_load_addr, kbuf->bufsz, kbuf->memsz);
 
 	return 0;
 }
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
