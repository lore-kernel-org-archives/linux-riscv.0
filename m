Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA47C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 15:10:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91B6061447
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 15:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91B6061447
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lZ6M9RtSLgmKBJy0wx5JHR0pLMZif1inSqyXDfyY+o8=; b=fHN6ge7TIRzZ7r65gb9+vJtj4Y
	vJ2RpRpaI6RSWw9OcfA8QRCtyqfbwVEXX8G5mY36NbM2+dUx0xds2UI8naWiLIDa5Jp9LVhz92FRg
	rGIkpKwwieBC4kCtCCsjal+G9WHI2rjhY4+IE8iKkKL6BWlAKGMvOhnR1WDlkN8xd/34v5eAiLbM/
	rDfnCXccCK8z8svvFgtHJ3RZNaCRT5a35TcZ4mUtBjSw9+NSIOA+2PmNxM19nl28sEjgeGB5QzzqY
	RnJeouHju4hB/CS5MLEfqq+QpZ7rR3opghu22SAlLLtwQkoG20DkTxsDgAtjp0+rhjLIP+d2dtciX
	ytHU6Xww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc8J0-005uPR-Ff; Thu, 29 Apr 2021 15:10:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc8Ix-005uP9-Hp
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 15:10:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=TKUKg5w8ha65td2l7eEuAAY266Y4z37siNIzDYX4QsA=; b=JlZ91C3H0nvR2QJTh2HHRvB08L
 50lRJSa0HACTodTA9C7bfqrgCnAS9HtRlipFr6z7Mc30Mzs8mICEREUDvYbdi1mjinTCShx81ZdU/
 KTCFLXaw/ct4FJq9KDwL3jeQMbdTQ2Ax8YGajkZS6zU3EuLIp2keF3QDE/nESFYJfMjqAqVTWH2ls
 T/5DKaa5Fd6B9fxY90m1DT4IVF9C9Y4smRkvKLjfgHmaBYB30dg86Sca8gLopVtRARARMMwC4e2Ye
 bb8XHXP2c1+Z/JnsQwyGc6puFPe0Y3a7eG7M4YY+gBGZ7DPnoiFcEDAaYg1dzzMUY5BWJpXcdlJO8
 AIupYmLA==;
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc8Iu-000iSX-IG
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 15:10:14 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
 by laurent.telenet-ops.be with bizsmtp
 id yfA6240094p6Y3801fA6tY; Thu, 29 Apr 2021 17:10:08 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lc8In-001HmU-J3; Thu, 29 Apr 2021 17:10:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lc8In-009dGx-34; Thu, 29 Apr 2021 17:10:05 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vitaly Wool <vitaly.wool@konsulko.com>, Alex Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] riscv: Consistify protect_kernel_linear_mapping_text_rodata()
 use
Date: Thu, 29 Apr 2021 17:10:04 +0200
Message-Id: <b89a090317cf26bbe1caaa3cfa513a789ece1b19.1619708711.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_081012_761371_A728F889 
X-CRM114-Status: GOOD (  10.61  )
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

The various uses of protect_kernel_linear_mapping_text_rodata() are
not consistent:
  - Its definition depends on "64BIT && !XIP_KERNEL",
  - Its forward declaration depends on MMU,
  - Its single caller depends on "STRICT_KERNEL_RWX && 64BIT && MMU &&
    !XIP_KERNEL".

Fix this by settling on the dependencies of the caller, which can be
simplified as STRICT_KERNEL_RWX depends on "MMU && !XIP_KERNEL".
Provide a dummy definition, as the caller is protected by
"IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)" instead of "#ifdef
CONFIG_STRICT_KERNEL_RWX".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Only tested on K210 (SiPeed MAIX BiT).
---
 arch/riscv/include/asm/set_memory.h | 7 ++++++-
 arch/riscv/kernel/setup.c           | 2 --
 arch/riscv/mm/init.c                | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index a9c56776fa0e74d6..086f757e8ba3cc69 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -17,7 +17,6 @@ int set_memory_x(unsigned long addr, int numpages);
 int set_memory_nx(unsigned long addr, int numpages);
 int set_memory_rw_nx(unsigned long addr, int numpages);
 void protect_kernel_text_data(void);
-void protect_kernel_linear_mapping_text_rodata(void);
 #else
 static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
@@ -27,6 +26,12 @@ static inline void protect_kernel_text_data(void) {}
 static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
 #endif
 
+#if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
+void protect_kernel_linear_mapping_text_rodata(void);
+#else
+static inline void protect_kernel_linear_mapping_text_rodata(void) {}
+#endif
+
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 bool kernel_page_present(struct page *page);
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 7b31779101f662e4..03901d3a8b027343 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -293,9 +293,7 @@ void __init setup_arch(char **cmdline_p)
 
 	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
 		protect_kernel_text_data();
-#if defined(CONFIG_64BIT) && defined(CONFIG_MMU) && !defined(CONFIG_XIP_KERNEL)
 		protect_kernel_linear_mapping_text_rodata();
-#endif
 	}
 
 #ifdef CONFIG_SWIOTLB
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 3ebc0f5d2b73b42b..6cc0421a5d0ef4a3 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -646,7 +646,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 #endif
 }
 
-#if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
+#if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
 void protect_kernel_linear_mapping_text_rodata(void)
 {
 	unsigned long text_start = (unsigned long)lm_alias(_start);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
