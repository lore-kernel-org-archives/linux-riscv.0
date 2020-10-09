Return-Path: <SRS0=bFkC=DQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25351C433E7
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 21:14:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7D312240C
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 21:14:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eAnR15E2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="HqQEFrwO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7D312240C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lcH56+sV20xtqifd8jKwO3GVa+COyrP6AVQtNvFRElk=; b=eAnR15E2ZX3LFx1K6GgefIPAC
	PvUy4bUe/re6KZrEaHMeSc1o67yePS7n8kgGhWDvJgTT+YMe6ho1ALpEcgo54U/+jmlS1wHEW/ScN
	HlUHzQ2e7eTYCzZvtFYl3U0pGema837hJVcPCZFzUFybnddBXf6lfNDTi+B+XEW63+LFbveUM22pb
	LTtR0PB2yTnlfPy/LSZ7DuvElEnoOWxx7fIaYWWd6Ab2LvBgx2dzMZczAW/D089XC1Zerxfo2vO6V
	HHMd/Pc2SPijKmymQBU7C8iYLES3XR71lOIJf1sl/HN1meUfBBrmVRWdMPlqKDm/vPfHAMgy/9JU3
	h7+LvTEBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQziD-0004rB-TA; Fri, 09 Oct 2020 21:14:01 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQzi9-0004kN-Hy
 for linux-riscv@lists.infradead.org; Fri, 09 Oct 2020 21:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1602278037; x=1633814037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fglb0o2Ozn6JOzVy78SpXXGYj0jpbArC9/S0MZnBZpA=;
 b=HqQEFrwODA4fmIltDwMOW2juYxJL4+ictpx7Cckx9g50E8iYX68Hjwlx
 BXYsFxu5Pqjs3t434+drxSIolUq60r/dW45DApdeiY4vnGo8oAd+r5m7o
 NYovv96gHYK1sItQjWsBtuRirG6pUTEK37o6RszGFsEge2zJACXfdtO9R
 jdDZFYBJ5uhKRDao/DFJckfPl25vvzGw+ojxfHDB7dFsnR9jCVoP1FPLT
 DTNHSCkJm8+RWsXNHEq2fvfr1ejmNAIeidP5OvplsujRCODLBT99KdylH
 gdnAoR75YosFMS7s3py78yqUJyrWA1sK7KzrWAFeIFITwGwRzrLTLk1FZ w==;
IronPort-SDR: hNH+4TlG6Pgep2JCYBUV91vV3Ni+pjoHpOPGxa1OWQfr+xOPT3kguOsLy1MRIQv/Fk3fkwpo76
 /q7X+RClTgsrGWQhpRpac5bwrU+hFTi8H6ffvjSZoOFQpk9YpcBLVU8IdfEXFCEaVb7JJVsq9q
 hS9CF+7RvkUsF5DZF2SaOvex7y9Qk94oS6QBBnUT3QjLfbQZykfKLu1ly8JAeoea+40sxKdCRc
 n1gaxCqKwnaA2GZW4x/YrbKbN6Sc+SgbfYUfv/p+iv8Ddfu6rSaqAja4UAzDqQn+I6klupq/CX
 B28=
