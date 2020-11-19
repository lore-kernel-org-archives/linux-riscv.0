Return-Path: <SRS0=5I1x=EZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D917AC5519F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 00:39:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BEDA22266
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 00:39:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aUWUUr2f";
	dkim=permerror (0-bit key) header.d=wdc.com header.i=@wdc.com header.b="Os2SZR9n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BEDA22266
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7s/ixHOiu/ivLs/sNLujRiqeCDXY3+OWZaaBZFW+ykE=; b=aUWUUr2fPmpi4HPWeSY5AsLxU
	kPnuODvW+sieUgWusUIUsTxfKCOWgqmE7BodVCmIpLoVvCM+Tf3XXsS5vmzml9PfrCVd+5nywW65A
	5rV0cVCU+O/tISFbxrjO5KNxJaKEEE+UR5wNKyUAG+DwKUP8irs0112kpB3ayEjWbBJ2A/G4p0BKm
	htZKh5yCIHIoc2h9ikxMSFb7dlZQzzfScM+x6cHeVlo6D+SXAVPULptRNnqiA6bh1gSXR0kfQMhz7
	Ko/LPry/BUNmY/WBkmlCCCCA0gh1VWVEIfjK6PA6BFVG1pPJD9H/6l3baGFT/TAYw8ZqLkKbr7Y9e
	OunABBFlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfXyo-0006ID-K6; Thu, 19 Nov 2020 00:39:18 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfXyD-0006C3-5h; Thu, 19 Nov 2020 00:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605746721; x=1637282721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GUaYqW4/OtPcVsQlEiV+NW6wzQDKURMHsfJSB6w7l4o=;
 b=Os2SZR9nd0Pn5bYdAjfet6bOWzy6X1GgmkI3QBmUscY7yhaoQOJIieM+
 LNvWNz2boailVinuIVmMkqWLGVNxD3YeRBJehghS6yGWJVAGbYDucFB1O
 TtFe+xZ7BPa8fX3r1GFtwDTG6L7pMA/+yWgrhCCYTkwguEXPtw/pz+Vqv
 JwVFGsWe6/mjRN1lUwTYNtiHzOY6n3yNe5nmSGjrAXJe1zs8tWpziARXz
 kyb4f0jeJYSR56zrsjaK7me2zepqVKfqGESWTTwmwmphrdfOIWZxadRlz
 LQem8QIRAmgm+f5WhNfMhzI/l3CQJgMWS5DK7yyi/WfFj+wKudDXDAqaW g==;
IronPort-SDR: 9mzOeaawHKZqdiB7dHpD1KDZ7Tfhm+6cdlJRlSXqkkvuFXjhEh0JiaqvcLhBY77r0lq53CvRO4
 ZPrHMC94BteP5j/ywEvgO7mH095tjo4H9RxaBlxcqy1+xlrNVGG8463OKmEzmsA4MAvFXinnBQ
 O0Sv+aZV/m86J4jxrJq7QY7id/7DWT/fvmlDd7g+4TARyJs1rfTTr0FupnAlgnKIRJ3wEDOdqj
 6GJ2bmRKE1le9N4xu0S4VYZvx0ddAB+/YJUTlXRgS2mvi5jn8wLX41U9erKxJRG0EsGopoSMvY
 //E=
X-IronPort-AV: E=Sophos;i="5.77,488,1596470400"; d="scan'208";a="256529107"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Nov 2020 08:45:17 +0800
IronPort-SDR: ayWovQHwJu8IztPB9J42RcGhliGTyI5jWjaR4cp0Dvkb2VxNEtuAS5LSE1fkPzptWiE8n2xofU
 uNHqshxmT7c4AlC6ZMuA89ef7fZ0qt6hkCrdRVC7YdR2/0Ajt8OEzE5spe9ShyJDlrSLOs9/Al
 op6o9AiOSJ0EeyXg3na/e4tuzUkWVMXQV+f0lVNsXuQ3/YxxR1zNAyMlVRe9jmJPtGBRWymJ3h
 kIwSOQrCZ2P58mt5SGOmrA0kW+BwZujuhfcKVPpI/P6FM+kBcLGCniCqTxZ5VVTxIc9vJbV3C1
 Ei6elB81W2rQbru3CnbnDuvM
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 16:23:09 -0800
IronPort-SDR: risX5pD68f3hhs/NiXWXWp0naexRBIux6tSPhzOA2lH0DH2WM0DPaKLZK30a23KsaTvngg71k5
 fTaNcLohcL1OBZTYVjGe2QnRMPXwersQduanJYS90weebYhgTxMGU3xNPIfvUorMe0YXSXjo5n
 pt+0LjUgmE8QJOghQUZYDxJgvmtZueuy1PQHw4ls3AZFY4SHgq3a1UfWuMVV3k1pe5IP+e7cWU
 Rejbda9CEO640ZXnkFk6A4iM6ivFLbS6Cn/rKkdns5zS8SnzHhf5GCEVKKNjGjHTDHzpt+Rdvf
 /5A=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.61.71])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Nov 2020 16:38:37 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/5] riscv: Separate memory init from paging init
Date: Wed, 18 Nov 2020 16:38:27 -0800
Message-Id: <20201119003829.1282810-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119003829.1282810-1-atish.patra@wdc.com>
References: <20201119003829.1282810-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_193841_409107_5CC75DCA 
X-CRM114-Status: GOOD (  14.19  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch@vger.kernel.org,
 Zhengyuan Liu <liuzhengyuan@tj.kylinos.cn>, Baoquan He <bhe@redhat.com>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, we perform some memory init functions in paging init. But,
that will be an issue for NUMA support where DT needs to be flattened
before numa initialization and memblock_present can only be called
after numa initialization.

Move memory initialization related functions to a separate function.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/pgtable.h | 1 +
 arch/riscv/kernel/setup.c        | 1 +
 arch/riscv/mm/init.c             | 6 +++++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 183f1f4b2ae6..a0f8a86236e8 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -471,6 +471,7 @@ extern void *dtb_early_va;
 extern uintptr_t dtb_early_pa;
 void setup_bootmem(void);
 void paging_init(void);
+void misc_mem_init(void);
 
 #define FIRST_USER_ADDRESS  0
 
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index c424cc6dd833..eb1cbdc29ea7 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -88,6 +88,7 @@ void __init setup_arch(char **cmdline_p)
 	else
 		pr_err("No DTB found in kernel mappings\n");
 #endif
+	misc_mem_init();
 
 #ifdef CONFIG_SWIOTLB
 	swiotlb_init(1);
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 8e577f14f120..826e7de73f45 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -664,8 +664,12 @@ static void __init resource_init(void)
 void __init paging_init(void)
 {
 	setup_vm_final();
-	sparse_init();
 	setup_zero_page();
+}
+
+void __init misc_mem_init(void)
+{
+	sparse_init();
 	zone_sizes_init();
 	resource_init();
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
