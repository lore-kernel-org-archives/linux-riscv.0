Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D91BC636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NF+nBjOTn5FJzMHnKU8jnzsjqnUDxzT7PH+Otgl+Rfw=; b=r7mUsVLw1ThY50
	iY1UYbDGEDfyPOnoyq41+pkytvBVOiVKNvuPW9r19Pmvv1yvOe0U0i5Wpx6WlCMgVXzIfBUYYODRv
	QdhGfd6L/42jxss0fdKJI68LgiW4r2dtv4pnrqreQrIwRHka+uCcn5jxI88TQXAH97mZCQwdO8+7g
	YdN4rNMf36PIDRsOthWA7r3rdvL9LXu1jnxhzaVWtZ+wLXJ6uH9xBHMAf9ndVMdH7tMR7YVW0ORpb
	J+2zFhrhf80akfl8InceGdaASL/KZcfQWIKX3tjvIcfgZoTZOJQNS83lD8IcKvzcZtAzztTgc8lZX
	vHadR+r2jF9sPVwKq4nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRRvG-00DHwQ-Hv; Mon, 13 Feb 2023 06:02:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRRvF-00DHvy-Gh
	for linux-riscv@bombadil.infradead.org; Mon, 13 Feb 2023 06:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8YCem4BrJJv8uMiBliK+eUgJsgA757fo9l+siWv19bQ=; b=XOWSiB72pCNNb1lOnMX9Hyh2W5
	WtUrutFIWHzrcncjXCCSqaAfctAC8NnddiQAqz+2oI1+crZ5fm9pjpJ3HTf/TmCj+vAxtsrUDRy35
	EyV0DOLop1pMt5f9D9HW4vW+L7j2JLuwt4ftVquK2hY4g5/ZwrnIZoSvSP8YDO5JLVz3amEyNvb9G
	vITtdHI/9PKLNaeHcIgLGnB9KEamhS9OmirUxz4AhM5Ha0Wbm8VUoVuB0FeFp8UeDlDFxOtpJYsrm
	pTQQcxhrviPN/shZJGttgkdteEmo6so4av3TrlMQZGIi669cz6k+YXQWyf17evlWIhMDL5YZnnl3g
	h3cF0XGw==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pRQqR-009BQg-0B
	for linux-riscv@lists.infradead.org;
	Mon, 13 Feb 2023 04:53:42 +0000
Received: by mail-pj1-x102d.google.com with SMTP id pj3so10786827pjb.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YCem4BrJJv8uMiBliK+eUgJsgA757fo9l+siWv19bQ=;
        b=K5WRT8kvkrTRnxFXNxNWmZZe1eWQeiMi1qunE1LIKywvna8j3v5SzYl1jChj3QeZjI
         oNQVdHcccQpG2WuR1gzQg9kq/+0VuzgdVWD7JtRLTBXEFTOX1GEgMl7e5WBjD6OfQPdd
         71LTAu0tFhni4ZSn88ImId4fpVYObX1bY6JW37HXCp7hvg9l286KFURTu9ooi1NBKqLt
         u26MG8kM25n8svLfFhRQp8B3l5+xVXSXRfyHCQXaBio+kKCjC+Q8QLGXOyPk+PiaEIGE
         UxpBMq4IRtaJ3U/MEkWjmDf10E4N70sMBA71dAXlsLakRYCt8pcisJr17siP90QETbWq
         4NMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8YCem4BrJJv8uMiBliK+eUgJsgA757fo9l+siWv19bQ=;
        b=XGQ83wMPcUHXG2lS9YJXez+KQSkfdgaDKCoajOf2n4U8nRXsC8Op1Du7SUgj6dcftx
         3rteMrI47AflqH1ylgGRljn0Bk1QTYOvIAI5HuuXvoeT41VqUAZa1I80rMcfqvVgj8E5
         XjVj0K4ekMQv5C558aORl5MMOtORhnhAuUNhWixVv57suC6ic83QhJKAkIaXt81r8GAx
         ryQGRK5zDnw5AeWRM4n0rCC2oY+lLd/WVPaYMU3O36fh5Gtn4aSmGTgs28UpPYC6X4yo
         IMnA8id8vvbNeZDAPyUC3Lx6Pi8kkkWCHi7piDx/XMmioCpIL56nQLy89D9G0ndzdUVR
         ktwQ==
