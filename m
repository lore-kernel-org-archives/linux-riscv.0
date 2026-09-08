Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115BBC79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3isbXZXyG4pqXKJMKqCBLhN/H7lqwh5IShOpG6y0P/s=; b=oNkyn+kf/oVBuZ
	6iM6QTBpeKf6YmOKHZNR55PDSIk3jMgl2OgjXfVmT17EpTbcRt/1iwPvZH6/Z65wPF1pKlc2aRGWm
	cMpO3FNASxtXNqR5r78V2YwOs0wIBIhD52nfWOmTwbIC89lmxMh91nZa6XiFG6jk2StkJaEBnJTWt
	AXC4cBwXrGOkI/82qIee2MPLqeXTx9dCON00wygHuFS2unde+las9w5ssuS+BAIax3oaCAMWVTr20
	U946/e5b6XE+SvBpj3pCSep3dZAHryc6akDK23SgfEJ2Ytg9Ps4f1K94QR0TiQSYN+Sc0PE2s+ZPu
	yQNmc3ZTF1/s6hJpYnaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yho-00000009fru-1o67;
	Tue, 08 Sep 2026 16:29:56 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yhl-00000009fqh-3XnV
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 16:29:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788884975; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GvH11no9PiDQpCG3zF56uF8hvrr+hJBX6nG93Afn4/llRvrzbUGkCrcIwUgCPpq23vtXyg7OTpL0NhPs15l8CRvTMPlt5ROy2vHA3K4DanXu5viu8I3r36w9fwJWM8mu9SaX3K2MmBr0Ca167zynJWk8ULTQpIi0Px98LPrLjPE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788884975; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7Ivy2h4Be2PMjQHoNZULax8EWFCNj6CIwvlu8TFP1mY=; 
	b=IMbYAHn+i5CP3kKxDAw9yPdR1yrPhkC6cZC6SJkjh2CWgdYDTK1Gj7k3b4kar2LhvUf7R2VjBAFGi1O+OKwaZBXzjYdgPAx/5BAAxhiLQhgNprLVlsVi2LiwutZgAHUAPPUir1MrAiVpm8OHFN+zO0/E6+QYYYZ0AjLxpv/HVbM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788884975;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=7Ivy2h4Be2PMjQHoNZULax8EWFCNj6CIwvlu8TFP1mY=;
	b=PG6ZZqKCJNkkWBrRHLvYmwfzvP0PF6nXoHmCQ3C8R7FnB9EQofKJhTiUOLwIuWlc
	F2WKj74UPyoFI24+oYHoWPfW05iJmG0EXwEnkSMGPKuT671D7NVDUUdvCFOkNO4mppd
	faKUczY+swl7N1SHOcIvoL9TkePnUT5qUikwj/1k=
Received: by mx.zohomail.com with SMTPS id 1788884973229662.9652143897716;
	Tue, 8 Sep 2026 09:29:33 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 09 Sep 2026 00:28:45 +0800
Subject: [PATCH v2 2/6] dt-bindings: interrupt-controller:
 thead,c900-aclint-mswi: Add SpacemiT K3
MIME-Version: 1.0
Message-Id: <20260909-k3-aclint-v2-2-7931e5bc86ad@pigmoral.tech>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
In-Reply-To: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=guQvgJL+i2yMWqW+sqtT+I2+RFzEn3+LbYcQKlU5LLU=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIWmB9716fVqsxdH5a5fnFGge6TGWu+9CRkTqhYsVqVx
 SZvzcSIjlIWBjEuBlkxRRYuf/F/1jo8344ItN6HmcPKBDKEgYtTACayYCUjwyyxw086vXtq9vEK
 B6U+2D417lnusYueK45LGn8T2eTnvYfhvyvjFY5pkjmmWSWycVbBqhyPIyUWPK/W5+FJad7fP6O
 NEQA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_092953_935598_179EC22F 
X-CRM114-Status: UNSURE (   7.15  )
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

Add support for the SpacemiT K3 ACLINT MSWI, which provides per-hart
software interrupts for inter-processor communication in Machine mode.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index 62fd220e126e..d17f5613612c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - const: spacemit,k3-aclint-mswi
       - items:
           - enum:
               - sophgo,sg2042-aclint-mswi

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
