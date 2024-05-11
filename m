Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE209C25B10
	for <linux-riscv@archiver.kernel.org>; Sat, 11 May 2024 01:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CkVdUoxdDTMqXi4ivd/1ldlsFY1jDO7u4YvSVXt0tSQ=; b=BEPXsLSbxIx2YT
	z4Q5yzkLSzRkos6AT+ovE/oh4fZwXrf3GpcH510P37ZSTwMHvD9YjadPVRgVOJqD3woYVP4nOdSBU
	vdBJ7pYCcKmBi1UTt7aUcdfYETgsDrszQIb3zYh8gsdBIXm4VMqH1fhJdCwePY525Ry7BRsu/KUgx
	cly1CxOlkspbvwMtgl7HJPQkoiooz8/yNDpF6svk+TDQ5sQ/39gIBBUndGkCC/R77EOot8Okco/UH
	/279ndSLTJ0LYJTFmbLGCRp37qly3Zd1ljSAjL8YnebKR50BVHhIT3OWC0T7s+uQ53s4yFWlt5bGR
	dEb9BwPm3tUDrdcABriw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5bza-000000072jv-3fVI;
	Sat, 11 May 2024 01:57:42 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5bzX-000000072jG-0vKX
	for linux-riscv@lists.infradead.org;
	Sat, 11 May 2024 01:57:40 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e4c4fb6af3so16292545ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 May 2024 18:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715392656; x=1715997456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1wZqXklLg0B4d9pxI+uMj8pVTiukxNVXaQsQAgYgVq0=;
        b=XPfACho9XOwkxH+zMaKSychvMSYG7q3Ou7/Wby/ucLy1TxcuDEud3O5x6LDc+dXhS8
         /5WiEtIz+3H9AxWlMbmHyAHb4K6cn4GOrpYK4w4+WUHAbw24bqVHmUxEbNNyhr0hC6gv
         CYnJl9jS92svXbuYDJlu6bljSKBwAAFT4nxewgeMNfmIAdVdL8jJggf74HneE+khAHY9
         RkqMh6caSxjBNOxqk0qk+cZDKJOyCL9QwiZQeXuO331e7G2xhATP7osENphuXlPptZac
         fa7iYL9qzR9gfoB3c9IlDftyhjQF8WdlxWr/4KNlKpLVDF0RnyEKYr73WjXNqnxTaO8b
         WytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715392656; x=1715997456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wZqXklLg0B4d9pxI+uMj8pVTiukxNVXaQsQAgYgVq0=;
        b=cXtUclewL/gEPJJNQutNk170fAdV7mlRWZ8X+/L1WFEd2vmaQFO1dlusMtqV6xcpRm
         qq2s9xToqxb/7EmEeWXFXZANkRkkhEw5OrbQ2dYZFQA8kLRO7x5WIPxdFmWugNLT/xAz
         RyBzx2NbnjB0kul9wcg06Hpx66XW+9hv8fuPTlQzEsh+1ZlhvOdGluVSCazQ6lowaqO0
         UR4TLSRFGAV7ZmJNuyFMhb5yIojJ1VcbJHadVGoSK6ej5MlfoaIMCWuM8FgR2B6FpIXD
         F7Si+FubCTwvNkIzc6Kg7+0tqsraRhBmtr5O0OmIvhKWLcv/3bO4E8d9WgrsHm+3SUuw
         JDjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHZbC69L01NxhPXa1RgUJ9ozVBVqOa05S5+R5+AB8qIpxK83L2np4a97mDMg/aD8rak0y20Xpkyp9WvsceTCKTttOyr67q8jUAc1Yzv7WB
X-Gm-Message-State: AOJu0YxinDXCoSXe+KHUUegb5dQLdPvBtOuKmTehmddJ5Dp14ZjTWwQn
	IKYv+BgiRY3Tixk3rNMCTQUpxyoU1Aamrx7fFtefqIVzsAyfP79qom+GsdmG
X-Google-Smtp-Source: AGHT+IEux3ZgZ+IjmOlJTT4iyWCBlWPONI96OiCEBJb1XXZu2Wuj3k7Urkco5CuV88bSPmjSZyGdng==
X-Received: by 2002:a17:902:da8d:b0:1ec:8206:626f with SMTP id d9443c01a7336-1ef42e6d9c0mr66859535ad.9.1715392655780;
        Fri, 10 May 2024 18:57:35 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:6249:183c::26a:94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad61c7sm39075565ad.68.2024.05.10.18.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 18:57:35 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Qingfang Deng <qingfang.deng@siflower.com.cn>
Subject: [PATCH] riscv: do not select MODULE_SECTIONS by default
Date: Sat, 11 May 2024 09:57:25 +0800
Message-Id: <20240511015725.1162-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_185739_291158_383D7441 
X-CRM114-Status: GOOD (  10.24  )
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

From: Qingfang Deng <qingfang.deng@siflower.com.cn>

Since commit aad15bc85c18 ("riscv: Change code model of module to
medany to improve data accessing"), kernel modules have not been built
with -fPIC, so they wouldn't have R_RISCV_GOT_HI20 or R_RISCV_CALL_PLT
relocations, and handling of those relocations is unnecessary.

If RELOCATABLE=y, kernel modules will be built with -fPIE, which would
reintroduce said relocations, so only select MODULE_SECTIONS when
RELOCATABLE.

Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6bec1bce6586..3f92dd3b45d2 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -169,7 +169,6 @@ config RISCV
 	select LOCK_MM_AND_FIND_VMA
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && MMU
 	select MODULES_USE_ELF_RELA if MODULES
-	select MODULE_SECTIONS if MODULES
 	select OF
 	select OF_EARLY_FLATTREE
 	select OF_IRQ
@@ -858,6 +857,7 @@ config PARAVIRT_TIME_ACCOUNTING
 config RELOCATABLE
 	bool "Build a relocatable kernel"
 	depends on MMU && 64BIT && !XIP_KERNEL
+	select MODULE_SECTIONS if MODULES
 	help
           This builds a kernel as a Position Independent Executable (PIE),
           which retains all relocation metadata required to relocate the
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