X-Gm-Message-State: AO0yUKXEEnScZ4x63rLZFOtWAQWcKtUDNaNMAwg59dHd37nEEjx6gwaP
	ZhAciU+pTfbRQdESp702ayswbQ==
X-Google-Smtp-Source: AK7set9FL/syEzV/2KBqufzNCOsrJUvHtlRk/LJL1zmvxtRWPEp1GVPCimz+TSI3kDQUud1c6m89VA==
X-Received: by 2002:a17:902:e74c:b0:199:2a36:6c3f with SMTP id p12-20020a170902e74c00b001992a366c3fmr27035701plf.6.1676264058174;
        Sun, 12 Feb 2023 20:54:18 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:17 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Deepak Gupta <debug@rivosinc.com>,
	linux-mm@kvack.org
Subject: [PATCH v1 RFC Zisslpcfi 11/20] mmu: maybe_mkwrite updated to manufacture shadow stack PTEs
Date: Sun, 12 Feb 2023 20:53:40 -0800
Message-Id: <20230213045351.3945824-12-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_045339_937650_542C83FF 
X-CRM114-Status: GOOD (  13.89  )
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

maybe_mkwrite creates PTEs with WRITE encodings for underlying arch if
VM_WRITE is turned on in vma->vm_flags. Shadow stack memory is a write-
able memory except it can only be written by certain specific
instructions. This patch allows maybe_mkwrite to create shadow stack PTEs
if vma is shadow stack VMA. Each arch can define which combination of VMA
flags means a shadow stack.

Additionally pte_mkshdwstk must be provided by arch specific PTE
construction headers to create shadow stack PTEs. (in arch specific
pgtable.h).

This patch provides dummy/stub pte_mkshdwstk if CONFIG_USER_SHADOW_STACK
is not selected.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h      | 23 +++++++++++++++++++++--
 include/linux/pgtable.h |  4 ++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 8f857163ac89..a7705bc49bfe 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1093,6 +1093,21 @@ static inline unsigned long thp_size(struct page *page)
 void free_compound_page(struct page *page);
 
 #ifdef CONFIG_MMU
+
+#ifdef CONFIG_USER_SHADOW_STACK
+bool arch_is_shadow_stack_vma(struct vm_area_struct *vma);
+#endif
+
+static inline bool
+is_shadow_stack_vma(struct vm_area_struct *vma)
+{
+#ifdef CONFIG_USER_SHADOW_STACK
+	return arch_is_shadow_stack_vma(vma);
+#else
+	return false;
+#endif
+}
+
 /*
  * Do pte_mkwrite, but only if the vma says VM_WRITE.  We do this when
  * servicing faults for write access.  In the normal case, do always want
@@ -1101,8 +1116,12 @@ void free_compound_page(struct page *page);
  */
 static inline pte_t maybe_mkwrite(pte_t pte, struct vm_area_struct *vma)
 {
-	if (likely(vma->vm_flags & VM_WRITE))
-		pte = pte_mkwrite(pte);
+	if (likely(vma->vm_flags & VM_WRITE)) {
+		if (unlikely(is_shadow_stack_vma(vma)))
+			pte = pte_mkshdwstk(pte);
+		else
+			pte = pte_mkwrite(pte);
+	}
 	return pte;
 }
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 1159b25b0542..94b157218c73 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1736,4 +1736,8 @@ pgprot_t vm_get_page_prot(unsigned long vm_flags)			\
 }									\
 EXPORT_SYMBOL(vm_get_page_prot);
 
+#ifndef CONFIG_USER_SHADOW_STACK
+#define pte_mkshdwstk(pte) pte
+#endif
+
 #endif /* _LINUX_PGTABLE_H */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
