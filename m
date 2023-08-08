Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BF7C001B0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 13:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0w2Jb170xRBOuQHC0O/5hnyEJ6N2jEDXJMot4aueqaI=; b=fu2305ia0H32MI
	QUA25zhg7ZBWOa/nrHUZNPSjh/PjrK/YvPUFH8PHrC5KtK1ATscw1zOYzI5cFfqYZWkmZcepotBdg
	gfqQPDHXQZQO3mAFatd5uE+hv0YqzDO9xJmtffrGzbpRYboXSox455yXDaCeiFFWMqIoFZ32Igi80
	URZlmzxi0TT5zqgwTekRs1V7lqFCOB+d3MNiQNjSLT1Xb4qGd82f3JUXEO5OGgc3YhB21GKteZ/9q
	vPGKPw9fhA9NBl8LHzmet81xvfRaX6MfiFipg1zGg55j7aAYYU+v9ap125Sq1AueZ6bFeqTMQqB1W
	1HSjsRDebiuNYLeGZhrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTMQg-002bpV-2Y;
	Tue, 08 Aug 2023 13:07:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTMQd-002box-1i
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 13:07:17 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fe501e0b4cso24055755e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 06:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691500031; x=1692104831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ir2LJjZwabuF9C6QsJfPbcf5sMfeQJgiQaLcKB1+XvI=;
        b=sXPTcO2u3U8HlpIaLVqqOxcuDkUcVhNmeec3zZNiDtVdmUQJOnLbV4N0EpBL2wWLln
         6bHMRYCCQUnBkRVB20s1fKH+5qbIvtci71tN79NbR+oqqrkCq+T29eR6G8YghwJP/vqR
         ydJNyovH+uE3kQMX3Rd+I2ehIkBsVGdlYyc1IR/GOm+v8KHPOsvkgo4y7YVIXFvsBp4O
         9bGBpd7wDicLqsG2FeQr1Qz2LG8cxPbzww3qr1m6UIbk/twHqQ7xXbkK5prnix5MLBbo
         YD/ym1YDhWFe/x7NXyAkGFx3r88UpeKQmML7LJ2c6L+10FfPeM5oy1q8v65JHanvV6dY
         6B1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691500031; x=1692104831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ir2LJjZwabuF9C6QsJfPbcf5sMfeQJgiQaLcKB1+XvI=;
        b=kLr+Ikq0nV5YX6+cSXoO2ZnhR0aGtjQIG29t3yE0l44hdQf4DYAXdk2h2uwuQCsm5c
         TBaQJCoLbS0hMTcFrTY0bIuzgGjncVZ0M6XqgtfUPmDx9SgCagYQwpUgEe2z1rPqeYBh
         aqLF4dIS63B8FFwZC2e1yJKdaeZijzAhX31gGhRnR1nD8qU1aTAzZ23cQHG89rZQVu6O
         HeSKv7Qwy7zwhWCY3dyffH2LkfQOWqFp1oW15Qw/CPtp61TBdfBJjirY1CkclUH3PRxj
         GaIuNEJSMy4N6rpHA14kytJuDuwm0Y6abORjEum2qWdVX072FjefdoNcoAbtLEHtGv1O
         6Lrg==
X-Gm-Message-State: AOJu0YwC6gccLpbgvO+0fCNE1rOqOGgOudHHaoCiSuvcUgotp/7c7ns6
	gcXNuy/8oPbHe1Ri04aavunq8Q==
X-Google-Smtp-Source: AGHT+IHNPbQ5CqkafPiCZwOmZc651VJ17pY+C/qulLlrMSB5Qb3JQwe7oMYPbndENgFd6K1WsXwgFQ==
X-Received: by 2002:a7b:c3d2:0:b0:3fe:6640:f536 with SMTP id t18-20020a7bc3d2000000b003fe6640f536mr898522wmj.40.1691500031334;
        Tue, 08 Aug 2023 06:07:11 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id u3-20020adfed43000000b0031759e6b43fsm13703777wro.39.2023.08.08.06.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:07:10 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH -fixes] riscv: Do not allow vmap pud mappings for 3-level page table
Date: Tue,  8 Aug 2023 15:07:09 +0200
Message-Id: <20230808130709.1502614-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_060715_759758_1B461E68 
X-CRM114-Status: GOOD (  10.68  )
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

The vmalloc_fault() path was removed and to avoid syncing the vmalloc PGD
mappings, they are now preallocated. But if the kernel can use a PUD
mapping (which in sv39 is actually a PGD mapping) for large vmalloc
allocation, it will free the current unused preallocated PGD mapping and
install a new leaf one. Since there is no sync anymore, some page tables
lack this new mapping and that triggers a panic.

So only allow PUD mappings for sv48 and sv57.

Fixes: 7d3332be011e ("riscv: mm: Pre-allocate PGD entries for vmalloc/modules area")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/vmalloc.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vmalloc.h
index 58d3e447f191..924d01b56c9a 100644
--- a/arch/riscv/include/asm/vmalloc.h
+++ b/arch/riscv/include/asm/vmalloc.h
@@ -3,12 +3,14 @@
 
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
 
+extern bool pgtable_l4_enabled, pgtable_l5_enabled;
+
 #define IOREMAP_MAX_ORDER (PUD_SHIFT)
 
 #define arch_vmap_pud_supported arch_vmap_pud_supported
 static inline bool arch_vmap_pud_supported(pgprot_t prot)
 {
-	return true;
+	return pgtable_l4_enabled || pgtable_l5_enabled;
 }
 
 #define arch_vmap_pmd_supported arch_vmap_pmd_supported
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
