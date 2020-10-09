Return-Path: <SRS0=bFkC=DQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99533C433E7
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 21:14:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 334722240A
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 21:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LlYVT2Xt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="jxqX9Ib3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 334722240A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EFyU15w+pQR3MQk94TN3Rol9+FXkj3AeeWwxNBLHNQ0=; b=LlYVT2Xt0vR3Ba3THucXtSTYa
	jsPaNFfYclxS9q1eD/xspzX1OTQhq7/25qReiOxOaSOYSe+dvv3/QYc3UqdEVWdJLnNpX0ASMhIlo
	17SQ4tc9qIsa33Xhmt+qbHKAifq1slFdm9arX5Wf5Lg/RjLhjJcDvVyG+0LZY9yazsShDUbSWrmrr
	O6NipcvKJxJyazznWh6hY6v4676VCVm++sMLag7FJu5YZBwPsxv44p0rVwkQfiKTraek19sn7XYBg
	ynSqrzc07pIESPYnBMLKcHsj04eTuj5TMd1/KRtIkM4lJj3B2ZOESa7hc0X3XL39/O5H7IikbgOrA
	MwrK9b5cw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQziE-0004sV-DG; Fri, 09 Oct 2020 21:14:02 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQzi9-0004kL-J2
 for linux-riscv@lists.infradead.org; Fri, 09 Oct 2020 21:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1602278037; x=1633814037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/rFWaVS2Mp29X2G5njahMGadr4BBV3Wqr3D/UpzWpM8=;
 b=jxqX9Ib3lPpMXjvo6JJBYJzvRmtq51oafpoukB1eeWh9aaCWBYSbiyjH
 C5UmjSBDxpkEsfjGqmTieG7WH/Slslj/eJpyLnnPjgGPyFAZ21d6ZENZE
 n+yWTLOXeeu4TV7ZubQ/AwlHywEgSSh0KiXNE2mk1s7DjboWQWBlL+fM+
 dCdqseB9PflFU1YmS9AUosHjZSbecF5MR6FhHeRXdy6++ifJLhLWg8r6i
 mQ92Xl51bfhWbwmsDSBnYG7CcNOTpkABDBW5kLqgrg7WefFvvx4+SGiJY
 z6T8c1C3qQgX/f3M37kEa8dTJm2z+Ziuv2Z2kIKk3PsxYgn2DySzi5jR0 w==;
IronPort-SDR: yKqN7uN1anlpKxsDgMeWi8EX8cGeagh66ll3hpqoE9wpPpWQt5TE9aj5FGF+5x/NhsqkAk5TlF
 mqDEmIOXv/XXDMlzaRh9GnE2CSCwkdiHdpY9chy3mIXNnGsrGW2NWUXe9EFvxJm5c/pMRao+Q/
 CL2jMp44yj6TdKCiD9k9ocfMgDklNoHYH89xPCCsjNAqzB156qignvdACPNHI4kFiWEwS03ybf
 ubtE1Gbdp0YOG9QsAcO3HHG32/BO3jIxYRNC6pBqjXS14GudF2OHdw6Mu/DLJLIpgXS4AmDGKT
 xKc=
X-IronPort-AV: E=Sophos;i="5.77,356,1596470400"; d="scan'208";a="149406018"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Oct 2020 05:13:55 +0800
IronPort-SDR: X+mRQPuXPVbJNkbfSz9S7dnmTN4K0vGAUTkX+naiMxSVs/EHz5Tj7qIzWgq2zYda7cExGDJFYU
 IYfeBT3dQfVb+shGJXB422KD4mavW4/8P0gGNB94QU6Sn67ITf0S02Tq2XeBasUOwZFaSM1qjH
 aZ9Twx1d4id9prdAXQLfSF1igPcNLLELgakKGauqJFMm/fBzQYZ4ISchv2geve4bdh315a554F
 BkBSfoAfx0pm4G5fhSZXQBJCsuwq22soxe3YuCdruhKqe0KPpc8tgv2prXBv1swMIowPsBPLbm
 PCHw80YPfOfl1PJmLwlO6F8H
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 13:59:42 -0700
IronPort-SDR: vm6/p5xIqey4ku5y72/6cCg/OOc897k5XjcVj4FdaEbbZDVCqcq4mtvLumHn2E24vNG6BFLfrL
 912oWzPCuZmN2zDXb3PgxZBnOqpcCPq9fMDZBxTuUudr23AxRDHvlHa/zPDeiMfZxxDFhvTuky
 7czWnLbJZ6V5eBNSjxQCyeAoKDbjENsMPgEGOrZXdrH8gm1AKioXf1z5JKxljqEWNrxJhp/uho
 Giuf2oHZim1ErI19qM5Uuo/QkTDEP+CwFfP7hmgoD3GA3kPXZTihlsKZfLn55pv/KHYwvJ9z++
 1UA=
WDCIronportException: Internal
Received: from usa003000.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.38])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Oct 2020 14:13:55 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] RISC-V: Protect .init.text & .init.data
Date: Fri,  9 Oct 2020 14:13:43 -0700
Message-Id: <20201009211344.2358688-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201009211344.2358688-1-atish.patra@wdc.com>
References: <20201009211344.2358688-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_171357_812589_89B53303 
X-CRM114-Status: GOOD (  16.98  )
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

