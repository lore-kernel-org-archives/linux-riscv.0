Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D950C433E1
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 23:30:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2DA220658
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 23:30:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z9JCp5+K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="kEwSCEeS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2DA220658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BlReV+W5quUNcCFJU/5kj73eiTyPJSNV48u1TUH6BAs=; b=Z9JCp5+KypUvSxN5NaacNZWS2
	KRuY5q1zWLq7Dw9fodxBfND2PwGL9y0VHYBqyreNqzvFb83WAaRW/6WyVIWlq4+U0X1DOG25Fu5Lq
	dnAb0utrWJZokTIg8rn8VVYcffDr8Vk7f6RI9d1INe4azcTk49t8qpSUd+VKBYHO+Nog+KRMHpgEc
	wYb7ghvffWHhs7VdZb0wg35JaqzWzPYCNFpk6utu5Mz75hf9pMZ0bxtb3IRmJuQQIeRPAoj5hrwgF
	/NbJeRaoK89jt+1iatvYfl7yGxyD2v3iV5rq31hXZqld29aNUUzB48eLQdSLngGA6ZMHJQp14TpA+
	uSxCioQJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvqr3-00072c-Ct; Wed, 15 Jul 2020 23:30:25 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvqqz-00070f-Ms
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 23:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594855823; x=1626391823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5kQrWwHrAj/YyBZ09Df67BPo3nptH7Z6t1IAIOeIJ0Q=;
 b=kEwSCEeSAXr0lezkhbCuy51f8o6IcZozbibdia4KZk8oxBJUGR8RewJF
 hvhPKUEh+rIwEB09h3HHFP/nE/BmCyMGMo/1NUnlWuDdeROXYA77xP2B8
 uGv/hb8SvpyaIQvvfSNdXX9E/EIFev+cOEbabzejOhmi8N9Ljq2dJClpq
 xJhIeefCyFHFbhfVsZbqTNfUtzVue31mk/GyrvP6+AebE/XqShneKy0s8
 x6xo5VTGLU/M5qd3c4hAqFhhl9VwVgWaLrHBst7aZb+mQvsHEtpk5942P
 hQXjTKia18jjaDWI2Ahfw1DzyNVO5oDvDOUYpMFmf+fY0pwWa4IT1SY6Z A==;
IronPort-SDR: FtIyWATOPSqDhaEwvkZi9y60QRrC/+CYisuwU4F+/pNGWes/AKYdnYVnXW4dO65ZZ2ki31sY3h
 9/gDrfOKrM7iNa9lNEQuhged5jXNnFYZse+dbt1D6TiV3mSm9R/7++OjyvVc7Ir2uKRHPfC+U2
 rtYWkgShv7FCFg8w9Ri6OiQwH1HfQ3e/EyhlGCWclImApQssqlh8Ww11AdsGaDq3j3UwC9mn9z
 jsXm8Td1JLooF9H0unn/J66Qr9/wo3f0DKSP0vL8siBmf6A0JGZ8W1bZ974Mpyi5W6pgVvzyBB
 VMQ=
X-IronPort-AV: E=Sophos;i="5.75,357,1589212800"; d="scan'208";a="245592879"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Jul 2020 07:30:21 +0800
IronPort-SDR: p2h+X4onIOpZ3WRvWZWce5AJBYMM//zFX9wbO3oOtuw+ANuvt2fiwQxsvuGOO8sTTNRtR6hXXM
 VnpdxA1wYYWQCuC1cA1drQtcB4qDqr2Uk=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 16:18:10 -0700
IronPort-SDR: E0hQIX7CydO5HGsevPgVvucJmOwMETCcCXqbbTiK7oZt6znBE0XEHaqeqCDlPrG9tXKWpG8heY
 QC3A6nrTbKlQ==
WDCIronportException: Internal
Received: from cnf009656.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 16:30:18 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] RISC-V: Set maximum number of mapped pages correctly
Date: Wed, 15 Jul 2020 16:30:07 -0700
Message-Id: <20200715233009.27183-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200715233009.27183-1-atish.patra@wdc.com>
References: <20200715233009.27183-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_193021_885383_483E89F0 
X-CRM114-Status: GOOD (  12.80  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Vincent Chen <vincent.chen@sifive.com>,
 Anup Patel <anup.patel@wdc.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, maximum number of mapper pages are set to the pfn calculated
from the memblock size of the memblock containing kernel. This will work
until that memblock spans the entire memory. However, it will be set to
a wrong value if there are multiple memblocks defined in kernel
(e.g. with efi runtime services).

Set the the maximum value to the pfn calculated from dram size.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index f4adb3684f3d..8d22973bde40 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -150,9 +150,9 @@ void __init setup_bootmem(void)
 	/* Reserve from the start of the kernel to the end of the kernel */
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
 
-	set_max_mapnr(PFN_DOWN(mem_size));
 	max_pfn = PFN_DOWN(memblock_end_of_DRAM());
 	max_low_pfn = max_pfn;
+	set_max_mapnr(max_low_pfn);
 
 #ifdef CONFIG_BLK_DEV_INITRD
 	setup_initrd();
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
