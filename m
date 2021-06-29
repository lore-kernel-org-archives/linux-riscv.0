Return-Path: <SRS0=OKTc=LX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902ECC11F66
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jun 2021 09:15:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 568E061DE1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jun 2021 09:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 568E061DE1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRSJSOifXS9YUYJRBNozJqiyR2yh5+jHYBE52tks/nc=; b=Z4o2cWXSV7ZzA3
	9sOMyOXtc19ttGcNOSjwWamSpDoM7kp50ZE2DuXLwkmu9qZ0K7WftpRr5f0M4GTulNSHb2ga92fft
	46gfIOC1B/XTSLboTz2LstU5nhSdLkZm1Z0XgTkwsYjIRUPuDnd46BJyelg5tCJVE0PfMryWWTkn9
	IBpkGFZV74J/hIvxUFTzuHRGE4uRnzb3qXxp9CJOzfC2y4OCjePhevJ9TM0HHXKiQN+M5xzd4fjMU
	fP5EGmlEy+OeXdOqzk64ilzlSei+ir/Ow+wGCiYtrkANuoCYEPnNgiaNRm/RwCkZx9jlyMEbP7KFR
	GJYo5+3Pr2MYyzMXNjXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly9pk-00ALXJ-1q; Tue, 29 Jun 2021 09:15:08 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly9ph-00ALWa-TG
 for linux-riscv@lists.infradead.org; Tue, 29 Jun 2021 09:15:07 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 94BB6E0002;
 Tue, 29 Jun 2021 09:14:59 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH 2/3] riscv: Make sure the linear mapping does not use the
 kernel mapping
Date: Tue, 29 Jun 2021 11:13:47 +0200
Message-Id: <20210629091349.3802690-2-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210629091349.3802690-1-alex@ghiti.fr>
References: <20210629091349.3802690-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_021506_122586_FD48B1B2 
X-CRM114-Status: GOOD (  11.36  )
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

For 64-bit kernel, the end of the address space is occupied by the
kernel mapping and currently, the functions to populate the kernel page
tables (i.e. create_p*d_mapping) do not override existing mapping so we
must make sure the linear mapping does not map memory in the kernel mapping
by clipping the memory above the memory limit.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 04a5db3a9788..a1a0c4afa80f 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -742,6 +742,8 @@ static void __init setup_vm_final(void)
 		if (start <= __pa(PAGE_OFFSET) &&
 		    __pa(PAGE_OFFSET) < end)
 			start = __pa(PAGE_OFFSET);
+		if (end >= __pa(PAGE_OFFSET) + memory_limit)
+			end = __pa(PAGE_OFFSET) + memory_limit;
 
 		map_size = best_map_size(start, end - start);
 		for (pa = start; pa < end; pa += map_size) {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
