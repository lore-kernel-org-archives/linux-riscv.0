Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8A7E7E379
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 11:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3xvETkKA0LGj6Cc9pOSJdy8k+H3JS6gu4NlpFafzsgg=; b=Qbk1Mgj4/lP3W6
	uZ14Kb82UJphIbgrs4AWvrWcvHUsyH3C9m8WcVui3IIevBSFlvRSyybtlJDaPDYsW07+M+XzeylpI
	ASl5oPjAgBeHsu68Xij+9mZcsvaZjxfVvqkRRodvbM2R4Jmtr0YfUtUUvP3uekXEaxWr/I88zj9MK
	rSdSlN1rpx98YlqyG8aJHVeM73GNhYKuptrnCQEAbFDqg3m+Nj1pverb7cfkYFaAti3WAxgtjBfrF
	HmyooXpM6P+Ovd8ykZBP3VTFkemM3p/G1rK4uGpOfrDWUrtiSXIvVztoNm6ZZz0rBXmQ3wgiW9y1S
	sH4n5O7GL4vaqtMuCkIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cpx-00000001y0p-06tc;
	Fri, 03 Apr 2026 11:37:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cpv-00000001y0V-377A
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 Apr 2026 11:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Up0rOTXqSkB7yplKxiVR+mHCT5zajSVPdbYhj+cSxrI=; b=TNGO70IGEA5Ftd+WyClvW5xS56
	v9Dv4PSZIy7aeQT8bw5AKsPkZBO2UurJVMbWVfcjGDMG5L8sC6IMZAK7x8w4Kq50eZa9LrXv1nsq3
	r203LviJfsD1SRcpqa8xsXtXC6vO23wOzS2AJ/9QVq6mDGbJcbrtrY9Sxu7Px4z4UXnHinKPDOS10
	EAEEnfTH+DT40xJv9UME82VJepb901yxOd1M4s7PpkY8VgOs8N99wgqoaXs+79qbG1PwbFjZtEPpX
	II8SAfOyuoLB/ad9uIBh9jAxxsAS72rYgkF70VdnROpCa30xtDTAvsM8bloT2RyRi3F2X5SQk6r9r
	WyiAt9+w==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cps-000000043bX-0vLu
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 11:37:14 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-35da8d037a5so750816a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 04:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775216230; x=1775821030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Up0rOTXqSkB7yplKxiVR+mHCT5zajSVPdbYhj+cSxrI=;
        b=U7ouFhjpvX1uGrfsVY7m9lTQw6fBFI70+V9x1Lwb+ewXGGHkJr8HUaUC2YjYRTD4bl
         qfcDbYB9+tIPgQTF9PCG/zZNj09eDGvirywuzDZsozVcWpKC8R0z1oYrEofpn6QpburQ
         RS/wxy9415PFnSIPyLh0CsL20juSRYcmmLvEKIEGwWyOrVak1G6rGSSCrwGTjSmp+aWG
         B6r3Mmj0oci3ASj4XgKRUke2Ap5CaSQE1azliIUC0dxZiokAaJafJepC+681FqdHrktm
         UdFfI5zhJUD7M7ss+1QC0GaTvTpVxhoAcQ0qurA69A7Ykiol9OdoBgwPWb63HcobfxH8
         v1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775216230; x=1775821030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Up0rOTXqSkB7yplKxiVR+mHCT5zajSVPdbYhj+cSxrI=;
        b=UbLGOt/sHbBm7cskT70cle19a1aVOzNJ92CNDV1EypuVA5+3sfbLSL55zfcQfnfhL+
         31Qtd443p3ATdL/cxigKk4spB8ildAtjBJVELIvYCmLnUX2HKQOfhYXfIZnPvvPAAPx1
         0VWcqzPWExiA5AeGFxoIBBybXFKJGIGzKRLuXy+OoQg/+R11yaoLwSaxtqp7QZZSKQ6Z
         GKkonmnJpHm95VQ5jl+k9rvB3QbZBc5CyPDoFjC52h3cSD8oYVvbxZfP1f2EeFBAWAZR
         45Pe43m42p448TFk5yLnplGo5WPY3LV2B7mhV9LtUxTkb+RB87C7qj5Cu3G98LM8Yp6P
         8grw==
