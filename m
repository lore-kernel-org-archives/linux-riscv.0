Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B376FC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 10:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGtEbS6L8dr4DQWspJARU91c4gpSkn86RjdiFG1CYEc=; b=sx+NXCB6I7NOF7
	QxUCsl43P1itOaITEa663DZcj0UEFfilAUq8q3gdMQ0KMRM3vZz7P73NcUHq0rowazz5Od+bv14bh
	9FDkCQ/bvlTYl9v+gNyDiPt2sK+dwIZpd7S64GSZ8r/86otkMRngxNNIkAtg/AFQCttrmMG/oOqId
	OFPVnWqoLvEQfGECwktV5fXmd+a+aY9lxyiQEFZp8vPoh/M1BgDozpDjQlnIV5TJ8cqK2mWUepxlz
	3waNXzryNx2TOKkdu3nrgnHyQ356+jwJuWBDlOorhAylMxYclqFiZDj3Ov34Poa6xfubPggTLaUHK
	uMtX9jNBvaIQoLd/dTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1outfS-00AFz3-KS; Tue, 15 Nov 2022 10:59:50 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1outXk-00AAlA-HM
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 10:51:54 +0000
Received: by mail-wm1-x32e.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so9976410wmg.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 02:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6dU/Bx1osZzG21UnwcwV2rTzixGC6UyL/zax73qVqY=;
        b=coeAHHTiZnzhSuWRrVEWJ5btrTlpR33RRLweMGg/vQN0g7FFzx5w4Ts2g+zVBNDC3l
         YOXoy8WVAvgwZ7tq84pptBuGlqbVerWmHCBmkyHDJyRhAFw+16W/Ll6kLL/4ieikpxuO
         uaJSzkG7owP/UzEXpK2BVzvrzdS1chGBtp84iA9oT0BRUPg9D6fqw7Lm6HMxSvuGITqp
         lBQMCmiex4NpwOoQ9HvyOUIQnMw26qWFxvslmkJckg51KBkmGj+hGCXcBH0A/vA/lk4p
         Xoux833W8LBTaIRevp9rgp67JQHkzl4XDnFhethMRdweJIOUDXCoze4iLyKtDmjxN504
         9P1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6dU/Bx1osZzG21UnwcwV2rTzixGC6UyL/zax73qVqY=;
        b=qhuFtoBP0DyFXd6toZGA6EdUq4YwrHEGCkY2IDzBE7izdz4Bs5rtBC3ysy/LHl5trl
         SHPTD6sTsE+NWsHWORH95pnASRMFJjK6Udtp1cvhjYzj2H0tOPAot3OnENs+pJIJah6b
         hTRvFssrjzZziGoSigGZjHoBEjGvD52rFuigjvRIAPTloW5G6pHZ01u8eC6GuCDkxk19
         veYM7fo6g8nlUwr+9n0/aorXAtPH1GmOTBXXgQyMn0cx19VcT8J2rYjT1BUvpHuMVS+J
         kD5lPkgb6GVqT9Cdn0QJZAB98ja9r3HI/qtJsQH1Sky1yXq7BHJZrKprjP2PT8Tg2+me
         74EQ==
X-Gm-Message-State: ANoB5pm5AkGpQlPq2G7Hyv7B5qasVSopJJJGznhobdHtjiXE1+aOOPmH
	XQG+J4/SZnU6bFr8XAC0PGo=
X-Google-Smtp-Source: AA0mqf5DbSzMeqirjdTo+p/jMZ6gN9pMRHlG+eDHmsb2GaCzMNehiZJUo7UX9/gkkl8dVBvo8+e32A==
X-Received: by 2002:a05:600c:510b:b0:3cf:cfea:904c with SMTP id o11-20020a05600c510b00b003cfcfea904cmr267230wms.33.1668509511094;
        Tue, 15 Nov 2022 02:51:51 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:d94a:6345:c378:e255])
        by smtp.gmail.com with ESMTPSA id az9-20020adfe189000000b002367ad808a9sm12210528wrb.30.2022.11.15.02.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 02:51:50 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] riscv: dts: renesas: rzfive-smarc: Enable CANFD/I2C
Date: Tue, 15 Nov 2022 10:51:35 +0000
Message-Id: <20221115105135.1180490-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_025152_679289_DDAC7F1D 
X-CRM114-Status: UNSURE (   8.65  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable CANFD and I2C on RZ/Five SMARC EVK.

Note, these blocks are enabled in RZ/G2UL SMARC EVK DTSI [0] hence
deleting these disabled nodes from RZ/Five SMARC EVK DTSI enables them
here too as we include [0] in RZ/Five SMARC EVK DTSI.

[0] arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 27 -------------------
 1 file changed, 27 deletions(-)

diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
index e64f0e5f8e30..c07a487c4e5a 100644
--- a/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
@@ -7,25 +7,6 @@
 
 #include <arm64/renesas/rzg2ul-smarc.dtsi>
 
-/ {
-	aliases {
-		/delete-property/ i2c0;
-		/delete-property/ i2c1;
-	};
-};
-
-&canfd {
-	status = "disabled";
-
-	channel0 {
-		status = "disabled";
-	};
-
-	channel1 {
-		status = "disabled";
-	};
-};
-
 &ehci0 {
 	status = "disabled";
 };
@@ -38,14 +19,6 @@ &hsusb {
 	status = "disabled";
 };
 
-&i2c0 {
-	status = "disabled";
-};
-
-&i2c1 {
-	status = "disabled";
-};
-
 &ohci0 {
 	status = "disabled";
 };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
