Return-Path: <SRS0=2IPI=RK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FA1C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2019 23:56:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A5F20840
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2019 23:56:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FyXXmv4O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07A5F20840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Date:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ljs4HLWoRs3UipyhEfNktbXGATq/WAP589YHlY8ccXA=; b=FyXXmv4Og6JOyg
	vIlC/AFvv6SyCZx6XJQN2GzcUBs+aCG1NpHqGdxADdfjv4D3mDSzKcuigZFHyeAWYl9geRNHWfKnu
	Eyy3rUhmv108I+WzevvQVCPbl3G4Qp+OZtIV2OQdL3wo8ug1iAzMyXNuBTf/VWbuH1wEsr7nJp21s
	biUZmYHVfMM7sUOlb63AuYPiavfE5K8GJpipMnYFCFMWN0ThbK+0RCfa+y63UFJVCwQEaf0IxCwRb
	HiZA2TFpMBww2NSgKOw7WdNbFv3AFQJMAg7ieH3stPPoFFc4S1Ls4O0fTv0jrTfCPflVWXRZMF8XS
	KLVd/JEFTms+JuJa0VUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h22sg-0004Wz-TO; Thu, 07 Mar 2019 23:56:54 +0000
Received: from smtprelay0045.hostedemail.com ([216.40.44.45]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h22sd-0004WG-Fz
 for linux-riscv@lists.infradead.org; Thu, 07 Mar 2019 23:56:53 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 5521A181D341C;
 Thu,  7 Mar 2019 23:56:37 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: women44_9105590a9ce0c
X-Filterd-Recvd-Size: 1457
Received: from XPS-9350 (unknown [149.142.244.224])
 (Authenticated sender: joe@perches.com)
 by omf10.hostedemail.com (Postfix) with ESMTPA;
 Thu,  7 Mar 2019 23:56:36 +0000 (UTC)
Message-ID: <66af3908ab0a63a6768f3d75a87abf4056a9f8cf.camel@perches.com>
Subject: [PATCH] RISC-V: Use IS_ENABLED(CONFIG_CMODEL_MEDLOW)
From: Joe Perches <joe@perches.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Date: Thu, 07 Mar 2019 15:56:34 -0800
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_155651_593799_729A807E 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

IS_ENABLED should generally use CONFIG_ prefaced symbols and
it doesn't appear as if there is a CMODEL_MEDLOW define.

Signed-off-by: Joe Perches <joe@perches.com>
---
 arch/riscv/kernel/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 7dd308129b40..2872edce894d 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -141,7 +141,7 @@ static int apply_r_riscv_hi20_rela(struct module *me, u32 *location,
 {
 	s32 hi20;
 
-	if (IS_ENABLED(CMODEL_MEDLOW)) {
+	if (IS_ENABLED(CONFIG_CMODEL_MEDLOW)) {
 		pr_err(
 		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
 		  me->name, (long long)v, location);



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
