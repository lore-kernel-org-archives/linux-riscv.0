Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBD8C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 03:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMTltDKh9Chty8ewnxFLa2G9JzNipkcyHDbHCbyjCk4=; b=cUqhTZgv1qr7dp
	gltuYm6K2hG6n9+teIo2oDLpmSRIIzt2W/+peMtfie692RqhN11BbP/ArSCTl/9ILiB9qJQSuB2ja
	p4LwDQjrKyrRl20khuG+Bq5zTProYSDGmZqXSSww36RKvS6KuFdBek8hdKhw7AxViyZUBugr3ohPv
	9HMd59vUl8Kw+GDxNpLGMcUM6WehMqvS1fBiJVQQ20Z/fkBjjabrQQZpG/QPlmIB1xzqfqqkmbBsp
	MczAI+IlW39UFv/cswDIm2qtdG3iMJEs+F9MkailE18VI0P9Kb9L8lxg/8ntdy/wrIY0HZCOLZboP
	bbbIOzOjktUFfFHmtrCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcHSP-00C6nO-22;
	Wed, 15 Mar 2023 03:05:41 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcHSD-00C6hA-0t
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 03:05:33 +0000
Received: by mail-pj1-x102d.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so458971pjt.5
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 20:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678849529;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjXs6Q9el+E3DjFj75yzzOPO7Ucq3PFGsjms6Llyx9A=;
        b=mRz3PKHV4IBxR+2dOFKG5hwZul2ABonaRfC7Ehdx0OfdaJc8X1QKmjbUc3A/sMtQmb
         gbdDUmN6C0xqiSSvVk7V6RYl7rj70SnASOVED2xToUNivvfAXHpYOvdfNg9PNLDBWyDp
         IncEoQPsAhVH27iWxXjZiY9+MPHJp6iXyumIDVQgIFvnpqQ2awg+ak4Y4xvxSFjC0zod
         3dJQKPZ3iUEBFf1zv/1bEdn3ErqHsi/M0WCTCcYx6qxBUNzn+biRBb8C3pLH8Kmj08p4
         BzamwZHJuVc6k1iXhWSR7eCcnQcS6MM7x9tkiaPkVq0c4rPipsvwrOOR87W+SmOuO7ef
         mW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678849529;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjXs6Q9el+E3DjFj75yzzOPO7Ucq3PFGsjms6Llyx9A=;
        b=KTcHXra1FiJ3UAbV+z9jQ9AT+SQdfAkikjvuX8t8HBspU0gd/1LZ30d/E2ENpcKA3e
         Dkd1JA9dQiUmXU1DpU62EDzArdktntbiykZVurJe0wgOoCYqJFme3A1Rerfmf0lz8Sb2
         2Ncd9kXh0IKR/TcohdqI0Y/bLElrZSDNKOnBdJDezSfBbZA8c45/td2JWzsrTQfWwHhT
         3SrAGlPp7M0zIk3u8ikzA6hpVx8tQze+qzxzrU/ER8ngRuHcGM16JKaA9bac7y4PdCTC
         wNeUi+8n5WhaYuI4Db8yVMguz+vJcjkhdgRzfl5uOadvBWXJyIRfXkr7OB4tpyf74UdA
         k8LQ==
X-Gm-Message-State: AO0yUKUGMev3AXB2YMwAPFJ6UVTXrkATV35+LZuU5zT5KBby23E3rVHc
	nnPVmITF3O9Tv1Cv2eId6WhH8Q==
X-Google-Smtp-Source: AK7set8aNlVZNOCixnv/wCzZZa//jnHG6FrTV/mi2NGNpxsUbRVCAmKzBlXv1PxwH+TLgm6P1rGJNQ==
X-Received: by 2002:a17:903:48d:b0:19e:e39b:6d98 with SMTP id jj13-20020a170903048d00b0019ee39b6d98mr981507plb.35.1678849528720;
        Tue, 14 Mar 2023 20:05:28 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jz12-20020a170903430c00b0019f2cee9221sm2447268plb.95.2023.03.14.20.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 20:05:28 -0700 (PDT)
Subject: [PATCH v2 3/6] mm: Add VM_FAULT_ARCH_* codes
Date: Tue, 14 Mar 2023 20:03:56 -0700
Message-Id: <20230315030359.14162-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315030359.14162-1-palmer@rivosinc.com>
References: <20230315030359.14162-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: akpm@linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_200529_565383_2D74F5B3 
X-CRM114-Status: GOOD (  11.00  )
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

A handful of architectures (arm, s390, and soon RISC-V) define their
own internal fault codes, so instead dedicate a few standard codes as
being architecture-specific to avoid conflicts.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 include/linux/mm_types.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index fd9b863869b4..47f36a2fdaac 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -938,6 +938,7 @@ typedef __bitwise unsigned int vm_fault_t;
  *				in DAX)
  * @VM_FAULT_COMPLETED:		->fault completed, meanwhile mmap lock released
  * @VM_FAULT_HINDEX_MASK:	mask HINDEX value
+ * @VM_FAULT_ARCH_*		Architecture-specific VM fault codes.
  *
  */
 enum vm_fault_reason {
@@ -955,6 +956,11 @@ enum vm_fault_reason {
 	VM_FAULT_NEEDDSYNC      = (__force vm_fault_t)0x0002000,
 	VM_FAULT_COMPLETED      = (__force vm_fault_t)0x0004000,
 	VM_FAULT_HINDEX_MASK    = (__force vm_fault_t)0x00f0000,
+	VM_FAULT_ARCH_0         = (__force vm_fault_t)0x0100000,
+	VM_FAULT_ARCH_1         = (__force vm_fault_t)0x0200000,
+	VM_FAULT_ARCH_2         = (__force vm_fault_t)0x0400000,
+	VM_FAULT_ARCH_3         = (__force vm_fault_t)0x0800000,
+	VM_FAULT_ARCH_4         = (__force vm_fault_t)0x1000000,
 };
 
 /* Encode hstate index for a hwpoisoned large page */
@@ -977,7 +983,12 @@ enum vm_fault_reason {
 	{ VM_FAULT_RETRY,               "RETRY" },	\
 	{ VM_FAULT_FALLBACK,            "FALLBACK" },	\
 	{ VM_FAULT_DONE_COW,            "DONE_COW" },	\
-	{ VM_FAULT_NEEDDSYNC,           "NEEDDSYNC" }
+	{ VM_FAULT_NEEDDSYNC,           "NEEDDSYNC" },  \
+	{ VM_FAULT_ARCH_0,              "ARCH_0" },     \
+	{ VM_FAULT_ARCH_1,              "ARCH_1" },     \
+	{ VM_FAULT_ARCH_2,              "ARCH_2" },     \
+	{ VM_FAULT_ARCH_3,              "ARCH_3" },     \
+	{ VM_FAULT_ARCH_4,              "ARCH_4" },     \
 
 struct vm_special_mapping {
 	const char *name;	/* The name, e.g. "[vdso]". */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
