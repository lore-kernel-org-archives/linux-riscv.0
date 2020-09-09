Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87592C433E2
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 11:20:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F29A82068D
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 11:20:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RLuiijpl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F29A82068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fuyIj4G8KaXJJUkykOZlOQw6fhp2K71EcEYIfzP19qE=; b=RLuiijpljh+w0TkvpbociXbFOL
	TgeT79Zhpl9ZONOX+/xihJyTyNfHgcE3BEL9Kd8dTdbKhCKHY6V3giBMnDCrG/CLRx2XZQ3TNKr8w
	e0127fmXkhwicPiD/TPa9X03G7z0J0nbfljF3MyqJMQlI+0mk5/FrSwz5VuvldIochMqIZFK9Dp2h
	Je4Vb7jkqKNSqsUIpSNU+oUQ0khapsMutt1swLt8s6nz+E2T63gbIPLSzNoTmUwfvGRZnwSZaD8US
	NpNt+oUKwNfoAlPL50zMYozIzA8TKMs8Ew6Pzme/WSEoY6tpLaVBVWvGUBEUe9Q9ys5KIpznbsg0N
	hXTC7f9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFy9D-00054I-7A; Wed, 09 Sep 2020 11:20:19 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFy9A-00053I-M3
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 11:20:17 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7199ABA412A1C7E37A53;
 Wed,  9 Sep 2020 19:19:59 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Wed, 9 Sep 2020 19:19:53 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Hulk Robot <hulkci@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Pekka Enberg" <penberg@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, "Peter Xu" <peterx@redhat.com>, Daniel Jordan
 <daniel.m.jordan@oracle.com>, "Michel Lespinasse" <walken@google.com>, Mike
 Rapoport <rppt@kernel.org>
Subject: [PATCH -next] riscv/mm/fault: fix old-style-declaration warning
Date: Wed, 9 Sep 2020 19:29:01 +0800
Message-ID: <20200909112901.5002-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_072016_955905_DF1A3FB7 
X-CRM114-Status: GOOD (  10.19  )
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
Cc: linux-riscv@lists.infradead.org, Wei Yongjun <weiyongjun1@huawei.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

gcc report build warning as follows:

arch/riscv/mm/fault.c:81:1: warning:
 'inline' is not at beginning of declaration [-Wold-style-declaration]
   81 | static void inline vmalloc_fault(struct pt_regs *regs, int code, unsigned long addr)
      | ^~~~~~

This commit fix it by moving 'inline' after 'static'.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 arch/riscv/mm/fault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index a23eaf5ce95c..a173432ccf82 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -78,7 +78,7 @@ static inline void bad_area(struct pt_regs *regs, struct mm_struct *mm, int code
 	no_context(regs, addr);
 }
 
-static void inline vmalloc_fault(struct pt_regs *regs, int code, unsigned long addr)
+static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long addr)
 {
 	pgd_t *pgd, *pgd_k;
 	pud_t *pud, *pud_k;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
