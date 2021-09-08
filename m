Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A97C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:31:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B104161153
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B104161153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3kMP0wTHtplrk1zV/nMtHzASI0VBAy+QPjfFuqn4wig=; b=wZtmNz3vI/i/Oe
	9BSNO2LBKB+wFNz+xPfTXfr5MaSPsm2+VdPnNfjb73JndiZYVYPMZrnv4kGMX/Xvf5AGyHCJJF6f8
	v64n+DloGmQUVNHnVbbjifj2rcQnLi3dYhRqBn9uyyVPmoaYL+OjCCSnUbhEEy5shq4LBKegWl+je
	CYo2WfKGGulnDEZ8V2NCAAjQcOW0AVoYH+hHK+R6Cp7YCZicQq/1e5Rb1YekLRsF1FLnbT58cdIdo
	I0dEyWLidd2X3jp+gX8ZFj9VkUgBw0KsuLc168aFKL8aWCE1Hkzx173tSiPU3M5DSIp9LCT1U8XcW
	pkrmykif6AR++lr9mnEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1PD-007HH3-7p; Wed, 08 Sep 2021 17:30:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1PB-007HGC-2F
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:30:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F18160EBA;
 Wed,  8 Sep 2021 17:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631122236;
 bh=dZyoNTpWYDjbsMLm8FfG+sH9KNIQUkuVJuATAf0rPYc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jmHsHqzsXEpQfgBDool7nzhxdJsYwpg1lXSCp9rpfCbk8lTluBYfE2TFqaKklS965
 MdTeF68cxWBqsOtWaepe/3Ngkh5dnyGFc0dVJ90t0CzENT/l3bO/qy2ccnI5DDARdx
 mZtmgVdZF7c4jGDQT/R4ljCVodKaOkS7tNN/D4wdC6TSseQikErSQS3K4oKDnylyZO
 araZARYK+wqglwPTkkx6nbCRT3ta6NF1W2oP2TVw0Zl+4secs09UnoUI9h6h2Lr65H
 up/YuOE9BJjYS9V73KPDnRQP9EwjEziZBBXF+vgCOuDxZVZr8HGE2ADE0i7bh+Py5k
 bcjg1DmDk5kvw==
From: Vineet Gupta <vgupta@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>, Jisheng Zhang <jszhang@kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vineet Gupta <vgupta@kernel.org>, Anup Patel <anup@brainfault.org>
Subject: [PATCH v2] riscv: mm: don't advertise 1 num_asid for 0 asid bits
Date: Wed,  8 Sep 2021 10:30:29 -0700
Message-Id: <20210908173029.1104897-1-vgupta@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CAAhSdy018QJ2hdqL2BSZXV81-CVbTf_g6chJSHM4UH2EhLUpCA@mail.gmail.com>
References: <CAAhSdy018QJ2hdqL2BSZXV81-CVbTf_g6chJSHM4UH2EhLUpCA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_103037_164239_8BA93DAA 
X-CRM114-Status: GOOD (  10.03  )
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

Even if mmu doesn't support ASID, current code calculates @num_asids=1
which is misleading, so avoid setting any asid related variables in such
case.

Also while here, print the number of asid bits discovered even for the
disabled case.

Verified this on Hifive Unmatched.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/riscv/mm/context.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index ee3459cb6750..ea54cc0c9106 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -233,8 +233,10 @@ static int __init asids_init(void)
 	local_flush_tlb_all();
 
 	/* Pre-compute ASID details */
-	num_asids = 1 << asid_bits;
-	asid_mask = num_asids - 1;
+	if (asid_bits) {
+		num_asids = 1 << asid_bits;
+		asid_mask = num_asids - 1;
+	}
 
 	/*
 	 * Use ASID allocator only if number of HW ASIDs are
@@ -255,7 +257,7 @@ static int __init asids_init(void)
 		pr_info("ASID allocator using %lu bits (%lu entries)\n",
 			asid_bits, num_asids);
 	} else {
-		pr_info("ASID allocator disabled\n");
+		pr_info("ASID allocator disabled (%lu bits)\n", asid_bits);
 	}
 
 	return 0;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
