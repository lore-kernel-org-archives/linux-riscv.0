Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419BECDB46F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 13:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JyFkKQAu0tHJ+R468rLu+4S6aeu7q3M/Fd+hjMScvpY=; b=zEhMnLS1DIz+Ax
	d0puYR4XHxG28ZmV0tPrhcIjSiNiU7SfG037C0Q/bv02tNzdkreez477mIu4vvcpiaKZey5maN5nG
	QVC2WOcYn6Vr1HuGn252kR6HCnFkND5ZWTwrAjaZmp8udaOe5pUV/lEnShRZrGF6o2BZvX5IdZFqQ
	AOrxCHf/ZMjfT4if3QygiNlRyijakVo09voD/n0ZCcb8hTFaf7LR38rX/A0Qm+jZW/FqXbCMjJVmM
	XuoqiYx6ZOBw1WtdoFSwfJn6h22GFAOTxrHA9g3DwPLdcWHDD+nrTsGyVx8LPK5Zo7YP1Og/xRtu6
	ioewn5546H7MnEjoo8ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbf4b-000000052F6-3Qwx;
	Mon, 22 Jun 2026 13:52:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbf4a-000000052Ep-3pFy
	for linux-riscv@bombadil.infradead.org;
	Mon, 22 Jun 2026 13:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=GMmqRh9CyFpDpehaiS8J4tMzKfblNr9nNNRXd+QZ2ZE=; b=dWPtFFvqRgbuTPpIQQwCZgAJDf
	Z1ftN8C7/qqqPtjupXSEpZOFIgZ3v+1fgGeO4vdWFeherW+/gQhv5Eu7bQqKOuM99kHwdLWwLl+lM
	I044qrovshv7AILOf1GYTXCb6iA4gtuYoAfjr5MKWhmFH8mHenl1CDeZNhgCGtj7T4WmW5VYOruyx
	Qh+VY5jm4A1DdMImq92KkjAnNaxVMk2/7dq0CgJuLOD9bJ0aUmWTmYYQPVcfkqRYWvN1LOV0MpIMA
	oSelVVSfP19i1qU5bgYjh/jD9JIAoYawtpcaW3WAImF1jP+LpS0PBe5ynWcg9/RTkmiIjj8i1icNA
	F/8abJiA==;
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbf4X-00000004Kmt-1XWp
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 13:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=GMmqRh9CyFpDpehaiS8J4tMzKfblNr9nNNRXd+QZ2ZE=; b=7nfAn3kv3Y/WIy
	/RG09bPYtxYrXobGCZm1uxOwCgQ1hH8yiunWn9wkQ3qix9K5VlPln38mNR5qN8GG77xNrs3YKnuSx
	kTU0NhISPANDDQuKmgu4R7COAUGo2wZ+dJcXX/9ulOmxDmJv4XpaPv5hClzHELI/1/8k9uvX7+5Mi
	s9t7s7e8NrI0bjF31h2VqW0rnSn65mJOHl9rjZQW5zEkWc8vy5Zh1ygth0UkoI1hvINmgt/rgUwXH
	CJzzW/JtlwTuSF6elaronGS4PAW9V29EnUE0klA7U+rU23w2m8iYquQ9jMyjOMoQLPQutodMFQ/II
	M8cho8/4GW6SpUuMnC0A==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wbf4K-0053Az-Pk; Mon, 22 Jun 2026 14:52:08 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wbf4K-0000000210v-2L1m;
	Mon, 22 Jun 2026 14:52:08 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-raid@vger.kernel.org,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] raid6: fix riscv symbol undeclared warnigns
Date: Mon, 22 Jun 2026 14:52:07 +0100
Message-Id: <20260622135207.480540-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_145221_874630_20A68740 
X-CRM114-Status: UNSURE (   8.94  )
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

The riscv rvv.c file is missing the include of pq_arch.h
which defines all the exported functions. Include this
to remove the following sparse warnings:

lib/raid/raid6/riscv/rvv.c:1225:1: warning: symbol 'raid6_rvvx1' was not declared. Should it be static?
lib/raid/raid6/riscv/rvv.c:1226:1: warning: symbol 'raid6_rvvx2' was not declared. Should it be static?
lib/raid/raid6/riscv/rvv.c:1227:1: warning: symbol 'raid6_rvvx4' was not declared. Should it be static?
lib/raid/raid6/riscv/rvv.c:1228:1: warning: symbol 'raid6_rvvx8' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 lib/raid/raid6/riscv/rvv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/raid/raid6/riscv/rvv.c b/lib/raid/raid6/riscv/rvv.c
index 75c9dafedb28..4ac50606f3dc 100644
--- a/lib/raid/raid6/riscv/rvv.c
+++ b/lib/raid/raid6/riscv/rvv.c
@@ -10,6 +10,7 @@
  */
 
 #include "rvv.h"
+#include "pq_arch.h"
 
 #ifdef __riscv_vector
 #error "This code must be built without compiler support for vector"
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
