Return-Path: <SRS0=GA+h=BG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857FBC43459
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 23:24:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 534EA22BEA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 23:24:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EMRfeq0I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hh8GQYV9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 534EA22BEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PLhNwwpOFYDssaSk9Dgz2nq0FQxCAj7k0QCqJoZgSQQ=; b=EMRfeq0IdEDoFocK0wpot8hDM
	YWLLh7gQi8awr/PCkuoWIhamdRiQhzCnZ7KXUJe4bql3R7WBJGXY3D0rzBpZlUnkySDaJmNzbCK2N
	O+Fsg2/EaduxWdsgIIxFL7qY1+Vsae9/KcTkmnnCsVnnfB3FBdckptAHUM6QEp7/74tMj/Rj2BPKi
	RwKGCjEqJEcM2nHJq0p+rmkehDpsE07fJVhqKeisuWZzktYVME8/92UyxN+ag0fsc44BPnS8fGg0I
	n4JVwUdsu9iUDXKN9ZfXKI9O6D6UvVXwZSucvyU+8D7VIdY5VhpS8RONuyEmQbVXhqhmxcvRhgUHR
	0ZbvLWetA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0CTo-00084J-HQ; Mon, 27 Jul 2020 23:24:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0CTh-00080t-HT
 for linux-riscv@lists.infradead.org; Mon, 27 Jul 2020 23:24:18 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1CDCF22B48;
 Mon, 27 Jul 2020 23:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595892256;
 bh=ZrVLOezcbDKD29gv/0DCCDT9ox76t+tAnftaI1z9/ZI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hh8GQYV9zezldtcQaplZYydGEKFNnpGb5Zk2JwRBxEI52bvquXKnhdN+9SZAPbT46
 9X4frwl4eUEzTYjX1Sy8wj7wx1YonnHT4eRGOu7X7FU6OBpKL5eBybVPfud5Hq7b84
 UJQpdTEnwPiUiWlTfDtt/0/ETQLFJoNXNZAZZDlk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 23/25] RISC-V: Set maximum number of mapped pages
 correctly
Date: Mon, 27 Jul 2020 19:23:43 -0400
Message-Id: <20200727232345.717432-23-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727232345.717432-1-sashal@kernel.org>
References: <20200727232345.717432-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_192417_695457_DAE8A90E 
X-CRM114-Status: GOOD (  16.23  )
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
Cc: Sasha Levin <sashal@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmerdabbelt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Atish Patra <atish.patra@wdc.com>

[ Upstream commit d0d8aae64566b753c4330fbd5944b88af035f299 ]

Currently, maximum number of mapper pages are set to the pfn calculated
from the memblock size of the memblock containing kernel. This will work
until that memblock spans the entire memory. However, it will be set to
a wrong value if there are multiple memblocks defined in kernel
(e.g. with efi runtime services).

Set the the maximum value to the pfn calculated from dram size.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fdc772f57edc3..753f2cdbeab8f 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -149,9 +149,9 @@ void __init setup_bootmem(void)
 	/* Reserve from the start of the kernel to the end of the kernel */
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
 
-	set_max_mapnr(PFN_DOWN(mem_size));
 	max_pfn = PFN_DOWN(memblock_end_of_DRAM());
 	max_low_pfn = max_pfn;
+	set_max_mapnr(max_low_pfn);
 
 #ifdef CONFIG_BLK_DEV_INITRD
 	setup_initrd();
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
