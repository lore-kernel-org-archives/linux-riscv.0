Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B4CD3C921
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Oct 2024 16:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QxydxPlNwbrfTSrByYVu5JJhOyM5ME9Vh9kZ61LGiC4=; b=4IvKBJ95iwDxe2
	6hBNHb9cpztkYIAQwOHNUypgNrmR2Morz0sXY59fpCEVaZJJpDSKnuSSTFER0SOb0CdFEXw+nScmR
	UE08zhQFkFJt5oiylxQ9hpkT8G9F5Zr+koDyrA0jdnHkVhu7NxsY5vyDUN4EtCQw6uL3Tz4h2T3D5
	r7bbvMUMWvTtH7hlHE7EgrBWovYQM8QMbv9CfNgX/oAsFCRtn8RCxgm3kx6+kyjVXWnXORh50rjv/
	ha/qjhoJr7wGl3RFkSM7qypyrmeuJTprMV5yGieRQWoP02/yvwUojO79vWiSdlR+CstMtEWYkVbLb
	R9s7dL0x94KVVIg7T2oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2CIx-00000003bIb-1vSm;
	Sat, 19 Oct 2024 16:27:51 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2CIu-00000003bHa-2CvQ
	for linux-riscv@lists.infradead.org;
	Sat, 19 Oct 2024 16:27:49 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20caea61132so25269725ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 19 Oct 2024 09:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1729355267; x=1729960067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSdP3C8YdR1jmbqfSauKDLLYk+KUcp0Cb8mVBlRfeWA=;
        b=J+wMEjw4doa44yZE/PCTOfxqCTWqWKe5y99P0KDmwthU4E3GPquec0zNVAQNfzraD9
         1dzA0mJy/M5RjMInPDAf2h5FjJporX464ESIP9QCIxw8SWvh+rZ2Nf8ocJyRf/Dz/mnG
         rEnlyjM/bZIhmd23ndZRJCdSj6mEImpXRqRmOuVvuGL3VXXUzdbJYfzGnDL3F2Ej5Pt9
         RARs9OedgHTEyPhEPoMI+Ixfkg7x7m3jL4m/Ll2DYWuAvwzyGay0AbU/4Du4HADmOv8o
         MUsqiexXKfnCI1oecF5eArTa5+VGn5s3oeUp9PPCHO7biHEt7qtH07PozoBUb+5OMqrc
         lA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729355267; x=1729960067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSdP3C8YdR1jmbqfSauKDLLYk+KUcp0Cb8mVBlRfeWA=;
        b=DCWIS7S7L53aEFegn9oHky9JxP72cY9A8xI1UWCtEaSICW8EO/eqe/+cou3zJCRZir
         0+YBeZSgoSyBsasFCKfpaxsMnalxNGAJWTfN0dijyBXzS2Yl2GvQFA2MlM0cbIdACwuW
         67hXHszi/h4+CLl0s9qV0P3gpV+K8uhYCAr462TGCzroQqqaL+ymhPgZ7M16lAG4U1RI
         T6dE4hyuBDPMNn5tlxK+QOoDhK6y4fbHEByVdvHoXbJ5LTdbOjSIbtoMxUzf9U/C12kZ
         YvxMSozD1yyn4+4zWEJjP1iM9Dlp1RqbjPKCjXNVQEHy3gEO7C6WJbOg2iAZu3zE+FFz
         lBtA==
X-Forwarded-Encrypted: i=1; AJvYcCUeqKP8G+5jcKpjvPGaNx+U/ZXi14R5orRoPooTT1KFBeCowTq1cUwvMIRkeWvdr1yesOcPbK5eE6Wbqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMoCyKnC9ZDdxyQzOlC8D3rmWC6Ly0xN+F1U3AfwJPprccaB0k
	EmetJeotx+BQdiz/SdI9dBNzmGFKjup6JHDsxDHKi40yHmFKXaltkDnEROaMZVo=
X-Google-Smtp-Source: AGHT+IFB/lgLKenWFczXSTZ1QqSP6gxMxesJeEKkKsnhxr1xTnsZpi3fsqyNQ8NSXbyKQ9CWcBpXjA==
X-Received: by 2002:a17:902:db04:b0:20c:9062:fb88 with SMTP id d9443c01a7336-20e5a70d863mr80409155ad.1.1729355267302;
        Sat, 19 Oct 2024 09:27:47 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::30df])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a8de4bdsm29567625ad.180.2024.10.19.09.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 09:27:46 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	rafal@milecki.pl
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Alexandru Stan <ams@frame.work>,
	Daniel Schaefer <dhs@frame.work>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	Yuning Liang <yuning.liang@deepcomputing.io>,
	Huiming Qiu <huiming.qiu@deepcomputing.io>,
	Alex Elder <elder@riscstar.com>,
	linux@frame.work,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v4 2/3] dt-bindings: riscv: starfive: add deepcomputing,fml13v01
Date: Sun, 20 Oct 2024 00:26:04 +0800
Message-Id: <20241019162605.308475-3-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241019162605.308475-1-guodong@riscstar.com>
References: <20241019162605.308475-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_092748_595196_935142CB 
X-CRM114-Status: UNSURE (   9.18  )
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

From: Sandie Cao <sandie.cao@deepcomputing.io>

From: Sandie Cao <sandie.cao@deepcomputing.io>

Add "deepcomputing,fml13v01" as a StarFive SoC-based board.

The DeepComputing FML13V01 board incorporates a StarFive JH7110 SoC, and
it's designed for the Framework Laptop 13 Chassis, which has (Framework)
SKU FRANHQ0001.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
[elder@riscstar.com: considerably shortened the description]
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: Added Rob's Ack
    Updated description
    Changed board name from fm7110 to fml13v01
v3: No change
v2: Add deepcomputing,fm7110 into model compatible list

 Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 4d5c857b3cac..7ef85174353d 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -26,6 +26,7 @@ properties:
 
       - items:
           - enum:
+              - deepcomputing,fml13v01
               - milkv,mars
               - pine64,star64
               - starfive,visionfive-2-v1.2a
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
