Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE92BCA5FE8
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 08:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2XEoiKeQQszlCGdljDzUS/GNU+X89FB9PX+7hKVBRE=; b=NNun1AHskxEnXX
	8pymXrz/SzDLM3D9Hv4a+r1Q6+BMqJPGlv651TqlS5GAuKJEP8EfGk5ckFKQoCR7cVKQoKL/GXkJC
	FVmNJ9hY9NhwxnlUGqNw4PT7dlT3UG7sk+WxBdy/wfNmtH2SjnGeBb3+QZFiQluv7U3B8FrLqBbqb
	DcNqal3lOQUcc3aejTsAaUqT4L2dRbNIuEka9vxzVvosZODc7pC4oIdRDWHYgjRzvUwNErdRv+3NH
	EGvOtFJCTsKtqetIQ+iSASfBfFXCVkAHRYqfZ1GlDzYRf8LMDfdgrC0rdW9W+OoXyoGqAZ79A8fcr
	bk8UYVISCEk7xYai39Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvOK-0000000DD5Y-2Yae;
	Sat, 03 Oct 2026 08:46:48 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvOH-0000000DD4S-2vLr
	for linux-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 08:46:47 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc4e4979c55so51111a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 03 Oct 2026 01:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791017205; x=1791622005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2X6RfdoRZCSwn03+0O701g2gXtz+LDb8LKtxHTTyDg=;
        b=MnD8kB+SsHeWwrb0qn9vq/sv/KPCjLEM+vLOWT2SPyirNNA/3kXlPGX2I3P9UpfSrd
         W4R5tFqBugEGm2B1RFKT7W67Z/zG7zO4IGudxPtx76M/FQNuwSpq6dwHKKWc03PZosB+
         z5Z1ETqLUOqyA71uG6l/egd7hHiQONvec/7ILwYG3fgXC0zBpgPH5DkaS3ruYitknXQL
         lSifkBP5q2ek9pnGassbYYXjmPMB6roz/L7cE9oc+uuKGIwBFfJ2MNvzGDcACpA1gMpf
         rALDlDfLabEPB6j/e97iQs/WRfkbEc8hyDBkL107Lcfgr6N+MypnxoTtO7iuS0IOpRJ5
         4kNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791017205; x=1791622005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2X6RfdoRZCSwn03+0O701g2gXtz+LDb8LKtxHTTyDg=;
        b=LkFOdNQiuXWKU7ymytBfANVgNIbeEQBRsnXSNxRkJKK7T01b5EtSSLo6wHrL5qvW6m
         1+vcqvnMAdzQfEaojt3bDKDmRnE3wNh2nA/oIUgAaHb64qg9EaKBrLPILlGMUUCmAFNs
         5BmGv/27U6PskX6alkQ+vm0ylRwCLjghb0H6/kykTr5VaVCwqphLQgxjes4hHKBuX0PV
         Esuqwst3uNTDhz5KrAXchVDUJE9D8Ce8xP+F4lanWbb1+H5502yKxRG97ZBReimGg9bR
         NufYPTFrwVnzgSeuqV3+arJdFSTcIC4bhbP6f0vd/uexw1TJz6MPyujNzzfqfyFSAKz3
         3n3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwB0Lx3NksoTfa30QZOorFB4Jt1az1IzJ1kEVpnrTzTBXEMuHCaTjy0hMT/EBzhBAUKwisz/swbVXfuBw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIf9iC9oZLDRR7mdZqSMEAe47J2L/k+KQu7SZTsSlysqSaVJFLz
	TGUxAsB4QRj5Q1XkYodwaN+E1z56wA0lBLW//hGWEds0M+GzhIP5fJEr
X-Gm-Gg: AYBFou2gb8aN2sL8raL31E7k7oW1Yi7RPkjC220dKqE1LpKctxlAPLAznZ/n8ABhSCk
	yG4QvWHn8ZgdE5z19ydWtzAPy8uuf/aDT/TKnp8RS/q4q4io8lSQoZ9KjyWFTQMyoy276WKASuj
	VGzNiw9hTE73uc8BiPaR0qFjeJ/EeS8z1sBZqF1gJrZW36hRaCRKgvEz+qGl0Gyk0wdyGvK+ukG
	tLsREHtDZnaiUNLuDLS4dqMvvKYSJy3xVF/xWvOk7ZqBw/MPoCeu4Mehtj+eaAbRX4CvjbXO4gP
	4vsprtTKv54phQLfMev0JmTs8vwgEaiEyu723F0kKlECFCWwkeMxnZ9eBygr9JdISfbLAOXdq+T
	gwTfsaFtmxpNQiLYHeYWJru4TXQzMVdpbEshuQWgoP//IDbZqe8g/WnjctPZ18bJhO9mmLJyA+4
	n+y2+WEk6xZQpOuU9sY79K+OiKCezIBDVkS/uDkjNiDrUYAw6EryB8148MXwCXyazHZa/mcmiv1
	hyjilKESxAFxKxo0PRejfPiqYJ8crHkyQv+pXTVwAoxRw2kRndqFrEYytizJgdW019eheY=
X-Received: by 2002:a17:90b:2804:b0:39e:3728:3b11 with SMTP id 98e67ed59e1d1-3a6ce6dc25dmr7643738a91.3.1791017204760;
        Sat, 03 Oct 2026 01:46:44 -0700 (PDT)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4664ebsm2208033a91.7.2026.10.03.01.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 01:46:44 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 1/2] riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
Date: Sat,  3 Oct 2026 16:46:25 +0800
Message-ID: <20261003084627.353899-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003084627.353899-1-chenyou910331@gmail.com>
References: <20261003084627.353899-1-chenyou910331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_014646_490479_67FA2CD9 
X-CRM114-Status: GOOD (  14.50  )
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

The SG2002 has an internal 10/100 Ethernet PHY, but on the Milk-V Duo
256M the Ethernet signals only reach the RJ45 connector on the optional
USB & Ethernet IO board. The MAC (gmac0) and the MDIO multiplexer used
to reach the internal PHY are already described in cv180x.dtsi but are
disabled, and they cannot be enabled in the board devicetree because
without the IO board the same pins may be used as GPIO.

Add an overlay that enables them.

Tested on Milk-V Duo 256M with the USB & Ethernet IO board: the link
comes up at 100Mbps/Full, the interface gets an address via DHCP and
passes traffic in both directions. Without the overlay, eth0 does not
appear.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile             |  3 +++
 .../dts/sophgo/sg2002-milkv-duo256m-eth.dtso    | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index d5c80d4ff005..49639cb0888b 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -4,6 +4,9 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
+sg2002-milkv-duo256m-eth-dtbs := sg2002-milkv-duo256m.dtb sg2002-milkv-duo256m-eth.dtbo
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
new file mode 100644
index 000000000000..cc93746d932c
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Enable ethernet on Milk-V Duo 256M with the USB & Ethernet IO board.
+ *
+ * Copyright (c) 2026, Chen-Yu Yeh <chenyou910331@gmail.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gmac0 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
