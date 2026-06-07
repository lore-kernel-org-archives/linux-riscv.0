Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E9FCD8C8C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 17:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQY4CuFoO3nqqZnePOLbqqt2tIL53ZDUZDUlx9KxXJQ=; b=vMGxOc2k9CexBu
	vpTvyuFCWjZzEvu5lY5Cij6PD6tl8i6oXdLhjyfD+IBu4wRnsJAKSX0drnMaMncP6RYTrJQhkRmcK
	TrXP4HCqrEmgoMn4lxeUn0JtpFazJ7cf/9LJXfJ2b7M2B4a5terr4akJxH8oUoq7lAcWNQN0m5HoD
	ZBBfJIS+MUerlOq3yKqjEcAJJwxe2eOTCtlSNZKVp79LSLvl7F1q0LyV8AeVeRD4Fug4LEIG/x/j8
	0sMN24CQQrH5Wla8V1RVewxvVWIYrl5clc7Z+91mV+vsdTCLz36NdtNDb8JDOMAqAxvqrvfBt5tyz
	tu1HSXe5HOFOi2i4TMMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHXT-00000002N4I-19GX;
	Sun, 07 Jun 2026 17:43:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHXQ-00000002N3l-1uVz
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 17:43:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2bf1f074a12so37157345ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 07 Jun 2026 10:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780854236; x=1781459036; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51hCQtNZoxXJgbeY5Zuo3sa2yEFucyY7phuZ1UaRfZ4=;
        b=rE1TmyeZ6Ya8JuQz+GntoQLUqP1Ko/ryYl39ChkiO1uBZfQ8EUJWiRjXBKbMK8jBpQ
         ER+9JZsrxCG2Pq4NhCT+S/w4V9Ao1BEPNOfkkZQCuFpNzLFpm1mI+qnh5eWn+hF99lfy
         YBc9z5BrHRzrYAzt25Po1l360TQEXY/qPbosfkbmi10aXjUdrbde5QxWg8P3ZsGL2iTE
         2Jk/KUELYbb7zGaAOXJFEGRojuX6yodVvvKn+NEPHwwJyaOlEpiqPKLr004GTUbupagR
         TVMcTndmBlc3JlXgLLrzJVg2LVO/Gfu+XbBI/Sn06I9bdDOlzxMpQxMWU5xjvUXsiVHe
         lSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780854236; x=1781459036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51hCQtNZoxXJgbeY5Zuo3sa2yEFucyY7phuZ1UaRfZ4=;
        b=Pv8xy95pFaHIklt1aquZS81seSR9uVLdsMOl0BqDvVJPy9KV08rK+F/anTf5rgDouS
         105UFA8VW4QGxdgSvpqPz0RvNn29BBEfyDsEd5yNzw53lf73EaEYGbfxEhlrMOabkRpX
         0G6JIgdHpJ7Sh8lJIgLUzWMLwLL2mmfoXtGad+HfVe+tLKfruNRtY6WnKG6RPmrecKik
         Q6beSuMXx/cQVRzHZ/LBk4KUPA0Sm3fpsmTOExnEbYkK4kl7qy2oHZ2LM9BvR+mU8GH1
         QaqGyHhOMHfeQgAlJyV9eRxkVg94FCvNDqW7btLGxO1Hj4xwpITGBRHsy+Vct/QpaqII
         Aagw==
X-Forwarded-Encrypted: i=1; AFNElJ+qR91Tf+n4kShBDeRjSlE06q0t1IS0fnEvZEBEMlkStMImaf8U32Q/6F4T8tqFmclH2ZclQ79vzeCMFw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1kfV8Cd3r20/EIkFNYVA5ITIlvCaeOERMYYZGDK/CJ9FL+cIP
	NaxjVAFfSgNQ8xGdskNei/a8Jn3sDxG9v2kV/d2XtRxeby7NDeHkAW4t
X-Gm-Gg: Acq92OEXN7IoZgfYGQhEoqB6FrKlCfKOY+nW8pFtbGvMqJTMxtKNgcBZpJfLur8dY9L
	LOWLV0pKq/SpKT9gNtslIVvj+CX3hsAlNaMWDaEf+0qaWpiQIWJ+QeqCyBaHw6wDYGatEgrxdfN
	t1ENnFb1HJeXEoBUfnIuNtSehZ39+IDUKqRQooV2OCGP0Jetyi4LCXz8bmiS7pRTwlARi2c2vWF
	lL8g9CjUmradQnR+usuHHgxL3Q149sK+WZltyXbTxjMk54JVeMkOAcC18VV/LQfmuEC0KA6C7UM
	OsRYYis5C60Z8b2NeIExuwpW/xAeoptE+N9CbeF8tp/8QFStikGYZ1BkBtqyC5SqlpD+ifXHfam
	Jx2g9LgSTMCratyEs2hXk7ZnOjNaKZWF8S+95hnFUphE+nenx/ZOYK4rMxBFf+tIuBQS9sfqTLc
	FuTpyK5jK6T9tdnVSRxzw=
X-Received: by 2002:a17:903:291:b0:2c0:c940:dc32 with SMTP id d9443c01a7336-2c1e821dde8mr144525455ad.16.1780854235665;
        Sun, 07 Jun 2026 10:43:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::305d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649ab01sm149171185ad.71.2026.06.07.10.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 10:43:55 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Sun, 07 Jun 2026 13:41:31 -0400
Subject: [PATCH 2/2] riscv: dts: spacemit: Use symbolic PDMA request
 numbers on K1
MIME-Version: 1.0
Message-Id: <20260607-b4-k1-pdma-req-macros-v1-2-5b2a3955007c@gmail.com>
References: <20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com>
In-Reply-To: <20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=Q0lqw13/3gF4uns/WKal2h1G/je064L1lnG61X5XfIc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhizVtWev3/p2qE70xoZFWnK+a9Nkv64uWXbxuO0Xs59CM
 17P77Pe0VHKwiDGxSArpshy+GhL9tZXPtG+zzl/wMxhZQIZwsDFKQATOanD8E/llLyc8+xv4ap7
 lqx+WP1YXLL/+rrE2w1Hn+2+XBGgkOXL8E+5QpKjef/Eml8TXLN3fjjz6l3ghYft2oXfXErfnNX
 csoAJAA==
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_104356_505055_2ADFD680 
X-CRM114-Status: UNSURE (   9.20  )
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

The K1 SPI3 node's "dmas" property hard-codes its PDMA request numbers.
Include <dt-bindings/dma/spacemit,k1-pdma.h> and use the K1_PDMA_SPI3_RX/TX
macros instead, for better code readability and easy for future
maintenance.

No functional change.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 08a0f28d011fe..c413a64d5560c 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
+#include <dt-bindings/dma/spacemit,k1-pdma.h>
 #include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
@@ -1094,7 +1095,7 @@ spi3: spi@d401c000 {
 				clock-names = "core", "bus";
 				resets = <&syscon_apbc RESET_SSP3>;
 				interrupts = <55>;
-				dmas = <&pdma 20>, <&pdma 19>;
+				dmas = <&pdma K1_PDMA_SPI3_RX>, <&pdma K1_PDMA_SPI3_TX>;
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
