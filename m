Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B42DC25B5F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zaZwo5MV4L7K1yYdJLScw90efy5EXQBf4Ng/DeeeFhw=; b=IiWXZPJ6f6H4gj
	UGF5RPd8yjjlUuhaiaOTRr5Si2HIcPMHRauvQUkPIbaMJytBrJJczt5p4K5lVneuz2ZRXHEaH0kuW
	mqgPQreL6pcJ2NQmgIxDESOhE/N3sRum+w0f/iqbGE5iZy+WsR3doPD89ChwRylezG211O2hJO3PI
	H3RLMO0//UNUAFRT6wIHN0Ulwo74PH6tneozc4CcT786bk9Q7FSdyakATXsB5XZy/22We/7tE/m/5
	AXt0+4lC39SjvknIUHNU/yFuhcsA+dN/R494F1ERScm4mHNpB69bwPyfqU9SW1F72CsyAtX9SNR/t
	xiEItXq6eEjnYdu5neuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fHT-0000000F9sB-42J6;
	Wed, 08 May 2024 11:16:15 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fHP-0000000F9o9-3IT1
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 11:16:14 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2A0A8411AA
	for <linux-riscv@lists.infradead.org>; Wed,  8 May 2024 11:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1715166968;
	bh=D0ew36e5vVU/6+Iw9oM1mZEw1Uv4LlOrlkufMVDQOq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Lyioe+l1itDvD5ZOJBka37D29x0BRFxqXLS6HjamKjlE3CgumoqV3LTYD5GnWGCqv
	 Oh9Q17G9U7LIQx4YPcjeyy2WeBZYfTy2uP62zis1KBrDMfAlMv16dohiL6VUEsMWvR
	 fPekKoAcZ0GuOM9lYSisbSaVMJNCYdPlmVRoquM/X9eQ+TqJkGXL8iMrhGQgUR2Tqv
	 oxT9DXlfhAMz/+AB4nUdZtKQmW5HHMrfXCd0GZQxQUFf3Q3iMCxbQJnEhp1HKCkIOQ
	 oP8ZeeagnyCEAr5mKiIwQ26S6d9JzWNtntz99Pv6GqK0/NL1bXzetVF8MElPdYfvG1
	 KxqXAbfjTwF2g==
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-572a98b4020so2409556a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 04:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715166968; x=1715771768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0ew36e5vVU/6+Iw9oM1mZEw1Uv4LlOrlkufMVDQOq8=;
        b=wPEZqpIIMhQ2Ja6jxjnYPY5t8zT2cbhbbyXIranLyyOao1Zb8Z66Rhu5KLEzoIfAa3
         J6QVfiLf3+kRJ3ZB17NXFWZ1EEg3T4KHKESUhkZQKw4Shsjp7jGVBPGeapwVCGmEXTll
         kQQh2OYHKwujiaYWDgJjwh6KCc/zjGekmT9z8z8lpPcrE/7lAD/R0rHqI1mH5oQ8xujD
         6U22badxx0zlWPvd9ZZc7JWnEXrqsossAZQm0ySV5vBtjh/B99jT9JJLByerPJVWFU9X
         bSy0N7KnIyIMFYRIBQdSgxnmJQ4dkse1krE0fRtdA2r6p/Wzx8KIvNZxdfzlIVuoQTdC
         77bA==
X-Forwarded-Encrypted: i=1; AJvYcCU3+Z1vd9DGGisbob0Pgyjw6L8Gu/6m4aLRx/9QY+cSoKZQv8oTbu3CMy0+eOo2snYl2ygY73azth3Myr+bioZLYEUOz/ZoybNICn2XqtPZ
X-Gm-Message-State: AOJu0Yw45Kqg57Qe9epP4eR3PZxCExoKkE8BPRCdAGqJ6GRkJb4CW9S1
	SVcdQs1ygQU0vnyImDSSP2iCzw7RSLqCtgN8AS+ctSCzT4fAKb1YxFXmNKbnpOXJdmQPeQxhBR9
	AGv1E7EcsK3g16awqStK6piZOxRJmWZIb9BYa+jZXWFkePicFvz3AqXxena+6l9V7XX412arIi4
	2BUDpp7w==
X-Received: by 2002:a50:8707:0:b0:572:a76e:645a with SMTP id 4fb4d7f45d1cf-5731d9d2df6mr1558874a12.12.1715166967752;
        Wed, 08 May 2024 04:16:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqGr0GivLfWF6z1E1QkljJkrnAc2l74CIT39UNlpuCzyDWw8jOzF9sDgwy5FEt/BbrEhk8ig==
X-Received: by 2002:a50:8707:0:b0:572:a76e:645a with SMTP id 4fb4d7f45d1cf-5731d9d2df6mr1558861a12.12.1715166967248;
        Wed, 08 May 2024 04:16:07 -0700 (PDT)
Received: from stitch.. ([2a01:4262:1ab:c:8ce6:9eb:cd7b:fcdd])
        by smtp.gmail.com with ESMTPSA id co22-20020a0564020c1600b00572a865af10sm7513556edb.44.2024.05.08.04.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:16:06 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v1 1/2] riscv: dts: starfive: Add JH7100 high speed UARTs
Date: Wed,  8 May 2024 13:15:54 +0200
Message-ID: <20240508111604.887466-2-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240508111604.887466-1-emil.renner.berthing@canonical.com>
References: <20240508111604.887466-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_041612_277758_D94FA4B1 
X-CRM114-Status: GOOD (  10.01  )
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

From: Emil Renner Berthing <kernel@esmil.dk>

Add missing device tree nodes for UART0 and UART1 on the StarFive JH7100
SoC. UART0 is used for Bluetooth on the BeagleV Starlight and StarFive
VisionFive V1 boards.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 9a2e9583af88..34c1622d5496 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -258,6 +258,32 @@ sysmain: syscon@11850000 {
 			reg = <0x0 0x11850000 0x0 0x10000>;
 		};
 
+		uart0: serial@11870000 {
+			compatible = "starfive,jh7100-hsuart", "snps,dw-apb-uart";
+			reg = <0x0 0x11870000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_UART0_CORE>,
+				 <&clkgen JH7100_CLK_UART0_APB>;
+			clock-names = "baudclk", "apb_pclk";
+			resets = <&rstgen JH7100_RSTN_UART0_APB>;
+			interrupts = <92>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		uart1: serial@11880000 {
+			compatible = "starfive,jh7100-hsuart", "snps,dw-apb-uart";
+			reg = <0x0 0x11880000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_UART1_CORE>,
+				 <&clkgen JH7100_CLK_UART1_APB>;
+			clock-names = "baudclk", "apb_pclk";
+			resets = <&rstgen JH7100_RSTN_UART1_APB>;
+			interrupts = <93>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@118b0000 {
 			compatible = "snps,designware-i2c";
 			reg = <0x0 0x118b0000 0x0 0x10000>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
