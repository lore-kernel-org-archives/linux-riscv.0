Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688EEC43458
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 04:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otIEmqaJ/+KJAqzj60OmwiJh6qdsJ7CWG6wI651iu3U=; b=bGtnm8RclNmROe
	3vrDBL9Z9xhksKt8SmLgYP43NI4YRIDejdBx4UbgjwubBToDbWF3BNZcstoOlKMPDyrc0CSDrZtGe
	bQn3/cvMCcbBdGFJo0nf+ZR4Pm7t6XRQ49ehr06UyP2BJ6/nEbY418U8LgYhGDKvEkrmDz2CNiGyW
	E4QWFXbg/bKbeBJdISgMmUgd24AyUOzFrVwu16/PyU1DLPfM9ZoTn65lTdfaqzrHveRAQjoA9LW1l
	Q/ZPCeY5eh7DqmuvWLfpRvjuxY13K0si5vYLxZA8U1mjOOixpjbXxZQqDtUeOdgp+7DEqRecTK0c4
	mg55jClwNyY9eJvIKC5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wilNH-000000076rD-0uW5;
	Sun, 12 Jul 2026 04:01:03 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wilNE-000000076pq-2lcy
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 04:01:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783828851; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h/XnjM658Nayk9mXPOaxsITQOGzSqVIpARpS9XT0pmImWLEBHQu2ipNB+1wM3eGhLUeZCyVRzeGi6CTckvhIsZwxa9g1zZ5WxBKj5p/CCjGkyKv/Ub6hhZjJ8wJfU4nnp56cc5ukEd+7Xqzge89cEODB8Ejkfx99CQm5XNgCupk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783828851; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CBuhzYSYJIgaFs6XQcVdMRF4R/1PuJ0AoLQ4+jP3JRA=; 
	b=gSPQOEZ4PBiBay3zZe6rTHADS+J4keBpLvQ35Hw8n5GVpQcvnDGwBDpdiXELoknxtNRqQd7XcBjoLMuFRvsppN+kr/i0nIosBADxK9UH8wjTPlBZBX1bL9OF9xm8BlfGKzDCMiCDkJP7nU0qtKL8xbCh/8l1XAknOYFcrOu2mHs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783828851;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=CBuhzYSYJIgaFs6XQcVdMRF4R/1PuJ0AoLQ4+jP3JRA=;
	b=NJwhDzrxObo8PEAAuYea0jJb70tujElMgmyW6S+383LEk3N8FXzHz1yGNZyzEg/q
	2kbi868PWst9j3RccW6KjMn5exEJQz+QtEvxRdI6z7jPrIcLyYRP785ZkjushY8pMak
	z6eXPBw/xoIECFDeby+9eN0ev0lDQBH3O0CGsiaU=
Received: by mx.zohomail.com with SMTPS id 1783828848851646.121581141173;
	Sat, 11 Jul 2026 21:00:48 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sun, 12 Jul 2026 12:00:01 +0800
Subject: [PATCH v3 1/3] dt-bindings: riscv: spacemit: Add Banana Pi BPI-CM6
 compatible
MIME-Version: 1.0
Message-Id: <20260712-bpi-cm6-v3-1-8d1e2045179d@pigmoral.tech>
References: <20260712-bpi-cm6-v3-0-8d1e2045179d@pigmoral.tech>
In-Reply-To: <20260712-bpi-cm6-v3-0-8d1e2045179d@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <guodong@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Paolo Abeni <pabeni@redhat.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783828822; l=1249;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=L4I6HPJwdArISHcwslrK/IW2jWyiR3OIIY2y81slq6U=;
 b=05tmEBYZjO7PZMUzrRXciH5oal6OpRL83COJVtNI9lhWu+FuzDh5zGjJgomzLv5/2yvR1iBct
 OaMGxaR1X+TD11FFIjS/y3PVmqk0KLmRgvseSGpQYCD19+PCZGIry/W
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_210101_081712_DCF79BF2 
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

The Banana Pi BPI-CM6 IO board consists of the BPI-CM6 compute module
plugged into an IO carrier board, which is used for evaluation and
development.

The core CM6 module is based on the SpacemiT K1 SoC and provides PMIC,
DDR, the eth0 PHY and wireless connectivity. The carrier board extends
this by adding the eth1 PHY and external interfaces including Ethernet,
PCIe M.2, USB, MicroSD, QSPI, and serial console connectivity.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 311bbccba0ba..4ee9c88984b4 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -19,6 +19,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - bananapi,bpi-cm6-io
+          - const: bananapi,bpi-cm6
+          - const: spacemit,k1
       - items:
           - enum:
               - bananapi,bpi-f3

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
