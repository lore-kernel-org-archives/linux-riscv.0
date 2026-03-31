Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620F5FF60CF
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 07:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Date:Subject:References:Mime-Version
	:Cc:Message-Id:From:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+OyesdbhsWoKIF3WUNw0qS8Wi2eBq23eBO553VbGP8=; b=LSWO9N2AhoCXbn
	tXKccfwuqWrFeDEEzsnSt0xnoD+nmt0TrRrgBM5+SriH4V4jZjMvi9BNcaqA8xWJ7Gm/fk8CGQ9Tw
	4HNTVp/nfCxuoVyc9WLXAbh6b5yuHSJQNv16OJmb/RIQnV3LN66jRYOUOfiEeaZ1Xl4GILGMl8y3w
	cJOb8YsTn6KI1bKH6HrIhrnAasb1KQBHekmEuNShSLAltTNtSYuGEseUECkEGxLy1n6Y3QGhLG4YT
	Vxb24FWKmKrQ2ZxhIj4gq0w0FaQ6mu078+s/NwF9mMjIOfCC/98t+usasEHmOvpPqwX0KobD3BIk/
	+oXvOdJkhhinEKnKmCMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TMU-0000000CSk8-2FQT;
	Tue, 31 Mar 2026 07:18:06 +0000
Received: from sg-3-45.ptr.tlmpb.com ([101.45.255.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TMR-0000000CSj0-0qXt
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 07:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1774941173;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=GQDq7xcPmGfMBCPBOoJzK5rFck21n/XBBgQtt8mMdD0=;
 b=MvcMZm5oSdctm4cRKprkzy8jArHx3mJFhjmk8zcoGwcfzzCMkERmxb9Dr2Brf7TvG20oW5
 5eX1UiQ0A94elZhPdyq0zaqxZTnZZXKO68X9oabVkqYpmMQT9gzCQpnug7wsz7yKeZOAdg
 O3j3Tf7J94RJsC1cFzP2fe4TmdENKllPNPmD3BLbuXolqfM807u6iUZ1bjspyuDySo8IWF
 HASTrPIznRAa603acg2WgwxikdOr/+7aNnnuMGUnAxlkbmOSrzEsmOgjHDTWF/ZIQO8onj
 d6pRL9T/f/L0k7OihJxeukPsTZSY7YdWC61p51hsmTd5P3b8nVkI0x+rLEO7HQ==
In-Reply-To: <20260331071110.68321-1-sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20260331071238.68336-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Cc: "Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Yixun Lan" <dlan@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Mime-Version: 1.0
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Tue, 31 Mar 2026 15:12:50 +0800
References: <20260331071110.68321-1-sandie.cao@deepcomputing.io>
Subject: [PATCH v2 1/2] dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
Date: Tue, 31 Mar 2026 15:12:38 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+269cb73f3+ccd133+lists.infradead.org+sandie.cao@deepcomputing.io>
To: "Conor Dooley" <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_001803_410355_215E3AEA 
X-CRM114-Status: UNSURE (   4.72  )
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

Document the compatible string for the Deepcomputing fml13v05.
It's based on the SpacemiT K3 RISC-V SoC and is designed for the Framework
Laptop 13 Chassis, which has (Framework) SKU FRANHQ0001.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
v2:
   Use formal format user name.
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index b958b94a924d..af8030242bdc 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -29,6 +29,7 @@ properties:
           - const: spacemit,k1
       - items:
           - enum:
+              - deepcomputing,fml13v05
               - spacemit,k3-pico-itx
           - const: spacemit,k3
 
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
