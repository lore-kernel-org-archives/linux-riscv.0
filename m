Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63B6C4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 23:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+2Nx62UU4ucpH/7N9MHi+3n1jgf8+AfiEnQFqs4QQFE=; b=lq1+XT+7vzOkLi
	LIj2gTGJmSJB94GQV9sZQE8fJ8IgSLP3Awsg60Ef/eoAJr+CZ3moh4G+Ac3YXa9lyGVK/xGHd9bz7
	82qfo3SrEcLVFJJ3ia/v2skIIGOT63Pv5pQw2s4RCUnHlrTWr7+1mjYT1vHKArFseDkwu9zQu1UUh
	0yiHe2+Htw0cNwaHJTHuJgu6cKnTqGKFOVsS/LW0KTa2tEWuwVCG7tgzs88YQeU42aul9NMWsBMjO
	P34uJrQdMuydIh7YlrrMJzY1jw/sWm9BwnyrmkzCMUJYxntme1IlzWw5UywqqauHyPF18krieH1PJ
	NmKRa/BVZHzSv569dFEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7OYF-00GhNz-2i;
	Sun, 26 Nov 2023 23:28:36 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7OYA-00GhJO-2F
	for linux-riscv@lists.infradead.org;
	Sun, 26 Nov 2023 23:28:32 +0000
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6CA443F887
	for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 23:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701041309;
	bh=ooP6PggRSm/MvoVaaWC7Qd0T8g9hHs1exEm2Idgm5Vk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=q1wbC1Qx2zX+qa1w0VLEwRMyQFUeL8jM7006IKUwTZborYgj9Ze+irdDqKInKw13J
	 Pm2aSTnPsC7pFzGck0j8ATi3cKC05LlTw/WT5cOqga6OmyqDm90I5tkw8vX/Ahbt0G
	 b5S06cKkAT1OoMGnEooXAzR44cBregzdGqtWcRxCh7Gzt6lgJIDp/NuRTaDkth/EXF
	 csV1UxzJfArXGjY7+z4KkQ7+H92UzmbCtbWR7QBVCM+RM/FrNXbeTfERZRyJ8BLyOP
	 Gq7BDJmSnNQOFXvT0OWtQqc8JN9vp4Xgbyq8tJ8QbiUAAF4OQGA/VDSakpvuTB4YoN
	 WSGvAyTvqblwQ==
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-5bd0c909c50so3516246a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 15:28:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701041305; x=1701646105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ooP6PggRSm/MvoVaaWC7Qd0T8g9hHs1exEm2Idgm5Vk=;
        b=Xp18h/KwI0tjXGQ5AI++uFdK7T1w3OHaDj6TnWYByiNHOfFKsCqv83z2gv4uicuK+9
         yYbDGmtPdM6MX1/pFEsHicrO57SaY/ATkI8EaQwI6PlzkZXgsoC5KxUzLrLxl7EETZjp
         x7aI4cZ3yIKrG5Fg5qkAwRzt7Wshk1kHJK7/ZJt5uvh20byC9FoCljEMsuGPFu0V2SBp
         BlTFbZaoVl8yj+0mxBWv6drEmEPvtVPfkZWTB1nQEJxzakioTgXOUm7HEZd8YAU0wc7A
         adKX071wnGFHZyblp6j0hJlGJbHDp2HMgF44qTQJMjeaI1hhtsnLyiIzt9PdvJ3NTxeu
         V1bg==
X-Gm-Message-State: AOJu0YxjOzdkaflaRKkDVxgfJO8zYXZ0C4Nqt5ZuJzPVj7kEb3GpL6xw
	46WFmc2MfP7b0IB6bXijTMf1/Kln7tBDrUAp/2qgoQZp/IfOMogYLOfejaGYJjZCC8mnzy9EST1
	/pRPi2J/47YL5VPlSZO969UsOND2oHvHdUnmtIzcMU0VkZ7l8Nqa5rQ==
X-Received: by 2002:a05:6a20:d396:b0:163:5bfd:ae5b with SMTP id iq22-20020a056a20d39600b001635bfdae5bmr10808810pzb.15.1701041305137;
        Sun, 26 Nov 2023 15:28:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6/+46S+tGsJEGamPcALc1jASvPx4ZKJR3bsxdW8PeeYicEZOnptpK9l7LnyTwdz3qboVPLA==
X-Received: by 2002:a05:6a20:d396:b0:163:5bfd:ae5b with SMTP id iq22-20020a056a20d39600b001635bfdae5bmr10808799pzb.15.1701041304797;
        Sun, 26 Nov 2023 15:28:24 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id y10-20020a170902b48a00b001cfb52ebffesm3123853plr.147.2023.11.26.15.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 15:28:24 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/8] riscv: dts: starfive: Add JH7100 cache controller
Date: Mon, 27 Nov 2023 00:27:42 +0100
Message-Id: <20231126232746.264302-5-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
References: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_152830_942176_883E30DB 
X-CRM114-Status: GOOD (  10.63  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The StarFive JH7100 SoC also features the SiFive L2 cache controller.
This SoC has non-coherent DMAs, but predate the RISC-V Zicbom extension,
so we need the sifive,cache-ops property to use the cache controller for
cache flushing operations instead.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 7c1009428c1f..0cafac437746 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -32,6 +32,7 @@ U74_0: cpu@0 {
 			i-tlb-sets = <1>;
 			i-tlb-size = <32>;
 			mmu-type = "riscv,sv39";
+			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
@@ -60,6 +61,7 @@ U74_1: cpu@1 {
 			i-tlb-sets = <1>;
 			i-tlb-size = <32>;
 			mmu-type = "riscv,sv39";
+			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
@@ -154,6 +156,17 @@ clint: clint@2000000 {
 					      <&cpu1_intc 3>, <&cpu1_intc 7>;
 		};
 
+		ccache: cache-controller@2010000 {
+			compatible = "starfive,jh7100-ccache", "sifive,ccache0", "cache";
+			reg = <0x0 0x2010000 0x0 0x1000>;
+			interrupts = <128>, <130>, <131>, <129>;
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <2048>;
+			cache-size = <2097152>;
+			cache-unified;
+		};
+
 		plic: interrupt-controller@c000000 {
 			compatible = "starfive,jh7100-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
