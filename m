Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6998CC54E66
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 18:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OgteEdcum2owMgeTZ2ChFCcc0lXZ4KbOL78lGvVZ+Ag=; b=O2EdkRuKqa3Fim
	dKO1Ss/7teOivfdy2GrY+50LjTswZeMQUQSRSOaKGpq08RIplOlgq8+arIYBC91eB5kSlhFwqtfzA
	zNa1855T7iGRHWTJT2W8m/fMaD3n61okszCXrdJeUzyaU+dDrU4olBrlpJ5KRJMGYd2GZzV63dJ/3
	FXjtCm9ihJtmhghZltXgCnv/PaMUOE4BEvyeu+lqlHj5zWWdjqvMnC0dNXWRyY+mET/a/bj+OjDEz
	24xNoNcob2xhsYwBS90xwFBU2r5+pZ8yNLHhNyskN5mSLKj8bDOZHxH8MRiHbeSodTGJulSXWJN48
	eNYYvhoUnja3LH5q46Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkStl-0000000BBPt-15qg;
	Wed, 13 Mar 2024 18:00:17 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkSth-0000000BBNI-2wuQ
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 18:00:15 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1dd97fd66cdso812885ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2024 11:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710352812; x=1710957612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dZTXOjAeT6pfaV7onHDV2gE4nP+owJ8waS/mbAbqu5c=;
        b=FKU0pBuYWQ7EUK8/sqCuutHJXtFM01j+DsEyZHwj035gYb9USdG1DDWXr2g814b86E
         UNW+V4hrRJYIguIwuC57pE5ry2s3q/XmsOjIwZ4Wjlhf45xb9py7ofeQMzI216Ni384z
         PgF12L3EFvwOi+m9vDSjqEELAVzJWMPWyzU8Ia6T8PddJh6AVFicWnqc19kozVVof6s3
         sioLV+2zyBQcfD337AwPalbNsKPllPHmtW5Kbzj2811YMEqvWnNUOIurQH9Ayqiw6v7r
         pJ2SqPz4pqYvK9HmnWVFtmO6swScnZqysyY0BdiszR494mO4lhQFzZ+L7lq2dFttIBlr
         8J2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710352812; x=1710957612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZTXOjAeT6pfaV7onHDV2gE4nP+owJ8waS/mbAbqu5c=;
        b=aYPu0z6k7ro/z5lxUiX23wk6sN6yI1t4JL4yuuM+OR3784ikl3pnJKS/KK7YV6CEGl
         dz1WozlW2DgztrM9h86xZLrCbrPX065fN838EIP7P9A9ZOE2PRYNdsmbmah7R8L9qG+u
         /robf4bV+1uvYPsqnOdJbnWayuo4sD2An3kdGlz47JbAQD+q3vM70TkO3MP58kI1h3Ci
         SnsH/8Jw7nWu/fAK7scbNIlORTnBj2YR+D84LENvykk1S/mDsrM4fuz7r9IvwdmbObk1
         KsJHQfC5FD9ggw75F8Qe1YwU4ZxK4Y+BN/KJh80pe6PaIXbIKNfu6J9A7XUAegaZRaPO
         lYQw==
X-Forwarded-Encrypted: i=1; AJvYcCVRy0F8HvlgPKa5ioMWY4nbuJmUVNct4PtZh8J5MOZcXY61F5wB5gQ0ewxSLei4eo2ZF8TfW4rvC2KcljIbKD6ffQV+xNyq5U/RLnH4v3ZW
X-Gm-Message-State: AOJu0Yzu3AkaA9uO4150XQdLJboIOnpGd7Gpu4g/ftVW1EvfowoQyNAL
	bmm8ZXYH55j5YWp8OPqJLwKCEN9DgShHXBKJkiOwBA+2pKnLckB4NuTiSMNPoNQ=
X-Google-Smtp-Source: AGHT+IEprNdyiuonWqVfClrX/ImBIkqo5fEQz/6Uu30hIGFkzozJm4o58O8tbMTGqua91ovBM0emxA==
X-Received: by 2002:a17:902:ac86:b0:1dc:4bf6:7eb4 with SMTP id h6-20020a170902ac8600b001dc4bf67eb4mr13452784plr.31.1710352812163;
        Wed, 13 Mar 2024 11:00:12 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id jj14-20020a170903048e00b001dc30f13e6asm8912264plb.137.2024.03.13.11.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 11:00:11 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Yangyu Chen <cyy@cyyself.name>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Define TASK_SIZE_MAX for __access_ok()
Date: Wed, 13 Mar 2024 10:59:43 -0700
Message-ID: <20240313180010.295747-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_110013_872781_7CB38F0E 
X-CRM114-Status: UNSURE (   9.85  )
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

TASK_SIZE_MAX should be set to the largest userspace address under any
runtime configuration. This optimizes the check in __access_ok(), which
no longer needs to compute the current value of TASK_SIZE. It is still
safe because addresses between TASK_SIZE and TASK_SIZE_MAX are invalid
at the hardware level.

This removes about half of the references to pgtable_l[45]_enabled.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/pgtable-64.h | 1 +
 arch/riscv/include/asm/pgtable.h    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index b99bd66107a6..a677ef3c0fe2 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -17,6 +17,7 @@ extern bool pgtable_l5_enabled;
 #define PGDIR_SHIFT_L4  39
 #define PGDIR_SHIFT_L5  48
 #define PGDIR_SIZE_L3   (_AC(1, UL) << PGDIR_SHIFT_L3)
+#define PGDIR_SIZE_L5   (_AC(1, UL) << PGDIR_SHIFT_L5)
 
 #define PGDIR_SHIFT     (pgtable_l5_enabled ? PGDIR_SHIFT_L5 : \
 		(pgtable_l4_enabled ? PGDIR_SHIFT_L4 : PGDIR_SHIFT_L3))
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 6066822e7396..2032f8ac5fc5 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -867,6 +867,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 #ifdef CONFIG_64BIT
 #define TASK_SIZE_64	(PGDIR_SIZE * PTRS_PER_PGD / 2)
 #define TASK_SIZE_MIN	(PGDIR_SIZE_L3 * PTRS_PER_PGD / 2)
+#define TASK_SIZE_MAX	(PGDIR_SIZE_L5 * PTRS_PER_PGD / 2)
 
 #ifdef CONFIG_COMPAT
 #define TASK_SIZE_32	(_AC(0x80000000, UL))
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
