Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AE4C54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 05:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7nU1lCb9WWNOAlj9Ci1cKiQ/c2le4gtRfwXKhH1oiEw=; b=XpMatfULsLXg7f
	YzN3IYOIiSs2xh3a0sBbozJsxAgmRjEvj7XLvrskanP5yJfZ1+ETo+WJPwg1mO/NsxFliG8Mk7Qyh
	qUDDRF0YY3cWR/Svg6DAV+zW74xR8S24GXB2Ss1hHITVDmlnM735vy9B453sFsKz6T1rMt+4BgJ24
	JACn3LxK3qD3QOKZQDQV78v+3J1Y0ZpbSmyXMBwVpI0Nwo71QzF0GH0FEvRj3MIlJ9KwX3UAGgNaA
	Wy95+K936J0ZRBPG9ORDwaUCpFhxMqBdlCjWBEeX/8iXoQeG4fSMMJ8R1t1eTh430EF0ooefrbRPu
	SNzAB6A2Vx9JiER2rj8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLGv5-00DGxB-6E; Fri, 27 Jan 2023 05:04:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLGv2-00DGwm-04
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 05:04:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5031DB81F99;
	Fri, 27 Jan 2023 05:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6801C433EF;
	Fri, 27 Jan 2023 05:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674795893;
	bh=/HLKprgFCkbwfasw3ymLCwPg8rX60Yypp+3lYT3FCJ4=;
	h=From:To:Cc:Subject:Date:From;
	b=Mp/rTFaZrIswP/zPyxJsexO6HD1kJWsmPpq+Dl17E8g8+5vNo28eKn/wnbal/dq+9
	 ue1W8sWQZARzTxdJxD6tWGlMycrf0stBW/c7G7KK/kcP6+66EeJei/Z9Zi4wMHLoM6
	 nbjjXIAZo0T+MSGYbJ24kPTSIRpWwwZ3lqEhgQvQfLV9n3Je9q25UJf2/w8NXrWgJz
	 ec7ljPaw+1OEHlYYuOawmSCkTUEeJ8MbV1+hZQmJMBXMrlUqZN0/9hHe7xJMt1/vqP
	 hYlq3slKHiZe3SDP9+qiaDFB969ICKH9rAnBhfUQ+nYmjrK6Up8PxAvs9+9CW+ZgkA
	 VvNYgMm89j8TA==
From: guoren@kernel.org
To: tongtiangen@huawei.com,
	alexandre.ghiti@canonical.com,
	muchun.song@linux.dev,
	palmer@rivosinc.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH -next V2] riscv: mm: hugetlb: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
Date: Fri, 27 Jan 2023 00:04:21 -0500
Message-Id: <20230127050421.1920048-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_210456_210700_B6B0C84E 
X-CRM114-Status: GOOD (  11.00  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Add HVO support for RISC-V; see commit 6be24bed9da3 ("mm: hugetlb:
introduce a new config HUGETLB_PAGE_FREE_VMEMMAP"). This patch is
similar to commit 1e63ac088f20 ("arm64: mm: hugetlb: enable
HUGETLB_PAGE_FREE_VMEMMAP for arm64"), and riscv's motivation is the
same as arm64. The current riscv was ready to enable HVO after fixup,
ref commit d33deda095d3 ("riscv/mm: hugepage's PG_dcache_clean flag
is only set in head page").

The HugeTLB VmemmapvOptimization (HVO) defaults to off in Kconfig.

Here is the riscv test log:
cat /proc/sys/vm/hugetlb_optimize_vmemmap
echo 8 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
mount -t hugetlbfs none test/ -o pagesize=2048k
<Try some simple hugetlb test in test dir, no problem found.>

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Link: https://lore.kernel.org/linux-riscv/1F5AF29D-708A-483B-A29F-CAEE6F554866@linux.dev/
Acked-by: Muchun Song <songmuchun@bytedance.com>
---
Changelog:
V2:
 - Optimize the commit log
 - Remove riscv page compound_head fixup which has been merged.
 - Rebase on riscv for-next (20230127)
 - Add HVO author's acked-by

V1:
https://lore.kernel.org/linux-riscv/20221023133205.3493564-1-guoren@kernel.org/
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e2b656043abf..949974a38a41 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -46,6 +46,7 @@ config RISCV
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_GENERAL_HUGETLB
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
+	select ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
 	select BUILDTIME_TABLE_SORT if MMU
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
