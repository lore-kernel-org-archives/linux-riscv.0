Return-Path: <SRS0=WjcT=PM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3A2C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 01:33:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0C3A60F35
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 01:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0C3A60F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=spWpCsCdjWkDlx8qcx30Ou4qhLC5toMtE3zz7rthuTw=; b=qVHiMC3sGetdin
	ZMoIdMEm0YfRN6/QzUAtk3CQ5IKXV0y7s02w8g6CLE+GJBcuO13F7aReugeRMFlTI542k0HRcZlEp
	Oga6bR4pVyD2hNKPNDIOwOj1TM0DdgaeLZr0sCWzlqk5aUGS/zOD+5n4zlpZuuwDsxaZmc3hqankp
	1FnDjDbjWEvrkoOF2Ct+bXKs9WhHKYIafNlJmxRv/WMOpT1BWaUP1CzO7ZOKGxuNjsyY2l7+Tp7rQ
	c+nFA5q5l1cOlS6fyTvx2aSNUgEvXViG5mYU3HvlZOl+YV0JVuNk0R5+0tvngGKEUZ6sE/RSqiJ4w
	nOiL3uAYYpWZr0oGD2/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meSO0-00DbYl-1F; Sun, 24 Oct 2021 01:33:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meSNv-00DbXx-T4
 for linux-riscv@lists.infradead.org; Sun, 24 Oct 2021 01:33:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A116B60F5D;
 Sun, 24 Oct 2021 01:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635039195;
 bh=g4gEYjcVDjH/Hy84JDSZ3sa+hoCIBLedLlux21Gvh2Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wqs5CqXqnD4/ZRDPyJJppnNz2NrL+Jwf0DJO2tEy4KDfP8/9R9hh9gjgHF6SEOGKd
 ZoftxpQA8MbvPeKcKCd+F9eIH0/FOtwz8BDUOzyEGMZi5SKeYpuZHY5viuNF8qhFO/
 omGYAdoTBXlMl3xe7fN77Ym1GN6wA/gkqR7zw2U6nSPhEvWgIS6Z6NrEPZIyjCIenr
 /z7T7/qEzj/0/7/rTHTvrD0hY9AubOLKSrrEPRnKaa/BZFfsWHAyWc3k742uE57MUt
 tX6TQ6nfb9Y46dfoOXJmHFCQcT4JFulc0z/d2rPgYznTtOcfXtw4BTGePqvAw07RRG
 0wWlmd8hszNUQ==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 maz@kernel.org, tglx@linutronix.de, palmer@dabbelt.com, heiko@sntech.de,
 robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH V5 1/3] dt-bindings: vendor-prefixes: add T-Head Semiconductor
Date: Sun, 24 Oct 2021 09:33:01 +0800
Message-Id: <20211024013303.3499461-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211024013303.3499461-1-guoren@kernel.org>
References: <20211024013303.3499461-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_183315_980678_6047A2E0 
X-CRM114-Status: UNSURE (   5.91  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Add vendor prefix for T-Head Semiconductor [1] [2]

[1] https://github.com/T-head-Semi
[2] https://www.t-head.cn/

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a867f7102c35..f532a8830693 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1169,6 +1169,8 @@ patternProperties:
     description: Terasic Inc.
   "^tfc,.*":
     description: Three Five Corp
+  "^thead,.*":
+    description: T-Head Semiconductor Co., Ltd.
   "^thine,.*":
     description: THine Electronics, Inc.
   "^thingyjp,.*":
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
