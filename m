Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A68E9536D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 10:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gjmLfMIyS58m7bY+aXyU1Ghx2N+ue15O5GuN1WXmbVI=; b=vYeMzCyiW6S7rF
	+KyRL6EPnJLyVlh4NgM5K63tNE7BxDHh1Cv+LR3EYttQ4Nw9Vr3hkNMbjl0+hKzyj7/lSu8u3Hkdl
	kyfexmYMSGWb5d/7h+HFU4F9R4rBNVukwkr7SeLNDCEsFZZ9O74OzD+0R4VbYZUwCJ4HiZUhYlaUn
	Y/9HYxwP4yFXTEKPG77py+2JZLlxqgWmuRk/I6K9HFGUtDQnm1fZFymsoOINNvNqsJeCE0r63v+4P
	Gs0PeNt91HGNF5pp0eOHFQ5grXx8sfjRZ55cGC42gk9qjAVTAK1hrOPrfTzK8BvbtORwpnfO4JaP2
	wISTNiDJfdvI9AgUBeuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZwJ-00000008H7F-1KRz;
	Wed, 04 Feb 2026 10:16:51 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZwF-00000008H6r-0A4x
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 10:16:49 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D72E540378
	for <linux-riscv@lists.infradead.org>; Wed,  4 Feb 2026 10:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1770200202;
	bh=rhq5MsBYR4UI9R+em7ufyvAl7BxW0y3xSf9zAXEJwxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=e0fIHaCqgCn9xlXR93Nwq7gRyfXf7v/XkpyiieZUfbVb42K7gHBGLFijrqWELK4y1
	 RpjQ5unXB/003cY/rfNTys+73/wRWttz8gikixSHMLdX64pMsbvpby9u0TX1A+az2a
	 RQiTLNAXpldg0g8izct/UQE7ipPkQDKUWsPTYvYW/G/bFdJ9gL5bcmLm+TWOVKMmW5
	 icwDR33pjRoVO/JqlIh7uSlQUWsUMTjdRnBhMWFB/xOrMDcEQwBegU2/rIBbaBbXSY
	 for35bKHhIsZwQTxxi4GYjsfZd98qjp7Sr1VdqJxEFVLf74jylRAlQXXBJ2SXZO/3C
	 1afW/90/4LoMBCMmx5s1tnSTHxXHnZafhEH7s3a1GcpMR0sLcngY+nmrSMI017gU1F
	 hhaJh+iXK851/63uhoEN/kUAd4NkpO1kE+urek80EpE0slLYphkir5D15EUn1XbH/t
	 dJuO4XVVfVQx+jLR/AlJvSGumflBJLEBAoXwZXkvDr0JVm+VwSBs6xCd10/3KXeyxg
	 ChuIx2107uCgmkck2YEAAN0x2VLlKXlbkNL8ctJA45lgh6ueeXQmVC9woYYXJuyAaG
	 jggddYUwyT/AeG8RM1umnEbCIlhbd2tv0ScteieSFK8nIzQ+Wd1Nv78+8YhieHKh/c
	 aJ8BFfRObvyAHZdgpuVFuUuk=
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-480717a8ef9so6803415e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 02:16:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770200202; x=1770805002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhq5MsBYR4UI9R+em7ufyvAl7BxW0y3xSf9zAXEJwxs=;
        b=Qn3OV1tRpdlFvVNdQl0hYnQE1/3h1BqOTtsWHwxnPR+hFKaELHixLtvWhSk79TeDFO
         aC5+Nhm2p14wToGFJBH3Z9A0YiWcdoSWHw10Hp/0HSMoyToApepNRkwEh+gxcSG+/o0T
         VEU8oKh0EejX9K0SPG8MTt7jvVeNB00rXhJKuWggkwm3F9NZmXFJ2c57ttZfUc/GzZry
         KwYgpxmPMvb9CZtByWPt6cEqLWWZFDIfY/+W9ETSpynTFqePAw0p8OT2H7DakRJTb/F7
         QFNTNCn4CdyfijCT7Qx+KplEy6JkCt0PU/Kv7FmmcW9THryV2wENOoXzV69o7Vm+pxco
         +1Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUK3Jef2L+j4bDV4DkcNZ8Rz6ABdJkAIfBeAwKFBWDBdECmpnyCadXj+2EYupxY9O20jYVG5i7M+uVzlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiSKwgYPbgWIlnXtnbr/eVYGZegVGcgsfOl2iKBw+fK7c5uNEG
	8ru4SqOy1HYt+cTksotKfDJ/0F1/Wtq3rAozD5dDL85yr0wwVCTARRBIPXVft9TfXMCi4/2WD7X
	plL2xtV+aycNuepGXAgaIVa5I6BoBb+iMPxKjiDDAoVma0XMe9+MnhYOeHVcokVLVUKUeGfZxmO
	Fe/2t0s4oLDw==
