Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64228CAC5A7
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 12:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dfejl2Ci5Qz9mYmlm2tX1nZwvpv7Ljh0mRLirxXpHQI=; b=rX/soGPLNsbMAy
	YLXZgK23T41Dz56mI8Wv3yQyt5EnXuNSOd3pCD2zxQRU2+arcLfKY2G7N8eqIgdnly+0h2tLVQ8sc
	DqS+oiDr7q7hindTs/stNWEvNfj47deBojD/uIoWoQ2Nh/ieLo+gxVWupzH+ImZdy/wAf2ZVn7x1/
	VIht0qsw6Ag8TdVBubyOuNMJGFpE6nO3KuAj0XM/fL1tXF75790tQEZWRaSWG1QEFyenfo4bChflB
	0rvdgzic8XUhvqiJoXD6HmrAu8UBOhBKBsR2dsOx1we80D/Yp+qd8/OUmQYxNX4/rzkhqr+YyfzZ5
	LH5szoz/P0vS1m8FpCPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0g38-0000000ANXp-0KzN;
	Mon, 22 Sep 2025 12:53:46 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0g35-0000000ANWE-1whz
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 12:53:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758545615; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LdM68dtPSTviMta+Z1Ifpn9mJoqmboHYUTOzKvrVhoswQTBJuuDxcH5JG6nAkeXVOHlEKEovYgf9r4J+N88/3RdanGVmNE//I52ePq18quxgU6RYW7v8KRL0qYFDbQeElYkgp1HWFiNWynmDrp0OhbVQRwmxz9VDDeGQZ6c41wM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758545615; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rF2n+/erZcq5mbeYf2dZUx1CTdKHhYkYYAZkDZr4sDY=; 
	b=CvlJzpWSvOvVMxYB0HPxIkCRZxrm5skeh1q1Bz44O81j+w7fjh5zQLfPGH0pFHqp62u33iJjxxXG+UHCCRAtQUf2kIj1A+qThQogrGoFQeR1A1hVeX/XcBSL+yliC/uHcnzpPBQ924jesbNH+ndBYF5t11OBsrezGDf6T8fgGlQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758545615;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=rF2n+/erZcq5mbeYf2dZUx1CTdKHhYkYYAZkDZr4sDY=;
	b=L0AffTpkdGqML2thBic4906BAjRaKr7RuC7HwADpi96ZSrFl5PxAOqo5dA0cK9XT
	cPoC25IdJvYxsRBLui1uG3ERWWAB4mf5grOnR3HsrQj2lmAzb8cmEDKILMtPsidHXgg
	BYBeta6kfHWV+VVxCwr+cnuQIA8nMaN3yGpxMz4Y=
Received: by mx.zohomail.com with SMTPS id 1758545614133203.42447881199462;
	Mon, 22 Sep 2025 05:53:34 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 22 Sep 2025 20:46:35 +0800
Subject: [PATCH v2 05/11] dt-bindings: interrupt-controller: Add Anlogic
 DR1V90 PLIC
MIME-Version: 1.0
Message-Id: <20250922-dr1v90-basic-dt-v2-5-64d28500cb37@pigmoral.tech>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
In-Reply-To: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758545232; l=928;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=vTzNi32YpZGemy8v5EhSx2Au8XpMJQEe4mvK14u1WOc=;
 b=lleUVJR3dypEBu6ZXUg/5cOhLdj1W6qkJtwHNyOFCaIj+UsKmiCyqrzwp6blYYkGlbkOtMnHk
 F/7VmtzowwOCm9fhHFuNXCemnrYTiNWDPYYGhfjge8mltmh5UPXT0Yy
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_055343_567724_AD244FFC 
X-CRM114-Status: UNSURE (   8.01  )
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

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 5b827bc243011cda1fd45d739d34eca95c6e1ee2..960d45432a1d7b1042af56741053549f6a8df2cc 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -58,6 +58,7 @@ properties:
           - const: andestech,nceplic100
       - items:
           - enum:
+              - anlogic,dr1v90-plic
               - canaan,k210-plic
               - sifive,fu540-c000-plic
               - spacemit,k1-plic

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
