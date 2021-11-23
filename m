Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F901C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 13:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PxLFXYNYwLD9pC0uNkXQ5Hau8meYBXhovUU2n+zSZ68=; b=EBLW4lCHJy9AGu
	4L7pxC+jk100aQf0rGKVx/tp9btNFMQaiMDSsQMoUtRlrRtHvZxIGc4w7f30cmc+NKtziGkFIDXrT
	IfzkSfDbpURjAKscinlVqBs5fwzBSieIQeUN8Wd/WGeDtYVSVsy+l0buvZ5QlT7WAok9x4CfenFzM
	/Csgf9UIZMeBZfgv/U/XnsLU7Z5w5KL5+fBHVDogvXaHIxWm6OkfJkvIOURQKEKnjVTO50MDEGBnm
	GHfHQESW0LVZvyALlsQMoMmDyNVu7crVpu5n0d/sqfwAVbCk7rbTvnYgTaNjpLTRdiQU7+gpNZ8np
	EMJkUZ4a80TyrtHjLYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpVse-002O4S-Ok; Tue, 23 Nov 2021 13:30:40 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpVsC-002NuB-S0
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 13:30:14 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hz4kF3Bvvz91G3;
 Tue, 23 Nov 2021 21:29:41 +0800 (CST)
Received: from kwepemm600003.china.huawei.com (7.193.23.202) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 23 Nov 2021 21:30:07 +0800
Received: from huawei.com (10.175.113.32) by kwepemm600003.china.huawei.com
 (7.193.23.202) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 23 Nov
 2021 21:30:06 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <sunnanyong@huawei.com>, <palmerdabbelt@google.com>,
 <wangkefeng.wang@huawei.com>, <anup@brainfault.org>, <alex@ghiti.fr>,
 <jszhang@kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next 0/2] riscv/mm: Enable THP migration
Date: Tue, 23 Nov 2021 22:06:36 +0800
Message-ID: <20211123140638.3852400-1-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600003.china.huawei.com (7.193.23.202)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_053013_172539_9209162A 
X-CRM114-Status: UNSURE (   6.20  )
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

This series enables THP migration on riscv via ARCH_ENABLE_THP_MIGRATION.
But first this adjusts PAGE_PROT_NONE to satisfy generic memory semantics
like the behavior of pmd_present() and pmd_trans_huge() when in
THP splitting or migration.

This feature can reduce the time of THP migration by not splits THP
before migration and can guarantee the pages after migration are still
contiguous.[1]

I have tested the below test case on qemu based on riscv after
enabling this feature, the throughput of THP migration gains 13x
performance improvement:
https://github.com/x-y-z/thp-migration-bench

I also have tested and passed the test cases under
tools/testing/selftests/vm.

[1]: https://lwn.net/Articles/723764/

Nanyong Sun (2):
  riscv/mm: Adjust PAGE_PROT_NONE to comply with THP semantics
  riscv/mm: Enable THP migration

 arch/riscv/Kconfig                    |  1 +
 arch/riscv/include/asm/pgtable-bits.h |  2 +-
 arch/riscv/include/asm/pgtable.h      | 16 +++++++++++-----
 3 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
