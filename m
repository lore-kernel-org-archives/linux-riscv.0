Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0C6C07CB1
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 23:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCwWXk3wgOYeyTTXQXzxqBoB0jo0nw2UIFhUdKBlFZg=; b=pr2Dn16277sgxo
	WSEHiz1aCcNn7jcJAk1oXn3sKevJmFxJ0B693Y+gd5Qksslce8aknzIUwSvSEpVMcBHx4G/nKLkUy
	K7JWt6sfu2Aj2pkI94pvBiPzTc6w1eJ8d1dZeKuwSMZZ+Nu3AnzbVawwxu37ThcFe3m5i6hT0uC/l
	ZmAkJJTeOXBuw4N3DGEE4rEiWcgk4aMoiuXPO6BGvQm3Dp63DJLy5j/PtOCwuZDR7hex700YWw/Oo
	xPKyE7tGEyVtPFU+MzdQ3NgE81rudanbkFxA33jgSeAeH7/8fdYXeHr23TiIgCj4nvCYmkLEmSUB1
	xnc7JKaIrPo/+WvLpZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7OXy-00GhAt-1e;
	Sun, 26 Nov 2023 23:28:18 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7OXu-00Gh7q-26
	for linux-riscv@lists.infradead.org;
	Sun, 26 Nov 2023 23:28:16 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 72EFC402D4
	for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 23:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701041293;
	bh=Vqg7fThbBt+8kUZZ3WC9X56u6PAz1V4l82aCCquh0FA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=mnjkk6zWpEKw/y+GCW70v258ONf5b+sNmoz6P0vz6lbs1Ys7uNEYVfBx7c3KnW92g
	 hZ4PX9U4oGKD0GvqYyFkN/tcM/WI0j3gQMwCrkEZtqQ1wrEXufWcVuQ0tHi+646jnf
	 rrQJaG9LTXvwG+4Ar0yCeAbmodlBH5Kw3WkKhaCKTs2pW12gVFHLzeedomDsMtfjnU
	 sa6w6wkVHMyuXnzcE5Tz9I+iEvKdSAgYlrjjSM7nlVQfsbjKX/+1IV1mTcOGPID/Pp
	 n48RrtYpzIoj0gkhsSjF/PgI6C8071xn6IY324LmhW4V34VlKuo+JPTiBh481WOfl0
	 8BgbRe/VGdFUA==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1cf8b6db1a3so35489905ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 15:28:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701041292; x=1701646092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vqg7fThbBt+8kUZZ3WC9X56u6PAz1V4l82aCCquh0FA=;
        b=aTh3w/jYcqYTM3PFv177pu8EYX1Dap9SCd1eBbq/r+nhiTTLxPdR7tMraQp86+AMIE
         qxCp9GnfrCvVAZv5Y2hY5+zAf446nYNevvkRENcAnQuZSePoz8w7oQVjrxljHQQ6Bm/l
         +IeKFH8yAiFoLyJrtXtsFy8Kin/v7ndDorVdN2+WVVQckBy26l8J54cIrqOAI7zkL2ul
         6NkwLZYxZAieAGU3IbhHQ14xRfDnoKT4n120lIefmr1U3WCQJV+7YW80D2rNCLD+wGMP
         mZ7NmvTUzytJ3GeGxJmS3fmrKI2TuVZkgMn/aX1g5/S9sR2DIaewwh7JOSOvEZ5+vxdY
         R3/Q==
X-Gm-Message-State: AOJu0YyxFk825LKkzIeJNk1NIkIwLztjfHNcNigOxIJSJyB7u6E/F1nD
	dVF/kuDMPd178a9apjWJs8GnNNiEv5PESXcxZFatklmip9okaYAnrzSvFbzKfPI/vc8vfw4uooG
	RV9G9NeWnU3NJBWprsyFfduiLu1Ic7C68UIm3O7drq7W8MZiirrmobA==
X-Received: by 2002:a17:902:c942:b0:1cf:87dd:5138 with SMTP id i2-20020a170902c94200b001cf87dd5138mr19675984pla.29.1701041291903;
        Sun, 26 Nov 2023 15:28:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNetELMWc4XmW/Du0+GF8pso9dZtHfzTB9OE36Oakvb80NDQtS6s7ixj3rGx/02k0I+BSaKQ==
X-Received: by 2002:a17:902:c942:b0:1cf:87dd:5138 with SMTP id i2-20020a170902c94200b001cf87dd5138mr19675962pla.29.1701041291569;
        Sun, 26 Nov 2023 15:28:11 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id y10-20020a170902b48a00b001cfb52ebffesm3123853plr.147.2023.11.26.15.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 15:28:10 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/8] riscv: dts: starfive: Group tuples in interrupt properties
Date: Mon, 27 Nov 2023 00:27:40 +0100
Message-Id: <20231126232746.264302-3-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
References: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_152814_819075_D9BA19B6 
X-CRM114-Status: GOOD (  11.03  )
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
