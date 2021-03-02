Return-Path: <SRS0=b61k=IA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C535FC433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Mar 2021 08:48:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0DFF64D74
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Mar 2021 08:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0DFF64D74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rmWQkvOlvDWaDTHBWjIqGyoxH7f2/27Yaj5eRG5xKqM=; b=KVvjtf1kyAQV5Chjin+IwKYHyF
	Qpv4dR94yfSAESfNrLqCd5rphBLIKgNj/P7chBxjpteLb5PKIQjXwh7cY1P3waG9zI+1cq19m29Ti
	IhaoEqmacy8TJHPvqlgsWomxxaV4fYflCfQbOmyW+xJipa527rZkQkexuXUGZPhjFHbN82ZcFhNWu
	qWQgZ+6jN1YgR5vdtuRoU6MpNPCHXM3mi1w8cD0f2iE4l2w/janaHhqZLjFOiOCI0Fu0PFhummS8d
	qzzV3t0W/tFkEllWC/BTK1YmJRFs073zACKfYrOyN7TD6Hdrn4j48zkn7shHiTKDVhRBpOcRGC9OR
	dAzwrcuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lH0he-0004Jt-U3; Tue, 02 Mar 2021 08:48:27 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lH0hb-0004I0-NE
 for linux-riscv@lists.infradead.org; Tue, 02 Mar 2021 08:48:25 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DqW2m1B9dzjTLc;
 Tue,  2 Mar 2021 16:46:56 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.203.44) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Tue, 2 Mar 2021 16:48:12 +0800
From: Barry Song <song.bao.hua@hisilicon.com>
To: <corbet@lwn.net>, <linux-doc@vger.kernel.org>
Subject: [PATCH] Documentation/admin-guide: kernel-parameters: correct the
 architectures for numa_balancing
Date: Tue, 2 Mar 2021 21:41:59 +1300
Message-ID: <20210302084159.33688-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.126.203.44]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_034824_277065_DB779A76 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: Barry Song <song.bao.hua@hisilicon.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, "Paul E. McKenney" <paulmck@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Peter
 Zijlstra <peterz@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mel Gorman <mgorman@suse.de>, Paul
 Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

X86 isn't the only architecture supporting NUMA_BALANCING. ARM64, PPC,
S390 and RISCV also support it:

arch$ git grep NUMA_BALANCING
arm64/Kconfig:  select ARCH_SUPPORTS_NUMA_BALANCING
arm64/configs/defconfig:CONFIG_NUMA_BALANCING=y
arm64/include/asm/pgtable.h:#ifdef CONFIG_NUMA_BALANCING
powerpc/configs/powernv_defconfig:CONFIG_NUMA_BALANCING=y
powerpc/configs/ppc64_defconfig:CONFIG_NUMA_BALANCING=y
powerpc/configs/pseries_defconfig:CONFIG_NUMA_BALANCING=y
powerpc/include/asm/book3s/64/pgtable.h:#ifdef CONFIG_NUMA_BALANCING
powerpc/include/asm/book3s/64/pgtable.h:#ifdef CONFIG_NUMA_BALANCING
powerpc/include/asm/book3s/64/pgtable.h:#endif /* CONFIG_NUMA_BALANCING */
powerpc/include/asm/book3s/64/pgtable.h:#ifdef CONFIG_NUMA_BALANCING
powerpc/include/asm/book3s/64/pgtable.h:#endif /* CONFIG_NUMA_BALANCING */
powerpc/include/asm/nohash/pgtable.h:#ifdef CONFIG_NUMA_BALANCING
powerpc/include/asm/nohash/pgtable.h:#endif /* CONFIG_NUMA_BALANCING */
powerpc/platforms/Kconfig.cputype:      select ARCH_SUPPORTS_NUMA_BALANCING
riscv/Kconfig:  select ARCH_SUPPORTS_NUMA_BALANCING
riscv/include/asm/pgtable.h:#ifdef CONFIG_NUMA_BALANCING
s390/Kconfig:   select ARCH_SUPPORTS_NUMA_BALANCING
s390/configs/debug_defconfig:CONFIG_NUMA_BALANCING=y
s390/configs/defconfig:CONFIG_NUMA_BALANCING=y
s390/include/asm/pgtable.h:#ifdef CONFIG_NUMA_BALANCING
x86/Kconfig:    select ARCH_SUPPORTS_NUMA_BALANCING     if X86_64
x86/include/asm/pgtable.h:#ifdef CONFIG_NUMA_BALANCING
x86/include/asm/pgtable.h:#endif /* CONFIG_NUMA_BALANCING */

On the other hand, setup_numabalancing() is implemented in mm/mempolicy.c
which doesn't depend on architectures.

Cc: Mel Gorman <mgorman@suse.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 Documentation/admin-guide/kernel-parameters.rst | 1 +
 Documentation/admin-guide/kernel-parameters.txt | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
index 1132796a8d96..24302cad174a 100644
--- a/Documentation/admin-guide/kernel-parameters.rst
+++ b/Documentation/admin-guide/kernel-parameters.rst
@@ -140,6 +140,7 @@ parameter is applicable::
 	PPT	Parallel port support is enabled.
 	PS2	Appropriate PS/2 support is enabled.
 	RAM	RAM disk support is enabled.
+	RISCV	RISCV architecture is enabled.
 	RDT	Intel Resource Director Technology.
 	S390	S390 architecture is enabled.
 	SCSI	Appropriate SCSI support is enabled.
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 04545725f187..371a02ae1e21 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3472,7 +3472,8 @@
 
 	nr_uarts=	[SERIAL] maximum number of UARTs to be registered.
 
-	numa_balancing=	[KNL,X86] Enable or disable automatic NUMA balancing.
+	numa_balancing=	[KNL,ARM64,PPC,RISCV,S390,X86] Enable or disable automatic
+			NUMA balancing.
 			Allowed values are enable and disable
 
 	numa_zonelist_order= [KNL, BOOT] Select zonelist order for NUMA.
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
