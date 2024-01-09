Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290F6C47073
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 09:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANV1dhj8D6/O/ey5SStAnJ8SKwDdN0zLugNw48t/7oY=; b=zEMh1xHQJ5UwHS
	qMZO7eXjF8Dx4P/GMBqUX7+bqY2nLsoPS6jffSzZO21mmWBkg59O5xN1+oTsw5AY+qCW3Bv3TWgGz
	WSlGf9MaaMemN91+1kuF28sieBrUZedXt0r02/i4Y2QinqwusoBOlDNSY24m+34niQS7fVsc15TO8
	dOKOua5VkNWkIrg7JqMRPT9c0lf/iweI9OxKImWlL3bqyOCKrFGX0AQDaXf64V3ydaa7Q7U34nTWX
	AuXqEUJzTxS/ZQAzoNjM9tkYDAGYtJdalI5C+TvLioxyrima2m0JGZKEvAADqLqad08UX+YOQ8MJY
	HOublFBUYmuhufdY4I4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN8Ex-007TEm-38;
	Tue, 09 Jan 2024 09:17:43 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN8Ev-007TCS-2N
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 09:17:43 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3bbbc6bcc78so2730109b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jan 2024 01:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704791860; x=1705396660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXs4eXFLnV8TiKAn9u+8OI+mgIAVMlsd0Rv7wG5W1mg=;
        b=aC3YMsFHCoRPHjQ05aGEUACyXacKvT9P2zE4Ud8A0yycVdJVVKiwuuDZ3GK2j2DVwZ
         BYsNiL1i4ttfh+yGmLekPbTx+noZln0BGYq3lMZ1Kk3St+5MEqxIBQmus2qRUQjwU0sI
         1Y1Cr9FLuhwS2k1F/sSmTt1Bte2dK0pr8HXw4GCUGvYwpdVTuSSwVDu2v30CM5qaIqRF
         m3E31MmKFDKSUvvnQyAG2UMje0j5H49vcMnuMdPxOp8IbkUUXm+vqHw2N8I9Yct1TN3O
         iqKLbSMwj5FseCLgkhZlslUXOib5JoJ1UXPuM9izMinzGHn0Y4jC6ZdJ1e8y2Ziau4nc
         0aSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704791860; x=1705396660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXs4eXFLnV8TiKAn9u+8OI+mgIAVMlsd0Rv7wG5W1mg=;
        b=XQkhy2aT+x6US1bVwo/wDSRladJib9CRARmLFShpmKPzQxE+mAjmjS50gjXphApbSX
         XrsEeLbBAUmO7kMgka+VT3vT0Cx64cZ2uZo+OYPYW2weNIbiOhf998ttO9Q/ynVXAaZW
         ofoUNUKbHM+1VscfqH9cUoBGn1DiALwIH2ShgJWdZiM/Du1kUW5g/a/+KEKXPLcTmOv0
         guQ7t3qwfcvdJKTRQ9zixdCp+TZ1aaEFQ5JzjFID2FaV3RU6xVSZLIVvj8f53svZXjQT
         txg1IqDQq71vocKVGZ2ARSYuUKj+5gTRH/JOuDV6NtYZZresHyukuMsm0liNgzR3O/O4
         8NPg==
X-Gm-Message-State: AOJu0Yx8r2sSGF5VIq7j2AZQNWBWp2aM1463W+XF+6ZumM4CONC20I/X
	dCLsNErLd0ut4R4IcyKJsGg=
X-Google-Smtp-Source: AGHT+IG5TJb1vDclA0CAeMnXEGX5CF/pIpS0qcbrdsN3/Y771f6XsB4pMSwsM6DHFg7COEhjJpI10Q==
X-Received: by 2002:a05:6870:1686:b0:204:762a:f8a1 with SMTP id j6-20020a056870168600b00204762af8a1mr6833578oae.111.1704791860339;
        Tue, 09 Jan 2024 01:17:40 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id dh1-20020a056830484100b006dbaf72af27sm305243otb.1.2024.01.09.01.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 01:17:40 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH 3/4] riscv: dts: add reset generator for Sophgo SG2042 SoC
Date: Tue,  9 Jan 2024 17:17:33 +0800
Message-Id: <66a3c846d26ab73227dfcd141d021a46cad6672b.1704790558.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704790558.git.unicorn_wang@outlook.com>
References: <cover.1704790558.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_011741_869201_7676015F 
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

From: Chen Wang <unicorn_wang@outlook.com>

Add reset generator node to device tree for SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 93256540d078..f59081d4f0ee 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -6,6 +6,8 @@
 /dts-v1/;
 #include <dt-bindings/interrupt-controller/irq.h>
 
+#include <dt-bindings/reset/sophgo,sg2042-reset.h>
+
 #include "sg2042-cpus.dtsi"
 
 / {
@@ -311,6 +313,12 @@ intc: interrupt-controller@7090000000 {
 			riscv,ndev = <224>;
 		};
 
+		rstgen: reset-controller@7030013000 {
+			compatible = "sophgo,sg2042-reset";
+			reg = <0x00000070 0x30013000 0x00000000 0x0000000c>;
+			#reset-cells = <1>;
+		};
+
 		uart0: serial@7040000000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x00000070 0x40000000 0x00000000 0x00001000>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
