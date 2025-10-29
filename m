Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2F1CCF9F1
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 00:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8yvaNdLShEwNyojKUnbyNDGOi3Xa+/hOkLvzekyfG4=; b=BwE7BC5wUhJE1j
	EnJjfgokojg59LnXi4zLkcwv8zb9qkiWdJyxfU3WhpxTiORCJLvVVzIso8zxlBZFP9v24d4EYWZ4w
	X13cTHfKlpqmf6IWR/ztA1xUUb6CwkEbVWHGy6qP5kEnLi8QZNY6z35rbJgkSi/bsT+mMwpkqNe+k
	eMal4TwbpGd/wIaDXo2m68Gnm7BP9NyW7g7rnpiuxfrSCYVnidm4mjiYHwH5GMPqvHVYuux2Xrwwv
	/jNa4kJc/Gyv7d1X6I9RLllEnT3FGJ0xUaAs0+t5dXKKTYzyP+Wx5PX07GTUSPpg6WEPqbrwwEX+c
	GFSWbokOFOQQO6cN4v8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtn6-0000000GqM5-24Mg;
	Wed, 29 Oct 2025 00:11:52 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtn3-0000000GqKN-1r50
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 00:11:50 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-78ea15d3489so57977826d6.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 17:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761696708; x=1762301508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9pgIB4Tz67zjDEuCaou8T/MZSYRwlTrfA6jaD1u7do=;
        b=YG4GZNHavmIK7AGCx+H8a+woYhtQBU7iVTCwrosoo5ThCh+u9RFqtwRYa+znxVT+RR
         jQn5EDsBw1sAF3/PWErykpHkJV09XHH6zSbflm/ZavjW2vsgqHy9qNfYJFnVJB+bpyb2
         fIdgK3A0WI/v8YrGXz9lSGbMmwUHOoVcXzcjaeX+aEoI6nUFtD3ENK9gZdctLqUDyw+3
         0hm7IwLeoTzz7t13ZTtIjEeSH3msQtucTh0daNSD7YFSIVXJn+m1o1WhlzPmgpV1Sjj2
         AUThS1bgR9Z0YxxukzHNNVQsjHMGhiQCsFZ06eynRf5U0G4n8wkwV+3raNpLo7aPrfZl
         2J8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761696708; x=1762301508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9pgIB4Tz67zjDEuCaou8T/MZSYRwlTrfA6jaD1u7do=;
        b=vIAW1kugDdkSlNac6cY/iZcxzIYUzdyUDtPsqjDHurMqTAvZ25pA2E0I4hrUf3w7QH
         NNTOZ6YQ7+CnS8rmj5fe6+VeArNPzx2vWK/f1H7SexCV80InBhGjqMoeXrgzfQz0enfT
         q8BxYi7XsvMKAXNbGK6ecycxmSNfJeXImUlaoyJvS3SFGTxhm7OWoJqR3MeCHmLGm1ov
         IbvMtY8IvouCmMLFdk+C8K2fKWc2J3qNWUBuuamIGA5BsxSeX0zH3A5LCZPDlyqP79Ky
         iC5ztYg5h1UttOTXVlCPOmOx1MQUiyc2KjI7BFNI4OPoB1RyzNqo9mjh5y8kpfi0fCTO
         pZIA==
X-Forwarded-Encrypted: i=1; AJvYcCVxflN4QzEtFYIT1h5FAtIN5skAivMjm1Ej2nUKXKtth6PxHcu5QVQyF5KPcGRU9SZH4HIjeM4j+m4e0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8LZf2EnJ+iiU/QH1Y2j51kK4+59LG0IHy56QFd4OujMHdSCqI
	67/8LI7GEBsnvihwQdxBV7cJpVqACjh0tEdIibGrvlQPNPSnhQ43mK5C
X-Gm-Gg: ASbGncs1WnijREBF892GlRnj5b8tyKB3hKILUpSWs2TQD2LOSo8ZzdDZ0SGTuroGDOi
	IuAhEDSpE8S7qCDYRn9HJxKJ4smzrw9V/ygcgtSaP2SBMbI0Uigurjs2/tvJ3jCb4QGkxoACBPj
	0FJT8K3Dw+2+MPQX3C+k4TNGE7z2pqippL+ooZQho8uHojYmy7trJEclIC3ESQZaoAjT+hOGsv/
	En0x8O/HLN/uJKpfy5fT3xs0aAxzTcMq0/VOXNt5TmIOzcwNiJy1IXpqSo2aQUX36N7LiHOT5sw
	J4gbL6ImBC9jmx/eUkXPdPCB0PEJirlL3LVQw5aLCJ1W9obxbB1qMXDkVEBKpA0fSoSAbJ3QR4n
	B9LFSa6QIXt7OQicuCwVg+vyZS9kxRKi1qpCH0ipyevt1H1cPHk6mOWaaDY9PlmfDHYlT2PHAug
	wtNV5QArVLVkJG1N7Kb4y8fIWNXZSsWk+SWA==
X-Google-Smtp-Source: AGHT+IFyKyBOAZv1RmAbtR9z53jqxuAJGXNiIM7ALtSRjvdVP7EE2a6cy6IFhiNFKgBsewKzfhE7HA==
X-Received: by 2002:a0c:f118:0:b0:87d:fc3e:6d9b with SMTP id 6a1803df08f44-88009bd6efbmr10961316d6.42.1761696708384;
        Tue, 28 Oct 2025 17:11:48 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48dee2esm87255906d6.23.2025.10.28.17.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:11:48 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 4/5] riscv64: dts: sophgo: add SG2000 dtsi
Date: Tue, 28 Oct 2025 20:10:51 -0400
Message-ID: <20251029001052.36774-5-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251029001052.36774-1-josh.milas@gmail.com>
References: <20251029001052.36774-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_171149_513463_13235623 
X-CRM114-Status: GOOD (  10.47  )
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
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
