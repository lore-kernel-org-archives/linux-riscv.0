Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DA2C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 18:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8bpZq63tMrumLgHseBXL/OYozAHbPW0c7OjE25ardJk=; b=4T46ScciCqs0MU
	SC2wQRJavz37Ldklc3Si2paZy7OW+Y7FBYWDU1ivWf6IUke6HXJQMEU2xVQ4a7Lc0SD6baM8ZNHWR
	qhWFLvm5HHFcLOBtRcpiUR/zIOWTvK0kSJCD+c8c1mEXU/3LsjyBGz27hmQdkHY3QUkwl+jLi8PC1
	tb36iIX2wv13JjDXuQXFeTcUu8amedxR6elhgGI5aLr9uiPAstbjCQc6h12ZHX+FFuVaPOOe1oNIt
	pdAVVxk9xfnqSTR8g3FJ1JY35xphEBkof/zCrCBoqMB8GY8PIFg6xqjvqcs9CFMbakUEebnWaYZQH
	H4N66pFzI0hqvTLbsmIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWMbS-006xiR-Ir; Thu, 08 Sep 2022 18:50:18 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWMbO-006xed-BB
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 18:50:16 +0000
Received: by mail-qt1-x832.google.com with SMTP id h22so13634233qtu.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 11:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=uAG7ulv3u8Y25koSZZsiniMQVBTMhkhOscGn2ifRLkY=;
        b=8WoRFZkMD3Ij/8DnQt4Z7AsLmwPoBQy64SVQIrUpqVI+xI5Dl5BiIL0Bi3/ZrqQlxe
         Ka+9wW8bkGx0BRbTK1551bdLodCTt4Uh6JykjgnuQrr7WA1JSXjuMtGZOo4rMWPXncTH
         mmin5qOTQVgJI77mZUg8qPQsbiyT6JNe5yicOqFc2ffckMiNVfozy1CSZNV9+VueuFjE
         YoqgkapQAWXqTkIIJ+e4c609h52nE4RPgrYdzdndBlDp7rJPheFY9VO/z04NnuBaV69S
         Id0p0PT7FfU9P2kq6uuv2zWGoO/dJ0g0pSOsKXgd/00n/OsyRU79xqiAIy9VUtRbk1GD
         s90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=uAG7ulv3u8Y25koSZZsiniMQVBTMhkhOscGn2ifRLkY=;
        b=LdHcgnVerpDxnfziTw6LN51ZRSI74eIk3JBtje0vcJ8gIA0pHcL5ScBXX088i8ovH9
         Okn8VOu+r76eIfxzqvbhP+PcuUNF23fafgEtWUChhX+Bg6YvwAgrZ6KzhNz3Q3boMhcG
         ytal+EzkYa0b0qRCGRVjtBscfAVUP6UmAx2ZlQ82H55VINFWbPaQHvXoKSddVTftG/6G
         I4rrFMfIuPPqevq1EM2vRJD/acI/HfseEQnLHfzwqbQW25q5bgB4kKCyyrMz5iUVCaNA
         H0ocOv3/ebMyBAeGuIgdSLCWo/Yta0/no52PLKtnH0d/PL456GWz5JWphBoKCYdWDV39
         7B8g==
X-Gm-Message-State: ACgBeo107kiVcQwPODOC0GKV1cNKudGl9CPLzIzRFbdgOJj2qC5oYXJ6
	FaGxRkLv8Qv941MIegXyPaIpiV4QJ1J+rBNA
X-Google-Smtp-Source: AA6agR46EWg/wwqjKx2a7Lq2jf5/fruCQbQ+V5iY3CMI11uCyd0j42+GeFE9aSfjGyYeUih5L+r/Zw==
X-Received: by 2002:a05:622a:11c6:b0:344:54b8:6382 with SMTP id n6-20020a05622a11c600b0034454b86382mr8762938qtk.571.1662663011004;
        Thu, 08 Sep 2022 11:50:11 -0700 (PDT)
Received: from abrestic-xps.ba.rivosinc.com (pool-71-105-112-35.nycmny.fios.verizon.net. [71.105.112.35])
        by smtp.gmail.com with ESMTPSA id z4-20020ac84544000000b00343057845f7sm14304453qtn.20.2022.09.08.11.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 11:50:10 -0700 (PDT)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Celeste Liu <coelacanthus@outlook.com>,
	dram <dramforever@live.com>,
	Ruizhe Pan <c141028@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH v2] riscv: Make mmap() with PROT_WRITE imply PROT_READ
Date: Thu,  8 Sep 2022 14:50:06 -0400
Message-Id: <20220908185006.1212126-1-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908170133.1159747-1-abrestic@rivosinc.com>
References: <20220908170133.1159747-1-abrestic@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_115014_422558_11717C6F 
X-CRM114-Status: GOOD (  12.93  )
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

Commit 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is
invalid") made mmap() return EINVAL if PROT_WRITE was set wihtout
PROT_READ with the justification that a write-only PTE is considered a
reserved PTE permission bit pattern in the privileged spec. This check
is unnecessary since RISC-V defines its protection_map such that PROT_WRITE
maps to the same PTE permissions as PROT_WRITE|PROT_READ, and it is
inconsistent with other architectures that don't support write-only PTEs,
creating a potential software portability issue. Just remove the check
altogether and let PROT_WRITE imply PROT_READ as is the case on other
architectures.

Note that this also allows PROT_WRITE|PROT_EXEC mappings which were
disallowed prior to the aforementioned commit; PROT_READ is implied in
such mappings as well.

Fixes: 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is invalid")
Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
---
v1 -> v2: Update access_error() to account for write-implies-read
---
 arch/riscv/kernel/sys_riscv.c | 3 ---
 arch/riscv/mm/fault.c         | 3 ++-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 571556bb9261..5d3f2fbeb33c 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -18,9 +18,6 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
 		return -EINVAL;
 
-	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
-		return -EINVAL;
-
 	return ksys_mmap_pgoff(addr, len, prot, flags, fd,
 			       offset >> (PAGE_SHIFT - page_shift_offset));
 }
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index f2fbd1400b7c..d86f7cebd4a7 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -184,7 +184,8 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
 		}
 		break;
 	case EXC_LOAD_PAGE_FAULT:
-		if (!(vma->vm_flags & VM_READ)) {
+		/* Write implies read */
+		if (!(vma->vm_flags & (VM_READ | VM_WRITE))) {
 			return true;
 		}
 		break;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
