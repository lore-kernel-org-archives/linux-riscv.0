Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E262BC433E1
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 05:34:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE9872068F
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 05:34:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j763xHaA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evNZ8y0A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE9872068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t19UJwztq/eS+mxOcnb1Ete5asXJaFlu5ENZbltO+Aw=; b=j763xHaAOleBPlqKJo46JWoA5h
	4ay93WlO7G6PjUWPHfLI7LJeXDHWk+jZWyBwgW9jGG2K0BAo4orVPKPJe2YJV9ENDIvanShoWQRIK
	1/ItqLHM+gaV/6wEJgbQzDRwrFiizY1aeveYrhB/Jnv45uS5zTkjoaR7oCP23weBU5yMrRFIZDPhC
	Nr5lY5vm54o2wu6OQnmGpADptplNfEfc/jAJtxI4/KRfRtDK+dEOW2f3/bWVT1sFOZJtY3Q5pw+EX
	lubCtRbpiS7iF3zY0sqXa7uSPjOvfmBxQNTy+/MjRWLzC17comGo+czxNTHRSxEQzR9G/Al0t3nIe
	IAV32zwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jva3G-0005MF-Ub; Wed, 15 Jul 2020 05:33:54 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jva3E-0005Lo-EX
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 05:33:53 +0000
Received: by mail-lj1-x244.google.com with SMTP id b25so1148827ljp.6
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 22:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sAvmQZqWID7UVdhehRS2dX6KN23mXR/R3FvuzsykU1c=;
 b=evNZ8y0AD6ZnSFXihIqOJmoKao2t12ADCFj9fiWCMvBzpJ/V9QJOYzt4yRN9uJF4Uc
 UtNCYqIGMxqzMT6GPG5RHUhdpOh9uxj5kIcwpcOWfrGE7fLq2irACW1Z9q0gjMIP+gDA
 HNTvLI2aEcdM2veYQFjCyQXZ8+icYbdKrab2WFQ07W6nOTXah8oJQbEBwpQ7tr9QSYse
 qroZBJS6LOStfRrT+wg8VGZxsLFq/f29KrDmhNLJGasjS7Md1xAupyqFgdVxPTiuBddo
 NQRaC4dCvQeFRy+qhOy+WYG1ReYcdcCPkgaTWw8caNUERFL82Yo7ydeLjtIJuul/7O/B
 kUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sAvmQZqWID7UVdhehRS2dX6KN23mXR/R3FvuzsykU1c=;
 b=cEHbaOw5pD3xhagPxIllt8jWVquIU2Yh8r6UsWyyYs2OypPLNk62JXiyGMjiddLwZB
 qxz/r+gPEb8kKStfTVhvBHuPyaV8uDy4iVZ1FdFoJwsONX4+F5QqbUjIZF/aIy9XC4RA
 We1hkwSW4toTlTHbVmBebbsquCivxo/rAaKlY1EpSmkZjtgdroUzuP/4uLB2+jj0zM00
 ZN90uz1kczpokKsnry5T8e7RIlAnF50BZWxO3l3ZW6W0u58t32aa/85TXKgrZo2iZy+r
 yvWL0QFrZAgkXDbh2d+vEkqIgcv1Iko4jDAvnDGeAOBadjCILFf4ikZCC7R2BQUF4bfR
 FezA==
X-Gm-Message-State: AOAM530cTTO0qwMYv5WqMaypM8ma56Z2NUi8dOp6g2D47Z7oe5gTeyMu
 SxiZlJxSQp20mfkDf6d5TDDAO2rfRRc=
X-Google-Smtp-Source: ABdhPJzdV9s5/3zfxjQZJb9nSURTEpoixudxUzM4aWQJxU50kgnQTY9vKfs1It6Ve59W+JZV3UKFzQ==
X-Received: by 2002:a2e:b5c8:: with SMTP id g8mr3765583ljn.38.1594791230225;
 Tue, 14 Jul 2020 22:33:50 -0700 (PDT)
Received: from nero.bb.dnainternet.fi
 (dyn9cmyyyyyyyyyyyyyft-3.rev.dnainternet.fi. [2001:14ba:2fa:2500::9])
 by smtp.gmail.com with ESMTPSA id h14sm233916ljb.53.2020.07.14.22.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 22:33:49 -0700 (PDT)
