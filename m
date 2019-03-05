Return-Path: <SRS0=mVee=RI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88285C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2019 03:24:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19FC420842
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2019 03:24:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vv9lxUPN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19FC420842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LTEVW74B3IQR58ZYJhasPvWSGD9C8qVUB393yYDr/ls=; b=Vv9lxUPNTWcGYH
	Hn114UZgWkKHMxT8aPb5AVjZM2VkG10+m/v/bZ0cbjfiLALOPKYUxG2eOCgmgd+2Vv/fNxcGmpEUT
	fFl5LUJmEFt2cnC0Y485v2ySw3qePJiNes+CjPXy2u1Gg/JKPlrRe9/0TZKTKH8W7aeeez7wHgBe1
	xBtZOXTIbLezljK9zdqR/AJvnnjLb5Z59rXZEltuaQn8MZNGdzeYInXFmjab1knBf4O1lUxkP+UGx
	iRmABjYdJWyPLak8a9zEtxR7D851rUooObf61fUrO3nVj7pca8xXIxMYL9uzMPeHwVjt9VMBC+nC5
	muUXwIN3CRF0LQmROnMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h10gS-0005sB-P2; Tue, 05 Mar 2019 03:24:00 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h10gP-0005rU-1F
 for linux-riscv@lists.infradead.org; Tue, 05 Mar 2019 03:23:58 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x253MhqC044022;
 Tue, 5 Mar 2019 11:22:43 +0800 (GMT-8)
 (envelope-from vincentc@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Tue, 5 Mar 2019
 11:23:40 +0800
From: Vincent Chen <vincentc@andestech.com>
To: <palmer@sifive.com>, <aou@eecs.berkeley.edu>, <ebiederm@xmission.com>,
 <jimw@sifive.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] riscv: Support trap-based WARN() and fix bug in
 do_trap_break
Date: Tue, 5 Mar 2019 11:23:32 +0800
Message-ID: <1551756215-22299-1-git-send-email-vincentc@andestech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x253MhqC044022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_192357_332113_C33726FF 
X-CRM114-Status: UNSURE (   7.50  )
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
Cc: vincentc@andestech.com, deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Changes in v2:
  - Remove unnecessary non-functional diff
  - Rearrange the order of the patches
  - Edit the commit description

The trap-based WARN() will help developers to analyze the cause of WARN()
because if the debugger is connected, the control flow will be transferred
to debugging environment.

BUG() is currently not working properly. When the C extension is supported,
the assembler translates the "ebreak" to "c.ebreak" opcode. Hence the trap
is possibly triggered by "c.ebreak" instead of expected the "ebreak". This
will cause the check mechanism in is_valid_bugaddr(bugaddr) to think that
the trap triggered by "c.ebreak" occurs in an invalidate bug address. This
patch set will add "c.ebreak" into the check mechanism. In addition, BUG()
is also unable to work in the kernel module due to an inappropriate
condition in is_valid_bugaddr().

Vincent Chen (3):
  riscv: support trap-based WARN()
  riscv: Add the support for c.ebreak check in is_valid_bugaddr()
  riscv: Support BUG() in kernel module

 arch/riscv/include/asm/bug.h |   34 ++++++++++++++++++++++++----------
 arch/riscv/kernel/traps.c    |   22 ++++++++++++++++++----
 2 files changed, 42 insertions(+), 14 deletions(-)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
