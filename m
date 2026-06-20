Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72791CDB46B
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jun 2026 06:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9SgiuyoflVbIR9JfvTQFgjOtDq9jp6xjWoqzYfIs5g=; b=SXRP1zBMvRj/FZ
	43lKL8o2md1k1LtuEux2FvIOA/DB1VpAhWqKrJy3uhp3VgyjCRdHg3cjSssbSeGrvB3ciENH2B2oi
	dgAoPHETVMSgs/WF1fyvXGkDrOkKVkLTAYseNS0Ge/impsBfCtU4NzCaB1P0dhYjXjtJUDW5XdMGf
	xUfHQhYEU9GVTEnKP0dMvJ1vMgH/asp81XzXCBDe8PhwPkKzZqmiNLXoxRO7hewfMhg+a+0vB0sdN
	9hQB+pFopc1hUts+7rgSCo6yzzhtfB55vtAygfM5xdOViyPzhmj+sSMnQP2lX0tu81Yk6gOpuojvd
	kehctpaZ4MQ68JBf24Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wap6g-00000003CAT-2Apu;
	Sat, 20 Jun 2026 06:23:06 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wap6b-00000003C7p-3Jbm
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jun 2026 06:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=tROYkmU4fHW2liLJr2fdOl3XmpMuw693HPJxJNUuxvE=; b=N8o7YjXnWei+quY1zVnWPrbvhf
	4UGHV6Q3lxVvXw4VYqjSBOiSEY0EiROa7kYJCa6AyZETwD+AzfSVOGC8Uvap5yajVeDzz3Kq3IKnD
	1F/NIZWEf7CdBnc/nN7Hj7XSYzxP2mAgeaF3UpiXiMqXzcObbcLNND9CF5BJte76odu5FC48Dba15
	Xc3qEyOriVm8ZIO1amgWwU3eTvSqP4+bIzooC600IT0SwIwLVVPId6yMUMLSBbTz0C1oWm76iiM6l
	lsKeX5QFVNSwGJlYooAGYfvfPyn+3+qZMMRWn2tJ59WJz0EbJemsYD8U1PIn9tQjLVURT+lmTpZ0r
	d2odhs4Q==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wap6T-000000006dl-26zo;
	Sat, 20 Jun 2026 08:22:53 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 3/5] riscv: dts: spacemit: add 24c02 eeprom on K3 Pico-ITX board
Date: Sat, 20 Jun 2026 08:22:04 +0200
Message-ID: <20260620062238.3199108-4-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260620062238.3199108-1-aurelien@aurel32.net>
References: <20260620062238.3199108-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_232301_825222_C00961AE 
X-CRM114-Status: UNSURE (   9.40  )
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

The K3 Pico-ITX board includes a 24c02 eeprom, that stores the product
name, the part name, the MAC address of the network interfaces and the
board's serial number. These values are also exposed via an
onie,tlv-layout nvmem layout.

The eeprom is marked as read-only since its contents are not supposed to
be modified.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 5fe9041ec5702..0a0c221c99e74 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -47,6 +47,36 @@ &i2c2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_1_cfg>;
 	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <8>;
+		read-only;
+		size = <256>;
+		status = "okay";
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			mac-address {
+				#nvmem-cell-cells = <1>;
+			};
+
+			num-macs {
+			};
+
+			part-number {
+			};
+
+			product-name {
+			};
+
+			serial-number {
+			};
+
+		};
+	};
 };
 
 &i2c8 {
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
