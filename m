Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A66D25B4C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 12:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17//mTlh12x/BHA2i/1MkSGnEXgss/GP61HwwpOz3Vg=; b=DmNGBkfWlgFGDA
	le7grAxXRHCgssqjiC5NjA9kIi+4wstJ0neeAVyJb3TtYNEwVZxwjOdjSw3//fuJPbKCiOPk4vr/T
	8uByak25rUfLQ6mVzLG+cxQl/eUMR1IAoUkorb92Ue2R2cyD0IENXarE7wG4nl3eBwgNffOeRqgRi
	XqJxDUlJ3PoVFr7qJBoLaduedhmgzx08g2czg0Zz5bLmNXEJDX4VLvwla3w22Tx27TESR3pZdwEE/
	5X01LoD3gH8gNL/Q6PLM0MFNmpGSpondGh3Xu0HcvuC6B1sZfhicLzxFSCE6sv7LMnP1eMRCmkdEn
	GsgdogZaNigqdnzln5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4cM-0000000FzjQ-1JzY;
	Wed, 28 Jan 2026 12:25:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4cH-0000000FziB-0RS2
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 12:25:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 540F860126;
	Wed, 28 Jan 2026 12:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0221C2BC9E;
	Wed, 28 Jan 2026 12:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769603147;
	bh=YUyTnratnqlECwzSAzk6FREP35eA7ZpjXULZWweNn00=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UjoBPkppqn8rtO4vKy06deYyu4nEch30VOjE3bjy/VoXTBZk4h65wHGWcKMZCODQz
	 UA8DLH8KxZsWyKahslFBiWxkb9ANq3GL5jp9rE+ifRxmYQoWFkCPNnYtABy2JzHlPj
	 crqzUpII1nVBf3KC53dJjJ+60PxmRMrvy1h7mNYZNq+RCU4PHQTP8lbpV1n4k0Mc8L
	 uZgEm2+C5vqQdRxR+NsE2/agxnnl/qxx5+iUM1+UQNMW3gXw/v1lTpC42xxSs1m4OE
	 ox32ny50ToD3DLc4h8ss7AaxO+KZgUWtCzOwPHxOF0Z4xYC1izFWTM86KLOzBOtqxs
	 hLWAAimfbKnfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7ED3D25B4F;
	Wed, 28 Jan 2026 12:25:47 +0000 (UTC)
From: Ben Zong-You Xie via B4 Relay <devnull+ben717.andestech.com@kernel.org>
Date: Wed, 28 Jan 2026 20:25:47 +0800
Subject: [PATCH v3 4/4] riscv: dts: andes: qilai: add I2C controller
MIME-Version: 1.0
Message-Id: <20260128-atciic100-v3-4-8c002fcc2bb4@andestech.com>
References: <20260128-atciic100-v3-0-8c002fcc2bb4@andestech.com>
In-Reply-To: <20260128-atciic100-v3-0-8c002fcc2bb4@andestech.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Ben Zong-You Xie <ben717@andestech.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769603146; l=723;
 i=ben717@andestech.com; s=20260120; h=from:subject:message-id;
 bh=lHt2jE6+LDmM/nXD6n9TCCx5A6rJ3cqG+Q1RYfyMh24=;
 b=ccLAKZkoxh+ypDT9aqYIJZXyBbiUKMWGPeojaXOGtFgKOjUzLSWq5zobh6hYafCbsxBnvUDRo
 YnPdTctjgjNDRCgcm6B9SaJGo82neYFZHQZ+8isvziAopFYQ/XzYb5B
X-Developer-Key: i=ben717@andestech.com; a=ed25519;
 pk=nb8L7zQKGJpYk0yvrYKjViOZ34A36g1ZIsCmCsP518s=
X-Endpoint-Received: by B4 Relay for ben717@andestech.com/20260120 with
 auth_id=610
X-Original-From: Ben Zong-You Xie <ben717@andestech.com>
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
Reply-To: ben717@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Ben Zong-You Xie <ben717@andestech.com>

Add the I2C node to QiLai DTS.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 arch/riscv/boot/dts/andes/qilai.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/andes/qilai.dtsi b/arch/riscv/boot/dts/andes/qilai.dtsi
index de3de32f8c39..8b40f4d7f8d5 100644
--- a/arch/riscv/boot/dts/andes/qilai.dtsi
+++ b/arch/riscv/boot/dts/andes/qilai.dtsi
@@ -182,5 +182,12 @@ uart0: serial@30300000 {
 			reg-io-width = <4>;
 			no-loopback-test;
 		};
+
+		i2c: i2c@30800000 {
+			compatible = "andestech,qilai-i2c",
+				     "andestech,ae350-i2c";
+			reg = <0x0 0x30800000 0x0 0x100000>;
+			interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 };

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
