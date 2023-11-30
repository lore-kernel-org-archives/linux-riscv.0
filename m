Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E18C07CA9
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 15:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eff0RNjirdN7lf7hRJ+kAOTnyUY9S55v1IeMqCMEM0I=; b=h5VRIRqm7RQg5f
	WzCFH12n/rXkL1VxLrN+on/st4vWYMJGqMZshXELR+95SaJXA3iPCx2l4vS1Ej3x5LjPrnDp+qd+U
	J/PSqiHUSxol19N1nIGKQ2ORK8X/2LNu2o02DN0xku1R8PUOpql/FBaVB9DLBfi/LnVcnl21D0BQS
	6h0hWny8fEAU9+931yuQAbpx+dDHluvm54cmI9vjSnYdzV1pGcQm+4+v203yJD01MFIRSjmMXtZak
	/48KQJvxDK2J/NTxSYiJla2due0V0kWPX9N/D005t1Pw+EqUByfbLdjH50SdqSmwMMXnbRbEgDrdD
	sexi9YF4iORNSEdFruqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8iqB-00BBpR-0J;
	Thu, 30 Nov 2023 15:20:35 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8iq8-00BBnG-1s
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 15:20:33 +0000
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DDC073FA55
	for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701357630;
	bh=OuMn6YJcnYA0SdFjV5QIvrMlS1FQMrQ/PHdRB99f0NE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Qfay1odAmPI2ThEtelo1cVm7XYA0zuOAwD63dO8pfJehiix9h7jR9TVYFwSOqcVej
	 DBUSr89DY+UUZ1K/ogy/KQNaAJWCymbcYi0eYuH4JA334o2hvnGQiZHVAjmVmFc58M
	 XXiXflIYogGsSHRDnQHCs4msfC50FGb28dIK3U6Dx7KSK83GSVs4C6b/Sy3rsl47YF
	 Z8NDjgW/OjbzoZaIa8qVGm+QXn0XjJZwbG1Lz6uYFn2ChsuLIZX5JjOB3o+c1i+5Z/
	 cAQt6Rlp64ri4IugSWRRywNTz0OeWe9VdqNTMH9rfU8lOpHRulI5JRpT+HA6/GtKNH
	 vnud3lZ6mZGAg==
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-6cba754b041so1391948b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 07:20:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701357629; x=1701962429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OuMn6YJcnYA0SdFjV5QIvrMlS1FQMrQ/PHdRB99f0NE=;
        b=QJIxVVJk9tfdtlldHEcINb+B0d+/hZ1D7JW574bIQyiklo+ZFt8n6BwPD6zVfuMwVe
         cY2I2WvyBr2TWPM4ffpGgYL3kpxqYkaH8VMATGMpeo7SdYIMFO9KiiH34A/M3ZKJJlWG
         hrVUnRhTyKgIkY3gqBCpIhia62n57o0X/H1ztO6u3gJ/1LAjDg8W47VW7L7EQkKBNg5n
         xa7IpDGh0umalFi/Trrv8GY6+T+K6hURRDpdkvM9k0mzYeMCLlm5HPjAP2nxJel0/eDj
         YsCWurh/nTQLhfnHl8YneQqQgDofccXv/meY6YnGqeOSdiwBtoC3xVqtTCFIOdWCfQfJ
         kzcg==
X-Gm-Message-State: AOJu0YwFFkqTeYVmQrXWRek7JheI5xtEF2rtMapj65J1649dqHLkWnui
	Wln/JamwglgW0MTBTulE4adt6JkqcXLI85oU0sQx58TYKwRBS3NTH/NDLyALj9TQ78WgBg9b0ns
	umhzlIyoMEVB/dAALDhtRz3EVnfEjogHI4S3jPVHywWDNdhnEf9fokA==
X-Received: by 2002:a05:6a20:6a23:b0:186:aac2:26b9 with SMTP id p35-20020a056a206a2300b00186aac226b9mr20943943pzk.30.1701357629205;
        Thu, 30 Nov 2023 07:20:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGc8h5qPGi0AL06XqejO2yd59FH5mJfnnR0twNHQ5dxExg0fBfVTX56EPNQ52lvJlQlNYmCOg==
X-Received: by 2002:a05:6a20:6a23:b0:186:aac2:26b9 with SMTP id p35-20020a056a206a2300b00186aac226b9mr20943918pzk.30.1701357628950;
        Thu, 30 Nov 2023 07:20:28 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id y125-20020a636483000000b005bd3d6e270dsm1356002pgb.68.2023.11.30.07.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:20:28 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] riscv: dts: starfive: Add JH7100 MMC nodes
Date: Thu, 30 Nov 2023 16:19:30 +0100
Message-Id: <20231130151932.729708-7-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
References: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_072032_748015_ADEF4DFB 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree nodes for the Synopsis MMC controllers on the
StarFive JH7100 SoC.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 0cafac437746..c216aaecac53 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -178,6 +178,32 @@ plic: interrupt-controller@c000000 {
 			riscv,ndev = <133>;
 		};
 
+		sdio0: mmc@10000000 {
+			compatible = "snps,dw-mshc";
+			reg = <0x0 0x10000000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_SDIO0_AHB>,
+				 <&clkgen JH7100_CLK_SDIO0_CCLKINT_INV>;
+			clock-names = "biu", "ciu";
+			interrupts = <4>;
+			data-addr = <0>;
+			fifo-depth = <32>;
+			fifo-watermark-aligned;
+			status = "disabled";
+		};
+
+		sdio1: mmc@10010000 {
+			compatible = "snps,dw-mshc";
+			reg = <0x0 0x10010000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_SDIO1_AHB>,
+				 <&clkgen JH7100_CLK_SDIO1_CCLKINT_INV>;
+			clock-names = "biu", "ciu";
+			interrupts = <5>;
+			data-addr = <0>;
+			fifo-depth = <32>;
+			fifo-watermark-aligned;
+			status = "disabled";
+		};
+
 		clkgen: clock-controller@11800000 {
 			compatible = "starfive,jh7100-clkgen";
 			reg = <0x0 0x11800000 0x0 0x10000>;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
