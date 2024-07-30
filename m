Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308C6C3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 00:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVGwU5Ln4SRSx+XsqOcCckHTFEosnq2Mo9ccYLTmCuU=; b=DgfcJgkgSIEJnx
	6WW499ws7QrvjraiNa09Nr1cHEwmmQiSqB983rcIV/0cysLd5p5mVQpYSj/IgYYep2dg0aBs8go+O
	2UkgM4ZaZnrjYyyuAznWOCvp7bTeVZIe9rTP8JSo6o70rZpSxFygof4w0/ZUvCV21D2ztfKa54iv4
	RMlFLtwVM7Z3is1s6pExu6x2n5vKqVXy7nDW2bvKxp9sVzJ1uDR3VapnfFU1PMyJz7lKXUtidhgbq
	259V9dqU9y37qgleJKsv0Ep0Up4H/ILaUVGoK5rTPzirumo/euVwC/p1EaF/Yb4JngkYpBqL4MsNl
	N0a3qwzlTyYBpUBZpBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYakF-0000000D66U-1n3g;
	Tue, 30 Jul 2024 00:29:39 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYak8-0000000D60C-2gyH
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 00:29:34 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 30 Jul 2024 00:28:12 +0000
Subject: [PATCH v5 09/10] riscv: dts: spacemit: add Banana Pi BPI-F3 board
 device tree
MIME-Version: 1.0
Message-Id: <20240730-k1-01-basic-dt-v5-9-98263aae83be@gentoo.org>
References: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
In-Reply-To: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yangyu Chen <cyy@cyyself.name>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=mJc6hZeXKZcPaMSmqXhuz5fuxopioAcnLOzTKcNsQPA=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmqDO4E6d3UZe/bVuVUZSjoK3XM15I9PwC3cJs7
 CKafXBjhxmJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZqgzuF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277RTzEACXo4PuyGGsPgWFQb
 +ypG7l1MUq8ZaLsBJcjgBmuCk8I5kuuAOk08+tf2UaUXepmHSkMLOBm3lk3mTum/WZrnJoxBgWU
 G3JtHp1MXt4Ubhhk7bJaqAdz+jHPbFsNQVzRsjnCOx6bq791hJCIj55uzr3bUnvzWk+r4JKnKt0
 sMo2oNGnPo8HvzNethk0K6yOe5oJRJ9p/GwFoAQfYTFlOpWSvCOjTDgcg1zJPXMHcbMOfb3ypND
 7nfk3MM0bTZm37anplTUOGdV6daFGvLfCtgxUhqjFyE4+AUpKFpiumTwdn7KH9/aCMqZm7ysWgh
 czAIrJhyDRUsS8UydZAxc8+rbJvNe1CezdGXL2yWojMZEskzg/2XWQPUCbhXA+tNcm9xtm9hZvU
 G98Xy9eFkmtulElli3DsIrgVEvozn4Vl4Sxx2Rlwa0Kxi7VyULK8eYmJTioVZO4QFpZDwNcnKHr
 KZA+fMot+ieLJCf3UEwQX1D0hzTDPaEWaIpjZjHTzUdSMRbFU8M20S8zYHF4t4XnD7VMF0rBbLS
 TTKHQn6KqvmENFt2JJpGRQwyyTiKZbrrB+d3o4JLwEjZgCb+QAw6gaTOI2oVKapcplpVot8WT8B
 Fs+cQfVtKhHLJZy9jWU9vLXDcKOutKgPs15EultBf1inzx1V1xJAS19xk7/weH05af1g==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_172932_815264_1D8401A8 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Inochi Amaoto <inochiama@outlook.com>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Yangyu Chen <cyy@cyyself.name>

Banana Pi BPI-F3 [1] is a industrial grade RISC-V development board, it
design with SpacemiT K1 8 core RISC-V chip [2].

Currently only support booting into console with only uart enabled,
other features will be added soon later.

Link: https://docs.banana-pi.org/en/BPI-F3/BananaPi_BPI-F3 [1]
Link: https://www.spacemit.com/en/spacemit-key-stone-2/ [2]
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/Makefile                    |  1 +
 arch/riscv/boot/dts/spacemit/Makefile           |  2 ++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 19 +++++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index fdae05bbf5563..bff887d38abe4 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -5,6 +5,7 @@ subdir-y += microchip
 subdir-y += renesas
 subdir-y += sifive
 subdir-y += sophgo
+subdir-y += spacemit
 subdir-y += starfive
 subdir-y += thead
 
diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
new file mode 100644
index 0000000000000..ac617319a5742
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SPACEMIT) += k1-bananapi-f3.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
new file mode 100644
index 0000000000000..023274189b492
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
+ */
+
+#include "k1.dtsi"
+
+/ {
+	model = "Banana Pi BPI-F3";
+	compatible = "bananapi,bpi-f3", "spacemit,k1";
+
+	chosen {
+		stdout-path = "serial0";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