X-Gm-Gg: AZuq6aIp5CndPvz3nN0wlz9+7vJ7wcJSIvAp9zOx8pNsDeHstxwlJl/GeflpI70au6H
	d3+VbJ+4ovBvfuKdAq+1N/JT1/ke9Pmb05u6FMssZme7MZatZmcacy3VzrWcTWfNepjz5oPgb0b
	W77kCGu65gTv9NG2wXCRuYtqqRCIsS+iFPySqNJJ7lY7kFYJthFnvpzCcgNrQLv4m+MYIqNYeVN
	jE84qw3zSmT+lYrYzrDXPscaLhsp+1pE/a5eJygGcAUgd4rwxwjaFgt5WDa0CO+RbvKt0Oh6WlB
	dtze+jK1MfMvn3LDUwFYVvDgoqnhp/qAQVApfAXO60e/JP7PdpGLai54PiMeFC0TOp+WHoBYjg8
	43MbvCLSF3vCElqz9d4kN7bibBTnkGXuSmgBErexdXcUe3y0h0ilcR3u77+7wxlk+Cc1LK0P5ga
	po
X-Received: by 2002:a05:600c:4f4c:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-4830eb6712emr32297825e9.17.1770200202227;
        Wed, 04 Feb 2026 02:16:42 -0800 (PST)
X-Received: by 2002:a05:600c:4f4c:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-4830eb6712emr32297395e9.17.1770200201768;
        Wed, 04 Feb 2026 02:16:41 -0800 (PST)
Received: from workstation5 (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48310880598sm30132295e9.0.2026.02.04.02.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 02:16:41 -0800 (PST)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] riscv: dts: starfive: Milk-V Mars CM Lite broken-cd
Date: Wed,  4 Feb 2026 11:16:02 +0100
Message-ID: <20260204101602.30184-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_021647_467871_DB9C194B 
X-CRM114-Status: GOOD (  12.17  )
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

The card detect GPIO depends on support by the base board.

Detecting an SD-card did not work for me with a Milk-V Mars CM Lite
mounted on an Waveshare CM4-IO-BASE-A board.

According to [1] SD_SDIO0_CD_GPIO41 is connected to pin 76 reserved.
The Raspberry Pi Compute Module 4 IO Board documentation marks that pin as
reserved. The Raspberry Pi Compute Module 5 IO Board documentation
marks the pin as VBAT.

Remove the cd-gpios definition and add broken-cd.

[1]  https://github.com/milkv-mars/mars-files/blob/main/Mars-CM_Hardware_Schematices/Milk-V_Mars-CM_SCH_V1.0-2023-0905_Lite.pdf

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
index 63aa94d65ab55..566b0bdc2800d 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
@@ -13,7 +13,7 @@ / {
 
 &mmc0 {
 	bus-width = <4>;
-	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
+	broken-cd;
 	disable-wp;
 };
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
