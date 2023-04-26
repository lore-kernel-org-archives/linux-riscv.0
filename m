Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058FCC7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 09:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pe4fRpNpHtctIMppEuaCC/Ly6wZVzfnnfFj02cjKVRE=; b=TmA0WeyUg4sZvk
	nhA7cfoFJPW+z4W0h8Of7aU4LBrPmFwBEJBUsqoEBZCs+sjdvCv76G/qE6gLDJiIuD8rqP6tiEDqh
	drYDEv42CMgAH7rFsdSXxJYXCfm9JzR6QUNied8+Nxi6530HXjog2/SUEHgYjTk4AxjfJoa+XXKUY
	aiwTtfFur+RczEM1QOWu6+d4PTFB7zV47kctiriQV+ldMvCj0bZztkh0ob9QUHRegqHapG98vHzJ0
	Jow/rDVB6jlzRMpc0QKEqbwzNi2DLdhaCNdDy2dQkr+ppjbwGHNRBOl8gDDUevBvb1wRZQltGzcAt
	WuRp6QBXvWLxrxV2+EsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prbFC-003GR7-2B;
	Wed, 26 Apr 2023 09:15:22 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prbF9-003GPZ-2B
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 09:15:20 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-63b73203e0aso41591422b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 02:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682500518; x=1685092518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1nNIQi3pWLHzY3mOaTfbR0SSgvzLFHi14IClojKi4Y=;
        b=baXS/3xEL/zgxbl/pFfiKiRTf/R+xesvjrekb2conjC3lDEz3pBuUOC7GF7W181/xh
         7uQeWmy1gTmVTO1BvNEMCc/7rk68t+K3N8346/FsQEU6rtDJdqXmeB4/mzMYibX+ff7s
         7kK1epjlx5CgpW+91Fi9AZ2T8Z7grAhAKLdgFZzKV84qfCR98FVyjwUyN8htuVQ8QE0F
         e68nc2EEE1ut7/A5hbJwuI9LrBXGyd8LYZVk6l9h14gq+XN2ev7OVMzFJ9IBNAycttWL
         bBP7aY1YPxCe6TENfU1/EPX2uRpjps/CZE/dD/dbxfjCaecQwSJM/myKzlIbpix6vRd/
         nK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682500518; x=1685092518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1nNIQi3pWLHzY3mOaTfbR0SSgvzLFHi14IClojKi4Y=;
        b=Qn2jYBS0Oxcm2RDUr4sjQJbE7U+L0Yy8F54Wn6Sqrfsr+IqIlLbLkaZ1utSgFYieHG
         vu0udIi8bme4kkWj/EXw3DKyYBpBAYThpyzrfrvX4wZo0wjV9d1a8mRM9KRIl/dqRDfx
         RuZxX2LgQLbNRtOuWcEAx0tFQZDoZCTv5+71z5i5vJyBDmE+2K2kht/WVIokhiyQcHxf
         h7f7ar4DGS3ZYr19IGxUcbOyM0ywd064EQ+jDrIsRwZfmImxmU2VDqccKHYsgpsWBxjX
         Ym36yVZsWG/nuT4eUElzZGm1dXiTz4aFApEInQMSDE174o4zEpanUP32mwRZSO+SeGRY
         QjQQ==
X-Gm-Message-State: AC+VfDzXycB+CsLBvvA3FON+4sYGXKS9gpHsXbkJ6K7+CqUic1H+LJqf
	3Dr2jI3O2QiThPykbMAMIUY=
X-Google-Smtp-Source: ACHHUZ6/v7mRGS8g2x9/P7M9ukN+9J0uNGapXrhW4xVZ3urfzV1+NKjuQWYRVCYIFid8HSxDiIXs+g==
X-Received: by 2002:a05:6a00:139a:b0:5a8:9858:750a with SMTP id t26-20020a056a00139a00b005a89858750amr2327838pfg.13.1682500517625;
        Wed, 26 Apr 2023 02:15:17 -0700 (PDT)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id g9-20020a056a001a0900b0063b642c5230sm11075684pfv.177.2023.04.26.02.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:15:17 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com,
	heiko@sntech.de,
	conor.dooley@microchip.com,
	guoren@kernel.org,
	anshuman.khandual@arm.com,
	mick@ics.forth.gr,
	samuel@sholland.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [PATCH -fixes] riscv: mm: remove redundant parameter of create_fdt_early_page_table
Date: Wed, 26 Apr 2023 17:15:11 +0800
Message-Id: <20230426091511.674496-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_021519_730713_86F4F620 
X-CRM114-Status: UNSURE (   9.15  )
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

create_fdt_early_page_table() explicitly uses early_pg_dir for
32-bit ftb mapping and the pgdir parameter is redundant here.
So remove it and its caller.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 arch/riscv/mm/init.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0f14f4a8d179..6ebb75a9a6b9 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -843,8 +843,7 @@ static void __init create_kernel_page_table(pgd_t *pgdir, bool early)
  * this means 2 PMD entries whereas for 32-bit kernel, this is only 1 PGDIR
  * entry.
  */
-static void __init create_fdt_early_page_table(pgd_t *pgdir,
-					       uintptr_t fix_fdt_va,
+static void __init create_fdt_early_page_table(uintptr_t fix_fdt_va,
 					       uintptr_t dtb_pa)
 {
 	uintptr_t pa = dtb_pa & ~(PMD_SIZE - 1);
@@ -1034,8 +1033,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	create_kernel_page_table(early_pg_dir, true);
 
 	/* Setup early mapping for FDT early scan */
-	create_fdt_early_page_table(early_pg_dir,
-				    __fix_to_virt(FIX_FDT), dtb_pa);
+	create_fdt_early_page_table(__fix_to_virt(FIX_FDT), dtb_pa);
 
 	/*
 	 * Bootime fixmap only can handle PMD_SIZE mapping. Thus, boot-ioremap
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
