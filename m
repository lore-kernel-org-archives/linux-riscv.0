Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A61C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 10:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvOachjqGiqbvZcHlZ45m/DfzL4TLTIyRDRY3WeFPCM=; b=dI0nrwDOP+Q7ll
	bggzaBSgULXiSGyfFIf/OpbDeudY22nI3cbaeDpA6ctE6snR4/Jmv7qA4JRQKmyhs76ZcgSY52CQz
	GzuDKfGwolLqcJbkLyKTeBBHqGNZ7Eka2/lDrW+aCpGz11VuOxMjyMQua8sQ+qwRFKr2GOBmcNeHG
	3hZbUILRebysi5LWVzp6RQjljTJRSeUf/vQRK3UgIVt4o6Otl2wEFT4+/yelkTZRA7SaPoLSUPepN
	+o076qprQPPIbRzO8ExSx4XjJDBxvfCkESAR3SZX8/IxGHIMUv3XjnVGDfJ53BfGX+/hiD8G4a6il
	Fte6hFNAa1MNDjgoqusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muBhd-003TJP-Ex; Mon, 06 Dec 2021 10:58:37 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muBhZ-003TGy-B5
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 10:58:35 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E02583F1B2
 for <linux-riscv@lists.infradead.org>; Mon,  6 Dec 2021 10:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638788311;
 bh=vaFAezChlajkTZ7fI5kVmIBThbHyfEUEZ5Atc7Q1k0c=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=Jj3xp2pW1fRZUx8KDqhW4jW2QZA+5uRtR7dSuwpcPTTohZJMjHKBgIiIHRB67GUCY
 Jxej48s/iZHFIW2LUke5xPC9m2ugMLKWHIBk6B9DJoYjHR6Q7YV3FGRiq6dnXA4jj5
 ikaEFj9fO/PZgeShQQpHVk+POvt/z99tExSPwSeNmUOetPed4ay0wyDha8RdsqXU09
 ExrQYjR8dH2zM4Vb/4Yh684+HP1bCX74PEKAUaoC89gLRqeerQU69c9BuOU79mlxru
 DqOVDnRfC5frcPYeXtqEmVHHuScj3oTOqTpMP46jjhwcDgisxFAfm2u5vU9s5YTguR
 iU2ZCoRls3gUA==
Received: by mail-wr1-f69.google.com with SMTP id
 b1-20020a5d6341000000b001901ddd352eso1913517wrw.7
 for <linux-riscv@lists.infradead.org>; Mon, 06 Dec 2021 02:58:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vaFAezChlajkTZ7fI5kVmIBThbHyfEUEZ5Atc7Q1k0c=;
 b=g5MLpjcmIP1iH25HXZqeHhp7aLPGNqArwOUAS2btL0NbPBOjJSRsT5plE5G6lKu6Qw
 I3qwjQJ3zfxCJgYecRMtMCdYpn1NQy2wvlpHGY1AEQmDt1NxXOTfQLiPQDfX6EwJJPSC
 uLYSBjUUJ6/yAZkpLwesLZ2qR84ObtT2fS0T6TueV5tlV4ysoWGI0v7jrLOZqEAPWRhV
 SI8VgI3gyaktpRxp4NRFobtCI0i2bXfezdXPwiElLRCCdU78RRmIVU6NwJsaRct9jYPa
 K4dTuD58BsXs5yE2P6ootkIqh63N/P8gckRD5wEKznQ5jwDt/XQsGYoZwkbI6FT82XSk
 Xx7A==
X-Gm-Message-State: AOAM5324q09XR9/7YKzkr7f6Qp9reAujPqP9ihgfxF0hH9mwgmkvHu0E
 zmru25UaWPPx/Zm+NnlJHX5lGwsACWoXu1VuMBgi62s6cU7H6BUXqqEnTSYwjnUm4dxMQYvfTOT
 kUzSzb+Hnp2ZBvEnLc129q88bZz/yNEZXAgQZ3Gtw3209kw==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr42470483wrs.108.1638788310552; 
 Mon, 06 Dec 2021 02:58:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTo58Hg1PMnpuTdwL1M+XagtJxq1YdEIKgI5MBOpZMxGV21fm3kTBfxG4m0nNb6mKYd2DewQ==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr42470463wrs.108.1638788310400; 
 Mon, 06 Dec 2021 02:58:30 -0800 (PST)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr.
 [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id p27sm10378487wmi.28.2021.12.06.02.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 02:58:30 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@rivosinc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, panqinglin2020@iscas.ac.cn,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v3 11/13] Documentation: riscv: Add sv48 description to VM
 layout
Date: Mon,  6 Dec 2021 11:46:55 +0100
Message-Id: <20211206104657.433304-12-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_025833_570370_921151A7 
X-CRM114-Status: GOOD (  12.14  )
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

sv48 was just introduced, so add its virtual memory layout to the
documentation.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 Documentation/riscv/vm-layout.rst | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
index 1bd687b97104..5b36e45fef60 100644
--- a/Documentation/riscv/vm-layout.rst
+++ b/Documentation/riscv/vm-layout.rst
@@ -61,3 +61,39 @@ RISC-V Linux Kernel SV39
    ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, BPF
    ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
   __________________|____________|__________________|_________|____________________________________________________________
+
+
+RISC-V Linux Kernel SV48
+------------------------
+
+::
+
+ ========================================================================================================================
+      Start addr    |   Offset   |     End addr     |  Size   | VM area description
+ ========================================================================================================================
+                    |            |                  |         |
+   0000000000000000 |    0       | 00007fffffffffff |  128 TB | user-space virtual memory, different per mm
+  __________________|____________|__________________|_________|___________________________________________________________
+                    |            |                  |         |
+   0000800000000000 | +128    TB | ffff7fffffffffff | ~16M TB | ... huge, almost 64 bits wide hole of non-canonical
+                    |            |                  |         | virtual memory addresses up to the -128 TB
+                    |            |                  |         | starting offset of kernel mappings.
+  __________________|____________|__________________|_________|___________________________________________________________
+                                                              |
+                                                              | Kernel-space virtual memory, shared between all processes:
+  ____________________________________________________________|___________________________________________________________
+                    |            |                  |         |
+   ffff8d7ffee00000 |  -114.5 TB | ffff8d7ffeffffff |    2 MB | fixmap
+   ffff8d7fff000000 |  -114.5 TB | ffff8d7fffffffff |   16 MB | PCI io
+   ffff8d8000000000 |  -114.5 TB | ffff8f7fffffffff |    2 TB | vmemmap
+   ffff8f8000000000 |  -112.5 TB | ffffaf7fffffffff |   32 TB | vmalloc/ioremap space
+   ffffaf8000000000 |  -80.5  TB | ffffef7fffffffff |   64 TB | direct mapping of all physical memory
+   ffffef8000000000 |  -16.5  TB | fffffffeffffffff | 16.5 TB | kasan
+  __________________|____________|__________________|_________|____________________________________________________________
+                                                              |
+                                                              | Identical layout to the 39-bit one from here on:
+  ____________________________________________________________|____________________________________________________________
+                    |            |                  |         |
+   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, BPF
+   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
+  __________________|____________|__________________|_________|____________________________________________________________
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
