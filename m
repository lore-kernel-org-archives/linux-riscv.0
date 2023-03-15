Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38657C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 03:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybJUNxOclYI2c/hfWbnbBDrzejziots18MMSD9c/+Y0=; b=AKAXX+maymG9RI
	uEjDTUxK4L3cGhoq3iZs6hYdYCQZIjfZBIYcLwUAUlyOx5+Cews/Jjvmqz9zu9uylXbOkyKmPVpVb
	/brmGc88QCT0Wet0vEGqTN40qR75N6tVv/CbBn4O6OQqbHqYZuEZjBx+tLJ4IjLOa2ViJXDy00IT6
	t32cv3ioZLO13S+05e7z3EX40EIfayRSpIR3K6gjpzzW64PZjBVfn1LGV7OTdLm55SCF1+8Q6xKUV
	+TMtOpI2N3HvPqT9vavsqn1SWHYv55arAWxc7TYTPC8VXWZUdRPHNvZL+Y8RGONmwrwP0gQXEfJtp
	yYxygTZuLmTfs07+sJ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcHSO-00C6nI-3A;
	Wed, 15 Mar 2023 03:05:40 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcHSE-00C6h6-1O
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 03:05:33 +0000
Received: by mail-pj1-x1030.google.com with SMTP id j13so1623447pjd.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 20:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678849527;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnoQUwQmFqPgSrJHWK8d2p9DXhKQ1/cuEoil7CNd3DE=;
        b=TBNUeSBfuBa3ST4mxm1DS4OFwR6VEct391KodjBQ5eDMwvy7IAnH77PwGo1apR6bPh
         K7nIjhi/uZYJG5kt+DE6phOd9LZqfl9BFT5eMievU9L2UTVHzq36Jl6MFMdA5ssdKwUN
         gDJDd53OvmzgZShoscboUxRy+5c9II5aP7YLMLZ2PLDTbZH0uvz7j7szJopkCepK9dLm
         cA4Pv0tR7bnX1Y0V928WrhCq3OiYKHIIoWOc6+RX1qFGNwbibAeVMdjD8hiDrKwkQ60x
         sSkJH1wnncA5VLaZOh78cNkPD05vCaLhXPKstDORhMzPYnnwWiQ2oq7R2RYY4UnVQdNk
         6WZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678849527;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnoQUwQmFqPgSrJHWK8d2p9DXhKQ1/cuEoil7CNd3DE=;
        b=UdAVBJfW6d7NUF9f4mPMEUobaY27h4PXA1UG+PHWXeqo5u7W0RW9iivRvtbMAucWTh
         aSsK7bdwtsisaSKoZ6yhTmwskXRmFYe+mu0NCm0CnuDn7eF5Cy+eWPMnqcIvkVL0djmE
         f2SE1Z/lOoGJTMM3L+vbP8scjv+KQdhaZ4ahPrW4MM1hNcJNaYmF/WW4p5l2vgNxLt16
         66ev8r0ITeVToxky46DJDqN6ZlFSJGol/1XstbII4ocfgZrJZtMzKtk1qO7Hw24ugwrk
         Ejw3OhNm3FHneSV6yVwGZCNo/sn/pYGokgSs7nVTeWrYxx9yV3rJR5pVm8tK8zJ7Spjt
         wAVA==
X-Gm-Message-State: AO0yUKXZt5smYp0SOo5Z0sU1URVXULKlSWDoRDf2T5wbzukNz2DaLaZ7
	juwrkQYSBC4t8QHaYEksCilIqw==
X-Google-Smtp-Source: AK7set9+C9cPA06JcNB4chJKZnGHWdotuV162jlrieE+Q24dYD3lVPW20yRGsbK4VhdL3hYON+iG1Q==
X-Received: by 2002:a05:6a21:338c:b0:d5:4dc:16ce with SMTP id yy12-20020a056a21338c00b000d504dc16cemr7106582pzb.4.1678849527626;
        Tue, 14 Mar 2023 20:05:27 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id z20-20020aa785d4000000b005e093020cabsm2305210pfn.45.2023.03.14.20.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 20:05:27 -0700 (PDT)
Subject: [PATCH v2 2/6] mm: Add a leading 0 to the VM_FAULT_* types
Date: Tue, 14 Mar 2023 20:03:55 -0700
Message-Id: <20230315030359.14162-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315030359.14162-1-palmer@rivosinc.com>
References: <20230315030359.14162-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: akpm@linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_200530_480609_C4C2FD2E 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

The next patch will add enough codes to need another character, this
adds the 0 to all the existing codes to keep alignment.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 include/linux/mm_types.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 0722859c3647..fd9b863869b4 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -941,20 +941,20 @@ typedef __bitwise unsigned int vm_fault_t;
  *
  */
 enum vm_fault_reason {
-	VM_FAULT_OOM            = (__force vm_fault_t)0x000001,
-	VM_FAULT_SIGBUS         = (__force vm_fault_t)0x000002,
-	VM_FAULT_MAJOR          = (__force vm_fault_t)0x000004,
-	VM_FAULT_HWPOISON       = (__force vm_fault_t)0x000010,
-	VM_FAULT_HWPOISON_LARGE = (__force vm_fault_t)0x000020,
-	VM_FAULT_SIGSEGV        = (__force vm_fault_t)0x000040,
-	VM_FAULT_NOPAGE         = (__force vm_fault_t)0x000100,
-	VM_FAULT_LOCKED         = (__force vm_fault_t)0x000200,
-	VM_FAULT_RETRY          = (__force vm_fault_t)0x000400,
-	VM_FAULT_FALLBACK       = (__force vm_fault_t)0x000800,
-	VM_FAULT_DONE_COW       = (__force vm_fault_t)0x001000,
-	VM_FAULT_NEEDDSYNC      = (__force vm_fault_t)0x002000,
-	VM_FAULT_COMPLETED      = (__force vm_fault_t)0x004000,
-	VM_FAULT_HINDEX_MASK    = (__force vm_fault_t)0x0f0000,
+	VM_FAULT_OOM            = (__force vm_fault_t)0x0000001,
+	VM_FAULT_SIGBUS         = (__force vm_fault_t)0x0000002,
+	VM_FAULT_MAJOR          = (__force vm_fault_t)0x0000004,
+	VM_FAULT_HWPOISON       = (__force vm_fault_t)0x0000010,
+	VM_FAULT_HWPOISON_LARGE = (__force vm_fault_t)0x0000020,
+	VM_FAULT_SIGSEGV        = (__force vm_fault_t)0x0000040,
+	VM_FAULT_NOPAGE         = (__force vm_fault_t)0x0000100,
+	VM_FAULT_LOCKED         = (__force vm_fault_t)0x0000200,
+	VM_FAULT_RETRY          = (__force vm_fault_t)0x0000400,
+	VM_FAULT_FALLBACK       = (__force vm_fault_t)0x0000800,
+	VM_FAULT_DONE_COW       = (__force vm_fault_t)0x0001000,
+	VM_FAULT_NEEDDSYNC      = (__force vm_fault_t)0x0002000,
+	VM_FAULT_COMPLETED      = (__force vm_fault_t)0x0004000,
+	VM_FAULT_HINDEX_MASK    = (__force vm_fault_t)0x00f0000,
 };
 
 /* Encode hstate index for a hwpoisoned large page */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
