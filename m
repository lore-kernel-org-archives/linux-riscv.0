Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF08CD4F21
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 19:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:CC:To:Date:Message-ID
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=043UlSbxTft2kpVsjHFal3R2l+zNF2Q4X2+/2Jtik94=; b=RFiDrejg3DNfYR
	nw+purE6Z2AWZLZtpA01zcK2SFtm4djJtF3Qoaxa7X7Gaq+KZXBv96igSLvdDxlGV8dGj5UWABK9Q
	2Ll4crVu7nQhRKIOhfwR/l5YajGpApIKteKGmTpc14PIRWxm+jC1Zz8rjbTP3RH7iZ6ODX+rN+bKv
	/TT5fSEqHvAMJ9YnAKdo33RY/ouWhmHu254QZ/uYnxrAbjYtnTcEmAh4lgJYdQen1BASdI2qPx+Ue
	Th5hXgp8E1gDMlBH6cH+akw4qHrDD/b1v6m6HUV0vGPbOgs9Xf8pOw25tydQZpB6Gofy14tXslU89
	U4hvsXzBJT/zZRMIt4bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMsOY-00000000Axg-48aj;
	Tue, 12 May 2026 19:03:54 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMsOW-00000000AsA-1gqf
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 19:03:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778612591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=xwwG6JH2PL7eqhShQsglVQeokcXkqtFymm8/VUhv+o8=;
	b=X8bm9m1GzKeUlozR2gBQo/gcJ30rP+2aVqXEj5ibEbouuVfeyVN7gI5iTXpslFo/7khC4R
	DGtRPje3Y2KUDxAVDAo4UdvynQgbvCAWXcG9vy5CKsfPVkY+7W7kj6Jtwz5th3XlrB5fsp
	dj1OIP3dbfRyh2fIgB1mC2IFNj3g/Ys=
From: Tomasz Jeznach <tomasz.jeznach@linux.dev>
Message-ID: <41c3c83de6e2d8422261b57609425d43@linux.dev>
Date: Tue, 12 May 2026 10:37:44 -0700
To: joro@8bytes.org, iommu@lists.linux.dev
CC: tjeznach@rivosinc.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: update Tomasz Jeznach's email address
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_120352_590690_1CB04BC8 
X-CRM114-Status: UNSURE (   8.02  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Switch from the previous work address to a linux.dev account,
as the work address is no longer actively monitored.

Signed-off-by: Tomasz Jeznach <tomasz.jeznach@linux.dev>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index b78aa092b4bb..f409ad927143 100644
--- a/.mailmap
+++ b/.mailmap
@@ -856,6 +856,7 @@ Tobias Klauser <tklauser@distanz.ch> <klto@zhaw.ch>
 Tobias Klauser <tklauser@distanz.ch> <tklauser@nuerscht.ch>
 Tobias Klauser <tklauser@distanz.ch> <tklauser@xenon.tklauser.home>
 Todor Tomov <todor.too@gmail.com> <todor.tomov@linaro.org>
+Tomasz Jeznach <tomasz.jeznach@linux.dev> <tjeznach@rivosinc.com>
 Tony Luck <tony.luck@intel.com>
 Trilok Soni <quic_tsoni@quicinc.com> <tsoni@codeaurora.org>
 TripleX Chung <xxx.phy@gmail.com> <triplex@zh-kernel.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 882214b0e7db..aacab143a697 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22940,7 +22940,7 @@ N:	riscv
 K:	riscv
 
 RISC-V IOMMU
-M:	Tomasz Jeznach <tjeznach@rivosinc.com>
+M:	Tomasz Jeznach <tomasz.jeznach@linux.dev>
 L:	iommu@lists.linux.dev
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