X-IronPort-AV: E=Sophos;i="5.77,356,1596470400"; d="scan'208";a="149406016"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Oct 2020 05:13:54 +0800
IronPort-SDR: dbPRlWzNr4rOGZ0pnHrNpg1UUCPYR12Eq/b62JlJzl14iRgSjHZ3N8IHbKZ8wWwo8Wp+/tgp+q
 cnKp2a9uj7uzGhBVl0h07uFfb3ezGqWIJazCfzVvXwQl+pWLqQJLgDFX77/vm7naYt3qRaesqP
 UQnmHMELv1ZSJyTdUD4QH9c481QbvrSlB1KLlASdkQeW7iy7/Axvxmxgw3G+5OcShcd8XAIwiq
 ZxUIyVj4fAEKwUwy74BGzGtpL+DkXZyhXhW6WBns6XyGJXHDlu2wW96A0+TzHvPadAN+RBfHyU
 8KTFk5QIdMXIkHlxjdQw/X+6
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 13:59:42 -0700
IronPort-SDR: eXGMo36/52VIraPdKKeyD28xmyCV+mQZPzhV/YTH64o581o6ScGk7bLiN93yXBMQTCkjGuOkms
 0N3E+GW1tdh1bVCCL+QBeaHOw6asvHx1UicY9iUd+c7IwJC+woP9ogmP4SjWFEqSXWoZ68n8AD
 O7Altp7APqErBc3jAA0g2uQ7iaM6hBC35fHXn6hUhEGKsJKLgTASVOqhsG+/UTKMHTj6+gSF8l
 4Q/1ezkRYQmZ27+AEIEptvxYcveQOB3bPouGAM9EXcXwnvA526DJKdotAeu/3T6TgoxTKknKj1
 H+E=
WDCIronportException: Internal
Received: from usa003000.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.38])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Oct 2020 14:13:54 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] RISC-V: Enforce protections for kernel sections early
Date: Fri,  9 Oct 2020 14:13:42 -0700
Message-Id: <20201009211344.2358688-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201009211344.2358688-1-atish.patra@wdc.com>
References: <20201009211344.2358688-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_171357_740371_A381DDC5 
X-CRM114-Status: GOOD (  15.16  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Atish Patra <atish.patra@wdc.com>, Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>,
 Michel Lespinasse <walken@google.com>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, all memblocks are mapped with PAGE_KERNEL_EXEC and the strict
permissions are only enforced after /init starts. This leaves the kernel
vulnerable from possible buggy built-in modules.

Apply permissions to individual sections as early as possible.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/set_memory.h |  2 ++
 arch/riscv/kernel/setup.c           |  2 ++
 arch/riscv/mm/init.c                | 11 +++++++++--
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index 4c5bae7ca01c..4cc3a4e2afd3 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -15,11 +15,13 @@ int set_memory_ro(unsigned long addr, int numpages);
 int set_memory_rw(unsigned long addr, int numpages);
 int set_memory_x(unsigned long addr, int numpages);
 int set_memory_nx(unsigned long addr, int numpages);
+void protect_kernel_text_data(void);
 #else
 static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
+static inline void protect_kernel_text_data(void) {};
 #endif
 
 int set_direct_map_invalid_noflush(struct page *page);
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index a5cac440aadf..4176a2affd1d 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -23,6 +23,7 @@
 #include <asm/cpu_ops.h>
 #include <asm/early_ioremap.h>
 #include <asm/setup.h>
+#include <asm/set_memory.h>
 #include <asm/sections.h>
 #include <asm/sbi.h>
 #include <asm/tlbflush.h>
@@ -93,6 +94,7 @@ void __init setup_arch(char **cmdline_p)
 #if IS_ENABLED(CONFIG_RISCV_SBI)
 	sbi_init();
 #endif
+	protect_kernel_text_data();
 #ifdef CONFIG_SWIOTLB
 	swiotlb_init(1);
 #endif
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index c888c4470b34..7859a1d1b34d 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -623,7 +623,7 @@ static inline void setup_vm_final(void)
 #endif /* CONFIG_MMU */
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
-void mark_rodata_ro(void)
+void protect_kernel_text_data(void)
 {
 	unsigned long text_start = (unsigned long)_text;
 	unsigned long text_end = (unsigned long)_etext;
@@ -632,9 +632,16 @@ void mark_rodata_ro(void)
 	unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
 
 	set_memory_ro(text_start, (text_end - text_start) >> PAGE_SHIFT);
-	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
 	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
 	set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
+}
+
+void mark_rodata_ro(void)
+{
+	unsigned long rodata_start = (unsigned long)__start_rodata;
+	unsigned long data_start = (unsigned long)_data;
+
+	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
 
 	debug_checkwx();
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
