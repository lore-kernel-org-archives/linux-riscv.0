Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A70C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 12:51:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0210160184
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 12:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0210160184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08heGjGXeYGS9ydP9JmctZ0NCFOBbPoS26qp4xlpFwM=; b=102gKyNLlKl/Kf
	tm+rHvv/tYgSPAju27JvoYa+hpvQS6VeVANJwU6gAQnGkE5aiyyml5WzSxF6N5fkKKA2r/kVkR44u
	YDXC6iemd9OSkgVCi2yWmYZkE6cWukyxULKNbm+Aj7grUMGEgPi3A8I4sinKRczj6X8H+bQ/XrH4P
	Raa8+AB6gUxa22TSMxMD5VvWxb4NV3Q/uxZbY64D+fMAgsFThA5cLqxRb9QNNVYV2gJfgH//dlWTn
	2vs4I1m3LN8GEWJqMhVd2pWIu6mGdUfyKrXZPEmNNb9sdX41a1p7rxgMdpjSv0K6M+GFHtobKUp4Q
	qzLMw+qhlhqdr+69Fz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUq6A-002gbr-PI; Mon, 27 Sep 2021 12:51:10 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUq5y-002gUl-Gg
 for linux-riscv@lists.infradead.org; Mon, 27 Sep 2021 12:51:01 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9AD7040622
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 12:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632747050;
 bh=fg5AL23aTrFGgdddnLfZwpvVHS8H57YnvdUfy7tZi0s=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=LU8opipw0oFRXrF7ujUYUfXWp/tG3hxHE/krscOVPQwhgbCAHWo7r3ZSk8HUUWybN
 Jwc4CkjMnn2nJVLme9HUIJReuLurmYdfKHGM5IxznE6a/6LYtvJvUoveLpwr5UF8ZZ
 0I3CHIOqhtqE2WtRz5n1TZezQM21bxvnM/uWnRupmZXGWOnn+oJIztRkdYSt+WzOj7
 PxpdgpZmhkbI2km3S00lj8+6qtWs2bj9LH4c/fgaTwVNPLx0Q76f/W/b5j6hp9r5Ca
 5lLhTXAyzPjXnjssUryiAbUw7oh15fAMJgyxou74u55Pn3T/K3HuLi9TZtYd1wqObH
 eqFjiEbqiCsAQ==
Received: by mail-lf1-f72.google.com with SMTP id
 h27-20020a0565123c9b00b003fca9e11144so14624903lfv.19
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 05:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fg5AL23aTrFGgdddnLfZwpvVHS8H57YnvdUfy7tZi0s=;
 b=Sw+Kw0AAQqPqyeyPytvJFxhY7tFLWNkrHOAii+CMDdMyNo8EsCvggvAdz8BM4Wx8Aw
 QgFIwQBgYKQ540d3l0u8V5adqSrBNGqkZTTPFzevKegtaY1gPr+sI5nbsIbNyQH6f8uk
 tk90SQdCxJ+vM1B4F4qthX8R7N2MvLjwq3E8jeqMs7ewdtTplVqGHD/8IUr2iJ337E1H
 IXEf7JO2+NLIuLybyT6X4mNIAcSExeStKBButchhO7prA3wj+ldXgJwx95qwPTUaoojr
 mAussGqVrrRHGMiC9/Z+BFM5KRsmJkKcvYfaGQKEieWrew5QacBL2dCeSl+s/EvzPeuy
 LUsA==
X-Gm-Message-State: AOAM531uNzRXOs3lsoCt3PK9YQuW++dG340s7ySbBCLhq5qn42woSEQl
 idbR8hIYq4Km+W/HlorT/MX9M4taWnwUECXGVHLXn3GRF6+sYzqjfqPgiaGmj2bH6Xvq8pNt/6o
 d9WMfgW3pTXYSZCk7wKzXSGeQxFxhoXcnpehWMHarkP9zaA==
X-Received: by 2002:a05:651c:290:: with SMTP id
 b16mr29935198ljo.178.1632747050065; 
 Mon, 27 Sep 2021 05:50:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/5dTX/1Af1ajiS9j9gLC6Bz4Td8g8uT1FEsyWbZSka03MXx5jiPjSYFk+SSYjibvpBFNOdQ==
X-Received: by 2002:a05:651c:290:: with SMTP id
 b16mr29935186ljo.178.1632747049901; 
 Mon, 27 Sep 2021 05:50:49 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id v28sm1592102lfi.22.2021.09.27.05.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 05:50:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v4 2/6] riscv: dts: microchip: drop duplicated nodes
Date: Mon, 27 Sep 2021 14:50:40 +0200
Message-Id: <20210927125044.20046-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927125044.20046-1-krzysztof.kozlowski@canonical.com>
References: <20210927125044.20046-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_055058_841563_8DCB4E98 
X-CRM114-Status: GOOD (  11.16  )
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

The DTSI file defines soc node and address/size cells, so there is no
point in duplicating it in DTS file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index b254c60589a1..3b04ef17e8da 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -9,8 +9,6 @@
 #define RTCCLK_FREQ		1000000
 
 / {
-	#address-cells = <2>;
-	#size-cells = <2>;
 	model = "Microchip PolarFire-SoC Icicle Kit";
 	compatible = "microchip,mpfs-icicle-kit";
 
@@ -35,9 +33,6 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x40000000>;
 		clocks = <&clkcfg 26>;
 	};
-
-	soc {
-	};
 };
 
 &serial0 {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
