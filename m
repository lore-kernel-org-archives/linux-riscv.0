Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05D4C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 15:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AgIDJPLfOvUt+wOeH9xVtUVcDzLggquANcZuzanuOiU=; b=N2ijxZlXkJ6UWo
	M/T9OSSL3ZjVxaoig582KFjRx1NqLYzRPeXOuvxjPxdzsVPNfvaA9w9r9XR6K+SmSphigvHRFXuTB
	vfDojRl+aDQ/AS8A1KubAoDiMqC4+X1auVk5nzuT0PIcyN6nAiQCaZGehPyWEoW9794jT+3Far4/Z
	/dK4qfOQW22I2yE4JdYLJI9kcP0UiKllA2Syqkb6zKULiiug35uoZzyvvzFzc/v5Vb/R4RVfL6ZGW
	Jb8TfIr2WaqS1uem7AuyxvuZ4pxKavjtzWkwjic2riHjEljLtZTK5WRAogrvgRfB02k8NvVKjRwcZ
	lkY8SDkSF6msGS+febBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ipz-00BBhG-0D;
	Thu, 30 Nov 2023 15:20:23 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ipv-00BBfa-33
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 15:20:21 +0000
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9338C44441
	for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 15:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701357616;
	bh=DJHVa7mIKQwhZz/JHltxB0iKVUnDkFEjfRvqGAQUx+4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=d0EHTKtbWwl3Iy2AaSzN1Aos19ZHoqh8eqsCNEB7TiGPusOiNt2sDxW9PVjcshRNH
	 j2CquydUBg1ulwavAKzj8bpIyXJhB4IjMGGAGgNC7hcRhrmCtygpr3YQ+8KedZAYhK
	 O6ovQNPlWJC69G9uvTmiyUtN5N54YEiEXjmlDWeZOdBKVn0ZQ+3BkDZqtI0Af8drCZ
	 +oPRwPZUNynzk/VGGZEZ9vF3vCPUHAzGLVAYjHfvYRWfCaXE/rot8b7KikI48tIB2C
	 eKEPmYCIiq0ciQPjFazabLQgdFjlEZcVmCLSLBRSbWDYB4CexP6IIsMTjDZwL0zo42
	 FMSx8S3JBKeog==
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-5c5e6009b98so928536a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 07:20:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701357615; x=1701962415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJHVa7mIKQwhZz/JHltxB0iKVUnDkFEjfRvqGAQUx+4=;
        b=u8AUADzL1hbxYf3JoHjkfLytEhPPCXMv7NwTOR2KUdnLE2BIxRbnKxASWkOZEPz6Yj
         2pSEX5XPE6SEoKRUynKfBYlX98k/a1AHp9Xf4h/y5qQLns0pNFecBefR9atp4oZxIA7R
         h56497HpOjeJBrPOQjQm4LzzAlj9Y37Rw/hC69/vqGUuDq3CuZtJo/9MTw8Zr+89+A6x
         hNFRSXyzvjybkrRmjVSiNpPmdinGGVS/2KmLuS9lpkK1cxlsaIUJ401P+Wk4/P6fYPtf
         HqdQM0xGVzVvcRVbHeDbl96jZRPQCPu7agkzle9JyO+0vbECfB3QQbxQDAY9hM23ly34
         E+3Q==
X-Gm-Message-State: AOJu0YyDEZSrqECKh55KTSrGnK5XUPu1jhHpG7nUp/d4z3vHvAiQEZAP
	YIk3cfpwVlUL2QKepPTbMVmiVZHlGeNToPlGF09R4PYBhidS2SnlyvS+Uzd5AP2JIArOPiBjN37
	gP7dC61pJerxPjG45JZuRYJXuMc206f7zG/Rfq/c+IvaLPUAxEhNY8w==
X-Received: by 2002:a05:6a20:7f98:b0:188:290d:17dc with SMTP id d24-20020a056a207f9800b00188290d17dcmr23728142pzj.60.1701357614813;
        Thu, 30 Nov 2023 07:20:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7Mu2nDLembDBF+YwfqitZTioRcWFBD0XGtNJbp2zbw7AJm8Uh5SE/GyfEnowTrFxztj1irA==
X-Received: by 2002:a05:6a20:7f98:b0:188:290d:17dc with SMTP id d24-20020a056a207f9800b00188290d17dcmr23728123pzj.60.1701357614540;
        Thu, 30 Nov 2023 07:20:14 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id y125-20020a636483000000b005bd3d6e270dsm1356002pgb.68.2023.11.30.07.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:20:14 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] riscv: dts: starfive: Add JH7100 cache controller
Date: Thu, 30 Nov 2023 16:19:28 +0100
Message-Id: <20231130151932.729708-5-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
References: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_072020_112593_30760C3E 
X-CRM114-Status: GOOD (  11.22  )
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

The StarFive JH7100 SoC also features the SiFive L2 cache controller,
so add the device tree nodes for it.

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
