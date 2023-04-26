Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A988C7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 10:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ttl14MDxUMNHwn2SiJ4MjWv/xJhEQoFnqpzBhTG8EuQ=; b=SeRjCuwR1EzYj9
	hsaHLcHFMnprAoUv1zFgy48sAhvKdS/7lMCHcOE30DwRWMUp6QtEwcCAWXkaA9+pgYK+9aSHCNGl0
	RmAw/dRjuy2csJd0bBZXow3/BAj6+kgZNMftdYKwXu6A4ZYHKtqOBh2drVZR5Atpp2aWO01Vpd+Wm
	yYvt1qtnX4MJhdgdyZcu1xBz6KyHR6wKQ6Q6mAbbnjDPFViKdRlH270AnGBYNPBX+UXvv5kbFb1IF
	4qD1/lAqTSUrNXf+RcQ+szQhzM/pVFX2iOP4Fk8YCFo3hJ0RFFUo7BqZg+vJpxsqDDnEQXlPd6aEN
	GCKmzIKTG/jS5OOxsggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prbxF-003OAB-2t;
	Wed, 26 Apr 2023 10:00:53 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prbxD-003O9Q-0s
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 10:00:52 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-63b50a02bffso5690860b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 03:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682503250; x=1685095250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OK3qaiVcydKF9XZu8gI/RVWN/3p/t3jhTnRjwV7K8CU=;
        b=OHfLmQ6TetIifmiTVR9LyyauRXAcQNU3ERRrcAXiXo5JSu8k8e90/F4LPPPxvhJ5Bq
         qNc1BsfC7SsE7nke5Fb3nrfLJaBSzgAU/H/ABTcbkHZ9NFDeBwaKH53PjgoEeHy8Jsx2
         Ci9Ik49fYzQ+zyEouDCMivUg0zEswhp3zYDlVUJgVjqjpYyWYJFvzDcs3mkzoF9dVWZI
         IaCp5zjQmirto4Fk/SULtA7lKvU8rtRf5YTXaFg2J+z8gC8e3pRM94hxSkeVLH8yCu1X
         9Z3NLJ6A0hU7QyPGbChnho1BtfAlgg1nrRK4IWYQGPgQpry1AoWtfsT5/9NYkdXS8Kaf
         M1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682503250; x=1685095250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OK3qaiVcydKF9XZu8gI/RVWN/3p/t3jhTnRjwV7K8CU=;
        b=ifSgCYgFPBPFSsq+L6/U1bAw60ku0J0tSACiFR4a6FiR3kuMFQf9scZdc+HSuvHDCC
         UjcS+VU5E+usNGfV9WMclNbIdOynVP8BH12Xb589BsVlVX3IolCMfENWfvZh+SHMcTCL
         jhWUyRmOmFlCbcmJ60UBtwDQJVVzCNhXHiLBo5lP8Ru9LlVwbpZPIml20cgliWYNeszO
         oMmOojq8jX9LrDkV93Io0kQ8d8Ov2kcxV8/7//pH+d3PYx2U9MjQT+28wvpYP/QbijLi
         05gtKKTpl+mkP4eCE95zCeG06WN5UTfclUcaqlmQHBl5J0CKezouoy5s5QR/JWsVQMH5
         +OZQ==
X-Gm-Message-State: AAQBX9dihzAo6HnHMJIaE8OF7fHIx2FJn1RbM0tuFyXurWZant1cSvvF
	/04t1IU7hwppkIW4HedNNsk=
X-Google-Smtp-Source: AKy350ahc/rCzAYODAXkAQXwOIl8SBjdAMeWouAOBakREDSTC5hR8ZV2katEqTzZ0BMa/9RHBRaP/w==
X-Received: by 2002:a05:6a21:788e:b0:f0:5a5b:7bea with SMTP id bf14-20020a056a21788e00b000f05a5b7beamr26480987pzc.61.1682503250334;
        Wed, 26 Apr 2023 03:00:50 -0700 (PDT)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id u29-20020a056a00099d00b0063d2bb0d107sm10940811pfg.64.2023.04.26.03.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 03:00:48 -0700 (PDT)
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
Subject: [PATCH -fixes V2] riscv: mm: remove redundant parameter of create_fdt_early_page_table
Date: Wed, 26 Apr 2023 18:00:09 +0800
Message-Id: <20230426100009.685435-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_030051_309718_0F35B4BE 
X-CRM114-Status: UNSURE (   9.75  )
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
32-bit fdt mapping and the pgdir parameter is redundant here.
So remove it and its caller.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
Changes in V1:
https://lore.kernel.org/linux-riscv/83540cb1-0c9b-f572-849a-cb100437d049@ghiti.fr/T/#t
- fix the typo
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
