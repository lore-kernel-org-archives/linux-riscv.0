Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DC5C61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x8wE/wokmigMV5/SuNJu7cbhBFckRxcESBpBRykCKDI=; b=xPiE9wOo1aLKBI
	u6fQNOLMM5EMBeOCbNq/nsTjnStn1aTE3blRhB6nte71DZR7cbs0zljHXQ3+RCFu92thuNnC7WywS
	Jgda9bha5sAdXw2ZMIiMNGR2uMuKHzWx4OOhqM6KxAeM63H2cMh3gA1ekw4mePZqYNHNjZYyXcW5z
	LSHWziwl0AK0e2MLE9N0AoWpiKfkASUXg/o6kcQSxLzyFPopw1w8F1q+06s9oMfQaCtrXzG1DcQGz
	0lHVNchgwKCqnkSbvTmxswTXjinZmInL/O6Apxnaz6yJhBOt87QjcebLEAuK2EEG50PL1bAgWdYf7
	6mK41bmNBHaJ6sRWMAqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGwV-00000009IAc-3Ku6;
	Wed, 11 Jun 2025 08:36:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGmm-00000009GPu-2GJw
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 08:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9sxXUK96pkvyneP6wC9DeR8WotecX7CKM0gM4QRH/hc=; b=cN4y1JOdx7w9iI2qj5YwomCXPx
	7C4DvyCHzl81VCZWEe6dFXPGhrDmAeoaS7EqVPkh0qPlc3gHFplkKcVWqBd7Xki5jyLO9C6TJw362
	9CgkvXOQHlIPCmGI37pBZePizuginCgdUCahfXY7TLCPgXFbYy2qXX2fKeLIGegMrLHYSiWUvFJw+
	mFsUhf8JJ0m4FHeVkOu60fJHdAwG7JFg6+bKetBEZV8je82Uisiy5Vu35NN2kBitDopkCkpekNm4O
	bIKjXTb1G7Ru8Hj8AkPxkzThy8xpwUEB6hEoP3SnKnRk2BHI4YyreMSqGfiwY4LjyvauA7Q4wcAWY
	H+GOduew==;
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGmk-00000002C0l-3JoM
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:26:16 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6fad3400ea3so57508306d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 01:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749630372; x=1750235172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sxXUK96pkvyneP6wC9DeR8WotecX7CKM0gM4QRH/hc=;
        b=Ofsm5h8plSUeDqs/r+q9ex16mN3CwGj4/YY9ix+iPEowONV5VXA0ymVnrg6wMlGADh
         qfkgj5HyXNZK3OUpk6YNYJIyKbr5ROCGFktH7XdKYjgj5XqRtDoIpQuEQ9F3kKz5YXsf
         ylThXpcEK4nHIvoBHPJeFjXjr+IVjY0Vzrlcj21J3ZrGZqbDA2wV8CZ7KcLCmMCIiQsc
         nbs+1GHfSWn7mOSmbRHwVRP6M4n7OjRq5/GTICzE/PyByd7Oiq4adZttrIylxRyDEBjG
         +nfBEVArTTkJMfBwdPkcsfOzxEIqS2XKkL58/06qWg5YiATXKZoyAYXCDS9v3ATrQ31W
         c+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630372; x=1750235172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sxXUK96pkvyneP6wC9DeR8WotecX7CKM0gM4QRH/hc=;
        b=hQ9WSe3YCqIEYLfocF/EpU7t/7T4nBHpWyZO/qUmLuXu2a8YhBDo+StQJ0ffZHr7ur
         h39IICv9JODKUCEgKHEwAuqr/WIlKfVCSioixq+F11ZkTNulqwOAxKbhbpa8w/wJnz2E
         1yZWGoQBtIR/QGT3adFFXTHKJcQiohAGH+4d/LqzCBvBbeOER7qhwAKawQ7clUZY/OnF
         4MAjsjJY210G2g1EfvPRRNjmqgZX8t65fGgjOeRC64zux19+W6vHcvBp9w8/InuzYauz
         mUG39Dxr50BwZwObn9lctNLdWBz7MJhCuz5flQlqKyglZzTvPKHhKaz+XNaghavox+N3
         jHQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU/jcElARiBofxhU53zUrRyvw5qseE2ReC8emZwDS7KXOdZsSIRIsUaJjzDJXrxmOd+dn9YhCU7ms0ig==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj49HPqXyGwd6rVLc5E+VBpoEtLUpy4gyH8uOPkhyFMonTDtFm
	6s6VnJMa6HIygqJykbTjICGznd9pRIwXFaJee1tWMjz+02gMcgUuQr0l
X-Gm-Gg: ASbGncvCStI7oc7x0cJFfOoZ7mgp33bK6zMyWpAWKR05adQe/da8s/8Rwh+4VlsI4JO
	zJ/0JpMFquApP3F3ienIwtYPz0H+peJux32kmW051j2cZHEHQqxUho2A2lxb4sK2iDDDVrfNpY1
	qb+lpodSavDIXdx8XAbrRHcG+y25R6Hv6Tj+PSv1r2LcTffZxX6Ybs9hktJn89dxTLIle3em54h
	CG22hPOEE9uEeuCMt/9oTE1l6GAMlINLREU/6tFemYOTWsBSeofunIJeocN+yzRrZ761lj9hUcf
	nkimpmrfg+rKlLkkK5vaLQXGrtO7dX9RVKqMM9WZuKGWdO2f
X-Google-Smtp-Source: AGHT+IHitneo6m07KgIYEwdAH+xtCGs1vUPSxrM/i2Z8Pe/8lvVYhsuxoJ4yasaZr1lrb7/koSfGuw==
X-Received: by 2002:a05:6214:da5:b0:6ed:df6:cdcd with SMTP id 6a1803df08f44-6fb2c36a381mr41319726d6.21.1749630372047;
        Wed, 11 Jun 2025 01:26:12 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b3648dsm78896886d6.107.2025.06.11.01.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:26:11 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH RFC 3/3] riscv: dts: sophgo: Add USB support for cv18xx
Date: Wed, 11 Jun 2025 16:24:51 +0800
Message-ID: <20250611082452.1218817-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611082452.1218817-1-inochiama@gmail.com>
References: <20250611082452.1218817-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_092614_875836_28C6E7E0 
X-CRM114-Status: UNSURE (   9.47  )
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

Add USB controller node for cv18xx and enable it for Huashan Pi.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi            | 14 ++++++++++++++
 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 65eceaa5d2f8..3ea3a1af103f 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -428,5 +428,19 @@ dmac: dma-controller@4330000 {
 			snps,data-width = <2>;
 			status = "disabled";
 		};
+
+		usb: usb@4340000 {
+			compatible = "sophgo,cv1800-usb";
+			reg = <0x04340000 0x10000>;
+			clocks = <&clk CLK_AXI4_USB>, <&clk CLK_APB_USB>;
+			clock-names = "otg", "utmi";
+			g-np-tx-fifo-size = <32>;
+			g-rx-fifo-size = <536>;
+			g-tx-fifo-size = <768 512 512 384 128 128>;
+			interrupts = <SOC_PERIPHERAL_IRQ(14) IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usbphy>;
+			phy-names = "usb2-phy";
+			status = "disabled";
+		};
 	};
 };
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index c7181ad99f32..f5a800f488fc 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -88,3 +88,7 @@ &sdhci1 {
 &uart0 {
 	status = "okay";
 };
+
+&usb {
+	status = "okay";
+};
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
