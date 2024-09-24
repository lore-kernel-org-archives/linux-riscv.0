Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEA9CF9C72
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 08:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:From:Mime-Version:
	Subject:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=84IW/gFgoReqMjb5eXjY7584lTZsapqYkBPlCsFE2BA=; b=v3vpC+OkbbHvSP
	cfPwincvW5yzoKn3ZC/LbjKK7W4Z31HEofG0lnp97lA3jov7E69pg1wkA+6ICVHFuSLbw6AKcgasF
	kEO+j3AQPHuQkCPa/EgW6nSUfRBaDXN3lBLbmYKo9UYnco6DjmbkSDC9On+QXNrLfat1QO42BH31T
	fFTjIHzxUu55KCotX5tBg7e7j6RzyWPfXF+WiBH9Pzl/DuoJhdEd8zLWz8pKw7UTgcN5otqai4YwJ
	J9tWjEq9m41+i8y7VC4m/GnLSQ7B5BMJA4aCVFjbjkgT+cDCgPOBt+oDxbrn0MvVZnv47So/0eP/H
	ExvLeGYBpzi2OQpF3e5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st0aE-00000001X8K-0kic;
	Tue, 24 Sep 2024 08:07:42 +0000
Received: from va-1-14.ptr.blmpb.com ([209.127.230.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st0aA-00000001X61-2e8y
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 08:07:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1727165246;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=oB/VU3FI/FnFWz9K+uig7hfrJEDRFlku8hT2eEzdBzo=;
 b=CRG2h/L0bBUN/UsrxJVVtSo/Xxa0sEFeDOtByr8dsb+ZK0TcO5qG3/7fLZWfCB9pjAL8sm
 qkEM2i2Hd/4uN2RfUZZ6s6kCRZjO80aZC8Ly59vRahQRR5+6hmC5e7md/B9Giy0R5Trver
 Mp2H9tlJwGX4CKNd+ZnVycirqJToOwQjib57yetnP8S3ns/LLpMA6Qhda1lsbYu0kNQkFP
 luE3yEoFlSS3oIIc4r0Hz/brctXK1G18U12jsRhd+6aX08rurG5RIO+Z+FXaE02QJXQ3gU
 vElY0XYyLyG+cfdsn6hAbitOhVwnfeCteFr15uKc2ALOF2QWbZmNjU6bD7CFKw==
To: "Conor Dooley" <conor@kernel.org>
Cc: "Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heiko Stuebner" <heiko.stuebner@cherry.de>, 
	"Neil Armstrong" <neil.armstrong@linaro.org>, <rafal@milecki.pl>, 
	"Linus Walleij" <linus.walleij@linaro.org>, 
	"Michael Zhu" <michael.zhu@starfivetech.com>, 
	"Drew Fustini" <drew@beagleboard.org>, <linux-riscv@lists.infradead.org>, 
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<dhs@frame.work>, <ams@frame.work>, <gregkh@linuxfoundation.org>, 
	<yuning.liang@deepcomputing.io>, <huiming.qiu@deepcomputing.io>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+266f2733d+ea7822+lists.infradead.org+sandie.cao@deepcomputing.io>
Subject: [patch v2 2/3] dt-bindings: riscv: starfive: add deepcomputing,fm7110
Received: from roma-MacBookPro.. ([61.141.249.39]) by smtp.feishu.cn with ESMTPS; Tue, 24 Sep 2024 16:07:24 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Tue, 24 Sep 2024 16:06:49 +0800
Message-Id: <20240924080650.1345485-3-sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_010738_767912_E405CBD6 
X-CRM114-Status: UNSURE (   4.93  )
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

Add deepcomputing,fm7110 into compatible list.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 4d5c857b3cac..778617e1dc43 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -26,6 +26,7 @@ properties:
 
       - items:
           - enum:
+              - deepcomputing,fm7110
               - milkv,mars
               - pine64,star64
               - starfive,visionfive-2-v1.2a
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
