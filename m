Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7FCC7EE30
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 00:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVVqU4zoMlM0Tm1b8zOlY/Wnpxyc6QMfC8nKRBV6D04=; b=ERMB3+i81FpybM
	b3C9Zs3c69lWYB92uJaVuQxKDSzCQyFaQ5cwXd1IwE18qTEsHgWvDZWpktLQA/ZGiu545+wGEVvcZ
	L7hylotr8UIWMW/NVEFKMkyHUP22se6XDqqGl0xGwsyAfmEiLxDt+WhIeUyk6TGqxHcyW1AmYwo/V
	0Az2gw0yPypZcwtb1yMXhzUjbLtU6ej91lvASFUdGfUQHgg+tKKAYuFjaQMlFuOQVrgvuR6wKZg+x
	DpPU0XwwVQxR45whXARSGBR19j35vxCLFQf3IrnAsd4ZO+nRS06BWHcRe0B6gGeTkp5VmKVmx9M3S
	A7Hw1xqKKeKgaxymKuHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXAJK-00EeES-KT; Wed, 01 Mar 2023 00:27:10 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXAJF-00EeAr-HL
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 00:27:06 +0000
Received: by mail-qt1-x833.google.com with SMTP id cf14so12593076qtb.10
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 16:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677630421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/MyxgPKxQn9hh5x2nb//eurUMI1TwFNKVvwtxDYylE=;
        b=NuI2G4KbKwo/PAuNAKZEkDmoR0NVEBT6OEtd4HOsq+CmCK4Ggibq3XGzOgzN5EQD3z
         xjqzyRsrCzdMQP8aS4kOMaJ0nwd/49iGKls3+xfVo06TtW8v+kflV4YhcgE4+ryBD7+X
         LlNE1QAvjujKk9Tx1JLQtaPKvaYfX4APKtKUs3ADnrIGirku+vH6KDxhW3GvP0HfFTbu
         zf2kb5Sxdn01s3ZPaydtlW7PeYfXGOPRnLnYXhQJQwnWUvFL2H2myVNb2tSneF/H3Mav
         39T4L6VaQFOt1aGS5ELTfz4qr930VjYGQBiilNnaSAwJwGFno9NI7ATpVT+ZPhn9Oi8B
         CTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677630421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/MyxgPKxQn9hh5x2nb//eurUMI1TwFNKVvwtxDYylE=;
        b=YlZfySygVyAlBN1XQ2Ve8ZHNbtrsAL4SEYrteFJuKkb8YvRR5F4RT0ZG0RPwLzH79n
         WIE9bWUh7uw0XZGUrycnz5+DOzdzL8oY5cfFDnj3k0JV9dk4XelrC/b6lkT7vJciooPR
         Zcql7P1u/Ahs9E5TLWRxm4NZ93SQr2+FibEkrXBEeqVtJ85mF9xSNOyi+PM680qQF0T3
         DrRsmYWQLS8MtMGA/KKTcsg9ww3ac0gULoAmSzz/2wEdLGnI1k+zZEtfvbxwS0hx1Jo6
         D6k95cKF8rZKiaBiYVMzd8cuw9ag33rWICu+4sIk80a+jrxR6SukxNU1JpQ6JLqZNVul
         GFnA==
X-Gm-Message-State: AO0yUKVUyafNJufbJSNhCIZIHYLxJex3cCtFVUvmlwnZ/DzQ3zQ9c8xc
	eYwVE3NvBZ9kuGsZ4hgv252SPKtJC84=
X-Google-Smtp-Source: AK7set8V1wa1E6m4iqzrwXb7JVVMTDBwt0TSn/UDCQ5rLdFX0jxAYz/eYaCqUujiBmSzcznc6syVZA==
X-Received: by 2002:ac8:5e49:0:b0:3bf:afd1:8c98 with SMTP id i9-20020ac85e49000000b003bfafd18c98mr7916982qtx.0.1677630421189;
        Tue, 28 Feb 2023 16:27:01 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id t8-20020ac85888000000b003bb8c60cdf1sm7576698qta.78.2023.02.28.16.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 16:27:00 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Yimin Gu <ustcymgu@gmail.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v3 2/3] riscv: Kconfig: Allow RV32 to build with no MMU
Date: Tue, 28 Feb 2023 19:26:56 -0500
Message-Id: <20230301002657.352637-3-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_162705_599143_A8514779 
X-CRM114-Status: GOOD (  11.43  )
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

From: Yimin Gu <ustcymgu@gmail.com>

Some RISC-V 32bit cores do not have an MMU, and the kernel should be
able to build for them. This patch enables the RV32 to be built with
no MMU support.

Signed-off-by: Yimin Gu <ustcymgu@gmail.com>
CC: Jesse Taube <Mr.Bossman075@gmail.com>
Tested-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1->V2:
 - Fix typo in commit description
V2->V3:
 - No change
---
 arch/riscv/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c5e42cc37604..d1f661425790 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -177,8 +177,8 @@ config MMU
 
 config PAGE_OFFSET
 	hex
-	default 0xC0000000 if 32BIT
-	default 0x80000000 if 64BIT && !MMU
+	default 0xC0000000 if 32BIT && MMU
+	default 0x80000000 if !MMU
 	default 0xff60000000000000 if 64BIT
 
 config KASAN_SHADOW_OFFSET
@@ -279,7 +279,6 @@ config ARCH_RV32I
 	select GENERIC_LIB_ASHRDI3
 	select GENERIC_LIB_LSHRDI3
 	select GENERIC_LIB_UCMPDI2
-	select MMU
 
 config ARCH_RV64I
 	bool "RV64I"
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
