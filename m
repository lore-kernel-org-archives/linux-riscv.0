Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D576AC282D1
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 19:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sn2yvQmjC0JEl9AHTGnJY1SwIMaGFGFuKz8JHlSwZ9Y=; b=BlhQUXuOMuLDXD
	EMOS64XJ1KbeQ6HNQzxfXUishtDHYKVKCWBcC9S6S8nJov8zfyzA3bQI3LfZDKPbYuUoeRkWiB/BB
	8GXzkCLvPEKOjCLVshDL9FjuhXUTLx+DwhTEvOy1X5AO8jOuEnTrmRu3uS+9zHAcjVNiWwN0fR7Wz
	L4bHJFItftNkptn59ff7D3K+54qv+Od/R0cY3Kv54q2O8kgH5XahIaHbwg5/rnyiwzEB9GobWnOXT
	dcVGt/vJApTVIj8oP5MquIKajImgy90xqMxx+cUqv4XM8uB0B2WgLiBLKNf2QzfNa4gtdz3VP0ex9
	7ScyFk49bd/78br6XGkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGVl-0000000BxcM-2YUJ;
	Thu, 06 Mar 2025 19:04:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFWB-0000000Bm1w-1wkA
	for linux-riscv@bombadil.infradead.org;
	Thu, 06 Mar 2025 18:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5C9EGmMcDy7KwiuwZBgYyBMDzrztkFJ9Q41ohGJHmnk=; b=NwttOjxZ8+HBslA6dNbV8jgg1t
	6ZI9u35Q5s1x9t2Nbw+C0UQLZvlX0Iit/jxmMMw6131B44OIzY6S4QS3f6JHY47hJI3itRA43T6vN
	jnV+RuGHcOlSHYQWfQtlcY16O/WW6o+Y4qRjYYEYNV+nqdjS5OiCEWr4cAd3P/LoWzGmSEjbCTQPc
	/U8Ga33Jbwfp5XXC0EevsuyIzGloH6N7k72c5e1VjflYvqS4b9hEn7m4lY3MYZU6nZbWmIZXI1H1C
	l6r+OFaG1jpG7bVUM8osXzA4+rIuhMZST99JQkOyf95EHbEEYXzsWtkQpKm/O/8IOKYc0CQlQQDdK
	hOeNQasg==;
Received: from bayard.4d2.org ([155.254.16.17])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFW5-00000001Bnm-3VUD
	for linux-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 18:00:22 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id D6BE5EC59F2;
	Thu, 06 Mar 2025 10:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1741284012; bh=JPr5THma9S5EoKLt/y71Ozii0SHYauExya2FtBG0v2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gnbmC2kMymAn7C0iu8thUpB82K7QC/5WbbLZzrKwvGPlUxc96W/0AuYeSv3O8ZSZ5
	 KrutYX98iNSc0bUq0hF5i8y90d6baNdPMjZ9vDjPOF7vFLZbPI1nKTDPgva2cov4qd
	 Jo6EsSH/YMlPDTJulTHbyL9AI+vPRellq+tNbmuCOrZH5co059HxnoT+giVo6hInqy
	 zD1Uv2VjN9SZht2EyBwm+Vl2eufM5Pj5SLT16+WUiDBvNwYKENcdQG6zUrDoW0sjgq
	 W6y1pC24nPmQgrpjH4Noiy1XUHn+zlocctj9ugpSJAqNIL1qJFBOqBQ7hR57PCDddl
	 85YI7cNb7g26g==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kxjIPGOlARPg; Thu,  6 Mar 2025 10:00:11 -0800 (PST)
