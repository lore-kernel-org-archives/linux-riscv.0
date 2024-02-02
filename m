Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240A9C48291
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDu3nnLYLTxy2kGhMZZYkINQHyaohegr4ufrYJIPr3I=; b=XxpSu7KQ+ZpTgN
	Y8JdMJ0sciiCMopiGgvSi+2zr3+1BInPkOHCDBwSr0mdxaNVph0Mp0XwMC7gz8J9te79nGnGuV5Wp
	QyqDLmlmXvIZm8xdFbeVOPMc1NkJt6XVTptyYo9q4v7bg9ODDpPZvxt7cPqZE9W+0qQ/hL1wVCHft
	ziYlFwGGq5RvvU7j/JeY0SZHaR4Ijq3z1MZQvgBCgH19nzA0FVAkrxip1P+wafJYwrv2PHUSrAkq4
	XTyI/AlTd0fonQBzCVmXm5sO7iVfmT2gYEe6CLDPCqdvkL436wMXyMfoLcHpk+ZgWbXib9QJQDRu3
	RZqucPKH1K42EooL6FYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwV9-0000000CL4S-12eQ;
	Fri, 02 Feb 2024 16:34:51 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwV6-0000000CL3Q-40wd
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 16:34:50 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2963cc5e8acso706595a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 08:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706891688; x=1707496488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4XLcspDZ2svWPCn3b1Mu60aWYrbol9SnEepXTKa4KE=;
        b=0tDYffpdpms32VEk7VOTtE70PXV3AJJLw80o+oXsahHpzsMFhcdBtOKWThmRe1Wn4r
         iXBSIeuhpZb1EsXdtdSaFn3bkPx3BGAm41lC/XafrLPhTVYAaxyjBxGqPmCmPnwLdPO+
         jrddHoFtss9BC4O6UeOiJ90nV36Q8jDWGbboY2NlI7i2uiFm8zARRbRVH2tvvNvqtFce
         29+AxQ1HRivnpLLWuk477OESpMEmk4U7K8m4zM2absNx8JHMOtXw9HspOa0HQ7kvVBu0
         T0OQzd8SUJMuIkaTRbllFq/+IvxbLvyApuj4NG3Fj5tjdzi1i7pfh2zCZ0CEGfcEwhIn
         wHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706891688; x=1707496488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4XLcspDZ2svWPCn3b1Mu60aWYrbol9SnEepXTKa4KE=;
        b=ccqin9f4oAY39nOJ27WIUkVK/OYPgU5tIyCHbU1IW5jid9aN5vFYGiTgHL8pWZs6fH
         hbMQsHIIvzFwdG2xGY0e7d5A6GlQtBf9QtKKGNjm7M7n+JbPARJEKFyc80uj9F03mfUK
         Scti9bc12TtYHewiUo7UTKyjxrM3jMKTnoYgAxE+/rrwZSqY2F48i1J5pEGxe+Da+HWf
         PtXfiZDbelU+HsP9mI81QA105+vj/FquoUf5KFtFCCztIcgvfeWvXaYRfD42FBLa6f6v
         gAt82mk3OIPAEJNI+pCi5dcJHE8mxp3pdMUSavlyG7T81rXTQnCXj7etcAHfBQPjgjiu
         aazQ==
X-Gm-Message-State: AOJu0YzR8pYI3t5nkeUIWYEkH7opCBYjeNnNarSsOzzbEVeZcVwZcsn9
	67fxcygp9uq1WLpHKe93dFdavCarYfZzHLZKWZDfX0zVl146KmFygI6P/QrsgPc=
X-Google-Smtp-Source: AGHT+IFSaOJGmU3nV35wyc0qbUGGVGRDpxLFzEIabMTzgK3Mk6BNdYPxuXKelnyByl8YF5H8/0qHBA==
X-Received: by 2002:a17:90b:80d:b0:295:ff5a:5e4d with SMTP id bk13-20020a17090b080d00b00295ff5a5e4dmr2634953pjb.20.1706891687915;
        Fri, 02 Feb 2024 08:34:47 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWl8eUkaFifVQfTIqx1jcOjqKGs+PzcPRmEeuWoGgHYEFqPgSWmGUEk8Z+2QzGzXhmi67UxDhC3lP11ZX5isxcEAUwRnOHIaqKRDQhDpW4rFHWMP1CsvPVVId7GnG8mz2+Jt2Ytj3xxCuaJFJNofafO/EUbReVVwNNgGdkYaB1HYH+faUsW9CNoLYFgaTphCuhfzUaQm+OE9phqQRx9H494jbkBk8ioZi7E7f3gLr5F4VRW/AMwDA/pj6h3qCnsXoDtCNPo2DsMQNL7
Received: from abrestic.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ju15-20020a170903428f00b001d75c26e857sm1784870plb.288.2024.02.02.08.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 08:34:47 -0800 (PST)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH 1/2] efi: runtime: Fix potential overflow of soft-reserved region size
Date: Fri,  2 Feb 2024 08:34:32 -0800
Message-Id: <20240202163433.786581-2-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240202163433.786581-1-abrestic@rivosinc.com>
References: <20240202163433.786581-1-abrestic@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_083449_016246_B56BBD02 
X-CRM114-Status: GOOD (  10.46  )
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

md_size will have been narrowed if we have >= 4GB worth of pages in a
soft-reserved region.

Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
---
 drivers/firmware/efi/arm-runtime.c   | 2 +-
 drivers/firmware/efi/riscv-runtime.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/arm-runtime.c b/drivers/firmware/efi/arm-runtime.c
index 83f5bb57fa4c..f369256c7003 100644
--- a/drivers/firmware/efi/arm-runtime.c
+++ b/drivers/firmware/efi/arm-runtime.c
@@ -107,7 +107,7 @@ static int __init arm_enable_runtime_services(void)
 		efi_memory_desc_t *md;
 
 		for_each_efi_memory_desc(md) {
-			int md_size = md->num_pages << EFI_PAGE_SHIFT;
+			unsigned long md_size = md->num_pages << EFI_PAGE_SHIFT;
 			struct resource *res;
 
 			if (!(md->attribute & EFI_MEMORY_SP))
diff --git a/drivers/firmware/efi/riscv-runtime.c b/drivers/firmware/efi/riscv-runtime.c
index 09525fb5c240..9da79b8169d2 100644
--- a/drivers/firmware/efi/riscv-runtime.c
+++ b/drivers/firmware/efi/riscv-runtime.c
@@ -85,7 +85,7 @@ static int __init riscv_enable_runtime_services(void)
 		efi_memory_desc_t *md;
 
 		for_each_efi_memory_desc(md) {
-			int md_size = md->num_pages << EFI_PAGE_SHIFT;
+			unsigned long md_size = md->num_pages << EFI_PAGE_SHIFT;
 			struct resource *res;
 
 			if (!(md->attribute & EFI_MEMORY_SP))
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
