Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9958EC2BA15
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 17:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9b0ylsaIKPXZ4D++7Kfc+jihFtOeks5phC8Ynf1b3rA=; b=Idbh0BSeoOxUvV
	NqdFuCW91XhK+xhoXg6N+y7hTBfVKXCW1W46KeodWEMzeudpzCvSV3shwQFjQq3Ri1giCz8hfyj7m
	IU7Jhu8xJ5Kj7s4Tos4X1Tfo3ZLYl25Tyfqzbs7fZZAa/GPzC4nlVaO9BfYvn2n0DOmjql0Ma0Twm
	LErUSEefyPbC2uQjvm2ZAiHn8Oyf2u4dqRpq+w6W5R5wrh9iSzuIJw2Wmirg3vH8K2S6ulXzlOr8r
	bEDR6hVVxxi3OpN8GXd6JuuNcEkp+O9mDsqYr5Qx9g+N6C2vfvbU/q5wZBWuGILAdt9m0xtuLhy9R
	vkvxjNrcJhQVpmwwpIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItZL-00000007y5E-1h9x;
	Sun, 16 Jun 2024 17:21:31 +0000
Received: from out203-205-221-240.mail.qq.com ([203.205.221.240])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItZC-00000007xwy-2PHg
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 17:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1718558475; bh=JKwEkli64nV+u6UbVuHjl1rryovcclGC4cUSLhcp14k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fOx9DXUzRSKFB3VzlEM/jMlO1VRg8rsx13uXibzAGqP9ajpLRg6dE5zHAMGY1ju5a
	 yMeGSyugu5WgVb0qIo3x/YnyKHd2NNaHh3I/eTDBUEmZJ8Vd0h2eTMRQo+PmrrwIFb
	 0E/v9NC+ptCefdClylUJDVPlAZ9DMFWZsXzgyahA=
Received: from cyy-pc.lan ([240e:379:2260:ed00:cd33:e8cf:d8f9:bed3])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id 5452D659; Mon, 17 Jun 2024 01:21:05 +0800
X-QQ-mid: xmsmtpt1718558473tzxk4bd50
Message-ID: <tencent_417C31822BDAD48EF8B84B312521318DBA08@qq.com>
X-QQ-XMAILINFO: OKkKo7I1HxIe57aA5A2c3PUjTCRk8fYygcDw9FdDkbDlvTVj9MFZs4odlQdLBD
	 YD/KHRA3SyQc53FC3gTWE7zU4iEZXY2rUPh3czyoAQBojOkU4fNo7/pYeokOCJrBF6xiB7X7o/Yh
	 lX2OIHvyQ92ujGSwwrXtNQPxtmhGS33EECAbjvL5rRJkaFnJVqpiiCxylBpzZhYVvz0oBIU8QGh1
	 Qs4ZR+WEH9fUdmBwBNWnJOP73Y8PQdeG2phEQI5UzKSqjPc/bQSgGeYibBLrqR3Qgs8Ft6RY+LxM
	 8TTNpqhzKE4LUEVLko4rbvNAgNPFAcm+qQ5z8cRDJ1izWhFjcj/ygg081QhhL96fMZG8ccPzX611
	 T6EYJ8gSVVUYcBl6RVQxv0n6e/TEwiEZcygN4c2nTgZE2wgIyPUa3Y2BFnndHjWU4X8og5C6SStq
	 6jzyK8b34os81x99rcPcyB/4vBqomvDYU+i1FCpp9AUYeC9Nfn6+7fCRSvQ8X2YDjPYOxDQa1g9y
	 qAk0sHK1u2231ZmuU1JYZpaQCaSyaokXzs/MgFT55LnKt5ZAr+QuWHVcc66gVWtTIN1y9dKShH2X
	 fm6drPZRdJu4P2SScVouk6pc5zyzkP1rIcxFMcpvcCl+QeYWxa2iMqYo90lqhMo7ZFC6/H4zwfA+
	 PWLs45zLuzIdkAxDvMxzPMSmGJ8UDM3chWrzWs0uiPP4eMaj4JIicLHm4Uk3M2VWQNsupzbX14Nm
	 7SP69SO4y1VmgVZlO4l6L6LjTdcixX7+t5+G2sp9SB8dEEjipjJiHBTbQgEcw70CxZXgprtdkndU
	 ELgAXBwwcRdLPH4/hIQvD8/kWvqR0BraENdNNjXMtsje4se4bCBafRzRMw5lg1mzph5aQnYtTXnp
	 EsR5uOtG4hXaJtoCYmXHGHnrOQKm5LRdv99Br2svKakQTCnUADAhZIpwvZJwwwY8ch9Qtao/nQSp
	 TLLLW1lrIy5IYynnuoC4G9D4O3Cr6DhckL96mS8VsRGzTs6L2mkItZHaUjBmLcsZGSMFvxNgKxVW
	 O6U4S27vGC2i2Pa3naOQ6Udog83miNQ+eVWp0gOw==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v1 5/9] dt-bindings: interrupt-controller: Add SpacemiT K1 PLIC
Date: Mon, 17 Jun 2024 01:20:50 +0800
X-OQ-MSGID: <20240616172054.3074948-5-cyy@cyyself.name>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_102122_955790_F1D024B7 
X-CRM114-Status: UNSURE (   8.49  )
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

Add compatible string for SpacemiT K1 PLIC.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml     | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 709b2211276b..3d0426b56904 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -59,6 +59,7 @@ properties:
           - enum:
               - canaan,k210-plic
               - sifive,fu540-c000-plic
+              - spacemit,k1-plic
               - starfive,jh7100-plic
               - starfive,jh7110-plic
           - const: sifive,plic-1.0.0
@@ -71,7 +72,9 @@ properties:
               - thead,th1520-plic
           - const: thead,c900-plic
       - items:
-          - const: sifive,plic-1.0.0
+          - enum:
+              - sifive,plic-1.0.0
+              - spacemit,k1-plic
           - const: riscv,plic0
         deprecated: true
         description: For the QEMU virt machine only
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
