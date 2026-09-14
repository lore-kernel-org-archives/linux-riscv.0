Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5D4C88E75
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=45hI/mfbLZqkszgq9zkwVQ8NKTtsBca+7+inzanguj4=; b=3iAdv2+Zqgj7Cw
	AKoqm3sQag0a3/tvQ0iok/9yjis/nhZEtFVRdoSrlvo5kw3M3bnyV1MMQefNv+7vhWAjwnQswHQnS
	V2NHFBgN6bSrMopgMqk+MYc1TbKvBSw+LpRrBr/ouEsIcEpUkNTUqO4OGOr5K8i1qGsxDs/KhwYrL
	jPS50CUNRfvadYNwEQyLWwLxzvw3Wuuc+DLH+8aepLwyEErSQz9fZXgnd6PumXcYF2dml1DuLa1cy
	a8nGW08v+8PmutRoFCuuf/LEXYgu+yeCzLqP9VwLlzLyM3ISU4clJHEW5bHgX4w/zLjqKAkfKsQqg
	eviXxMO9oirsSbqQHEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67AH-00000003shD-3zi1;
	Mon, 14 Sep 2026 13:56:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67AF-00000003sfg-3h4X
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 13:56:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1887043DE1;
	Mon, 14 Sep 2026 13:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA933C2BD04;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789394167;
	bh=feMAIChGgZWfq9i+/AJEqb+Uj9SH6mGtmZ5aQlZQHEY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ljd0L+/jPoReQDlyfSvmhT2jQE5f1C+5nMkCqjepM/74/pJ4MSjsd6Lw/YVsZklyY
	 Riq1xE9Ah+rzeDGSEWgr1TRVH+qoE6U/e4ohWXlmgskhyZQekGaMBLhoG9Mv5t/uiv
	 /2AtOhi9+PlmThCrbVjql/AQpTwbH7whntW8vnC8VfyhzMFflIdVolsUmJH4AuDptC
	 FxlElNlARyskdAJUFakNzAzKv7phBnPoEJtEsk0wfcmwMAsEa5g8YEL5QCYn7vx+bx
	 QlV+yQPTxoTi2xoOSHkod3Xadq1NNY199z8db4hbt4VLxJFTT/tyOZ09LLvitknRBF
	 +dCJmt/hkbTww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45BBC88E73;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 14 Sep 2026 15:55:55 +0200
Subject: [PATCH 7/9] dt-bindings: interrupt-controller:
 thead,c900-aclint-sswi: Add MIPS P8700 gf compatible
MIME-Version: 1.0
Message-Id: <20260914-p8700-dts-v1-7-3267f14ebce1@htecgroup.com>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
In-Reply-To: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789394164; l=1111;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=WFsJFX8KbR9cAkA42pWDMyhUYcejxHY2wNhnlUtG9bs=;
 b=Y7p8yYv9zwnZFtrXTS2MrDg97xIcAaHrIiLL96HI0AQv1uDO2SVRXXJx1FZDMMtkpgsUOM0Og
 C41uzxDrVQLDtZAhRn0Vff+6OL7NlwO/Gug92lvhiUE32V0HhaDp3ec
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
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
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Add a new compatible for the MIPS P8700 ACLINT SSWI, with the "gf"
vendor prefix. The original compatible is left as is.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 .../bindings/interrupt-controller/thead,c900-aclint-sswi.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
index d02c6886283af790d75357f77a714558f68bb7d1..6c79d7b7058a64bb39141d565f0a6304365991f2 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
@@ -30,6 +30,9 @@ properties:
           - const: thead,c900-aclint-sswi
       - items:
           - const: mips,p8700-aclint-sswi
+      - items:
+          - const: gf,mips-p8700-aclint-sswi
+          - const: mips,p8700-aclint-sswi
       - items:
           - enum:
               - anlogic,dr1v90-aclint-sswi

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
