Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8FFE743D6
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 00:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=50gaK5Ypsty6JlZe2jsf9OiMZXUcZdz7dRJL1m6rjTE=; b=w1pMfyfE/B0cy8
	v+t19EUIFZpb2nkNto8z2VT7p2a9j4ucxyybNa8NJzg/maT/zPveAagdSEnDXaRJAF/cZAexk8bWJ
	PgkwgglxtpQmiHY7ly5oPTdHxHtYfhHTrmjRN6EfVfsOw3ZZrB4dSTD6OoXLzuQys+D+iVudBig3s
	lb2IEzPfWiC+LC1e5VVcEbCzGfwiHBQbopMr9jlbTUWzZrN6K8UMs1N1YHR8MvI0jMrc9nY4CB7wk
	/zw+6X352EqZCyfzaBuDzsyrUJyaeR02VmmaATTXL4irigYoiJcDR4eUc46QnXDqcOp1eXdxN5/Ij
	TgRInLq2ObyqMlAf29tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm12r-006tpW-2b;
	Fri, 29 Sep 2023 00:07:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm12m-006tlP-0p
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 00:07:46 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4053c6f0db8so130372375e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 17:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695946062; x=1696550862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8HxEWXITaOb/JDj2iD2RcKd3MGklKT/rakg7oiqV24=;
        b=dEjK9hV/Q8vwjoToTTGlbbEFyord7d7TYGdGnMqek27ft/jZwJYH/rjGf90CNK08wW
         9s4Ay7S3mIK7Kp4MdiGnhrG1pmFUwJCF6cTIl0zddG3ywQgtXJ746n/XeLYs1qno8ReR
         DwNoPRcI3At3XhjbyZwBMYlUpWkPWVohD+JACYrGhO2A16sHBbOfK8pVYzIqSeVfqLvL
         PaQ5PX59wqeTalQ4XAqsM63oB0PMeEjWZo1LvTh2s4UIGYtefUlbcIilwEpj8OHPEZd5
         GMeey6l0KbteX/cEupkx22uDv+sknPDpFhJfsJKHuNBxKNs8e6uD/7jnRUCXcu6tZ/dD
         gCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695946062; x=1696550862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8HxEWXITaOb/JDj2iD2RcKd3MGklKT/rakg7oiqV24=;
        b=HNI4lAt5OGtBh5Ai6jzNGPOfqGes6okQcXSyN2/VAy9uB8ii8ExICFOu++X7sFrJ0W
         XqhsrrFgEWj1/VabRFmxGXSF09bxIS8BaVJ3Rw4Q9M3s5WwVjkrWuNi3iwfcYRK0QUEs
         5XlRbzlRzleb0/CsNWAVLGZWYEl4+umHESdxCbpGnfOXXeKs3bYysdtCJw/H2Cah44n6
         nPKfv1f6BWx/zC06KBxnCPkTdRo2tHCjlIhGe2PojSJrgPypCzsW0ZL31boLIkkIy8QN
         SCfKC/iRb9xvA5Y4EJJyUWj8gYbYH/jbM4oNMCwu4MBLdo4IduirU03hRkqgomRLR9e6
         NWPQ==
X-Gm-Message-State: AOJu0Yye1BGX+t0AxqUVhCrgbrs8Tn372cd6b4XxCu2KSd+XenhuhIBL
	psA0ogfGXeRG9UkdAB7in3Q=
X-Google-Smtp-Source: AGHT+IGnYvQpsT1nJIqqtVw96jze0gmURdXGdBK7wCDw7rx9bHLFZ6vcVVEiI0KcBP2Rarl0Ln9O8Q==
X-Received: by 2002:a5d:538f:0:b0:322:4892:17f with SMTP id d15-20020a5d538f000000b003224892017fmr2568104wrv.7.1695946061536;
        Thu, 28 Sep 2023 17:07:41 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:fe98:5e2c:1821:4cb6])
        by smtp.gmail.com with ESMTPSA id y20-20020a7bcd94000000b004030e8ff964sm245667wmj.34.2023.09.28.17.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 17:07:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/5] riscv: dts: renesas: rzfive-smarc: Enable the blocks which were explicitly disabled
Date: Fri, 29 Sep 2023 01:07:02 +0100
Message-Id: <20230929000704.53217-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_170744_295634_BC0D2A34 
X-CRM114-Status: GOOD (  11.06  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Now that noncoherent dma support is added for RZ/Five SoC enable
the IP blocks which were disabled on RZ/Five SMARC. Now with this
patch we get support for the below peripherals:
* DMAC
* SDHI
* USB
* RSPI
* SSI

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/rzfive-smarc-som.dtsi    | 23 --------
 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 56 -------------------
 2 files changed, 79 deletions(-)

diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
index c62debc7ca7e..433ab5c6a626 100644
--- a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
@@ -7,25 +7,8 @@
 
 #include <arm64/renesas/rzg2ul-smarc-som.dtsi>
 
-/ {
-	aliases {
-		/delete-property/ ethernet0;
-		/delete-property/ ethernet1;
-	};
-
-	chosen {
-		bootargs = "ignore_loglevel";
-	};
-};
-
-&dmac {
-	status = "disabled";
-};
-
 #if (!SW_ET0_EN_N)
 &eth0 {
-	status = "disabled";
-
 	phy0: ethernet-phy@7 {
 		/delete-property/ interrupt-parent;
 		/delete-property/ interrupts;
@@ -34,14 +17,8 @@ phy0: ethernet-phy@7 {
 #endif
 
 &eth1 {
-	status = "disabled";
-
 	phy1: ethernet-phy@7 {
 		/delete-property/ interrupt-parent;
 		/delete-property/ interrupts;
 	};
 };
-
-&sdhi0 {
-	status = "disabled";
-};
diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
index c07a487c4e5a..a8573fdfd8b1 100644
--- a/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
@@ -6,59 +6,3 @@
  */
 
 #include <arm64/renesas/rzg2ul-smarc.dtsi>
-
-&ehci0 {
-	status = "disabled";
-};
-
-&ehci1 {
-	status = "disabled";
-};
-
-&hsusb {
-	status = "disabled";
-};
-
-&ohci0 {
-	status = "disabled";
-};
-
-&ohci1 {
-	status = "disabled";
-};
-
-&phyrst {
-	status = "disabled";
-};
-
-&sdhi1 {
-	status = "disabled";
-};
-
-&snd_rzg2l {
-	status = "disabled";
-};
-
-&spi1 {
-	status = "disabled";
-};
-
-&ssi1 {
-	status = "disabled";
-};
-
-&usb0_vbus_otg {
-	status = "disabled";
-};
-
-&usb2_phy0 {
-	status = "disabled";
-};
-
-&usb2_phy1 {
-	status = "disabled";
-};
-
-&vccq_sdhi1 {
-	status = "disabled";
-};
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
