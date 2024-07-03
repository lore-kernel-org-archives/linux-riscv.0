Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCB0C30658
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 02:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uiru3NzADNRLcP1qnrdENbcwNqPOSxjZikwEkpJ9Xj4=; b=RVPKNPyMng2UpL
	yVI5b6iePPRP7wK7TELm53hQ2vOlQ/em7c1RF5UXRBEMeSF+bWeziQgb6DOeg6xz1Zvd/JmiTvsqq
	pUPXxFCdttm3hvffEbBKcU3mjfnnhZGoOceirnP4G95I+fcrR+ZxqyGgQIcAWfiGeVpKuYWJimzPM
	5TgFaKsgHHsQ3O4V4hedpWC9mX5TVQVafPRMZw/G9jriAWIYpV1/3xIVb3DickjbPAYVS0Vtwotxd
	pKmo2aKJe7mOBY2f919QcuDtpJs8U2F623u4CiNvU/h9X1Gwp+Q90c/iyckXCq8rrEkwixWZA+VDM
	WWWXThRDLgMmqJoA18kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOpfH-00000008a5H-3h6v;
	Wed, 03 Jul 2024 02:24:11 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOpfD-00000008a1S-0CZM
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 02:24:10 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WDNlp1QHqzQk5P;
	Wed,  3 Jul 2024 10:20:06 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id EB695180A9C;
	Wed,  3 Jul 2024 10:23:53 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi100008.china.huawei.com
 (7.221.188.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 3 Jul
 2024 10:23:53 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<samuel.holland@sifive.com>, <tglx@linutronix.de>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH] riscv: Enable generic CPU vulnerabilites support
Date: Wed, 3 Jul 2024 10:27:32 +0800
Message-ID: <20240703022732.2068316-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi100008.china.huawei.com (7.221.188.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_192407_359388_F41980B4 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message.
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

Currently x86, ARM and ARM64 support generic CPU vulnerabilites, but
RISC-V not, such as:

	# cd /sys/devices/system/cpu/vulnerabilities/
x86:
	# cat spec_store_bypass
		Mitigation: Speculative Store Bypass disabled via prctl and seccomp
	# cat meltdown
		Not affected

ARM64:

	# cat spec_store_bypass
		Mitigation: Speculative Store Bypass disabled via prctl and seccomp
	# cat meltdown
		Mitigation: PTI

RISC-V:

	# cat /sys/devices/system/cpu/vulnerabilities
	# ... No such file or directory

As SiFive RISC-V Core IP offerings are not affected by Meltdown and
Spectre, it can use the default weak function as below:

	# cat spec_store_bypass
		Not affected
	# cat meltdown
		Not affected

Link: https://www.sifive.cn/blog/sifive-statement-on-meltdown-and-spectre

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0525ee2d63c7..3b44e7b51436 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -85,6 +85,7 @@ config RISCV
 	select GENERIC_ATOMIC64 if !64BIT
 	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
 	select GENERIC_CPU_DEVICES
+	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_EARLY_IOREMAP
 	select GENERIC_ENTRY
 	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
