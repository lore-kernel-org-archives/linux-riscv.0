Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE14C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 21:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:From:To
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JSb84rOhmhr+UPGKNOgDMpwEQVuHs0DZHFosrAIWRN4=; b=GcRNZ+FIoxRmpS
	2+oK7ZYKbwq+X1Mq5p4kPPpyQIgFajRjVWCObPAa8WVXRbfAKoVh6i7ylkdfgaYS4K0DyPHslJX0J
	RWzXzET3/isQsFgdDWG02VB7DMU4/sxSaynvtskdqJvUwjYiERJbLhurtRCBmGq/R6R5XGDGASSjQ
	OovfD8ZoyYLGSDGjetMNleagCRTBWv3pNqn4ot08iZRDx//Stt2QThvx7Qspx7NLTbhAPAjDIPzk6
	Nex6GlTiWjuJDa3OiGocruwu14EODhBPkV425M0mNwRPhLgZmUJLBOQjeH1+ERYpHrYDiG/SCbcQP
	KfacudBPf3UApDcCRjAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAGPZ-00000007Pr0-3OjL;
	Thu, 23 May 2024 21:55:45 +0000
Received: from mail-4325.protonmail.ch ([185.70.43.25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAGPW-00000007PqM-3Pmh
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 21:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1716501338; x=1716760538;
	bh=NlkCD1YeDey8XK4H0sKSuWFZIS4qqNXsdyugi3rH1OQ=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=qUmKP9dWeKWsQdfNRD7jVq37mIWJAzHdpA53M7WlYTc1dIaISRTMrUEOdMfWbz0ZE
	 SfUmdRu/Nmv5fvbz+9dKMi2fUqnKsnhdS9kfIVWVpE3lShjWCN7VFtfiXxprEslKmy
	 497tWnyeazf51RtHV4DPweKTRtK88jMffB+9GvotNIpQ9y3+gybPXJIELBxtRtOCxj
	 uQVPzR8+4E2p4gyTMn4EDu+HAofzJNu6JICf8wlH5Z3u5Fu3ye9oRwLlD4vBGiIm66
	 8u5lovuJdsh6u3aW3sZ+kWgPrJGZo1XzIF8ivJSMYpM0WazCfsPpreiVqp6TuS4qnr
	 KxKqEDdKOsaWw==
Date: Thu, 23 May 2024 21:55:37 +0000
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Michael Zhu <michael.zhu@starfivetech.com>, Drew Fustini <drew@beagleboard.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Henry Bell <dmoo_dv@protonmail.com>
Subject: [PATCH 1/2 v2] RISC-V: add Star64 board devicetree
Message-ID: <sQqtfYJc5p5nCV1CUpJC_eti56gLvmhqfMv4DY-aojB0sCARXzXRBveErmAN0spUDzvux3m5LdcmU-i4BfNDCCckVQfHLpH1QakaXdpnXuo=@protonmail.com>
Feedback-ID: 106097379:user:proton
X-Pm-Message-ID: 4b2fa140ab72f66ba1fea9950c1e30f177e2fdf2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_145543_030556_BBD75178 
X-CRM114-Status: UNSURE (   4.41  )
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

Add star64,pine64 to JH7110 compatability

Signed-off-by: Henry Bell <dmoo_dv@protonmail.com>
---

Changes since v1:

- New Commit
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index b672f8521949..4d5c857b3cac 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - milkv,mars
+              - pine64,star64
               - starfive,visionfive-2-v1.2a
               - starfive,visionfive-2-v1.3b
           - const: starfive,jh7110
-- 
2.44.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
