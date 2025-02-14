Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F4BC021A6
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 15:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zL6NJYxoO5jV0nn6Xu776K2zGEEBHWuXX5Jqy/7bU+c=; b=kYE7nvPCt2jKYB
	bVI0+NfEZWwZyhARcQNWlQx3MtBuCL32c7f3/OBF8GgOjzFIBCmAcx0fEOqjP8iE3iOQKwwJp9Mu7
	8YrJ6kRv/jqF89NFPwVCEQegI0U8ymMHWGQ+6azSJ2cEgjgxgWHc7fQITZPU3lKUjbP3XasV84w1g
	5yfX7b51/zSlF64e3TM1VLdYuG2brgVgwL6rP8rfNXvg6W9H5g+I8WcGAWeE4EbcTsIwllxyr4E1b
	uqYCMvlSdSsM1/IMpUKikL7xhSjbEGh/6BUqT3YsJrFy7K6ezv+j4P0OWum/JuT33jWnXhAybN3OW
	clmDGQvurDpHkXVuA3yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixfE-0000000FKaj-3IAh;
	Fri, 14 Feb 2025 15:31:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixTC-0000000FHdt-3Bck
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 15:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739546349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0SshwRt8Gl3GApBo9RGajwM4sy4zKiOT3YLnoVCQViY=;
	b=hSJLXiEyJEnKnGkIvZE0OdqQCbEcTRe/nWbdH2BBysob1G69MOX/ULql2+RHwI90RRKJtm
	HZeN7F2JzWrQF1tTLqhCit33O+blEBspjrtx20NwFW1EJq5s4GNNP7IKzUJU5UfGRKNot6
	IF9sPewftf/kWeNDMWLgqNwrogg8Wtk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-U9fknODnMQuYPWrQ4XgjoQ-1; Fri, 14 Feb 2025 10:17:38 -0500
X-MC-Unique: U9fknODnMQuYPWrQ4XgjoQ-1
X-Mimecast-MFC-AGG-ID: U9fknODnMQuYPWrQ4XgjoQ_1739546257
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43933bdcce0so17421485e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 07:17:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546257; x=1740151057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SshwRt8Gl3GApBo9RGajwM4sy4zKiOT3YLnoVCQViY=;
        b=RG7judTRSuwrP4VWzBtY/iCXnZLgzX33L30oA8MP6825qR3yjAeiBpGyWgSZ4D5v9a
         rB4EOKsUwKeZ9lJF3QhbD1f0eqlr6UALrqnpS7ffE2n131S/rOwRZJDsbMlWggMo4KRf
         qyHMRT91VBEo3cpKD4j7AtMlA4rdLnWPTSAM3og3TaeLI0hnv0kGXG9q6OU5BbYsJKMi
         QSRiqyx4UoFj8QQtiRSX48WYpex5vtEIUgQs2Yc3JFEldQXsBXP9sS4MZt8H9lr0uKUT
         /Wwyv0Jr5fZ/cZ1AhV5aezsbNWJsXy2A7AnU1xVG0hUZZIbs44WPHmjanmLuw01BMzMa
         swUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe9rHi7EIKL/PL/FUmLlvAMz7kZ4bS58eMDpYs8oj8rSNLj8x8+L36WjPsUX53NwN4zFaYYgWH8g4k1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxozsgvQcWKX/wAJAYs+VVbPKnIeyEU4FpRCoMOcZQFwW5bM4SD
	34uqVCHG3TeaUttpIdSje7sl0bxMRqRPc1D4I2VP9xw+Bt/DmA/4arnPBLlKoLZJ5W/exZqH5VO
	IQRjT062uppaHHolA8/0R/7/RoIPUwHemFPsbiW0/xP4Z6bxzsyXWOFlAoD0n0J5jJg==
X-Gm-Gg: ASbGncvi7tBVtMbDAAaevBNZ1MMBoFi2fO151TcchTh02g1xzs2DNEsUU6lalGxHvCI
	q6efsT+kqS3EB+ARmR5oytpQUZYA9jTSIOTgnRZHwJDsb6W2c+c+7aYEG2N8NSAWcksnvRu+7c3
	IXhf6v+oJYzAxenQKOaMZDyF53J664SlAQ0yZxJWUwlVCPGskyeZX7UH+5T34vlJuLP89TJ6YgO
	qbY25hW8u8wJaCwea+eiN4Qik/Q/pHtWk6AvteiBJjdWEGmWfh6S6Oo75SSBX7ukWWMxGjYMd5h
	U4qzyb74z6yh+tLvcF8czkCsK1bThw==
X-Received: by 2002:a05:600c:3542:b0:439:6e12:fdb4 with SMTP id 5b1f17b1804b1-4396e13034cmr4295e9.14.1739546256889;
        Fri, 14 Feb 2025 07:17:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3/3JFKYy9eGyD7IGPX1BVb9PSRrb5ZVdMvOU2CUr5TK3oN3GiUFe6oGPOq5SoYQYtuJNygg==
X-Received: by 2002:a05:600c:3542:b0:439:6e12:fdb4 with SMTP id 5b1f17b1804b1-4396e13034cmr3705e9.14.1739546256365;
        Fri, 14 Feb 2025 07:17:36 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5ef9sm4841762f8f.76.2025.02.14.07.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:17:35 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: javier@dowhile0.org,
	rjones@redhat.com,
	abologna@redhat.com,
	spacemit@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] riscv: dts: spacemit: Add Milk-V Jupiter board device tree
Date: Fri, 14 Feb 2025 16:16:38 +0100
Message-ID: <20250214151700.666544-3-javierm@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214151700.666544-1-javierm@redhat.com>
References: <20250214151700.666544-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FBPEx_Hwgpx5xd7Ktf0MIOMfdwwJeGlKVxCie3f5TYk_1739546257
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_071910_868892_69C70FBB 
X-CRM114-Status: GOOD (  18.19  )
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

Add initial support for the Milk-V Jupiter board [1], which is a Mini ITX
computer based on the SpacemiT K1/M1 Octa-Core X60 64-bit RISC-V SoC [2].

There are two variant for this board, one using the K1 chip and another
using the M1 chip. The main difference is that the M1 can run at a higher
frequency than the K1, thanks to its packaging.

For now, only a DTS for the K1 variant is added since there isn't support
yet for the X60 cores operating performance and thermal trip points.

The support is minimal, but at least allows to boot into a serial console.

Link: https://milkv.io/jupiter [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index ac617319a574..92e13ce1c16d 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-bananapi-f3.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
new file mode 100644
index 000000000000..448319214104
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
+ * Copyright (C) 2025 Javier Martinez Canillas <javierm@redhat.com>
+ */
+
+#include "k1.dtsi"
+#include "k1-pinctrl.dtsi"
+
+/ {
+	model = "Milk-V Jupiter (K1)";
+	compatible = "milkv,jupiter", "spacemit,k1";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_2_cfg>;
+	status = "okay";
+};
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