Currently, .init.text & .init.data are intermixed which makes it impossible
apply different permissions to them. .init.data shouldn't need exec
permissions while .init.text shouldn't have write permission.

Keep them in separate sections so that different permissions are applied to
each section. This improves the kernel protection under
CONFIG_STRICT_KERNEL_RWX. We also need to restore the permissions for the
entire _init section after it is freed so that those pages can be used for
other purpose.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/sections.h   |  2 ++
 arch/riscv/include/asm/set_memory.h |  2 ++
 arch/riscv/kernel/setup.c           |  4 ++++
 arch/riscv/kernel/vmlinux.lds.S     | 10 +++++++++-
 arch/riscv/mm/init.c                |  6 ++++++
 arch/riscv/mm/pageattr.c            |  6 ++++++
 6 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
index d60802bfafbc..730d2c4a844d 100644
--- a/arch/riscv/include/asm/sections.h
+++ b/arch/riscv/include/asm/sections.h
@@ -10,6 +10,8 @@
 #include <asm-generic/sections.h>
 extern char _start[];
 extern char _start_kernel[];
+extern char __init_data_begin[], __init_data_end[];
+extern char __init_text_begin[], __init_text_end[];
 
 extern bool init_mem_is_free;
 
diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index 4cc3a4e2afd3..913429c9c1ae 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -15,6 +15,7 @@ int set_memory_ro(unsigned long addr, int numpages);
 int set_memory_rw(unsigned long addr, int numpages);
 int set_memory_x(unsigned long addr, int numpages);
 int set_memory_nx(unsigned long addr, int numpages);
+int set_memory_default(unsigned long addr, int numpages);
 void protect_kernel_text_data(void);
 #else
 static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
@@ -22,6 +23,7 @@ static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
 static inline void protect_kernel_text_data(void) {};
+static inline int set_memory_default(unsigned long addr, int numpages) { return 0; }
 #endif
 
 int set_direct_map_invalid_noflush(struct page *page);
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 4176a2affd1d..b8a35ef0eab0 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -129,6 +129,10 @@ bool init_mem_is_free = false;
 
 void free_initmem(void)
 {
+	unsigned long init_begin = (unsigned long)__init_begin;
+	unsigned long init_end = (unsigned long)__init_end;
+
+	set_memory_default(init_begin, (init_end - init_begin) >> PAGE_SHIFT);
 	free_initmem_default(POISON_FREE_INITMEM);
 	init_mem_is_free = true;
 }
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 0807633f0dc8..15b9882588ae 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -30,8 +30,8 @@ SECTIONS
 	. = ALIGN(PAGE_SIZE);
 
 	__init_begin = .;
+	__init_text_begin = .;
 	INIT_TEXT_SECTION(PAGE_SIZE)
-	INIT_DATA_SECTION(16)
 	. = ALIGN(8);
 	__soc_early_init_table : {
 		__soc_early_init_table_start = .;
@@ -48,11 +48,19 @@ SECTIONS
 	{
 		EXIT_TEXT
 	}
+
+	__init_text_end = .;
+	. = ALIGN(SECTION_ALIGN);
+	/* Start of init data section */
+	__init_data_begin = .;
+	INIT_DATA_SECTION(16)
 	.exit.data :
 	{
 		EXIT_DATA
 	}
 	PERCPU_SECTION(L1_CACHE_BYTES)
+
+	__init_data_end = .;
 	__init_end = .;
 
 	. = ALIGN(SECTION_ALIGN);
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 7859a1d1b34d..3ef0eafcc7c7 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -627,11 +627,17 @@ void protect_kernel_text_data(void)
 {
 	unsigned long text_start = (unsigned long)_text;
 	unsigned long text_end = (unsigned long)_etext;
+	unsigned long init_text_start = (unsigned long)__init_text_begin;
+	unsigned long init_text_end = (unsigned long)__init_text_end;
+	unsigned long init_data_start = (unsigned long)__init_data_begin;
+	unsigned long init_data_end = (unsigned long)__init_data_end;
 	unsigned long rodata_start = (unsigned long)__start_rodata;
 	unsigned long data_start = (unsigned long)_data;
 	unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
 
+	set_memory_ro(init_text_start, (init_text_end - init_text_start) >> PAGE_SHIFT);
 	set_memory_ro(text_start, (text_end - text_start) >> PAGE_SHIFT);
+	set_memory_nx(init_data_start, (init_data_end - init_data_start) >> PAGE_SHIFT);
 	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
 	set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
 }
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 19fecb362d81..aecedaf086ab 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -128,6 +128,12 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 	return ret;
 }
 
+int set_memory_default(unsigned long addr, int numpages)
+{
+	return __set_memory(addr, numpages, __pgprot(_PAGE_KERNEL | _PAGE_EXEC),
+			    __pgprot(0));
+}
+
 int set_memory_ro(unsigned long addr, int numpages)
 {
 	return __set_memory(addr, numpages, __pgprot(_PAGE_READ),
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
