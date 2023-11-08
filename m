Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A97C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 08:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vAfp8JvutIdUxRuzld6bBkDYERpHAW4vXVyyfrGCdU=; b=qwkcx0Ytyt1j8R
	9hMP78bA7VnbifMTJz8EXdSAycrvggUsr7SbYSufNwG9OEHbqsdkhA+gDvArUJze+2eJnTKpL8V+T
	ffpeqOxGlPU9Zjg2g9WUWs/2cQ23LJ+Vo0xic84K4pOHVgarwyUnjAynz6fpABv8HTKoAlMk8rXei
	rH/6MWaSUNFTFkLKUhHA2mmLxcJzTGpqFenCRMlbBao+cCPhXv/g58tDZUtiHLztw8zulMdQnKkf8
	QOPqOCbgh9vcQSoZvC39Uy4hmHsQSsmAQnZaFFZ7fOrSLyfz6GNDgDdQE33XXBZfSbsqONocKpY2e
	gHtDMiV0RjfeWGIfYxqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0dUe-003E65-1o;
	Wed, 08 Nov 2023 08:00:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0dUa-003E4j-24
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 08:00:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40806e4106dso2657875e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 Nov 2023 00:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699430449; x=1700035249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEPgDTMpIXvshpOSSpINtGH8/u8zbO38mo5vAWcHcCQ=;
        b=0qeLwzny3LmXP7eLNoLkBa/ghBTWdUd3j2rSd/Aq+BIyPhPHhjtKMKAEXIJ3c0fmqn
         U1OlPV7+YdiCRXrLZ6/xXp9HIOcs6YzNGIU960OuIIOBeL7fF0VQDho0PAjClr2Dnacu
         YWyDUkT9pnL6rQxbIJjsIfUiIYK99qm5olh4Xrt6kHrYDHzCJF1jClRvW0X/mvbCiAB4
         AS3vvf+g9ne4dVS+cpjREPCALi1SvdDzPwIY/xNjAIOXY0zYMMFOL7DHNT0Mmka2Zd+9
         /DjgDxcPL5xcO03TdaLTBRStzCEn3SZR+14l1sTm+ooMkKRy7AlqyG7werLzzutZEFuf
         +IqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699430449; x=1700035249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEPgDTMpIXvshpOSSpINtGH8/u8zbO38mo5vAWcHcCQ=;
        b=WfTQSLmNZcZPkATaMRNLCI2J189EGsLfSWRB1YvMhaeqDhsVFXWc9Zxboc0kJZvwVY
         +vG7eXKqd/79Di+5gGxRe8K0RJK7YqwEG49cKk5eN8bNtp5kskyh8QBGL2Qc9rLzIS2l
         SRRf5sKElSPcZ07FwUFQ/Kdh/tgYnlK+LY2EG6HAtDgyEh5jR/NNOdPz2Xf/bH1dbPtZ
         189WVQwtRG8JehA8Mfv45nnLMzyUud3is/GuGdHQ7ix16Aa4lR+kZ2LdmWaJ1PJxq+6+
         TWSURkB7gjur2bstkK8x9yzjcpcoS0lNTE+IPqfBlFy/UKrq812kQPEAxsamIMoet34j
         rylg==
X-Gm-Message-State: AOJu0Yz2eU30AMjg5wjVOcgW8GCAFxIIPXDEDzzO5g7qrnyOKnH4Pjlm
	tVS6aR5LesCXJZUhZg5/LDqqpAx3XS0cDpDvefo=
X-Google-Smtp-Source: AGHT+IGgFRraslXtVrVNm+Gd+pCruKXk0cuRYB74JEpgEQMyF+kTP3abCXagtaT+2hcD2YAAZd1MRw==
X-Received: by 2002:a05:600c:4f8f:b0:407:da06:2016 with SMTP id n15-20020a05600c4f8f00b00407da062016mr1241590wmq.12.1699430449297;
        Wed, 08 Nov 2023 00:00:49 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p22-20020a05600c419600b00401d8181f8bsm17679141wmh.25.2023.11.08.00.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 00:00:48 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mike Rapoport <rppt@kernel.org>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH RESEND v2 1/2] riscv: Don't use PGD entries for the linear mapping
Date: Wed,  8 Nov 2023 08:59:29 +0100
Message-Id: <20231108075930.7157-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231108075930.7157-1-alexghiti@rivosinc.com>
References: <20231108075930.7157-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_000053_741872_44512550 
X-CRM114-Status: GOOD (  12.31  )
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
