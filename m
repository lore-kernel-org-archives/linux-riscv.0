Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C977C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 20:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SOPg/QK07rUFc7JO1J+cMx5EVKUo5Qo2+ieZ3sGo/HA=; b=1QFovWfj/sMo8S
	oGr4XQkGHDT0sx0blZ7/EISu++n3y1bEBYpZGghIXOD44Bi9FUqE3AuJh2xjgTKijSa9Q1yJfFluV
	9cHzECDzbkUEa8dfkI5KlfPnjI+v4Pr9tAAwim11qT6pPLtDrnyrAfa+2hdm1df016TQV3Q6TV2rx
	/EqTncqwTRdJUK01SN+KETxfBC2DBxMzfmFXBuKcI/mMi2l3l8PkAakqfk+CgzbF2PgP2ZTFQrxrI
	dQ7Yo26i7C0CKRXT4N2pdhj5sR3FQlf79ZT2c6oHZMnoagvJ2YTcgOeppBUVSEqYqLMs8eqHPt7Xv
	U/GOTlIfSG+7fJaCSACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVu5-00FywU-1c;
	Wed, 13 Dec 2023 20:32:25 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVu1-00Fyuo-2q
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 20:32:23 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-334af3b3ddfso6614668f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 12:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702499540; x=1703104340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUqvcHnbHjun3bdBJPfvf0B8JWy5i7uak5v/0Wh9cSk=;
        b=gKRfjofhePxG0HxLbp/2Ae/yjSnM9h2Mq9KFY/CUJgz4ZuDb9xpRfD+4VzfTV4jVfH
         zB7ew5R6KKfGfc875G/sl5XcDRk3o0R+Th9e9itbMFcvqo07HVJALZbeah5PG1exM7TY
         TQW09SdK6H6t33QW/D3VX+/Zz0hzSsbMk8o9yn1iVuT4OaeYi22pQRmc01lkcuSlgKiC
         m2ZMBDbE6Rwz8PlbXLZgP5/y4wgO8YRLBW5IvQE+lM1rD9/QOEhZOqgGUJXET9toSYwi
         Witq74tlKsxn2zA9eOEjIDDUyThd8T3wqfbIhiDeh7wMz1IjHphCmhLrUHoxpV9qHCN4
         Bvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702499540; x=1703104340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUqvcHnbHjun3bdBJPfvf0B8JWy5i7uak5v/0Wh9cSk=;
        b=iUl6L/WaoQK4yqpMJAoSGs4f1kGmvV6QZKfKeJqcB0hHJQplH7Q3x9iZ/d7Q2UeCeX
         NxAL8Fb/fZQLkgDj2EuzHqjP1yItwRUlE/7g7sC/w38ajC76mHlKE2PesAgW98kU3tAe
         +NE9kOH5Q8gVeZmM5caIT+FDIwomLnO7UJ5nE2NMQoy+fDZRCh9q1l6hG7+YOhDL925w
         QZyMPWnSPCIDnzZHDRLuWkg7MQWNfMCKzS+QqUm3Rs7wgPokIHGgS0BrTRjzRay59AhW
         MRiCxImM2zmtuqXhOwHsuNk8GhfM5E7OBFNSVSQVAB+GzNPK1RvY2cQU4IWR7n26Xseq
         xUcg==
X-Gm-Message-State: AOJu0YxKZlcIcPAAovcyxXWJsm9HY2EiAKJ/DuAXwFTqypf74Wkxq+f0
	PcajM7b2GbjI5jIdLo12l3oGVwlyD0yQNKvVgwM=
X-Google-Smtp-Source: AGHT+IGeWwb4mZTjVlnfL3Tc7x0njpKhguH1T5u5o7xiWbZOuJ+qDIheC5NMdpL6eYcBnXpv6MaCcA==
X-Received: by 2002:a5d:51cc:0:b0:336:353b:2193 with SMTP id n12-20020a5d51cc000000b00336353b2193mr1550679wrv.61.1702499540379;
        Wed, 13 Dec 2023 12:32:20 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d4c4a000000b003333abf3edfsm14139649wrt.47.2023.12.13.12.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:32:20 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Russell King <linux@armlinux.org.uk>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 2/4] mm: Introduce pudp/p4dp/pgdp_get() functions
Date: Wed, 13 Dec 2023 21:29:59 +0100
Message-Id: <20231213203001.179237-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231213203001.179237-1-alexghiti@rivosinc.com>
References: <20231213203001.179237-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_123221_918155_2F5D7581 
X-CRM114-Status: UNSURE (   8.98  )
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

Instead of directly dereferencing page tables entries, which can cause
issues (see commit 20a004e7b017 ("arm64: mm: Use READ_ONCE/WRITE_ONCE when
accessing page tables"), let's introduce new functions to get the
pud/p4d/pgd entries (the pte and pmd versions already exist).

Note that arm pgd_t is actually an array so pgdp_get() is defined as a
macro to avoid a build error.

Those new functions will be used in subsequent commits by the riscv
architecture.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm/include/asm/pgtable.h |  2 ++
 include/linux/pgtable.h        | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index 16b02f44c7d3..d657b84b6bf7 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -151,6 +151,8 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 
 extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 
+#define pgdp_get(pgpd)		READ_ONCE(*pgdp)
+
 #define pud_page(pud)		pmd_page(__pmd(pud_val(pud)))
 #define pud_write(pud)		pmd_write(__pmd(pud_val(pud)))
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index af7639c3b0a3..8b7daccd11be 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -292,6 +292,27 @@ static inline pmd_t pmdp_get(pmd_t *pmdp)
 }
 #endif
 
+#ifndef pudp_get
+static inline pud_t pudp_get(pud_t *pudp)
+{
+	return READ_ONCE(*pudp);
+}
+#endif
+
+#ifndef p4dp_get
+static inline p4d_t p4dp_get(p4d_t *p4dp)
+{
+	return READ_ONCE(*p4dp);
+}
+#endif
+
+#ifndef pgdp_get
+static inline pgd_t pgdp_get(pgd_t *pgdp)
+{
+	return READ_ONCE(*pgdp);
+}
+#endif
+
 #ifndef __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
 					    unsigned long address,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
