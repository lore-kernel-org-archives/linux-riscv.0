Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF0CD185ED
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 12:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWlElfXh0pghP4Y67InX8ymLs2TWSOIqY7il+yrHpwc=; b=s66fJkz7iiJk73
	7MX2S5w+9t++MQ1DVGnQ0Hx8HsYjz/kkr5LeXzZWusgXp62zRLPZ/7/dxsDNDogP3PIY+pJxmxZyh
	VYQ5tD0i/O7gzYh50Cbx/sr1v2S8hIGC2zjrG0wtYcv+7wL0qInHSOVNG4NR1OCYO30Hih4cShPxp
	+V4BUChBXXSmDLv2JbUu/90pMT0StIoXzJzZnH8qattW4Y0WkNB0sFirBUnf9+5A027DDJ1N23RSR
	TflfAP9tEeG7vWaq0pS/PD4zsX28zoo06Av4qvsys2T2wkt+XPWqg2evyYugHKN+IbCrwmguDVE0i
	hExbIlgqTIM0Z3IcvqPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp7l-0000000H0Qm-1DNp;
	Thu, 08 Jan 2026 12:28:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp7k-0000000H0Py-0jst
	for linux-riscv@bombadil.infradead.org;
	Thu, 08 Jan 2026 12:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Vr6lqGLFQ3xLUl/SLHoUY02BcAcuWIW3ayvn+T++ix8=; b=GvIZwyydb+fl+m8MepncMCxeEN
	Z15GuaJQlrL+D3LHQ6j5TnwjD0GAgHyFopp0Dc9RWtVhNKDnvixC3tQ6Qe9/fwtHnyLXDsU7ntATQ
	Hq8l+FkgXSiNR+N8o62WE53XA2YkIU8GNmTxz5PXGQ13mhPveZ7EiO8PwKX4KEaTbI5+/6LgQCaDI
	qF7pAo9f6ytPFvap++2qrLh82rRfOFzXhFYDp1btyZDc7eRMQi0AGRBS+G5V0FShx2jcNhk19F2PR
	MLPLr/otsgyigHzuD8o8SXk0vjUxMz95HtaunOLzFf0TLIjgwSIz4JtAi+MfKU/U8wD+d6C998Fk5
	+ltoBOiQ==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp7h-0000000D8hG-2NpX
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 12:28:19 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso3367622b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 04:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875296; x=1768480096; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vr6lqGLFQ3xLUl/SLHoUY02BcAcuWIW3ayvn+T++ix8=;
        b=agr5ZoDwF1XZ0vjMkQD9uUwMuM9abmmZHzxTW7hN0jpFZHNotYyC81qm3xpzkvxmBu
         2jY6nP2lQX4jAccG2nmUpqqSJ68MUrp5uZfBbK+pX8uNc0sNZJA8GUSdmUmYDjXZtYmd
         h2M8/hzdSIeF4KvPIzFM5/gVugt2RcCz4PjXoiT/NDHP4eNuLbYOMYj8Ss9buedUrQvR
         cZNlRv6EY3S0Ebyxdy33lnQ1FyZl63UrOH1+JmX5Rca4UYAWl5XuiwgBs3HH/HyPTKFy
         SbdkKKzlEOqZ/AyabGCKmTREwM1PqELPl8SQqoXM3glg+D1zuxagUmBbwUHBIRrTnFIe
         U79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875296; x=1768480096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vr6lqGLFQ3xLUl/SLHoUY02BcAcuWIW3ayvn+T++ix8=;
        b=Y+bxyDv2AxSzI5Qctgv+b4H4OrhiwuBA/zgSrbGu5fD2nNYoNUptqWEGkM24pyph62
         tQtNZRIFSN7m9Qw3DAFveYYvEG7p/LZdS4VbU+E/gWXUgsswDkZTF51AkiETpnxkb9/n
         c7RQSl/QuHjHdzXXo6fS6V5zTapCdOt73TnUxGgRs+GQc5NxzGJ9fQP6muhaiPmZWd8v
         xCx86QE6+9Vq81wE6cc8783dF3fME+sukpaHqdn3HKclXBXHrIe2/MHlgr8ZoADkRSDR
         qYv73p2eCeRWNAIdt5K1cgSw8fylF7PJMSSUSoQYw9keA07/6FvKLLBh2EjYXa1RK+Zt
         rf2g==
