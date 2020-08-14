Return-Path: <SRS0=Z5mV=BY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1063BC433E1
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 21:49:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC98B20716
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 21:49:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KI4yyz0n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="IwX+9HHK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC98B20716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+GzwXaPZBl9xB2GaUb4CCRBiILhmU1UiSOFKE4Js/RY=; b=KI4yyz0nbh1/Jf81vyywsYLws
	Yrtl73ih1apZawi+sP3i3zQN9VmNDQ+TPKBzEItPaucUUjSSunaaOn/BwgFeQmqONc/pwP9Ylm1Dz
	5UsxpaL1Jpb5mViKc0/3Hc9JCQViqjanVM0jN0oDjddFyoON96uubGpYalk1gIIqJxkbeukzOH9QW
	weYx9OD+/xRPg5Lp4Fo4uPsO7JasEmF66C8Pn5SNhDJbIhedsjtl3/Yq7QikwmcqdTdedoIEZFQOE
	skckJTDwj0gjlu2f4VzDdaTla3ZyzjtvSzGinsRVKwegVL7Z0n2JZq/8qjxsHuhEe5qoBx954z2AE
	SURTQEkLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6hZD-0008QH-VR; Fri, 14 Aug 2020 21:48:52 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6hYv-0008IJ-G8; Fri, 14 Aug 2020 21:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597441713; x=1628977713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=riQjp16BU3MGRmQFd57ikw/BK/iRNF+3tCmpWPLw6VM=;
 b=IwX+9HHKjmzG8OwMmiye5gXQw0wXjGJemUGSd/f3eliLOEyj5iXb/tdr
 phNlaNsl21bBwqHOBvPDPyH/pHfTgFzepiFmhN0koq1NZxszhtYOZUloS
 Th0nq1aMoP2/EL1buLxZtea5zt+AmrpJ2PsXdByqnH+WRAzW+mphuOa+h
 u9bU9SlT2Ct1U5hZWZAmTmOsOXW4x5yo7YbDxwag6yQb0qNCBdVklMGvx
 0gULidPqwcOF/LMMOeYisDzveOg2js033iBk5+v3BH+3io/yGQiuB7/pQ
 piqGwTNjzW+VA511O8K+r8q7iwaBBur20HxKGb0rLoJq96YnA08S69eLK w==;
IronPort-SDR: PNDzhXP1dse2Pd4uYQDTi8qS1TQp3y6wzZt3nwoln9rik8zrprnFtBHKYcCCDmk2guWRp0iAur
 dv/kWbUevn4dk02Vx6tDKehGZFkL7Zj7juH/MN/Eg5fBpuC8RH3BkV1eLKRDRmajGUQzLxg5tT
 z9KFsKrlgZdXwfc7rHNiE3WFikhATPsUMaBtXYrpVsJhqRcmg4YllF5w6MIcEcBxYB2YXhe7aq
 ST/oNXs8lkhqNudyRNf/eFWwrIGZvvjLU3VOfOpUYTC9QP9PkzaibYu4TkjyJxO/ZsVendSrNx
 jQM=
X-IronPort-AV: E=Sophos;i="5.76,313,1592841600"; d="scan'208";a="254397133"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Aug 2020 05:48:31 +0800
IronPort-SDR: BmxxBkuU9taPbr0dtG34MgLbREnr6vLYG3tScQSCQCaGL5FFKQyzKYJdBlAo4QFnIoTlTMdpuS
 ihWYJvReUCOg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 14:35:37 -0700
IronPort-SDR: 2qIF5Vqs6Zgae5cf+Vy+yHG7TJhk/dEiYuok3B/fYP/hVUpyilT7HsF7J4pS0Ix0FM311oNdZM
 CLhJfYjs37Rg==
WDCIronportException: Internal
Received: from cnf006060.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.56])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Aug 2020 14:48:30 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC/RFT PATCH 4/6] riscv: Separate memory init from paging init
Date: Fri, 14 Aug 2020 14:47:23 -0700
Message-Id: <20200814214725.28818-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200814214725.28818-1-atish.patra@wdc.com>
References: <20200814214725.28818-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_174833_715919_CB64543E 
X-CRM114-Status: GOOD (  15.04  )
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
 Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atish.patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ganapatrao Kulkarni <gkulkarni@cavium.com>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Nick Hu <nickhu@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
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
---
 arch/riscv/include/asm/pgtable.h | 1 +
 arch/riscv/kernel/setup.c        | 2 ++
 arch/riscv/mm/init.c             | 6 +++++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index eaea1f717010..515b42f98d34 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -466,6 +466,7 @@ static inline void __kernel_map_pages(struct page *page, int numpages, int enabl
 extern void *dtb_early_va;
 void setup_bootmem(void);
 void paging_init(void);
+void misc_mem_init(void);
 
 #define FIRST_USER_ADDRESS  0
 
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f04373be54a6..32bb5a1bea05 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -79,6 +79,8 @@ void __init setup_arch(char **cmdline_p)
 #else
 	unflatten_device_tree();
 #endif
+	misc_mem_init();
+
 	clint_init_boot_cpu();
 
 #ifdef CONFIG_SWIOTLB
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 787c75f751a5..b8905ae2bbe7 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -570,8 +570,12 @@ static void __init resource_init(void)
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
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
