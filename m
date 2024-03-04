Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67F0C5478C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 15:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmzVMQMU0GmMFXbjGXm7fcRk9KC1leFtHxDOmveDveY=; b=h6b0e/vYHdoavL
	Zl1GrhbG7n9hLjvYOcx6BhTapqbYfKBiryXd4A1ffRXiG6Pk7+agMWZ2kSGws12JegmGc+EpqlZ5M
	y+ptihxDB0W9hkK2wu5KH98Jo3f1/4MoXb7L+fOCCxKj0IGLsKSEMIhKAwo4de+2LGzTGPkB2Cefw
	k8NEpc9ePQuZO/mPUbkRfzI88IyxOYrrDSSY0f+eI9Zcn99t0xKbsMQw6qQD/cbTpXoi8FOZAoiDv
	FwglzszBJuHKvQPJ2kBlWRDUzkBmDkQU2sVzaEI4AHFa5hs57soG71qBUx6aKneq7TwiFrQ4X/mCe
	zWcJMywi9j0Do31j78SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhA3r-00000009XLa-1wdS;
	Mon, 04 Mar 2024 15:17:03 +0000
Received: from out203-205-221-242.mail.qq.com ([203.205.221.242])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhA3h-00000009XCc-1TBp
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 15:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709565408; bh=0+JXxUau3OkyJeeGutyiyK3QETtDeC61mbo4iJi+WJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zMZnaViRsfpH/EcpyRYr/MYac3GZTcF+iSEmTT8D+QKGbPhn+FvRjOFugZhkLvyK1
	 uUM/ggRQN8JjEuEJ+pB+EHhmdWtPpyBorNnjL3aGFsZhSweKrSOrHJATJvfKQEBIYL
	 qcxwd+eTFjNq4lv1nXCqz3uJIh1rKvBGyALC5vk8=
Received: from cyy-pc.lan ([240e:379:2240:e500:994d:62ab:74a6:932b])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id 42726AAD; Mon, 04 Mar 2024 23:16:39 +0800
X-QQ-mid: xmsmtpt1709565406ti8xoznv3
Message-ID: <tencent_23A08076AB6331AE43CC64C87FA3081F8006@qq.com>
X-QQ-XMAILINFO: NX3IH4pixvQA+Il7G9Idge2OWHMvE5RPgPBSoWeYsrW7Dx9cnsEv9kw/bcUdvh
	 V4ai4Pewg6j/09bHaCBhnbkn+wyxDM2RKGdyGac5C5vuuQh+MVgJhff5rZDg/2TkjlPYXThH5xZl
	 wsfo6W0SuilP7sxMyDkBMzY6PqjlMjrT2lK/I4Q75bJBL6aAmfab75GXPLEgen2f/CN/hcr+6Vf5
	 Wsw+g05TrIaj5Sq2DRMgFiLQ9SA5FkD2xyJniplHoOSXcrq5jnXnDfydDR1B0UrvDa7dVMVK7uJe
	 cmKCTGVOXdkW4fU5BKWjKzFKu0puqVGlmpNo4PPLf+Z6qei6Mb0JxW2EpXNsmQb0MgA95FrqbXyO
	 q2UBwGnJHZ9hGMK/tiBbh7CSn0qzW3cA8GWHDbiGVaf1c2OYx8cb6TrnFnYL5BBngmixE/yA+ke7
	 u8VTGpzymxcphKzlozq3w2fESNeK/SlegbbbYhz/fUB/Cm4wO/rqkhiznE4jMFDhprQKCBjzss63
	 6uuXTrJTzvi/U14yKQVFfZMTZDZDq35sDpVWo4ByAf3SX38vlv2V3oFbUJR+Ze6r4l57Oo2S4W0L
	 tqDW304xB1wZb34hnbBdyNB3pRbzLI9rLbMmcOopO/O7fa5GvN1MRyi1QD/gFB85ZGgB2qD5pVBR
	 fyqXVmaXCgdeMiNOQhU975Rh6f8Ec6AMnEjrxvZdquUYsXsTa5C5GEg+OYl0w6th3gBh7Uw5iKp+
	 NojD6niXJ1TTSJlrqOXJeGtFcEgYy3X3f4eghsZL/Qv+/yOREh6NkMVsmZNR32JWgB0EgDZFiEVT
	 1QYCd5J2/FCp2Ps62V7ELJy99ol+xXlWf7FR7rf4Gq8Vw6q0jgOJoVaZqJul0pHJORmVJTExbmoB
	 aZYjTTOtiVkML3ERoOp/TNYxO0/Ah/lynP0PnouSLNtYlXLlNHzkh+iiVOYegu26Uud9D1XbcLwD
	 TPx0UwZqloYnki6LvmKQgvT0iixuUPNnSuUM7Jnq6hOlqAaCtch9/h7b6c9rA7rDJVwpWx7uhnaw
	 biRtYSFAJsuD87Q8a6
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v2 4/7] dt-bindings: interrupt-controller: Add Canaan K230 PLIC
Date: Mon,  4 Mar 2024 23:16:23 +0800
X-OQ-MSGID: <20240304151626.759150-4-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com>
References: <tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_071653_873840_B157DF94 
X-CRM114-Status: UNSURE (   7.93  )
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

Add compatible string for Canaan K230 PLIC.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 709b2211276b..da147faf32bd 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -69,6 +69,7 @@ properties:
               - sophgo,cv1812h-plic
               - sophgo,sg2042-plic
               - thead,th1520-plic
+              - canaan,k230-plic
           - const: thead,c900-plic
       - items:
           - const: sifive,plic-1.0.0
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
