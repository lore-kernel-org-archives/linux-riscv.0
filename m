Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7D4CCD1A5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 09:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8hQL6/hEQUS+HNDAxXfBLl3U5c2UtS2lMGCS2y5RFgc=; b=mA87+sSTUK1MZG
	X6+SJb5vS+AYOV3S92JNBxXpmfU8aowUj5DKYTuVs/s/Of8CVlGJhu6zgUoSDQF3+fHkWiiydyAcj
	O007PYuFF34Z9bz+bLeI1pb0aPTxFbz9bABARTw3RBSpzCjKKVOtEb2jNgvimNte/6U4i0mGcb16m
	ZlzaTC1YqlUcNScqnX1bDFeX6pOLzjbuNGdzpGK5bwW8JdU9Zi+CgRblnOljPRnRoG46ePtRxOX3N
	V1EoERYbrGFNeUGh05O1R59M4TBg25WEKgAtIgEk01zXvmtJ/IGbUlDFLANTvgE1X480Par894pai
	QWGpcbWglBczk0y3NDoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8va-0000000GVGZ-2qFg;
	Tue, 21 Oct 2025 09:45:14 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8vY-0000000GVFa-2Nr1
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 09:45:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761039898; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L/nwTHZCbjyMZ1Vqpb7XELvhgwzJGXGfMEs+1dW9wPA4MxGQ2q7QazEg+LghuPHAW16lzcv1py8v+pUCUy+8o3UGNGBlwGzG+qln8mStjIbzr9iL0jB8JUqlUtlvAMVtyHyxO70bLYrfFIXBD8h9QMsub3KulO5tzrZ6xgxgXwc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761039898; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AmOqVWfAgfLRDh3J46Y8FaHobM05maEtveqQQFcI/Ck=; 
	b=kPH7f6HtX2oDTbCfgPG6JhMFKbukBi7ibDoJSKKji38XIU7UbxxwGf1X+k7jYZHPVyylz+43SqDNADGkkt4U8vlCq1pfXMxn+1JS0t/96nuzWDmSMSc4QIOGooi0VVAIHJ15bofbj826CWiv0tU02M/PZ0LYL/3ebY0NQk/hT7c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761039898;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=AmOqVWfAgfLRDh3J46Y8FaHobM05maEtveqQQFcI/Ck=;
	b=FwuDYuVg/Bc5akguipAzZUuMPaMh7BpW2V7P1YpAP78+LRbmTmLjAatqNruX5V1t
	GFBVKDB0sUDyrcWfAWttnrJW/F+P93Gfg0rQ8DSkf6pxEQ61xCBRdPhZi0ICUjZzOxQ
	OFNYZ0d+fEEYUcJJZ7jWpoYvAgEUlmP19DORERbY=
Received: by mx.zohomail.com with SMTPS id 1761039896018451.7502829999422;
	Tue, 21 Oct 2025 02:44:56 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 21 Oct 2025 17:41:39 +0800
Subject: [PATCH v3 04/13] dt-bindings: interrupt-controller: Add Anlogic
 DR1V90 PLIC
MIME-Version: 1.0
Message-Id: <20251021-dr1v90-basic-dt-v3-4-5478db4f664a@pigmoral.tech>
References: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
In-Reply-To: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Junhui Liu <junhui.liu@pigmoral.tech>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>, 
 sophgo@lists.linux.dev, linux-serial@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761039846; l=983;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=3kGr1Cc0QZvmfkpfrjnKuu3joB/2132DDmbBOQEMYJE=;
 b=oL/dw3MGWZ13QEbvWZcweHyeDNmfzMSb8YZ7uRMjG+UmepuDbMhtrMv+aMWS9MA/LWJ/84/HD
 dUhCtG0xIuFAMywNAk+MZRObB4IEAsC97etJIeGMRu1zQ+CCn1CnXn0
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_024512_656210_792BE10F 
X-CRM114-Status: UNSURE (   7.64  )
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

Add PLIC support for Anlogic DR1V90.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index f683d696909b9da302c53a64f6332f6251705c0d..9ebc483a05abcfcb162d9a8e4ad181ffe4c8732a 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -58,6 +58,7 @@ properties:
           - const: andestech,nceplic100
       - items:
           - enum:
+              - anlogic,dr1v90-plic
               - canaan,k210-plic
               - eswin,eic7700-plic
               - sifive,fu540-c000-plic

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
