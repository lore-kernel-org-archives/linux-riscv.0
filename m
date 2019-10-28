Return-Path: <SRS0=MZUz=YV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47ED5CA9EAF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2019 02:42:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1661420663
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2019 02:42:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zn9dKEPm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1661420663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/sqy2/UtfPQoirnXc+d0CNLf2adVmPHEl/h9PqZ6ug=; b=Zn9dKEPmWHeeOP
	Ib9ZVMQu+ImT31utbdPBytAj55+oltx/8XxaP+DZwB4fikhkL1sbu/MUtZ2DyXr1fHpCnoW2Tv67y
	IUCxFfjVJtHT+gRMBgwSJzDN8/jvGJFLaAi0kV8JyO3v4RFtHntQNRdAsyJ3jYgP4nUBuwQvGZPtQ
	I9wK3jpebqWnGTcX7BUqKbrGzwEmAIW7DEp+RduJ+RAGv1I3MSpr7I02MjimpTS0+czfMPrdNDowT
	PLWURpod0knfPezBQMo/2h0xPX0I0PJmZQQd7s2kVYoYCDIKzIgoADRDksC0YjLTPbLUUQddX5QFV
	kUdnCcTSnBgsF3B2S/nA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOuzK-0007EY-1p; Mon, 28 Oct 2019 02:42:34 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOuz9-00074Y-Ro
 for linux-riscv@lists.infradead.org; Mon, 28 Oct 2019 02:42:27 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x9S2OTh5087266;
 Mon, 28 Oct 2019 10:24:29 +0800 (GMT-8)
 (envelope-from nickhu@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Mon, 28 Oct 2019
 10:41:57 +0800
From: Nick Hu <nickhu@andestech.com>
To: <aryabinin@virtuozzo.com>, <glider@google.com>, <dvyukov@google.com>,
 <corbet@lwn.net>, <paul.walmsley@sifive.com>, <palmer@sifive.com>,
 <aou@eecs.berkeley.edu>, <tglx@linutronix.de>,
 <gregkh@linuxfoundation.org>, <alankao@andestech.com>,
 <Anup.Patel@wdc.com>, <atish.patra@wdc.com>,
 <kasan-dev@googlegroups.com>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-mm@kvack.org>, <green.hu@gmail.com>
Subject: [PATCH v4 3/3] kasan: Add riscv to KASAN documentation.
Date: Mon, 28 Oct 2019 10:41:01 +0800
Message-ID: <20191028024101.26655-4-nickhu@andestech.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20191028024101.26655-1-nickhu@andestech.com>
References: <20191028024101.26655-1-nickhu@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x9S2OTh5087266
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191027_194224_185533_0F74B9C8 
X-CRM114-Status: UNSURE (   6.72  )
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
Cc: Nick Hu <nickhu@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add riscv to the KASAN documentation to mention that riscv
is supporting generic kasan now.

Signed-off-by: Nick Hu <nickhu@andestech.com>
---
 Documentation/dev-tools/kasan.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index b72d07d70239..34fbb7212cbc 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -21,8 +21,8 @@ global variables yet.
 
 Tag-based KASAN is only supported in Clang and requires version 7.0.0 or later.
 
-Currently generic KASAN is supported for the x86_64, arm64, xtensa and s390
-architectures, and tag-based KASAN is supported only for arm64.
+Currently generic KASAN is supported for the x86_64, arm64, xtensa, s390 and
+riscv architectures, and tag-based KASAN is supported only for arm64.
 
 Usage
 -----
-- 
2.17.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
