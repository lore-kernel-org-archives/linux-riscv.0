Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD23C001B1
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 16:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4uwJ/x2HatwwpwiI7iU4ws7rdG7L0/oboqToab0jO4=; b=X1BYjgDR+AC+9c
	WpF4ETvJGrQs8MAyASRP5vmon73Cv76lrROl3fFV4wZ57JsnzXX3GNURmCxHMdGNdoZryq5/8Dsii
	lpQ0OPmceGrZOkqP1Z5cbVSc4sRm+jk3tCsAmoxNBJVSxquUUACfm0+zuEPVRhQrMVWfn65TOnib5
	Gw/ALxQfYIcBKjK1ODclE/U8RCnLkdGrk5wdGRbU1xL4G/WK49glFQbpyU+8GZowXRDukjgc1wpf3
	OOzt7Qr6VudMxxNPNPj8uS+1CCPBhggwV2VvNIW9zPfVVDoJMH71qOJFhS7mase2MwiXNXSUwXC8f
	C0sdthBluT7c0IX2eU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGj3t-00DqNK-1D;
	Tue, 04 Jul 2023 16:39:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGj3r-00DqLk-1T
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 16:39:32 +0000
Received: from i53875a33.versanet.de ([83.135.90.51] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qGj3k-0005wg-L7; Tue, 04 Jul 2023 18:39:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 2/2] mailmap: add entries for Heiko Stuebner
Date: Tue,  4 Jul 2023 18:39:19 +0200
Message-Id: <20230704163919.1136784-3-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704163919.1136784-1-heiko@sntech.de>
References: <20230704163919.1136784-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_093931_495090_7768AE9B 
X-CRM114-Status: UNSURE (   9.99  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

I am going to lose my vrull.eu address at the end of july, and while adding
it to mailmap I also realised that there are more old addresses from
me dangling, so update .mailmap for all of them.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 .mailmap | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.mailmap b/.mailmap
index 5788fe4371c1..36a9673d89b6 100644
--- a/.mailmap
+++ b/.mailmap
@@ -178,6 +178,9 @@ Gustavo Padovan <padovan@profusion.mobi>
 Hanjun Guo <guohanjun@huawei.com> <hanjun.guo@linaro.org>
 Heiko Carstens <hca@linux.ibm.com> <h.carstens@de.ibm.com>
 Heiko Carstens <hca@linux.ibm.com> <heiko.carstens@de.ibm.com>
+Heiko Stuebner <heiko@sntech.de> <heiko.stuebner@bqreaders.com>
+Heiko Stuebner <heiko@sntech.de> <heiko.stuebner@theobroma-systems.com>
+Heiko Stuebner <heiko@sntech.de> <heiko.stuebner@vrull.eu>
 Henk Vergonet <Henk.Vergonet@gmail.com>
 Henrik Kretzschmar <henne@nachtwindheim.de>
 Henrik Rydberg <rydberg@bitmath.org>
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
