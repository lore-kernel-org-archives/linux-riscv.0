Return-Path: <SRS0=qpiA=EI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A96C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2020 03:59:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F310E2145D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2020 03:59:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ji8Wm51f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F310E2145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H4Cn7G+G4S4r4DwUo3lVy2jYRSM0UG63xlXbIRM3B1k=; b=ji8Wm51faK+VD/ib6v/W2XDg8
	cMeMz/R7VX9ySHC3i5MK0JJUEkZVdd2QJu/9w2DhNVx/UB+2Uf2U4MI7lUqRGP5zCDKZ6DAokuhG6
	FXaHHfUtmf2np7VbLd4dzvATA5PJVjRtEC9fHgJIv0RB8QS7MrXKoK6gpaNVn5d9KkZX//+t7cMKl
	YgV+P7od2cQh/Z/JfxzBwIKpg0bvy3A0f179Z1tqL+HbVAAEx2+5Zzk7ZT2UlSJV+294BEckTCm7w
	eMu56MZAp3RRBWdDF6L9MjofPCaKlagadjphhWGyWrELn3gcyrrhV3YlUDNZNuyhS3WfLWb6jDjf6
	5ZsT1Egmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZQzX-0001zb-21; Mon, 02 Nov 2020 03:58:47 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZQzU-0001wB-Fj
 for linux-riscv@lists.infradead.org; Mon, 02 Nov 2020 03:58:45 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CPfKJ3QkNzkdQG;
 Mon,  2 Nov 2020 11:58:28 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 11:58:21 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>
Subject: [PATCH 3/3] riscv: Ignore all compressed Image formats
Date: Mon, 2 Nov 2020 12:03:57 +0800
Message-ID: <20201102040357.118400-3-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201102040357.118400-1-wangkefeng.wang@huawei.com>
References: <20201102040357.118400-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_225844_857212_887D1661 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Do not track all compressed Image formats.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/boot/.gitignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/.gitignore b/arch/riscv/boot/.gitignore
index 574c10f8ff68..2a31a61ca382 100644
--- a/arch/riscv/boot/.gitignore
+++ b/arch/riscv/boot/.gitignore
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 Image
-Image.gz
+Image.*
 loader
 loader.lds
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