Received: from localhost.localdomain (unknown [183.217.80.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id B3236EC59F5;
	Thu, 06 Mar 2025 10:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1741284011; bh=JPr5THma9S5EoKLt/y71Ozii0SHYauExya2FtBG0v2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iM7ureVSa/S+7YUL3tB5xtVqkBhMyJqfdx9HDE0dvLZU4RHu/Jvph1InoCn00+FoF
	 swBVcrDvNcWdDR/1ML4rc5lCMtlXUxaTn+pdFHUr+tmtriZgHSxTVdTZdrl/V4vxYh
	 wIoAGDF9WuaCc0kyFFUa8CdAB1OjoaA8NbBc/GQYUjNjMDm87pxeaG8k1E19NWgqaP
	 It1BZZBizokamqsTNNlwZ37jdJGRMbLSMhb62FPRnL8vlh9aE3QAaKJIsffzsVFqkw
	 4dn4mImqEAaqnjdHtsEN+Dd1j6CunU0fU6djssw/H130M3VZLGURr1e+Oz52DwwSIg
	 X/+D3MS841SPg==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>
Subject: [PATCH v5 5/5] riscv: dts: spacemit: Add clock tree for Spacemit K1
Date: Thu,  6 Mar 2025 17:57:51 +0000
Message-ID: <20250306175750.22480-7-heylenay@4d2.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306175750.22480-2-heylenay@4d2.org>
References: <20250306175750.22480-2-heylenay@4d2.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_180018_491464_93CDEF68 
X-CRM114-Status: UNSURE (   8.16  )
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

Describe the PLL and system controllers that're capable of generating
clock signals in the devicetree.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 79 ++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c670ebf8fa12..09a9100986b1 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -3,6 +3,8 @@
  * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
  */
 
+#include <dt-bindings/clock/spacemit,k1-ccu.h>
+
 /dts-v1/;
 / {
 	#address-cells = <2>;
@@ -306,6 +308,40 @@ cluster1_l2_cache: l2-cache1 {
 		};
 	};
 
+	clocks {
+		#address-cells = <0x2>;
+		#size-cells = <0x2>;
+		ranges;
+
+		vctcxo_1m: clock-1m {
+			compatible = "fixed-clock";
+			clock-frequency = <1000000>;
+			clock-output-names = "vctcxo_1m";
+			#clock-cells = <0>;
+		};
+
+		vctcxo_24m: clock-24m {
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+			clock-output-names = "vctcxo_24m";
+			#clock-cells = <0>;
+		};
+
+		vctcxo_3m: clock-3m {
+			compatible = "fixed-clock";
+			clock-frequency = <3000000>;
+			clock-output-names = "vctcxo_3m";
+			#clock-cells = <0>;
+		};
+
+		osc_32k: clock-32k {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			clock-output-names = "osc_32k";
+			#clock-cells = <0>;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -314,6 +350,17 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_apbc: system-control@d4015000 {
+			compatible = "spacemit,k1-syscon-apbc";
+			reg = <0x0 0xd4015000 0x0 0x1000>;
+			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
+				 <&vctcxo_24m>;
+			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
+				      "vctcxo_24m";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		uart0: serial@d4017000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017000 0x0 0x100>;
@@ -409,6 +456,38 @@ pinctrl: pinctrl@d401e000 {
 			reg = <0x0 0xd401e000 0x0 0x400>;
 		};
 
+		syscon_mpmu: system-controller@d4050000 {
+			compatible = "spacemit,k1-syscon-mpmu";
+			reg = <0x0 0xd4050000 0x0 0x209c>;
+			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
+				 <&vctcxo_24m>;
+			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
+				      "vctcxo_24m";
+			#clock-cells = <1>;
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		pll: system-control@d4090000 {
+			compatible = "spacemit,k1-pll";
+			reg = <0x0 0xd4090000 0x0 0x1000>;
+			clocks = <&vctcxo_24m>;
+			spacemit,mpmu = <&syscon_mpmu>;
+			#clock-cells = <1>;
+		};
+
+		syscon_apmu: system-control@d4282800 {
+			compatible = "spacemit,k1-syscon-apmu";
+			reg = <0x0 0xd4282800 0x0 0x400>;
+			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
+				 <&vctcxo_24m>;
+			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
+				      "vctcxo_24m";
+			#clock-cells = <1>;
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		plic: interrupt-controller@e0000000 {
 			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xe0000000 0x0 0x4000000>;
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
