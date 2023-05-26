Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C61CC7EE2C
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 15:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AE62atrmPVHmcSDSKZfiuTJjA4mvo/c/8WNMZunoGLA=; b=gIPdAmBCw0IhN4
	r98wF09GwP3/mPImGifEJkMzvQ2ytcWilkgqmEC1iGcBErm1gAU09nwhDmNEZYGlFPBl/3AIEtU8d
	ps4RxtnXxE/yhknLSaRdJbBy7c8/6RlkFvvn9ojN0EdSlhSjqZumoAHuBpU3gJF3y61SgChIYM2Gj
	4JUy8nHczgWNgbCihkDpVmaryPmTIpAsEA4/8EHA2ZHTF5NyF2/FQLldoAEOEM/BzCJKLUfxbJ74h
	/603PzwrBIElnVTRP9WsuTFquXmMLz8dYco827p1oUtuz2EeL8RbN+R+MHCzp4HylKsI/8zXZSnjo
	bPrCUxhzLPZkbmQdGB+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ZeK-0031MH-15;
	Fri, 26 May 2023 15:46:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ZeH-0031KZ-2F
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 15:46:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f6da07feb2so10275835e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 May 2023 08:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685115994; x=1687707994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3GWh9UDKye2M20srh+R8Vryxrum2NkiwrFA9635wntA=;
        b=mAnILZNnk/4CYo5pVG/iS9vkO1SnDeZwD3+xRXH7NanqhZoZeSn8FMqcBtzJa+Hi/t
         G3Y9tZzZSSCZG0Q5rnyuc3pFJgdNCFFQaxZe9O84iYBuGfDwIM05oLvxa2byTdLYn50n
         8CJY85sep/QmwfdU67veyl4OfaBn2sNIwLEezvBypEiboJ0zoOM5VulhN7SNd8GhS3BT
         5kEe3M8tWLz5VysifPEsu7Im0BUycU+q0J/6alQywOUuyWNIWatLD+3c3ymh2ILWkWWD
         kINojqleKsckPtypyHuNZF86nn5ouDQumSUmuKOHKPMMAPQCjdheF2PNSsyZRjJY4WTu
         qD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685115994; x=1687707994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GWh9UDKye2M20srh+R8Vryxrum2NkiwrFA9635wntA=;
        b=UBdnuJD54XRougN8NRppicm0hJDt0xySyQR8xneSNlMFEtnmelJTdFQV4ojANEDih3
         OSflYEZp9gtGZdntqzv3eR7QNjpKednqMDa6Coimm85hccFjZ26dQTyu/B4j5B8LWR+C
         7s79toCPx5DpzEfyx9oJhdCUb6/ZQeHfgUT2K0Ri8lf+T5C6ugSxXDLsApf0yfTCYc4g
         9dK25cqsGcl1N+/c7TCBxlo9MgeXPpLMxRLZD0onBe0+JSfBKCLIs/9Fk09AGq16p4+l
         MoRh9perZmR5Bw8d4SQCe2HhWnEMYCwHnT7GFXbz21jclWDeKb7oyG8+rRJSUiJHHwnZ
         lUWg==
X-Gm-Message-State: AC+VfDx/J1FKXGE5IjGGe/GD3O9ISNB7BXjZVJiWCHdgrB6AXt8FvCSn
	XxwTJrrL3VX3iHBVyp8MYfPlaw==
X-Google-Smtp-Source: ACHHUZ5XXs2GMoQKsr/YnhgTOA+ohouMlIaRXuTLbaMqGUWjzcoGSbojgLOVlZ4NceYDJk6KEsMlkA==
X-Received: by 2002:a05:600c:2197:b0:3f6:787:5e53 with SMTP id e23-20020a05600c219700b003f607875e53mr1969948wme.20.1685115994303;
        Fri, 26 May 2023 08:46:34 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id f10-20020a7bc8ca000000b003f42ceb3bf4sm5562995wml.32.2023.05.26.08.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 08:46:34 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Schwab <schwab@linux-m68k.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes] riscv: Fix relocatable kernels with early alternatives using -fno-pie
Date: Fri, 26 May 2023 17:46:30 +0200
Message-Id: <20230526154630.289374-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_084637_734305_CF24BA60 
X-CRM114-Status: GOOD (  11.29  )
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

Early alternatives are called with the mmu disabled, and then should not
access any global symbols through the GOT since it requires relocations,
relocations that we do before but *virtually*. So only use medany code
model for this early code.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

Note that I'm not very happy with this fix, I think we need to put more
effort into "harmonizing" this very early code (ie before the mmu is
enabled) as it is spread between different locations and compiled
differently. I'll work on that later, but for now, this fix does what is
needed to work (from my testing at least). Any Tested-by on the Unmatched
and T-head boards is welcome!

 arch/riscv/errata/Makefile | 4 ++++
 arch/riscv/kernel/Makefile | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
index a1055965fbee..7b2637c8c332 100644
--- a/arch/riscv/errata/Makefile
+++ b/arch/riscv/errata/Makefile
@@ -1,2 +1,6 @@
+ifdef CONFIG_RELOCATABLE
+KBUILD_CFLAGS += -fno-pie
+endif
+
 obj-$(CONFIG_ERRATA_SIFIVE) += sifive/
 obj-$(CONFIG_ERRATA_THEAD) += thead/
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index fbdccc21418a..153864e4f399 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -23,6 +23,10 @@ ifdef CONFIG_FTRACE
 CFLAGS_REMOVE_alternative.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_cpufeature.o = $(CC_FLAGS_FTRACE)
 endif
+ifdef CONFIG_RELOCATABLE
+CFLAGS_alternative.o += -fno-pie
+CFLAGS_cpufeature.o += -fno-pie
+endif
 ifdef CONFIG_KASAN
 KASAN_SANITIZE_alternative.o := n
 KASAN_SANITIZE_cpufeature.o := n
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
