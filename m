Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE434C10DC2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 15:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uliNV1bPwuGOY9cWdzzRr1SCkFcNHHVYIc9LNRTYtAU=; b=o67L/kVRZ2FyEO
	9VJ/0+G0fILAJbqEC9ZsmzU6nO3CfDnTgIHyf96dksYQqIfz1nSfveLE+qqT2F7CTd5VZUmFY0uI2
	z6tbqP3qQ8QzmUjWr43O0zY/OHAHT+J0rK5pVAkLFQFufobE56a8ps0qWGsv8lGTKssPpLCBXaIvI
	xea3DfbvvxutJvawGxpJ37w42rUwkQ0kKHQRT6EHFt/YymdJDMbk2RBONibFwjr02zPL6PAIz8fiL
	l+l8E6v0C9Q5SdtNkhvqjAf7yxudPtB7SiDmpXPMzYVQlUYrCmBZlnvzde4AoknwiTM+FdFUOPTdc
	xEFaoep78OC5zfFyeTmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ipi-00BBcl-0x;
	Thu, 30 Nov 2023 15:20:06 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ipg-00BBbo-1Q
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 15:20:05 +0000
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BE60E42240
	for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 15:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701357601;
	bh=tj9HPh6BvRLNZqMKySfyhhevyeW6ZzHpiXvh8Tdk9iY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=qn0lkeldt9aAfO7a1JfrFQ6B1mo3I0Yazc3vuKglEVFfZ02Z/qWkuyS2Yly4ChaiH
	 p53p5EXdpRkUKHteWmk3Nse9AoagTDK+4cKgnuTDdHBP8mHziMrfOdlCvhBrKim4Wa
	 W+onP/Hs4yQpYPnFq078ZJ/odtPojCsCT36Zb97peTBynFBnSVZrHVHFjoHZmZuYYG
	 MYMzknRSn7p6ipJPTUV0uwU26xDVCJATQRcvAp5w7GT/itup+vuyEj+s2IbHBxmZqd
	 g0xGorB/GHjmMgFz5x5pVaIPC1/G3EihGCgt4nw9r+EYNrTXC0qbtVO4Gn91s758+h
	 PUZIMioHUTQ+Q==
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-5c5c8ef7d0dso1009564a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 07:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701357600; x=1701962400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tj9HPh6BvRLNZqMKySfyhhevyeW6ZzHpiXvh8Tdk9iY=;
        b=DLUGyvN80zYuCVXtJBKvBzOuEoGwOxbkbdsgJXvyN1qjus17e5N5J9QGBtoReNnfIx
         myuanc/xaGMt33akaK0GLM/Pr1U0HDwo3kqgm5F8PaO9raAZBlja8uSVT04xbbnEFDVl
         1NJ0zqwSP75WdzhVZnpC5Mj6HLQRPdBuKm99mX587/5SkBu6ATRpfmr9Va4jFNxkbOqe
         UI/fIAUKCd2n48c0t1Qbx5w/JMLHoDdCoqkXl7e4JIeJ6gl5NTti2S1SWq+ildGUnQUo
         NYZdoyumWCTg+MvcRyPi+hdTnXoZx7Ig74KWaCs4xWi0VivLV5V6m26j4EVE/cfLbvuO
         EzmQ==
X-Gm-Message-State: AOJu0Yw6n4G8eMxqUn1Ny+H+Jb3CrCvmGfd2JnSCPwO6SfdxWOhIAO2x
	4phu7B/FA4YWoP9lauqJUygQ90G8XPfQwuK6+6um0Fekyrup8PWzo3IIkdo7BoungyzOLt5A4Vz
	G1omtt9NqrWx6tucqF7s66wzS1wXIMQLnCeS+YaclNIyvFzhP7VUGLA==
X-Received: by 2002:a05:6a20:2445:b0:187:f7d3:fe4 with SMTP id t5-20020a056a20244500b00187f7d30fe4mr23989911pzc.11.1701357600042;
        Thu, 30 Nov 2023 07:20:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1mvOn1/uJNCv0eb4azsQCzjyj+9l3Hl/zvOgcVmnx6qLHRyWHQAlXD/AuQrB0F0f5KVnWrA==
X-Received: by 2002:a05:6a20:2445:b0:187:f7d3:fe4 with SMTP id t5-20020a056a20244500b00187f7d30fe4mr23989897pzc.11.1701357599785;
        Thu, 30 Nov 2023 07:19:59 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id y125-20020a636483000000b005bd3d6e270dsm1356002pgb.68.2023.11.30.07.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:19:59 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] riscv: dts: starfive: Group tuples in interrupt properties
Date: Thu, 30 Nov 2023 16:19:26 +0100
Message-Id: <20231130151932.729708-3-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
References: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_072004_613129_ABABAF45 
X-CRM114-Status: GOOD (  11.49  )
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

From: Geert Uytterhoeven <geert@linux-m68k.org>

To improve human readability and enable automatic validation, the tuples
in the various properties containing interrupt specifiers should be
grouped.

Fix this by grouping the tuples of "interrupts-extended" properties
using angle brackets.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index e68cafe7545f..a40a8544b860 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -149,15 +149,15 @@ soc {
 		clint: clint@2000000 {
 			compatible = "starfive,jh7100-clint", "sifive,clint0";
 			reg = <0x0 0x2000000 0x0 0x10000>;
-			interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
-					       &cpu1_intc 3 &cpu1_intc 7>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
+					      <&cpu1_intc 3>, <&cpu1_intc 7>;
 		};
 
 		plic: interrupt-controller@c000000 {
 			compatible = "starfive,jh7100-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
-			interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9
-					       &cpu1_intc 11 &cpu1_intc 9>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>,
+					      <&cpu1_intc 11>, <&cpu1_intc 9>;
 			interrupt-controller;
 			#address-cells = <0>;
 			#interrupt-cells = <1>;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
