Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39403C43217
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 20:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HUcL4wrkapMQxuf4TBX2iNcfH+asIDBV1OE6gDsV80M=; b=oJol8eFalDP3gg
	B50/r7tHGLMKi/PMiFCQAr1FwyNawOnNdvwpeijzB+iJHTojavmeLBq9Uwne+/kHD7H3a6oRg9VxI
	ttsJ+hAleCmUlGWnCBWotZ4Y8L59gs8T0O6tWESWsSV/lkyGZxbyJ0vq0lD/ML/tuksVoOtMB5+Ol
	ULHRkY6QT4140flmKiJ/ZllCFyEfubjZN0tjT65XsHePpiyWOR6AiGqxe15+d9PCehAXcTIVuPWUj
	TVeAixaiZIwaNlPld3fujfOWnL+eiCtx96xfHAJBFiqamTu5j3bPDtGZZJIXjlmS1TPhMogUfPTS/
	oGExRN7UlogHHJ0Yd1Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmLib-00CaAR-OL; Wed, 04 May 2022 20:35:29 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmLiV-00Ca4x-Ad
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 20:35:24 +0000
Received: by mail-wr1-x436.google.com with SMTP id j15so3536048wrb.2
 for <linux-riscv@lists.infradead.org>; Wed, 04 May 2022 13:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RprtUxA8LLqon8+v6D8C02QlLfkROjmGkz+QRU7rBDI=;
 b=aDLMYf06Nnx6e/HeHuwHBam2WaPjC9EAVu1x5UdXLNi9+1AQ1ryhQgRhiMsk6xEwhj
 Q5VvcUsbCQNBgFc/hLKCKjiuy2wSPw2+teFGRZgielDG1jF4sb20dFDeXmj/9KTur4zn
 1rdc7SuZyzTadFWSgIVlUtg9cfJwihJEgkBdpATxIETghw2304yVE5O8g7wry3E0PicG
 eNHmqdQeXu4EVh9I3qkC6FquyINd6WEs5Qsn6FCxjggGSHxo/X4TjQ+q/guHnN26gEkU
 ATI68RDc9b5+DEJFVvhLhXV3XU63jtndtN+uTXlrLrB6yZOSvvY0vCemtmyEu/ujuyT3
 Fwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RprtUxA8LLqon8+v6D8C02QlLfkROjmGkz+QRU7rBDI=;
 b=zoTA9nmKAQgQ9ptBeNJmHRH2sQgJfAEtx9Ncg4kbxJBeFpKgGAxzpijhTXCra3P2g4
 Ge+skTAcQ7Uby5kmOPJK46ZTfPVTZ1Foq4w4WE3MVAXunncPUdRFvsfRqoRvjLTlKVov
 6rlpGLGK5KcXJNTWNLrp6HAIIsLGqGmJIgWXSCWSAUlgKUIZED0AXEIZERQ3GjYZ7jXN
 0So055yUPFdCJso2+CBAcM0GItSOMK1dqu2Q3EMu3VTzNdvIJkA6tbluXSB5mphuwOAo
 ZzkZFN8MdM7KF1PO3GhpbKOhlYLT8VdRcvB33uErl0l15Xd9fl2kiyzxBlcVIPkkatt1
 tlZQ==
X-Gm-Message-State: AOAM53325IuDYyExTwfc3wG+/rkZ9Jbb0c0rFbU3YIaIj3lUIKH4MHAl
 20scs4k15cqwPIC8ORVyteeBUQ==
X-Google-Smtp-Source: ABdhPJxteJVJs+X9m1ttN+KqKFgEscJRioMfV5WffwO+tTjBvwM5rUsFtEO24U/iKXSoIxw0gw+YLA==
X-Received: by 2002:a05:6000:1d8b:b0:20c:54e6:1659 with SMTP id
 bk11-20020a0560001d8b00b0020c54e61659mr16780999wrb.169.1651696518687; 
 Wed, 04 May 2022 13:35:18 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 l20-20020adfc794000000b0020c5253d8dfsm13330101wrg.43.2022.05.04.13.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:35:18 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de, heiko@sntech.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v4 5/8] riscv: dts: microchip: make the fabric dtsi board
 specific
Date: Wed,  4 May 2022 21:30:49 +0100
Message-Id: <20220504203051.1210355-6-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504203051.1210355-1-mail@conchuod.ie>
References: <20220504203051.1210355-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_133523_410575_CB8F863F 
X-CRM114-Status: GOOD (  13.19  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Currently mpfs-fabric.dtsi is included by mpfs.dtsi - which is fine
currently since there is only one board with this SoC upstream.

However if another board was added, it would include the fabric contents
of the Icicle Kit's reference design. To avoid this, rename
mpfs-fabric.dtsi to mpfs-icicle-kit-fabric.dtsi & include it in the dts
rather than mpfs.dtsi.

mpfs-icicle-kit-fabric.dtsi specifically matches the 22.03 reference
design for the icicle kit's FPGA fabric & an older version of the
design may not have the i2c or pwm devices - so add the compatible
string to document this.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip/{mpfs-fabric.dtsi => mpfs-icicle-kit-fabric.dtsi} | 2 ++
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts               | 1 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi                         | 1 -
 3 files changed, 3 insertions(+), 1 deletion(-)
 rename arch/riscv/boot/dts/microchip/{mpfs-fabric.dtsi => mpfs-icicle-kit-fabric.dtsi} (91%)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
similarity index 91%
rename from arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi
rename to arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index ccaac3371cf9..0d28858b83f2 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -2,6 +2,8 @@
 /* Copyright (c) 2020-2021 Microchip Technology Inc */
 
 / {
+	compatible = "microchip,mpfs-icicle-reference-rtlv2203", "microchip,mpfs";
+
 	core_pwm0: pwm@41000000 {
 		compatible = "microchip,corepwm-rtl-v4";
 		reg = <0x0 0x41000000 0x0 0xF0>;
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index 84b0015dfd47..739dfa52bed1 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -4,6 +4,7 @@
 /dts-v1/;
 
 #include "mpfs.dtsi"
+#include "mpfs-icicle-kit-fabric.dtsi"
 
 /* Clock frequency (in Hz) of the rtcclk */
 #define RTCCLK_FREQ		1000000
diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index cc3386068c2d..695c4e2807f5 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -3,7 +3,6 @@
 
 /dts-v1/;
 #include "dt-bindings/clock/microchip,mpfs-clock.h"
-#include "mpfs-fabric.dtsi"
 
 / {
 	#address-cells = <2>;
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
