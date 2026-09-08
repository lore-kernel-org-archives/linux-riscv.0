Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1F6C79F9E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 16:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDnOgwBdVnD2dHsHDPLgVTPkj3R9AV2uS6dAxkxMc9U=; b=n24eNQlRb4ls26
	pCJQudl5YtJ9+6fJMNA2guc+8s7XZ4Gxv2tfh0HiMbiaknm2MoA0fCSLPEWgigaV9RbscZ3U6ZOXt
	OPXhWmVcoz6OZMwWdBiX40YHdUUCBY8eeaZFKao2Bdn/LjeCvXRyb3EAqXtCOcRx4boXThG/wbV08
	NNJsBKQOvc0/SVAtaaeSxSPpDj1Smsb3Zhy6qm0kJ5H8dGcUEQ4vxFLEWJEp5GyeTqLO64tqNAi5P
	T3mMyiuZH52wmrhMa/rkwkNAZ5o/YLTZRz9FO3ANlDs17y16RsCMQCsw8dBhWY2DheamilASh/MPe
	dRb11La5DOO2sp4TnSWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yhq-00000009ftQ-2o9w;
	Tue, 08 Sep 2026 16:29:58 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yho-00000009frg-1JpL
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 16:29:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788884983; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A9ILT2xT2EgU35yTIjB9mboQAwF3ssLCR7HjRSdbyoRpYzJzZejXC4F2EIKmhm9344nXKJOmo8VSLQ5p2cOkKcvYjM0N8Hv6NjwSSldApCOI/gNJFOXqXH1fjON9cC5qWLTgN8KAoP/mFetKeFNOeZOhFHiYRyzlo/uOb3ck/2Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788884983; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Wlcyi9R/T0YiHsT+iArPXhEOqRlQss3EnsJ+phzT+HQ=; 
	b=My6WwhTY8RYGkXbaGkfWcodZbldac1xOBak7M08DdAkppocr51CndZ2qVtpVQme1HsL7KUrNteEu8O4FJSxGrG/O7o8zOkUKnAn0vTZzWqX8cPV2mTp1hzvb0HTEslSvmem7xHHzse6MTmqkXegdDNux8NuCWXppZqncjkFoMtU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788884983;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Wlcyi9R/T0YiHsT+iArPXhEOqRlQss3EnsJ+phzT+HQ=;
	b=T4QqIRZL6MlX75+ZsvSv9VtorcaZXFWkangyGofVmbEWZ3vGH6TT/ovf2xP3T4O7
	IkO+gaQl4D+njiIaPT4BDIlTF/N/gFqDHlwMEQdcpGjmEi86G5uu81wP8l1ykLHxwGh
	1uHDH9wh6LDsmHNNjdI/el1STYXVJ5EBJauAygWM=
Received: by mx.zohomail.com with SMTPS id 1788884982005663.2234173377049;
	Tue, 8 Sep 2026 09:29:42 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 09 Sep 2026 00:28:46 +0800
Subject: [PATCH v2 3/6] dt-bindings: interrupt-controller:
 thead,c900-aclint-sswi: Add SpacemiT K3
MIME-Version: 1.0
Message-Id: <20260909-k3-aclint-v2-3-7931e5bc86ad@pigmoral.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=NLcr87f2JQThparZC7f+83o97uk7/2T64hwhuqbiP2c=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIWmJ/c9uzcDXHvA81rl09VeKvUvSzxfql1QsD+f2aJO
 4TjVrrEdpSyMIhxMciKKbJw+Yv/s9bh+XZEoPU+zBxWJpAhDFycAjARURGG//n375S+PZ37bG/C
 9PCnHaZPzvkGJlk3/9y/yeJtw/LL+74y/A/ofC5VZ58So2FzZPHNc+dUSliOvjv30OT9mlfyx+M
 W7mMHAA==
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_092956_413485_398833BE 
X-CRM114-Status: UNSURE (   8.34  )
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

Add support for the SpacemiT K3 ACLINT SSWI, which provides
inter-processor interrupts in Supervisor mode without calling into
Machine-mode firmware.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../bindings/interrupt-controller/thead,c900-aclint-sswi.yaml        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
index d02c6886283a..0b34ed5b4639 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
@@ -24,12 +24,13 @@ description:
 properties:
   compatible:
     oneOf:
+      - enum:
+          - mips,p8700-aclint-sswi
+          - spacemit,k3-aclint-sswi
       - items:
           - enum:
               - sophgo,sg2044-aclint-sswi
           - const: thead,c900-aclint-sswi
-      - items:
-          - const: mips,p8700-aclint-sswi
       - items:
           - enum:
               - anlogic,dr1v90-aclint-sswi

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
