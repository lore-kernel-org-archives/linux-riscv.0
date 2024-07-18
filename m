Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4AFC3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 03:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mIUav2y7QaS4MgbVrBVhJFx33gJEG9LXjdhwfKFDAqY=; b=vlB66v4bJV10UB
	LkVumGvB55dJDCx+02BYe8ky4Y5+WmJ3i+5DEFkYfKovQzdDM8J//7uhnLyLp/2mw3mxFZIXbq63o
	rtepiU29x/51X9j6qSGG+h/4hUqw00MvLeXO2BjOMbtI02biVixdzKUGL3NdThdHx6VY2zyF2kaO9
	Jn9NOZvEMzFWf+8UhOrQITwEBgXgGs19RYckE4HZXvF9Ao1F82ZYcFDZpZs1x8eTfc68v9A/4LMRZ
	gvIJCOAdnHRfU/naMNJyeGfkxUCrXcMiqFLr0CS2KJymSy5fTeEKv7bLP9qLyrzL9HeS5EpUTIzVP
	923Crvs7Kk5SV2CRjeQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUIA7-0000000FfPf-2Lx2;
	Thu, 18 Jul 2024 03:50:35 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUI9i-0000000FfJD-1d3V;
	Thu, 18 Jul 2024 03:50:15 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WPdx33lvqz1JCft;
	Thu, 18 Jul 2024 11:45:11 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 31B2C140109;
	Thu, 18 Jul 2024 11:50:04 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi100008.china.huawei.com
 (7.221.188.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 18 Jul
 2024 11:50:03 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <linux@armlinux.org.uk>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <bhe@redhat.com>,
	<vgoyal@redhat.com>, <dyoung@redhat.com>, <arnd@arndb.de>, <afd@ti.com>,
	<linus.walleij@linaro.org>, <akpm@linux-foundation.org>,
	<eric.devolder@oracle.com>, <gregkh@linuxfoundation.org>,
	<javierm@redhat.com>, <deller@gmx.de>, <robh@kernel.org>,
	<hbathini@linux.ibm.com>, <thunder.leizhen@huawei.com>,
	<chenjiahao16@huawei.com>, <linux-kernel@vger.kernel.org>,
	<kexec@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3 0/3] crash: Fix x86_32 memory reserve dead loop bug
Date: Thu, 18 Jul 2024 11:54:41 +0800
Message-ID: <20240718035444.2977105-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi100008.china.huawei.com (7.221.188.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_205013_898409_E2EEC07D 
X-CRM114-Status: UNSURE (   8.68  )
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

Fix two bugs for x86_32 crash memory reserve, and prepare to apply generic
crashkernel reservation to 32bit system. Then use generic interface to
simplify crashkernel reservation for ARM32.

changes in v3:
- Fix it as Baoquan suggested.
- Update the commit message.

changes in v2:
- Peel off the other two patches.
- Update the commit message and fix tag.

Jinjie Ruan (3):
  crash: Fix x86_32 crash memory reserve dead loop bug
  crash: Fix x86_32 crash memory reserve dead loop bug at high
  ARM: Use generic interface to simplify crashkernel reservation

 arch/arm/Kconfig                       |  3 ++
 arch/arm/include/asm/crash_reserve.h   | 24 ++++++++++
 arch/arm/kernel/setup.c                | 63 ++++----------------------
 arch/arm64/include/asm/crash_reserve.h |  2 +
 arch/riscv/include/asm/crash_reserve.h |  2 +
 arch/x86/include/asm/crash_reserve.h   |  1 +
 kernel/crash_reserve.c                 |  5 +-
 7 files changed, 44 insertions(+), 56 deletions(-)
 create mode 100644 arch/arm/include/asm/crash_reserve.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
