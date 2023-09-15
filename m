Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C455AEE6425
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=exnRftwlzJa6cGVBZiUPXBcO4i1OSc0wtRhh+/b1z9M=; b=zQL/zlOUzUH41M
	9GkqIhQte3eMc9RK9fOW0YUkE+9tSHmkidHTcNpREJu+U1tqGEtCTAQThxMGnfOhIF+lzoxhYl57W
	7C7y0BZl6ixgtWduwz6CkfIOskq8nXltEdpPtSWAlolI6ySEXkl99g0W5Pu4guHXECmtF1C64dnNe
	AU5kSYpuPyYiDZ4xU5u2VBwqKapZrIU9M0QxJnqsclSiQlPxtloyniOJ4yy0M6SWgGamb3JkQX65e
	p+65vW9b6nBqLVvj0zHRr+nHGqDOBPe3pzdgRF/vF4OzP3gnmh8POSlIb45DFsADwvrMrB4riomNQ
	v1Yh7hfZmyWHTzlb0ADQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3CM-00A1Xy-1L;
	Fri, 15 Sep 2023 07:25:06 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3CJ-00A1Ve-09
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:25:04 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5733aa10291so1081828eaf.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694762700; x=1695367500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iVUDT6l1ChAeIi0RC+WcBnGHyj8AAnCtHrqteS2EV7o=;
        b=G+EWPGz0bksaVKLFjh5dXDXlM7BwX3MhbgL9Mu/3nUtSbjQ3BTVnKODJtCXLbf/D8v
         YFX3nne0OwHXzxQMiC99EDB3veJSQLMOiUbpxcbjuCfUF4YONY2xYG4VNsgXZ5K/Tk+2
         cHrg87zv2zWZMHBaWMy06Sa7R8ecc+BUh9SXnO6l1uXakL6PcaRN6tGDHQJwxg4YHH9H
         Ej/VZ3yucSdHR2FVmwbIDFgYU1G5nnVIBc/CzEFm5z3dEvV3vWPzuPgGLIXWtgMBQ8aK
         eUIhw6mF4iWZdMHVePyDPJWmydm0fy7A6knmne6b9kPY/n1ve7FvA37NqbbPzGGact85
         NFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694762700; x=1695367500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVUDT6l1ChAeIi0RC+WcBnGHyj8AAnCtHrqteS2EV7o=;
        b=ZPH++UprjuSzQ5pgq44RhoAoM3xbvg+8FlemjrIx2v/j+p0RcpGRWkrXyJwZMhoOIM
         3Bd60l9G4kTDvRedM/fqoXANPDUZTJwbnQamD1msCrjXHklHueMsFtks8va6oSCBOzuf
         kbjkXKDTMulNZxLHQaBhc9PKkU7CKtZUWHHBEa59ge2i0XDHAohTa6QwlW/F2i7a0fK/
         OkYgfc12eKvjVd1xPCIzYnGvQxQZFBEBUPXTHv6yqO/Y8tjkEbHSzarjhF+QgCKAh30k
         vf+B58/AsnIAw6Guly8Lz1pW1ZlImYZkkAXIfRBTUvjomNQK++eDfoXVLC3/YG2ANFz3
         cRaQ==
X-Gm-Message-State: AOJu0YzE8iTmTCJ6D8eUCoQ7lhF6JB1RJ0LDuvS9Mi91IjNcujM40x4V
	H9F7vf/JIJl1MKr5h3Lp1bhtnetyMQCfHw==
X-Google-Smtp-Source: AGHT+IGRLqRmoi2bf3u+M2EgyNuwEZFJdJ+tXdS9Q7q1+tkpKnPWtQYrlA1xI42427rGwp5xsUjCSg==
X-Received: by 2002:a05:6870:5803:b0:1b3:8cfb:78c5 with SMTP id r3-20020a056870580300b001b38cfb78c5mr1029357oap.34.1694762700635;
        Fri, 15 Sep 2023 00:25:00 -0700 (PDT)
Received: from localhost.localdomain ([222.95.63.58])
        by smtp.gmail.com with ESMTPSA id c10-20020a63a40a000000b0056b6d1ac949sm2131946pgf.13.2023.09.15.00.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:25:00 -0700 (PDT)
From: Wang Chen <unicornxw@gmail.com>
X-Google-Original-From: Wang Chen <wangchen20@iscas.ac.cn>
To: linux-riscv@lists.infradead.org,
	conor@kernel.org,
	aou@eecs.berkeley.edu,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org,
	guoren@kernel.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	Wang Chen <wangchen20@iscas.ac.cn>,
	Inochi Amaoto <inochiama@outlook.com>
Subject: [PATCH 08/12] riscv: dts: sophgo: add Milk-V Pioneer board device tree
Date: Fri, 15 Sep 2023 15:24:51 +0800
Message-Id: <20230915072451.118209-1-wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_002503_092150_7C705E42 
X-CRM114-Status: GOOD (  13.86  )
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

Milk-V Pioneer [1] is a developer motherboard based on SOPHON
SG2042 in a standard mATX form factor. It is a good
choice for RISC-V developers and hardware pioneers to
experience the cutting edge technology of RISC-V.

Currently only support booting into console with only uart
enabled, other features will be added soon later.

[1]: https://milkv.io/pioneer

Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
---
 arch/riscv/boot/dts/Makefile                     |  1 +
 arch/riscv/boot/dts/sophgo/Makefile              |  3 +++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts     | 16 ++++++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/Makefile
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index f60a280abb15..94788486f13e 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -6,5 +6,6 @@ subdir-y += renesas
 subdir-y += sifive
 subdir-y += starfive
 subdir-y += thead
+subdir-y += sophgo
 
 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
new file mode 100644
index 000000000000..5a471b19df22
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
+
diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
new file mode 100644
index 000000000000..4f480ff88fbd
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2022 Sophgo Technology Inc. All rights reserved.
+ */
+
+#include "sg2042.dtsi"
+
+/ {
+	model = "Milk-V Pioneer";
+	compatible = "milkv,pioneer", "sophgo,sg2042";
+
+	info {
+		file-name = "sg2042-milkv-pioneer.dts";
+	};
+};
+
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
