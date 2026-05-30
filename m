Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59611CD6E53
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 17:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JASQDl7QrTIutrrnlN7jv2B/ZlSdkd7ElLeSR4L6uw=; b=krbTAMLKItl21K
	Ggv76JCRqCF/6NZjBjR30KnfcAjdUw+31QUbB5PjPKx7hW1/UxwSoQQDnwYLcJtmkSXaWH9kQWVee
	sjXLANm3TpDQjvKnZeYg0NHMskDholZDEnaGIutURf9R89oIftqQOS1FEGpDkeLtg1+RzzOdj8/8F
	MCRXJhLibYf4SWD0KqvEiEYiM1tliRUHN1OSVpnlM74whAynTECGvvowRnasLeMV4eVQsXV/qHr0E
	2CR4Yxzl0EmQmKY1+vEmVEQZnjPUsHr2523ofgtxbBcUsIsrB5FOlyreml49u05lx0D35ihQ7gBRq
	rBmOb2peHhcF8y8XsSjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTNb1-00000008yEe-2Pyu;
	Sat, 30 May 2026 17:35:39 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTNaw-00000008yCn-3xPZ
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 17:35:36 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-91550dda53cso8979385a.1
        for <linux-riscv@lists.infradead.org>; Sat, 30 May 2026 10:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162534; x=1780767334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJAPLXH+JSPAdQeklsWr8qGoeKpyEbUrtjYWuQxTQmo=;
        b=oVS8PfphpZOYvOgkJctIQ8QycvJFhZt3d9KVmLWoRM5T3t/91+kR1jU5doi+hREkk6
         YHDxQJZhi6qomb5DCwq9aEPGToV+uJUaL6yc/L60PfO2OLKMsq1mia3/mLLORWw5D0zK
         FQjc8CL+E5Wz4HQheQUMHkek+PqVaSJrR3Wx2KPOhX6Ex1msDuvJfTainr8vU63/tW3a
         XEh8LqCatk/s91mX4FguUVA//RiEgMeSG3bVLDKNqYM+lWpmq7W5ptOfwfvWs3aWOo64
         B2XGQkSIZ4prpU9y+QVBQp07VZD/G0RJlxL1s4VrZiD3TZsDXlZZEfots161NKWDWPI7
         WDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162534; x=1780767334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJAPLXH+JSPAdQeklsWr8qGoeKpyEbUrtjYWuQxTQmo=;
        b=Nmq/nuS347AlA+5CT9TWx+5KCmsE5m7u0hym9nLMwjYZYzoqdqp095IdEGKAMvBG8K
         6gfmHpx87za/TRQSKJ8sKnSV+ZA93bLpuq860KJ3p0DIv9Dzh/MjaW6q7Ez83TunDnJZ
         7kzxL8CMGwwy6jgzgAvSpyDdJ4E5VC+EU+fi8XXGGoSPrs6PoEHYmuR1NDv/Rs07H+hO
         LwPt5ufsDs748kGWyZl5uYzATFA8Yd+ahFyrLUZohMfWPNTgrgkMR6BgMJVO5FntVaMP
         lylZk9ZIdjkdMPhqXnwjQTlPt50h+eRaQRF3+9uMDf2Fo5uZnXiByWYXIyGYpc8WiT9v
         w0+w==
X-Forwarded-Encrypted: i=1; AFNElJ+/13XS692X6LK1SVMNglOk3TmgMRF7hJkut59KTn40kS/qOz7eZ7EowOqQecLI0fmxr7eOVDqlgkJiKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlee3Kyw+R3dVQ8ZoZ5W5jsYFWUFKlJLO/5nD/jgfJy8sblRuW
	jIwPjQs3lgAuTJ4rdF4mMTsuM1aDYNurAC/ulH20ApkU2wf5q5KnJAmM
X-Gm-Gg: Acq92OGq78gn0m+XJH+vmxCmlEVApQ7UZe9Y1QtfUnT7jyX7kv8Jb5BNuw7xvJ8j0ZT
	r41czTYxDmV7qhKs6E+sf1Etakscriy0zGhVeBdsCtQLuZy8Ab4FQUDMWJVYZ/AjIZ0poOQ+65B
	f+Sv1dQqxXYaG7dbseQvGhiihqWxptmJD0yn1S4loWO4Fkm83j0IqjR9ZUTa4S+yeu1ARguGX/A
	ihVIE3Utq3UQ/Ce8CL4ZjSH6irB2COUxX41/LaWkgyuG/IhXKRitZOwPvcEOEHSygJj5Aw7gzA4
	2s0MYE9OGUiicTPfM7AaTR/MC2zz2aD+SIwdcHUsjeX1KdSsr1xdPPb8hKLlXla1xPBDARfyo/i
	Q3Q7IIdZxYKCA2vsdwbmLZyaXB43HcRtVUqKUg8HT13LFI+ziSCo472MAzs5/xiKVqKapkICJ9Q
	Y3Q8P3Yqc/oajYXUoZFu/PIBNmzQKegQ+y8kdJuwzWVqaftYfxa9lHLezm5oNQoVy2VGcc0tCM0
	fywgQ==
X-Received: by 2002:a05:620a:d93:b0:914:c82c:7a12 with SMTP id af79cd13be357-9153dbd5aabmr664027185a.38.1780162533921;
        Sat, 30 May 2026 10:35:33 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm565606885a.5.2026.05.30.10.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:33 -0700 (PDT)
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
Subject: [PATCH v5 RESEND 4/5] riscv64: dts: sophgo: add SG2000 dtsi
Date: Sat, 30 May 2026 13:33:46 -0400
Message-ID: <20260530173347.33533-5-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_103534_988421_0E5855BB 
X-CRM114-Status: GOOD (  10.18  )
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
