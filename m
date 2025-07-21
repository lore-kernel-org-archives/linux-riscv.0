Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAE7C83F25
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 16:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HeqXOj/Q54XKOuHgVWl8HYy4Xq5cxgthX/7x/EPTRKw=; b=KQrUc12byNqMey
	Q/SnR3mmNbZQtASaM4COo7mLyy0YLY2OnmWRe0uO7oqd0IiJp+8692E8ThEeJujTFtiTq9W8IEsSK
	+Y8eMmAdPF9OX4F/kS85snzi1hkmOsKk1PjSlNQouZzcOPCVEQN3fwTJkxM7kyw8F3uY5+MDoOk4q
	gH0+pUMhvPrCQ6FQquOtdnEoSLiXHkYVPeaVd9S04vWZm4pQ8Plu1s77SCPIQctSdTzV9SSWthW8Q
	6B5Gtt9y4HvMsCSGV3FmCDCNOdYirFON1y9knHWXrSu4/fHs2BbmZBTs8lo2lpHio3E2rpYOKnmOo
	yKpXOWcE5vqNPea+J1rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtnb-00000000FGK-2uac;
	Mon, 21 Jul 2025 16:55:35 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsmu-000000007Gp-2mTZ
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 15:50:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753113026; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ASzWRge2E4DxTAZ7O2+zToB7hejQWb4MeqrCxw9/5juhhvCfCjMY5AMxZrgOabgLdtv2zWSg2YeK2N8rd3K09BwWwzs68fe8lidCQ9qMf7ICpN8vHnUI8zyFwnjZZh6imdKwtKw/Mx+2BurYlWxgN5dRrJ6GHjCY9uSjZiiQEk8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753113026; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AEDeiqXtDmQkcpk56jyCMSDFww7SqpNp1DMsA4Q7wh0=; 
	b=GLjBSd3EJ6RwIYSBaNA2dfXdeh/okA8YHfnL9MIwGhZ1pWjX0ZWs6AWNnPXGbdnSrSV60v/2soHECf2V6Xm1j3P4vGMlDlE+vQDa09DoXKPhOJQ7CSI+MrFf4nVFHS4B0UsKpBrosRpSkX9S9baoDfBuKlhoGv6SmXgqFOyG31s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753113026;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=AEDeiqXtDmQkcpk56jyCMSDFww7SqpNp1DMsA4Q7wh0=;
	b=iZgxFBEd1or6UTAgUlfp6AO7ZZSPZZc2FjZ63mVBC9/UDfUF9T9O9p3ALv/U/s8l
	VV2gKAC7Q99OW+D0MZ1sK65GOch9tEVcE9/3LKMTd9AO3y3OyDoXOKQjVF1VTSJnJDu
	Vl1/9Hxbf9bR0oxRlXMPUqZaLvYZqwQjhjZAMmuk=
Received: by mx.zohomail.com with SMTPS id 1753113023425908.9710507115287;
	Mon, 21 Jul 2025 08:50:23 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 21 Jul 2025 23:46:07 +0800
Subject: [PATCH RFC 01/10] dt-bindings: vendor-prefixes: Add Anlogic,
 Milianke and Nuclei
MIME-Version: 1.0
Message-Id: <20250721-dr1v90-basic-dt-v1-1-5740c5199c47@pigmoral.tech>
References: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
In-Reply-To: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753112991; l=1599;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=j91B84Oz0Xq6HVsDM7tdgBQWUDMFq10BFaaKSucD9QM=;
 b=fbHnySqFeJ3f498DO5n0mhRqhnJm9JzwKI6jlV7mm0ae9fitrUBkVcNw+0Fln+cnrA8uZbUSb
 98mpQedycdVA0sYj8UZCrcWtRzGzwmWDuy+d6vcyJgD6N+vmAeUIrE3
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_085048_768126_2CFB0163 
X-CRM114-Status: UNSURE (   7.28  )
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

Add vendor prefixes for "anlogic", "milianke" and "nuclei". These are
required for describing the Milianke MLKPAI-FS01 board with DR1V90 SoC
from Anlogic, which uses a processor core designed by Nuclei.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6c666c8b557c2ef385918e5e97bf9..6ace3c66ce58fc15ef7cc70e88fd1904cb8395b9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -127,6 +127,8 @@ patternProperties:
     description: Anbernic
   "^andestech,.*":
     description: Andes Technology Corporation
+  "^anlogic,.*":
+    description: Shanghai Anlogic Infotech Co., Ltd.
   "^anvo,.*":
     description: Anvo-Systems Dresden GmbH
   "^aoly,.*":
@@ -968,6 +970,8 @@ patternProperties:
     description: MikroElektronika d.o.o.
   "^mikrotik,.*":
     description: MikroTik
+  "^milianke,.*":
+    description: Changzhou Milianke Electronic Technology Co., Ltd
   "^milkv,.*":
     description: MilkV Technology Co., Ltd
   "^miniand,.*":
@@ -1081,6 +1085,8 @@ patternProperties:
     description: Novatek
   "^novtech,.*":
     description: NovTech, Inc.
+  "^nuclei,.*":
+    description: Nuclei System Technology
   "^numonyx,.*":
     description: Numonyx (deprecated, use micron)
     deprecated: true

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