X-Forwarded-Encrypted: i=1; AJvYcCU7wQ2uEXwYwU2vWbUhqxJxZmYwgODIC1gjpWR5lJPtpC0p3bVr82HwOSxZLiHs8yu9mVk2IPVKQ1kr7g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzna4OikYSLYasy6A3UVv3gj3sJbhQGL1V/jpmmtOiNoiHOnSOs
	MCuU4A472frECreIWBTtt5nzS1GWQW59G2wWUhirmOhYJo9fvSac1Bgp
X-Gm-Gg: AeBDietgIN6L4USPIK4rJCmXBtK4Sqe9RIpp0Tm67JSGUh1sYudTd/y1Qccc+7QR7G6
	zrA5dbvT17D253ITIEsywykFMqeIQYC13rrYg0Hy+s0qWULgvphRoMNBmhu6I1NljDiWqZirqAl
	XRAxm92dYPrxvL3C476wX5QiKej5zQdO0aESU5JjSGzmiAH1lPUxuzvIUPjlJTvZQ7LQF7HR6ls
	PHx368zgx94cXUBu/zwePaI2Rv7qSYzYX3eKnoEGPS3L3LFJ4CsQOpfZWoKd29OIDUcNzOV7Lpt
	Zj8o9X//gsPbc5IQGQPQk+0J39JMicImXcVbF9RF47uCykavWbzL3uLnyN8Ni8TTH4OK52SuQ6j
	ecQBaRYFvWFojJYoIxTML0Knz9oaQAWcl1pJ+Q+HrkqDVYiNP+2MAQIvPV0eQ3TxD66gBrBBuRf
	Mwuaice9iJhTyey9hF6OA=
X-Received: by 2002:a17:90b:2251:b0:35d:b00a:3c54 with SMTP id 98e67ed59e1d1-35de69acf35mr2108980a91.22.1775216229584;
        Fri, 03 Apr 2026 04:37:09 -0700 (PDT)
Received: from archriscv ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6860cfbsm957599a91.6.2026.04.03.04.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:37:08 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Ze Huang <huang.ze@linux.dev>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH linux-next v1 2/3] riscv: dts: spacemit: k1-bananapi-f3: Update USB regulator on onboard usb and lable
Date: Wed, 25 Mar 2026 13:46:09 +0530
Message-ID: <20260325081700.1502-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325081700.1502-1-linux.amoon@gmail.com>
References: <20260325081700.1502-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_123712_594794_4BD2C753 
X-CRM114-Status: GOOD (  12.43  )
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

Update the USB regulator labels to align with the board schematics and
power hierarchy. This change renames the regulator to reg_5v_vbus and
its name to 5V_VBUS. Additionally, it fixes the vdd-supply references
for both the USB 2.0 and 3.0 hub nodes to ensure they correctly point
to the 5V_VBUS input source as per the board schematics.

Cc: Han Gao <gaohan@iscas.ac.cn>
Cc: Ze Huang <huang.ze@linux.dev>
Cc: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 9727ecdd9f6b..c35f4763c800 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -70,9 +70,9 @@ reg_vcc_4v: regulator-vcc-4v {
 		vin-supply = <&reg_dc_in>;
 	};
 
-	regulator-usb3-vbus-5v {
+	reg_5v_vbus: regulator-usb3-vbus-5v {
 		compatible = "regulator-fixed";
-		regulator-name = "USB30_VBUS";
+		regulator-name = "5V_VBUS";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
@@ -366,7 +366,7 @@ &usb_dwc3 {
 	hub_2_0: hub@1 {
 		compatible = "usb2109,2817";
 		reg = <0x1>;
-		vdd-supply = <&usb3_hub_5v>;
+		vdd-supply = <&reg_5v_vbus>;
 		peer-hub = <&hub_3_0>;
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
@@ -374,7 +374,7 @@ hub_2_0: hub@1 {
 	hub_3_0: hub@2 {
 		compatible = "usb2109,817";
 		reg = <0x2>;
-		vdd-supply = <&usb3_hub_5v>;
+		vdd-supply = <&reg_5v_vbus>;
 		peer-hub = <&hub_2_0>;
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
