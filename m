Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA74EE674AF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 13:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42AjXYdG6uArU03e6e1m/vqovL4RzRaDX+gPigkn3G0=; b=TBqrVU9ahMthvf
	hkS9E/Zlo3clBgus63c5KkJHxUsnZDD+NKXs+fSVscqU3EMmdAKMbpc9rxOyrubSk0ith2DYjO3hI
	gub6Z0FY/hYV57TNd10Va7cRdhrhxcsaYhawAdnaCvfMv8yDlkxcM0/APV4ptGlZiZimrZk+Sb39a
	1om/G9Qp9NREikg6CukfInlIJyL6T4zDjqtR7rb363cscmkEdUuqwhzZQTsycZMDXQQqZMebEftm0
	ukujZ4z073zgJb7JC20I/oraFErFl5tiOZ0IA7PGXZy6uSV0U8oHHZs3c1MunlRsOJ1dNGcgaE5kF
	0yBeAWPvHjZCLQONNw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfea-0000000Dn0y-1vZF;
	Mon, 22 Dec 2025 13:08:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfeY-0000000DmzW-1CXJ
	for linux-riscv@bombadil.infradead.org;
	Mon, 22 Dec 2025 13:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Y5UDvIvaVjkkZfBeEFqY4CPR1+ruUJV7ueKVcAIMjEo=; b=lKf8KH6qFahBm8JGjRoiiEOhIN
	vwjBW9j8XdvxOn/3wZuLgB1h248qKYsEKBCI/7cEoU7Zk/hFqUXh3RbQ7jptBfSAIJ+CYDvvaN7U/
	HZi58grqhWhyaIBYYLe+Ak2MbrsbzDijwLSVv4URJeNWhkSQe4hck1Vt6EPtwB9K7w7Xbdz7dw2ND
	52X9vdlLU+oFYXESUYr9/q6lU9FocXW2Bzvf677ouoLfcQPKThJV+7pwKoPAqWbkHqSyjRH66AUn/
	hnBugwccKtSgJAVGILapDk9iSWS6YC8f3twqekUZO812d9Ph1ccJRRbOOMXVKGHYgC5F0RJqwV1m4
	kQhWCcng==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXen4-0000000F0Xn-1UmC
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 12:13:32 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-34c565b888dso4404979a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 05:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408922; x=1767013722; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5UDvIvaVjkkZfBeEFqY4CPR1+ruUJV7ueKVcAIMjEo=;
        b=VrRoXl4E0TcU5maRtQr8/URP40nRJMV1MD2l+q6ZiqMNbnF5c1DA9ldaYzeWcv9hp2
         0i1eJ/7LvfgNRfgg6ZgqOZ5WsSk3+XzXah5O6vuGtiPYb0vOnwv+MBg8L+MpgE0Wvj4d
         19Q4g9shWQWaaJqkB3iR4rxln+OwopOrJZSvy0gYm5LxZBvOd8/VI/u80VbubCKfCtNA
         cqYuqcU1SzTRR5x/ClIJKlboQPU5izUx0XQ5doKeZN48ulGManvrHEJcyzNKcmMAlOOh
         z0936G89KUWW4SR7fjix2zgjUrEvGel0R0L8HEoXVtBbJPoELamPawhGUkKkcsh65oxp
         XL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408922; x=1767013722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y5UDvIvaVjkkZfBeEFqY4CPR1+ruUJV7ueKVcAIMjEo=;
        b=e9kgiNBXDB+TM5oevaZiBzzbvWjmyZr81MjMR5D/E0BDTDwPYsltj9ALPr03ABphuA
         04kG6VnCkRKvPg7A5S4qL28XvNGYOBP/HhHgfTK3eF3rX+8j+94isR1tmz8tHrslblq4
         jF5bzZcOiAcKIX8otp7aeidEETdlb3cvfqlnv4OneFEerLsxjlF3RD7LzMtj5BSxEkzC
         aFRXMoIOoxcGaGiBPUey0lAdFKV4Wf7zsHc7g/zidq4qzc1/tYabC+7QbfCI6AEvm1HR
         IXjDUBT5cgkdky+wzisTjjUabiH8f8oof2NAw+qyNBk/AwXFWsPJwwyn3V4/71AAVFx2
         O+hA==
X-Forwarded-Encrypted: i=1; AJvYcCVJgeY8MpXMk2+93SZU1zvIMI2duOJdMNAe5J/MBJ2Z2ODX44m2c4jEuEEzqfsCCXhFi1cvCqqXcoRl7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPTfF914MoDxngUnF0bi4MehaK91UwElRE6ng6BTxaAmuKVWZL
	GgCES+b9zZJ8L+Tv4S3eoTGzoGZ+6AUTpOivkKSbE3fgt9JBgjQDbxgwIbotm5wNanY=
X-Gm-Gg: AY/fxX68gxzUnMUU6AYtNsPfT5+vpsjJJm3gstA+0JjgvZa/k48HMJv0jI4YBrQSdsF
	fDlUaF4wsf6SVKyk58QGW17T6Bs9PIV04YYcxSJC/U/Km77+EShjPjEfWiPcH+mYJeS8ER1B/u2
	QP5CShP/w8kuwcWI+A1URQJJigX1J1/9qnwXCIwGtKPqPSM9RGXUEwVAGJNTH4H32ysAyJucsHL
	QOBGbDoq+X9RJqtOO1wjaeHf1Cw+0JzI4e8hK4giOFDd45RE+6hvSdTbU60moZAEpFeoyThP3SO
	px97YAh9tDP8fhQpt8jlsPDkU1T1rDhyxC5mxVhmWwyvO3zVC4ge3Ip6r9mwSo96bUobI/85EWm
	ITA+YMuz2LkpPTSCYiLQ8si9eKybXDIti9FVJjp/K5fnx9ZobGAzaW07TpselJSdRHFYh4SJi8c
	iJxnYQu2Fb0Cf4XWZQCRw9TMlve6WPAH4=
X-Google-Smtp-Source: AGHT+IGmybiO9VXGvZFmDwf5i2jOPeKNvQUkXJaS7Qo1wDtRYA343Aqy0CAvztutucUMXstFcLQIPA==
X-Received: by 2002:a17:90b:4988:b0:34c:2db6:57d6 with SMTP id 98e67ed59e1d1-34e921be64fmr9184464a91.19.1766408921894;
        Mon, 22 Dec 2025 05:08:41 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:08:41 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:23 +0800
Subject: [PATCH v2 13/13] riscv: dts: spacemit: add SpacemiT K3 Pico-ITX
 board device tree
MIME-Version: 1.0
Message-Id: <20251222-k3-basic-dt-v2-13-3af3f3cd0f8a@riscstar.com>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
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
X-CRM114-CacheID: sfid-20251222_121330_551833_7168A25F 
X-CRM114-Status: GOOD (  12.74  )
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
