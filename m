Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05CCC77B7C
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 22:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aZg8/ylwruQULQqe0yauLuE9D2A22q6y9tPhgytoMbk=; b=c83SVG8KxSSuyy
	pJYyhxqV7NnzAMTTfs/C5Kx3bN6+9BGbXtpFVCd+DwOXvqPChlmKo8ybodV03WeblH9EbcG2LieVG
	+Qo7Ess4SI5S/ZeoEopCSAP0dzpitPAn/EpQbwbUBcG4gDMCdn3d+LTND2esKkKuJdbXBtRNS7olJ
	i/ZeRQJEaSaufhGZ611OAw5Ma0XK4qhJes3EMxuoo/tK/rsEdgLzuRf9S5hkxkLw54FehQOF6VFjk
	zehIXzqkVLTR9GIUQ4lLfUWVbx/Wc0ya7bpSZCRLiU0RyB3Mb0TGUj3wxFlLvgZbe0uKzSpx3YC3B
	qMFGmwfO2DA3dEo8iQng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pstKG-00DHdn-1J;
	Sat, 29 Apr 2023 22:45:56 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pstKD-00DHco-01
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 22:45:55 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-517c840f181so577802a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 29 Apr 2023 15:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682808350; x=1685400350;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=eGCdcEw4y5HNnkhElsF0KTMoRMbJurRvg+ykIaF0fnM=;
        b=z5L4bEHAGNgH118ITQtSKmlKGvPaxpoArwxZzsTi+6vozFKhBltOSkrtKNavulM3s4
         FFwp7u/TiLcPp+8NPx1JKuey3EeNh2sB8iRu973EDEirpGzTWoF7eotxboovKQ2IuPhh
         26/s4mmZX6xCahlQ/9oJbD9apM5Tq2foOw1MWkWeqtPoY9yZexXpQgJ3YlXL9pJXrAWp
         ZeVJUuMI+ArGIVLT1Y8E68UEqX5Dz3WyUkW+HqMCleHqwwnKx6fpP1FMybGiDeTmebk3
         qhmOGfg7KsROEThc/axQT+67ZrULBVTtLVvvep8LBNlzHBwcW4hPl0YS1S7W2Q97skB3
         FgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682808350; x=1685400350;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGCdcEw4y5HNnkhElsF0KTMoRMbJurRvg+ykIaF0fnM=;
        b=dPaCcljQ+K8dItSD3fm7pIY4Idb1w19YJYmhfbaV82HuG1Ybj0SL25/zwzuDmzESVQ
         QE21llWGV9Yn7VeZsSaf+IHac1MVs7aAULZEVi15PfnDDEXm1PSRk13c0QXaejzEEy6g
         0Aad55wbpwrEX+5A2s8Y2X7a3Q4p1NIrVNsBYgx1mUqjf2F5HxI+JEl+irE+SvA0Ho9o
         YqhnQ99YfiD3QxTQaNqPK4NJjdKY952fYP/93JzwTOwRExWCdcwRhK7BuGhMOF4L4MWd
         r6RjSVLNJwCzcv2y3t+XV6ytnV6X569r66q/7Qh6XcGFwnayVFqxSvMPDzG6fesnr5TT
         IAUw==
X-Gm-Message-State: AC+VfDwj174wFgZVPn/5FsuBe3sRgLueUA++GA3tW01dUTYDaSZoiYi1
	/tTBsAYU+KeMeoybtxIohNcDUw==
X-Google-Smtp-Source: ACHHUZ60tTYPb8KYCToDDbrlNHJSlUBu3Y7sAxneHBQsOxvIRhiOi13UkEb+U0wzsaE9np4L9rZPcQ==
X-Received: by 2002:a17:902:f649:b0:1a6:67e1:4d2c with SMTP id m9-20020a170902f64900b001a667e14d2cmr9185757plg.6.1682808350025;
        Sat, 29 Apr 2023 15:45:50 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q11-20020a170902788b00b001a943c41c37sm13899975pll.7.2023.04.29.15.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 15:45:49 -0700 (PDT)
Subject: [PATCH linux-5.15.y] RISC-V: Fix up a cherry-pick warning in setup_vm_final()
Date: Sat, 29 Apr 2023 15:43:31 -0700
Message-Id: <20230429224330.18699-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Cc: stable@vger.kernel.org,         linux-riscv@lists.infradead.org,
  Palmer Dabbelt <palmer@rivosinc.com>, kernel test robot <lkp@intel.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_154553_267995_717ADE73 
X-CRM114-Status: GOOD (  14.86  )
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

This triggers a -Wdeclaration-after-statement as the code has changed a
bit since upstream.  It might be better to hoist the whole block up, but
this is a smaller change so I went with it.

arch/riscv/mm/init.c:755:16: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
            unsigned long idx = pgd_index(__fix_to_virt(FIX_FDT));
                          ^
    1 warning generated.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202304300429.SXZOA5up-lkp@intel.com/
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I haven't even build tested this one, but it looks simple enough that I figured
I'd just send it.  Be warned, though: I broke glibc and missed a merged
conflict yesterday...
---
 arch/riscv/mm/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index e800d7981e99..8d67f43f1865 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -717,6 +717,7 @@ static void __init setup_vm_final(void)
 	uintptr_t va, map_size;
 	phys_addr_t pa, start, end;
 	u64 i;
+	unsigned long idx;
 
 	/**
 	 * MMU is enabled at this point. But page table setup is not complete yet.
@@ -735,7 +736,7 @@ static void __init setup_vm_final(void)
 	 * directly in swapper_pg_dir in addition to the pgd entry that points
 	 * to fixmap_pte.
 	 */
-	unsigned long idx = pgd_index(__fix_to_virt(FIX_FDT));
+	idx = pgd_index(__fix_to_virt(FIX_FDT));
 
 	set_pgd(&swapper_pg_dir[idx], early_pg_dir[idx]);
 #endif
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
