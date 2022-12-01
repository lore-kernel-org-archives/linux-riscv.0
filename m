Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D5BC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 13:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCfPDZfG+unCT0TryIEM5TGi3at+g8rUnm9rQao6QkY=; b=PcFv5SFP4Edju2
	8P4PVLp4lGUZxk5zMhdZCDDcEGlX69K+Xblx4wOYPdFbzl7NdujZ2Kfg17s/Ar75qRsuidiX0hoCa
	thkpT91HykE9Gver2FV49LJZ7MlkrlGCfKsAB8szghjm7910KI5DnMSG1O54G+DIktod2RbO+lu69
	oLcBA7klz9HRVhCVSNnpPkVvVvUtxJ3lWwtAb+KSsv21aZulL+ouP6i0IuRgkWkQ6FZQiFg8pJc0g
	WRXK4/IMtiRY7pvU3ootp5dcZ3vA2qqRoCOemkdfJGqOLf7qeADfgbh6frtIL3tTww47/cfSOQjQ1
	WTfS2eWG7w0di6VECE/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0k0I-007nQU-6u; Thu, 01 Dec 2022 13:53:30 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0k0C-007nOP-2n
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 13:53:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id y16so2828127wrm.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 05:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgLh6uMMR0Rcr9C+nyDLv9c+8u2wrvtTYa0+ThJna9I=;
        b=bmeNS2iEKjeqg6unQ+LJECbDmv0XQqeKqaACNC+HASzyAlGgmwAIi+IyPgR5TQy2Vm
         NKjpmkgZMPqWZdpaF0oqQrrcwqYrmQQPkcwE3JL1XH1rHQLcgECF7o6fz9wFLWkdCGEM
         y19q5D5ob+B6Q0p0SNy4JjQViJIShBPxcMLj9FC1HZsa6kYJM/k770E94SQ6RWRXBGbe
         dTBGarcCH9bDXHSGYNz/jUkT2OuX5WZUG9T6VGw8tZJAA6cHqbtFVXmon2eUWuwWOTMy
         JVIl5O0xYviC0vXwrGsyghXQcMnCS4OnEy88xxdHA2rM5ZTszL23U5etmCO/MItuC8JB
         hwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgLh6uMMR0Rcr9C+nyDLv9c+8u2wrvtTYa0+ThJna9I=;
        b=Rp1WGgTFQk24dQofNtREQ1RV/kHzevQz3M+iTvkSodX9/GYS/X0eMhFrNpBp0K50IV
         WzPY+kB9CbSYUAjeS0e6jMhHdt6d4TFLp1Q+WpbFs+DlibGWqLD08Nl0GQEDODsXsRbU
         58XnCU762w2g2R+J/DDhJAe4QnmBXlGj0RmaQDsk3r5jj9DHc0ieCr/PFQDJZ/PX8bwD
         zkWWKtgprHUbPAEmCejDN8ZXxw7917dhdRKzo9/rnk0WfhZRvP/pd91/If2UCn+qXJKJ
         aBIA2wUAsZgzOC/pMhOyuIhHjdNZEsqjlvIn5figzjWtPdR5rq5ThSHalKfYI/OCmr++
         SgDQ==
X-Gm-Message-State: ANoB5pnyXYdAMWJzlYgRWCu4MT0iPXzCJuj/GuAXzw+sT+qcYm8KAugd
	yp9GiFdWWgjaaE1UQzprBshKhw==
X-Google-Smtp-Source: AA0mqf7uWenO+LbmKE9LuMiukYmFeUw50rRJmRTVFYoCgTjjVHaNFb5qH68Z/YfC8l8bquXihHFdHw==
X-Received: by 2002:a5d:6503:0:b0:22e:35e8:382d with SMTP id x3-20020a5d6503000000b0022e35e8382dmr41094490wru.475.1669902800271;
        Thu, 01 Dec 2022 05:53:20 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-gre-1-201-46.w90-112.abo.wanadoo.fr. [90.112.163.46])
        by smtp.gmail.com with ESMTPSA id t17-20020a05600c199100b003c7087f6c9asm9589361wmq.32.2022.12.01.05.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 05:53:19 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 1/1] riscv: Fix P4D_SHIFT definition for 3-level page table mode
Date: Thu,  1 Dec 2022 14:51:28 +0100
Message-Id: <20221201135128.1482189-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221201135128.1482189-1-alexghiti@rivosinc.com>
References: <20221201135128.1482189-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_055324_127197_C8A54DB9 
X-CRM114-Status: GOOD (  10.31  )
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

RISC-V kernels support 3,4,5-level page tables at runtime by folding
upper levels.

In case of a 3-level page table, PGDIR is folded into P4D which in turn
is folded into PUD: PGDIR_SHIFT value is correctly set to the same value
as PUD_SHIFT, but P4D_SHIFT is not, then any use of P4D_SHIFT will access
invalid address bits (all set to 1).

Fix this by dynamically defining P4D_SHIFT value, like we already do for
PGDIR_SHIFT.

Fixes: d10efa21a937 ("riscv: mm: Control p4d's folding by pgtable_l5_enabled")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable-64.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index dc42375c2357..42a042c0e13e 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -25,7 +25,11 @@ extern bool pgtable_l5_enabled;
 #define PGDIR_MASK      (~(PGDIR_SIZE - 1))
 
 /* p4d is folded into pgd in case of 4-level page table */
-#define P4D_SHIFT      39
+#define P4D_SHIFT_L3   30
+#define P4D_SHIFT_L4   39
+#define P4D_SHIFT_L5   39
+#define P4D_SHIFT      (pgtable_l5_enabled ? P4D_SHIFT_L5 : \
+		(pgtable_l4_enabled ? P4D_SHIFT_L4 : P4D_SHIFT_L3))
 #define P4D_SIZE       (_AC(1, UL) << P4D_SHIFT)
 #define P4D_MASK       (~(P4D_SIZE - 1))
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
