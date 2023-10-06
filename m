Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CD4E92FF9
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 09:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vAfp8JvutIdUxRuzld6bBkDYERpHAW4vXVyyfrGCdU=; b=bEvs0g6uz1kYYK
	ld637B7+LMHKqXRa+p63juY2Pt50e3pw1Tt4jqBYt4WloHoAMUbDmMsVp31D7FUvNX2Re8n2cSRvj
	r/TNS9sTNf2d5yphOu+7Q0zjPbIOuOcBe3EAhGjzsci+9M7LFjaILqw3P7SNndPFNoYRVfp28uoX/
	UAsg8llKB4xEXuDnt6yyhgUlakVHOPtY0wzkVNQ/QjvQU9BJwR35avCeptQzCqx9VKqfRIZE/3gEK
	49yIHCwb4X3lgskruyn/RQ4Qw9SloDWawoIzGnrTl88ew+PsXVnP2wFmIwWz0dZmlQ3pKJ1S0aX1v
	dxRlSXx7XS1Jeb2kQDuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qohAO-005Ob8-2o;
	Fri, 06 Oct 2023 09:30:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qohAL-005OYb-0r
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 09:30:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40684f53d11so18361075e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Oct 2023 02:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696584633; x=1697189433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEPgDTMpIXvshpOSSpINtGH8/u8zbO38mo5vAWcHcCQ=;
        b=pH/HibcRYe0IxHMxWqvkJbVIKUF0IG2wc+XYFBClIoCEO4IN9vcMBdQXS/Zdnakv3e
         Xn2HrQjU5aFOhVD566ucMJh8k9Fjl32gHZgWcPHdtgk6DMu/dIuEQHhfi0LjbEuq6+a0
         iKyhgR/N/OAtCJ5V9pQOTb4VBl0M/NIhHxMKzS3VLepVFleJOp8Kj6dOXXbKMIq85nbj
         VXRdovHG+h2jDgqUlvlqzT5T9k+Ga0fu7qOJz2iej3xpg4E8cMSZZyDlZ6uKoNLNA40b
         /8r9iXeslRxc10tQ6DyTXp4IBJNFpqy/JBJ7uRrjB1DsfUjVz50RTjRvYWw/Q/u5ajcX
         7oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696584633; x=1697189433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEPgDTMpIXvshpOSSpINtGH8/u8zbO38mo5vAWcHcCQ=;
        b=kRwqrGsBvoAjVj9X177GQX5SyYdUQunWqWbanArwCAV7bzdmB4CCgfBijBkUJQEEh1
         Li8RSkmrFvtfTNtQDf2y8MRR3Pc06591CyMC6VkGU1GUB/lK2bw1n2hYFf5h66YZHbKn
         AVNRQmC2tFWciDj5EskBxQcdq8+bbGZejawhBJRrGaNVxmrwooGtEZ3JUp4/EtwRQixw
         NJJ16fhJ0/q0CL51xu7jxlL0OcRD9S3Cup4K3EsjvJT5ys4q+QVkoSx0UwijbSkjSk2G
         SoluWzzEfoYDXF+8dNY/X5xzUWTR6ilyURGCFKCHxzvPJG2czMmnUCScfRpfCRrt8KvD
         jamw==
X-Gm-Message-State: AOJu0Yw9iuE4W5Jyp1hoPoP+bT81anAvia3ZEGf6X6bgJvM+p3OsnXrR
	nRvQR01XSSrsED7e2AJIYOiTNw==
X-Google-Smtp-Source: AGHT+IFzpVKciWuWfPAHKSdw21PYMXBkXodfZFcRtcTIK26f2duii9Xu2/UeFDeLVkoD/5+8XWF5LA==
X-Received: by 2002:adf:fb0b:0:b0:31f:c1b5:d4c1 with SMTP id c11-20020adffb0b000000b0031fc1b5d4c1mr6387300wrr.35.1696584633432;
        Fri, 06 Oct 2023 02:30:33 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id c16-20020a5d4f10000000b00324ae863ac1sm1211986wru.35.2023.10.06.02.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 02:30:33 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mike Rapoport <rppt@kernel.org>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 1/2] riscv: Don't use PGD entries for the linear mapping
Date: Fri,  6 Oct 2023 11:29:29 +0200
Message-Id: <20231006092930.15850-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006092930.15850-1-alexghiti@rivosinc.com>
References: <20231006092930.15850-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_023037_303829_95F11BFA 
X-CRM114-Status: GOOD (  11.94  )
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

Propagating changes at this level is cumbersome as we need to go through
all the page tables when that happens (either when changing the
permissions or when splitting the mapping).

Note that this prevents the use of 4MB mapping for sv32 and 1GB mapping for
sv39 in the linear mapping.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/init.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0798bd861dcb..6dc61d3c392f 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -664,16 +664,16 @@ void __init create_pgd_mapping(pgd_t *pgdp,
 static uintptr_t __init best_map_size(phys_addr_t pa, uintptr_t va,
 				      phys_addr_t size)
 {
-	if (!(pa & (PGDIR_SIZE - 1)) && !(va & (PGDIR_SIZE - 1)) && size >= PGDIR_SIZE)
-		return PGDIR_SIZE;
-
-	if (!(pa & (P4D_SIZE - 1)) && !(va & (P4D_SIZE - 1)) && size >= P4D_SIZE)
+	if (pgtable_l5_enabled &&
+	    !(pa & (P4D_SIZE - 1)) && !(va & (P4D_SIZE - 1)) && size >= P4D_SIZE)
 		return P4D_SIZE;
 
-	if (!(pa & (PUD_SIZE - 1)) && !(va & (PUD_SIZE - 1)) && size >= PUD_SIZE)
+	if (pgtable_l4_enabled &&
+	    !(pa & (PUD_SIZE - 1)) && !(va & (PUD_SIZE - 1)) && size >= PUD_SIZE)
 		return PUD_SIZE;
 
-	if (!(pa & (PMD_SIZE - 1)) && !(va & (PMD_SIZE - 1)) && size >= PMD_SIZE)
+	if (IS_ENABLED(CONFIG_64BIT) &&
+	    !(pa & (PMD_SIZE - 1)) && !(va & (PMD_SIZE - 1)) && size >= PMD_SIZE)
 		return PMD_SIZE;
 
 	return PAGE_SIZE;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
