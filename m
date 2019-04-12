Return-Path: <SRS0=NTR9=SO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C504CC10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 14:40:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 963862084D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 14:40:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cb6TwoHE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 963862084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t1Heceuhfz+/H/7UQuOeBVZLiP2ExbawTcHBUehnr1E=; b=cb6TwoHEQXzsAi
	cOT6VhEiIB95RN9DomRJz6PzncF4CP0hIv879YgGsbDFidCBe+o7kOjD6UiOvbyNwFN8jpudwT0Xe
	XdQeaHD6pK9MC8WKyZHmp6jo2tZ/4ni4TYrhwURepDb9NqDdDO4AX/maMqg99l3DXFI8DfVMGZkUF
	IHyLB4ZPIM4UEsg/Z8KgLdZTIwZIEID6H25mI4zOFNWA8uPQZieEfrMQTZIlVaFxrQK/V2cU3bmFE
	mN5dp7CmdbDhiWcdKo8YWeB0E0JGPc0zyeNCZ+EX1hh0sN3Y5N/eVgE9+W8KTZDr/n6LOs4FKF4xF
	qXUiF242ulARpd/jh5FA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hExM8-0001Rp-Pv; Fri, 12 Apr 2019 14:40:40 +0000
Received: from 089144214194.atnat0023.highway.a1.net ([89.144.214.194]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hExM5-0001MN-NY; Fri, 12 Apr 2019 14:40:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 09/12] riscv: remove unreachable
 !HAVE_FUNCTION_GRAPH_RET_ADDR_PTR code
Date: Fri, 12 Apr 2019 16:39:45 +0200
Message-Id: <20190412143948.12478-10-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190412143948.12478-1-hch@lst.de>
References: <20190412143948.12478-1-hch@lst.de>
MIME-Version: 1.0
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

HAVE_FUNCTION_GRAPH_RET_ADDR_PTR is always defined for RISC-V.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/stacktrace.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 3cb439f8c7e6..da9f796ec4d2 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -62,12 +62,8 @@ static void notrace walk_stackframe(struct task_struct *task,
 		frame = (struct stackframe *)fp - 1;
 		sp = fp;
 		fp = frame->fp;
-#ifdef HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
 		pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
 					   (unsigned long *)(fp - 8));
-#else
-		pc = frame->ra - 0x4;
-#endif
 	}
 }
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
