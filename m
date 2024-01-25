Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF52C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANV1dhj8D6/O/ey5SStAnJ8SKwDdN0zLugNw48t/7oY=; b=3svmF8meqwa4UW
	ludlicxyyU5b77/tyNjxz0RtY/7QkDjE7mUaSxVd6ib9Q1yglM1pgkGWZSQd4kg4h4LMBCa5afJG3
	9RT3tjYfRUPn+05EV2L9hF6H3VFQjt73TSluvLupnDFCupz0Tc2tnWw35Ya0HaARMD2J9dsCeqUqp
	6eX7aBf8qiby7vyRnWWHZda0k0glkOYfTlr3cHfqnZiN/b5RdFGOgEvAHhiPEf+Wq20qVP1RNkHST
	RdB3xqRB1V/sUTSfKa4djkOFXkBG8IVidfQMyJ8e1GgBbr+YZCExCp8eZp62f5e9UpYYufFwmgIBq
	Vq5Oju4LCHafHpg99wuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSsxr-006fwP-1s;
	Thu, 25 Jan 2024 06:11:51 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSsxo-006fth-2o
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:11:50 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6dd8cba736aso4572380a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706163106; x=1706767906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXs4eXFLnV8TiKAn9u+8OI+mgIAVMlsd0Rv7wG5W1mg=;
        b=X2IeXYNM3uMkzHM5/PV5ZtrOqAL0KwfLcfoTqYd6G2qX6iaR1ks7ZNN4E2MmncXbeV
         2qQju/EZcUjbAPeHmBr9xJN/lZQpcSeLqa1cKeLmm8e0UnaVW0erQSFlsY9jri8SyeS1
         YFTMA9fT/S1/sU9uSZCvRkkIL8rtkN7GlyrKC+vimHoqAn1nozKmgbo93+EvbDs+s4lU
         favCDn+z+ZfYEej79I9vz17quNNWNIZoRETQnJOJHLqEL0SS8Msaku0GAcQBbYdy48w0
         Vwk7LCRBdUcKAeXWVReNB0IRTwPaZV6+BoDrEi8xFrlmUCcXkpZrFmPaPOQ/ZXBZjRPV
         e0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706163106; x=1706767906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXs4eXFLnV8TiKAn9u+8OI+mgIAVMlsd0Rv7wG5W1mg=;
        b=hvayL1CyWuksQgqlzXddUzLSPYx2w8sx2JTHGk3rpFefaqKxK0RtKHBOIf5yuL9jGF
         pyI2C22+YNzWz4/WFIn3YdISU60tm96IOEMWi8oykiZQPhL8pKcOCmb+3Ej5XmyyHinC
         Lz4rpxRqNV6YmPoINx+wlVORYkAp0e7sVeSH4Gf5GPqLAovRz2pGjlWdOiCUVFKksXnr
         g7k54bExIF6qu/chS3dt3DX00YivazMOAhNdXNmmWY4fTrLIqvocIES4IAOE0MdEiZDO
         QJ5KIiCuDit20MxUhaFN9ibBDJb9E2ZK3c31aWGnvk3E1MVWZ7fb/+RE6KjDqJQRVrD6
         8zMQ==
X-Gm-Message-State: AOJu0YxoKqaBJJ1UkLEYoNaV6+zl1bycevd20wwoqjLc3BxR+3Yz/1i5
	hLcA8rsVCRKN26k1AYX1068gH/rLH8QPAv2JWcpdZMPaxxB21wbZ
X-Google-Smtp-Source: AGHT+IGPv8XWHmnipQpI8c9vTBTtdJ/LiW9rOnrrb8ZlyCZnBJ3lppf9GtyMaw27UoUrBTpiCfqXsA==
X-Received: by 2002:a05:6830:1cc:b0:6dc:12e9:f638 with SMTP id r12-20020a05683001cc00b006dc12e9f638mr440913ota.11.1706163105715;
        Wed, 24 Jan 2024 22:11:45 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id s18-20020a056830125200b006ddd602afccsm2886399otp.66.2024.01.24.22.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:11:45 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	p.zabel@pengutronix.de,
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
Subject: [PATCH v2 3/4] riscv: dts: add reset generator for Sophgo SG2042 SoC
Date: Thu, 25 Jan 2024 14:11:36 +0800
Message-Id: <09cd6540365a44ba2f45062a6afd920f4f4a921f.1706161530.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706161530.git.unicorn_wang@outlook.com>
References: <cover.1706161530.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_221148_909016_D93583C2 
X-CRM114-Status: UNSURE (   9.66  )
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
