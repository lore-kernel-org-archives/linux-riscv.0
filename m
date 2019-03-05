Return-Path: <SRS0=mVee=RI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057FDC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2019 03:24:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C75712082C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2019 03:24:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PfUHe/cd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C75712082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09V4nB+gM4Pl9V70ARU3rCJR8LLvhDEZ5EOQLjnlxxY=; b=PfUHe/cdd58gKt
	bKS2hqgZ0dhRMi0XrCF4sQc2ad2e6bnGuC+8kbE+WYD/c7T2adzsVy8DYlp0z895PvZ8WWHAp6Zfa
	7gTQkovM3Vrnbqj50ejfwPx9byqzWSMUvsYDPAd583yCCDJB9OiFZDqFnskMp9Bd4GwvKyJPg465t
	SXWXnuKBjPbRiYGO0TIw/gUym/dtWyziATUjcNZ2xxA9Mx8vVOMIxL6omsYbnAvYnZpk/Efg/YOQI
	EUPuEssescxfEe9wt8XrKIDho3xAUkqWfKt0cG/cwwZfoJgp0OthQmTAzGsO0CFM3Uzms68roRd7A
	fuvI7VMpLpBaIzxrB97w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h10gi-00060N-7k; Tue, 05 Mar 2019 03:24:16 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h10gf-0005zQ-Gl
 for linux-riscv@lists.infradead.org; Tue, 05 Mar 2019 03:24:14 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x253MwJ7044096;
 Tue, 5 Mar 2019 11:22:58 +0800 (GMT-8)
 (envelope-from vincentc@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Tue, 5 Mar 2019
 11:23:58 +0800
From: Vincent Chen <vincentc@andestech.com>
To: <palmer@sifive.com>, <aou@eecs.berkeley.edu>, <ebiederm@xmission.com>,
 <jimw@sifive.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] riscv: Support BUG() in kernel module
Date: Tue, 5 Mar 2019 11:23:35 +0800
Message-ID: <1551756215-22299-4-git-send-email-vincentc@andestech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551756215-22299-1-git-send-email-vincentc@andestech.com>
References: <1551756215-22299-1-git-send-email-vincentc@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x253MwJ7044096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_192413_806440_F4D462ED 
X-CRM114-Status: UNSURE (   9.17  )
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

The kernel module is loaded into vmalloc region which is located below
to the PAGE_OFFSET. Hence the condition, pc < PAGE_OFFSET, in the
is_valid_bugaddr() will filter out all trap exceptions triggered
by kernel module. To support BUG() in kernel module, the condition is
changed to pc < VMALLOC_START.

Signed-off-by: Vincent Chen <vincentc@andestech.com>
---
 arch/riscv/kernel/traps.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 0cd0137..9551388 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -156,7 +156,7 @@ int is_valid_bugaddr(unsigned long pc)
 {
 	bug_insn_t insn;
 
-	if (pc < PAGE_OFFSET)
+	if (pc < VMALLOC_START)
 		return 0;
 	if (probe_kernel_address((bug_insn_t *)pc, insn))
 		return 0;
-- 
1.7.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
