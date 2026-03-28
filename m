Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D2910F3DEE
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Mar 2026 17:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JASQDl7QrTIutrrnlN7jv2B/ZlSdkd7ElLeSR4L6uw=; b=gjfz/+uStvWoK5
	bCZcXRfBQWYZRi6IopBBiUPUqcZ7I9sQD5EBLTA4Wl/j4yX4lZfm4wlPU91Z9MNs1yMeVbzPMly9c
	U//YAsgTTqDtMsmlA3Kp2xO1EKT0IxG2lsHgxnjKIdYL++ux74gchFvNNABLzijxT8aIydw/i2PHI
	GWPbsWcXT/K+5JyKF2/VRe9wEh5MOMBG6xhTbUTVgtggSS++fDthciL4GcX/bn1RiG930+h6vzZ7H
	hk6YaXWFtvL7b126uQN46le3asVoBiB77/GfRZFn6rbb0vBVHjs/LIoMzD+3i8tIe2Qu/mhkA8RRf
	gVMm8Ms+3240tX+dlY3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Xbh-000000099oJ-37xA;
	Sat, 28 Mar 2026 17:37:57 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Xbg-000000099nQ-0K0v
	for linux-riscv@lists.infradead.org;
	Sat, 28 Mar 2026 17:37:57 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-50b4001af28so34770891cf.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Mar 2026 10:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774719475; x=1775324275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJAPLXH+JSPAdQeklsWr8qGoeKpyEbUrtjYWuQxTQmo=;
        b=Y97+tdZlQpYuTbt3raxVXoBVtMdmC63BQdqTQXqdvLn0V+ByEUzq9kjq5YRUGPnWgv
         bETQXEEaS7oC1j7psKODeOh5RCOuxY4iCTvvOgvdfcMH4weBXPa/5+C6+fofK1ov4fje
         bDxqBdroljcjbUZrKUk6KoB7hqH+7TjdWGUbWEK7ykjSzVVDQSG7bdAxISMpSto6cyJi
         JJNNC8ChIJScdBlIW9WK1pZJDjWHM+ZFJDnrVIfJENWclmi+/VL4v1xMPITbyKKa5l+X
         fhrpBGHpM8g9rSSZLlWwst6k+Zz4qLqWSNNcDLXYFPpHWFEJ0wIG+Ci8/2N0TDHs7hkk
         BpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774719475; x=1775324275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJAPLXH+JSPAdQeklsWr8qGoeKpyEbUrtjYWuQxTQmo=;
        b=I+WOoTF8avVNdfUIhRZve2PeGH/gydZ/wzXcyG86VVys0WzaWyaC4jgkBy0GEvzW/q
         6URK5EhvcxophevMJbagG+9r/0lftQedf+11n72T3cfI5iZLyRzsj8NV0J0/QLmcEOQj
         fGfNDXV6qXwmqdAbxZ6UcsHfAXuxP7RiutjGWu+JjhVFaCzBT7VQeEDKZ58dfqX5kmXq
         sAqiPpGcpWpvPK9PfRdCpuHpIgutiZrDpTVpRLM7JBKv2N5KCqwdrfiVWV0M/qQoybJa
         95pOBk2qS9AlxfbMpZcHqk9BHq4eOVhF8qFFbpza1Gzfk4LgTwCS3hPYU8MDmPMaWVYF
         YnlA==
X-Forwarded-Encrypted: i=1; AJvYcCV1tU9ZizrRzOnlMVUlc7cKz8ryFbKOypda9PB/uJ+67yTKiYSGNG+rfPxamwUSx3Ff1T3gTgHY112/NA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnfMbMSathuo2QXnPGrMD45OUfdmylksYtnRt1d5VuB2CF9sGx
	eRPFXNwRFPcWpNfcgpioJlf8TxOC49GVhqxYYlzj5RKmBYsNbLOFDvuE
X-Gm-Gg: ATEYQzyXU56qiCDCqnVEiUQigghvyi8cZkjOdz3RUBE0S6y/p/XiWcduXPQkWI+pBPW
	1S9NCTRWsZIbkxIBconRp8gFn26+lHt6hbkSnZRHZd2okO5Ky5nqllH2Ni6CKvMqllxPCXiKRyd
	GjKlApbU9uCyJx9MWpUoGcUBPx65HFC9ODdVlfF88fzR1q9sQRwIKCJxAPOwBtx00DJWYm7+8CU
	ylQb83aksUA11TqmAr7U7yilmqpmyRQpGBAOicjvBmgpYjtKS2FlnRQftbUOxhBy+NpHwlqEaKK
	2hNkQ7X/JTLRy9JR8vUp45tSB6CgaKswSF5v+XrqCHOSICEF/U/JD4WgI3K7f0k/te25sISqfvk
	VKvXHj6WCkigT+9JG91vteIjrNe0boCYPLQ/KvBZOj5pKy5nTSIzDypmaBD7L2WTCJTBtHcgVCo
	Uc658L2oFWI7fYKfookzHZL2n0qGSlGI4Drrhcb3d1zhQEinfx2aVILr4IlZtn8sEAZB4=
X-Received: by 2002:ac8:5dd1:0:b0:50b:3b54:d796 with SMTP id d75a77b69052e-50ba380f13dmr94020831cf.27.1774719474903;
        Sat, 28 Mar 2026 10:37:54 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm26629641cf.7.2026.03.28.10.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:37:54 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v4 4/5] riscv64: dts: sophgo: add SG2000 dtsi
Date: Sat, 28 Mar 2026 13:34:49 -0400
Message-ID: <20260328173450.219664-5-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328173450.219664-1-josh.milas@gmail.com>
References: <20260328173450.219664-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_103756_141913_FA77BF38 
X-CRM114-Status: UNSURE (   9.81  )
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

Adds sg2000.dtsi on the RISCV side.

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2000.dtsi | 53 ++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/sg2000.dtsi b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 0000000000000..412adacc00576
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "cv180x-cpus.dtsi"
+#include "cv180x.dtsi"
+#include "cv181x.dtsi"
+
+/ {
+	compatible = "sophgo,sg2000";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x10000000>;
+	};
+
+	soc {
+		interrupt-parent = <&plic>;
+		dma-noncoherent;
+
+		pinctrl: pinctrl@3001000 {
+			compatible = "sophgo,sg2000-pinctrl";
+			reg = <0x03001000 0x1000>,
+			      <0x05027000 0x1000>;
+			reg-names = "sys", "rtc";
+		};
+
+		clk: clock-controller@3002000 {
+			compatible = "sophgo,sg2000-clk";
+			reg = <0x03002000 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
+		plic: interrupt-controller@70000000 {
+			compatible = "sophgo,sg2000-plic", "thead,c900-plic";
+			reg = <0x70000000 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <101>;
+		};
+
+		clint: timer@74000000 {
+			compatible = "sophgo,sg2000-clint", "thead,c900-clint";
+			reg = <0x74000000 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
+	};
+};
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
