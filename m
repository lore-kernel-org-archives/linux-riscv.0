Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC3CCF6493
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Sep 2024 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8TZcwQV1x/GNFHri5PC2RILPW9GXGBmtQud1n9Q/cHg=; b=rjuvp17AXEUcar
	v4QJLF0gB2R7BWyj2M25AoWtXZAvUsEBukARMupYl7yHwp7DPnwyw6wf4dczBCLluhrLh8r+ZeVUM
	+eafMip4JeF7CpzLlB4zGOi402iRZjHBleILQlKR+CLGisFsVc4VHisEfbfq144W4PG9379TLjnEV
	fHYsLotyyJY2J4TPEqZdN7BDq3TD9mpYlKfPjZMzx4Cg58yMX08xqoHrtwV+vBLxtJJHTNAc5BTnY
	Dxt8mSDcNRv1Z/WTvmorQIEtSf3WOuwUiUCI1Od6NxbHqoSKUNvxBxhuQ1+QYgxf5/fR5l5CtrOt9
	zXkA5uRnFt1z366vDb+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suZkE-0000000DI6w-1PsY;
	Sat, 28 Sep 2024 15:52:30 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suZkC-0000000DI6Z-1e4g
	for linux-riscv@lists.infradead.org;
	Sat, 28 Sep 2024 15:52:29 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7191fb54147so2197923b3a.2
        for <linux-riscv@lists.infradead.org>; Sat, 28 Sep 2024 08:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727538747; x=1728143547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=31cV6dYT3qidEyqkEa39aDBCfZsli/mE/pREIaRt9hA=;
        b=T5srIeh6BJF3aqFWUSV2EcPDhQuYxRQ9dPkWT9WlRoOLKzwuOgOVxQ1FHlFqFCa4a5
         XWQYRWk/mnM4958/G2gPFAPDga7BSgagbM+MNrKUH/Ujhj2bfQWXCoXmVWS9l+WSpjWX
         hJ/UvcYLz3vOnev4O7YUvTpbpVbKTDL7SeQR/fl+L6WgbvheekQ4gucJ0QYSSQcx2qk2
         OS6cJw5L7jUPJSsXcrr5hb3TevbGNiA0hUexjg7sU2YEMWGwtMwsiyY2+84fxzqaHZZT
         MCUzLXREXxcZ/1tD74JHbs6TMjf2LLBYd1NJKVO6Z5gLadcUExpeQJZRlj+9EH5xGyUA
         g5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727538747; x=1728143547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31cV6dYT3qidEyqkEa39aDBCfZsli/mE/pREIaRt9hA=;
        b=WSu3kG12p0ZUHqWhbJ1d0hIExlh5ltQ14u0Qw/yRgyDnZD5QHeGFrnikgnKrSIGMZb
         1HJOn9EY1ZfQWPs5HzkyBWLz3eZlRgr1nuw4UKO8/mk1sQdcRMS8DI6hLXRklTZ31m95
         MWgYuEfvTKso9FZbQNdTsxz03NVPY+O0xDfFeH+r9CfnUo0wOEF5RgNDASB3F2e3RRDi
         frDy+fkPf6cGNoxcvFIi+XCVQj8NGJBT3YeLGSx1IlfvZVR9OHvPgIdMwHNIQ2Vi3YT8
         /FFegHwUR1L9ckuh2BMlZtqHwKpek1muqIJbxDx8BxNOgAipt+3DEGbBX0XQ5RJVxr/s
         FH2g==
X-Gm-Message-State: AOJu0YyXjNXkl+7fGoPXv3qWDf0JGvdph73smiHD45M1ZJmqjIcWR1X5
	KgIBDbFqpYR1sHTm4XRbGd2o1aWHITH8+VEkor5pKcLhOyWzls/FBH8m/29/gBg=
X-Google-Smtp-Source: AGHT+IGo41QndVYNPDZ3Gr8xHHyoN6YuGHQoCnDbofTLscHpUFB7Kuy7G9NTs+/akDeIfvAJmAAiow==
X-Received: by 2002:a05:6a00:3e1b:b0:718:d7ac:6342 with SMTP id d2e1a72fcca58-71b25f6a924mr10055905b3a.13.1727538746821;
        Sat, 28 Sep 2024 08:52:26 -0700 (PDT)
Received: from localhost ([112.13.110.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264c23b6sm3272105b3a.88.2024.09.28.08.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 08:52:26 -0700 (PDT)
From: Cheng Chao <cs.os.kernel@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	Cheng Chao <cs.os.kernel@gmail.com>
Subject: [PATCH] riscv: mm: check the SV39 rule
Date: Sat, 28 Sep 2024 23:52:19 +0800
Message-Id: <20240928155219.266866-1-cs.os.kernel@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_085228_454995_864787B7 
X-CRM114-Status: GOOD (  11.78  )
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

SV39 rule: the address of bits[63..39] should be the same as bit[38],
it is easy to violate if configure PAGE_OFFSET too small.
for instance, PAGE_OFFSET=0xffffffc0_0000_0000,
the FIXADDR_START will be the 0xfffffffb0_xxxx_xxxx,
bit[39] == 0'b1, bit[38] == 0'b0, when access the FIXADDR,
which cause the page fault.
It's difficult to debug, check it when compile is necessary.

Signed-off-by: Cheng Chao <cs.os.kernel@gmail.com>
---
 arch/riscv/mm/init.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index bfa2dea95354..a5fb3fc2b2db 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -119,7 +119,7 @@ static inline void print_mlt(char *name, unsigned long b, unsigned long t)
 
 static inline void print_ml(char *name, unsigned long b, unsigned long t)
 {
-	unsigned long diff = t - b;
+	unsigned long diff = t - b + 1;
 
 	if (IS_ENABLED(CONFIG_64BIT) && (diff >> LOG2_SZ_1T) >= 10)
 		print_mlt(name, b, t);
@@ -1387,6 +1387,12 @@ static void __init arch_reserve_crashkernel(void)
 
 void __init paging_init(void)
 {
+#ifdef CONFIG_64BIT
+	BUILD_BUG_ON_MSG((VA_BITS == VA_BITS_SV39) &&
+			(((FIXADDR_START & BIT(39)) >> 39)
+			 != ((FIXADDR_START & BIT(38)) >> 38)),
+			"violate SV39 rule: bits[63..39] should be same as bit[38]");
+#endif
 	setup_bootmem();
 	setup_vm_final();
 
-- 
2.26.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