From: Pekka Enberg <penberg@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Subject: [PATCH v2 1/2] mm: pgtable: Make generic pgprot_* macros available
 for no-MMU
Date: Wed, 15 Jul 2020 08:33:39 +0300
Message-Id: <20200715053340.576300-1-penberg@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_013352_556817_5BD3C669 
X-CRM114-Status: GOOD (  13.68  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Pekka Enberg <penberg@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Mike Rapoport <rppt@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Pekka Enberg <penberg@kernel.org>

The <linux/pgtable.h> header defines some generic pgprot_*
implementations, but they are only available when CONFIG_MMU is enabled.
The RISC-V architecture, for example, therefore defines some of these
pgprot_* macros for !NOMMU.

Let's make the pgprot_* generic available even for !NOMMU so we can
remove the RISC-V specific definitions.

Compile-tested with x86 defconfig, and riscv defconfig and !MMU defconfig.

Suggested-by: Palmer Dabbelt <palmerdabbelt@google.com>
Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Pekka Enberg <penberg@kernel.org>
---
v1 -> v2: Wrap pgprot_modify() -- which is specific to mmap -- with
	  CONFIG_MMU to fix a build issue on ARM reported by kernel test
          robot <lkp@intel.com>.

 include/linux/pgtable.h | 71 +++++++++++++++++++++--------------------
 1 file changed, 37 insertions(+), 34 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 56c1e8eb7bb0..53e97da1e8e2 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -647,40 +647,6 @@ static inline int arch_unmap_one(struct mm_struct *mm,
 #define flush_tlb_fix_spurious_fault(vma, address) flush_tlb_page(vma, address)
 #endif
 
-#ifndef pgprot_nx
-#define pgprot_nx(prot)	(prot)
-#endif
-
-#ifndef pgprot_noncached
-#define pgprot_noncached(prot)	(prot)
-#endif
-
-#ifndef pgprot_writecombine
-#define pgprot_writecombine pgprot_noncached
-#endif
-
-#ifndef pgprot_writethrough
-#define pgprot_writethrough pgprot_noncached
-#endif
-
-#ifndef pgprot_device
-#define pgprot_device pgprot_noncached
-#endif
-
-#ifndef pgprot_modify
-#define pgprot_modify pgprot_modify
-static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
-{
-	if (pgprot_val(oldprot) == pgprot_val(pgprot_noncached(oldprot)))
-		newprot = pgprot_noncached(newprot);
-	if (pgprot_val(oldprot) == pgprot_val(pgprot_writecombine(oldprot)))
-		newprot = pgprot_writecombine(newprot);
-	if (pgprot_val(oldprot) == pgprot_val(pgprot_device(oldprot)))
-		newprot = pgprot_device(newprot);
-	return newprot;
-}
-#endif
-
 /*
  * When walking page tables, get the address of the next boundary,
  * or the end address of the range if that comes earlier.  Although no
@@ -840,6 +806,43 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
  * No-op macros that just return the current protection value. Defined here
  * because these macros can be used used even if CONFIG_MMU is not defined.
  */
+
+#ifndef pgprot_nx
+#define pgprot_nx(prot)	(prot)
+#endif
+
+#ifndef pgprot_noncached
+#define pgprot_noncached(prot)	(prot)
+#endif
+
+#ifndef pgprot_writecombine
+#define pgprot_writecombine pgprot_noncached
+#endif
+
+#ifndef pgprot_writethrough
+#define pgprot_writethrough pgprot_noncached
+#endif
+
+#ifndef pgprot_device
+#define pgprot_device pgprot_noncached
+#endif
+
+#ifdef CONFIG_MMU
+#ifndef pgprot_modify
+#define pgprot_modify pgprot_modify
+static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
+{
+	if (pgprot_val(oldprot) == pgprot_val(pgprot_noncached(oldprot)))
+		newprot = pgprot_noncached(newprot);
+	if (pgprot_val(oldprot) == pgprot_val(pgprot_writecombine(oldprot)))
+		newprot = pgprot_writecombine(newprot);
+	if (pgprot_val(oldprot) == pgprot_val(pgprot_device(oldprot)))
+		newprot = pgprot_device(newprot);
+	return newprot;
+}
+#endif
+#endif /* CONFIG_MMU */
+
 #ifndef pgprot_encrypted
 #define pgprot_encrypted(prot)	(prot)
 #endif
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
