Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4707BC433E6
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 10:01:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F8B721D7A
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 10:01:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aJFznHu8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZl4Dt4L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F8B721D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lWxuc98kcfgBnxxtojf7UXLjsqezEnSpbeGFctCh3Fo=; b=aJFznHu8hG7oRP8o7SSEr77yPJ
	AwOTKkU3Rx9cdKqiV+QF5kqXPw6HFDwn9r2plPxTobCRKQ81pAcfjxVtThOG1hLvcMjq0Sp1Ev7Z/
	0qIPAJTVwhVzHD9MQ+8onIBkXgxAMm1s2RtTINcVQzC6POo//5V+eKg/i/AxWDDF2eiLRP92TyjLc
	2ldyPHFrKD1a5rRau1dScoBY1c2BRtLsqpqNNkIzfbkSu/jMcc5bJ9dFzYVQnbx9+xR0+LSSO2bAp
	viKBmrrVxSg2UozjU09g+97Eg5lC6UKPO/ZfE23KoWzUuoDo3sMlhX8JbXwsAyFISI3Cdyf/hpcJE
	BILFVcCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvHkC-0002MV-RR; Tue, 14 Jul 2020 10:01:00 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvHkA-0002LT-A5
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 10:00:59 +0000
Received: by mail-lf1-x144.google.com with SMTP id o4so10998141lfi.7
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9hegCtgYYonDTxzG2P7M3NgTaesYZp6ZeRypjC7FVkc=;
 b=YZl4Dt4LbuOWK4kupIrnK8GgFFPA/fKYMQGbAMbl3uRcN4Aiwvdf69mwWowgDFzHfo
 8MJOr5LlMd1miUn+6bIOEaPwsXNZHVGPe8ezYZVRKR7bEGRcy4b+l4VGaYWEBjW0Vzat
 xMklvoavVYl21c0XURmftIPI5DvTqjVaTTPT4OEIFtZ0HjhMmJU2SJJuyYhQfNSJZuJQ
 huscOIYyukq6anKXEsO2GTn2G9/PNNmn3QHRxbQ+BR7HRjjuw2/APu0D1qad5YTeS1Ft
 cFtPA/qezDnynGh6DSBmrGpw2NkIAQp+s2xaJwNcBlPwvDrl317iW7xAvb0gjGwq+Dli
 9GFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9hegCtgYYonDTxzG2P7M3NgTaesYZp6ZeRypjC7FVkc=;
 b=TW93At7dReCEyHIP+pvnGXDdrKa2Z4MJadBZzaX5RGsy2cb0JsITaQVzQ5+IYdrlzC
 BRSD57xU7W7bFB7/sZO7b7NdnfG8OezSqtyW/FEd715uumgROTPgZS8enuz6P4OM8jeG
 av2BIaQ5nkDfNrDkphnj5IKthRbrNUpUa7AaIQ/fcmqAcOTxhLArkQg8aUlsVrVWHbuv
 X11Qzkq7A/NdovdOkKrBXU6GVW4UggB6bG9DPVEAgO/9TNho07IJUC2QOIsBf/kU7D0F
 +U32WaqLrZwhhKiEItrH6jtxGRhDy5m+xqkweoT85MpVLQjSgQWSX7uLuQrsNCvenrvE
 t/Zg==
X-Gm-Message-State: AOAM533iuEJPs7j9BaONX/O5k8HRseiqGZqqwGAy6uzVXVptDGXyvC/m
 cVT4DMOrpTUszVNxf6RCtxS3Kwkvbb8=
X-Google-Smtp-Source: ABdhPJyLCcHVa1MAXGziSZoP1Bpw2XghpI0TwlWE5Hvjgr4PMH4MfVP4HC8mw5tWu8896icrBPdXNQ==
X-Received: by 2002:ac2:52ac:: with SMTP id r12mr1808859lfm.175.1594720856307; 
 Tue, 14 Jul 2020 03:00:56 -0700 (PDT)
Received: from nero.bb.dnainternet.fi
 (dyn9cmyyyyyyyyyyyyyft-3.rev.dnainternet.fi. [2001:14ba:2fa:2500::9])
 by smtp.gmail.com with ESMTPSA id y22sm4560279ljn.2.2020.07.14.03.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 03:00:55 -0700 (PDT)
From: Pekka Enberg <penberg@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Subject: [PATCH 1/2] mm: pgtable: Make generic pgprot_* macros available for
 no-MMU
Date: Tue, 14 Jul 2020 13:00:50 +0300
Message-Id: <20200714100051.345018-1-penberg@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_060058_385224_35F01DE8 
X-CRM114-Status: GOOD (  11.83  )
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
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Pekka Enberg <penberg@kernel.org>
---
 include/linux/pgtable.h | 69 +++++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 34 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 56c1e8eb7bb0..ed9026ad7c31 100644
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
@@ -840,6 +806,41 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
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
