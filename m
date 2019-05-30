Return-Path: <SRS0=X+rF=T6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B965C072B1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 May 2019 06:49:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 620CC25B65
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 May 2019 06:49:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iWxoX2Hz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 620CC25B65
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0K3aBnSXUE9KsJniEeUxmi4dd5X3qNcOcwNOv33T7IE=; b=iWxoX2Hz6IOPPV
	n//1khimw0pnpyvVLm8GHxsDBzUOnUCmvbHDZ9DECHh67FE2/hLhkmoQl1zUftY6pcYRujbMAinZr
	he1F0XhG47uWTrjoEiAykuWdKPNlom2tix921pdeXfn8hcNV6y1h1GmnrL59doYv8DKMBIcU8IG5/
	AyG9GSNThacx7X33wNf/bpze9jLRTGnypL1Ss9Ojzpgw7N8afmO4qPJMa17h/HnDakuW9DWeu752n
	bbUZ1xhwOW3fQ2UuxbjvubdJSm99g6izxA0SgaoIx4s2rZHohwQhBr2Klp8SsqijVUH5SeKYSRCpv
	P3s9cQF28n2tkagp40FA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWEsZ-00065X-Gj; Thu, 30 May 2019 06:49:35 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWEsU-00062h-T7
 for linux-riscv@lists.infradead.org; Thu, 30 May 2019 06:49:32 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x4U6hfbK060234;
 Thu, 30 May 2019 14:43:41 +0800 (GMT-8)
 (envelope-from nickhu@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Thu, 30 May 2019
 14:49:15 +0800
From: Nick Hu <nickhu@andestech.com>
To: <greentime@andestech.com>, <palmer@sifive.com>, <albert@sifive.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hch@infradead.org>
Subject: [PATCH v2] riscv: Fix udelay in RV32.
Date: Thu, 30 May 2019 14:49:10 +0800
Message-ID: <67a14915b99ee5d933ef9e7e056fc6e1935e775e.1559198255.git.nickhu@andestech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x4U6hfbK060234
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190529_234931_202297_F488E7A4 
X-CRM114-Status: UNSURE (   7.87  )
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
Cc: green.hu@gmail.com, Nick Hu <nickhu@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

In RV32, udelay would delay the wrong cycle. When it shifts right
"UDELAY_SHITFT" bits, it either delays 0 cycle or 1 cycle. It only works
correctly in RV64. Because the 'ucycles' always needs to be 64 bits
variable.

Signed-off-by: Nick Hu <nickhu@andestech.com>
---
 arch/riscv/lib/delay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/lib/delay.c b/arch/riscv/lib/delay.c
index dce8ae24c6d3..ee6853c1e341 100644
--- a/arch/riscv/lib/delay.c
+++ b/arch/riscv/lib/delay.c
@@ -88,7 +88,7 @@ EXPORT_SYMBOL(__delay);
 
 void udelay(unsigned long usecs)
 {
-	unsigned long ucycles = usecs * lpj_fine * UDELAY_MULT;
+	u64 ucycles = (u64)usecs * lpj_fine * UDELAY_MULT;
 
 	if (unlikely(usecs > MAX_UDELAY_US)) {
 		__delay((u64)usecs * riscv_timebase / 1000000ULL);
-- 
2.17.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
