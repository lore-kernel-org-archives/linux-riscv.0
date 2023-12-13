Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D958C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 20:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WUPP8ocN4Pjjnf19faTfU4fb9FX59BdFGSfeAhx2b4I=; b=y3vlz0voJAeKGT
	SawfwAr9Bp34jo6RF9gesiXIBX1ZdCNETmERpd32t/HDjcsOIkY2t2aofrJC6Yeiq1SG7DuFsA/xs
	qo8THvj6OgX8igJ3PR6HNldqXkEJpZMbt3pf9iu3cNbzpYn3Ka7Vofx0bKzJNmfLbsur87FJn/ZXZ
	TjqlSWLIZ7vWKvIkhJ7btjzYVBFrI1klH5r4IhNNwQgDR9h2sTYzshBcwlHZzSJNK3wns+bxCi4KL
	atheLQsPN0Rg4uYz76zFlaRyRANuTB9AALzbLuSau3W8BHrXDdaGk4YhwAZwG6jQFhimoFgtpHcsO
	NSdLr/8IE8QN9zDF7Jbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVt4-00Fyim-3D;
	Wed, 13 Dec 2023 20:31:23 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVt1-00FygY-2g
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 20:31:22 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3333b46f26aso6625374f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 12:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702499478; x=1703104278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E15RwjGwh0jg6//BOgBWUm8VeEPhhxkhRr12JTaACPU=;
        b=RIW6po9QNb4LQAeu2XBVqPPNX1Iygmx61ikPN0vXDBOSe4ROJ8Y4/p5SyHzCsGJ4JG
         dcxvi1humlSiV/p+9DNs2pHEinNzb5gbi+s3EiMVNc4de2V183Vyr1eWZDCI96CAtHVS
         LmAaKRXnZ2rENVnNV7ikWu7ImWSBPMRVdady7+ZcInx2dC04FSTLh5Ia6uw1KMmiYvfg
         ALe4eFm9S4wgmf1N40VG7KAEpjmm7XuzJ0sxXfykrf/DRUU5IjbTA+fUMXUUOdUkLQRV
         XCEv5TbbLvkl8i0CaEEKziDHJq39z4JXJEjJTEBACQGsT+axgTZtJuojtP1tXoKXzOxH
         +iCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702499478; x=1703104278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E15RwjGwh0jg6//BOgBWUm8VeEPhhxkhRr12JTaACPU=;
        b=sT9kgXNb1St28Vg6PPyPKmkHvjpbiIM+hW94QLoW6OFTuMtlJOpCUjIeCbPKODOAa8
         seIDihyXruNcbG10imwW+iMAXKo6T3SpQDRKJWp9tfU4CzboZSRg/uA+LyR6SCKK3Mec
         O5bH1m+lLkhw3eMzbuefdsXpgNCtUEJynV9kbI4socxA2Hxb/YJSui26OtboBFMvZVVS
         47tYcQK8k9UAawF0bd+PpXs/CBaIdVEQjEg1R7lqN1lCBRTQhMN1vUwhxRKbnihVRp4D
         unym7uIzFgbyDJOlzt+gG9p7ITu2DNnCH3JppakC6O4ZyCUSD/OcRl75e5cqIWNR/xQb
         8ZMQ==
X-Gm-Message-State: AOJu0YwpmF97L6CAtCr7/ARz2HZ1wo/MqAOoIYkX1Ysjegs8dBVAgUXa
	fL26+IHt9RpEWSPa/AlMEiFGew==
X-Google-Smtp-Source: AGHT+IHJ9RU792w4DCZZx9hZPdAspSn4SI/uXWC5g1BlHgB2r11Rp2Nl7fP233w9pzamiUzq2saHcQ==
X-Received: by 2002:a5d:5742:0:b0:336:370d:4c4f with SMTP id q2-20020a5d5742000000b00336370d4c4fmr973590wrw.60.1702499478475;
        Wed, 13 Dec 2023 12:31:18 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id h3-20020a5d4303000000b0033629538fa2sm5560888wrq.18.2023.12.13.12.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:31:18 -0800 (PST)
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
Subject: [PATCH v2 1/4] riscv: Use WRITE_ONCE() when setting page table entries
Date: Wed, 13 Dec 2023 21:29:58 +0100
Message-Id: <20231213203001.179237-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231213203001.179237-1-alexghiti@rivosinc.com>
References: <20231213203001.179237-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_123119_874137_E4D86258 
X-CRM114-Status: GOOD (  10.00  )
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

To avoid any compiler "weirdness" when accessing page table entries which
are concurrently modified by the HW, let's use WRITE_ONCE() macro
(commit 20a004e7b017 ("arm64: mm: Use READ_ONCE/WRITE_ONCE when accessing
page tables") gives a great explanation with more details).

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable-64.h | 6 +++---
 arch/riscv/include/asm/pgtable.h    | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 9a2c780a11e9..5d8431a390dd 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -202,7 +202,7 @@ static inline int pud_user(pud_t pud)
 
 static inline void set_pud(pud_t *pudp, pud_t pud)
 {
-	*pudp = pud;
+	WRITE_ONCE(*pudp, pud);
 }
 
 static inline void pud_clear(pud_t *pudp)
@@ -278,7 +278,7 @@ static inline unsigned long _pmd_pfn(pmd_t pmd)
 static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 {
 	if (pgtable_l4_enabled)
-		*p4dp = p4d;
+		WRITE_ONCE(*p4dp, p4d);
 	else
 		set_pud((pud_t *)p4dp, (pud_t){ p4d_val(p4d) });
 }
@@ -351,7 +351,7 @@ static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
 static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 {
 	if (pgtable_l5_enabled)
-		*pgdp = pgd;
+		WRITE_ONCE(*pgdp, pgd);
 	else
 		set_p4d((p4d_t *)pgdp, (p4d_t){ pgd_val(pgd) });
 }
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 294044429e8e..c9f4b250b4ee 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -248,7 +248,7 @@ static inline int pmd_leaf(pmd_t pmd)
 
 static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 {
-	*pmdp = pmd;
+	WRITE_ONCE(*pmdp, pmd);
 }
 
 static inline void pmd_clear(pmd_t *pmdp)
@@ -510,7 +510,7 @@ static inline int pte_same(pte_t pte_a, pte_t pte_b)
  */
 static inline void set_pte(pte_t *ptep, pte_t pteval)
 {
-	*ptep = pteval;
+	WRITE_ONCE(*ptep, pteval);
 }
 
 void flush_icache_pte(pte_t pte);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
