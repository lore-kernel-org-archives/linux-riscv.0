Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5A8C47DD3
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 21:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IKIDLkUB99sUUGT4lOSeIYcWavLorWJy2xIfsfEl3YM=; b=ANG5QT+26W+ktL
	91/EX6axRqpIStbAd8qA0Daep1hJ5jtd7OSitMcuZtRik+NzCCFPYQvQFSDGj9IForbpgTR0LXO1A
	Q0+s3I3m2humB/nCg7PH3ZG1rXHgGsUvzu9CHJXimQU28ppZeHTEplgI7yXvEH9yz0erAuafyV3UJ
	1aIwuxxsLBG7dZdB4awWZYIx2vrty5d57qBPSdXUM1ei9x473W3bfdS1RLR+KHkWQizSW0Rq1mJ+L
	Ovs4j67jIVX+YMvTwYJajepR11BmQjalw71FncPYxQt4jJQ1YIoE3ot1eG54t3ic7psHvSFbs8V0h
	UQhahTMi8CMoAr7/wZ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQZpL-003tdv-34;
	Thu, 18 Jan 2024 21:21:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQZpH-003tc3-19
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 21:21:30 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40e60e135a7so923165e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jan 2024 13:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705612885; x=1706217685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=urN5IOlkkqGseby2zF94lkjsWOAoFsi6eWXRkVQaSnc=;
        b=QH678YD9lcS/iIEFs+JFPxpOOkEYFIQo0TTaF6ajv6Ag1YOAdaQXs8I9UK7Wxv21bU
         UD9rrG4m4+NbjNaxfCxte81DunuwqLgQfMhLHdD+32tr8Wcpb/lQk2lwyElbMGW61XZE
         CzCgRIXSjQEb+XfP0dYnO1pvwXqdct/cg5Z5NziV4R6iMsvji/ySEsgWky1jLcsS+N9f
         EK8DNTjxFSposND17fRd/j5VzrlWvTBDLJWKCB1vyMo2EQg1RRNbMYfyeDgnzw69ad4P
         cfNNab04X79IsQ3QJ70tL1vD/o1iSY+jisNmuqRCuZhFBs92mQZb1hkNCX8h3y+7dxEA
         YeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705612885; x=1706217685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urN5IOlkkqGseby2zF94lkjsWOAoFsi6eWXRkVQaSnc=;
        b=kNFCmJI7qBZTfyxNtLfiuGOyfKnORhLrOWQSWoZnjletksZdau7/6R/8gRYDSwlk88
         RF/v2KiqRF7WCW1vwvtUM1UqLqSblyztECoEZFpKoelgH6hJtKthHZt15RCRIC4WE5d2
         gct5P+i1lyFRV8xzBtRvlXpD4i7O4puG7iFZCwOUtqU87OTBz8tFWHPoF9EbKXk3lq1R
         og32RmMsvDt4QBDMjadOxAgOp39Biga7H9nhVw7MYrbn4YVWUQPN300FI/LRnx5LgRra
         9jO1GU2Xvp2GFvaX1/LjhPPs0OkMMTwFyEAhxkHASQFvKEG1Ef6j0yklyU4bfs7l+oSv
         dDnQ==
X-Gm-Message-State: AOJu0Yw8NQQfgDzU0F8OvwhJusoBchFhKerUm8F9J6dQAKQg8LloW2RG
	WuCzRVJL5jvg7mCKZYrIVhtV0sddlDqlk9gzvK3jtF7nXFY5qSoCwkaVzq55jMU=
X-Google-Smtp-Source: AGHT+IGT2HKqFx5QAe2KTAwWSlOY74v3tpR9NOljC/IgWxHa4M77k5iJTiBdsA6Jkp3CA5L9pfsrWA==
X-Received: by 2002:a05:600c:6557:b0:40e:52fa:9e5f with SMTP id dn23-20020a05600c655700b0040e52fa9e5fmr909250wmb.63.1705612884943;
        Thu, 18 Jan 2024 13:21:24 -0800 (PST)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id q20-20020a05600c46d400b0040e395cd20bsm30740992wmo.7.2024.01.18.13.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 13:21:24 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Frederik Haxel <haxel@fzi.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Fix build error on rv32 + XIP
Date: Thu, 18 Jan 2024 22:21:20 +0100
Message-Id: <20240118212120.2087803-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_132127_606630_5F30B331 
X-CRM114-Status: GOOD (  10.98  )
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

commit 66f1e6809397 ("riscv: Make XIP bootable again") restricted page
offset to the sv39 page offset instead of the default sv57, which makes
sense since probably the platforms that target XIP kernels do not
support anything else than sv39 and we do not try to find out the
largest address space supported on XIP kernels (ie set_satp_mode()).

But PAGE_OFFSET_L3 is not defined for rv32, so fix the build error by
restoring the previous behaviour which picks CONFIG_PAGE_OFFSET for rv32.

Fixes: 66f1e6809397 ("riscv: Make XIP bootable again")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/linux-riscv/344dca85-5c48-44e1-bc64-4fa7973edd12@infradead.org/T/#u
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/init.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index f533dd667a83..32cad6a65ccd 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1060,7 +1060,11 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	kernel_map.virt_addr = KERNEL_LINK_ADDR + kernel_map.virt_offset;
 
 #ifdef CONFIG_XIP_KERNEL
+#ifdef CONFIG_64BIT
 	kernel_map.page_offset = PAGE_OFFSET_L3;
+#else
+	kernel_map.page_offset = _AC(CONFIG_PAGE_OFFSET, UL);
+#endif
 	kernel_map.xiprom = (uintptr_t)CONFIG_XIP_PHYS_ADDR;
 	kernel_map.xiprom_sz = (uintptr_t)(&_exiprom) - (uintptr_t)(&_xiprom);
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
