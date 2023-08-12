Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E5AC04A6A
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Aug 2023 00:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sRxfef8tnTEoroEw+21grYu/7FeYETYEprJlmbJmDU0=; b=2sRl30knlml5Ts
	maZ7zHocKvSf4d2Tz2C7HxH+h2jME/xvwtxEXPC7aQdloFMkwc5N3i2Vijfp1aIw8SoFpN9wFUyQP
	Ovn6/G20HbHNWauhV0TwG56PcUlIa76abCH9fHVL/1t9IsuHU1YV09VBpmEMpjs/tfGp087rrJMpY
	lTvYlw14+8u8fmNS9WdMCYoX75XrYAkNbZ05fVCQVI+3EQHXzOoX3jlDjKBpYHeVNGg/r5L+m4kqR
	MOArUyjoQEds1BP6m4BuqsAfBLZTgshQ0ndeRyIQENOuDdb+nfGq1tA6WayESIDkyUkfOdecS/MYQ
	3DGCL+QbK7nJ+23P8piQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUcnE-00CB7o-0n;
	Sat, 12 Aug 2023 00:47:48 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUcn9-00CB3n-2C
	for linux-riscv@lists.infradead.org;
	Sat, 12 Aug 2023 00:47:45 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bbc06f830aso18236635ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 17:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691801257; x=1692406057;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DeijLer+iQ1yTNsBhmCp+pc3Tg+drpD8NrA9bs7LzOI=;
        b=jhboQ5nYSX8Si1mah8gNOHs4iZEr/J2Ef5i1NA9qVP1EXw5Cmuuxw0Hyjl2HrAOZv7
         P/lq57Tg9pwtfi77ePWmFeE0AybM1YyDSNQu3Gydh9QJ12dJR1Cw5Xu6kd4w0wgCRosg
         +XM7wWskqnOq0kP3gWCHfs9aWft7N02XeV30LZskPZlXZpAdAwi2gWdiwzMbnlebVYdV
         vaRZVezKTjmkLV1392svkRdrzoLVdQ1T1wVvK6bTyYxv2zQwf9Wun6DxejsyrtsruJ6k
         3LZAdgGymB9OLzNEkHSL6JsLmoCvIZQoOn5hR6l8O68msyIuCsXK6XPaGzgQMsC3mrdO
         gKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691801257; x=1692406057;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DeijLer+iQ1yTNsBhmCp+pc3Tg+drpD8NrA9bs7LzOI=;
        b=IprhlIXJJe367U7494qyNsi9x5RbGhZ4rknja8LDHZcpWUPFtXmVmlKbnrdkNwbVKz
         qqf7Kjy6ZxcCJFAd7l3Vah/2ykLtWXShnF3vsNQTb1+B+SkDCfTNa88V4lQ0MZBUMqBq
         3MtkjDjwnAIfLbevxNI9hOPX5ssp4nytsb4gLc3hbUMPLjlleGWMoHvYRH8RbOX40VyZ
         vxgoschXErq65XW/jUna/CyuO/hWWo5D8ePJG5dQlvwobVpOPvXWMYxM5WsW09GBvplC
         3PM4oeWMLpYIh7KUBYV7paOTi5TryY9Pdtnzso6qKvRh1nJBozM46PiExZbxPPPGD8GZ
         p5bA==
X-Gm-Message-State: AOJu0Yx4oGvJT/7DQzg4yfOZ89Bog3kvxgRZTSgOgRszaaghuD4J29Ye
	791NS6ZmFDUFWTIzAxuBR1W5ig==
X-Google-Smtp-Source: AGHT+IFUqsBSX3sAM2vTW05lL8kww3fgqy4Gp8gDRdpUORS4ySxv2rMKaBp0M16jTXGsFzuevyF1pA==
X-Received: by 2002:a17:903:1209:b0:1b5:5162:53bd with SMTP id l9-20020a170903120900b001b5516253bdmr4132072plh.33.1691801257518;
        Fri, 11 Aug 2023 17:47:37 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:5b85:b986:e090:9abc])
        by smtp.gmail.com with ESMTPSA id c11-20020a170902724b00b001b246dcffb7sm4559247pll.300.2023.08.11.17.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 17:47:37 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v3 0/2] riscv: Add BeagleV Ahead board support
Date: Fri, 11 Aug 2023 17:47:15 -0700
Message-Id: <20230811-ahead-dt-v3-v1-0-aef2294bed86@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJPW1mQC/x3MTQqAIBBA4avIrBvwh0i6SrQQHXM2FhoSSHdPW
 n6L9zpUKkwVVtGhUOPKZx5QkwCfXD4IOQyDltpIqxS6RC5guLEZVGEhO0dPWkYYxVUo8vPfNmg
 G9vf9ABCWKT9hAAAA
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, 
 Jason Kridner <jkridner@beagleboard.org>, 
 Drew Fustini <dfustini@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691801256; l=2003;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=KXruUC4m0GJJ2tG/yeNsrWAXuiSYwLQVyd8fgxtQfP4=;
 b=JylDP9oUkuZEpW4fXLJGGvGlX7V77+Vh17FFIFdl+LPteBDAnxNYnVhiy15cO1vRmecHLAo1S
 Itw7hFCfVvwDJl/LzGHus7sgql5xkb81no1b7x/uUd/9fTD6m47/1iZ
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_174743_719986_04BC7BA7 
X-CRM114-Status: GOOD (  13.93  )
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

The BeagleV Ahead single board computer [1] features the T-Head TH1520
SoC. Similar to the Lichee Pi 4A series from Jisheng [2], this adds a
minimal device tree file to support booting to a basic shell [3].

Changes since v2:
- Drop the MAINTAINERS patch as it is not important and I want this
  patch series to make it into the next PR
- Add Conor's R-b

Changes since v1:
- Add dual license to dts file as Conor noted this is typical
- Reorder new entry in thead.yaml to maintain alphabetical order per
  suggestion by Krzysztof
- Add A-b's and R-b's from v1

[1] https://beagleboard.org/beaglev-ahead
[2] https://lore.kernel.org/linux-riscv/20230617161529.2092-1-jszhang@kernel.org/
[3] https://gist.github.com/pdp7/91b98f5b8a632802e669d8c359f4f498

To: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>
To: Fu Wei <wefu@redhat.com>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Robert Nelson <robertcnelson@beagleboard.org>
Cc: Jason Kridner <jkridner@beagleboard.org>

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
Drew Fustini (2):
      dt-bindings: riscv: Add BeagleV Ahead board compatibles
      riscv: dts: thead: add BeagleV Ahead board device tree

 Documentation/devicetree/bindings/riscv/thead.yaml |  4 ++
 arch/riscv/boot/dts/thead/Makefile                 |  2 +-
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 61 ++++++++++++++++++++++
 3 files changed, 66 insertions(+), 1 deletion(-)
---
base-commit: 52a93d39b17dc7eb98b6aa3edb93943248e03b2f
change-id: 20230811-ahead-dt-v3-1d7e85fce20f

Best regards,
-- 
Drew Fustini <dfustini@baylibre.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
