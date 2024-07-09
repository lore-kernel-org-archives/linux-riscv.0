Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1344C3271E
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 03:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJ+pf0tN/aoL1S4XaueER+9LoaCtTs0tCCzOZGUaGtM=; b=WES/x2OBId5LrT
	Q10rlCUelLmXvQUJE+25Mqy9fzOKI9lN1tjFeVznBBdAD4A/r/fXIfhrg7xNjmm0UiO1/dqiE2KYR
	CVCNr+rScVwGqvthAyD89eysCLbdn/m29JvvtE9TwujR/vHhOTdaQznDpis2Pj7ZhNQYWBlvEl4LV
	EWn39H9s+ZFKlpfxqYAulB/C4pDFOsmKjsVeQtReConTHQ69MDGLo5DzupjgyFWutlElidd2uMGhA
	lxlDxIIkUyY7Bg0oy2UZ/eS8UZ3gPtUTNQVxxUiVfGIbnAkrftqAzc7N53LAi4JdXZIQ3rWvQpEK+
	b+OiTHA9w7DFcSogzQpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1OY-00000005j9U-3pou;
	Tue, 09 Jul 2024 03:19:58 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1OW-00000005j8O-0EEF
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 03:19:57 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 09 Jul 2024 03:18:45 +0000
Subject: [PATCH v4 02/10] dt-bindings: riscv: Add SpacemiT X60 compatibles
MIME-Version: 1.0
Message-Id: <20240709-k1-01-basic-dt-v4-2-ae5bb5e56aaf@gentoo.org>
References: <20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org>
In-Reply-To: <20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=904; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=93gTwTFhHhqvEXaieSxNaeTfBJ+zIc4/WjCpYTUJ8uU=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmjKwib36Jxck8gReE9KCGoyorfO9cEOVEDCeox
 KLRxP83v/SJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoysIl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277ei3D/9hgvzeJzgcDjzeWR
 qEhM/Xz5xzgc1XoJcCKPk5mvGQvdUq5LEpNytHykOPHSBAAI9VoBBdQ7IWeB0LFtKoTOk9+WLiN
 WNjRyezD4HDf6a5Zf+eD0kvAnh/1T+8YaGu82lxmhPX+qvYhvxAqb18UODGoraxP74hcT27vOhe
 1ykQOM5ue9A3IFgQ4Hf3gKmDUth/aksQeA0/IP4xSl8QgdJX12AD7DGZR6Y4vTT7/aXLPTclVX2
 ZzGI+yN6xFdtKAAZHDOugD297QpoGNjjyA/kZfzFxRggZebOwb4ZnrNTym7M1yaWzlDe0kC5oDa
 RziL+x4OMYRIinadoaZCLHpNbz83t129lwD/tgPnTFpMVlSSwQqfrPLgDXTfcY3vFPFGXP2GGAH
 z4hAy0alU5roPhDrbRDq0tPAI7A3qPTWtmxBTS/lop6Ba5mAyExDDb+2KlgkjGBWOjHBx8ozxLU
 vg/RdJsIjZfwDQAKflFv3sGDPYdYF2Sxd5G/lAHhhNjsdVUlh+6zuYCvTT3epX5FGoI1xuaE1DT
 FlmehtJahjixeGR/lo9xHf5a9gAJdG9uXWiGC+8MmJHQEe5ig460sHxjA6vaG1ho9J1i6DJSiHz
 LAN9L+snFVvTLFmrwZlkm5WjvnwWn0ULtig6WUdzyaKuuDgGnkMNL/8ZBPB/A5eJuJ7g==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_201956_154206_B1637574 
X-CRM114-Status: UNSURE (   7.14  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Yangyu Chen <cyy@cyyself.name>

The X60 is RISC-V CPU cores from SpacemiT and currently used in their K1
SoC.

Link: https://www.spacemit.com/en/spacemit-x60-core/
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b5..5ad9cb4103356 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -46,6 +46,7 @@ properties:
               - sifive,u7
               - sifive,u74
               - sifive,u74-mc
+              - spacemit,x60
               - thead,c906
               - thead,c910
               - thead,c920

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
