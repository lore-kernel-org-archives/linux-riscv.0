Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED558C54F4D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 16:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5BGswON1JD3sf6oEcTnKSzNveJYYdIvIYSUiCtC5z+Y=; b=RmX6d90J6PzCny
	hsC8q4mCvUOJe4Z+SQxDu2NcGkzvXrbJuuzi6YVulto91F0cEOnHhu3dE7iccS4bMXdCABEB9RvCY
	8HbIH9EACaC1qccUja/Gek9wsjDWJezkZatIsnDTPyHi3NauYoIoX10MUlVwCnqBMEW79Kcl0UwSG
	DbFMEovwud7Zp6H/IPvKdGVB2ALJknTV0KGgmxj9RP5HxnhveOxTIeOO7drL71R9XleTe1+F35G+t
	T5JRedDSKj2PWn5bb1kUWOpWqkfseoUzoV+rL9HPah4y+z2VTW+SyDQ1FvDP98VT7hvflLP2SdDI+
	nlPKVVc1TVs/9sC9iZ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokoz-00000005qF5-2525;
	Tue, 28 Jul 2026 16:38:25 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokoy-00000005qEW-0LZO
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 16:38:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785256700; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EaTYWv1Dc1SBf5+SQsKe45ezBrcv4613QUZAlZalAnA4XFITZAeCEdFVr1hr714waNzbUKpNfg32/IouJTVnP4aU/3orRLGZ7xz8JbH04CZkSC5JBL6DjHHG/gLZMvljv2mBs2vO+7u90zTX+KY3Fnlx13M3hQ/h06ZO55zcl6U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785256700; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=otvNwMR4B+V+9NgPjlu/0e2rxdxGseP78+QESYlHmus=; 
	b=HlQSjBs4zRWD3ZjZXRF1ksO/Pz7RzgczjYjDobOaNwm5AXLJYLM7eWBdPTG2461UluKiMtJy0CISALtz3tPHnv5Bu7gIZ+v4ZFgtqqOqmVa5udLSV/0JeQVvnBOJRLjHI5QB2jDDuMDdD2QxTI41LHS7k2Y6YSSavFQpdFDJMn0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785256700;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=otvNwMR4B+V+9NgPjlu/0e2rxdxGseP78+QESYlHmus=;
	b=VhfrsEUHUDAmsLQZAzBYLiGOKpcl++hKsyN7e+lYXq1wetx75jbJdZtL2vUFX9zn
	01LMdzSfAVF6XSRQwn2W8qgCQ1eLi4iTjxFpuzT0mRCs/Ei/fzWMSMxA+qNAFFS09qK
	Yf5FkpOG/m69aUxsLXG9ZGjij6VvDn1yZvob9fEM=
Received: by mx.zohomail.com with SMTPS id 1785256698315421.8471490142962;
	Tue, 28 Jul 2026 09:38:18 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 29 Jul 2026 00:36:28 +0800
Subject: [PATCH RFC 2/7] dt-bindings: interrupt-controller:
 thead,c900-aclint-mswi: Add SpacemiT K3
MIME-Version: 1.0
Message-Id: <20260729-k3-aclint-v1-2-aef88614d3a5@pigmoral.tech>
References: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
In-Reply-To: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=X/m7efjVgyT/uwloY9Rk0xGLPc9cxFw6WjSZH64iz0Y=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIybp1Tm3r60pTlr/+9sjSt0Kpof3FROmLvkift67/te
 n3mxpZpjztKWRjEuBhkxRRZuPzF/1nr8Hw7ItB6H2YOKxPIEAYuTgGYyFF7RoZp9/uST1/aYKB8
 4Y/C6qXFk9WmV2z1qreoflV0O2pyTNYnhn9aP/YrVlm6NXoJhl2WvC5k+7n/icrb37oT05I1ZT+
 7szAAAA==
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_093824_178504_11A79D99 
X-CRM114-Status: UNSURE (   7.76  )
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

Add support for the ACLINT MSWI found in the SpacemiT K3 SoC. The
hardware provides a ACLINT MSWI unit. Adding riscv,aclint-mswi as a
fallback compatible allows direct reuse of existing OpenSBI driver.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../bindings/interrupt-controller/thead,c900-aclint-mswi.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index 62fd220e126e..d83d434a3f81 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -21,6 +21,10 @@ properties:
           - enum:
               - anlogic,dr1v90-aclint-mswi
           - const: nuclei,ux900-aclint-mswi
+      - items:
+          - enum:
+              - spacemit,k3-aclint-mswi
+          - const: riscv,aclint-mswi
 
   reg:
     maxItems: 1

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
