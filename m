Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D02DC83F14
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjU/B67fyJ+yrceDAxAfm4P6hzorg7qnt+OMmr8VywQ=; b=V9nKbhMcznJ/s/
	1zCPTI+AVi65g677TlCZ+ff53iLfkvQBCXEk0riu9Y3HQPFI7e/513Ft9AJAn1T6e1ZJPTYC/PfiF
	xCvrjoAdSi9gr0RWD5yncrdqcCjiZTOuFa7jJGnVPqkgaoP6G1sQk5j3vA3pzxYTkWN3GgC0gi2Df
	zTpumlrS+f4kgq2KW/UIFRzj6KTU0zgRe/9B4QaW9fPLrKHf3Az0C1uOKfUJGnbHQgWHoB8Hy2L+a
	TUBjluHL+L5MZIZH2lELxWvetFLam0HwAcT+hSkcHkvxMvE5N/X03bD4aY2CW7cryJucJm56nOyYc
	yGWJNVB055gE9itGTxYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL2q-00DX1k-31;
	Wed, 30 Aug 2023 13:15:40 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL2o-00DX0m-0l
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:15:39 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bf48546ccfso29812715ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 06:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693401337; x=1694006137; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58JmpBMuut0U4rrpw0CXIuY7q7ojOIFJjIbB/139BI0=;
        b=sbg4tiADjBSj3BbwWJfmIpm8qIHS+VMQ6egAGnEPQtpmL+bfUIw6rg/AsvUuaiSahK
         DzpPqNgI29pqhbFEvRRpCbGdYDdBuGndrLQQd87l1dkIKx5li9mOxYvFyB/SC2Gay6yA
         QjOlqMVhRTKN3gn+3Ee504j52+2aounIHk9SZnXC5dnm88hCQqLB8MGjvzq0cgqIsSIs
         fcnpiSUWKxy2og3CoBiu/z8IcLeF6NOFHwVmgNBXGndcC0wPYvBVv43ax6iN6IWCkGcH
         9VA9uF3oZYkmvpSU3N/3HgUxgPmHCyAcxExlfE5McnF256wVyfPyNDrp82by0aty74o2
         SfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693401337; x=1694006137;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58JmpBMuut0U4rrpw0CXIuY7q7ojOIFJjIbB/139BI0=;
        b=EvwfDgTFIZvANxGhzVEQCim4E6YBjlKgkx0Pv4O7e8PuuEiKjR0VuqfCU8xgcR+i+1
         5h+r+b9ayCKbcQtpS33Evu5s6vC55bLublS9ewPyUmZnQbYpLGqMXwEfwWOtxfglgZdw
         PNtSd6CyAf8IZpevbzhlnJKb2YX9OhyN04QWc/HM6WN0PHd+LqeT4T5iRCi68BFknYkf
         GkyJWaZRw24dTZuIv5oHDCYoZfHqbbKXiTYWHZNIVCh+4Vt6zgiCUFlVE35N1ABaxZNS
         vfTDrS+Xg08G3d2l9ivoCEofRXDPrbnxTw6bQx5fYrz+nWV+8JuXPJKgIpKy9ztRLL7s
         iXbA==
X-Gm-Message-State: AOJu0YxgynmTVU9bADRSmhoJP/Q0K8VY+ANczzavgU8FkHZvZbEF7zG4
	54GJylfXs4bXH3w49Q2g99Sb9D4zdTBhfsQndGI=
X-Google-Smtp-Source: AGHT+IECpbqH/UrkxB1+1DlNKmoHKvp+r/ynwupNT9KnTwQXvzoUtZlWI5HNytgqOrLW6uFMy/+qpw==
X-Received: by 2002:a17:902:720a:b0:1c1:f3f8:3949 with SMTP id ba10-20020a170902720a00b001c1f3f83949mr1656776plb.1.1693401337465;
        Wed, 30 Aug 2023 06:15:37 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902654a00b001bc445e249asm11306143pln.124.2023.08.30.06.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 06:15:37 -0700 (PDT)
Subject: [PATCH v2 2/2] riscv: correct pt_level name via pgtable_l5/4_enabled
Date: Tue, 29 Aug 2023 21:39:20 -0700
Message-ID: <20230830044129.11481-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830044129.11481-1-palmer@rivosinc.com>
References: <20230830044129.11481-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, stable@vger.kernel.org,
  Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, suagrfillet@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_061538_273931_18372732 
X-CRM114-Status: GOOD (  11.00  )
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

From: Song Shuai <suagrfillet@gmail.com>

The pt_level uses CONFIG_PGTABLE_LEVELS to display page table names.
But if page mode is downgraded from kernel cmdline or restricted by
the hardware in 64BIT, it will give a wrong name.

Like, using no4lvl for sv39, ptdump named the 1G-mapping as "PUD"
that should be "PGD":

0xffffffd840000000-0xffffffd900000000    0x00000000c0000000         3G PUD     D A G . . W R V

So select "P4D/PUD" or "PGD" via pgtable_l5/4_enabled to correct it.

Fixes: e8a62cc26ddf ("riscv: Implement sv48 support")
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Song Shuai <suagrfillet@gmail.com>
Link: https://lore.kernel.org/r/20230712115740.943324-1-suagrfillet@gmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/mm/ptdump.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 20a9f991a6d7..e9090b38f811 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -384,6 +384,9 @@ static int __init ptdump_init(void)
 
 	kernel_ptd_info.base_addr = KERN_VIRT_START;
 
+	pg_level[1].name = pgtable_l5_enabled ? "P4D" : "PGD";
+	pg_level[2].name = pgtable_l4_enabled ? "PUD" : "PGD";
+
 	for (i = 0; i < ARRAY_SIZE(pg_level); i++)
 		for (j = 0; j < ARRAY_SIZE(pte_bits); j++)
 			pg_level[i].mask |= pte_bits[j].mask;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
