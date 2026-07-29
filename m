Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7770C54F51
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 01:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5G1BDjIoC4ZkyfLZiEAi7XgZtHGdxZ+PXuCBeSHnqg=; b=u626+qUO3zfW6m
	uERtCsFxWDNKA8/NhUuH9A8k/v2eZJYkwbxNFk0Pj0EehvDtwp33sZYIpbClYs67vZjjsu8zvSDUI
	U3858r+Jg6Iegtj2DUkzHfJPvvHCEEcjelpFlIXwUUk5zE3Jf/AJuezFoiw/Y8HqwRUIAKGkQrain
	A3oMqnmXWZVB9GZFSLvNw/AlEBe4mzOLlra5qrCHLSd/f+k9uNw7kwU2C95UR/H/fho1JvSyJGliK
	h+XXAGakHbvBCrye8hayhUeLkOtH9a9O7oE9+6i8Dp2He+KcsEkh/tCFZNgq0DVFNO/posQod93Bg
	IjR/vwtTV617Mvcoy5kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wot2B-00000006aia-3mOU;
	Wed, 29 Jul 2026 01:24:35 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wot29-00000006ahl-2sho
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 01:24:35 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-381b831d535so508069a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 18:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785288273; x=1785893073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0DReSFbvl/l2HPJej1GugpIyErIl/Q0rTs60WwHT90=;
        b=Z4abeLFw5BK+xOC6T6Ju4TT8nTuOFRCXgewu9H3nShBQyh71SYwgPEkrJevAftoWFj
         Gy/vYLEi8ZJSv3uE2gaszZPR+bJGNTolNJbEHkvb5JFDAcB+R01qfvAHyuPqxVdGEbis
         rjU491JNvmQR6MZ8pb6JfmdtajJx2fc2UPWJdkSH+WSd5LYAhrWbe0Vhm4opwpxsPGtV
         ZrJKGteOy2Axnt/W66teBdWuQR31f00/cdfeYWqvT5m2d3gTHNEsySzjL3L0JjDptmOC
         ZwpcVO1nvSfB3TGsEn/ifHEOP5NOeyPWtIl3sZ3LlJoBeSqN9qU01nFImo0QS3Y63DKE
         xZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785288273; x=1785893073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z0DReSFbvl/l2HPJej1GugpIyErIl/Q0rTs60WwHT90=;
        b=WAsfqKRG2D8dgkYe5YC22Cd8CQ4q+e9dKlTfnaAUq49qCze4eiddJzHA5kN2DU5Hhn
         wNU6Y0b4NJVN/MvrKOMzIxcUkD5qS8HqLsNsrY+C+GCn3kNijcoQUabTzWBywWABqwq6
         ubjcM+Ut5NYRmKbrFrUMgATo67aS4ZuYeLT/H90Na6if2oCNPOZ+RmYjkgc4sSGaInHU
         eayVH2wF0hdDdS6/bKA5dtI72FF5kdCMRzdqpLeMo7jx6Y0wxm4v2t3AcTORitMtV86+
         /Ocyhg7QWRj//+PXsBrxMa3aF7I4wwOq+heXYpN+SmTJHiybfunsCZYncORrEl70rTO5
         y4MQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCD5ZD0PPJ4pw8yOv6nZrFSbKigqdmOQBqoFl3ebpMddTmYytCwvU9ids93xM8KpvpbA1pL8N9P7uJLw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt1Bdb0xgN2Y3E+Auy7PHCyefT+5VxuxtmwXa72bj1XHUm8gUY
	fsOrauTSTa6SN4Q6Fud8zFF2t1iZQrUbKIy4HK9rnxxAnWhzQR7oVpBw
X-Gm-Gg: AR+sD13hh5VE1+/0ySO8WoBN6PzD//4fm+/YmeSle+uJxUIlbpCXGnYxAZ+Yc9zLJeM
	b1LSlqXW/ealHuWkxczcf3NOyEIpPLwYujLZ8OliOjz2Y+RdaPmsIereTBEO7TOhbOFjwoZv03P
	IaPFnINrJYc8yUoWCFD5fW23MIj7NwaBWxnZofTMuz5Gs4/i2aToqWiw473Ape4qD58Wg06WGIR
	dHmzZm94HNVJKKLiBCjCTYToSz4LkLNaXcLOHlKficRvO2kXXBHHhWNcEYzFmQKvYNvxd2PM6kv
	I2E2utsIUH0DjQe/u4g+xDL23F6oQ0BoC2F/5faJH0+MUISDCzRVry5qwssuVp7yFJI3adbL1vS
	GnkaFx4Ymq1MdmbLC0eu7osOMVdN3a9V6mwLpabxfOntsLjdNVDWZQEHhG+JTmUZPSn2Q+7kbQB
	cx7uAWT4oULON07pLDUFvLtZGVe+t7THbha5cgnhGfiaxRHdotPY2AvsWzMvRZmAZgs5vFnA==
X-Received: by 2002:a17:90b:5205:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-38f6a3d599fmr5804183a91.5.1785288272736;
        Tue, 28 Jul 2026 18:24:32 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f292b06sm569244a91.10.2026.07.28.18.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:24:32 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] riscv: dts: spacemit: Make dtschema recognize the etherent PHY correctly on K3 com260 board
Date: Wed, 29 Jul 2026 09:24:17 +0800
Message-ID: <20260729012418.154652-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729012418.154652-1-inochiama@gmail.com>
References: <20260729012418.154652-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_182433_747160_B46A7F6D 
X-CRM114-Status: GOOD (  12.23  )
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

Since the previous commit does not change the phy node name,
the dtschema can not recognize the type of the ethernet phy,
so the following error is produced:

/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@1 (ethernet-phy-id001c.c916): $nodename:0: 'phy@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
        from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@1 (ethernet-phy-id001c.c916): Unevaluated properties are not allowed ('reg', 'reset-assert-us', '
reset-deassert-us', 'reset-gpios' were unexpected)
        from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml

Change the nodename to make the dtschema can recognize the right
PHY type.

Fixes: 9db839d52ccd ("riscv: dts: spacemit: Fix phy id check for the phy on com260 board")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index 2a07cd8f2a56..c7a04a338d08 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -173,7 +173,7 @@ &eth1 {
 	status = "okay";
 
 	mdio {
-		phy1: phy@1 {
+		phy1: ethernet-phy@1 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
 			reset-gpios = <&gpio 1 5 GPIO_ACTIVE_LOW>;
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
