Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA118C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 17:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TB2+xfPEnufKowLWKaQZez3IJf2Eh+vwlzrFpGrurwI=; b=VW4DzR/AhUOS9w
	oRp3Wmf0msMo+a4Th7aeEMxlWwJ1iOxKChPgIKtL0QggAm+67o4a9bTkhx/3Qn6CfkFnG3GQoEZUY
	kyIw6hvPWMaRDDVYhG5LfjUigQZTcWEGSbinXf40fcqyjp+axLz2tafvc0b0uginnI1CJWGmgoqTo
	crpC8UGCSGlOc9dYH2vUtsFQFziWMhNHpF1MjRiy9gZ14uOQ5eMt4U5osKs8MFAJBfpg5kKPSp6Hb
	1HS/kdvci18Jut5PvRYUrG0pymmLIkHUL+EldYRlKhLtZVbOwSifgvicSobp5Z2cX2d2ke2+IIkaX
	o3+4zj/ElwInEFO0wAqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWKuV-0063VE-Tf; Thu, 08 Sep 2022 17:01:51 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWKuS-0063TZ-Vh
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 17:01:50 +0000
Received: by mail-qt1-x82e.google.com with SMTP id c11so1456351qtw.8
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 10:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=kCW6OcN0pl+wFvB/FVB267qWfLr3bPZPC77P/PSoNKI=;
        b=qAlOqbpJ7NWTsm9b6eVY+EChiOgfKnMcaIcW07s0VZHLwopF0OLSVYjXmSNsVd31ey
         emvhwfkQHdEQEE1Ys9Xzblma3jKDHFudXhbWPqeGTwb+nWJziyc41YCXOFxd1tlG4Y2+
         cC1J9Pwe8bVUOGW4QaHqePRBP85g3daBVo0vLqmU6+TvdhdHb4k7zUcGviGDc4+CZP2y
         huBB+HbYAkOxyiyYbn9btAMZVx4p2/x1LUuMCmjuBovv3MNNoxSEljXay1UQHORvcRFV
         a2mYWIZVmQIycIOxvzX1HlBEqhBwduYVqzvDkhxE74NDo7FSQyJfBSX2MtQFftqeRs8q
         suQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=kCW6OcN0pl+wFvB/FVB267qWfLr3bPZPC77P/PSoNKI=;
        b=Rp+lkUuo+HXMPRsC305sYDzidAywHNyCyc20cIIxg44+7FQhpiEQDe6bMN3t6u1fzK
         HRGHLEQNJo97PQgxYyAQZrU/865eghNybRujcZHTlNDZFGLyS4OIQ8zWSSlJt1pESWHF
         lAspyTrepFDVjqDqR4O+s5nzdCYxPThILm6H1ooroLEUFST0QR9ZKkznbwOZYZ4Rdkaf
         pndEBI7jKASovWaJsDYyTNmfSVTbTzj5YIgsqgZcnAUdlndKU+EbTyW8cbXRwAD24MJe
         FKG8uOEdNpQdhpphl/uJOIVBQWEXw9JJhPiSTBylLQ7uwRkJI7mFv5B3guhhTEZHSqkO
         YMXw==
X-Gm-Message-State: ACgBeo2fXQPgy4YiCTsyR0KUm8JoAGaRpgUEs22er/jwZexNP+I86wXs
	cbX3X6OqM44h28jTx1X0Hk44+A==
X-Google-Smtp-Source: AA6agR72zd1h4G/5DJUMkfaYL57NMZfCX1GCn2mR7eqXWKf0L2XnPoEMFqd7uWJprchY3j4mWP6/2Q==
X-Received: by 2002:ac8:5dcf:0:b0:343:7ded:7b with SMTP id e15-20020ac85dcf000000b003437ded007bmr8601868qtx.492.1662656506059;
        Thu, 08 Sep 2022 10:01:46 -0700 (PDT)
Received: from abrestic-xps.ba.rivosinc.com (pool-71-105-112-35.nycmny.fios.verizon.net. [71.105.112.35])
        by smtp.gmail.com with ESMTPSA id w17-20020a05620a445100b006b8fb2a1145sm17714452qkp.124.2022.09.08.10.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 10:01:45 -0700 (PDT)
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
Subject: [PATCH] riscv: Allow PROT_WRITE-only mmap()
Date: Thu,  8 Sep 2022 13:01:33 -0400
Message-Id: <20220908170133.1159747-1-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_100149_218342_011AFFFB 
X-CRM114-Status: GOOD (  10.29  )
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

Fixes: 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is invalid")
Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
---
 arch/riscv/kernel/sys_riscv.c | 3 ---
 1 file changed, 3 deletions(-)

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
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
