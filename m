Return-Path: <SRS0=tGDq=36=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0248FC3B184
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2020 08:35:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC966214DB
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2020 08:35:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jEoJtazd";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DDtmRvlY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC966214DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IAH21rRjZvmTngJjoV1HKPcK//riioA2iI4jMy/qJc8=; b=jEoJtazdU82tO8
	bmjiE6Y7C2tale51hZsYuPgHreXaVn+bbB/i8yi+35Me1UF22tZSJ3CMCd+SUJ2AhZX2boSBeMaAw
	bycy5SZ1cSCMwlYJV023cjKviktiZJohRGMsDF20l3HWoD29nNU8c7ENA7ROSxvaGguuUDYgVbpkZ
	pjKWRmiN0GhdxFl7JW10WWQUG6KBv3T+kaTtxkrkTR7qEENrvJ+uThjnm0IoxVYAqCpYTN4msXhhp
	Y5GDlpkxMxkohRCFwHlkNxasmWjKhI08DidXaZEo23aE+BgufApq6TrLhss3O4N07gu844RyTYU5k
	Pw7zytaaI/0ONSYvqXYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j14XM-0001Qa-EV; Mon, 10 Feb 2020 08:35:24 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j14XJ-0001Q4-1q
 for linux-riscv@lists.infradead.org; Mon, 10 Feb 2020 08:35:22 +0000
Received: by mail-pf1-x441.google.com with SMTP id i6so3372067pfc.1
 for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2020 00:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IAH21rRjZvmTngJjoV1HKPcK//riioA2iI4jMy/qJc8=;
 b=DDtmRvlYqXkEKZHw98V0R01Uu1kN9/ARvVSbOe2ybfFV9gwpPvK+IPY6zymXr7pYXU
 PNvfULtk/HbkzlHvzBMkwzCSteRUMDegujbsd/8+33JMkZ9apZr9LCihHlbgcsStys+s
 KvlPpITUlz2A2lC4j6WEMr6kZJavnEFJSOrvMk/Mqrq2PiINYTCOZsJQwwhELxehy2Dg
 clfzB+S/FCQhfWnZ+6bTq7KQ1JivzzjwepeQStaMJ+Nm+4X2JQCEOE/jKvuRGKICaevX
 JhZNjX4svsJV8o9Ex4NKON2HAx/Kc2KyF7Z73HAt0eSyM1pIxYlUJ6Z5cd359+ev6ehX
 4BQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IAH21rRjZvmTngJjoV1HKPcK//riioA2iI4jMy/qJc8=;
 b=gNxSXs/Iwf4fsUtnfoIAXBVaXpp0M2md8G7TagO39W0aUkJv9FgHkhMXSiiiFGOSpj
 s1op3rlthoWgNSLkoCXrJVjUPGBmVzYUm0zopg7bZ8z83GsT8+J9oBC0XjvwB8E8XaZI
 wMXpdqitGZyudoCfH0OIS3nrooOehtlIRqvB9AXBc1XCkUSPK9yN+eo9OYxAkKAuyQXG
 uGqmkygosP0ffBNuw/qsR1miIxsgXi0xsCtR9y6LoK20h36pyFCPH9rZG1la55mHs840
 fGkMd+0ve8bTyOf8hdMHw0LeV7GMZcxZCBJ7ksHToEO78ax4/dLxXidrtOw75s/YS28U
 eC3A==
X-Gm-Message-State: APjAAAUW2teKAqjrvgSmN6/7V1Q8ryj8yaV2B1vF+d1Bn9SFCkCOCeCf
 fBktJfYZgQj7vhRsjrIkQcv1zw==
X-Google-Smtp-Source: APXvYqxUgZWp9tHcFfptZfFiaukDBc1kZJaHKTL4vCwtJmXCYdFm7baLfsW3dKm+41KT3uZB/75uvw==
X-Received: by 2002:aa7:8bda:: with SMTP id s26mr125990pfd.194.1581323720533; 
 Mon, 10 Feb 2020 00:35:20 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id q8sm10582409pje.2.2020.02.10.00.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 00:35:19 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] RISC-V page table dumper
Date: Mon, 10 Feb 2020 16:35:13 +0800
Message-Id: <20200210083515.10864-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_003521_133328_4FF34E10 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch contains the support for dumping the page tables, and it's
implemented on top of the generic page table dumper patch set. The generic
page table dumper patch set is merged at 5.6-rc1.

This patch also depends on the fix about KASAN issue which causes the
segmentation fault. (https://patchwork.kernel.org/patch/11372493/)

Zong Li (2):
  riscv: Add support to dump the kernel page tables
  riscv: Use macro definition instead of magic number

 arch/riscv/Kconfig               |   1 +
 arch/riscv/include/asm/kasan.h   |   2 +-
 arch/riscv/include/asm/pgtable.h |  10 +
 arch/riscv/include/asm/ptdump.h  |  11 ++
 arch/riscv/mm/Makefile           |   1 +
 arch/riscv/mm/ptdump.c           | 317 +++++++++++++++++++++++++++++++
 6 files changed, 341 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/ptdump.h
 create mode 100644 arch/riscv/mm/ptdump.c

-- 
2.25.0


