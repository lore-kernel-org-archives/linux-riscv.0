Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039F1CCF2D3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 07:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6uDQHh0QAwo3/pThHYwO4yuj2m8l5kKqruU0TZNh50=; b=UbStJP69FalQN8
	gcVrm0YuxFwOsFiJt/ZYigz8WCWxvqG4t07tgRjQRBvs+0Fqbdm2jz0psDl3c9ewfYmX5roIBx8/Z
	ZZMxo1pRYjzqTLKwN88eYImnhFAJKuBprUQc9mvN+8IZA4YOzlpRVdfwGhphIo93XpW5G0NUPlSd2
	/0wyHGVuJSAx5sA96Y6RzuK/RWdVx43bUmQwhLfor88zAqAyh3dqtad6KuwmXBG3NSN1POD8Ao7mm
	Bu86lEyHamsTEi+esJudjv6aDAW9XlWYMwkNebzoykILlaJlDicBb4tSXHoNpifE40YYwJuvvatAO
	oBbf0udkKpH/ntGBVc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiDV-00000006nO9-2Rx2;
	Mon, 19 Oct 2026 07:55:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiDU-00000006nNE-109I
	for linux-riscv@lists.infradead.org;
	Mon, 19 Oct 2026 07:55:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B88F43CE3;
	Mon, 19 Oct 2026 07:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8906C2BCFC;
	Mon, 19 Oct 2026 07:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792396531;
	bh=jx8p4XoDCEmHkARz3LvR8mZjbN2RulpuK3cx8pTILlM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=N1WOLRzDPuwjLgYHP37CUyRxg2zFEmKqrou5OedQ5CnaQINfqKrB4nnpnWru4swl7
	 R/IXOtGmZmjoVOCDbxHxjdH52CERRQnJGxae/ven0oosZ12nwpQimtJcjc0z0Q/sPm
	 P69FvpYYghw/3B0/k3kV/6Yxp+pni6PS0MzD747DOGVRi11nnz8Qg8aICC6PdwMJbH
	 nt7UQS/OLvHFqhYbf98Y/1xpuvTEyDyk4o1vot+5pGDSbFzszsIYj8tR4ysUgXhuwk
	 fulOjXIsFJUXZRr/uUFthiyd/yJRNvSKERc4MpNap3vGHV8ZHWmaQnOeg+H7IyKkDp
	 ARQT60kheyT5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5379CCF2D6;
	Mon, 19 Oct 2026 07:55:30 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Mon, 19 Oct 2026 15:55:25 +0800
Subject: [PATCH v4 1/7] dt-bindings: vendor-prefixes: Add shenrongda
MIME-Version: 1.0
Message-Id: <20261019-ultrarisc-dts-v4-1-3979747cda2e@ultrarisc.com>
References: <20261019-ultrarisc-dts-v4-0-3979747cda2e@ultrarisc.com>
In-Reply-To: <20261019-ultrarisc-dts-v4-0-3979747cda2e@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792396528; l=887;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=e/Kow+cCHmWBpSOP+t1oxwgy4BH4snNIyYRmuufij+E=;
 b=mWItLRvWnTdrjKctqS+FRwCSkSzFCFcfo5wF+2SMPmExQaQbSFwdy7BFD9RIRoJv2/QGQhCEr
 NN2ywMmfyk9Dw+M0KZyMiqJrRPjRBo2FMnfg//C0qOwBMwcAQ+t9em0
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
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
Reply-To: jixincheng@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jia Wang <wangjia@ultrarisc.com>

Add Shenzhen Rongda Computer Co., Ltd. to the vendor prefixes.

Link: http://www.shenrongda.com/
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..e100f3993e57 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1507,6 +1507,8 @@ patternProperties:
     description: SGX Sensortech
   "^sharp,.*":
     description: Sharp Corporation
+  "^shenrongda,.*":
+    description: Shenzhen Rongda Computer Co., Ltd.
   "^shift,.*":
     description: SHIFT GmbH
   "^shimafuji,.*":

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
