Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCBFE6F099
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 00:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9tNl0pR1MUTPqXdlMyzzww2d+pNnpHc4qSsXH8ACp4k=; b=vapixWwlXiX+ph
	bXgMihtQ1sQtE0J4ZcTHPfXEq8PrdB3UKaEHDvDsAoEN2RptUoEiXzTlyOKUD+pyPpL+iJF7sNCH2
	uKr3wL7niH36NJRmvWlR8WMJazfdd0I+Hd2+j3z+J8E1+MntMUVPCvQRtNYqf3zkNOn3nGRAUGbFG
	rKZsQdiq7KGk+95AlRwcHAOUF++L+2lmTqEYBfy8EhsTCPFHYwl1t6i4Bp3OtT5XoVhUglIkWenHm
	+8vMOAUuC1b3aI9GHfBOE2r2VN6JZFbV66smiG32glI4LAndEx97xmJk6FvueOqdFhXcwzqg4GMSd
	6sCefghnx5skwNPlXmYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t71hI-00000008a1q-3haP;
	Sat, 02 Nov 2024 00:08:56 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t71hE-00000008Zyf-28cz
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 00:08:53 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2e30db524c2so1932728a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Nov 2024 17:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730506131; x=1731110931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGKCUDOPoqSxjqjZbl0XFkIURJ67OmxtD1LdZJwnrMc=;
        b=BB2I+veFyQIsX96rlorI5iXVdm9HDNf+qUxnbT85WbDrOGKOOsR8+n7gJkc3xiOQe8
         jExl5AJoqCL+lF3KIKICIjg9XMrL5jtgFQaaE234l98UE/XAj3LHlFxYIQB0sAqC9u32
         hrw8FRjwsw9nX42cPwGiBEXLeOonPMkCO19fSmWsqw9PN4f4f01zuUR67jDPRPizS/vR
         Fif1dBnmNNvYvO3BFVQ8L5LzxGRNz+EF2hkTAWAvTEWX4QbjIlqEVx8Ff/j6crSK492L
         y4enYeb3cv/HFgslosqSGXyRU9idWQwSqW2g1jwjv9CLiCY4PdzXBWRF8oj9GZnlxnR6
         9PMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730506131; x=1731110931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGKCUDOPoqSxjqjZbl0XFkIURJ67OmxtD1LdZJwnrMc=;
        b=SEU1/Tr41T4alQMjUIHEGp4LWVzcSTR5K7Yfgl9fPdOMo56zpEXacfejiO1JcXPEjg
         5jk7LsJQsbuMbadfXzgG58IiHFmfeIlP22ZOZkfAz008AF6TMuQQqIiCh8IzAZxw273A
         91FeVL5FEN2x+UvNJQw832q1l4I/KtHlGvB3Pm6896XizDM8U2P9RtbRtBTyQE9Uno/o
         +PdA8S5XkI1gmrLzGFz8O2UyJiRPAPecVN9hjrDsdANeYT7VvO841/7MwwpVEmnl/PK0
         znRLJ4ApIyCjPOQA5fg4pacg83mGGMDvlprtanxEqR3MnWE5JoOfeCxLYdZ6HI5fURMu
         yXaw==
X-Forwarded-Encrypted: i=1; AJvYcCX2vuEoLsWPOdDrobeOirp6jeDu0vgXwYM8260fhkUbyV4jOgxifIJE9YzBcCu8leiidmM20wU+Q0Ic+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwE3OtuIpCzgKxvjDWRBlZV0bOmpHpUbp+w/xS0sGowjsThOvDt
	xOpGEkjfvnxSKZE0c1OzOoabLd7fpHFtQwPbaGg4UUQS9AKBzbpxYmTMOJsyTN8=
X-Google-Smtp-Source: AGHT+IGCxiVZb4g11Y9M7gntQVTVm+MFF1ZkzqRsWftmVRLra8MKii1/bFnU2KEsW1jE0QSKLkS3ow==
X-Received: by 2002:a17:90b:3c49:b0:2d8:8430:8a91 with SMTP id 98e67ed59e1d1-2e94c2b3825mr8142120a91.10.1730506131400;
        Fri, 01 Nov 2024 17:08:51 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fc00856sm5505749a91.54.2024.11.01.17.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 17:08:51 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 04/11] riscv: mm: Deduplicate _PAGE_CHG_MASK definition
Date: Fri,  1 Nov 2024 17:07:58 -0700
Message-ID: <20241102000843.1301099-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241102000843.1301099-1-samuel.holland@sifive.com>
References: <20241102000843.1301099-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_170852_571794_94D4BD34 
X-CRM114-Status: GOOD (  10.21  )
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

The two existing definitions are equivalent because _PAGE_MTMASK is
defined as 0 on riscv32.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/pgtable-32.h | 5 -----
 arch/riscv/include/asm/pgtable-64.h | 7 -------
 arch/riscv/include/asm/pgtable.h    | 6 ++++++
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
index 23137347dc15..7dc0751d67dc 100644
--- a/arch/riscv/include/asm/pgtable-32.h
+++ b/arch/riscv/include/asm/pgtable-32.h
@@ -28,11 +28,6 @@
 #define _PAGE_IO		0
 #define _PAGE_MTMASK		0
 
-/* Set of bits to preserve across pte_modify() */
-#define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |	\
-					  _PAGE_WRITE | _PAGE_EXEC |	\
-					  _PAGE_USER | _PAGE_GLOBAL))
-
 #define pud_pfn(pud)				(pmd_pfn((pmd_t){ pud }))
 #define p4d_pfn(p4d)				(pud_pfn((pud_t){ p4d }))
 #define pgd_pfn(pgd)				(p4d_pfn((p4d_t){ pgd }))
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 33e7ff049c4a..4ba88592b8d1 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -66,7 +66,6 @@ typedef struct {
 
 #define pmd_val(x)      ((x).pmd)
 #define __pmd(x)        ((pmd_t) { (x) })
-
 #define PTRS_PER_PMD    (PAGE_SIZE / sizeof(pmd_t))
 
 /*
@@ -166,12 +165,6 @@ static inline u64 riscv_page_io(void)
 #define _PAGE_IO		riscv_page_io()
 #define _PAGE_MTMASK		riscv_page_mtmask()
 
-/* Set of bits to preserve across pte_modify() */
-#define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |	\
-					  _PAGE_WRITE | _PAGE_EXEC |	\
-					  _PAGE_USER | _PAGE_GLOBAL |	\
-					  _PAGE_MTMASK))
-
 static inline int pud_present(pud_t pud)
 {
 	return (pud_val(pud) & _PAGE_PRESENT);
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 3e0e1177107d..afa0b455eaa4 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -201,6 +201,12 @@ extern struct pt_alloc_ops pt_ops __meminitdata;
 #define _PAGE_IOREMAP	((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_IO)
 #define PAGE_KERNEL_IO		__pgprot(_PAGE_IOREMAP)
 
+/* Set of bits to preserve across pte_modify() */
+#define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |	\
+					  _PAGE_WRITE | _PAGE_EXEC |	\
+					  _PAGE_USER | _PAGE_GLOBAL |	\
+					  _PAGE_MTMASK))
+
 extern pgd_t swapper_pg_dir[];
 extern pgd_t trampoline_pg_dir[];
 extern pgd_t early_pg_dir[];
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
