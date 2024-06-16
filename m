Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672E1C27C53
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6B8Hfsapkzuwqq+wrGxIGPqu0htX7K3tyWgBLkkcMo=; b=vtDJhFICY0LJ2Z
	MXjyOBXvrSETR4li8J892Pi2j0ZpLCzA7eX2UPOKNcf0XIAzlCl2oF6GAviJRClwN2+cJOYi/uAr2
	KmL0lyicPY76iLUJh9Tf+Pg5bGgiAO3W2twhwkoYn2oJnrYwQMfovxOSZ8lblfMhaH9W20L4vByZh
	UmxC7Wuki54FrTnPkyOg37w66FURaXX40ghQZhuDC8ZU1+gtPEnsP0baesVCaMmU2GTcCOKAUfbJ5
	kAEt1DAVGLb4B3fusVcoFBz83/6Z+Kak04cbCxvqyfeD6UMoz3x2hkepPhZtyKSZmz6KOcLc6U3S9
	GSI8o+PO82Yk9Hgq3lEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItZR-00000007yAH-1TOl;
	Sun, 16 Jun 2024 17:21:37 +0000
Received: from out203-205-221-153.mail.qq.com ([203.205.221.153])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItZM-00000007y54-0nes
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 17:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1718558480; bh=4TsNRvdG1NQQAdbELi3/OvMmViVBRkNVoBLMMVaWK1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rhv25WtyUpKbhPGwTOvBB68on6EsFbRmExJKlcOAI48LpWILVlBgEzS30ntlHhQpc
	 ZTsxshFvGQMOLCfO9iR33PUM5G9mMbBRHm4ASB4Xp0wVc70+28TIuqvRTvFv2uJPGL
	 fegiiSN20VBePGBLXpEmH7lqz32lz32fubcdq73g=
Received: from cyy-pc.lan ([240e:379:2260:ed00:cd33:e8cf:d8f9:bed3])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id 5452D659; Mon, 17 Jun 2024 01:21:05 +0800
X-QQ-mid: xmsmtpt1718558477tyhsnv86d
Message-ID: <tencent_904B1050FBC0B10A172C263924BD518F8F05@qq.com>
X-QQ-XMAILINFO: NkHKfw09D6j8RA6sM/aK2Q+9dZcLaP+4NJQa9FQkX6htwVjNCVrAuZ5gfdMI56
	 0aA8f9z8guNkaFGAs65Z/o2KgVEJYvcd/QY3iuRt0CW9VcRBXEAAKHD1Mvwzj5yv0iGpxDiftMD0
	 IuxdwCbMTidsy/7axyyLf1wk6W5M9kD2n7R0ar6PU4rRWmTYt8rOWeNoMpKyadSzBmWKHM/JxZbZ
	 r/cmk61LbXOTBOLXZlE3mZ6m51MVDkj6E/rv+pr55Z+z5vI2DjxZd5L1RzONPQihfDTQCJ9AldWy
	 wQDXtCb5vs2TrVnpkzJB7kVJ+1ouniZy25DC0uvfNChmXJOqkKr/M8Qdp4auqXO+y6akZbSPnqd1
	 OgVWlmJkZ/55zS7fUJs+rJPy8VoVzz1r6XQ77b0B9sDFS6ZHTKYapUX/n+k6D4kZDplYcEld51s0
	 q9X9z6oB54QYdB6icx6bmV46Wl0E+11AnX1cQGSj6bGI3EHORbFd5mTflyggK1DgU8Z1wB243J7d
	 9B6Sw161M0EYK8KH8t5LaQhpLXshVlx7ENsPz18qiP5wAY8DuOwNkfnkYSfja2qV/1hYKV9zuxC8
	 3G0iZY9PzFureZxC/qW1m8MbFD5etIwn0P7FPOP7wMYv97Z8TTXuQOx0sFYwWDA9ZfmlvVSDKkTV
	 8a5782w88sM0HuVlbd1yzKfao7fyNOkBPn37mahwfi7uOtWE8xxM6fGdmjaycoJVm+ZVB9Ty3Wm/
	 EDzieAYZRfNc6YRFgEX8rUO91O8pvEPjc4YHWZlXTxNxpy1lq7S3npjl/zCHeQldfOjxOA3n+YJ0
	 9j8w/fVoY8bpy8Cv3qxkyseSLhnBrvkxyUB9fwxnLqraM+BSJcUya9jp9IWJDOW4HxAjteAT7+ph
	 An+i7qBhyDVcMS3gGnG3kpi7mHyCB13aBs9z2JWb4mbSVdbBxDD+fAC1zshse4wu8CehtiNYIO01
	 m8Be11gHTz1xXuPndactt3OzVkZycHM6a8Z5WjQ+/0NgUstFIRyCe4KmGXFzUe5IkApHFJK+rTFv
	 K87rDm4ZWrZVJQYFYilZhF0XqMNGlTpRZSihoK8LZrWjKe+hu75uwD8wNypnUd0dlHcSvxYQ==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v1 8/9] riscv: dts: spacemit: add Banana Pi BPI-F3 board device tree
Date: Mon, 17 Jun 2024 01:20:53 +0800
X-OQ-MSGID: <20240616172054.3074948-8-cyy@cyyself.name>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_102132_612159_11E02539 
X-CRM114-Status: GOOD (  12.45  )
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

Banana Pi BPI-F3 [1] is a industrial grade RISC-V development board, it
design with SpacemiT K1 8 core RISC-V chip [2].

Currently only support booting into console with only uart enabled,
other features will be added soon later.

[1] https://docs.banana-pi.org/en/BPI-F3/BananaPi_BPI-F3
[2] https://www.spacemit.com/en/spacemit-key-stone-2/

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 arch/riscv/boot/dts/Makefile                 |  1 +
 arch/riscv/boot/dts/spacemit/Makefile        |  2 ++
 arch/riscv/boot/dts/spacemit/bananapi-f3.dts | 19 +++++++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/Makefile
 create mode 100644 arch/riscv/boot/dts/spacemit/bananapi-f3.dts

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index fdae05bbf556..bff887d38abe 100644
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
index 000000000000..5c512f4e297d
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SPACEMIT) += bananapi-f3.dtb
diff --git a/arch/riscv/boot/dts/spacemit/bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/bananapi-f3.dts
new file mode 100644
index 000000000000..023274189b49
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/bananapi-f3.dts
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
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
