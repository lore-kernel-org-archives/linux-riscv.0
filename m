Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0C9C54798
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 23:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLB3xJwyDt+V4H9HcdYD7X17kR2W/K5QMJXAG7DV0No=; b=w+wBgY+oz2D+sZ
	wjdY4ID0mjYhLtzxubLq6ZDCZTncT27HY4e57Jf0Yx9snPBw2h7JtvoKT37BfgmKmYL2DBmMj/eCd
	2RFkg3vS1cxtdcTF0ihbcteiRvbDnHU158fmibpHTp/hZ1PJ3OKkIINi1gxP34pDi0KNTU6O4FP2Y
	A9ZBkVizwV75TvQOfFCZCzNtrvl4Bxvt9t5lsSDatq+NeluM2egZgqYhQmF/Dm/Hg88nA5wOGz+Yf
	NN0/ykR4ZBRyGiLDCnX9nDrTr7JajdlJiaWYEyHdkLFOCoEI09ZdDNYme+k2MjPkfTopI1+Vx/2XD
	3wTJIxbzBJswLyfgBeEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpkQ-0000000Falf-0ta1;
	Thu, 29 Feb 2024 23:23:30 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjQ-0000000FZzr-10zG
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 23:22:30 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3c19e18470aso851590b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 15:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709248946; x=1709853746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwpkv2OuO7YHUplKH98oFVfOa+CFbclxXNu0ysmduyU=;
        b=PfNG9M6gWuR1ksO6LejCbQDRd+YX7gPt+DlcfQ2QoyB2D7dHSi0HytU3855fw7Sx6F
         Rj60ZxXhCE/3vJ17vDkVy0HuIOUSvnfbd+A6F1YnuLJFjsAYUUM0pRyuO6jEO5Wfe9gJ
         pqkMoJQPudeXK0kcT29E1z9N7Gw26ek+i4j3AhvgKeNNYzDS8RgtJuVVn0/Z9tPJ5cZ0
         +NXQxDop4KxuQUy0dn+BSmtzlorarKpuc+3BGh5d6+anQy7yoMoLtBilMrBWVIdzVyx4
         pt5rXRYIvH6++Nn+Et3+zneN0yT8gxeXOH+tAy8LntwNj4rTiaflZ80yS9Rc1sIfGfGP
         x7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709248946; x=1709853746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwpkv2OuO7YHUplKH98oFVfOa+CFbclxXNu0ysmduyU=;
        b=qbH1sxmvs0ZzdHz5CYbuvnvJ2Owk7W6i7nqKw3zH2uKB5jghCq0y/IODpyk/kHIiIT
         sK77qEoTqbzNvV1kQqtpBWGQZLPn5UW91CvJ79FS3MygkubFqNiRgSCPkeNNr8FC2kkr
         PYKn87Hw8HsEtu+2aSJsRyd0rbFqq1TLG7r9xpBUnKYy4GxQy91Agb2SjYVAXcSrtwHo
         gFNhaTwc4lrIqqC+QZpempoNsAquIDKc88fbZYtokml9WdbrDHishIgI4YkYL1qXBhHR
         7AWI8fiET8Ekp/P2vUCuddfIfXDDY5wk/NUJT/cQDI+yIE00+J8vUKKYpWe7hhzSo/jb
         3mHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3eU1BPASINsv1M8sCX5e5Z+lMwz/OVN9M6LKVN5sW/nZPvBRBRlg043l7K1afhgAnXz9DAmpEkpjrwVDmTcG1MJZlBz2zm+kT/Fbr45z1
X-Gm-Message-State: AOJu0YwNZNXTU7liJGaqe3ak681MyQD1Xbm8WgnT3hWpldBc5l3r8ELv
	guhSTJjMy88mFsYYVqkEWrZ5qnKxBxh0dwupnULdfpJ7eXmXMiS0r8atueu+ak8=
X-Google-Smtp-Source: AGHT+IHmmt9lzZLUCIFAbm5GqyPJaePE9QFXJ4x/3NAo+fPZmowQvwtei5P759brqGkqtPXCOnb8SQ==
X-Received: by 2002:a05:6808:17a7:b0:3c1:af49:222b with SMTP id bg39-20020a05680817a700b003c1af49222bmr47209oib.37.1709248945851;
        Thu, 29 Feb 2024 15:22:25 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id c6-20020aa78806000000b006e55aa75d6csm1779719pfo.122.2024.02.29.15.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:22:25 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 12/13] riscv: mm: Preserve global TLB entries when switching contexts
Date: Thu, 29 Feb 2024 15:21:53 -0800
Message-ID: <20240229232211.161961-13-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240229232211.161961-1-samuel.holland@sifive.com>
References: <20240229232211.161961-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_152228_390840_FCC86B34 
X-CRM114-Status: GOOD (  14.18  )
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

If the CPU does not support multiple ASIDs, all MM contexts use ASID 0.
In this case, it is still beneficial to flush the TLB by ASID, as the
single-ASID variant of the sfence.vma instruction preserves TLB entries
for global (kernel) pages.

This optimization is recommended by the RISC-V privileged specification:

  If the implementation does not provide ASIDs, or software chooses
  to always use ASID 0, then after every satp write, software should
  execute SFENCE.VMA with rs1=x0. In the common case that no global
  translations have been modified, rs2 should be set to a register
  other than x0 but which contains the value zero, so that global
  translations are not flushed.

It is not possible to apply this optimization when using the ASID
allocator, because that code must flush the TLB for all ASIDs at once
when incrementing the version number.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/mm/context.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 0bf6d0070a14..60cb0b82240e 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -200,7 +200,7 @@ static void set_mm_noasid(struct mm_struct *mm)
 {
 	/* Switch the page table and blindly nuke entire local TLB */
 	csr_write(CSR_SATP, virt_to_pfn(mm->pgd) | satp_mode);
-	local_flush_tlb_all();
+	local_flush_tlb_all_asid(0);
 }
 
 static inline void set_mm(struct mm_struct *prev,
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
