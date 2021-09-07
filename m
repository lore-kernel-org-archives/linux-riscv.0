Return-Path: <SRS0=0BIX=N5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBAEC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Sep 2021 20:03:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2CFE61132
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Sep 2021 20:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2CFE61132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=45ysJM82DNsLnCjhEZ7h0h4Ac84l1WXUn7NCaszT/vg=; b=WiugBhqAPNn9lQ
	M62xKH2I50YtFw7MKa6s82aXpTOLpP0WsMxBKDBuWrOCHc7UAu/ufVjf4LCMxhZt7CsMAf4H9lMFy
	EziAcBI2q29pU6Yl7+tEKyaSzDeqorC/CNyR08s+JOsbBD7v238lOWp2zwBqPa+HHegN2rBWs2jpy
	lD8dnvk0pQqJaZRKl1pwCvhot6WttJ19Z4N6IPSxiyCtXRugP5M4vAazCjCwaMvXhD9lcmc7GGI7R
	tENBtEBbF7Lr5thsLgYLAc9+sXlWXIAfb3UbcLfI8WR4WwFBhdZc7BKYNzGL0ETOSERxV6lgp++iA
	jvSP59xneT7kygKaWChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNhJA-004cXC-LP; Tue, 07 Sep 2021 20:03:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNhJ7-004cVb-UO
 for linux-riscv@lists.infradead.org; Tue, 07 Sep 2021 20:03:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C859161106;
 Tue,  7 Sep 2021 20:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631044981;
 bh=GHY5U3+0IXVjerpc2D86xOqagWOy0yZ5l0MYkJly+sU=;
 h=From:To:Cc:Subject:Date:From;
 b=VSZqEbIrNDCJTGP2NgiDmbVHwrEH1yz+kRLMwgnx51fVrcMKr5XiXKIuf/bLtOBgo
 QEWBXK2AkQVySrKZShWAJOfQL/z9efWEhm6Fw3xs33BtC+62frShpIUcvuz9uGM/wg
 sW2JYwT6EQak30j/o+xCY4hVg2l1JQjg8G/PQbXc8Tl35t2piE8BubXvWYgBTgyA/K
 c7r4k93UndMXvDF8DeXa3ZLJSPweoOAJEI9AHpSuuMLTFbzn9n8NBMKkWSzTbEPKXg
 VhIkEDXrzp0gph0h4O3PjKTqav3kwyK+A6T9uoI+pk/9i0pw96kZb9a8FsbICLyJZw
 nHLoCntOOutlw==
From: Vineet Gupta <vgupta@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>, Jisheng Zhang <jszhang@kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH] riscv: mm: don't advertise 1 num_asid for 0 asid bits
Date: Tue,  7 Sep 2021 13:02:54 -0700
Message-Id: <20210907200254.467375-1-vgupta@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_130302_036674_B0A12017 
X-CRM114-Status: UNSURE (   9.71  )
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

Even if mmu doesn't support ASID, current code calculates @num_asids=1
which is misleading, so avoid setting any asid related variables in such
a case.

Also while here, print the number of asid bits discovered even for the
disabled case.

Verified this on Hifive Unmatched.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/riscv/mm/context.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index ee3459cb6750..c8c6f8831a3b 100644
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
+		pr_info("ASID allocator disabled: %lu bits\n", asid_bits);
 	}
 
 	return 0;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