X-Forwarded-Encrypted: i=1; AJvYcCVrnEN9qLkwkbTqAOoKjIfRlAIoCN3vyzZBCPEwxAfA5qYFWAbZy+u2eO6I+g8K7JQhdi0Cmag5q7XhVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvOKZDdcBtDIzR5B0ZhaXICfi6DouCgw0OROQO+K21RH4oMpwa
	R8oeBlK9ha3e2qwTrI0hePauNWMiF8CfM57o9YQLqTckrRHiTwuDAlZlo7my+xIUtc4=
X-Gm-Gg: AY/fxX5sLbuzXSTsSdPOuirA81UdBBln+tZhJmNH0N9TgPfISJeG1P6DJpAubG6FUmM
	yUUcLLIGhrdg0CIRes4nkRz2VzfKGcrKrjQ7Of+xxN2KcAZgP8n6hXLh4+oz/6kznU34L5bCLTd
	njIMKP5W+bcXxoZj5utcw+fValZaPlw2e6GBnG46d6p0+PiuXAStEvIcjUTefGFxl4V/zfGQW/4
	K4w6a4yuOZ2bJcmYiQZ1IUgYCdTbYK/vvtZpa6pFjH+QQJjlpAohGsYjz5syElox9e60fo1qYjK
	TiEyoVJYw9njL+uNt9Keq7uYlkcIWN6qcU5fjWzCtj6r+kc7SLDt80fbZIZF6acxaVJ/ykCgZY4
	B4pU/3IyyzPdakQiuQx0y853oSD3p5FIU5w3HU8rIcGobCJ3hzQ3oI3vs1ZKfLKoK/mwcIT0zD3
	gSUJYak/R/3gd1YSMkmYbim3+9niAXZKg=
X-Google-Smtp-Source: AGHT+IEp3lIqQRQ8F/+xV31qGFYy3RxmeX8QufC32EgJpFKkC8v8rt/OnKylZz/xtgAcQ5aWbSQxCQ==
X-Received: by 2002:a05:6a00:3688:b0:819:bad0:1002 with SMTP id d2e1a72fcca58-81b801ce2e1mr5550278b3a.66.1767875295662;
        Thu, 08 Jan 2026 04:28:15 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:28:15 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:26:02 +0800
Subject: [PATCH v3 11/11] riscv: dts: spacemit: add SpacemiT K3 Pico-ITX
 board device tree
MIME-Version: 1.0
Message-Id: <20260108-k3-basic-dt-v3-11-ed99eb4c3ad3@riscstar.com>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
In-Reply-To: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_122817_669177_8EB1ABCE 
X-CRM114-Status: GOOD (  12.77  )
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

K3 Pico-ITX is a 2.5-inch single-board computer equipted with a SpacemiT
K3 SoC.

This minimal device tree enables booting into a serial console with UART
output.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change.
v2: Add aliases node in this board DT.
    Update the memory node to reflect the hardware truth. Address
     starts at 0x100000000 (4G) boundary.
---
 arch/riscv/boot/dts/spacemit/Makefile        |  1 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 38 ++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 95889e7269d1bae679b28cd053e1b0a23ae6de68..7e2b877025718113a0e31917eadf7562f488d825 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
new file mode 100644
index 0000000000000000000000000000000000000000..037ce757e5bcae0258a326ea6265185d761f2b52
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
+ */
+
+#include "k3.dtsi"
+
+/ {
+	model = "SpacemiT K3 Pico-ITX";
+	compatible = "spacemit,k3-pico-itx", "spacemit,k3";
+
+	aliases {
+		serial0 = &uart0;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+		serial5 = &uart5;
+		serial6 = &uart6;
+		serial7 = &uart7;
+		serial8 = &uart8;
+		serial9 = &uart9;
+		serial10 = &uart10;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	memory@100000000 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x4 0x00000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
