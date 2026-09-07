Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DE2C79FA7
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6uDQHh0QAwo3/pThHYwO4yuj2m8l5kKqruU0TZNh50=; b=KU57heOgOkS3mr
	mt+coC054xWnKWWKREMLt55BvBGu+EEkXlIbdhbgtRubk0M/2ewF20SgOP19aqJJzs1a8+xWIlCjd
	nuwP3stleYlMfm4JL/6CuaOgdonim/xCK1NNhZDpRq85sudwpv21lXrJ3O5lWzwuRGSd8cIAHjGO4
	oLcYXHBK11Y6uACPnn81w4NxjzXnmOebpGsDhRlPK/+hXDyH6a/WjaTgjy5xTLNFm41mf7hR6OFlG
	sAuQISmtCOVdtJWt/S1KItOMHekdLPpO1ZITNoHcHjpUQ9yiAp8Yd0XShU63hIoXASQBbF14OHJp9
	c+yMSIBb/BsDFG9ucorA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W7R-00000006PTN-23EY;
	Mon, 07 Sep 2026 09:58:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W7O-00000006PSC-2uko
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 09:58:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2932C43DFF;
	Mon,  7 Sep 2026 09:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF860C2BCFA;
	Mon,  7 Sep 2026 09:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788775106;
	bh=jx8p4XoDCEmHkARz3LvR8mZjbN2RulpuK3cx8pTILlM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CUO6ibPBnRIJ6br9N1+tglZAtiCQb54P+xFBHtVbEeHzlX7CCIYEohoJJxP2aCOVF
	 rhWyA78DUPUPbC3nqZv25YVRlFygwkTF5HKV9hJ46PPgTlYc+wX3jRITtn2jRUTokB
	 1jhxo/x3/bzHyxynHeE7NA8eVcKOlxGcyFxKjs5FxfIGtDybOkxLB+8UudHOr/P1fB
	 kyUXoE5DfLyeAj5lNm6CyvJorHlvlCSZCEJN1JDlJ/iRsWMEsHA8Jseny5+0tIvPLv
	 9jtDXPQlC7drisbr1plgBltwYk02ojwsytr/REnf07GLVb3xoxh4ObJiqqag8Cnap1
	 LqrQlM99gmGKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BECEDC79F89;
	Mon,  7 Sep 2026 09:58:25 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Mon, 07 Sep 2026 17:54:40 +0800
Subject: [PATCH v2 01/10] dt-bindings: vendor-prefixes: Add shenrongda
MIME-Version: 1.0
Message-Id: <20260907-ultrarisc-dts-v2-1-5eb4c97477c5@ultrarisc.com>
References: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
In-Reply-To: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jia Wang <wangjia@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dmaengine@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775103; l=887;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=e/Kow+cCHmWBpSOP+t1oxwgy4BH4snNIyYRmuufij+E=;
 b=CR9ZckKOmzRgkynMxxjsH9rH+5MRkkuyyO5RWGoWCZBgJ9+mRHevzyy21zSGICPYhWEoToO9w
 2Kmphmkzo25Bfj0HIxEXWJH+ogZkWr5HtF7yOJTdXD+dM6ShhURhDZS
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
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
Reply-To: wangjia@ultrarisc.com
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
