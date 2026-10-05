Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B84CA5FF0
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 09:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkrS7jmmmPpNV7l83kNuJPy3dbsVt/mSL9+ofOlv2dc=; b=UhrGY8GDgkNhNx
	Ro0xptDJJaH6oF3LT1qr2efR1tKvntkVC1iA/EZKTjfNB5qMwWdObQvEklPDpfBARcIcN5m3W9MdN
	yt5iFbAFcxoQl6ujlC6qPM1xhvuAUSiHWKdjMmnFP7aFk5+IiwZQSZkCdcN4GX43CGbzIuVYzE/QH
	MzFz3BNhx2l1z5urFhzNkcqybRu0UuPgAE3FznMzN1M58tELYOCsRWw9JK2ePw3H/PMKTafWG32Hb
	k2Zu20S7g1ldudO1K12oDUd0ueEYDsMKXd83/4enLE/+5qvCl7SbPhkHfUeJCBHnGzhWwbj9xweWv
	SGHmxH2WRFhBL+jQirVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDf9A-0000000G1LU-2Ipq;
	Mon, 05 Oct 2026 09:38:12 +0000
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDf98-0000000G1Kn-0Esx
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 09:38:11 +0000
Received: by mail-pj2-x2b.google.com with SMTP id 98e67ed59e1d1-3a49ec27989so99118a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2026 02:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193089; x=1791797889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TduQRpu05Uu8Yeb3OgsHJqQKUhZPES0toI3gcywm3MI=;
        b=D/vid2LbK/CvrLMkhYoxkAcCxuv3NiULmVRJtSwfM7eeXhfdxQUnp4IFmosyzxFBfn
         FkzNTcFHKA1ZDDNturFxQBtlWlumEofKTRDKNJw7a7UvoOu9ZEwnE0sNsMXUvQmRTpMA
         a5he7mA50PvRhvKA/rhpK4i2BkUb7YNOara3iEsR3vqRdJO4KSsW/KJBwhDRtB3ltfqU
         41m2ma3lgA7k3OGaqvd/6bNtVPjsLa1z6tClAQ7CGrQqgAy9tFfqwK8zJShRAV8WV9tq
         tXr0RbwjeJj4OlkQ9ypsad/mOUYPxvz5MYdNlIFWuW5toRpZ8HxbU/8wo29QL5aigfZr
         OttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193089; x=1791797889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TduQRpu05Uu8Yeb3OgsHJqQKUhZPES0toI3gcywm3MI=;
        b=e22bdXzoyGIa64aH4gDAdcuxazVsrtvBJ8YO0SPrDOUr5P7pNB/cOsNVkebZepBSka
         Ar4RWDpO9uFhYC9M+YwHAZPIwMjye8lg4KjYjmuxDnHSdxvQ7cp3FvCkt+jU0c/2QUQp
         Rq4JF3Sym6TurFdCe5SMd9FvCGOECCJ4rEbV4DMmQjnC+lGptnn0q4CnPwt60vi+P9p6
         eFpKUALyBTucdrozuyAepYEaCykjXGN0n4NVAsgf1SOPpMNjsR3N/qP0/FHNLqbJUVQl
         bMZRRRWPuRD3ZEQGrIKwjUPJ15dbPZu4V2kqrtACGI53Tbq6hEf0G32tdU6Km9a2PfLM
         Gaog==
X-Forwarded-Encrypted: i=1; AKwUvBymAIUWX6TKks7gDjQWJlCF3oBpyeVEuKE8Ow78PVRvcyEXhckkeBegZL5cbil9dZt9zFmBO7mw9ZDTvw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIBgJYlvG3NhwaIQ7A2otdzNtJgGpkDyZzoIO4vOawRTlC/ql94
	xBdDBsFxLeQXgd9CMgjRcRuzWTnU3yJDbVYjY+wTun6jUnnMLzL+7qfp
X-Gm-Gg: AYBFou2GoOKgIGlmVve7WT4bYPMgSdGow/jJn1Hih6X99Qy4UGxpk85MOz3ptfVQA5P
	7zf215icw50t7LqBFC6MA3F4p4SwZKLCesinlBAnhNsNy6Qi9Aeb8vdMjbVRCe5mKrHM6gLSMo8
	v5hjjvtj3pWCEQbKLdpfkGH0MTshhvpYaQe40Jg6piTjXhWwXI9oJkCWU/6ohEscDpOxkPQDDlm
	p1TwFKVvn0xsZMViji7DZtVtdKk8HzhGYXFUufxQE2qeELVtk7OdknY8geQz9WCWARkQUlsSSLC
	qNJRkRJ258yvS/a2Q+FdU1DPB05FpX4EXgHrIhn1XaYmwgy7BcpUFIYSHcebq9CnACw5EA9C/CZ
	itTCXQStPRbWkxsEYWXzsQDpp6+hVK0TGbNsbmpSceLNMTECpdRY58UGpfga5tJOJhBOOb/6FQw
	PLvKf7LTRjQJfgGxuiUsXrzWVp+rYk5Ni87rU/gOdJ5HOTWcRhvd8JyAPsMiGHXYs3icok2J4HD
	QrAIIz7k5IAYo/HSqelYog3oK77pwDXmHQ1JOE077jCq9+txhs/ANNAQw==
X-Received: by 2002:a17:90b:2f48:b0:3a0:e7ef:bc81 with SMTP id 98e67ed59e1d1-3a6ce7c94edmr14943856a91.3.1791193089049;
        Mon, 05 Oct 2026 02:38:09 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e42026fsm10568067a91.3.2026.10.05.02.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:38:07 -0700 (PDT)
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
Subject: [PATCH v3 1/2] riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
Date: Mon,  5 Oct 2026 17:37:48 +0800
Message-ID: <20261005093749.645014-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005093749.645014-1-chenyou910331@gmail.com>
References: <20261005093749.645014-1-chenyou910331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_023810_098146_F5CCB5BF 
X-CRM114-Status: GOOD (  14.38  )
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

Reviewed-by: Hiago De Franco <hfranco@baylibre.com>
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
