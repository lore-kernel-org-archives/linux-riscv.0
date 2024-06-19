Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC55C2BD05
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 23:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYYVgZUlybl7UyjrEtLC94eyv9tqExg30Q+zC2tOCxA=; b=kJ8+kGq8w7/4Yh
	W4VemZ04A05pWOSF98+d9AGu3j5FC9xLCmKuDZdW74beikcKXF9Y8/UHN3JDMlMiFr4itMfRW9hxw
	pwPiWO6tlqJnSMvdl53sqGDlAfrX+U01ot5joLq13jRLSBQOf7IR5wC00N4EWgNHxDXw8jkOezDxu
	bbCKnwvKY8lar50doWRi//TOkkGS05ZGNDp0zICcjK0cxKNnOjWyYohCbL1IysB2FyaI5DVjsU1lS
	HXaTDEkoy37H0MAovTHBx8BP1mJcUFFgErHXh9LfnQYOsiBkTFsDqcDij+6TM7Y6Rs7r0CIfqsGGP
	zCCPBeuPgzeruh55bPwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK5BP-000000033nA-2XCY;
	Wed, 19 Jun 2024 23:57:43 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK5BF-000000033eV-1pnt
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 23:57:35 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1f44b5b9de6so2447625ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 16:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718841452; x=1719446252; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3AQO4nqVA0DOYwAj+teZfr8s4wmd7CRI3Tiiq9xY2/I=;
        b=3dfwECT+cEHcj8kPKq0rL2exMBdbLN7k2in8ALFnpaOMyGE0VbVyv/7ORBAo3AxSCQ
         kSH6SIeN03SVLoOPnC5R3p3ns73nE/eQ/9k48EGZEQnnzyzIkjpzd2EdK1dBL+qhzfjO
         HsgdSOaw+tNUPAeabQbiJMs0eZln14ppvuq7Hlt0nihFnx1P0ZRjnOQPc0sNNb23sKQQ
         Ss95rZzqKxxK/NOKfPG+KqGPiyxOmVLHZ4YfGbHmWC+HIrf8GoknkiwqGlDr3kt0bXD5
         Hl03BaJTqjhHUeACqCteG1yAbL842gjbpUiRHHm4wrA8N38XkCVfMV0nlnaePVu1xlwe
         XVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718841452; x=1719446252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3AQO4nqVA0DOYwAj+teZfr8s4wmd7CRI3Tiiq9xY2/I=;
        b=v37Pbd1FnenXoaN9tfQ2MdzKEDXBRDoXb4H1ieKXFDwKGKz5F9m3FTzUkMAGZoL8z8
         xUiziffrDjLPRwce6jBAXDsfC7CFlpORtNrAUsDfYIRJSe/lIwoiyrkZsgjJKuMvGQOs
         j6pcenUq0BUKpjfVdybNJAz4dW+yWfYaw9R6/dYbY5PHP0xUwYVgyvdHwGIV75Qsezxc
         hF71nfmxKww105uox972mG35lqv/1uG6SNIW+J7iLkDSpqEyb+wi2A/KNa2jBuacKEI+
         x2s67yBl86vrjUaURkGSLM6eb7w2bSYU2pZ9i2XimVemfjtaDfPKDgdRr+6U9nlqNuIV
         xMjg==
X-Gm-Message-State: AOJu0Yxuu2kV7qz+5mw7dOIf1tMFPQi51kloH9CEPZ2IAsQZHFSR4g1c
	aoWkgZVVq79zDx4f6JB3yrF9Bw5IAjPK9lUjRlVgxj8EqJUDF1Uaiuc5Ch8eAiQ=
X-Google-Smtp-Source: AGHT+IFoXrhYhjn+/lVsgZXka4n5QsR7TR2v6CJZQsByiet3G9LS6vvYmCHK55CsnhzrqexT+bFstQ==
X-Received: by 2002:a17:902:d2ce:b0:1f7:1bf3:5850 with SMTP id d9443c01a7336-1f9aa46b6a8mr41988715ad.56.1718841451971;
        Wed, 19 Jun 2024 16:57:31 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e70ae6sm123620745ad.71.2024.06.19.16.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 16:57:31 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 19 Jun 2024 16:57:16 -0700
Subject: [PATCH v3 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
MIME-Version: 1.0
Message-Id: <20240619-xtheadvector-v3-3-bff39eb9668e@rivosinc.com>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
In-Reply-To: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718841444; l=960;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=o78oKmhk86m4HILZFTFFZV1kdWoTsr3pfs9WIhJp/x4=;
 b=wyIwTx+ltoBY8XI16VYS4AKmoySM5Q8IhQ1ZFuSj7uZE8LiufHrtRxZHl+k1Rfxo5LRXUuZJT
 Dftr0frldNLC2HCpxXHdoGWEDGFCEF2DHv5yZcMjtNVrsRWLHXM0K6+
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_165733_572144_C3C90514 
X-CRM114-Status: UNSURE (   9.49  )
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

The D1/D1s SoCs support xtheadvector so it can be included in the
devicetree. Also include vlenb for the cpu.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..6367112e614a 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,8 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
