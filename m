Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA71AC4453A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 20:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GxojBVesxCk2eE1BQ1RuNo5dAOUQ63a+Wy1qCKYaF5I=; b=Cu9XBZn1QMRYzR
	j2XTgQisCkU4SkPEu+ld3YLiNThPPuHG6cba75RMt0txHHB1jQOObgYo/daMORMAx5uQBS0B7PgW9
	YtEGLII4obiKmBJjvw7UNhVcv1AkLwfMeEwBfxOi00w9FX5sucKsXEyYl8Ok4a0mw+YczmDysNMW1
	G9TOymln899l0GCfNd0ytAPCI5tGxWalxO8161cojX4xnoxICPDVJbnNZjVTU5JzqZPpGPf66ZUGU
	6DXqzmBd21ke1dFR2xmXhUl49iIk650KKkPMh4BPlW0waciatkT3uhmbM08xmpVA8TjUezbq4B80Y
	Sq7iNteV+ju8bAyJ/UHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdbO-0000000CjRz-186W;
	Wed, 22 Jul 2026 20:31:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdbM-0000000CjQy-1kS5
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 20:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784752295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HO7EY2uSAl2r3/4QPFjAWAR2NbBnS+jBGqUz+JFZA0o=;
	b=VUTiy7/f8VHxVZkf3RZAyh/amjvsM/rwePeEaaFuehWFwPBItEOO5Mvku7Ea8vUkbZ7ZNV
	AwD+ypTf6SiN1ubwt2XrieWszaUTLngNVcZTTEN3GMQlW2H7vxtej+e6G7vifrdiBFWZ+W
	oGzG8sZUL5mwhZf5giucCQ8isLnNho0=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-eMReY-n3OQCLggcoiADuWA-1; Wed, 22 Jul 2026 16:31:32 -0400
X-MC-Unique: eMReY-n3OQCLggcoiADuWA-1
X-Mimecast-MFC-AGG-ID: eMReY-n3OQCLggcoiADuWA_1784752292
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81f0b6bb02dso62182477b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 13:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752292; x=1785357092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HO7EY2uSAl2r3/4QPFjAWAR2NbBnS+jBGqUz+JFZA0o=;
        b=APGuANGf8ay9RabqfuLlIrqX9DwivLKLeVxcKOg+uok5hQ6/Db8gjo5/rUb0XOCWfR
         GpfOEl0X+j2nMwXBAaI126Y1pUrjkGnyfI8BE6CCMTBDX/9G2Z6++qT7lk33de/1riV0
         qn1QdnqUyeyDrf7VuwV/yt3YcfBoJmByiGlOK4eqjmwLaZ0rgXSdqD8/BAK5Yutb1+md
         VuEYKxDlTMsK7B2BKXMkmUz+DAe/XMM92j7q266VSGgKD0Wr1WQ4uvqKK53EZNcGH7qv
         L6n/pBbaKTGn8QR4t4Fm8/u6zr5fO6R14X7og8NoNf7CuA3lLVG5hnJQhXwfqUBTeSxJ
         nVZQ==
X-Forwarded-Encrypted: i=1; AHgh+RohuZ2jXGwmQqptQzFPIqnJ9yhDUDe9moE+JqW6vmMVJ8JTYUn+lG00GwMwWwubCVosiOLlp4DDZ6mrAw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyik+xkIi8+ZOOsJ5fJlPMgTE9DMOrlz7PJVJ3PkhEZtY/4oYM1
	0ZveZnVHX5UYweB7fEcgmc5D7oy/jLbTZUv/pAoC2LjkOpdofHIOvCgKn30hSwhszIfXJaCW7HR
	w6p7DGD68X9BpHMqM+azHbG79CiQ93XeOcwSci5A51xwZnqlASVn151BS2fYURNo2+qfiNA==
X-Gm-Gg: AR+sD117irpPizMf2BkofTweHzdgfDPzkdvYXLLElUDJ5XGM3daENVfJG8gv8k+FEi3
	jBO3EoCc1hpIAidwdwfKTQOSdH1FbVro2wqDXy8+NaUfrj1PGlxnx8V8l94SAQLdEesX9dW4q2I
	HTwjh1zxilqNpi9xTcoDW3XfAX9wvC8oOqw46uEDmvx5yRaq3KlgbKKQJX5N1eb9Qap1m+u3Cxz
	Ven5EOrZu1I1xFhUwIseA4INm/FV09FbssFTXlKLxZT2/5JuS6pWwvZb1wR4/kSRzq6UZhg6X4l
	6Xx3yYY0hBwmotJhCh5vylSD0FJ1HZFWxUN2QF4JmQS640mr1TxrPg==
X-Received: by 2002:a53:d884:0:b0:667:b238:873a with SMTP id 956f58d0204a3-668a4fb48f6mr21490d50.86.1784752292109;
        Wed, 22 Jul 2026 13:31:32 -0700 (PDT)
X-Received: by 2002:a53:d884:0:b0:667:b238:873a with SMTP id 956f58d0204a3-668a4fb48f6mr21488d50.86.1784752291660;
        Wed, 22 Jul 2026 13:31:31 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-668906d9344sm1923573d50.12.2026.07.22.13.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:31:31 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 1/2] riscv: dts: spacemit: k3-com260: add eeprom on i2c2
Date: Wed, 22 Jul 2026 16:28:47 -0400
Message-ID: <20260722202848.1817988-2-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722202848.1817988-1-jberring@redhat.com>
References: <20260722202848.1817988-1-jberring@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Js6anJR8q3X7e0G-C7sm-T-JDu4TgY0UjWa_x_lCnRk_1784752292
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_133136_536500_0A7A9C75 
X-CRM114-Status: GOOD (  10.21  )
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

Enable i2c2 on the K3 CoM260 compute module and use it for a 24c02
eeprom. This eeprom stores the product name, a MAC address, and a serial
number.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index a38d7b738258d..a6f160dca19de 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -26,6 +26,38 @@ reg_5v_sys: regulator-5v-sys {
 	};
 };
 
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_1_cfg>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		pagesize = <8>;
+		reg = <0x50>;
+		read-only;
+		size = <256>;
+		status = "okay";
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			mac-address {
+				#nvmem-cell-cells = <1>;
+			};
+
+			num-macs {
+			};
+
+			product-name {
+			};
+
+			serial-number {
+			};
+		};
+	};
+};
+
 &i2c8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
