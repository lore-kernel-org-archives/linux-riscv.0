Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE548C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Jul 2022 11:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJD9DHeVMaW2s30YCUyMda1OY7Uq9PDCVaTAurSN+EI=; b=vfCoRnU4B4H2A5
	uB2IC0BmQMuAxK8mf10QXvlxa56NaN1BNdZUTX921Y9zIKFM9MpLFZzFgFj3tMRbbw6OLKpFBOe8k
	D92hNQp6ng8hZQ9G2QhxKqrhRrTsWuj/0SZ2gCW+rFVI9ZovfMcFVlGc1bKRvDDyEAxPdfQRwe/Q/
	G55+QRTI0Q5vEg8GM3Jv6vUcUFBfqnw3OlYpVL6YhJoTHoJlX6tKNf5VSBGinQxb+CAC2qeYkzgnI
	7WQBFpAMtPbFN6m4I3GMxY8NUHrZiRUAExyADWHy5KiOw28u0R/xFtqTe7ERvL1xCbtuYFLemgx/i
	IGtG32GxsmeZS35t5tTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAUsp-00BWRG-CG; Sun, 10 Jul 2022 11:13:51 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAUsl-00BWP6-88
	for linux-riscv@lists.infradead.org; Sun, 10 Jul 2022 11:13:48 +0000
Received: by mail-wr1-x42d.google.com with SMTP id f2so3709318wrr.6
        for <linux-riscv@lists.infradead.org>; Sun, 10 Jul 2022 04:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XsOERqNwelu12XjD8FtXDx11QrR0OCaWBEYcaNV+KUw=;
        b=bkio12fNhVxbCLSXLZ3bHNfOMqjDQ75MHF7J0tFOOmdmDkazmFfFp5O/eeeq2Rdvzw
         hL7wZq541mPQQ/UKO1D2+LArzk4U2haDBGqcdiUmwY63HK06ThbQNmmsh7qlc6z8iX0G
         uQ6CxK0ok8yVzba/s/kZSUQtNEL2rgesWsEkmhhhvCcHJgZ2cVqJLCHs+q3jw2zsNLlp
         BnlFhnfDM34KKLN6aBd0y8pQ/evgKW5TFeOQrEnRWICJUWwXMfpy4Yo8FLQnsqSNOYJo
         vX+Wx5E0Q+dw82vludspxACLsWxhXUGhAa4UB3JzOcWkqV4gl8v3Re/BRRoupGLTde0y
         dZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XsOERqNwelu12XjD8FtXDx11QrR0OCaWBEYcaNV+KUw=;
        b=eOsyZbahr77vRWFxmQF0xJ8Ul5IkH4CUoPa/GvaaK52a8vJb8GsK6m33RhMog1bqH9
         Rf/fsy5rziyVLMlE3fbjo/KmoOwyInpAcXYseU+FrWWX9bxW73lbV+ojMezp5VnmdHz5
         PUHjstarRy18kkwbchDmb5lOZkiR/Ly7/GHi9LDk55qWFe+JfYolT2rEaBaMQRTY1zU2
         Bvn+jsFou+Dmiv4CZqK6URkrXM6uFd0F4LFmWl7Q7ltRHQTstn5GI+tk3ByeSdaXz1F0
         1hMWMksAKN2eBhD/xTM4aZMb33WWcqvfo2weeW1L2a/41NVGoZScOTbC6YGAR3kZWhWy
         33fA==
X-Gm-Message-State: AJIora9Ji0g84pddnL5NSGuutONvrU1gTKIcY/w72IlLAIgkL2STelGJ
	7z1N3j2+1poHUAzCDV3aCwGKHA==
X-Google-Smtp-Source: AGRyM1sOSwHYu/3rpJ7hw5iDbQA3W2/SIK8M8dHfGid1FjVpBhpFs1F3/GZ6Wk70qJFIreOdWatRMw==
X-Received: by 2002:a5d:5548:0:b0:21d:69c1:c09 with SMTP id g8-20020a5d5548000000b0021d69c10c09mr12138559wrw.251.1657451624510;
        Sun, 10 Jul 2022 04:13:44 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id c8-20020a7bc848000000b003a2e7c13a3asm61219wml.42.2022.07.10.04.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 04:13:43 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 2/2] riscv: dts: starfive: add the missing monitor core
Date: Sun, 10 Jul 2022 12:13:30 +0100
Message-Id: <20220710111330.3920699-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220710111330.3920699-1-mail@conchuod.ie>
References: <20220710111330.3920699-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_041347_308007_7363A244 
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

From: Conor Dooley <conor.dooley@microchip.com>

The JH7100 has a 32 bit monitor core that is missing from the device
tree. Add it (and its cpu-map entry) to more accurately reflect the
actual topology of the SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index c617a61e26e2..840875fcb633 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -67,6 +67,22 @@ cpu1_intc: interrupt-controller {
 			};
 		};
 
+		E24: cpu@2 {
+			compatible = "sifive,e24", "riscv";
+			device_type = "cpu";
+			i-cache-block-size = <32>;
+			i-cache-sets = <256>;
+			i-cache-size = <16384>;
+			reg = <0x2>;
+			riscv,isa = "rv32imafc";
+			status = "disabled";
+			cpu2_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+
 		cpu-map {
 			cluster0 {
 				core0 {
@@ -76,6 +92,10 @@ core0 {
 				core1 {
 					cpu = <&U74_1>;
 				};
+
+				core2 {
+					cpu = <&E24>;
+				};
 			};
 		};
 	};
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
