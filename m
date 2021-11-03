Return-Path: <SRS0=1+LQ=PW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA6CC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 02:09:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58E9260F70
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 02:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58E9260F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gcalmyFak7xdW7HD0JOId0C9eoG8kUJEZFn17YuhPco=; b=JIgHoH3+1chzPm
	obdgL2gPr59SEaBjcPmCEz4/iw+MsxMLgMnuBFWMcnfXATCw3tAZySJcY4FRtdPxm7NzFuONLfU7X
	lrnO8ZmYD76KQAYByFuhUkeMKQ7vN/WBP6z6xO1sGybhobXTt49cYr716l1vfdGT1TCRb2zp9jZpT
	qwJBA7cNtWfq7I/gbkjynNKRRJ/0yb2VVKXtFvT898fTrt1hP/1srDSOJNEB46LxZyKrr9mXulNYU
	524qMQRQgXSzE8leVgxOrqEirv90he3+c57Hru9Vqnwq8SzIa6yXF9zDsq6GY9vdP8JlMAPwZM+cj
	viudeFOE15iTQ++luyEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi5ih-003qYB-0f; Wed, 03 Nov 2021 02:09:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi5ie-003qXW-It
 for linux-riscv@lists.infradead.org; Wed, 03 Nov 2021 02:09:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A204560F70;
 Wed,  3 Nov 2021 02:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635905379;
 bh=kkpMffUYO3jQ46K3FWIgj1gHt7CtLJqj8Pt/olUmEsA=;
 h=From:To:Cc:Subject:Date:From;
 b=mffNnSuElGKED+ULOpezhvEuo7RONSo3HiwZ4Ia4qhjjIpZYsaVV6/Lys2xJ5TlD0
 cJcaKLWqewxwRVGTL8m61Qb0kQGKryZU20bmYTF5Tm1KH/lQnaCEK8Jsk91J5fnFfN
 8SL8R5Vvh4h7u32A8S6I7AUDsiKhM5DRzSe8QdBt3/hfzOaJEZBmKu3nv8yzglAXpu
 v555vAyUhoaLW0N4EZXlPIWzjcbwAdO7gUYrFyLASucswOCdAQqI8XGnD0g0B8FMng
 gEIIR6sqM3BNsP6Ni2lFQLWG/wtqxYFxq523fwE83tr5lui0Lfv66L3yigA5H4Z28G
 LveRPJOSiqyoQ==
From: guoren@kernel.org
To: guoren@kernel.org,
	robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree <devicetree@vger.kernel.org>
Subject: [PATCH] dt-bindings: vendor-prefixes: add T-Head Semiconductor
Date: Wed,  3 Nov 2021 10:09:21 +0800
Message-Id: <20211103020921.3870764-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_190940_665361_5FD72A59 
X-CRM114-Status: UNSURE (   6.15  )
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
Cc: devicetree <devicetree@vger.kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 0aa9e7676fcf..eec3e9af6e94 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1173,6 +1173,8 @@ patternProperties:
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
