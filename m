Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919DBC636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 06:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nyMCBPQJV3/2PiyLajvPDVpUN7uCrkIe4mH5N9EPoaQ=; b=RIMyWuwmgEITi0
	Rdsa//uGei/CumNLKKY17BH+p2RqRqPEV8PxR+geEDlzNknXC6a4kcJd4UMS7wb7SMD8ePcfqxNVm
	uGJ36jY5RoydnD9J7j7keJIgxHwmkDYL43g0cgZz3/AfAHc0iNLhI+Rl0j0dOVsODj0vxfpXoQQSg
	u0saTQc81hfslkoZoce+OBVuMsV0b5oERGnrnCSZjN9jRbYF+o5IxC53QJRAMK1Rns8+nykCwYB+N
	KyShmCx8kosNe2unvJ6ctHUrzn2P0O+deZdsvaytu/ex2Hvv7fj1JaV/VCSK/LG2/PoDjA3T5tknU
	RmAeHrWFdh0O/0di/lUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRRsu-00DHZv-Tt; Mon, 13 Feb 2023 06:00:17 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQr3-00D9HC-48
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 04:54:19 +0000
Received: by mail-pl1-x633.google.com with SMTP id o8so9930095pls.11
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JFNUn7jw7XrbPRCSrUHiiAgppCfO2t4yElt5XDL04Q=;
        b=MAtbG5JUipDDMVBI03UWeY8vjoTpzFDhlMkb2IIUtB84hOxlG1WyPFh7MJnCD5jfl2
         zjmODVBzL2cx3l1Qs7L7jfh8m/gnDVQInUF+dA+7OKyMVa5Haw7ygFvOQ8YMb5gB2b1K
         UlKt6Pk9ptqgZjApSwCfRHwT68TIIrfBzX5Jl6JawGXdE/pmQdzIpKLWutJX9BdixuK3
         dEg5UDIWG8GC41lON9Ist+iD/fEydT5SZ0c9JGyjv3ArzJbqW9GX9L4shJ7ODsyF8FR3
         RJbtROJ3z2YLeDw7UoqghirtDnhWaLX120PYm1FT5abaJBxaZZknC9F4Um67Xjgs0Ewy
         Rc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JFNUn7jw7XrbPRCSrUHiiAgppCfO2t4yElt5XDL04Q=;
        b=0gQwfCp1or8foG/rEaabjFl78TzHK+pLdSFheQaHdLGKNlmpfJtqKJLAqqHfEw+ECp
         YOlInC0ReTODRbwoh22VkGphnHKdc4TcnClIjHlGzbIfOzUGoS+G4yXqCEBSN7/ZOiB3
         arjRK/VIxTMtJKTkmXU++OpuyXazWL/vqxYrIhs6MMe8dhuLWanaJ+ashUcug5naH2XY
         9Mv7yVbpE8S+KnrtmndP6tkNSeT0/Q2iJBa/GukHxMtwyVqTQGN+z0FgMJXffJXv2ZE7
         MkXEPdmfomvKCNdXuMIrgFeGzwM6m61RgJX2HG909qhtRLrl28clWg4Yd8PnZn5hPsfG
         dU7A==
X-Gm-Message-State: AO0yUKUXT8sh7zkf6kLWHKuZdqYZNbxZ+L0CTEN2cUnKfHCd4WMm9C3O
	1SEcmfbSQ0bZzzHqGBFsktYOXw==
X-Google-Smtp-Source: AK7set/xGSag1fLoOp9DRLhykiGJTXM3xHC8HavU0BgIlPvd0BoyqCw5ivDdONyysoMRNXPdY5/4ZA==
X-Received: by 2002:a17:902:d0d1:b0:19a:7548:da30 with SMTP id n17-20020a170902d0d100b0019a7548da30mr8231577pln.3.1676264056763;
        Sun, 12 Feb 2023 20:54:16 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:16 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v1 RFC Zisslpcfi 10/20] riscv mmu: write protect and shadow stack
Date: Sun, 12 Feb 2023 20:53:39 -0800
Message-Id: <20230213045351.3945824-11-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_205417_247822_42D86D2F 
X-CRM114-Status: GOOD (  13.34  )
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

`fork` implements copy on write (COW) by making pages readonly in child
and parent both.

ptep_set_wrprotect and pte_wrprotect clears _PAGE_WRITE in PTE.
Assumption is that page is readable and on fault copy on write happens.

To implement COW on such pages, clearing up W bit makes them XWR = 000.
This will result in wrong PTE setting which says no perms but V=1 and PFN
field pointing to final page. Instead desired behavior is to turn it into
a readable page, take an access (load/store) fault on sspush/sspop
(shadow stack) and then perform COW on such pages. This way regular reads
would still be allowed and not lead to COW maintaining current behavior
of COW on non-shadow stack but writeable memory.

On the other hand it doesn't interfere with existing COW for read-write
memory. Assumption is always that _PAGE_READ must have been set and thus
setting _PAGE_READ is harmless.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 74dbe122f2fa..13b325253c99 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -334,7 +334,7 @@ static inline int pte_special(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -509,7 +509,15 @@ static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
 {
-	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
+	volatile pte_t read_pte = *ptep;
+	/*
+	 * ptep_set_wrprotect can be called for shadow stack ranges too.
+	 * shadow stack memory is XWR = 010 and thus clearing _PAGE_WRITE will lead to
+	 * encoding 000b which is wrong encoding with V = 1. This should lead to page fault
+	 * but we dont want this wrong configuration to be set in page tables.
+	 */
+	atomic_long_set((atomic_long_t *)ptep,
+			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
