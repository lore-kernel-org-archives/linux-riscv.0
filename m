Return-Path: <SRS0=6bm6=KC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B1AC433B4
	for <linux-riscv@archiver.kernel.org>; Fri,  7 May 2021 09:37:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B3C860FE3
	for <linux-riscv@archiver.kernel.org>; Fri,  7 May 2021 09:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B3C860FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q9og0cmWeScbBCyx0MPuA4uqwTVQWbC3v1hzxDOWjds=; b=OVS0aqB4NaKj3EzJJ9ugDysoa6
	+xXEvWOseODMf+YCnVb+4Np3fi7+KtP8GkxcPmbNhkPN5xvLo/Li+EO5SG1TE0XhTHpg85tlF0xPZ
	Qs3iFacXYsQtfR38qSH9TcsijsXeqAqTOatlSMJkVOY0u1lB21dLyukdbYHKM3e6P8fBPpWJcOsjx
	lNH7vZ3b9e1G1iJ7OJAxqUQ1sc8zuCUISqM58OO/ntV3NRq3WlUy0N9UydrN3aXpuGLfMhDMCwh/n
	GMstRms7WBu6DQT8ILX6VpHcCBRjJzbzRbv3pg06lcF3kAxmon1iZHsCerkDgIZj4MBvSfq1BpBZj
	b79rH3BQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lewuk-006gcR-Gh; Fri, 07 May 2021 09:36:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lewui-006gbw-H7
 for linux-riscv@desiato.infradead.org; Fri, 07 May 2021 09:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=0RvqMLeEO57tIBMxnpAsXYRmGOHq6VY49SvwjvMLCm0=; b=J9AS1TppvybMskH1twmXtKKQi2
 diULmQD1kYvAWl4S++N7KxNHcbsrtb4GzYCIoODnP8y5CIMayJv9m9gieCdu2aVKgFU+CFmCVQL7O
 Vl7z+lj0GTxriryI81kXuBV7tZNOHvrTvccVzCD0CkDeWVNJpxrgqXGdReqo8NQbcKeR38UrIoHcE
 KrbAqZUZNEtjxLMonwqzeUASkSr7P3XfeL4FE1bAfdtTOO59rlr86K1g5K9jf9BCwCCj6KlMRQvEs
 9oNcn2cT9ls52BRGJNweiMvIyCNabXqXEXaw8p4aajfkQuvW0v5Wao3Ia+RW86ES6mX2fCnPx4NGb
 /tVqkN4A==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lewuf-006k30-RM
 for linux-riscv@lists.infradead.org; Fri, 07 May 2021 09:36:51 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Fc4yp2TSgzCr73;
 Fri,  7 May 2021 17:34:10 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Fri, 7 May 2021 17:36:36 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>
CC: <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <paul.walmsley@sifive.com>, <anshuman.khandual@arm.com>, Kefeng Wang
 <wangkefeng.wang@huawei.com>
Subject: [PATCH] riscv: Select ARCH_USE_MEMTEST
Date: Fri, 7 May 2021 17:47:15 +0800
Message-ID: <20210507094715.113411-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_023650_074834_87B06B9B 
X-CRM114-Status: UNSURE (   5.53  )
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

After commit dce44566192e "mm/memtest: add ARCH_USE_MEMTEST",
must select ARCH_USE_MEMTESET if we want to enable CONFIG_MEMTEST.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a8ad8eb76120..c5914e70a0fd 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -34,6 +34,7 @@ config RISCV
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
+	select ARCH_USE_MEMTEST
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
